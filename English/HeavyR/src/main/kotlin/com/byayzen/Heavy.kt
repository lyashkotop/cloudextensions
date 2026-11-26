// ! Bu araç @ByAyzen tarafından | @Cs-GizliKeyif için yazılmıştır.

package com.byayzen

import com.cloudextensions.russian.VideoScores
import com.cloudextensions.russian.ContentPolicy
import com.cloudextensions.russian.SearchMetadataSource
import com.cloudextensions.russian.SearchPolicy
import com.cloudextensions.russian.SearchListingEvidence
import com.cloudextensions.russian.VideoDetail
import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.MediaDuration
import com.cloudextensions.russian.applyVideoDuration
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.RequestLimits
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*

class Heavy : MainAPI(), SearchPolicy, SearchMetadataSource {
    override val requiresListingReview = true

    private fun metadata(document: Document): VideoDetail = VideoDetail(
        title = document.selectFirst("h1.video-title")?.text().orEmpty(),
        poster = null,
        description = document.selectFirst("div.video-data p")?.text().orEmpty(),
        tags = document.select("div.tags a[title]").map { it.text() },
        duration = "",
        year = null,
    )

    override suspend fun searchMetadata(url: String): VideoDetail =
        metadata(Network.page(PageRequest(url), mainUrl))

    override var mainUrl = "https://www.heavy-r.com"
    override var name = "Heavy-R"
    override val hasMainPage = true
    override var lang = "en"
    override val hasQuickSearch = false
    override val supportedTypes = setOf(TvType.NSFW)
    override val vpnStatus = VPNStatus.MightBeNeeded

    override val mainPage = mainPageOf(
        "${mainUrl}/free_porn/amateur.html" to "Amateur",
        "${mainUrl}/free_porn/anal.html" to "Anal",
        "${mainUrl}/free_porn/asian.html" to "Asian",
        "${mainUrl}/free_porn/ass.html" to "Ass",
        "${mainUrl}/free_porn/bdsm.html" to "BDSM",
        "${mainUrl}/free_porn/big-dick.html" to "Big Dick",
        "${mainUrl}/free_porn/big-tits.html" to "Big Tits",
        "${mainUrl}/free_porn/creampie.html" to "Creampie",
        //"${mainUrl}/free_porn/dp.html" to "DP",
        //"${mainUrl}/free_porn/fisting.html" to "Fisting",
        //"${mainUrl}/free_porn/hardcore.html" to "Hardcore",
        //"${mainUrl}/free_porn/lesbian.html" to "Lesbian",
        //"${mainUrl}/free_porn/milf.html" to "MILF"
    )

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val url = if (page <= 1) request.data else request.data.replaceSuffix(".html", "_${page - 1}.html")
        val document = Network.page(PageRequest(url, allowNotFound = true), mainUrl)
        val failed = document.attr("data-response-code") == "404"
        val home = if (failed) emptyList() else document.select("div.video-item").mapNotNull { it.toMainPageResult() }

