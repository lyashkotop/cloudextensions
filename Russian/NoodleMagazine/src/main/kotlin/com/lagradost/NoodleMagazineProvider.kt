package com.lagradost

// Adapted from the Kotlin files supplied by the repository owner (package com.CXXX).
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import java.net.URLEncoder
import java.util.Collections
import kotlinx.coroutines.CancellationException
import okhttp3.Headers
import okhttp3.Interceptor
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.nodes.Document

class NoodleMagazineProvider: MainAPI(),SearchPolicy {
    override var mainUrl="https://tyler-brown.com"
    override var name="Noodle Magazine"
    override var lang="ru"
    override val translateQueries=false
    override val supportedTypes=setOf(TvType.NSFW)
    override val hasMainPage=true
    override val hasQuickSearch=false
    override val hasDownloadSupport=true
    override val mainPage=mainPageOf("/popular/month" to "Popular","/popular/trending" to "Trending","blonde" to "Blonde","milf" to "MILF","jav" to "JAV","lesbian" to "Lesbian")
    private val spec get()=SiteSpec("NoodleMagazine",name,mainUrl,"#list_videos div.item","a[href]","div.i_info div.title",emptyList(),tagSelector="#videoTagsBar a.vtag",descriptionSelector=".l_info .description",titleLanguage="ru")
    private val history=Collections.synchronizedMap(object:LinkedHashMap<String,MutableMap<Int,List<SearchResponse>>>(16,.75f,true){override fun removeEldestEntry(eldest:MutableMap.MutableEntry<String,MutableMap<Int,List<SearchResponse>>>?)=size>24})
    private fun route(query:String,page:Int)=PageRequest("$mainUrl/video/"+URLEncoder.encode(query,"UTF-8").replace("+","%20")+"?p="+(page-1),allowNotFound=true)
    private suspend fun document(request:PageRequest)=Network.page(request.copy(headers=mapOf("Cookie" to "ui_lang=ru","Accept-Language" to "ru-RU,ru;q=0.9")),"$mainUrl/")
    private fun response(card:VideoCard):SearchResponse=newMovieSearchResponse(card.title,card.url,TvType.NSFW){posterUrl=card.poster;posterHeaders=Network.headers("$mainUrl/")}
    private suspend fun results(query:String,page:Int):List<SearchResponse>{val request=route(query,page);return Metadata.searchCards(document(request),spec,request).map(::response)}
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse {
        if(page<1)return newHomePageResponse(request.name,emptyList(),false)
        val cards=if(request.data.startsWith("/")) {
            val endpoint=mainUrl+request.data+(if(request.data.contains('?'))"&" else "?")+"p="+(page-1)
            Metadata.cards(document(PageRequest(endpoint)),spec).map(::response)
        }else results(request.data,page)
        return newHomePageResponse(request.name,cards,cards.isNotEmpty())
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun search(query:String,page:Int):SearchResponseList {
        val input=Metadata.clean(query)
        if(input.isBlank()||page<1)return newSearchResponseList(emptyList(),false)
        if(page==1)synchronized(history){history[input]=mutableMapOf()}
        val merged=results(input,page).distinctBy{it.url}
        val pages=synchronized(history){history.getOrPut(input){mutableMapOf()}}
        val previous=synchronized(pages){pages.filterKeys{it<page}.values.flatten().map{it.url}.toSet()}
        val fresh=merged.filter{it.url !in previous}
        synchronized(pages){pages[page]=fresh}
        return newSearchResponseList(fresh,merged.isNotEmpty()&&(page==1||fresh.isNotEmpty()))
    }
    override suspend fun fullTitle(url:String):String? = Metadata.detail(document(PageRequest(url)),spec).title
    override suspend fun load(url:String):LoadResponse {
        val page=document(PageRequest(url));val detail=Metadata.detail(page,spec)
        if(detail.title.isBlank())throw ErrorLoadingException("Video title is missing")
        if(!ContentPolicy.accepts(detail.title,detail.tags))throw ErrorLoadingException("Video hidden by category filter")
        var related=Metadata.cards(page,spec.copy(cards="div.item")).filter{it.url!=url}.map(::response)
        if(related.isEmpty())detail.tags.firstOrNull{ContentPolicy.accepts(it)}?.let{tag->
            try{related=RequestLimits.optional { results(tag,1) }.orEmpty().filter{it.url!=url}}catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        return newMovieLoadResponse(detail.title,url,TvType.NSFW,url){
            posterUrl=detail.poster;posterHeaders=Network.headers("$mainUrl/");plot=Metadata.plot(detail);tags=detail.tags;recommendations=related
            val seconds=detail.duration.split(':').fold(0.0){total,p->total*60+(p.toDoubleOrNull()?:0.0)}
            if(seconds>0)duration=(seconds/60).toInt()
        }
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean {
        val page=document(PageRequest(data));val emitted=mutableSetOf<String>()
        for(script in page.select("script")) {
            val assignment=Regex("window\\.playlist\\s*=\\s*").find(script.data()) ?: continue
            val playlist=try{JSONTokener(script.data().substring(assignment.range.last+1)).nextValue() as? JSONObject}catch(_:Exception){null} ?: continue
            val sources=playlist.optJSONArray("sources") ?: continue
            for(i in 0 until sources.length()) {
                val item=sources.optJSONObject(i) ?: continue
                val url=item.optString("file").takeIf{it.startsWith("http://")||it.startsWith("https://")} ?: continue
                if(!emitted.add(url))continue
                callback(newExtractorLink(name,name,url,INFER_TYPE){referer=mainUrl;quality=getQualityFromName(item.optString("label"));headers=mapOf("User-Agent" to PLAYER_AGENT)})
            }
        }
        return emitted.isNotEmpty()
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor=Interceptor{chain->
        val original=chain.request();val headers=Headers.Builder().add("User-Agent",PLAYER_AGENT)
        // Retain byte ranges for seeking while using the source's required player identity.
        for(name in listOf("Range","If-Range"))original.header(name)?.let{headers.add(name,it)}
        chain.proceed(original.newBuilder().headers(headers.build()).build())
    }
    private companion object {const val PLAYER_AGENT="stagefright/1.2 (Linux;Android 13)"}
}
