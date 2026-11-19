package com.CXXX

// Based on phisher98/CXXX NoodleMagazineProvider; original search routes/order retained.
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.Interceptor
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element
import org.json.JSONObject
import org.json.JSONTokener

class NoodleMagazineProvider : MainAPI(),SearchPolicy,NoodlePosterSource {
    override var mainUrl = "https://tyler-brown.com"
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
    private val spec get()=SiteSpec("UKDevilz",name,mainUrl,"div.item","a[href]","div.i_info div.title",emptyList(),
        tagSelector="#videoTagsBar a.vtag",titleLanguage="en",detailTitleSelector="div.l_info h1")
    private suspend fun document(url:String):Document = app.get(url,headers=mapOf("Cookie" to "ui_lang=en","Accept-Language" to "en-US,en;q=0.9")).document

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val curpage = page - 1
        val link = "$mainUrl/video/${request.data}?p=$curpage"
        val document = document(link)
        val home = document.select("div.item").mapNotNull { it.toSearchResult() }
        return newHomePageResponse(request.name, home)
    }

    private fun Element.toSearchResult(): MovieSearchResponse? {
        val href = fixUrl(this.selectFirst("a")?.attr("href") ?: return null)
        val title = this.selectFirst("a div.i_info div.title")?.text() ?: return null
        val poster=Metadata.rememberPoster(href,Metadata.poster(this,mainUrl))
        return newMovieSearchResponse(Metadata.title(href,listOf(title)), href, TvType.NSFW) {
            posterUrl=poster
            posterHeaders=Network.imageHeaders(poster,"$mainUrl/")
        }
    }

    override suspend fun search(query: String, page: Int): SearchResponseList? {
        val document = document("$mainUrl/video/$query?p=$page")
        val results = document.select("div.item").mapNotNull { it.toSearchResult() }
        val hasNext = if(results.isEmpty()) false else true
        return newSearchResponseList(results, hasNext)
    }

    override suspend fun posterPage(url: String): Document = document(url)

    override suspend fun fullTitle(url:String):String? = Metadata.detail(document(url),spec).title

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
        return tags.mapNotNull{if(cyrillic.containsMatchIn(it))terms[it.lowercase()] ?: mapping[it] else it}.mapNotNull(Metadata::tag).distinctBy{it.lowercase()}
    }

    override suspend fun load(url: String): LoadResponse {
        val document=document(url)
        val metadata=Metadata.detail(document,spec)
        rememberNoodlePosters(url, document)
        if(metadata.title.isBlank())throw ErrorLoadingException("Источник не предоставил название")
        val originalTags=document.select("#videoTagsBar a.vtag").map{it.text()}
        if(!ContentPolicy.accepts(metadata.title+" "+document.selectFirst("div.l_info h1")?.text().orEmpty(),originalTags))throw ErrorLoadingException("Видео скрыто фильтром категорий")
        val categories=englishTags(document)
        val recommendations=document.select("div.item").mapNotNull{it.toSearchResult()}
        return newMovieLoadResponse(metadata.title,url,TvType.NSFW,url) {
            posterUrl=metadata.poster
            posterHeaders=Network.imageHeaders(metadata.poster,url)
            tags=categories
            plot=null
            this.recommendations=recommendations
            applyVideoDuration(metadata.duration)
        }
    }

    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean {
        val page=document(data)
        val playlist=page.select("script").firstNotNullOfOrNull { script ->
            val start=Regex("""window\.playlist\s*=\s*""").find(script.data()) ?: return@firstNotNullOfOrNull null
            try{JSONTokener(script.data().substring(start.range.last+1)).nextValue() as? JSONObject}catch(_:Exception){null}
        } ?: throw ErrorLoadingException("Источник не предоставил плейлист")
        val sources=playlist.optJSONArray("sources") ?: throw ErrorLoadingException("В плейлисте нет источников")
        val seen=mutableSetOf<String>()
        var emitted=0
        for(i in 0 until sources.length()) {
            val source=sources.optJSONObject(i) ?: continue
            val url=fixUrlNull(source.optString("file"))?.takeIf{it.startsWith("https://")||it.startsWith("http://")} ?: continue
            if(!seen.add(url))continue
            val headers=Network.headers("$mainUrl/")+mapOf("User-Agent" to PLAYER_AGENT)
            val working=RequestLimits.optional(2200){withContext(Dispatchers.IO){
                val request=okhttp3.Request.Builder().url(url).header("Range","bytes=0-31")
                headers.forEach{(key,value)->request.header(key,value)}
                app.baseClient.newBuilder().callTimeout(2,java.util.concurrent.TimeUnit.SECONDS).build().newCall(request.build()).execute().use { response ->
                    val type=response.header("Content-Type").orEmpty()
                    response.isSuccessful && (type.startsWith("video/") || type.contains("mpegurl") || type.contains("octet-stream"))
                }
            }}==true
            if(!working)continue
            val label=source.optString("label")
            val resolution=label.removeSuffix("p").toIntOrNull()
            emitted++
            callback(newExtractorLink(name,"",url,INFER_TYPE){
                referer="$mainUrl/"
                quality=resolution ?: Qualities.Unknown.value
                this.headers=headers
            })
        }
        if(emitted==0)throw ErrorLoadingException("Нет доступных потоков: серверы видео не ответили")
        return true
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor=Interceptor{chain->
        chain.proceed(chain.request().newBuilder().header("User-Agent",PLAYER_AGENT).header("Referer","$mainUrl/").build())
    }
    private companion object {const val PLAYER_AGENT="stagefright/1.2 (Linux;Android 13)"}
}
