package com.cloudextensions.sites

import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.PosterSource
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.RequestLimits
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.MainPageRequest
import com.lagradost.cloudstream3.SearchResponseList
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.newSearchResponseList
import com.lagradost.cloudstream3.utils.ExtractorLink
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Collections
import java.util.Locale
import java.util.TimeZone
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okio.ByteString.Companion.decodeBase64
import org.jsoup.nodes.Document

private const val VIDEO_LINK = "a[href*=/show-cam-sex-movies/]:has(img)"
private const val VIDEO_CARDS = "ul.content > li:has(> " + VIDEO_LINK + ")"
private const val VIDEO_TAGS = "span.tl a:is([href*=/cat/en/], [href*=/site/en/])"

private fun previousMonth(): String {
    val utc = TimeZone.getTimeZone("UTC")
    val month = Calendar.getInstance(utc).apply { add(Calendar.MONTH, -1) }
    return SimpleDateFormat("yyyy-MM", Locale.ROOT).apply { timeZone = utc }.format(month.time)
}

class ShowCamRipsProvider : RussianProvider(SiteSpec(
    id = "ShowCamRips",
    title = "ShowCamRips",
    origin = "https://www.showcamrips.com",
    cards = VIDEO_CARDS,
    link = VIDEO_LINK,
    titleSelector = "h3.title",
    detailTitleSelector = "body > .h > h1",
    tagSelector = "div:has(> iframe#videomoi) > $VIDEO_TAGS",
    related = "body > ul.content",
    sections = listOf(
        Section("Latest", "/en/"),
        Section("Popular last month", "/best/en/${previousMonth()}/"),
        Section("Female", "/cat/en/Female/"),
        Section("Couple", "/cat/en/Couple/"),
        Section("Chaturbate", "/site/en/Chaturbate/"),
        Section("Stripchat", "/site/en/Stripchat/"),
        Section("Camsoda", "/site/en/Camsoda/"),
    ),
)), PosterSource {
    override var lang = "en"

    private val detailId = Regex("""^/show-cam-sex-movies/(\d+)-""")
    private val pageClock = Regex("""->\s*((?:\d+:)?\d{1,2}:\d{2})\s*$""")
    private val playRoute = Regex("""function\s+play_video_kanonika\(\)\s*\{\s*window\.location\.href\s*=\s*['"]([^'"]+)['"]""")
    private val mediaAssignment = Regex("""(?m)^\s*video\.src\s*=\s*['"](https://[^'"]+)['"]""")
    private val inlinePosters = Collections.synchronizedMap(object : LinkedHashMap<String, String>(256, .75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, String>?) = size > 256
    })

    private fun namedSection(term: String): String? = spec.sections.firstOrNull { section ->
        section.name.equals(term, ignoreCase = true) &&
            (section.path.startsWith("/cat/en/") || section.path.startsWith("/site/en/"))
    }?.path

    override suspend fun searchRequest(term: String): PageRequest {
        val address = mainUrl.toHttpUrl()
        namedSection(term)?.let { return PageRequest(address.resolve(it).toString()) }
        return PageRequest(address.newBuilder().encodedPath("/search.php")
            .addQueryParameter("Src", term).addQueryParameter("lg", "en").build().toString())
    }

    override suspend fun search(query: String, page: Int): SearchResponseList = coroutineScope {
        val term = Metadata.clean(query)
        val exact = super.search(term, page)
        if (exact.items.isNotEmpty() || page != 1 || term.length < 2 || namedSection(term) != null) return@coroutineScope exact
        val words = term.split(' ')
        val matches = listOf("/en/", "/en/2-pg/", "/en/3-pg/").map { path ->
            async {
                RequestLimits.optional(3500) {
                    getMainPage(1, MainPageRequest("Latest", path, true)).items.flatMap { it.list }
                        .filter { card -> words.all { card.name.contains(it, ignoreCase = true) } }
                }.orEmpty()
            }
        }.awaitAll().flatten().distinctBy { it.url }
        newSearchResponseList(matches, false)
    }

    override suspend fun page(request: PageRequest): Document {
        val document = super.page(request)
        if (document.selectFirst(VIDEO_CARDS) == null) return document
        return document.clone().apply {
            val pager = selectFirst(".pages:has(a.current)")
            val current = pager?.selectFirst("a.current")?.text()?.toIntOrNull()
            if (current != null) pager?.select("a[href]")?.firstOrNull {
                it.text().toIntOrNull() == current + 1
            }?.attr("rel", "next")
            for (card in select(VIDEO_CARDS)) {
                card.selectFirst("span.dur")?.addClass("duration")
                card.select(VIDEO_TAGS).forEach { it.attr("data-tag", it.text()) }
                val link = card.selectFirst(VIDEO_LINK) ?: continue
                val image = link.selectFirst("img") ?: continue
                val source = image.attr("data-tn").ifBlank { image.attr("src") }.trim()
                val embedded = inlinePoster(source)
                if (embedded != null) {
                    link.absUrl("href").toHttpUrlOrNull()?.encodedPath?.let { inlinePosters[it] = embedded }
                    image.removeAttr("src")
                } else if (source.endsWith("/styles_cam/css/images/l.png") || source.startsWith("data:")) {
                    image.removeAttr("src")
                } else {
                    image.attr("src", source)
                }
            }
        }
    }

    private fun inlinePoster(raw: String): String? {
        if (!raw.startsWith("data:image/")) return null
        val body = raw.substringAfter(";base64,", "").trim()
        if (body.length !in 16..200_000) return null
        val prefix = body.take(16).decodeBase64()?.hex() ?: return null
        val subtype = when {
            prefix.startsWith("89504e470d0a1a0a") -> "png"
            prefix.startsWith("ffd8ff") -> "jpeg"
            prefix.startsWith("52494646") && prefix.drop(16).startsWith("57454250") -> "webp"
            else -> return null
        }
        return "data:image/$subtype;base64,$body"
    }

    override suspend fun resolvePoster(url: String, poster: String?, headers: Map<String, String>): String? =
        poster ?: url.toHttpUrlOrNull()?.encodedPath?.let { inlinePosters[it] }

    override fun readMetadata(document: Document): VideoDetail {
        val id = detailId.find(document.baseUri().toHttpUrl().encodedPath)?.groupValues?.get(1)
        val card = id?.let { document.selectFirst("ul.content > li > a[data-id=$it]:has(img)") }
        val listingTitle = Metadata.title(document.baseUri(), emptyList())
        val metadata = super.readMetadata(document)
        val canonicalTitle = Metadata.clean(card?.attr("title")).ifBlank { listingTitle }
        val clock = pageClock.find(document.title())?.groupValues?.get(1)
        return metadata.copy(
            title = canonicalTitle.ifBlank { metadata.title },
            poster = metadata.poster ?: card?.let { Metadata.poster(it, document.baseUri()) },
            duration = Metadata.timing(clock).ifBlank { metadata.duration },
        )
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val detail = Network.page(PageRequest(data), mainUrl)
        val address = detail.baseUri().toHttpUrl()
        val id = detailId.find(address.encodedPath)?.groupValues?.get(1) ?: return false
        val loaderUrl = detail.selectFirst("iframe#videomoi[src]")?.absUrl("src")?.toHttpUrlOrNull()?.takeIf {
            it.isHttps && it.host == address.host && it.encodedPath == "/loading_video.php" && it.queryParameter("idd") == id
        } ?: throw ErrorLoadingException("На странице нет видеоплеера ShowCamRips")
        val loader = Network.page(PageRequest(loaderUrl.toString()), detail.baseUri())
        val playUrl = loader.select("script:not([src])").asSequence().mapNotNull { playRoute.find(it.data()) }
            .mapNotNull { loaderUrl.resolve(it.groupValues[1]) }.firstOrNull {
                it.isHttps && it.host == loaderUrl.host && it.encodedPath == "/play.php" &&
                    it.queryParameter("idd") == id && it.queryParameter("vv") == loaderUrl.queryParameter("vv")
            } ?: throw ErrorLoadingException("ShowCamRips не открыл плеер")
        val player = Network.page(PageRequest(playUrl.toString()), loader.baseUri())
        val declared = if (player.selectFirst("video#myVideo") == null) emptyList() else
            player.select("script:not([src])").asSequence().filter { it.data().contains("getElementById('myVideo')") }
                .flatMap { mediaAssignment.findAll(it.data()) }
                .mapNotNull { it.groupValues[1].toHttpUrlOrNull() }
                .filter { it.isHttps && it.encodedPath.endsWith(".mp4", ignoreCase = true) }
                .map { Playback.Source(it.toString()) }.distinctBy { it.url }.toList()
        return Playback.linksFromPage(name, mainUrl, data, player, declared, subtitleCallback, callback)
    }
}
