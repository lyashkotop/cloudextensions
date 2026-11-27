package com.cloudextensions.sites

import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.RequestLimits
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.lagradost.cloudstream3.ErrorLoadingException
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
    private val videoPath = Regex("""/(?:ru|en)/video/(\d+)/?""")
    private val searchPage = Regex("""(/ru/search/[A-Za-z0-9_+-]+/popular/)([0-9]+)/""")

    override suspend fun searchRequest(term: String): PageRequest {
        val token = term.encodeUtf8().base64Url().trimEnd('=')
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
                document.selectFirst(".content > h1, video#my-player source[src]") != null)
        }
        val path = expected.encodedPath.trimEnd('/')
        if (path.isEmpty()) return actual.encodedPath.trimEnd('/') == "/ru"
        return actual.encodedPath.trimEnd('/') == path &&
            (document.attr("data-response-code") in setOf("404", "410") ||
                document.selectFirst(".content > h1") != null)
    }

    override suspend fun page(request: PageRequest): Document {
        val localized = request.copy(headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE))
        var original = super.page(localized)
        if (!matchesPage(original, request.url)) {
            delay(120)
            original = super.page(localized.copy(headers = localized.headers + ("Cache-Control" to "no-cache")))
            if (!matchesPage(original, request.url)) {
                val path = request.url.toHttpUrlOrNull()?.encodedPath.orEmpty()
                if (videoPath.matches(path)) {
                    val otherLanguage = if (path.startsWith("/ru/")) "en" else "ru"
                    val alternative = localized.copy(url = localized.url.replace(path, "/$otherLanguage/video/" + path.substringAfter("/video/")),
                        allowNotFound = true)
                    val fallback = RequestLimits.optional(2200) { super.page(alternative) }
                    if (fallback != null && matchesPage(fallback, request.url) &&
                        fallback.attr("data-response-code") !in setOf("404", "410")) return fallback
                    throw ErrorLoadingException("RoughXXXTube: сайт не вернул страницу видео")
                }
                throw ErrorLoadingException("RoughXXXTube: сайт не вернул запрошенную страницу")
            }
        }
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
}
