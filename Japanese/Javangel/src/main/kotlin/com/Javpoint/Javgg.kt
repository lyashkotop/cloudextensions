package com.Javpoint

import org.jsoup.nodes.Element
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*

class Javgg : MainAPI() {
    override var mainUrl = "https://javgg.net"
    override var name = "Javgg"
    override val hasMainPage = true
    override var lang = "ja"
    override val hasQuickSearch = false
    override val hasDownloadSupport = true
    override val supportedTypes = setOf(TvType.NSFW)
    override val vpnStatus = VPNStatus.MightBeNeeded

    override val mainPage = mainPageOf(
        "trending" to "Trending",
        "genre/stepmother" to "Stepmother",
        "genre/married-woman" to "Married Woman",
        "tag/english-subtitle" to "English Subtitle",
        "random" to "Random"
    )

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val url = "$mainUrl/${request.data}/page/$page"
        val document = app.get(url).document
        val home = document.select("div.items > article")
            .mapNotNull { it.toSearchResult() }
        return newHomePageResponse(
            list = HomePageList(
                name = request.name,
                list = home.distinctBy { it.url },
                isHorizontalImages = false
            ),
            hasNext = home.isNotEmpty()
        )
    }

    private fun Element.toSearchResult(): SearchResponse? {
        val linkElem = this.selectFirst("div.poster > a, a") ?: return null
        val href = fixUrlNull(linkElem.attr("href")) ?: return null
        val title = linkElem.attr("title").takeIf { it.isNotBlank() }
            ?: this.selectFirst("div.details a, h3, h2")?.text()
            ?: return null

        val img = this.selectFirst("div.poster img, img")
        val posterUrl = com.cloudextensions.russian.Metadata.poster(this,mainUrl) ?: fixUrlNull(
            img?.attr("data-src")?.takeIf { it.isNotBlank() }
                ?: img?.attr("src")?.takeIf { it.isNotBlank() }
        )
        return newMovieSearchResponse(title, href, TvType.NSFW) {
            this.posterUrl = posterUrl
            this.posterHeaders = com.cloudextensions.russian.Network.headers(mainUrl)
        }
    }

    private fun Element.toSearchingResult(): SearchResponse? {
        val linkElem = this.selectFirst("div.image a, div.details a, a") ?: return null
        val href = fixUrlNull(linkElem.attr("href")) ?: return null
        val title = this.selectFirst("div.details a")?.text()?.takeIf { it.isNotBlank() }
            ?: linkElem.attr("title").takeIf { it.isNotBlank() }
            ?: return null

        val img = this.selectFirst("div.image img, img")
        val posterUrl = com.cloudextensions.russian.Metadata.poster(this,mainUrl) ?: fixUrlNull(
            img?.attr("data-src")?.takeIf { it.isNotBlank() }
                ?: img?.attr("src")?.takeIf { it.isNotBlank() }
        )
        return newMovieSearchResponse(title, href, TvType.NSFW) {
            this.posterUrl = posterUrl
            this.posterHeaders = com.cloudextensions.russian.Network.headers(mainUrl)
        }
    }

    override suspend fun search(query: String): List<SearchResponse> = search(query, 1).items

    override suspend fun search(query: String, page: Int): SearchResponseList {

        val searchResponse = mutableListOf<SearchResponse>()
        val encoded = query.trim().replace(" ", "+")

        val i = page
        run {

            val document = app.get("$mainUrl/jav/page/$i?s=$encoded").document
            val results = document.select("article").mapNotNull { it.toSearchingResult() }
            val unique = results.filterNot { item -> searchResponse.any { it.url == item.url } }
            if (unique.isEmpty()) return@run
            searchResponse.addAll(unique)
        
        }
        val allowed = searchResponse.distinctBy { it.url }.filter { com.cloudextensions.russian.ContentPolicy.accepts(it.name) }
        return newSearchResponseList(allowed, searchResponse.isNotEmpty())
    }

    override suspend fun load(url: String): LoadResponse {
        val document = app.get(url).document

        val title = document.selectFirst("meta[property=og:title]")?.attr("content")?.trim()
            ?: document.title().substringBefore(" - JavGG").trim()
        val poster = fixUrlNull(document.selectFirst("meta[property=og:image]")?.attr("content"))
        val description = document.selectFirst("meta[property=og:description]")?.attr("content")?.trim()

        val tags = document.select("div.sgeneros a, a[href*='/genre/'], a[href*='/tag/']")
            .map { it.text().trim() }
            .filter { it.isNotBlank() }
            .distinct()

        val recommendations = document.select("div.items > article, div.related-posts article")
            .mapNotNull { it.toSearchResult() }
            .distinctBy { it.url }
            .filter { it.url != url }

        return newMovieLoadResponse(title, url, TvType.NSFW, url) {
            this.posterUrl = poster
            this.plot = description
            this.tags = tags
            this.recommendations = recommendations
        }
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val document = app.get(data).document
        val iframes = document.select("div.pframe iframe, iframe[src]")

        for (iframe in iframes) {
            val src = fixUrlNull(iframe.attr("src")) ?: continue
            if (src.contains("google") || src.contains("facebook")) continue

            runCatching {
                if ("javggvideo.xyz" in src) {
                    val scriptData = app.get(src).document.selectFirst("script:containsData(urlPlay)")?.data()
                    val playUrl = scriptData?.let { Regex("""urlPlay\s*=\s*'(.*?)'""").find(it)?.groupValues?.getOrNull(1) }
                    if (!playUrl.isNullOrBlank()) {
                        loadExtractor(playUrl, "$mainUrl/", subtitleCallback, callback)
                    }
                } else {
                    loadExtractor(src, "$mainUrl/", subtitleCallback, callback)
                }
            }
        }
        return true
    }
}
