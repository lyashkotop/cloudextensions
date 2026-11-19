package com.cloudextensions.sites

import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.SearchResponseList
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.newSearchResponseList
import com.lagradost.cloudstream3.utils.ExtractorLink
import org.jsoup.nodes.Document

class Ro85Provider : RussianProvider(SiteSpec(
    id = "Ro85",
    title = "85RO",
    origin = "https://www.85ro.com/ja",
    cards = RO85_CARDS,
    link = "a[href*=/v/]",
    titleSelector = ".title",
    sections = listOf(
        Section("New videos", "/ja/latest-updates/"),
        Section("Popular videos", "/ja/most-popular/"),
        Section("Top rated videos", "/ja/top-rated/"),
    ),
    tagSelector = RO85_TAGS,
    detailTitleSelector = ".headline-video h1",
)) {
    override var lang = "ja"
    override val translateQueries = false

    override suspend fun search(query: String, page: Int): SearchResponseList =
        if (ro85Excluded(query)) newSearchResponseList(emptyList(), false) else super.search(query, page)

    override suspend fun page(request: PageRequest): Document {
        val document = Network.page(request, "${mainUrl.trimEnd('/')}/")
        return ro85Catalogue(document)
    }

    override fun readMetadata(document: Document): VideoDetail {
        val tags = checkDetail(document)
        val detail = super.readMetadata(document)
        return detail.copy(
            tags = tags,
            description = detail.description.takeUnless { it == "既定のサイト説明。" }.orEmpty(),
        )
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        checkDetail(document)
        // The player and download links can point at the same file with different query strings.
        val sources = Playback.sources(document)
            .sortedByDescending { !it.label.isNullOrBlank() }
            .distinctBy { it.url.substringBefore('?') }
        return Playback.linksFromPage(name, mainUrl, data, document, sources, subtitleCallback, callback)
    }

    private fun checkDetail(document: Document): List<String> {
        val title = document.selectFirst(".headline-video h1")?.text()
            ?: throw ErrorLoadingException("85RO: страница видео недоступна")
        val description = document.selectFirst("meta[property=og:description]")?.attr("content").orEmpty()
        val tags = ro85Tags(document)
        if ((sequenceOf(title, description) + tags).any(::ro85Excluded)) {
            throw ErrorLoadingException("Видео скрыто фильтром категорий")
        }
        return tags
    }
}
