package com.cloudextensions.sites

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SearchResponse
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
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
    override val requiresListingReview = true
    override val includeTaxonomyResults = false

    private val catalogueAgent =
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/search/")
            .addPathSegment(term.replace(' ', '+')).build().toString())

    override suspend fun page(request: PageRequest): Document {
        val requested = request.url.toHttpUrlOrNull()
        val section = requested?.pathSegments?.firstOrNull()
        val headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)
        val catalogueHeaders = if (section in setOf("best", "newest", "search")) {
            headers + ("User-Agent" to catalogueAgent)
        } else headers
        val original = super.page(request.copy(headers = catalogueHeaders))
        if (section != "search") return original
        val result = Document.createShell(request.url)
        result.attr("data-response-code", original.attr("data-response-code"))
        val address = original.baseUri().toHttpUrlOrNull() ?: return result
        if (Metadata.emptySearch(original, request) || address.encodedPath.trimEnd('/') != requested.encodedPath.trimEnd('/')) return result
        val state = EmbeddedPlayers.initials(original) ?: return result
        val items = SearchListingEvidence.xHamsterResults(state) ?: return result
        result.setBaseUri(original.baseUri())
        val listing = result.body().appendElement("section").attr("id", "cloudextensions-video-results")
        for (i in 0 until items.length()) {
            val item = items.optJSONObject(i) ?: continue
            if (item.optString("videoType") != "video") continue
            val url = address.resolve(item.optString("pageURL")) ?: continue
            if (url.host !in setOf("ru.xhamster.com", "xhamster.com") || !url.encodedPath.startsWith("/videos/")) continue
            val title = item.optString("title").takeIf(Metadata::sourceValue) ?: continue
            val card = listing.appendElement("article").addClass("video-thumb").attr("data-video-type", "video")
            val link = card.appendElement("a").addClass("video-thumb__image-container")
                .attr("href", url.toString()).attr("title", title)
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

    private val descriptionBoundary = Regex("""(?<=[.!?])\s+|[\r\n]+""")
    private val advertising = Regex(
        """(?iu)\b(?:https?://|www\.|xhamster\.[a-z]+|xhamsterlive|onlyfans\.com|мой телеграм|ссылка в профиле|link in (?:my )?(?:bio|profile)|follow me (?:on|at)|подпишись|подписывайтесь|промокод)""",
    )

    override fun readMetadata(document: Document): VideoDetail {
        val metadata = AggregatorPages.detail(document, spec)
        val description = metadata.description.split(descriptionBoundary)
            .filterNot(advertising::containsMatchIn).joinToString(" ").trim()
        val detail = metadata.copy(description = description)
        val address = document.baseUri().toHttpUrlOrNull() ?: return detail
        val video = EmbeddedPlayers.initials(document)?.optJSONObject("videoEntity") ?: return detail
        val identity = video.optString("idHashSlug").takeIf(String::isNotBlank) ?: return detail
        val slug = address.pathSegments.lastOrNull(String::isNotBlank).orEmpty()
        if (slug != identity && !slug.endsWith("-$identity")) return detail
        val title = Metadata.title(document.baseUri(), listOf(video.optString("title"), detail.title), "ru", fromDetail = true)
        return detail.copy(title = title.ifBlank { detail.title })
    }

    override suspend fun related(document: Document, detail: VideoDetail, url: String): List<SearchResponse> =
        document.select(spec.related).flatMap { Metadata.cards(it, spec) }
            .distinctBy { it.url }.filterNot { it.url == url }.map(::response)

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        return Playback.linksFromPage(name, mainUrl, data, document, emptyList(), subtitleCallback, callback)
    }
}
