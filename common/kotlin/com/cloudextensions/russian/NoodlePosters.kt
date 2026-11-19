package com.cloudextensions.russian

import org.json.JSONArray
import org.json.JSONObject
import org.jsoup.nodes.Document
import java.net.URI
import java.util.Collections
import java.util.concurrent.TimeUnit

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
        suspend fun verifyOriginal(image: String): String? {
            if (!tried.add(image)) return null
            val imageHeaders = Network.replacementImageHeaders(image, url, headers)
            // The page declares this exact image. A slow probe should not prevent Coil from loading it.
            return image.takeUnless { PosterRequests.check(image, imageHeaders, 1200) == false }
        }
        suspend fun verify(candidate: String): String? {
            originalImage(candidate)?.let { verifyOriginal(it) }?.let { return it }
            val imageHeaders = if (candidate == poster) headers else Network.replacementImageHeaders(candidate, url, headers)
            return candidate.takeIf { tried.add(it) && PosterRequests.available(it, imageHeaders, 1100) }
        }
        // Keep the listing's thumbnail size when it already declares the original image.
        val preferred = poster?.let(::originalImage) ?: saved?.firstNotNullOfOrNull(::originalImage)
        preferred?.let { verifyOriginal(it) }?.let { return it }
        if (poster != null) verify(poster)?.let { return it }
        val candidates = saved ?: RequestLimits.optional(1500) { remember(url, source.posterPage(url)) }.orEmpty()
        return candidates.firstNotNullOfOrNull { verify(it) } ?: poster
    }
}
