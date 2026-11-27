package com.cloudextensions.probes

import android.content.Context
import com.lagradost.cloudstream3.APIHolder
import com.lagradost.cloudstream3.MainAPI
import com.lagradost.cloudstream3.MainPageRequest
import com.lagradost.cloudstream3.MovieLoadResponse
import com.lagradost.cloudstream3.SearchResponse
import com.lagradost.cloudstream3.app
import com.lagradost.cloudstream3.plugins.Plugin
import com.lagradost.cloudstream3.utils.ExtractorLink
import java.io.IOException
import java.io.InterruptedIOException
import java.util.Collections
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.TimeoutCancellationException
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeout
import okhttp3.Interceptor
import okhttp3.Request
import org.json.JSONObject

private class CheckFailure(val status: String, val http: Int? = null) : IOException(status)
private val httpCode = Regex("""(?<!\d)([45]\d{2})(?!\d)""")
private val unsuitableSample = Regex(
    """(?iu)未成年|中学生|中學生|高校生|児童|兒童|小学生|小學生|幼女|少女|underage|preteen|middle school|high school|(?:\b1[0-7]|\b[1-9])\s*(?:歳|歲|岁|years? old|y\s*/?\s*o\b)""",
)

private fun failure(error: Throwable): Pair<String, Int?> {
    if (error is CheckFailure) return error.status to error.http
    if (error is TimeoutCancellationException) return "timeout" to null
    val causes = generateSequence(error) { it.cause?.takeIf { cause -> cause !== it } }.take(5).toList()
    val message = causes.joinToString(" ") { it.message.orEmpty() }.lowercase()
    val code = httpCode.find(message)?.value?.toInt()
    return when {
        message.contains("webview") || causes.any { it is NotImplementedError } -> "requires_android" to code
        code == 401 || code == 403 || message.contains("cloudflare") || message.contains("ограничил доступ") ||
            message.contains("нужен вход") -> "access_restricted" to code
        code == 404 || code == 410 || message.contains("файл удалён") -> "missing" to code
        code == 429 -> "rate_limited" to code
        code != null && code >= 500 -> "site_unavailable" to code
        message.contains("приватн") || message.contains("private") -> "private" to code
        message.contains("фильтр") || message.contains("hidden by category filter") -> "filtered" to code
        message.contains("не содержит видеоплеера") -> "no_player" to code
        causes.any { it is InterruptedIOException } ||
            message.contains("вовремя") || message.contains("timeout") || message.contains("тайм") -> "timeout" to code
        causes.any { it is LinkageError || it is ReflectiveOperationException } -> "probe_error" to code
        causes.any { it is IOException } -> "network_or_source_error" to code
        else -> "source_error" to code
    }
}

private fun report(stage: String, status: String, started: Long = System.nanoTime(), fields: Map<String, Any?> = emptyMap(), sample: Int? = null) {
    val row = JSONObject(fields).put("stage", stage).put("status", status)
        .put("ms", TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started))
    if (sample != null) row.put("sample", sample)
    println("SITE_HEALTH " + row.toString())
}

private suspend fun <T> stage(
    name: String,
    milliseconds: Long,
    fields: (T) -> Map<String, Any?> = { emptyMap() },
    sample: Int? = null,
    check: suspend () -> T,
): T? {
    val started = System.nanoTime()
    return try {
        val result = withTimeout(milliseconds) { check() }
        report(name, "ok", started, fields(result), sample)
        result
    } catch (e: Throwable) {
        if (e is CancellationException && e !is TimeoutCancellationException) throw e
        val (status, code) = failure(e)
        report(name, status, started, mapOf("http" to code, "errorType" to e.javaClass.simpleName), sample)
        null
    }
}

