package com.byayzen

import com.lagradost.cloudstream3.*
import com.cloudextensions.russian.EPornerPlayer
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.applyVideoDuration
import com.lagradost.cloudstream3.LoadResponse.Companion.addActors
import com.lagradost.cloudstream3.utils.*
import org.jsoup.nodes.Element

class EPorner : MainAPI() {
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
        val formattedQuery = query.replace(" ", "-")
        val url = if (page <= 1) "$mainUrl/search/$formattedQuery/" else "$mainUrl/search/$formattedQuery/$page/"
        val results = app.get(url).document.select("div#vidresults div.mb").mapNotNull { it.toSearchResult() }
        return newSearchResponseList(results, true)
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
        }
    }


    override suspend fun quickSearch(query: String): List<SearchResponse>? = search(query)

    override suspend fun load(url: String): LoadResponse? {
        val document = com.cloudextensions.russian.Network.page(com.cloudextensions.russian.PageRequest(url),mainUrl)
        val title = document.selectFirst("h1")?.text()?.trim() ?: return null
        val poster = fixUrlNull(
            document.selectFirst("meta[property=og:image]")?.attr("content")
                ?: document.selectFirst("video#EPvideo")?.attr("poster")
        )
        val tags = document.select("div#video-info-tags ul li.vit-category a, div#video-info-tags ul li.vit-tag a").map { it.text() }
        val year = document.selectFirst("span.C a")?.text()?.trim()?.toIntOrNull()
        val duration = document.selectFirst("span.vid-length")?.text()?.trim()
        val exactDuration = if (duration?.all(Char::isDigit) == true) "$duration min" else duration
        val description =
            document.selectFirst("#video-description, .video-description")?.text()?.trim()
        val recommendations =
            document.select("div#relateddiv div.mb").mapNotNull { it.toRecommendationResult() }
        val actors = document.select("span.valor a").map { Actor(it.text()) }

        return newMovieLoadResponse(title, url, TvType.NSFW, url) {
            this.posterUrl = poster
            this.plot = description
            this.year = year
            this.tags = tags
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
