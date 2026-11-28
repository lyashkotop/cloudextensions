package com.cloudextensions.sites

import com.cloudextensions.russian.ContentPolicy
import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import java.util.Locale
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.json.JSONTokener
import org.jsoup.nodes.Document

class PornoMolokoProvider : RussianProvider(
    SiteSpec(
        id = "PornoMoloko",
        title = "1. Порно Молоко",
        origin = "https://pornomoloko.com",
        cards = "a.th[href^=/video/]",
        link = "a.th[href]",
        titleSelector = ".th-desc",
        detailTitleSelector = "article.container > h1",
        titleLanguage = "ru",
        tagSelector = "#video-about .video-categories a[href]",
        descriptionSelector = ".video-wrapper > p",
        durationSelector = "#video-about .video-duration",
        related = "article.container:has(> h2) > .thumbs, .video-aside > .thumbs",
        searchContainer = "section.container:has(> h1):has(> .thumbs)",
        sections = listOf(
            Section("Новинки", "/All/"),
            Section("Популярное", "/populyarnoe-porno/"),
            Section("Домашнее", "/domashnee-porno/"),
            Section("БДСМ", "/porno-bdsm/"),
            Section("Русское", "/russkoe-porno-video/"),
            Section("Реальное", "/realnoe-porno/"),
        ),
    ),
) {
    override val includeTaxonomyResults = false

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/search.php").addQueryParameter("poisk", term).build().toString())

    override suspend fun page(request: PageRequest): Document {
        val address = request.url.toHttpUrl()
        address.queryParameter(catalogueQuery)?.let { return matchCatalogue(request, address, it) }

        val document = super.page(request)
        val next = document.selectFirst(".paginator a.page-next[href]") ?: return document
        if (address.encodedPath != "/search.php") {
            return document.clone().apply { select(".paginator a.page-next[href]").attr("rel", "next") }
        }

        val term = address.queryParameter("poisk").orEmpty()
        val target = next.absUrl("href").toHttpUrlOrNull()
        val preservesQuery = target != null && target.host == address.host && target.encodedPath.startsWith("/search") && target.queryParameter("poisk") == term
        val continuation = when {
            preservesQuery -> target.toString()
            term.isNotBlank() && document.selectFirst(spec.cards) != null ->
                address.newBuilder().encodedPath("/All/").query(null).addQueryParameter(catalogueQuery, term).build().toString()
            else -> null
        }
        return document.clone().apply {
            select(".paginator").remove()
            selectFirst(spec.searchContainer)?.let { results ->
                continuation?.let { results.appendElement("a").attr("rel", "next").attr("href", it) }
            }
        }
    }

    private suspend fun matchCatalogue(request: PageRequest, cursor: HttpUrl, term: String): Document {
        val terms = words.findAll(normalize(term)).map { it.value }.toList()
        val response = Document.createShell(request.url)
        val result = response.body().appendElement("section").addClass("container")
        result.appendElement("h1").text(term)
        val cards = result.appendElement("div").addClass("thumbs")
        var next: HttpUrl? = cursor.newBuilder().removeAllQueryParameters(catalogueQuery).build()
        var pages = 0
        var matches = 0
        // Reuse the site's catalogue cursor and return only listings that match the current query.
        while (next != null && pages < 10 && matches < 12) {
            val current = next
            val document = super.page(request.copy(url = current.toString(), allowNotFound = true))
            if (document.attr("data-response-code") in setOf("404", "410")) {
                next = null
                break
            }
            for (card in document.select(spec.cards)) {
                val title = card.selectFirst(spec.titleSelector)?.text().orEmpty()
                val haystack = normalize(title)
                if (terms.isNotEmpty() && terms.all(haystack::contains) && ContentPolicy.accepts(title)) {
                    cards.appendChild(card.clone())
                    matches++
                }
            }
            next = document.selectFirst(".paginator a.page-next[href]")?.absUrl("href")?.toHttpUrlOrNull()
                ?.takeIf { it.host == cursor.host && it != current && it.encodedPath.matches(cataloguePath) }
            pages++
        }
        next?.newBuilder()?.addQueryParameter(catalogueQuery, term)?.build()?.let {
            result.appendElement("a").attr("rel", "next").attr("href", it.toString())
        }
        return response
    }

    private fun normalize(value: String): String = value.lowercase(Locale.ROOT).replace('ё', 'е')

    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        val poster = playerScripts(document).firstNotNullOfOrNull { script ->
            posterField.findAll(script).firstNotNullOfOrNull { match ->
                Metadata.imageUrl(document.baseUri(), decode(match.groupValues[1]))
            }
        }
        return detail.copy(poster = Metadata.choosePoster(document.baseUri(), poster, detail.poster))
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        val base = document.baseUri().toHttpUrl()
        val declared = playerScripts(document).flatMap { script ->
            playerFile.findAll(script).mapNotNull { match -> decode(match.groupValues[1]) }
        }.toList()
        val streams = declared.filterNot(playerError::containsMatchIn).mapNotNull { value ->
            base.resolve(value)?.let { Playback.Source(it.toString()) }
        }
        val linkedPlayers = declared.mapNotNull { value ->
            playerError.find(value)?.groupValues?.get(1)?.toHttpUrlOrNull()?.takeIf {
                it.isHttps && it.host.removePrefix("www.") == "xhamster.com" &&
                    it.pathSegments.firstOrNull() in setOf("movies", "videos", "embed")
            }
        }.distinct()
        // Some pages place the original player link in the error text instead of a media URL.
        val playerPage = if (linkedPlayers.isEmpty()) document else document.clone().apply {
            linkedPlayers.forEach { body().appendElement("iframe").attr("src", it.toString()) }
        }
        return Playback.linksFromPage(name, mainUrl, data, playerPage, streams, subtitleCallback, callback)
    }

    private fun playerScripts(document: Document): Sequence<String> =
        document.select(".video-wrapper script").asSequence().map { it.data() }

    private fun decode(value: String): String? =
        runCatching { JSONTokener(value).nextValue() as? String }.getOrNull()

    private companion object {
        const val catalogueQuery = "_ce_search"
        val cataloguePath = Regex("""/All(?:-[0-9]+\.html|/)""")
        val words = Regex("""[\p{L}\p{N}]+""")
        val playerError = Regex("""(?iu)^Проблемы с видео сервером\s+(https?://[^\s<>]+)""")
        val playerFile = Regex("""\bnew\s+Playerjs\s*\(\s*\{[^}]*?\bfile\s*:\s*("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')""")
        val posterField = Regex("""\.api\(\s*["']poster["']\s*,\s*("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')""")
    }
}
