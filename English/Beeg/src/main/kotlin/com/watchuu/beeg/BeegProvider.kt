package com.watchuu.beeg

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import com.lagradost.cloudstream3.network.CloudflareKiller
import java.net.URLEncoder
import com.cloudextensions.russian.*
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.Jsoup
import org.jsoup.nodes.Element

/**
 * beeg.porn — adult tube behind Cloudflare, built from the captured network log (2026-10-29).
 *
 * LISTINGS (this is what was wrong on the home page)
 *   The site's own config script declares `URL_LATEST = 'new'` and `URL_BEST = 'best'`, and the
 *   capture shows the real paging shape:
 *       /            → /page/2/            (home, mixed sections)
 *       /new/        → /new/2/ …           (latest)
 *       /trends/     → /trends/2/ /trends/3/ …   (capture: /trends/2/, /trends/3/)
 *       /best/       → /best/2/  /best/3/ …      (capture: /best/, /best/2/, /best/3/)
 *   Page 1 has NO "/1/" segment — the old code built /trends/1/ and /best/1/, which the site
 *   does not serve. Cards are `span.item`.
 *
 * CARDS link to two different URL shapes:
 *   /play/5-<video_id>/<slug>/          (from the home / listing pages)
 *   /xid/<video_id>/?e=<encode>         (from the search API)
 *
 * STREAMS (this is why only previews played)
 *   `e` is the **xvideos embed code**. The full video lives on the xvideos player:
 *       https://www.xvideos.com/embedframe/<encode>
 *           html5player.setVideoHLS('https://hls-cdn77.xvideos-cdn.com/…/hls_low.m3u8')
 *           html5player.setVideoUrlHigh('https://mp4-cdn77.xvideos-cdn.com/…/video_360p.mp4?secure=…')
 *           html5player.setVideoUrlLow('https://mp4-cdn77.xvideos-cdn.com/…/video_240p.mp4?secure=…')
 *   The old code fetched https://e.xv-cdn.net/?id=…&e=… and regexed it for setVideoHLS — that
 *   wrapper page only iframes the player, so the regex never matched and the code fell through
 *   to `preview_url` from the metadata API, i.e. a 3-second preview clip.
 *   The metadata API (api-search.xv-cdn.net/id/<id>/) is now used ONLY for metadata, never as a
 *   playable source, and a preview is clearly labelled as such if nothing better is found.
 */
class BeegProvider : MainAPI(), DetailTagSource, ListingScoreSource {
    override var mainUrl = "https://beeg.porn"
    override var name = "Beeg.porn"
    override var lang = "en"
    override val hasMainPage = true
    override val supportedTypes = setOf(TvType.NSFW)

    private val searchApiBase = "https://api-search.xv-cdn.net"
    private val nativeSearchBase = "https://search.beeg.porn/api"
    private val cyrillicWord = Regex("[\\u0400-\\u052F]+")
    private val embedBase = "https://e.xv-cdn.net"
    private val xvideosBase = "https://www.xvideos.com"

    private val ua =
        "Mozilla/5.0 (Linux; Android 16; SM-S911B Build/BP4A.251205.006) AppleWebKit/537.36 " +
            "(KHTML, like Gecko) Chrome/156.0.8078.47 Mobile Safari/537.36"

    private val cfInterceptor by lazy { CloudflareKiller() }

    // "" is the mixed home page; the other three are the site's own listing paths.
    override val mainPage = mainPageOf(
        "" to "Home",
        "new" to "Latest",
        "trends" to "Trending",
        "best" to "Best"
    )

    // ── Home page ────────────────────────────────────────────────────────────

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val section = request.data.trim('/')
        val url = when {
            section.isEmpty() -> if (page == 1) "$mainUrl/" else "$mainUrl/page/$page/"
            page == 1 -> "$mainUrl/$section/"
            else -> "$mainUrl/$section/$page/"
        }

