package com.cloudextensions.russian

import java.net.URI
import kotlinx.coroutines.CancellationException
import org.jsoup.nodes.Document

/** An aggregator's declared embed identifies the actual source; metadata remains source-provided. */
object DetailEnrichment {
    private data class Original(val url: String, val tags: String, val description: String = "", val desktop: Boolean = false)
    private val xvideosId = Regex("^/embedframe/([A-Za-z0-9]+)/?$")
    private val pornhubId = Regex("^/embed/(ph[A-Za-z0-9]+|[0-9a-fA-F]{13})/?$")
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
        return read(target, spec, budget)?.let { merge(detail, it) } ?: detail
    }

    suspend fun xvideosTags(id: String, spec: SiteSpec, budget: Long): List<String> {
        val original = xvideos(id) ?: return emptyList()
        return read(original, spec, budget)?.tags.orEmpty()
    }

    private suspend fun read(target: Original, spec: SiteSpec, budget: Long): VideoDetail? {
        return try {
            // The desktop Pornhub layout publishes the video's tag list in the HTML.
            val request = PageRequest(target.url, headers = if (target.desktop) mapOf("User-Agent" to desktopAgent) else emptyMap())
            val source = RequestLimits.optional(budget) { Network.page(request, target.url) } ?: return null
            Metadata.detail(source, spec.copy(tagSelector = target.tags, descriptionSelector = target.description))
        } catch(e:CancellationException) {
            throw e
        } catch(_:Exception) {
            null
        }
    }
}
