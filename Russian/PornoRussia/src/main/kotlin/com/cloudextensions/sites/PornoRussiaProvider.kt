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
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import java.util.Locale
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.json.JSONTokener
import org.jsoup.nodes.Document

class PornoRussiaProvider : RussianProvider(
    SiteSpec(
        id = "PornoRussia",
        title = "1. Порно Россия ТВ",
        origin = "https://pornorussia.mobi",
        cards = "a.th[href*=video.php?mov=]:has(img)",
        link = "a.th[href]",
        titleSelector = ".th-description",
        detailTitleSelector = ".container > h1",
        titleLanguage = "ru",
        tagSelector = ".video-container p.video-categories a[href^=/c/]",
        durationSelector = ".video-info span:has(.icon-duration) b",
        related = ".container > .thumbs",
        sections = listOf(
            Section("Домашнее", "/c/domashnee-porno.html"),
            Section("БДСМ", "/c/bdsm.html"),
            Section("Фетиш", "/c/fetish.html"),
            Section("Любительское", "/c/lyubitelskoe.html"),
            Section("Русские пары", "/c/para.html"),
            Section("Студентки 18+", "/c/student.html"),
        ),
    ),
) {
    override val includeTaxonomyResults = false

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(searchCursor(spec.sections.first().path, term, 0).toString())

    private fun searchCursor(path: String, term: String, section: Int): HttpUrl =
        mainUrl.toHttpUrl().newBuilder().encodedPath(path)
            .addQueryParameter(queryKey, term).addQueryParameter(sectionKey, section.toString()).build()

    override suspend fun page(request: PageRequest): Document {
        val address = request.url.toHttpUrl()
        val localized = request.copy(headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE))
        address.queryParameter(queryKey)?.let { return searchCatalogue(localized, address, it) }
        var document = super.page(localized)
        if (address.encodedPath == "/video.php") {
            if (!isVideo(document, address)) {
                document = super.page(localized.copy(headers = localized.headers + ("Cache-Control" to "no-cache")))
            }
            if (!isVideo(document, address)) throw ErrorLoadingException("Сайт перенаправил с карточки видео")
            return document
        }
        return document.clone().apply {
            select("a.more[href]").forEach { link ->
                if (nextCatalogueUrl(link.absUrl("href")) != null) link.attr("rel", "next") else link.remove()
            }
        }
    }

    private fun isVideo(document: Document, requested: HttpUrl): Boolean =
        document.baseUri().toHttpUrlOrNull()?.host == requested.host && document.selectFirst(".video-container #player") != null

    private fun nextCatalogueUrl(url: String): HttpUrl? =
        url.toHttpUrlOrNull()?.takeIf { it.host == mainUrl.toHttpUrl().host && pagePath.matches(it.encodedPath) }

    private suspend fun searchCatalogue(request: PageRequest, address: HttpUrl, term: String): Document {
        val words = word.findAll(normalize(term)).map { it.value }.toList()
        var section = address.queryParameter(sectionKey)?.toIntOrNull() ?: 0
        var nextPath = address.encodedPath
        val response = Document.createShell(request.url)
        repeat(5) {
            if (section >= spec.sections.size) return response
            val url = mainUrl.toHttpUrl().newBuilder().encodedPath(nextPath).build()
            val document = super.page(request.copy(url = url.toString(), allowNotFound = true))
            for (card in document.select(spec.cards)) {
                val title = card.selectFirst(spec.titleSelector)?.text().orEmpty()
                if (words.isNotEmpty() && words.all(normalize(title)::contains) && ContentPolicy.accepts(title)) {
                    response.body().appendChild(card.clone())
                }
            }
            val following = document.selectFirst("a.more[href]")?.absUrl("href")?.let(::nextCatalogueUrl)
                ?.takeUnless { it == url }
            if (following == null) {
                section++
                nextPath = spec.sections.getOrNull(section)?.path ?: return response
            } else nextPath = following.encodedPath
        }
        response.body().appendElement("a").attr("rel", "next")
            .attr("href", searchCursor(nextPath, term, section).toString())
        return response
    }

    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        val scripts = playerScripts(document)
        val poster = scripts.firstNotNullOfOrNull { script ->
            parse(posterField, script)?.let { Metadata.imageUrl(document.baseUri(), it) }
        }
        val description = document.select(".video-container > p.video-description").firstOrNull()
            ?.let { label ->
                val written = label.ownText().trim(' ', '.')
                written.ifBlank { label.nextElementSibling()?.takeIf { it.tagName() == "p" && it.className().isBlank() }?.text().orEmpty() }
            }
        return detail.copy(
            poster = Metadata.choosePoster(document.baseUri(), poster, detail.poster),
            description = Metadata.description(description, detail.title),
        )
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        val base = document.baseUri().toHttpUrl()
        val streams = playerScripts(document).mapNotNull { parse(playerFile, it)?.let(base::resolve) }
            .map { Playback.Source(it.toString()) }
        return Playback.linksFromPage(name, mainUrl, data, document, streams, subtitleCallback, callback)
    }

    private fun playerScripts(document: Document) = document.select(".video-container script").map { it.data() }

    private fun parse(field: Regex, script: String): String? = field.find(script)?.groupValues?.get(1)?.let {
        runCatching { JSONTokener(it).nextValue() as? String }.getOrNull()
    }

    private fun normalize(value: String) = value.lowercase(Locale.ROOT).replace('ё', 'е')

    private companion object {
        const val queryKey = "_ce_search"
        const val sectionKey = "_ce_section"
        val pagePath = Regex("""/c/[^/]+-[0-9]+\.html""")
        val word = Regex("""[\p{L}\p{N}]+""")
        val playerFile = Regex("""\bnew\s+Playerjs\s*\(\s*\{[^}]*?\bfile\s*:\s*("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')""")
        val posterField = Regex("""\.api\(\s*["']poster["']\s*,\s*("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')""")
    }
}
