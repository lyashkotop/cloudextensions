package com.cloudextensions.russian

import org.json.JSONArray
import org.json.JSONObject
import org.jsoup.nodes.Document
import java.net.URI
import java.util.Collections
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.launch
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull

interface NoodlePosterSource : PosterSource {
    override val posterTimeoutMs: Long get() = 5300

    override suspend fun resolvePoster(url: String, poster: String?, headers: Map<String, String>): String? =
        NoodlePosters.resolve(this, url, poster, headers)

    suspend fun posterPage(url: String): Document

    fun rememberNoodlePosters(url: String, page: Document) {
        NoodlePosters.remember(url, page)
    }
}

/** Both language variants use the same catalogue and detail image fields. */
internal object NoodlePosters {
    data class Candidates(val images: List<String>, val track: String?)
    private val alternatives = Collections.synchronizedMap(BoundedMap<String, Pair<Long, Candidates>>(256))
    // The image proxy includes the upstream image host and path in the preview URL.
    private val wrappedPreview = Regex("""^/preview/[^/]+/[^/]+/[0-9]+/(sun[0-9]+(?:-[0-9]+)?\.(?:vkuserphoto\.ru|userapi\.com)|i\.mycdn\.me)(/[^/].*)$""")

    private fun originalImage(poster: String): String? {
        val uri = try { URI(poster) } catch (_: java.net.URISyntaxException) { return null }
        if (uri.host != "img.pvvstream.pro") return null
        val match = wrappedPreview.matchEntire(uri.rawPath.orEmpty()) ?: return null
        val (host, path) = match.destructured
        val query = uri.rawQuery?.let { "?$it" }.orEmpty()
        return Metadata.imageUrl(poster, "https://$host$path$query")
    }

    fun remember(url: String, page: Document): Candidates {
        val playlists = NoodlePlayback.playlists(page)
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
        } + playlists.map { it.optString("image") }
        val base = page.baseUri().ifBlank { url }
        val baseHost = base.toHttpUrlOrNull()?.host
        val track = playlists.firstNotNullOfOrNull playlist@{ playlist ->
            val tracks = playlist.optJSONArray("tracks") ?: return@playlist null
            (0 until tracks.length()).firstNotNullOfOrNull entry@{ index ->
                val item = tracks.optJSONObject(index) ?: return@entry null
                if (item.optString("kind") != "thumbnails") return@entry null
                absolute(base, item.optString("file"))?.toHttpUrlOrNull()?.takeIf {
                    it.host == baseHost && it.encodedPath.startsWith("/vtt/")
                }?.toString()
            }
        }
        return Candidates(images.mapNotNull { Metadata.imageUrl(base, it) }.distinct(), track).also {
            alternatives[videoKey(url)] = System.nanoTime() to it
        }
    }

    suspend fun resolve(
        source: NoodlePosterSource, url: String, poster: String?, headers: Map<String, String>
    ): String? {
        StoryboardPosters.cached(url)?.let { return it }
        val saved = alternatives[videoKey(url)]?.takeIf {
            System.nanoTime() - it.first < TimeUnit.MINUTES.toNanos(2)
        }?.second
        val tried = mutableSetOf<String>()
        var slowOriginal: String? = null
        suspend fun verified(candidates: List<String>): String? = coroutineScope {
            val originals = candidates.mapNotNull(::originalImage).toSet()
            val images = candidates.flatMap { listOfNotNull(originalImage(it), it) }
                .distinct().filterNot(tried::contains).take(4)
            val results = Channel<Pair<String, Boolean?>>(images.size)
            val checks = images.map { image ->
                tried += image
                launch {
                    val requestHeaders = if (image == poster) headers else Network.replacementImageHeaders(image, url, headers)
                    results.send(image to PosterRequests.check(image, requestHeaders, 1200))
                }
            }
            try {
                repeat(checks.size) {
                    val (image, available) = results.receive()
                    if (available == true) return@coroutineScope image
                    if (available == null && image in originals) {
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
        verified(listOfNotNull(poster) + saved?.images.orEmpty())?.let { return it }
        val declared = saved ?: RequestLimits.optional(1800) { remember(url, source.posterPage(url)) }
        verified(declared?.images.orEmpty())?.let { return it }
        if (declared?.track != null && ImagePrefetch.cacheDirectory() != null) {
            val fallback = RequestLimits.optional(4000) {
                val text = Network.page(PageRequest(declared.track), url).wholeText()
                val frames = StoryboardPosters.frames(text, declared.track)
                for (frame in frames) {
                    for (sheet in listOfNotNull(originalImage(frame.sheet), frame.sheet).distinct()) {
                        val requestHeaders = Network.replacementImageHeaders(sheet, url, headers)
                        val cached = RequestLimits.optional(2500) {
                            StoryboardPosters.save(url, frame.copy(sheet = sheet), requestHeaders)
                        }
                        if (cached != null) return@optional cached
                    }
                }
                null
            }
            if (fallback != null) return fallback
        }
        return slowOriginal ?: poster
    }
}
