package com.cloudextensions.sites

import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import okhttp3.HttpUrl.Companion.toHttpUrl
import org.jsoup.nodes.Document

class DomashkaProvider : RussianProvider(
    SiteSpec(
        id = "Domashka",
        title = "1. Domashka.live",
        origin = "https://domashka.live",
        cards = ".thumb[data-vw]:has(a.thumb__preview[href^=/][href$=.html] img[src])",
        link = "a.thumb__preview[href]",
        titleSelector = ".thumb__title",
        detailTitleSelector = "main > h1.title",
        titleLanguage = "ru",
        tagSelector = ".split-player__left .tag-list a.tag-list__tag[href]",
        related = ".thumbs.-aside-related, section:has(> h2.title) > .thumbs",
        searchContainer = "main.content__block",
        sections = listOf(
            Section("Новинки", "/new/"),
            Section("Популярное", "/popular/"),
            Section("Домашнее", "/domashnee-porno/"),
            Section("Русское", "/russkoe/"),
            Section("Любительское с разговорами", "/s-razgovorami/"),
            Section("Частное", "/chastnoe/"),
        ),
    ),
) {
    override val includeTaxonomyResults = false

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/search/").addQueryParameter("q", term).build().toString())

    override suspend fun page(request: PageRequest): Document = super.page(request).clone().apply {
        select(".thumb .thumb-tags a.thumb-tags__link[href]").attr("rel", "tag")
    }

    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        val duration = document.selectFirst(".post-meta__item:has(.icon-clock)")?.ownText().orEmpty()
        val parts = timePart.findAll(duration).associate { match ->
            match.groupValues[2].lowercase().first() to (match.groupValues[1].toLongOrNull() ?: 0)
        }
        val seconds = (parts['ч'] ?: 0) * 3600 + (parts['м'] ?: 0) * 60 + (parts['с'] ?: 0)
        return detail.copy(duration = Metadata.timing(seconds.toString()).ifBlank { detail.duration })
    }

    private companion object {
        val timePart = Regex("""(?iu)(\d+)\s*(час\p{L}*|минут\p{L}*|секунд\p{L}*)""")
    }
}
