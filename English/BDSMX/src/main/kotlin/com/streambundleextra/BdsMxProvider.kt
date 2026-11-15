package com.streambundleextra

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import java.net.URLEncoder
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withTimeoutOrNull
import org.json.JSONObject
import org.json.JSONArray

/** The public site is JavaScript-only; use its declared catalogue and metadata endpoints. */
class BdsMxProvider:MainAPI() {
    override var name="BDSMX"
    override var mainUrl="https://bdsmx.tube"
    override var lang="en"
    override val supportedTypes=setOf(TvType.NSFW)
    override val hasMainPage=true
    override val hasDownloadSupport=true
    override val hasQuickSearch=false
    override val mainPage=mainPageOf("post_date" to "Videos","rating" to "Top rated")
    private suspend fun json(url:String)=JSONObject(app.get(url,headers=Network.headers(mainUrl)).text)
    private fun label(item:JSONObject,key:String):String=item.optString(key+"_en").ifBlank{item.optString(key)}
    private fun tags(item:JSONObject):List<String> {
        val raw=item.opt("tags")
        return when(raw){
            is JSONObject->raw.keys().asSequence().mapNotNull{key->val value=raw.opt(key);when(value){is JSONObject->label(value,"title");is String->value;else->null}}.filter{it.isNotBlank()}.toList()
            is String->raw.split(',').map{it.trim()}.filter{it.isNotBlank()}
            is JSONArray->(0 until raw.length()).map{raw.optString(it)}.filter{it.isNotBlank()}
            else->emptyList()
        }.distinct()
    }
    private fun image(item:JSONObject)=listOf("scr","thumbsrc","thumb","poster").map{item.optString(it)}.firstOrNull{it.startsWith("http://")||it.startsWith("https://")}
    private fun card(item:JSONObject):SearchResponse? {
        val id=item.optString("video_id");val title=label(item,"title")
        if(id.isBlank()||title.isBlank()||!ContentPolicy.accepts(title,tags(item)))return null
        val url="$mainUrl/video/$id/${item.optString("dir")}/"
        return newMovieSearchResponse(Metadata.title(url,listOf(title)),url,TvType.NSFW){posterUrl=image(item);posterHeaders=Network.headers(mainUrl)}
    }
    private suspend fun catalogue(query:String,page:Int,sort:String="relevance"):SearchResponseList {
        val q=URLEncoder.encode(query,"UTF-8");val payload=json("$mainUrl/api/videos2.php?params=86400/str/$sort/60/search..$page.all..&s=$q")
        val videos=payload.optJSONArray("videos") ?: JSONArray()
        val cards=(0 until videos.length()).mapNotNull{videos.optJSONObject(it)?.let(::card)}.distinctBy{it.url}
        return newSearchResponseList(cards,page<payload.optInt("pages",page))
    }
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse {
        val results=catalogue("",page,request.data)
        return newHomePageResponse(request.name,results.items,results.hasNext)
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun search(query:String,page:Int):SearchResponseList {
        if(query.isBlank())return newSearchResponseList(emptyList(),false)
        val results=coroutineScope{
            val original=async{catalogue(query,page)}
            val translated=async{withTimeoutOrNull(2500){Translation.translated(query)}?.let{catalogue(it,page)}}
            listOfNotNull(original.await(),translated.await())
        }
        return newSearchResponseList(results.flatMap{it.items}.distinctBy{it.url},results.any{it.hasNext})
    }
    override suspend fun load(url:String):LoadResponse {
        val id=Regex("/video/(\\d+)").find(url)?.groupValues?.get(1)?.toLongOrNull() ?: throw ErrorLoadingException("Invalid video ID")
        val item=json("$mainUrl/api/json/video/86400/${id/1000000*1000000}/${id/1000*1000}/$id.json").optJSONObject("video") ?: throw ErrorLoadingException("Video metadata is missing")
        val title=label(item,"title");val labels=tags(item)
        if(!ContentPolicy.accepts(title,labels))throw ErrorLoadingException("Video hidden by category filter")
        val related=labels.firstOrNull()?.let{catalogue(it,1).items.filter{r->r.url!=url}}.orEmpty()
        return newMovieLoadResponse(Metadata.title(url,listOf(title)),url,TvType.NSFW,url){
            posterUrl=image(item);posterHeaders=Network.headers(mainUrl);plot=label(item,"description");tags=labels;recommendations=related
            val seconds=Metadata.timing(item.optString("duration")).split(':').fold(0.0){a,b->a*60+(b.toDoubleOrNull()?:0.0)}
            if(seconds>0)duration=(seconds/60).toInt()
        }
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean = Playback.links(name,mainUrl,data,subtitleCallback,callback)
}
