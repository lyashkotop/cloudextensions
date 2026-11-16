package com.byayzen

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.LoadResponse.Companion.addActors
import com.lagradost.cloudstream3.LoadResponse.Companion.addTrailer
import com.lagradost.cloudstream3.utils.*
import org.jsoup.nodes.Element

class xVideos : MainAPI() {
    override var mainUrl = "https://www.xvideos.com"
    override var name = "xVideos"
    override val hasMainPage = true
    override var lang = "en"
    override val supportedTypes = setOf(TvType.NSFW)

    private fun String.fixUrl(): String {
        return when {
            startsWith("//") -> "https:$this"
            startsWith("/") -> "$mainUrl$this"
            else -> this
        }
    }

    private fun Element.toSearchResponse(): SearchResponse? {
        val titleElement = this.selectFirst("p.title a") ?: return null
        val title = titleElement.attr("title").ifBlank { titleElement.text() }
        val originalHref = titleElement.attr("href") ?: return null

        val urlCleanRegex = Regex("^(/video\\.[^/]+)/[^/]+/[^/]+/(.+)$")
        val matchResult = urlCleanRegex.find(originalHref)

        val cleanedHref = if (matchResult != null && matchResult.groupValues.size == 3) {
            "${matchResult.groupValues[1]}/${matchResult.groupValues[2]}"
        } else {
            originalHref
        }

        val fullUrl = cleanedHref.fixUrl()
        val imgTag = this.selectFirst("div.thumb a img")
        val posterUrl = com.cloudextensions.russian.Metadata.poster(this,mainUrl) ?: (imgTag?.attr("data-src")?.takeIf { it.isNotBlank() && !it.contains("lightbox-blank") }
            ?: imgTag?.attr("src")?.takeIf { it.isNotBlank() && !it.contains("lightbox-blank") })?.fixUrl()

        return newMovieSearchResponse(title, fullUrl, TvType.NSFW) {
            this.posterUrl = posterUrl
            if (!posterUrl.isNullOrBlank()) {
                this.posterHeaders = mapOf("Referer" to mainUrl)
            }
        }
    }

    override val mainPage = mainPageOf(
        "$mainUrl/" to "Latest", "$mainUrl/best" to "Top rated",
        "$mainUrl/c/Amateur-65" to "Amateur", "$mainUrl/c/Lesbian-26" to "Lesbian"
    )
    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val base=request.data.trimEnd('/')
        val url=if(page==1)request.data else if(base==mainUrl)"$mainUrl/new/${page-1}" else "$base/${page-1}"
        val document=app.get(url).document
        val items=document.select("div.mozaique div.thumb-block").mapNotNull { it.toSearchResponse() }
        return newHomePageResponse(HomePageList(request.name,items,true),items.isNotEmpty())
    }

    override suspend fun search(query: String): List<SearchResponse> = search(query,1).items

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val encodedQuery=java.net.URLEncoder.encode(query,"UTF-8").replace("+","%20")
        val res = app.get("$mainUrl/?k=${encodedQuery}&p=${page - 1}").document
            .select("div.mozaique div.thumb-block").mapNotNull { it.toSearchResponse() }
        return newSearchResponseList(res, res.isNotEmpty())
    }

    override suspend fun load(url: String): LoadResponse? {
        val d = com.cloudextensions.russian.Network.page(com.cloudextensions.russian.PageRequest(url),mainUrl)
        val title = d.selectFirst("h2.page-title")?.ownText()?.trim()
            ?: d.selectFirst("meta[property=og:title]")?.attr("content") ?: return null

        val poster = d.selectFirst("meta[property=og:image]")?.attr("content")?.fixUrl()
        val description = d.selectFirst("div.video-description-text")?.text()

        val tags = d.select("div.video-tags-list li a.is-keyword").map { it.text() }.filter { it.isNotBlank() }
        val uploaderName = d.selectFirst("li.main-uploader a.uploader-tag span.name")?.text()
        val models = d.select("li.model span.name").map { it.text() }.filter { it.isNotBlank() }

        val recs = mutableListOf<SearchResponse>()
        val scriptContent = d.select("script").find { it.html().contains("var video_related") }?.html()
        if (scriptContent != null) {
            val itemRegex = Regex("""\{\s*"id":\s*\d+.*?,"u"\s*:\s*"(.*?)",\s*"i"\s*:\s*"(.*?)",.*?tf"\s*:\s*"(.*?)".*?\}""")
            itemRegex.findAll(scriptContent).forEach { itemMatch ->
                val recHref = itemMatch.groupValues[1].replace("\\/", "/").fixUrl()
                val recImage = itemMatch.groupValues[2].replace("\\/", "/").fixUrl()
                val recTitle = unescapeUnicode(itemMatch.groupValues[3].replace("\\/", "/"))

                recs.add(newMovieSearchResponse(recTitle, recHref, TvType.NSFW) {
                    this.posterUrl = recImage
                    if (!this.posterUrl.isNullOrBlank()) this.posterHeaders = mapOf("Referer" to mainUrl)
                })
            }
        }

        return newMovieLoadResponse(title, url, TvType.NSFW, url) {
            this.posterUrl = poster
            if (!this.posterUrl.isNullOrBlank()) this.posterHeaders = mapOf("Referer" to mainUrl)
            this.plot = description
            this.tags = tags
            this.recommendations = recs
            this.duration = d.selectFirst("h2.page-title span.duration")?.text()?.let { parseDuration(it) }
            addActors(models.ifEmpty { listOfNotNull(uploaderName) })
        }
    }

    private fun parseDuration(durationString: String): Int? {
        var totalMinutes = 0
        Regex("""(\d+)\s*h""").find(durationString)?.let { totalMinutes += it.groupValues[1].toInt() * 60 }
        Regex("""(\d+)\s*min""").find(durationString)?.let { totalMinutes += it.groupValues[1].toInt() }
        return if (totalMinutes > 0) totalMinutes else null
    }

    private fun unescapeUnicode(str: String): String {
        return Regex("""\\u([0-9a-fA-F]{4})""").replace(str) {
            it.groupValues[1].toInt(16).toChar().toString()
        }
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        loadExtractor(data, subtitleCallback, callback)
        return true
    }
}