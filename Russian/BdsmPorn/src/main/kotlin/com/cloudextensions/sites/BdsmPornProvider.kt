package com.cloudextensions.sites

import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RequestLimits
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.MainPageRequest
import com.lagradost.cloudstream3.SearchResponseList
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.newSearchResponseList
import java.util.Locale
import kotlinx.coroutines.CancellationException
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.newExtractorLink
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

class BdsmPornProvider : RussianProvider(
    SiteSpec(
        id = "BdsmPorn",
        title = "1. BDSM-Porn.cc",
        origin = "https://ru.bdsm-porn.cc",
        cards = ".video:has(> a[href^=/video/])",
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
        PageRequest(mainUrl.toHttpUrl().newBuilder()
            .encodedPath("/search").query(null).addQueryParameter("q", term).build().toString())

    private val guyTitle = Regex("""(?iu)(?<![\p{L}\p{N}])(?:пар(?:ень|ня|ню|нем|не|ни|ней|ням|нями|нях)|guys?)(?![\p{L}\p{N}])""")
    private val slaveTitle = Regex("""(?iu)(?<![\p{L}\p{N}])(?:рабын(?:я|и|ю|ей|ь|ям|ями|ях)|slaves?)(?![\p{L}\p{N}])""")

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val section = when (Metadata.clean(query).lowercase(Locale.ROOT)) {
            "парень", "guy" -> "/videos" to guyTitle
            "рабыня", "рабыни", "slave", "slaves" -> "/bdsm" to slaveTitle
            else -> return super.search(query, page)
        }
        if (page < 1) return newSearchResponseList(emptyList(), false)
        val original = try {
            Result.success(super.search(query, page))
        } catch (error: CancellationException) {
            throw error
        } catch (error: Exception) {
            Result.failure(error)
        }
        val response = original.getOrNull()
        if (response != null && (response.items.isNotEmpty() || response.hasNext)) return response

        val catalogue = RequestLimits.optional(4000) {
            val request = MainPageRequest(section.first, section.first, sequentialMainPage)
            val first = getMainPage(page * 2 - 1, request)
            val next = if (first.hasNext) getMainPage(page * 2, request) else null
            val matches = (first.items + next?.items.orEmpty()).flatMap { it.list }
                .filter { section.second.containsMatchIn(it.name) }
                .distinctBy { it.url }
            newSearchResponseList(matches, next?.hasNext == true)
        }
        if (catalogue != null && (catalogue.items.isNotEmpty() || catalogue.hasNext)) return catalogue
        return original.getOrThrow()
    }

    override suspend fun page(request: PageRequest): Document {
        val localized = request.copy(headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE))
        val document = super.page(localized)
        return document.clone().apply {
            selectFirst(".video-header h1")?.children()?.remove()
            nextPage(this)?.let { (anchor, next) ->
                anchor.attr("rel", "next").attr("href", next.toString())
            }
        }
    }

    private fun nextPage(document: Document): Pair<org.jsoup.nodes.Element, HttpUrl>? {
        val address = document.baseUri().toHttpUrl()
        val current = address.queryParameter("page")?.toIntOrNull() ?: 1
        val query = address.queryParameter("q")
        return document.select("a.pagenav[href]").firstNotNullOfOrNull { anchor ->
            val next = anchor.absUrl("href").toHttpUrlOrNull() ?: return@firstNotNullOfOrNull null
            if (next.host != address.host || next.encodedPath.trimEnd('/') != address.encodedPath.trimEnd('/') ||
                next.queryParameter("page")?.toIntOrNull() != current + 1
            ) return@firstNotNullOfOrNull null
            val outgoingQuery = next.queryParameter("q")
            if (outgoingQuery != null && outgoingQuery != query) return@firstNotNullOfOrNull null
            val resolved = if (query != null && outgoingQuery == null) {
                next.newBuilder().addQueryParameter("q", query).build()
            } else next
            anchor to resolved
        }
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
        val pageHost = document.baseUri().toHttpUrl().host
        val sources = document.select("video#player[src], video#player source[src]")
            .mapNotNull { it.absUrl("src").toHttpUrlOrNull() }
            .filter { it.host in setOf(pageHost, "bdsm-porn.cc", "ru.bdsm-porn.cc") && it.encodedPath.startsWith("/link_cs/") }
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

}
