package com.cloudextensions.sites

import com.cloudextensions.russian.*
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

class XHamsterProvider : RussianProvider(
    SiteSpec(
        id = "XHamster",
        title = "1. xHamster",
        origin = "https://ru.xhamster.com",
        cards = ".video-thumb[data-video-type=video]:has(a.video-thumb__image-container[href])",
        link = "a.video-thumb__image-container[href]",
        titleSelector = ".video-thumb-info__name",
        detailTitleSelector = "main h1, h1",
        durationSelector = "[itemprop=duration]",
        titleLanguage = "ru",
        related = ".thumb-list--related",
        searchContainer = "#cloudextensions-video-results",
        sections = listOf(Section("Популярное", "/best"), Section("Новинки", "/newest")),
    ),
) {
    private val catalogueAgent =
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/search/")
            .addPathSegment(term.replace(' ', '+')).build().toString())

    override suspend fun page(request: PageRequest): Document {
        val section = request.url.toHttpUrlOrNull()?.pathSegments?.firstOrNull()
        val headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)
        val catalogueHeaders = if (section == "best" || section == "newest") {
            headers + ("User-Agent" to catalogueAgent)
        } else headers
        val original = super.page(request.copy(headers = catalogueHeaders))
        val address = original.baseUri().toHttpUrlOrNull() ?: return original
        if (!address.encodedPath.startsWith("/search/")) return original
        val state = EmbeddedPlayers.initials(original) ?: return original
        val items = state.optJSONObject("searchResult")?.optJSONArray("videoThumbProps") ?: return original
        val result = Document.createShell(original.baseUri())
        result.attr("data-response-code", original.attr("data-response-code"))
        val listing = result.body().appendElement("section").attr("id", "cloudextensions-video-results")
        for (i in 0 until items.length()) {
            val item = items.optJSONObject(i) ?: continue
            if (item.optString("videoType") != "video") continue
            val url = address.resolve(item.optString("pageURL")) ?: continue
            if (url.host !in setOf("ru.xhamster.com", "xhamster.com") || !url.encodedPath.startsWith("/videos/")) continue
            val title = item.optString("title").takeIf(Metadata::sourceValue) ?: continue
            val card = listing.appendElement("article").addClass("video-thumb").attr("data-video-type", "video")
            val link = card.appendElement("a").addClass("video-thumb__image-container")
                .attr("href", url.newBuilder().host(address.host).build().toString()).attr("title", title)
            link.appendElement("img").attr("src", item.optString("imageURL").ifBlank { item.optString("thumbURL") })
                .attr("alt", title)
            card.appendElement("span").attr("data-duration", item.optString("duration"))
        }
        val pagination = state.optJSONObject("pagination")
        val nextPage = pagination?.optInt("next") ?: 0
        val template = pagination?.optString("pageLinkTemplate").orEmpty()
        val nextUrl = template.replace("{#}", nextPage.toString()).toHttpUrlOrNull()
        if (nextPage > (pagination?.optInt("active") ?: 0) && nextUrl != null && nextUrl.host == address.host &&
            nextUrl.encodedPath == address.encodedPath
        ) listing.appendElement("a").attr("rel", "next").attr("href", nextUrl.toString())
        return result
    }

    override fun readMetadata(document: Document): VideoDetail = AggregatorPages.detail(document, spec)
}
