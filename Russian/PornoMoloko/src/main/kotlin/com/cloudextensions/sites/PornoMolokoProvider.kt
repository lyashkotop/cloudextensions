package com.cloudextensions.sites

import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.HttpUrl.Companion.toHttpUrl
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
        val document = super.page(request)
        val paginator = document.selectFirst(".paginator") ?: return document
        if (request.url.toHttpUrl().encodedPath == "/search.php") {
            // The site's search pager links to /All-N.html and drops the search term.
            return document.clone().apply { select(".paginator").remove() }
        }
        if (paginator.selectFirst("a.page-next[href]") == null) return document
        return document.clone().apply { select(".paginator a.page-next[href]").attr("rel", "next") }
    }

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
        val streams = playerScripts(document).flatMap { script ->
            playerFile.findAll(script).mapNotNull { match ->
                decode(match.groupValues[1])?.let(base::resolve)?.let { Playback.Source(it.toString()) }
            }
        }.toList()
        // The download menu repeats one URL under several labels. Use the real player file.
        return Playback.linksFromPage(name, mainUrl, data, document, streams, subtitleCallback, callback)
    }

    private fun playerScripts(document: Document): Sequence<String> =
        document.select(".video-wrapper script").asSequence().map { it.data() }

    private fun decode(value: String): String? =
        runCatching { JSONTokener(value).nextValue() as? String }.getOrNull()

    private companion object {
        val playerFile = Regex("""\bnew\s+Playerjs\s*\(\s*\{[^}]*?\bfile\s*:\s*("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')""")
        val posterField = Regex("""\.api\(\s*["']poster["']\s*,\s*("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')""")
    }
}