private fun bytes(
    url: String, headers: Map<String, String>, media: Boolean, interceptor: Interceptor? = null,
): Int {
    val request = Request.Builder().url(url)
    headers.forEach { (key, value) -> request.header(key, value) }
    request.header("Range", "bytes=0-63")
    val client = app.baseClient.newBuilder().callTimeout(5, TimeUnit.SECONDS)
    if (interceptor != null) client.addInterceptor(interceptor)
    return client.build().newCall(request.build()).execute().use { response ->
        if (!response.isSuccessful) {
            val status = when (response.code) {
                401, 403 -> "access_restricted"
                404, 410 -> "missing"
                429 -> "rate_limited"
                in 500..599 -> "site_unavailable"
                else -> "http_error"
            }
            throw CheckFailure(status, response.code)
        }
        val body = response.body?.source() ?: throw CheckFailure("empty", response.code)
        body.request(64)
        val prefix = body.buffer.readByteString(minOf(64L, body.buffer.size))
        val hex = prefix.hex()
        val text = prefix.utf8().trimStart()
        val valid = if (media) {
            text.startsWith("#EXTM3U") || text.startsWith("<MPD") || "<MPD " in text ||
                hex.drop(8).startsWith("66747970") || hex.startsWith("1a45dfa3") ||
                hex.startsWith("464c56") || hex.startsWith("000001ba")
        } else {
            hex.startsWith("ffd8ff") || hex.startsWith("89504e470d0a1a0a") || text.startsWith("GIF8") ||
                (text.startsWith("RIFF") && text.drop(8).startsWith("WEBP")) || hex.drop(8).startsWith("66747970617669")
        }
        if (!valid) throw CheckFailure("unexpected_payload", response.code)
        response.code
    }
}

private fun cardFields(cards: List<SearchResponse>) = mapOf("count" to cards.size, "covers" to cards.count { !it.posterUrl.isNullOrBlank() })

private suspend fun smokeSearch(api: MainAPI, query: String) {
    val first = stage("search", 23_000, { cardFields(it.items) + ("hasNext" to it.hasNext) }) {
        api.search(query, 1)?.takeIf { it.items.isNotEmpty() } ?: throw CheckFailure("empty")
    }
    if (first != null) {
        stage("repeat_search", 23_000, { cardFields(it.items) }) {
            api.search(query, 1)?.takeIf { it.items.isNotEmpty() } ?: throw CheckFailure("empty")
        }
        first.items.take(3).mapIndexed { index, card ->
            index to card
        }.let { leading ->
            coroutineScope {
                leading.map { (index, card) ->
                    async(Dispatchers.IO) {
                        stage("listing_cover", 6000, sample = index + 1) {
                            val image = card.posterUrl?.takeIf(String::isNotBlank) ?: throw CheckFailure("missing")
                            if (image.startsWith("file:")) {
                                if (!java.io.File(java.net.URI(image)).isFile) throw CheckFailure("missing")
                            } else bytes(image, card.posterHeaders.orEmpty(), media = false)
                        }
                    }
                }.awaitAll()
            }
        }
        if (first.hasNext) stage("next_page", 23_000, { cardFields(it) }) {
            val seen = first.items.mapTo(hashSetOf()) { it.url }
            val next = api.search(query, 2)?.items.orEmpty()
            if (next.isEmpty()) throw CheckFailure("empty")
            if (next.any { it.url in seen }) throw CheckFailure("repeated_page")
            next
        }
    }
    stage("empty_search", 23_000) {
        val result = api.search("qxzv947pkn", 1)
        if (!result?.items.isNullOrEmpty() || result?.hasNext == true) throw CheckFailure("unexpected_results")
    }
}

