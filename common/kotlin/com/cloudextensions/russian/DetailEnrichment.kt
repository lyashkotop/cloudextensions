package com.cloudextensions.russian

import com.lagradost.cloudstream3.ErrorLoadingException
import java.net.URI
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

/** An aggregator's declared embed identifies the actual source; metadata remains source-provided. */
object DetailEnrichment {
    private data class Original(val url: String, val tags: String, val description: String = "", val desktop: Boolean = false)
    private val xvideosId = Regex("^/embedframe/([A-Za-z0-9]+)/?$")
    private val pornhubId = Regex("^/embed/(ph[A-Za-z0-9]+|[0-9a-fA-F]{13})/?$")
    private val xhamsterEmbed = Regex("^/embed/(xh[A-Za-z0-9]+|[0-9]+)/?$")
    private val xhamsterPlayerHosts = setOf("xh.partners", "xh.video")
    private val xhamsterPartner = Regex("^/[ep]/([A-Za-z0-9]{3,24})/?$")
    private val desktopAgent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"

    fun xvideosPage(id: String): String? {
        if (!id.matches(Regex("[A-Za-z0-9]+"))) return null
        val separator = if (id.all { it in '0'..'9' }) "" else "."
        return "https://www.xvideos.com/video$separator$id/_"
    }

    private fun xvideos(id: String) = xvideosPage(id)?.let {
        Original(it, ".video-tags-list a.is-keyword, .video-tags-list a.is-category", ".video-description-text")
    }

    private fun originalPage(page: Document): Original? {
        for (frame in page.select("iframe[src], iframe[data-src]")) {
            val raw = frame.attr("data-src").ifBlank { frame.attr("src") }
            val url = absolute(page.baseUri(), raw) ?: continue
            val uri = URI(url)
            val host = uri.host.orEmpty().removePrefix("www.")
            val path = uri.path.orEmpty()
            // These are the public video routes for IDs declared in the player.
            if (host == "xvideos.com") {
                val id = xvideosId.matchEntire(path)?.groupValues?.get(1) ?: continue
                return xvideos(id)
            }
            if (host == "pornhub.com") {
                val id = pornhubId.matchEntire(path)?.groupValues?.get(1) ?: continue
                return Original(
                    "https://www.pornhub.com/view_video.php?viewkey=$id", ".tagsWrapper a.isTag", desktop = true,
                )
            }
            if (host == "xhamster.com") {
                val target = xhamsterPlayerVideo(url) ?: continue
                return Original(target, "", desktop = true)
            }
            if (host in xhamsterPlayerHosts) {
                val id = xhamsterPartner.matchEntire(path)?.groupValues?.get(1) ?: continue
                val target = if (id.startsWith("xh")) "https://xhamster.com/videos/$id" else "https://$host/e/$id"
                return Original(target, "", desktop = true)
            }
        }
        return null
    }

    fun original(page: Document): String? = originalPage(page)?.url

    fun merge(detail:VideoDetail,source:VideoDetail)=detail.copy(
        description=detail.description.ifBlank{source.description},
        tags=detail.tags.ifEmpty{source.tags},duration=detail.duration.ifBlank{source.duration},
        poster=detail.poster ?: source.poster,year=detail.year ?: source.year
    )
    suspend fun complete(page: Document, spec: SiteSpec, detail: VideoDetail, budget: Long = 3000): VideoDetail {
        val target = originalPage(page) ?: return detail
        return read(target, spec, budget, page.baseUri())?.let { merge(detail, it) } ?: detail
    }

    fun isUnavailable(page: Document): Boolean {
        if (page.attr("data-response-code") in setOf("404", "410")) return true
        return page.select(
            "h1, .video-unavailable, .videoUnavailable, .videoError, .removedVideoText, .removedText, #video-error, #video2 + .error",
        ).any { unavailableNotice.containsMatchIn(Metadata.clean(it.text())) }
    }

    private val unavailableNotice = Regex(
        """(?iu)^(?:(?:this |the )?video (?:is (?:not available|unavailable|private)|has been (?:removed|deleted)|was (?:removed|deleted)|not found|no longer exists)|video unavailable)(?:[.!]|$)""",
    )

