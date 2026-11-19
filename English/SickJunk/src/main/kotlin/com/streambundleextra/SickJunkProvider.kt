package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SearchResponse
import com.lagradost.cloudstream3.TvType
import com.lagradost.cloudstream3.newMovieSearchResponse
import org.jsoup.nodes.Document
class SickJunkProvider: RussianProvider(SiteSpec(
 id="SickJunk",
 title="SickJunk",
 origin="https://sickjunk.com",
 cards="article.genaral-post-item:has(img)",
 link=".genpost-featured-image a[href],h2 a[href]",
 titleSelector=".entry-title",
 tagSelector="article .single-entry-footer .awaken-category-list a",
 descriptionSelector=".entry-content > p, .genpost-entry-content > p",
 detailTitleSelector="h1.single-entry-title",
 sections=listOf(Section("Latest","/"))
)) {
    override var lang = "en"

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
