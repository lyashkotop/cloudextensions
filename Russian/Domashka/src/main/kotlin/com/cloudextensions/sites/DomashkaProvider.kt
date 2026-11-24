package com.cloudextensions.sites

import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.PosterSource
import com.cloudextensions.russian.RequestLimits
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.Translation
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.LoadResponse
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.newExtractorLink
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

class DomashkaProvider : RussianProvider(
    SiteSpec(
        id = "Domashka",
        title = "1. Domashka.live",
        origin = "https://domashka.live",
        cards = ".thumb[data-vw]:has(a.thumb__preview[href^=/][href$=.html])",
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
), PosterSource {
    override val includeTaxonomyResults = false

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/search/").addQueryParameter("q", term).build().toString())

    private suspend fun fetch(request: PageRequest): Document =
        super.page(request.copy(headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)))

    override suspend fun page(request: PageRequest): Document {
        val document = fetch(request).clone()
        document.select(".thumb__preview img[src*=/assets/img/no-image.png]").removeAttr("src")
        document.select(".thumb .thumb-tags a.thumb-tags__link[href]").attr("rel", "tag")
        val cards = document.select(".thumb[data-vw]:has(a.thumb__preview[href^=/ex/])")
            .mapNotNull { card ->
                val image = card.selectFirst(".thumb__preview img[alt]") ?: return@mapNotNull null
                val title = Metadata.clean(image.attr("alt"))
                if (title.any { it in 'A'..'Z' || it in 'a'..'z' } && !cyrillic.containsMatchIn(title)) image to title
                else null
            }
        val titles = cards.map { it.second }.distinct()
        val translated = RequestLimits.optional(4500) {
            coroutineScope {
                titles.chunked(8).map { batch ->
                    async {
                        val result = Translation.text(batch.joinToString("\n"), "ru")?.lines()?.map(String::trim)
                        if (result == null || result.size != batch.size) emptyList()
                        else batch.zip(result).filter { (_, title) -> cyrillic.containsMatchIn(title) }
                    }
                }.awaitAll().flatten().toMap()
            }
        }.orEmpty()
        for ((image, title) in cards) {
            translated[title]?.let { image.attr("alt", it) }
        }
        return document
    }

    private fun playerPoster(document: Document): String? =
        document.selectFirst("main .split-player__left .player video[poster]")
            ?.absUrl("poster")?.toHttpUrlOrNull()
            ?.takeIf { it.host == "ic.pckcdn.net" && it.encodedPath.startsWith("/i/") }
            ?.toString()

    override suspend fun resolvePoster(url: String, poster: String?, headers: Map<String, String>): String? =
        poster ?: playerPoster(fetch(PageRequest(url)))

    override suspend fun load(url: String): LoadResponse {
        val document = page(PageRequest(url))
        val detail = loadDocument(url, document)
        playerPoster(document)?.let { poster ->
            Metadata.rememberPoster(url, poster)
            detail.posterUrl = poster
        }
        return detail
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

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = fetch(PageRequest(data))
        val source = document.selectFirst("main .split-player__left .player video[src]")
            ?.absUrl("src")?.toHttpUrlOrNull()
            ?.takeIf { it.host == "vc.pckcdn.net" && it.encodedPath.startsWith("/video/") }
        if (source != null) {
            // Short CDN directory IDs can be "AD". The actual player element identifies this as media.
            val url = source.toString()
            val link = newExtractorLink(name, name, url, Playback.streamType(url)) {
                referer = document.baseUri()
                headers = Network.headers(referer)
            }
            if (Playback.checkDirectLink(link) != false) {
                callback(link)
                return true
            }
        }
        return Playback.linksFromPage(name, mainUrl, data, document, emptyList(), subtitleCallback, callback)
    }

    private companion object {
        val cyrillic = Regex("""\p{IsCyrillic}""")
        val timePart = Regex("""(?iu)(\d+)\s*(час\p{L}*|минут\p{L}*|секунд\p{L}*)""")
    }
}
