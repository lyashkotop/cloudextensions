package com.cloudextensions.russian

import com.lagradost.cloudstream3.MovieSearchResponse
import com.lagradost.cloudstream3.SearchResponse
import java.io.File
import java.net.URI
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeoutOrNull
import org.json.JSONArray
import org.json.JSONObject

internal object SearchPosters {
    private const val VISIBLE = 3
    private const val CANDIDATES = 9
    private const val COVER_BUDGET_MS = 1_650L
    private const val DECODE_BUDGET_MS = 550L

    suspend fun precheck(items: List<SearchResponse>) = coroutineScope {
        items.take(VISIBLE).map { card -> async { verify(card, decode = false) } }.awaitAll()
        Unit
    }

    suspend fun prepare(
        items: List<SearchResponse>,
        deadline: Long,
        repair: suspend (MovieSearchResponse) -> MovieSearchResponse,
        defer: (MovieSearchResponse) -> Unit = {},
    ): List<SearchResponse> {
        val budget = minOf(COVER_BUDGET_MS, (deadline - System.nanoTime()) / 1_000_000L)
        if (items.isEmpty() || budget <= 0) return items
        val ready = ConcurrentHashMap<Int, SearchResponse>()
        val candidates = items.take(CANDIDATES)
        val leading = minOf(VISIBLE, candidates.size)

        withTimeoutOrNull(budget) {
            coroutineScope {
                val leadingChecks = (0 until leading).map { index ->
                    async {
                        val original = candidates[index]
                        if (verify(original)) {
                            ready[index] = original
                        } else if (original is MovieSearchResponse) {
                            val repaired = repair(original)
                            if (repaired.posterUrl != original.posterUrl && verify(repaired)) ready[index] = repaired
                        }
                    }
                }
                // Give the requested order a head start. Check later cards only when a visible photo may be missing.
                val backup = async {
                    if (candidates.size <= leading) return@async
                    delay(300)
                    for (start in leading until candidates.size step VISIBLE) {
                        if ((0 until leading).all(ready::containsKey)) break
                        (start until minOf(start + VISIBLE, candidates.size)).map { index ->
                            async {
                                if (verify(candidates[index], decode = false)) ready[index] = candidates[index]
                            }
                        }.awaitAll()
                        if (ready.size >= leading) break
                    }
                }
                leadingChecks.awaitAll()
                if ((0 until leading).all(ready::containsKey)) backup.cancel()
                else backup.await()
            }
        }
        // Move only enough verified cards to fill the first row, preserving the relative order of all other cards.
        val first = ready.keys.sorted().take(VISIBLE)
        val ordered = first.map { ready.getValue(it) } +
            items.mapIndexedNotNull { index, card -> if (index in first) null else card }
        if (first.size < leading) {
            (0 until leading).filterNot(ready::containsKey).forEach { index ->
                (candidates[index] as? MovieSearchResponse)?.let(defer)
            }
        }
        ImagePrefetch.warm(ordered.take(VISIBLE), priority = true)
        return ordered
    }

    private suspend fun verify(card: SearchResponse, decode: Boolean = true): Boolean {
        val url = card.posterUrl?.takeIf(String::isNotBlank) ?: return false
        val headers = card.posterHeaders.orEmpty()
        if (url.startsWith("file:")) return runCatching { File(URI(url)).isFile }.getOrDefault(false)
        if (Metadata.imageUrl(card.url, url) == null || PosterRequests.knownUnavailable(url, headers)) return false
        if (decode && withTimeoutOrNull(DECODE_BUDGET_MS) { ImagePrefetch.await(url, headers) } == true) return true
        return PosterRequests.available(url, headers, 450L)
    }

    suspend fun repairFromDetail(card: MovieSearchResponse): MovieSearchResponse = withContext(Network.CacheDetail) {
        val document = RequestLimits.optional(650L) {
            Network.page(PageRequest(card.url), card.posterHeaders.orEmpty()["Referer"] ?: card.url)
        } ?: return@withContext card
        val base = document.baseUri()
        if (videoKey(base) != videoKey(card.url)) return@withContext card
        val thumbnail = Metadata.ownVideo(document)?.opt("thumbnailUrl")
        val thumbnails = if (thumbnail is JSONArray) {
            (0 until thumbnail.length()).map { thumbnail.opt(it) }
        } else listOf(thumbnail)
        val structured = thumbnails.mapNotNull {
            when (it) {
                is String -> it
                is JSONObject -> it.optString("url").ifBlank { it.optString("contentUrl") }
                else -> null
            }
        }
        val declared = document.select("meta[property=og:image], meta[name=og:image], video[poster], link[rel=image_src]")
            .map { it.attr("content").ifBlank { it.attr("poster").ifBlank { it.attr("href") } } }
        val candidates = (structured + declared).mapNotNull { Metadata.imageUrl(base, it) }
            .distinct().filterNot { it == card.posterUrl }.take(3)
        coroutineScope {
            candidates.map { image ->
                async {
                    val headers = Network.replacementImageHeaders(image, card.url, card.posterHeaders.orEmpty())
                    card.copy(posterUrl = image, posterHeaders = headers).takeIf { verify(it) }
                }
            }.awaitAll().firstOrNull { it != null } ?: card
        }
    }
}