fun main(args: Array<String>) {
    runBlocking {
        val (entry, query) = args
        val sampleCount = args.getOrNull(2)?.toInt() ?: 2
        val api = stage("registration", 5000) {
            val plugin = Class.forName(entry).getDeclaredConstructor().newInstance() as Plugin
            plugin.load(Context())
            APIHolder.allProviders.single()
        } ?: return@runBlocking
        if (args.getOrNull(3) == "search-only") {
            smokeSearch(api, query)
            return@runBlocking
        }
        val firstSection = api.mainPage.firstOrNull()
        val home = if (firstSection == null) {
            report("home", "not_applicable")
            null
        } else stage("home", 23_000, { cardFields(it) }) {
            val request = MainPageRequest(firstSection.name, firstSection.data, api.sequentialMainPage)
            api.getMainPage(1, request)?.items.orEmpty().flatMap { it.list }
                .takeIf { it.isNotEmpty() } ?: throw CheckFailure("empty")
        }
        val search = stage("search", 23_000, { cardFields(it.items) + ("hasNext" to it.hasNext) }) {
            api.search(query, 1)?.takeIf { it.items.isNotEmpty() } ?: throw CheckFailure("empty")
        }
        if (search?.hasNext == true) {
            stage("next_page", 23_000, { cardFields(it) }) {
                val next = api.search(query, 2)?.items.orEmpty()
                val earlier = search.items.map { it.url }.toSet()
                if (next.isEmpty()) throw CheckFailure("empty")
                if (next.none { it.url !in earlier }) throw CheckFailure("repeated_page")
                next
            }
        } else report("next_page", "not_applicable")
        val searchCards = search?.items.orEmpty()
        val homeCards = home.orEmpty()
        val samples = (0 until maxOf(searchCards.size, homeCards.size)).asSequence()
            .flatMap { sequenceOf(searchCards.getOrNull(it), homeCards.getOrNull(it)).filterNotNull() }
            .filterNot { unsuitableSample.containsMatchIn(it.name) }
            .distinctBy { it.url }
            .take(sampleCount)
            .toList()
        if (samples.isEmpty()) {
            report("listing_cover", "no_sample")
            report("detail", "no_sample")
            return@runBlocking
        }
        coroutineScope {
            for ((batchIndex, batch) in samples.chunked(2).withIndex()) {
                batch.mapIndexed { index, sample ->
                    async(Dispatchers.IO) { inspectSample(api, sample, batchIndex * 2 + index + 1) }
                }.awaitAll()
            }
        }
    }
    kotlin.system.exitProcess(0)
}

private suspend fun inspectSample(api: MainAPI, sample: SearchResponse, number: Int) {
    stage("listing_cover", 6000, { mapOf("http" to it) }, sample = number) {
        val url = sample.posterUrl ?: throw CheckFailure("missing")
        bytes(url, sample.posterHeaders.orEmpty(), media = false)
    }
    val detail = stage("detail", 23_000, sample = number) {
        api.load(sample.url)?.takeIf { it.name.isNotBlank() } ?: throw CheckFailure("empty")
    } ?: return
    val tags = detail.tags.orEmpty()
    report("tags", if (tags.isEmpty()) "missing" else "ok", fields = mapOf("count" to tags.size), sample = number)
    report("recommendations", if (detail.recommendations.isNullOrEmpty()) "missing" else "ok",
        fields = mapOf("count" to detail.recommendations.orEmpty().size), sample = number)
    stage("detail_cover", 6000, { mapOf("http" to it) }, sample = number) {
        val url = detail.posterUrl ?: throw CheckFailure("missing")
        bytes(url, (detail as? MovieLoadResponse)?.posterHeaders.orEmpty(), media = false)
    }
    if (unsuitableSample.containsMatchIn((listOf(detail.name, detail.plot.orEmpty()) + tags).joinToString(" "))) {
        report("video", "no_sample", sample = number)
        return
    }
    stage("video", 46_000, { mapOf("http" to it.first, "links" to it.second) }, sample = number) {
        val links = Collections.synchronizedList(mutableListOf<ExtractorLink>())
        api.loadLinks((detail as? MovieLoadResponse)?.dataUrl ?: sample.url, false, {}, links::add)
        if (links.isEmpty()) throw CheckFailure("no_stream")
        val fullLinks = links.filterNot { it.name.contains("preview", true) || it.name.contains("превью", true) }
        if (fullLinks.isEmpty()) throw CheckFailure("preview_only")
        var last: IOException? = null
        for (link in fullLinks.distinctBy { it.url }.take(3)) {
            try {
                val status = bytes(link.url, mapOf("Referer" to link.referer) + link.headers, media = true, api.getVideoInterceptor(link))
                return@stage status to fullLinks.size
            } catch (e: IOException) {
                last = e
            }
        }
        throw last ?: CheckFailure("no_stream")
    }
}