        val doc = Jsoup.parse(fetchPage(url))
        val items = doc.select("span.item").mapNotNull { it.toSearchResult() }.distinctBy { it.url }
        return newHomePageResponse(request.name, items, hasNext = items.isNotEmpty())
    }

    private suspend fun fetchPage(url: String): String {
        val plain = runCatching { app.get(url, headers = mapOf("User-Agent" to ua)).text }.getOrNull()
        if (!looksBroken(plain)) return plain!!
        return runCatching {
            app.get(url, headers = mapOf("User-Agent" to ua), interceptor = cfInterceptor).text
        }.getOrNull() ?: plain.orEmpty()
    }

    private fun looksBroken(body: String?): Boolean {
        if (body == null || body.length < 600) return true
        val head = body.take(6000)
        return head.contains("Just a moment", ignoreCase = true) ||
            head.contains("challenge-platform") ||
            head.contains("cf_chl_opt") ||
            !head.contains("<html", ignoreCase = true)
    }

    // ── Search ───────────────────────────────────────────────────────────────

    override suspend fun search(query: String): List<SearchResponse> = search(query, 1).items

    override suspend fun search(query: String, page: Int): SearchResponseList = coroutineScope {
        val term = query.trim()
        if (term.isBlank() || page < 1) return@coroutineScope newSearchResponseList(emptyList(), false)
        val q = URLEncoder.encode(term, "UTF-8").replace("+", "%20")
        val path = "/search/?format=ajax&k=$q&p=$page"
        // The web page prepends the main AJAX matches and appends its own index matches.
        val primary = async { fetchSearch("$searchApiBase$path") }
        val native = async { fetchSearch("$nativeSearchBase$path") }
        val main = primary.await()
        val site = native.await()
        // The upstream AJAX feed returns a broad fallback for unmatched Cyrillic queries.
        val mainItems = searchItems(main, native = false, cyrillicWords = cyrillicWord.findAll(term).map { it.value }.toList())
        val siteItems = searchItems(site, native = true)
        val results = (mainItems + siteItems).distinctBy { it.url }
        val next = (mainItems.isNotEmpty() && main?.optInt("max_pages", page)?.let { it > page } == true) ||
            siteItems.isNotEmpty()
        newSearchResponseList(results, results.isNotEmpty() && next)
    }

    private suspend fun fetchSearch(url: String): JSONObject? = RequestLimits.optional(4500) {
        JSONObject(app.get(url, headers = mapOf("User-Agent" to ua, "Origin" to mainUrl),
            referer = "$mainUrl/").text)
    }

    private fun searchItems(response: JSONObject?, native: Boolean, cyrillicWords: List<String> = emptyList()): List<SearchResponse> {
        val items = response?.optJSONArray("items") ?: return emptyList()
        val base = mainUrl.toHttpUrlOrNull() ?: return emptyList()
        return (0 until items.length()).mapNotNull { i ->
            val item = items.optJSONObject(i) ?: return@mapNotNull null
            val title = Metadata.clean(item.optString("title")).takeIf(Metadata::sourceValue)
                ?: return@mapNotNull null
            if (cyrillicWords.isNotEmpty()) {
                val labels = listOf(title, item.optString("cats"), item.optString("slug"))
                if (!cyrillicWords.all { word -> labels.any { it.contains(word, ignoreCase = true) } }) {
                    return@mapNotNull null
                }
            }
            val address = if (native) {
                base.resolve(item.optString("url"))?.takeIf {
                    it.host.removePrefix("www.") == base.host.removePrefix("www.") &&
                        (it.encodedPath.startsWith("/play/") || it.encodedPath.startsWith("/xid/"))
                }
            } else {
                val id = item.optString("video_id").takeIf { it.toLongOrNull() != null } ?: return@mapNotNull null
                base.newBuilder().encodedPath("/xid/$id/").apply {
                    item.optString("video_id_encode").takeIf(Metadata::sourceValue)?.let { addQueryParameter("e", it) }
                    item.optString("video_id_xnxx").takeIf(Metadata::sourceValue)?.let { addQueryParameter("xn", it) }
                }.build()
            } ?: return@mapNotNull null
            newMovieSearchResponse(title, address.toString(), TvType.NSFW) {
                posterUrl = Metadata.imageUrl(mainUrl, item.optString("thumb"))
            }
        }
    }

    // ── Detail ───────────────────────────────────────────────────────────────

    private val detailSpec get() = SiteSpec(
        "Beeg", name, mainUrl, "span.item", "a[href]", ".title", emptyList(),
        tagSelector = ".lst_tag a.play-tag",
    )
    private val declaredPlayer = Regex("""\bvideo_embed\s*=\s*""")

    private fun originalVideo(page: String): String? {
        val assignment = declaredPlayer.find(page) ?: return null
        val value = try {
            JSONTokener(page.substring(assignment.range.last + 1)).nextValue() as? String
        } catch (_: org.json.JSONException) {
            null
        }
        val player = value?.toHttpUrlOrNull() ?: return null
        return if (player.host == "vp.privatez.link") {
            player.queryParameter("u")?.toHttpUrlOrNull()?.toString()
        } else player.toString()
    }

    private fun ratingVideoId(url: String, markup: String? = null): String? {
        url.toHttpUrlOrNull()?.queryParameter("e")?.takeIf { it.matches(Regex("[A-Za-z0-9]+")) }?.let { return it }
        val player = markup?.let(::originalVideo)?.toHttpUrlOrNull() ?: return null
        if (player.host.removePrefix("www.") !in setOf("xvideos.com", "e.xv-cdn.net")) return null
        return player.pathSegments.takeIf { it.firstOrNull() == "embedframe" }?.getOrNull(1)
    }

    override suspend fun readListingScore(url: String): Score? {
        val id = ratingVideoId(url) ?: ratingVideoId(url, fetchPage(url)) ?: return null
        return DetailEnrichment.xvideosScore(id, budget = 2300)
    }

    override suspend fun missingTags(url: String): List<String> {
        val embed = Regex("[?&]e=([A-Za-z0-9]+)").find(url)?.groupValues?.get(1) ?: return emptyList()
        return DetailEnrichment.xvideosTags(embed, detailSpec, budget = 5500)
    }

    override suspend fun load(url: String): LoadResponse = coroutineScope {
        val id=Regex("/(?:xid/|play/\\d+-)(\\d+)").find(url)?.groupValues?.get(1)
        val encode=Regex("[?&]e=([A-Za-z0-9]+)").find(url)?.groupValues?.get(1).orEmpty()
        val spec = detailSpec
        val originalTags = encode.takeIf(String::isNotBlank)?.let { embed ->
            async { DetailEnrichment.xvideosTags(embed, spec, budget = 3000) }
        }
        val html=async { RequestLimits.optional(7000){fetchPage(url)}.orEmpty() }
        val api=async { if(id==null)null else RequestLimits.optional(3500){JSONObject(app.get("$searchApiBase/id/$id/?format=ajax&e=$encode",headers=Network.headers(mainUrl)).text)} }
        val markup = html.await()
        val score = async {
            ratingVideoId(url, markup)?.let { DetailEnrichment.xvideosScore(it, budget = 2300) }
        }
        val doc=Jsoup.parse(markup,url)
        val meta=api.await()
        val detail = Metadata.detail(doc, spec)
        val title=Metadata.title(url,listOf(meta?.optString("title").orEmpty(),doc.selectFirst("h1")?.text().orEmpty(),doc.selectFirst("meta[property=og:title]")?.attr("content").orEmpty()),fromDetail=true)
        if(title.isBlank())throw ErrorLoadingException("Video metadata is missing")
        val declaredTags = meta?.optString("cats")?.takeUnless { it == "[]" }?.split(',')
            ?.mapNotNull { Metadata.tag(it.trim().trim('*')) }.orEmpty().ifEmpty { detail.tags }
        val tags = if (declaredTags.isNotEmpty()) {
            originalTags?.cancel()
            declaredTags
        } else {
            val resolved = originalTags?.await()
                ?: DetailEnrichment.xvideosTags(findEncode(markup).orEmpty(), spec, budget = 2000)
            resolved.ifEmpty {
                originalVideo(markup)?.let { source ->
                    RequestLimits.optional(3000) {
                        val original = Network.page(PageRequest(source), url)
                        Metadata.detail(original, spec.copy(tagSelector = "")).tags
                    }
                }.orEmpty()
            }
        }
        val related=meta?.optJSONArray("related")
        val recommendations=if(related==null)emptyList() else (0 until related.length()).mapNotNull { i ->
            val item=related.optJSONObject(i) ?: return@mapNotNull null
            val rid=item.optString("video_id");val label=item.optString("title");val e=item.optString("video_id_encode")
            if(rid.isBlank()||label.isBlank())return@mapNotNull null
            newMovieSearchResponse(label,"$mainUrl/xid/$rid/?e=$e",TvType.NSFW){posterUrl=Metadata.imageUrl(mainUrl,item.optString("thumb"))}
        }
        val sourceScore = score.await()
        newMovieLoadResponse(title,url,TvType.NSFW,url) {
            this.score = sourceScore
            posterUrl=Metadata.choosePoster(url,meta?.optString("thumb"),detail.poster)
            plot=detail.description;this.tags=tags;this.recommendations=recommendations
            val seconds=meta?.optInt("dur",0)?:0
            applyVideoDuration(if (seconds > 0) seconds.toString() else detail.duration)
        }
    }

    // ── Streams ──────────────────────────────────────────────────────────────

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val videoId = Regex("""/xid/(\d+)/""").find(data)?.groupValues?.get(1)
            ?: Regex("""/play/\d+-(\d+)/""").find(data)?.groupValues?.get(1)
        val fromSearch = Regex("""[?&]e=([A-Za-z0-9]+)""").find(data)?.groupValues?.get(1)
        val pending = mutableMapOf<String, ExtractorLink>()

        // 1. We already know the xvideos embed code (search results) — go straight to the player.
        if (fromSearch != null && playFromEmbedframe(fromSearch, data, pending, callback)) return true

        // 2. Otherwise look for the embed code on the page itself.
        val pageHtml = if (fromSearch == null) RequestLimits.optional(5500) { fetchPage(data) } else null
        val encode = fromSearch ?: pageHtml?.let(::findEncode)
        if (encode != null) {
            if (encode != fromSearch && playFromEmbedframe(encode, data, pending, callback)) return true
            if (videoId != null && playFromWrapper(videoId, encode, data, pending, callback)) return true
        }

        // 3. The regular home catalogue can declare a different host in its player.
        val original = pageHtml?.let(::originalVideo) ?: encode?.let(DetailEnrichment::xvideosPage)
        if (original != null) {
            val played = try {
                RequestLimits.optional(9000) { Playback.confirmedLinks(name, data, original, subtitleCallback, callback) }
            } catch (_: NotImplementedError) {
                null
            }
            if (played == true) return true
        }

        // 4. If the page omits its embed code, resolve it through the site's search API.
        if (videoId != null) {
            val resolved = findEncodeViaSearch(videoId, pageHtml, data)?.takeUnless { it == encode }
            if (resolved != null &&
                (playFromEmbedframe(resolved, data, pending, callback) ||
                    playFromWrapper(videoId, resolved, data, pending, callback))
            ) return true
        }

        if (pending.isNotEmpty()) {
            pending.values.forEach(callback)
            return true
        }

        // Expose the site's preview with its own label.
        val preview = videoId?.let { id ->
            runCatching {
                app.get("$searchApiBase/id/$id/?format=ajax&e=${encode ?: ""}").text
            }.getOrNull()
        }?.let { Regex(""""preview_url"\s*:\s*"([^"]+)"""").find(it)?.groupValues?.get(1) }
            ?.replace("\\/", "/")

        if (!preview.isNullOrBlank()) {
            callback.invoke(
                newExtractorLink(name, "$name (preview only)", preview, ExtractorLinkType.VIDEO) {
                    this.referer = "$mainUrl/"
                    this.quality = Qualities.Unknown.value
                }
            )
            return true
        }
        return false
    }

    /** https://www.xvideos.com/embedframe/<encode> — the real player page. */
    private suspend fun playFromEmbedframe(
        encode: String,
        referer: String,
        pending: MutableMap<String, ExtractorLink>,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val html = RequestLimits.optional(5500) {
            app.get(
                "$xvideosBase/embedframe/$encode",
                headers = mapOf("User-Agent" to ua),
                referer = referer
            ).text
        } ?: return false
        return emitPlayerSources(html, pending, callback)
    }

    /** https://e.xv-cdn.net/?id=…&e=… → iframe to the proxied player → same config. */
    private suspend fun playFromWrapper(
        videoId: String,
        encode: String,
        referer: String,
        pending: MutableMap<String, ExtractorLink>,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val wrapper = RequestLimits.optional(5500) {
            app.get(
                "$embedBase/?id=$videoId&e=$encode",
                headers = mapOf("User-Agent" to ua),
                referer = referer,
                interceptor = cfInterceptor
            ).text
        } ?: return false

        val playerUrl = Regex("""<iframe[^>]+src=["']([^"']*embedframe[^"']*)["']""", RegexOption.IGNORE_CASE)
            .find(wrapper)?.groupValues?.get(1)?.replace("&amp;", "&")
            ?: Regex("""(https?://[^"'\s<>]*embedframe/[^"'\s<>]+)""")
                .find(wrapper)?.groupValues?.get(1)?.replace("&amp;", "&")

        if (playerUrl != null) {
            val html = RequestLimits.optional(5500) {
                app.get(
                    if (playerUrl.startsWith("http")) playerUrl else "$xvideosBase/embedframe/$encode",
                    headers = mapOf("User-Agent" to ua),
                    referer = referer
                ).text
            }
            if (html != null && emitPlayerSources(html, pending, callback)) return true
        }

        // The wrapper page itself sometimes carries the config inline.
        return emitPlayerSources(wrapper, pending, callback)
    }

    /** Reads html5player.setVideoHLS / setVideoUrlHigh / setVideoUrlLow out of the player page. */
    private suspend fun emitPlayerSources(
        html: String, pending: MutableMap<String, ExtractorLink>, callback: (ExtractorLink) -> Unit,
    ): Boolean = coroutineScope {
        if (html.isBlank()) return@coroutineScope false
        val referer = "$xvideosBase/"

        val variants = listOf(
            Triple("HLS", ExtractorLinkType.M3U8, Qualities.Unknown),
            Triple("UrlHigh", ExtractorLinkType.VIDEO, Qualities.P360),
            Triple("UrlLow", ExtractorLinkType.VIDEO, Qualities.P240),
        )
        val links = variants.mapNotNull { (setter, type, streamQuality) ->
            val url = Regex("""setVideo$setter\(['"]([^'"]+)['"]\)""").find(html)
                ?.groupValues?.get(1)?.toHttpUrlOrNull()?.toString() ?: return@mapNotNull null
            newExtractorLink(name, name, url, type) {
                this.referer = referer
                quality = streamQuality.value
                headers = mapOf("User-Agent" to ua)
            }
        }.distinctBy { it.url }
        val checked = links.map { link -> async { link to Playback.checkDirectLink(link) } }.awaitAll()
        for ((link, available) in checked) {
            if (available == null) pending[link.url] = link else pending.remove(link.url)
            if (available == true) callback(link)
        }
        checked.any { it.second == true }
    }

    private fun findEncode(html: String): String? =
        Regex("""embedframe/([A-Za-z0-9]{6,20})""").find(html)?.groupValues?.get(1)
            ?: Regex("""[?&]e=([A-Za-z0-9]{8,14})""").find(html)?.groupValues?.get(1)
            ?: Regex(""""video_id_encode"\s*:\s*"([^"]+)"""").find(html)?.groupValues?.get(1)

    /**
     * /play/ URLs only carry the numeric id. The site's search API returns `video_id_encode`
     * for every hit, so search by the video title and pick the row with the same video_id.
     */
    private suspend fun findEncodeViaSearch(videoId: String, pageHtml: String?, data: String): String? {
        val title = pageHtml?.let { Jsoup.parse(it).selectFirst("h1")?.text() }?.trim()
            ?.ifBlank { null }
            ?: titleFromUrl(data)

        val words = title.split(Regex("\\s+"))
            .filter { it.length > 3 }
            .take(4)
            .joinToString(" ")
            .ifBlank { return null }

        val q = URLEncoder.encode(words, "UTF-8").replace("+", "%20")
        val json = runCatching {
            app.get("$searchApiBase/search/?format=ajax&k=$q&p=1", headers = mapOf("User-Agent" to ua)).text
        }.getOrNull() ?: return null

        // Items contain nested objects, so read a window after the matching video_id instead.
        val hit = Regex(""""video_id"\s*:\s*"?$videoId"?\s*,""").find(json) ?: return null
        val chunk = json.substring(hit.range.last, minOf(json.length, hit.range.last + 400))
        return Regex(""""video_id_encode"\s*:\s*"([^"]+)"""").find(chunk)?.groupValues?.get(1)
    }

    // ── Cards ────────────────────────────────────────────────────────────────

    private fun Element.toSearchResult(): SearchResponse? {
        val a = selectFirst("a[href]") ?: return null
        val href = a.attr("href").trim()
        if (href.isBlank() || href.startsWith("#") || href.startsWith("javascript")) return null

        val url = if (href.startsWith("http")) href else fixUrl(href)
        // Only video pages: /play/5-<id>/<slug>/ or /xid/<id>/?e=…
        if (!url.contains("/play/") && !url.contains("/xid/")) return null

        val title = sequenceOf(
            a.attr("title").trim(),
            selectFirst(".title")?.text()?.trim(),
            selectFirst("span.title")?.text()?.trim(),
            selectFirst("img[alt]")?.attr("alt")?.trim(),
            titleFromUrl(url)
        ).firstOrNull { !it.isNullOrBlank() } ?: return null

        val img = selectFirst("img")
        val poster = fixUrlNull(
            img?.attr("data-src")?.takeIf { it.isNotBlank() }
                ?: img?.attr("src")?.takeIf { it.isNotBlank() }
        )

        return newMovieSearchResponse(title.trim(), url, TvType.NSFW) {
            this.posterUrl = poster
        }
    }

    /** /play/5-6623078/gina-gerson/ → "gina gerson" */
    private fun titleFromUrl(url: String): String {
        val slug = url.substringBefore('?').trimEnd('/').substringAfterLast('/')
        val cleaned = slug.replace(Regex("^\\d+-"), "")
        return cleaned.replace("-", " ").trim().ifBlank { "Video" }
    }
}
