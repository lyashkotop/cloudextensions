package com.jacekun

import com.cloudextensions.russian.RequestLimits
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.AppUtils.toJson
import com.lagradost.cloudstream3.utils.*
import com.lagradost.cloudstream3.utils.loadExtractor
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.lagradost.cloudstream3.LoadResponse.Companion.addActors
import java.net.URI
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit

class JavGuru : MainAPI() {
    override var lang = "ja"
    private val globaltvType = TvType.NSFW

    override var name = "JAVGuru"
    override var mainUrl = "https://jav.guru"
    override val supportedTypes = setOf(TvType.NSFW)
    override val hasDownloadSupport = true
    override val hasMainPage = true
    override val hasQuickSearch = false
    override val vpnStatus = VPNStatus.MightBeNeeded

    override val mainPage = mainPageOf("/" to "Latest")

    override suspend fun getMainPage(
        page: Int,
        request: MainPageRequest
    ): HomePageResponse {
        val all = ArrayList<HomePageList>()
        val url = if (page <= 1) mainUrl else "$mainUrl/page/$page/"
        val doc = com.cloudextensions.russian.Network.page(com.cloudextensions.russian.PageRequest(url),"$mainUrl/")

        val items = doc.select("div.inside-article").mapNotNull { card(it) }.distinctBy { it.url }

        if (items.isNotEmpty()) {
            all.add(HomePageList("Latest JAV", items, isHorizontalImages = true))
        }

        return newHomePageResponse(all, hasNext = items.isNotEmpty())
    }

    override suspend fun search(query: String): List<SearchResponse> = search(query, 1).items

    override suspend fun search(query: String, page: Int): SearchResponseList {

        if(page<1)return newSearchResponseList(emptyList(),false)
        val encoded = java.net.URLEncoder.encode(query.trim(),"UTF-8")
        val url = if (page == 1) "$mainUrl/?s=$encoded" else "$mainUrl/page/$page/?s=$encoded"
        val doc = com.cloudextensions.russian.Network.page(com.cloudextensions.russian.PageRequest(url),"$mainUrl/")
        val results = doc.select("div.inside-article").mapNotNull { card(it) }.distinctBy { it.url }
        val allowed = results.filter { com.cloudextensions.russian.ContentPolicy.accepts(it.name) }
        return newSearchResponseList(allowed,doc.selectFirst("a.next.page-numbers, .nav-links a.next")!=null)
    }

    private fun preview(element:org.jsoup.nodes.Element):String? {
        val raw=com.cloudextensions.russian.Metadata.poster(element,mainUrl) ?: return null
        val uri=java.net.URI(raw)
        // The site's uploads are also served by its own origin. Avoid the extra CDN host
        // for Android image requests; this path was verified against live search results.
        return if(uri.host=="cdn.javmiku.com" && uri.path.startsWith("/wp-content/uploads/"))
            mainUrl.trimEnd('/')+uri.rawPath else raw
    }
    private fun card(element:org.jsoup.nodes.Element):SearchResponse? {
        val anchor=element.selectFirst(".imgg a[href]") ?: return null
        val link=fixUrlNull(anchor.attr("href")) ?: return null
        val heading=element.selectFirst("h2 a, h3 a")
        val label=com.cloudextensions.russian.Metadata.title(link,listOf(heading?.attr("title").orEmpty(),heading?.text().orEmpty(),anchor.selectFirst("img")?.attr("alt").orEmpty()))
        if(label.isBlank())return null
        val image=preview(anchor)
        return newMovieSearchResponse(label,link,globaltvType){
            posterUrl=image
            posterHeaders=com.cloudextensions.russian.Network.imageHeaders(image,"$mainUrl/")
        }
    }

