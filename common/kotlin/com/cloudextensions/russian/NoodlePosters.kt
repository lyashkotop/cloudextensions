package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import kotlinx.coroutines.suspendCancellableCoroutine
import okhttp3.Call
import okhttp3.Callback
import okhttp3.Request
import okhttp3.Response
import org.json.JSONArray
import org.json.JSONObject
import org.jsoup.nodes.Document
import java.io.IOException
import java.util.Collections
import java.util.concurrent.TimeUnit
import kotlin.coroutines.resume

interface NoodlePosterSource {
    suspend fun posterPage(url: String): Document

    fun rememberNoodlePosters(url: String, page: Document) {
        NoodlePosters.remember(url, page)
    }
}

/** Both language variants use the same catalogue and detail image fields. */
internal object NoodlePosters {
    private val alternatives = Collections.synchronizedMap(BoundedMap<String, Pair<Long, List<String>>>(256))
    private data class ImageCheck(val url: String, val headers: Map<String, String>)
    private val working = Collections.synchronizedMap(BoundedMap<ImageCheck, Long>(512))

    fun remember(url: String, page: Document): List<String> {
        val thumbnail = Metadata.ownVideo(page)?.opt("thumbnailUrl")
        val structured = if (thumbnail is JSONArray) {
            (0 until thumbnail.length()).map { thumbnail.opt(it) }
        } else listOf(thumbnail)
        val images = structured.mapNotNull {
            when (it) {
                is String -> it
                is JSONObject -> it.optString("url").ifBlank { it.optString("contentUrl") }
                else -> null
            }
        } + page.select("meta[property=og:image], meta[property=og:image:secure_url], meta[name=twitter:image], link[rel=image_src], video[poster]").map {
            it.attr("content").ifBlank { it.attr("href").ifBlank { it.attr("poster") } }
        }
        val base = page.baseUri().ifBlank { url }
        return images.mapNotNull { Metadata.imageUrl(base, it) }.distinct().also {
            alternatives[videoKey(url)] = System.nanoTime() to it
        }
    }

    suspend fun resolve(
        source: NoodlePosterSource, url: String, poster: String?, headers: Map<String, String>
    ): String? {
        if (poster != null && available(poster, headers)) return poster
        val candidates = alternatives[videoKey(url)]?.takeIf {
            System.nanoTime() - it.first < TimeUnit.MINUTES.toNanos(2)
        }?.second ?: RequestLimits.optional(1500) { remember(url, source.posterPage(url)) }.orEmpty()
        return candidates.firstOrNull { it != poster && available(it, headersFor(it, url, headers)) } ?: poster
    }

    fun headersFor(poster: String, url: String, headers: Map<String, String>): Map<String, String> =
        headers.filterKeys { !it.equals("Cookie", ignoreCase = true) } +
            Network.imageHeaders(poster, headers["Referer"] ?: url)

    private suspend fun available(url: String, headers: Map<String, String>): Boolean {
        val key = ImageCheck(url, headers)
        if (working[key]?.let { System.nanoTime() - it < TimeUnit.MINUTES.toNanos(2) } == true) return true
        val result = RequestLimits.optional(1100) {
            suspendCancellableCoroutine { continuation ->
                val request = Request.Builder().url(url)
                headers.forEach { (name, value) -> request.header(name, value) }
                val call = app.baseClient.newCall(request.build())
                continuation.invokeOnCancellation { call.cancel() }
                call.enqueue(object : Callback {
                    override fun onFailure(call: Call, e: IOException) = continuation.resume(false)

                    override fun onResponse(call: Call, response: Response) {
                        val image = response.use {
                            it.isSuccessful && it.header("Content-Type").orEmpty().startsWith("image/", ignoreCase = true)
                        }
                        continuation.resume(image)
                    }
                })
            }
        } == true
        if (result) working[key] = System.nanoTime()
        return result
    }
}
