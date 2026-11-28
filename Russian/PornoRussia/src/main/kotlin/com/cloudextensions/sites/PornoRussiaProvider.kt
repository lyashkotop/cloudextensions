package com.cloudextensions.sites

import com.cloudextensions.russian.ContentPolicy
import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RequestLimits
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import java.util.Locale
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.launch
import kotlinx.coroutines.withTimeoutOrNull
import kotlinx.coroutines.coroutineScope
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
    override val requiresListingReview = true

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(searchCursor(term, spec.sections.map { it.path }).toString())

    private fun searchCursor(term: String, paths: List<String>): HttpUrl =
        mainUrl.toHttpUrl().newBuilder().encodedPath("/s.php").addQueryParameter(queryKey, term).apply {
            paths.forEach { addQueryParameter(routeKey, it) }
        }.build()

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

    private suspend fun searchCatalogue(request: PageRequest, address: HttpUrl, term: String): Document = coroutineScope {
        val words = word.findAll(normalize(term)).map { it.value }.toList()
        val humiliation = words.singleOrNull() == "унижение"
        val response = Document.createShell(request.url)
        var paths = address.queryParameterValues(routeKey).filterNotNull().filter { categoryStem(it) != null }
        if (words.isEmpty() || paths.isEmpty()) return@coroutineScope response
        // The site's search form can return a server error with HTTP 200. Check the published
        // catalogue for real title matches and keep its cursors only when a match was found.
        val retries = mutableListOf<String>()
        val matchedUrls = hashSetOf<String>()
        var reachable = false
        val firstPage = paths == spec.sections.map { it.path }
        for (budget in listOf(2400L, 1500L)) {
            val replies = Channel<Pair<String, Document?>>(paths.size)
            val jobs = paths.map { path ->
                launch {
                    val url = mainUrl.toHttpUrl().newBuilder().encodedPath(path).build()
                    val document = RequestLimits.optional(budget) {
                        super.page(request.copy(url = url.toString(), allowNotFound = true))
                    }
                    replies.send(path to document)
                }
            }
            val received = mutableSetOf<String>()
            val following = mutableListOf<String>()
            fun add(path: String, document: Document?) {
                received += path
                if (document == null) {
                    retries += path
                    return
                }
                reachable = true
                for (card in document.select(spec.cards)) {
                    val title = card.selectFirst(spec.titleSelector)?.text().orEmpty()
                    val url = card.absUrl("href")
                    val label = normalize(title)
                    val matches = if (humiliation) {
                        word.findAll(label).any { it.value.startsWith("униж") || it.value.startsWith("униз") }
                    } else words.all(label::contains)
                    if (url.isNotEmpty() && matches &&
                        ContentPolicy.accepts(title) && matchedUrls.add(url)) {
                        response.body().appendChild(card.clone())
                    }
                }
                val stem = categoryStem(path)
                val next = document.select("a.more[href]").firstNotNullOfOrNull { link ->
                    nextCatalogueUrl(link.absUrl("href"))?.encodedPath?.takeIf { candidate ->
                        categoryStem(candidate) == stem && pageNumber(candidate) > pageNumber(path)
                    }
                }
                if (next != null) following += next
            }
            suspend fun acceptNext() {
                val (path, document) = replies.receive()
                add(path, document)
            }
            try {
                while (received.size < paths.size && (!firstPage || matchedUrls.size < 4)) acceptNext()
                if (received.size < paths.size) {
                    withTimeoutOrNull(150L) { while (received.size < paths.size) acceptNext() }
                    retries += paths.filterNot(received::contains)
                }
            } finally {
                jobs.forEach { it.cancel() }
            }
            paths = following
            if (matchedUrls.isNotEmpty()) {
                val next = (paths + retries).distinct()
                if (next.isNotEmpty()) response.body().appendElement("a").attr("rel", "next")
                    .attr("href", searchCursor(term, next).toString())
                break
            }
            if (paths.isEmpty()) break
        }
        if (!reachable) throw ErrorLoadingException("Порно Россия ТВ: каталог не ответил")
        response
    }

    private fun categoryStem(path: String): String? {
        val stem = path.removeSuffix(".html").replace(pageSuffix, "")
        return stem.takeIf { spec.sections.any { section -> section.path == "$stem.html" } }
    }

    private fun pageNumber(path: String): Int =
        pageSuffix.find(path.removeSuffix(".html"))?.groupValues?.get(1)?.toIntOrNull() ?: 1

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
        val playerFiles = playerScripts(document).mapNotNull { parse(playerFile, it)?.let(base::resolve) }
        val downloadFiles = document.select("a[href]:has(> .icon-dl)").mapNotNull { link ->
            val file = base.resolve(link.attr("href")) ?: return@mapNotNull null
            file.takeIf { candidate ->
                candidate.isHttps && candidate.encodedPath.endsWith(".mp4", true) && playerFiles.any { player ->
                    player.host == candidate.host && player.pathSegments.last() == candidate.pathSegments.last()
                }
            }
        }
        val streams = (playerFiles + downloadFiles).distinct().map { Playback.Source(it.toString()) }
        return Playback.linksFromPage(
            name, mainUrl, document.baseUri(), document, streams, subtitleCallback, callback, useResolvedUrl = true,
        )
    }

    private fun playerScripts(document: Document) = document.select(".video-container script").map { it.data() }

    private fun parse(field: Regex, script: String): String? = field.find(script)?.groupValues?.get(1)?.let {
        runCatching { JSONTokener(it).nextValue() as? String }.getOrNull()
    }

    private fun normalize(value: String) = value.lowercase(Locale.ROOT).replace('ё', 'е')

    private companion object {
        const val queryKey = "_ce_search"
        const val routeKey = "_ce_route"
        val pageSuffix = Regex("""-(\d+)$""")
        val pagePath = Regex("""/c/[^/]+-[0-9]+\.html""")
        val word = Regex("""[\p{L}\p{N}]+""")
        val playerFile = Regex("""\bnew\s+Playerjs\s*\(\s*\{[^}]*?\bfile\s*:\s*("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')""")
        val posterField = Regex("""\.api\(\s*["']poster["']\s*,\s*("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')""")
    }
}
