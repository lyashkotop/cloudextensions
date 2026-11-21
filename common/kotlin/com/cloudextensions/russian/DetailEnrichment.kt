package com.cloudextensions.russian

import java.net.URI
import org.jsoup.nodes.Document

/** An aggregator's declared embed identifies the actual source; metadata remains source-provided. */
object DetailEnrichment {
    private data class Original(val url: String, val tags: String, val description: String = "", val desktop: Boolean = false)
    private val xvideosId = Regex("^/embedframe/([A-Za-z0-9]+)/?$")
    private val pornhubId = Regex("^/embed/(ph[A-Za-z0-9]+|[0-9a-fA-F]{13})/?$")
    private val xhamsterEmbed = Regex("^/embed/(xh[A-Za-z0-9]+|[0-9]+)/?$")
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
            if (host == "xh.partners") {
                val id = xhamsterPartner.matchEntire(path)?.groupValues?.get(1) ?: continue
                val target = if (id.startsWith("xh")) "https://xhamster.com/videos/$id" else "https://xh.partners/e/$id"
                return Original(target, "", desktop = true)
            }
        }
        return null
    }

    fun original(page: Document): String? = originalPage(page)?.url

    fun merge(detail:VideoDetail,source:VideoDetail)=detail.copy(
        description=detail.description.ifBlank{source.description},
        tags=detail.tags.ifEmpty{source.tags},duration=detail.duration.ifBlank{source.duration},
        poster=detail.poster ?: source.poster,year=detail.year ?: source.year,score=detail.score ?: source.score
    )
    suspend fun complete(page: Document, spec: SiteSpec, detail: VideoDetail, budget: Long = 3000): VideoDetail {
        val target = originalPage(page) ?: return detail
        return read(target, spec, budget, page.baseUri())?.let { merge(detail, it) } ?: detail
    }

    internal suspend fun score(page: Document, spec: SiteSpec): com.lagradost.cloudstream3.Score? {
        val target = originalPage(page) ?: return null
        if (URI(target.url).host == "www.pornhub.com") return null
        return read(target, spec, budget = 2800, referer = page.baseUri())?.score
    }

    suspend fun xvideosScore(id: String, budget: Long): com.lagradost.cloudstream3.Score? {
        val target = xvideosPage(id) ?: return null
        val expected = URI(target).path.substringBeforeLast('/')
        val source = RequestLimits.optional(budget) { Network.page(PageRequest(target), target) } ?: return null
        val resolved = URI(source.baseUri())
        if (resolved.host.orEmpty().removePrefix("www.") != "xvideos.com") return null
        val identity = "/" + resolved.path.trimStart('/').substringBefore('/')
        return if (identity == expected) VideoScores.detail("XVideos", target, source) else null
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

    private suspend fun read(target: Original, spec: SiteSpec, budget: Long, referer: String): VideoDetail? =
        RequestLimits.optional(budget) {
            val headers = if (target.desktop) mapOf("User-Agent" to desktopAgent) else emptyMap()
            val video = if (URI(target.url).host == "xh.partners") {
                // Legacy partner codes are aliases. Only the player redirect identifies their video.
                val player = Network.page(PageRequest(target.url, headers = headers), referer)
                xhamsterPlayerVideo(player.baseUri()) ?: return@optional null
            } else target.url
            val source = Network.page(PageRequest(video, headers = headers), video)
            if (URI(video).host == "xhamster.com") {
                val uri = URI(source.baseUri())
                if (uri.host?.removePrefix("www.") != "xhamster.com" || !uri.path.startsWith("/videos/")) return@optional null
                val id = video.substringAfterLast('/')
                val actual = uri.path.trimEnd('/').removePrefix("/videos/")
                if ('/' in actual || (actual != id && !actual.endsWith("-$id"))) return@optional null
                AggregatorPages.detail(source, spec).copy(score = VideoScores.detail("XHamster", video, source))
            } else {
                Metadata.detail(source, spec.copy(tagSelector = target.tags, descriptionSelector = target.description)).copy(
                    score = if (URI(video).host == "www.xvideos.com" && URI(source.baseUri()).host == "www.xvideos.com")
                        VideoScores.detail("XVideos", video, source) else null,
                )
            }
        }
}
