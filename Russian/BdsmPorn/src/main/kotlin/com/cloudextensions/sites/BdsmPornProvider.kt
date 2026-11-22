package com.cloudextensions.sites

import com.cloudextensions.russian.ContentPolicy
import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.newExtractorLink
import java.util.Locale
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

class BdsmPornProvider : RussianProvider(
    SiteSpec(
        id = "BdsmPorn",
        title = "1. BDSM-Porn.cc",
        origin = "https://bdsm-porn.cc",
        cards = ".video.trailer:has(> a[href^=/video/])",
        link = "a[href^=/video/]",
        titleSelector = "h3 .title",
        detailTitleSelector = ".video-header h1",
        titleLanguage = "ru",
        tagSelector = ".description .tags a[href], .description .tags-alt a[href]",
        related = ".video-page .videos-page",
        sections = listOf(
            Section("Новинки", "/videos"),
            Section("В тренде", "/videos/trending"),
            Section("БДСМ", "/bdsm"),
            Section("Порка", "/spanking"),
            Section("Связывание", "/bondage"),
            Section("Садомазо", "/sadomaso"),
        ),
    ),
) {
    override val includeTaxonomyResults = false

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/videos").addQueryParameter(searchTerm, term).build().toString())

    override suspend fun page(request: PageRequest): Document {
        val address = request.url.toHttpUrl()
        val localized = request.copy(headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE))
        val term = address.queryParameter(searchTerm)
        if (term != null) return filterCatalogue(localized, address, term)
        val document = super.page(localized)
        return document.clone().apply {
            selectFirst(".video-header h1")?.children()?.remove()
            nextPage(this)?.let { (anchor, _) -> anchor.attr("rel", "next") }
        }
    }

    private fun nextPage(document: Document): Pair<org.jsoup.nodes.Element, HttpUrl>? {
        val address = document.baseUri().toHttpUrl()
        val current = address.queryParameter("page")?.toIntOrNull() ?: 1
        return document.select("a.pagenav[href]").firstNotNullOfOrNull { anchor ->
            val next = anchor.absUrl("href").toHttpUrlOrNull()
            if (next?.host == address.host && next.encodedPath == address.encodedPath &&
                next.queryParameter("page")?.toIntOrNull() == current + 1
            ) anchor to next else null
        }
    }

    private suspend fun filterCatalogue(request: PageRequest, address: HttpUrl, term: String): Document {
        val words = words.findAll(normalize(term)).map { it.value }.toList()
        val result = Document.createShell(request.url)
        var next: HttpUrl? = address.newBuilder().removeAllQueryParameters(searchTerm).build()
        repeat(6) {
            val current = next ?: return result
            val document = super.page(request.copy(url = current.toString(), allowNotFound = true))
            if (document.attr("data-response-code") in setOf("404", "410")) return result
            for (card in document.select(spec.cards)) {
                val title = card.selectFirst(spec.titleSelector)?.text().orEmpty()
                if (words.isNotEmpty() && words.all(normalize(title)::contains) && ContentPolicy.accepts(title)) {
                    result.body().appendChild(card.clone())
                }
            }
            next = nextPage(document)?.second
        }
        next?.newBuilder()?.addQueryParameter(searchTerm, term)?.build()?.let {
            result.body().appendElement("a").attr("rel", "next").attr("href", it.toString())
        }
        return result
    }

    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        val description = document.selectFirst("meta[property=og:description]")?.attr("content").orEmpty()
        val summary = description.takeUnless { it.startsWith("Сочное видео с тегами", ignoreCase = true) }
        return detail.copy(description = detail.description.ifBlank { Metadata.description(summary, detail.title) })
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        val sources = document.select("video#player[src], video#player source[src]")
            .mapNotNull { it.absUrl("src").toHttpUrlOrNull() }
            .filter { it.host == mainUrl.toHttpUrl().host && it.encodedPath.startsWith("/link_cs/") }
            .distinct()
        var emitted = false
        for (source in sources) {
            val url = source.toString()
            val link = newExtractorLink(name, name, url, Playback.streamType(url)) {
                referer = document.baseUri()
                headers = Network.headers(referer) + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)
            }
            if (Playback.checkDirectLink(link) == true) {
                callback(link)
                emitted = true
            }
        }
        return emitted || Playback.linksFromPage(name, mainUrl, data, document, emptyList(), subtitleCallback, callback)
    }

    private fun normalize(value: String): String = value.lowercase(Locale.ROOT).replace('ё', 'е')

    private companion object {
        const val searchTerm = "_ce_search"
        val words = Regex("""[\p{L}\p{N}]+""")
    }
}