        return newHomePageResponse(
            list = HomePageList(
                name = request.name,
                list = home,
                isHorizontalImages = true
            ),
            hasNext = home.isNotEmpty() && hasNextPage(document, page)
        )
    }

    private fun Element.toMainPageResult(): SearchResponse? {
        val title = this.selectFirst("h4.title a")?.text() ?: return null
        val href = fixUrlNull(this.selectFirst("h4.title a")?.attr("href")) ?: return null
        val posterurl = fixUrlNull(this.selectFirst("img")?.attr("src"))

        return newMovieSearchResponse(title, href, TvType.NSFW) {
            this.posterUrl = posterurl
        }
    }

    private fun String.replaceSuffix(suffix: String, replacement: String): String =
        if (endsWith(suffix)) removeSuffix(suffix) + replacement else this

    private fun hasNextPage(document: Document, page: Int): Boolean =
        document.select(".pagination a[href]").any { it.text().trim().toIntOrNull() == page + 1 || it.text().trim() == "Next" }

    private fun searchRequest(query: String, page: Int): PageRequest {
        val suffix = if (page == 1) "" else "_${page - 1}"
        val url = HttpUrl.Builder().apply {
            val origin = mainUrl.toHttpUrlOrNull() ?: throw ErrorLoadingException("Invalid Heavy-R URL")
            scheme(origin.scheme).host(origin.host).port(origin.port)
            addPathSegment("search").addPathSegment("$query$suffix.html")
        }.build()
        return PageRequest(url.toString(), allowNotFound = true)
    }

    private fun searchCards(document: Document): List<SearchResponse> {
        val host = document.baseUri().toHttpUrlOrNull()?.host?.removePrefix("www.")
        return document.select(".body-content .row.display-flex div.video-item").mapNotNull { it.toMainPageResult() }
            .filter {
                val url = it.url.toHttpUrlOrNull()
                url != null && url.host.removePrefix("www.") == host &&
                    url.pathSegments.firstOrNull() == "video" && url.pathSegments.getOrNull(1)?.toLongOrNull() != null
            }.distinctBy { videoId(it) }
    }

    private fun videoId(card: SearchResponse): String? = card.url.toHttpUrlOrNull()?.pathSegments?.getOrNull(1)

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val term = Metadata.clean(query).replace(' ', '-')
        val empty = newSearchResponseList(emptyList(), false)
        if (term.isBlank() || page < 1) return empty
        val request = searchRequest(term, page)
        val document = Network.page(request, mainUrl)
        val actual = document.baseUri().toHttpUrlOrNull()
        val expected = request.url.toHttpUrlOrNull()
        if (Metadata.emptySearch(document, request) || actual?.encodedPath != expected?.encodedPath) return empty
        val results = searchCards(document)
        if (results.isEmpty()) return empty
        val next = hasNextPage(document, page)
        if (next || results.size < 12) return newSearchResponseList(results, next)

        // The no-match grid rotates a few latest uploads even across simultaneous requests.
        val referenceIds = RequestLimits.optional(2500) {
            val fallback = Network.page(searchRequest("zzqnomatch928", 1), mainUrl)
            searchCards(fallback).mapNotNull(::videoId).toSet()
        }.orEmpty()
        if (SearchListingEvidence.heavyRIsFallback(results.mapNotNull(::videoId).toSet(), referenceIds)) return empty
        // An unpaginated 24-card grid is ambiguous when the comparison page is unavailable or has rotated.
        val confirmed = if (results.size == 24) results.filter { SearchListingEvidence.matchesTitle(it.name, term) } else results
        return newSearchResponseList(confirmed, false)
    }

    override suspend fun search(query: String): List<SearchResponse> = search(query, 1).items

    override suspend fun quickSearch(query: String): List<SearchResponse>? = search(query)

    override suspend fun load(url: String): LoadResponse? {
        val document = com.cloudextensions.russian.Network.page(com.cloudextensions.russian.PageRequest(url),mainUrl)

        val detail = metadata(document)
        val title = detail.title.takeIf(String::isNotBlank) ?: return null
        if (!ContentPolicy.accepts(title, detail.tags, detail.description, "HeavyR")) {
            throw ErrorLoadingException("Видео скрыто фильтром категорий")
        }
        val poster = fixUrlNull(document.selectFirst("meta[property=\"og:image\"]")?.attr("content"))
        val media = document.selectFirst("video#video-file source[type=video/mp4][src]")?.absUrl("src")
        val seconds = MediaDuration.fromMp4(media, document.baseUri())

        val recommendations = document.select("div.recent-uploads a.item").mapNotNull {
            it.toRecommendationResult()
        }.distinctBy { it.url }.filter { it.url != url }

        return newMovieLoadResponse(title, url, TvType.NSFW, url) {
            applyVideoDuration(seconds)
            score = VideoScores.detail("HeavyR",url,document)
            this.posterUrl = poster
            this.plot = detail.description
            this.tags = detail.tags
            this.recommendations = recommendations
        }
    }

    private fun Element.toRecommendationResult(): SearchResponse? {
        val title = this.selectFirst("span.title")?.text() ?: return null
        val href = fixUrlNull(this.attr("href")) ?: return null
        val posterurl = fixUrlNull(this.selectFirst("img")?.attr("src"))

        return newMovieSearchResponse(title, href, TvType.NSFW) {
            this.posterUrl = posterurl
        }
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val document = app.get(data).document
        document.select("video#video-file source").forEach { source ->
            val videourl = source.attr("src")
            if (videourl.isNotBlank()) {
                callback(
                    newExtractorLink(
                        this.name,
                        this.name,
                        videourl,
                        type = INFER_TYPE
                    ) {
                        this.referer = "${mainUrl}/"
                    }
                )
            }
        }

        return true
    }
}