    suspend fun verifyOriginal(page: Document, spec: SiteSpec, detail: VideoDetail, budget: Long, allowUnverified: Boolean = false): VideoDetail {
        if (isUnavailable(page)) throw ErrorLoadingException("Видео удалено или недоступно")
        fun unverified(message: String): VideoDetail {
            if (allowUnverified) return detail
            throw ErrorLoadingException(message)
        }
        val target = originalPage(page) ?: return unverified("Источник видео не подтверждён")
        val checked = RequestLimits.optional(budget) { fetchOriginal(target, page.baseUri(), checkAvailability = true) }
            ?: return unverified("Не удалось проверить оригинал")
        if (checked.unavailable) throw ErrorLoadingException("Видео удалено или недоступно")
        val source = checked.page?.let { readSource(it, checked.video, target, spec) }
            ?: return unverified("Оригинал видео не подтверждён")
        if (!ContentPolicy.accepts(source.title, source.tags, source.description)) {
            throw ErrorLoadingException("Видео скрыто фильтром категорий")
        }
        return merge(detail, source).copy(tags = (detail.tags + source.tags).distinctBy(String::lowercase))
    }

    suspend fun xvideosTags(id: String, spec: SiteSpec, budget: Long): List<String> {
        val original = xvideos(id) ?: return emptyList()
        return read(original, spec, budget, original.url)?.tags.orEmpty()
    }

    private fun xhamsterPlayerVideo(url: String): String? {
        val uri = URI(url)
        if (uri.host?.removePrefix("www.") != "xhamster.com") return null
        val id = xhamsterEmbed.matchEntire(uri.path.orEmpty())?.groupValues?.get(1) ?: return null
        return "https://xhamster.com/videos/$id"
    }

    private data class OriginalPage(val video: String, val page: Document? = null, val unavailable: Boolean = false)

    private suspend fun fetchOriginal(target: Original, referer: String, checkAvailability: Boolean): OriginalPage {
        val headers = if (target.desktop) mapOf("User-Agent" to desktopAgent) else emptyMap()
        val video = if (URI(target.url).host in xhamsterPlayerHosts) {
            // Legacy partner codes are aliases. Only the player redirect identifies their video.
            val player = Network.page(PageRequest(target.url, headers = headers, allowNotFound = checkAvailability), referer)
            if (checkAvailability && isUnavailable(player)) return OriginalPage(target.url, unavailable = true)
            xhamsterPlayerVideo(player.baseUri()) ?: return OriginalPage(target.url)
        } else target.url
        val source = Network.page(PageRequest(video, headers = headers, allowNotFound = checkAvailability), video)
        if (checkAvailability && isUnavailable(source)) return OriginalPage(video, unavailable = true)
        return OriginalPage(video, source)
    }

    private fun readSource(source: Document, video: String, target: Original, spec: SiteSpec): VideoDetail? {
        val expected = video.toHttpUrlOrNull() ?: return null
        val actual = source.baseUri().toHttpUrlOrNull() ?: return null
        val host = expected.host.removePrefix("www.")
        if (actual.host.removePrefix("www.") != host) return null
        return when (host) {
            "xhamster.com" -> {
                val id = expected.pathSegments.last()
                val slug = actual.encodedPath.trimEnd('/').removePrefix("/videos/")
                if (!actual.encodedPath.startsWith("/videos/") || '/' in slug || (slug != id && !slug.endsWith("-$id"))) return null
                AggregatorPages.detail(source, spec)
            }
            "xvideos.com", "pornhub.com" -> {
                if (host == "xvideos.com" && actual.pathSegments.firstOrNull() != expected.pathSegments.firstOrNull()) return null
                if (host == "pornhub.com" && (actual.encodedPath != expected.encodedPath ||
                    actual.queryParameter("viewkey") != expected.queryParameter("viewkey"))) return null
                Metadata.detail(source, spec.copy(tagSelector = target.tags, descriptionSelector = target.description))
            }
            else -> null
        }
    }

    private suspend fun read(target: Original, spec: SiteSpec, budget: Long, referer: String): VideoDetail? =
        RequestLimits.optional(budget) {
            val checked = fetchOriginal(target, referer, checkAvailability = false)
            checked.page?.let { readSource(it, checked.video, target, spec) }
        }
}
