package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.SearchResponse
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.TvType
import com.lagradost.cloudstream3.newMovieSearchResponse
import com.lagradost.cloudstream3.utils.ExtractorLink
import org.jsoup.nodes.Document
class SickJunkProvider: RussianProvider(SiteSpec(
 id="SickJunk",
 title="SickJunk",
 origin="https://sickjunk.com",
 cards="article.genaral-post-item.format-video:has(img), article.genaral-post-item:has(img):has(.fa-play)",
 link=".genpost-featured-image a[href],h2 a[href]",
 titleSelector=".entry-title",
 tagSelector="article .single-entry-footer .awaken-category-list a",
 descriptionSelector=".entry-content > p, .genpost-entry-content > p",
 detailTitleSelector="h1.single-entry-title",
 sections=listOf(Section("Latest","/"))
)) {
    override var lang = "en"

    private val playerSelector = "video, iframe, embed, object, a[href$=.mp4], a[href$=.m3u8], [data-player-config]"

    private fun editorial(document: Document): Boolean {
        val article = document.selectFirst("article.type-post .entry-content") ?: return false
        return article.selectFirst(playerSelector) == null && Playback.sources(document).isEmpty()
    }

    override suspend fun reviewMetadata(document: Document, detail: VideoDetail): VideoDetail {
        if (editorial(document)) throw ErrorLoadingException("Статья SickJunk не содержит видеоплеера")
        return detail
    }

    override suspend fun enrichMetadata(document: Document, detail: VideoDetail): VideoDetail {
        if (detail.duration.isNotBlank()) return detail
        val player = document.selectFirst("article.type-post .entry-content video[src], article.type-post .entry-content video source[type=video/mp4][src]")
        val seconds = MediaDuration.fromMp4(player?.absUrl("src"), document.baseUri())
        return detail.copy(duration = Metadata.timing(seconds))
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        if (editorial(document)) throw ErrorLoadingException("Статья SickJunk не содержит видеоплеера")
        return Playback.linksFromPage(name, mainUrl, data, document, emptyList(), subtitleCallback, callback)
    }

    override suspend fun related(document: Document, detail: VideoDetail, url: String): List<SearchResponse> {
        val cards = Metadata.cards(document, spec.copy(
            cards = "article .yarpp-related a.yarpp-thumbnail:has(img)",
            link = "a[href]",
            titleSelector = ".yarpp-thumbnail-title",
        )).filter { it.url != url }
        return if (cards.isEmpty()) super.related(document, detail, url) else cards.map { card ->
            newMovieSearchResponse(card.title, card.url, TvType.NSFW) {
                posterUrl = card.poster
                posterHeaders = Network.imageHeaders(card.poster, url)
            }
        }
    }
}
