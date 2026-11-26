package com.byayzen

import com.cloudextensions.russian.VideoScores
import com.cloudextensions.russian.ContentPolicy
import com.cloudextensions.russian.SearchMetadataSource
import com.cloudextensions.russian.SearchPolicy
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.*
import com.cloudextensions.russian.EPornerPlayer
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.applyVideoDuration
import com.lagradost.cloudstream3.LoadResponse.Companion.addActors
import com.lagradost.cloudstream3.utils.*
import org.jsoup.nodes.Element
import org.jsoup.nodes.Document
import com.cloudextensions.russian.Metadata
import okhttp3.HttpUrl.Companion.toHttpUrl

class EPorner : MainAPI(), SearchPolicy, SearchMetadataSource {
    override val requiresListingReview = true

    private fun metadata(document: Document): VideoDetail = VideoDetail(
        title = document.selectFirst("h1")?.text().orEmpty(),
        poster = null,
        description = document.selectFirst("#video-description, .video-description")?.text().orEmpty(),
        tags = document.select("div#video-info-tags ul li.vit-category a, div#video-info-tags ul li.vit-tag a").map { it.text() },
        duration = "",
        year = null,
    )

    override suspend fun searchMetadata(url: String): VideoDetail =
        metadata(Network.page(PageRequest(url), mainUrl))

    override var mainUrl = "https://www.eporner.com"
    override var name = "EPorner"
    override val hasMainPage = true
    override var lang = "en"
    override val hasQuickSearch = false
    override val supportedTypes = setOf(TvType.NSFW)

    override val mainPage = mainPageOf(
        "$mainUrl/" to "Most recent",
        "$mainUrl/most-viewed/" to "Most viewed",
        "$mainUrl/top-rated/" to "Top rated",
        "$mainUrl/longest/" to "Longest",
        "$mainUrl/tag/cowgirl/" to "Cowgirl",
        "$mainUrl/tag/riding/" to "Riding",
        "$mainUrl/tag/turkish/" to "Turkish",
        "$mainUrl/cat/housewives/" to "Housewives"

    )

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val url = if (page <= 1) request.data else "${request.data.removeSuffix("/")}/$page/"
        val home = app.get(url).document.select("div#vidresults div.mb").mapNotNull { it.toSearchResult() }
        return newHomePageResponse(HomePageList(request.name, home, true), true)
    }

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val term = Metadata.clean(query).replace(' ', '-')
        if (term.isBlank() || page < 1) return newSearchResponseList(emptyList(), false)
        val address = mainUrl.toHttpUrl().newBuilder().addPathSegment("search").addPathSegment(term)
        if (page > 1) address.addPathSegment(page.toString())
        val request = PageRequest(address.addPathSegment("").build().toString(), allowNotFound = true)
        val document = Network.page(request, mainUrl)
        if (Metadata.emptySearch(document, request)) return newSearchResponseList(emptyList(), false)
        val results = document.select("#vidresults .mb").mapNotNull { it.toSearchResult() }
        return newSearchResponseList(results, results.isNotEmpty() && document.select(
            "a[rel=next], .pagination a[href], .paginationlist a[href], #pagination a[href], .numlist2 a[href]",
        ).any { it.attr("rel") == "next" || it.text().trim().toIntOrNull() == page + 1 })
    }

    private fun Element.toSearchResult(): SearchResponse? {
        val titleElement = this.selectFirst("p.mbtit a") ?: return null
        val img = this.selectFirst("div.mbimg img")

        val poster = fixUrlNull(
            img?.attr("data-src")?.takeIf { it.isNotEmpty() && !it.startsWith("data:") }
                ?: img?.attr("src")
        )

        return newMovieSearchResponse(
            titleElement.text(),
            fixUrl(titleElement.attr("href")),
            TvType.NSFW
        ) {
            this.posterUrl = poster
            score = VideoScores.card("EPorner", url, this@toSearchResult)
        }
    }


    override suspend fun quickSearch(query: String): List<SearchResponse>? = search(query)

    override suspend fun load(url: String): LoadResponse? {
        val document = com.cloudextensions.russian.Network.page(com.cloudextensions.russian.PageRequest(url),mainUrl)
        val detail = metadata(document)
        val title = detail.title.takeIf(String::isNotBlank) ?: return null
        if (!ContentPolicy.accepts(title, detail.tags, detail.description, "EPorner")) {
            throw ErrorLoadingException("Видео скрыто фильтром категорий")
        }
        val poster = fixUrlNull(
            document.selectFirst("meta[property=og:image]")?.attr("content")
                ?: document.selectFirst("video#EPvideo")?.attr("poster")
        )
        val year = document.selectFirst("span.C a")?.text()?.trim()?.toIntOrNull()
        val duration = document.selectFirst("span.vid-length")?.text()?.trim()
        val exactDuration = if (duration?.all(Char::isDigit) == true) "$duration min" else duration
        val recommendations =
            document.select("div#relateddiv div.mb").mapNotNull { it.toRecommendationResult() }
        val actors = document.select("span.valor a").map { Actor(it.text()) }

        return newMovieLoadResponse(title, url, TvType.NSFW, url) {
            score = VideoScores.detail("EPorner",url,document)
            this.posterUrl = poster
            this.plot = detail.description
            this.year = year
            this.tags = detail.tags
            applyVideoDuration(exactDuration)
            this.recommendations = recommendations
            addActors(actors)
        }
    }

    private fun Element.toRecommendationResult(): SearchResponse? {
        val titleElement = this.selectFirst("p.mbtit a") ?: return null
        val posterUrl = com.cloudextensions.russian.Metadata.poster(this,mainUrl) ?: fixUrlNull(
            this.selectFirst("div.mbimg img")?.attr("data-src") ?: this.selectFirst("div.mbimg img")
                ?.attr("src")
        )
        return newMovieSearchResponse(
            titleElement.text(),
            fixUrl(titleElement.attr("href")),
            TvType.NSFW
        ) {
            this.posterUrl = posterUrl
            score = VideoScores.card("EPorner", url, this@toRecommendationResult)
        }
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val url = fixUrl(data)
        val page = Network.page(PageRequest(url), mainUrl)
        val sources = EPornerPlayer.sources(page)
        return Playback.linksFromPage(name, mainUrl, url, page, sources, subtitleCallback, callback)
    }
}
