// ! Bu araç @Kraptor123 tarafından | @Cs-GizliKeyif için yazılmıştır.

package com.kraptor

import com.cloudextensions.russian.ContentPolicy
import com.cloudextensions.russian.MediaDuration
import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.RequestLimits
import com.cloudextensions.russian.applyVideoDuration

import com.lagradost.api.Log
import org.jsoup.nodes.Element
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.json.JSONObject
import org.jsoup.Jsoup

class XRares : MainAPI() {
    override var mainUrl              = "https://www.xrares.com"
    override var name                 = "XRares"
    override val hasMainPage          = true
    override var lang                 = "en"
    override val hasQuickSearch       = false
    override val supportedTypes       = setOf(TvType.NSFW)

    override val mainPage = mainPageOf(
        "${mainUrl}/videos?type=public"      to "Videos",
        "${mainUrl}/videos?type=public&o=bw"      to "Being Watched",
        "${mainUrl}/videos?type=public&o=tr"      to "Top Rated",
        "${mainUrl}/videos?type=public&o=mr"      to "Most Recent",
        "${mainUrl}/videos?type=public&o=mv"      to "Most Viewed",
        "${mainUrl}/videos?type=public&o=md"      to "Most Commented",
        "${mainUrl}/videos?type=public&o=tf"      to "Top Favorites",
        "${mainUrl}/videos?type=public&o=lg"      to "Longest",
    )

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val document = if (page==1){
            app.get("${request.data}").document
        } else {
            app.get("${request.data}&page=$page").document
        }
        val home     = document.select("div.col-sm-6").mapNotNull { it.toMainPageResult() }

        return newHomePageResponse(HomePageList(request.name, home, true))
    }

    private fun Element.toMainPageResult(): SearchResponse? {
        if(selectFirst(".label-private")!=null)return null
        val title     = this.selectFirst("span.video-title")?.text() ?: return null
        val href      = fixUrlNull(this.selectFirst("a")?.attr("href")) ?: return null
        val posterUrl = com.cloudextensions.russian.Metadata.poster(this,mainUrl) ?: fixUrlNull(this.selectFirst("img")?.attr("src"))

        return newMovieSearchResponse(title, href, TvType.NSFW) {
            this.posterUrl = posterUrl
        }
    }

    override suspend fun search(query: String): List<SearchResponse> = search(query,1).items

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val term = Metadata.clean(query)
        val origin = mainUrl.toHttpUrlOrNull()
        if (term.isEmpty() || origin == null || page < 1) return newSearchResponseList(emptyList(), false)

        val address = origin.newBuilder().encodedPath("/search/videos")
            .addQueryParameter("search_query", term).addQueryParameter("type", "public")
        if (page > 1) address.addQueryParameter("page", page.toString())
        val request = PageRequest(address.build().toString(), allowNotFound = true)
        val document = Network.page(request, "$mainUrl/")
        if (Metadata.emptySearch(document, request)) return newSearchResponseList(emptyList(), false)
        val results = document.select("div.col-sm-6").mapNotNull { it.toMainPageResult() }
        val hasNext = results.isNotEmpty() && document.select(".pagination a[href], a[rel=next][href]").any {
            it.absUrl("href").toHttpUrlOrNull()?.queryParameter("page")?.toIntOrNull() == page + 1
        }
        return newSearchResponseList(results, hasNext)
    }

    override suspend fun quickSearch(query: String): List<SearchResponse>? = search(query)

    override suspend fun load(url: String): LoadResponse? {
        val document = com.cloudextensions.russian.Network.page(com.cloudextensions.russian.PageRequest(url),mainUrl)

        val title = document.selectFirst("h1")?.text()?.trim() ?: return null
        val poster = fixUrlNull(document.selectFirst("meta[property=og:image]")?.attr("content"))
        val description = document.selectFirst("div.m-t-10 p")?.text()?.trim()
        val year = document.selectFirst("div.extra span.C a")?.text()?.trim()?.toIntOrNull()
        val tags = document.select("div.m-t-10 a").map { it.text() }
        val media = document.selectFirst("video#vjsplayer source[type=video/mp4][src]")?.absUrl("src")
        val seconds = MediaDuration.fromMp4(media, document.baseUri())

        val vidId = document.selectFirst("a[href*=related_videos][id]")?.attr("id")?.substringAfterLast("_") ?: ""

        val recommendations = relatedVideos(url, vidId, tags)

        return newMovieLoadResponse(title, url, TvType.NSFW, url) {
            applyVideoDuration(seconds)
            this.posterUrl = poster
            this.plot = description
            this.year = year
            this.tags = tags
            this.recommendations = recommendations
        }
    }

    private suspend fun relatedVideos(url: String, vidId: String, tags: List<String>): List<SearchResponse> = coroutineScope {
        val current = videoId(url)
        val related = if (vidId.isBlank()) emptyList() else RequestLimits.optional {
            val html = JSONObject(recommendation(vidId)).optString("videos")
            Jsoup.parse(html).select("div.col-lg-3").mapNotNull { it.toMainPageResult() }
        }.orEmpty()
        fun eligible(cards: List<SearchResponse>) = cards.filter {
            videoId(it.url) != current && ContentPolicy.accepts(it.name)
        }.distinctBy { videoId(it.url) }
        val visible = eligible(related)
        if (visible.size >= 9) return@coroutineScope visible
        val matches = tags.asSequence().map(Metadata::clean).filter(String::isNotBlank)
            .filter { ContentPolicy.accepts(it) }.distinctBy(String::lowercase).take(3).toList()
            .map { tag -> async { RequestLimits.optional(2200) { search(tag, 1).items }.orEmpty() } }
            .awaitAll().flatten()
        eligible(visible + matches).take(9)
    }

    private fun videoId(url: String): String {
        val path = url.toHttpUrlOrNull()?.pathSegments.orEmpty()
        return path.drop(1).firstOrNull()?.takeIf { it.toLongOrNull() != null }
            ?: Metadata.catalogueKey("XRares", url)
    }

    private suspend fun recommendation(vidId: String): String{
        val response = app.post("$mainUrl/ajax/related_videos", headers = mapOf(
            "User-Agent" to "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0",
            "Accept" to "application/json, text/javascript, */*; q=0.01",
            "Accept-Language" to "en-US,en;q=0.5",
            "Referer" to "${mainUrl}/",
            "X-Requested-With" to "XMLHttpRequest",
        ), data = mapOf(
            "video_id" to vidId,
            "page" to "1",
            "move" to "next"
        )).text
        return response
    }

    override suspend fun loadLinks(data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit): Boolean {
        Log.d("kraptor_$name", "data = ${data}")
        val document = app.get(data).document

        val source = document.select("source")

        source.forEach { video ->
            val res = video.attr("res")
            val mp4 = video.attr("src")
            callback.invoke(newExtractorLink(
                this.name,
                this.name,
                mp4,
                type = ExtractorLinkType.VIDEO
            ) {
                this.referer = "${mainUrl}/"
                this.quality = getQualityFromName(res)
            }
            )
        }

        return true
    }
}
