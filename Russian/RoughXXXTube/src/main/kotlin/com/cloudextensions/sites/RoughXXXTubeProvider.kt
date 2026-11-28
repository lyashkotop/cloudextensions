package com.cloudextensions.sites

import com.cloudextensions.russian.Network
import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RequestLimits
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import kotlinx.coroutines.delay
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okio.ByteString.Companion.encodeUtf8
import org.jsoup.nodes.Document

class RoughXXXTubeProvider : RussianProvider(
    SiteSpec(
        id = "RoughXXXTube",
        title = "1. RoughXXXTube",
        origin = "https://roughxxxtube.net",
        cards = ".thumbs-wrap .thumb-item a.trd[href^=/ru/video/]:has(.thumb-image img)",
        link = "a.trd[href]",
        titleSelector = "p",
        detailTitleSelector = ".content > h1",
        durationSelector = ".video-duration",
        related = ".content > .thumbs-wrap",
        sections = listOf(
            Section("Новинки", "/ru/index/latest/1/"),
            Section("Популярное", "/ru/index/popular/1/"),
        ),
    ),
) {
    override val requiresListingReview = true

    private val videoPath = Regex("""/(?:ru|en)/video/(\d+)/?""")
    private val searchPage = Regex("""(/ru/search/[A-Za-z0-9_+-]+/popular/)([0-9]+)/""")

    override suspend fun searchRequest(term: String): PageRequest {
        // The source indexes this keyword as «русские»; its singular feminine form returns zero results.
        val indexedTerm = if (Metadata.clean(term).equals("русская", ignoreCase = true)) "русские" else term
        val token = indexedTerm.encodeUtf8().base64Url().trimEnd('=')
        return PageRequest(mainUrl.toHttpUrl().newBuilder()
            .encodedPath("/ru/search/$token/popular/1/").build().toString())
    }

    private fun matchesPage(document: Document, requested: String): Boolean {
        val actual = document.baseUri().toHttpUrlOrNull() ?: return false
        val expected = requested.toHttpUrlOrNull() ?: return false
        if (actual.host != expected.host) return false
        val requestedVideo = videoPath.matchEntire(expected.encodedPath)?.groupValues?.get(1)
        if (requestedVideo != null) {
            val actualVideo = videoPath.matchEntire(actual.encodedPath)?.groupValues?.get(1)
            return actualVideo == requestedVideo && (document.attr("data-response-code") in setOf("404", "410") ||
                (document.selectFirst(".content > h1") != null &&
                    document.selectFirst("video#my-player[src], video#my-player source[src]") != null))
        }
        val path = expected.encodedPath.trimEnd('/')
        if (path.isEmpty()) return actual.encodedPath.trimEnd('/') == "/ru"
        return actual.encodedPath.trimEnd('/') == path &&
            (document.attr("data-response-code") in setOf("404", "410") ||
                document.selectFirst(".content > h1") != null)
    }

    override suspend fun page(request: PageRequest): Document {
        val path = request.url.toHttpUrlOrNull()?.encodedPath.orEmpty()
        val video = videoPath.matches(path)
        val localized = request.copy(
            headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE),
            allowNotFound = request.allowNotFound || video,
        )
        fun unavailable(document: Document) = document.attr("data-response-code") in setOf("404", "410")

        if (video) {
            val primary = RequestLimits.optional(1_350) { super.page(localized) }
            if (primary != null && matchesPage(primary, request.url) && !unavailable(primary)) return primary
            val alternatePath = if (path.startsWith("/ru/")) path.replaceFirst("/ru/", "/en/") else path.replaceFirst("/en/", "/ru/")
            val alternate = localized.copy(url = localized.url.replace(path, alternatePath))
            val fallback = RequestLimits.optional(1_750) { super.page(alternate) }
            if (fallback != null && matchesPage(fallback, request.url) && !unavailable(fallback)) return fallback
            if (primary != null && fallback != null && unavailable(primary) && unavailable(fallback) &&
                matchesPage(primary, request.url) && matchesPage(fallback, request.url)) {
                if (request.allowNotFound) return primary
                throw ErrorLoadingException("Видео удалено или недоступно")
            }
            throw ErrorLoadingException("RoughXXXTube: не удалось подтвердить страницу видео")
        }

        var original = super.page(localized)
        if (!matchesPage(original, request.url)) {
            delay(120)
            original = super.page(localized.copy(headers = localized.headers + ("Cache-Control" to "no-cache")))
        }
        if (!matchesPage(original, request.url)) throw ErrorLoadingException("RoughXXXTube: сайт не вернул запрошенную страницу")
        val document = original.clone()
        val next = document.selectFirst(".more > a[href]")
        if (next != null) {
            next.attr("rel", "next")
        } else {
            val address = document.baseUri().toHttpUrlOrNull() ?: return document
            val match = searchPage.matchEntire(address.encodedPath) ?: return document
            val number = match.groupValues[2].toIntOrNull() ?: return document
            // Numbered search pages work even when the site omits the arrow on a full page.
            if (document.select(spec.cards).size == 100 && number < Int.MAX_VALUE) {
                document.head().appendElement("link").attr("rel", "next")
                    .attr("href", "${match.groupValues[1]}${number + 1}/")
            }
        }
        return document
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        return Playback.linksFromPage(name, mainUrl, document.baseUri(), document, emptyList(), subtitleCallback, callback)
    }

}
