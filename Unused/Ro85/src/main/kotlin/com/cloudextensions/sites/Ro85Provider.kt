package com.cloudextensions.sites

import com.cloudextensions.russian.ContentPolicy
import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.Translation
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.LoadResponse
import com.lagradost.cloudstream3.SearchResponseList
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.app
import com.lagradost.cloudstream3.newSearchResponseList
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.Cookie
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

class Ro85Provider(
    translate: suspend (String) -> String? = { Translation.text(it, "en") },
) : RussianProvider(SiteSpec(
    id = "Ro85",
    title = "85RO",
    origin = "https://www.85ro.com/en",
    cards = RO85_CARDS,
    link = "a[href*=/v/]",
    titleSelector = ".title",
    sections = listOf(
        Section("New videos", "/en/latest-updates/"),
        Section("Popular videos", "/en/most-popular/"),
        Section("Top rated videos", "/en/top-rated/"),
    ),
    searchMode = "path",
    tagSelector = RO85_TAGS,
    detailTitleSelector = ".headline-video h1",
)) {
    override var lang = "en"
    override val translateQueries = false
    private val english = Ro85English(translate)

    override suspend fun search(query: String, page: Int): SearchResponseList {
        if (ro85Excluded(query)) return newSearchResponseList(emptyList(), false)
        val term = english.query(query)
        if (term.isNullOrBlank() || ro85Excluded(term) || !ContentPolicy.accepts(term)) {
            return newSearchResponseList(emptyList(), false)
        }
        return super.search(term, page)
    }

    override suspend fun page(request: PageRequest): Document {
        val document = document(request)
        if (document.selectFirst(".headline-video h1") != null) checkDetail(document)
        return english.page(document)
    }

    private fun englishUrl(url: String): String {
        val current = url.toHttpUrlOrNull() ?: return url
        val host = mainUrl.toHttpUrlOrNull()?.host?.removePrefix("www.") ?: return url
        if (current.host.removePrefix("www.") != host) return url
        val path = current.encodedPath.trimStart('/')
        val first = path.substringBefore('/')
        if (first == "en") return url
        val rest = if (first in setOf("ja", "zh", "zh-hant", "zh-hans")) path.substringAfter('/', "") else path
        return current.newBuilder().encodedPath("/en/$rest").build().toString()
    }

    private suspend fun document(request: PageRequest): Document {
        val url = englishUrl(request.url)
        val target = url.toHttpUrlOrNull()
        val host = mainUrl.toHttpUrlOrNull()?.host?.removePrefix("www.")
        val headers = request.headers + ("Accept-Language" to "en-US,en;q=0.9")
        val referer = mainUrl.trimEnd('/') + "/"
        if (target == null || target.host.removePrefix("www.") != host) {
            return Network.page(request.copy(url = url, headers = headers), referer)
        }
        val jar = app.baseClient.cookieJar
        val cookies = jar.loadForRequest(target)
        val locale = Cookie.Builder().name("kt_lang").value("en")
            .domain(target.host.removePrefix("www.")).path("/").build()
        if (cookies.none { it.name == locale.name && it.value == locale.value && it.domain == locale.domain }) {
            jar.saveFromResponse(target, listOf(locale))
        }
        val session = (cookies.filterNot { it.name == locale.name } + locale)
            .joinToString("; ") { it.name + "=" + it.value }
        return Network.page(request.copy(url = url, headers = headers + ("Cookie" to session)), referer)
    }

    override suspend fun load(url: String): LoadResponse = super.load(englishUrl(url))

    override fun readMetadata(document: Document): VideoDetail {
        val tags = checkDetail(document)
        val detail = super.readMetadata(document)
        val description = document.selectFirst("meta[property=og:description]")?.attr("content")
            ?.takeUnless { it.equals("Default site description.", true) }
        return detail.copy(tags = tags, description = Metadata.description(description, detail.title))
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = document(PageRequest(data))
        checkDetail(document)
        // The player and download links can point at the same file with different query strings.
        val sources = Playback.sources(document)
            .sortedByDescending { !it.label.isNullOrBlank() }
            .distinctBy { it.url.substringBefore('?') }
        return Playback.linksFromPage(name, mainUrl, englishUrl(data), document, sources, subtitleCallback, callback)
    }

    private fun checkDetail(document: Document): List<String> {
        val title = document.selectFirst(".headline-video h1")?.text()
            ?: throw ErrorLoadingException("85RO video page is unavailable")
        val description = document.selectFirst("meta[property=og:description]")?.attr("content").orEmpty()
        val tags = ro85Tags(document)
        if ((sequenceOf(title, description) + tags).any(::ro85Excluded)) {
            throw ErrorLoadingException("Video hidden by category filter")
        }
        return tags
    }
}
