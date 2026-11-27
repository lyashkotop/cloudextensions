package com.streambundleextra

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.ErrorLoadingException
import org.jsoup.nodes.Document

class ProstoPornoProvider: RussianProvider(SiteSpec(
    id="ProstoPorno", title="ProstoPorno", origin="https://prostoporno.dev",
    cards=".thumb:has(a.img[href*=/videos/]):not(.is_private):not(:has(.is_private))", link="a.img[href]", titleSelector=".title", searchMode="path",
    searchContainer = ".search-result__page > .wideblock",
    tagSelector="#video-info a[href*=/categor], #video-info a[href*=/tag]", descriptionSelector="", related="#relcontent",
    sections=listOf(
        Section("Новинки","/"),
    )
)) {
    override val includeTaxonomyResults = false

    override fun isSearchResult(document: Document, route: PageRequest): Boolean =
        document.selectFirst(".search-result__page .headline > h1") != null &&
            document.selectFirst(".search-result__page .no_search_result") == null

    override suspend fun page(request: PageRequest): Document {
        val document = super.page(request)
        val accessNotice = document.selectFirst("#player > p")?.ownText().orEmpty()
        if (accessNotice.startsWith("Это личное видео пользователя", ignoreCase = true)) {
            throw ErrorLoadingException("Приватное видео")
        }
        // Album search includes its own pager below the video results.
        if (document.selectFirst(".search-result__page .more-search") != null) {
            return document.clone().apply { select(".search-result__page .more-search").remove() }
        }
        return document
    }
}
