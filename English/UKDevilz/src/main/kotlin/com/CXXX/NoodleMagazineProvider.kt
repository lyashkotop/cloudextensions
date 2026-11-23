package com.CXXX

// Based on phisher98/CXXX NoodleMagazineProvider; original search routes/order retained.
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import java.util.Collections
import okhttp3.Interceptor
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element
import org.json.JSONObject

class NoodleMagazineProvider : MainAPI(),SearchPolicy,NoodlePosterSource {
    override var mainUrl = "https://tyler-brown.com"
    override val posterPlaybackReferer get() = "$mainUrl/"
    override var name = "Noodle Magazine"
    override val hasMainPage = true
    override var lang = "en"
    override val translateQueries=false
    override val hasDownloadSupport = true
    override val supportedTypes = setOf(TvType.NSFW)
    override val mainPage = mainPageOf(
        "latest" to "Latest", "onlyfans" to "Onlyfans", "latina" to "Latina",
        "blonde" to "Blonde", "milf" to "MILF", "jav" to "JAV",
        "hentai" to "Hentai", "lesbian" to "Lesbian"
    )
    private val homePages = NoodleCatalogue()
    private val searchPages = NoodleCatalogue()
    private val listingTitles = Collections.synchronizedMap(object : LinkedHashMap<String, String>(128, .75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, String>?) = size > 256
    })
    private val watchPath = Regex("""/watch/(-?\d+(?:_\d+)?)/?""")
    private val escapedUnicode = Regex("""\\u([a-fA-F0-9]{4})""")
    private val genericTitle = Regex(
        """(?i)^(?:video|watch video|watch online|free porn videos?|popular videos?|video (?:not found|unavailable|deleted)|noodle magazine|ukdevilz)[.!]?$"""
    )
    private val spec get()=SiteSpec("UKDevilz",name,mainUrl,"div.item","a[href]","div.i_info div.title",emptyList(),
        tagSelector="#videoTagsBar a.vtag",titleLanguage="en",detailTitleSelector="div.l_info h1")
    private suspend fun document(url:String):Document = app.get(url,headers=mapOf("Cookie" to "ui_lang=en","Accept-Language" to "en-US,en;q=0.9")).document

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val curpage = page - 1
        val link = "$mainUrl/video/${request.data}?p=$curpage"
        val home = homePages.page(request.data, page) {
            document(link).select("div.item").mapNotNull { it.toSearchResult() }
        }
        return newHomePageResponse(request.name, home, home.isNotEmpty())
    }

    private fun Element.toSearchResult(): MovieSearchResponse? {
        val href = fixUrl(this.selectFirst("a")?.attr("href") ?: return null)
        val title = this.selectFirst("a div.i_info div.title")?.text() ?: return null
        if (usableTitle(title)) listingTitles[watchId(href) ?: href] = title
        val poster=Metadata.rememberPoster(href,Metadata.poster(this,mainUrl))
        return newMovieSearchResponse(Metadata.title(href,listOf(title)), href, TvType.NSFW) {
            posterUrl=poster
            posterHeaders=Network.imageHeaders(poster,"$mainUrl/")
        }
    }

    override suspend fun search(query: String, page: Int): SearchResponseList? {
        val results = searchPages.page(query, page) {
            document("$mainUrl/video/$query?p=$page").select("div.item").mapNotNull { it.toSearchResult() }
        }
        return newSearchResponseList(results, results.isNotEmpty())
    }

    override suspend fun posterPage(url: String): Document = document(url)

    private fun watchId(url: String): String? =
        url.toHttpUrlOrNull()?.encodedPath?.let { watchPath.matchEntire(it)?.groupValues?.get(1) }

    private fun usableTitle(value: String): Boolean = Metadata.sourceValue(value) && !genericTitle.matches(value)

    private fun videoTitle(url: String, page: Document): String? {
        val requested = watchId(url)
        val actual = watchId(page.baseUri())
        if (requested != null && actual != null && requested != actual) {
            throw ErrorLoadingException("Сайт вернул страницу другого видео")
        }
        val heading = page.selectFirst("div.l_info h1")
        val title = heading?.selectFirst("[data-video-title-translations], [data-video-title-base]") ?: heading
        val translated = title?.attr("data-video-title-translations")?.let { raw ->
            runCatching { JSONObject(raw).optString("en") }.getOrNull()
        }?.let { value ->
            escapedUnicode.replace(value) { it.groupValues[1].toInt(16).toChar().toString() }
        }
        return listOf(translated, title?.text(), title?.attr("data-video-title-base"), listingTitles[requested ?: url])
            .map(Metadata::clean).firstOrNull(::usableTitle)
    }

    override suspend fun fullTitle(url:String):String? = videoTitle(url, document(url))

    private suspend fun englishTags(page:Document):List<String> {
        val tags=page.select("#videoTagsBar a.vtag").mapNotNull { element ->
            val english=try{JSONObject(element.attr("data-tag-translations")).optString("en")}catch(_:Exception){""}
            Metadata.tag(english.ifBlank{element.text()})
        }.distinctBy{it.lowercase()}
        val cyrillic=Regex("[А-Яа-яЁё]")
        val terms=mapOf("член" to "penis")
        val pending=tags.filter{cyrillic.containsMatchIn(it) && it.lowercase() !in terms}
        val translated=if(pending.isEmpty())emptyList() else RequestLimits.optional(3500){Translation.text(pending.joinToString("\n"),"en")}?.split(Regex("[\r\n]+"))?.map(String::trim)?.filter(String::isNotBlank)
        val mapping=if(translated!=null && translated.size==pending.size)pending.zip(translated).toMap() else emptyMap()
        return tags.map { tag -> terms[tag.lowercase()] ?: mapping[tag] ?: tag }
            .mapNotNull(Metadata::tag).distinctBy { it.lowercase() }
    }

    override suspend fun load(url: String): LoadResponse {
        val document=document(url)
        val title=videoTitle(url,document) ?: throw ErrorLoadingException("Источник не предоставил название видео")
        val metadata=Metadata.detail(document,spec)
        rememberNoodlePosters(url, document)
        val originalTags=document.select("#videoTagsBar a.vtag").map{it.text()}
        if(!ContentPolicy.accepts(title+" "+document.selectFirst("div.l_info h1")?.text().orEmpty(),originalTags,metadata.description))throw ErrorLoadingException("Видео скрыто фильтром категорий")
        val categories=englishTags(document)
        val recommendations = NoodleCatalogue.distinct(document.select("div.item").mapNotNull { it.toSearchResult() }, url)
        return newMovieLoadResponse(title,url,TvType.NSFW,url) {
            score = VideoScores.detail("UKDevilz",url,document)
            posterUrl=metadata.poster
            posterHeaders=Network.imageHeaders(metadata.poster,url)
            tags=categories
            plot=null
            this.recommendations=recommendations
            applyVideoDuration(metadata.duration)
        }
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean = NoodlePlayback.links(name, document(data), data, "$mainUrl/", callback)

    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor=Interceptor{chain->
        chain.proceed(chain.request().newBuilder().header("User-Agent",NoodlePlayback.USER_AGENT).header("Referer","$mainUrl/").build())
    }
}