    override suspend fun load(url: String): LoadResponse {
        val doc = com.cloudextensions.russian.Network.page(com.cloudextensions.russian.PageRequest(url),"$mainUrl/")
        val poster = com.cloudextensions.russian.Metadata.choosePoster(url,
            doc.selectFirst("div.large-screenimg")?.let{preview(it)},
            doc.selectFirst("meta[property=og:image]")?.attr("content"))
        val title = doc.selectFirst("h1.titl, meta[property='og:title']")?.text()?.takeIf { it.isNotBlank() }
            ?: doc.selectFirst("meta[property='og:title']")?.attr("content")?.takeIf { it.isNotBlank() }
            ?: doc.title()
        val descript = doc.selectFirst("div.wp-content p, meta[property='og:description']")?.text()?.trim()

        val infometaList = doc.select("div.infometa div.infoleft ul li")
        val year = infometaList.firstOrNull { it.text().contains("Release Date", ignoreCase = true) }
            ?.text()?.let { Regex("""\b(19\d\d|20\d\d)\b""").find(it)?.value?.toIntOrNull() }

        val tags = doc.select("div.infometa a[href*='/genre/'], div.infometa a[href*='/tag/']")
            .map { it.text().trim() }
            .filter { it.isNotBlank() }
            .distinct()

        val actors = doc.select("div.infometa a[href*='/actress/']")
            .map { it.text().trim() }
            .filter { it.isNotBlank() }
            .distinct()

        val recommendations = doc.select("div.related-posts div.inside-article, div.row")
            .mapNotNull { card(it) }.distinctBy { it.url }.filter { it.url != url }

        return newMovieLoadResponse(
            name = title,
            url = url,
            type = globaltvType,
            dataUrl = url,
        ).apply {
            this.apiName = this@JavGuru.name
            this.posterUrl = poster
            this.posterHeaders = com.cloudextensions.russian.Network.imageHeaders(poster,"$mainUrl/")
            this.year = year
            this.plot = descript
            this.tags = tags
            this.recommendations = recommendations
            addActors(actors)
        }
    }

    private fun resolveSearcho(page: String): String? {
        val cid = Regex("""cid:\s*'([a-z0-9]+)'""").find(page)?.groupValues?.get(1) ?: return null
        val rtype = Regex("""rtype:\s*'([a-z]+)'""").find(page)?.groupValues?.get(1) ?: return null
        val keys = Regex("""'(data-[a-z0-9]+)'""").findAll(page).map { it.groupValues[1] }.take(3).toList()
        if (keys.size < 3) return null
        val el = Regex("""id="$cid"[^>]*""").find(page)?.groupValues?.get(0) ?: return null
        val token = keys.mapNotNull { k ->
            Regex("""$k="([^"]*)"""").find(el)?.groupValues?.get(1)
        }.joinToString("")
        if (token.length < 6) return null
        return "$mainUrl/searcho/?${rtype}r=${token.reversed()}"
    }

    private fun extractPackedHls(body: String, embedUrl: String): String? {
        val unpacker = JsUnpacker(body)
        val unpacked = if (unpacker.detect()) unpacker.unpack() ?: body else body
        val hls4 = Regex(""""hls4"\s*:\s*"([^"]+)"""").find(unpacked)?.groupValues?.get(1)
        val hls2 = Regex(""""hls2"\s*:\s*"(https[^"]+)"""").find(unpacked)?.groupValues?.get(1)
        return when {
            hls4 != null -> URI(embedUrl).resolve(hls4).toString().takeIf { it.startsWith("https://") || it.startsWith("http://") }
            else -> hls2
        }
    }

    private data class Player(val number: Int, val url: String, val referer: String, val external: Boolean)

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val pageBody = app.get(data).let { response -> response.okhttpResponse.use { response.text } }
        val servers = Regex(""""iframe_url":"([A-Za-z0-9+/=]+)"""").findAll(pageBody)
            .mapNotNull { runCatching { base64Decode(it.groupValues[1]) }.getOrNull() }
            .distinct()
            .toList()

        val players = coroutineScope {
            val permits = Semaphore(4)
            servers.mapIndexed { index, searcho ->
                async {
                    RequestLimits.optional(9000) {
                        permits.withPermit {
                            val response = app.get(searcho, referer = "$mainUrl/")
                            val searchoPage = response.okhttpResponse.use { response.text }
                            val realSrc = resolveSearcho(searchoPage) ?: return@withPermit null
                            val embed = app.get(realSrc, referer = searcho)
                            embed.okhttpResponse.use {
                                val host = URI(embed.url).host.orEmpty().removePrefix("www.")
                                if (host == "vide0.net") {
                                    Player(index + 1, embed.url, "$mainUrl/", external = true)
                                } else {
                                    val hls = extractPackedHls(embed.text, embed.url) ?: return@use null
                                    Player(index + 1, hls, embed.url, external = false)
                                }
                            }
                        }
                    }
                }
            }.awaitAll().filterNotNull()
        }

        var found = false
        for (player in players) {
            if (player.external) {
                val loaded = try {
                    RequestLimits.optional(5000) {
                        loadExtractor(player.url, player.referer, subtitleCallback, callback)
                    }
                } catch (_: LinkageError) {
                    false
                }
                found = loaded == true || found
            } else {
                callback(newExtractorLink(name, "Server ${player.number}", player.url, ExtractorLinkType.M3U8) {
                    referer = player.referer
                    quality = Qualities.Unknown.value
                })
                found = true
            }
        }
        return found
    }

    companion object {
        private val gson = Gson()
        private inline fun <reified T> String.fromJson(): T =
            gson.fromJson(this, object : TypeToken<T>() {}.type)
    }
}
