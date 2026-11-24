package com.cloudextensions.sites

import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
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
    private val searchPage = Regex("""(/ru/search/[A-Za-z0-9_+-]+/popular/)([0-9]+)/""")

    override suspend fun searchRequest(term: String): PageRequest {
        val token = term.encodeUtf8().base64Url().trimEnd('=')
        return PageRequest(mainUrl.toHttpUrl().newBuilder()
            .encodedPath("/ru/search/$token/popular/1/").build().toString())
    }

    override suspend fun page(request: PageRequest): Document {
        val original = super.page(request.copy(
            headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE),
        ))
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
