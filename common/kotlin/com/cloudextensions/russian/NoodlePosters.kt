package com.cloudextensions.russian

import org.json.JSONArray
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.nodes.Document
import java.net.URI
import java.util.Collections
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope

interface NoodlePosterSource : PosterSource {
    override suspend fun resolvePoster(url: String, poster: String?, headers: Map<String, String>): String? =
        NoodlePosters.resolve(this, url, poster, headers)

    suspend fun posterPage(url: String): Document

    fun rememberNoodlePosters(url: String, page: Document) {
        NoodlePosters.remember(url, page)
    }
}

/** Both language variants use the same catalogue and detail image fields. */
internal object NoodlePosters {
    private val alternatives = Collections.synchronizedMap(BoundedMap<String, Pair<Long, List<String>>>(256))
    // The image proxy includes the upstream image host and path in the preview URL.
    private val wrappedPreview = Regex("""^/preview/[^/]+/[^/]+/[0-9]+/(sun[0-9]+(?:-[0-9]+)?\.vkuserphoto\.ru|i\.mycdn\.me)(/[^/].*)$""")
    private val playlistAssignment = Regex("""\bwindow\.playlist\s*=\s*""")

    private fun originalImage(poster: String): String? {
        val uri = try { URI(poster) } catch (_: java.net.URISyntaxException) { return null }
        if (uri.host != "img.pvvstream.pro") return null
        val match = wrappedPreview.matchEntire(uri.rawPath.orEmpty()) ?: return null
        val (host, path) = match.destructured
        val query = uri.rawQuery?.let { "?$it" }.orEmpty()
        return Metadata.imageUrl(poster, "https://$host$path$query")
    }

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
        } + page.select("script").mapNotNull { script ->
            val js = script.data()
            val assignment = playlistAssignment.find(js) ?: return@mapNotNull null
            val playlist = try {
                JSONTokener(js.substring(assignment.range.last + 1)).nextValue() as? JSONObject
            } catch (_: org.json.JSONException) {
                null
            }
            playlist?.optString("image")
        }
        val base = page.baseUri().ifBlank { url }
        return images.mapNotNull { Metadata.imageUrl(base, it) }.distinct().also {
            alternatives[videoKey(url)] = System.nanoTime() to it
        }
    }

    suspend fun resolve(
        source: NoodlePosterSource, url: String, poster: String?, headers: Map<String, String>
    ): String? {
        val saved = alternatives[videoKey(url)]?.takeIf {
            System.nanoTime() - it.first < TimeUnit.MINUTES.toNanos(2)
        }?.second
        val tried = mutableSetOf<String>()
        var slowOriginal: String? = null
        suspend fun verified(candidates: List<String>): String? = coroutineScope {
            val checks = candidates.flatMap { listOfNotNull(originalImage(it), it) }
                .distinct().filterNot(tried::contains).take(4).map { image ->
                    tried += image
                    async {
                        val requestHeaders = if (image == poster) headers else Network.replacementImageHeaders(image, url, headers)
                        image to PosterRequests.check(image, requestHeaders, 1200)
                    }
                }
            try {
                for (check in checks) {
                    val (image, available) = check.await()
                    if (available == true) return@coroutineScope image
                    if (available == null && candidates.any { originalImage(it) == image }) {
                        if (slowOriginal == null) slowOriginal = image
                    }
                }
                null
            } finally {
                checks.forEach { it.cancel() }
            }
        }
        // Keep the listing size when it works. Check the alternatives together so a slow CDN
        // cannot consume the entire budget before a valid cover is tried.
        verified(listOfNotNull(poster) + saved.orEmpty())?.let { return it }
        if (saved == null && slowOriginal == null) {
            val declared = RequestLimits.optional(1100) { remember(url, source.posterPage(url)) }.orEmpty()
            verified(declared)?.let { return it }
        }
        return slowOriginal ?: poster
    }
}
