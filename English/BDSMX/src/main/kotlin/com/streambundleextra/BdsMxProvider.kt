package com.streambundleextra

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import java.net.URLEncoder
import org.json.JSONObject
import org.json.JSONArray
import okio.ByteString.Companion.decodeBase64

/** The public site is JavaScript-only; use its declared catalogue and metadata endpoints. */
class BdsMxProvider:MainAPI() {
    override var name="BDSMX"
    override var mainUrl="https://bdsmx.tube"
    override var lang="en"
    override val supportedTypes=setOf(TvType.NSFW)
    override val hasMainPage=true
    override val hasDownloadSupport=true
    override val hasQuickSearch=false
    override val mainPage=mainPageOf("latest-updates" to "Videos","top-rated" to "Top rated")
    private suspend fun json(url:String)=JSONObject(app.get(url,headers=Network.headers(mainUrl) + mapOf(
        "Cookie" to "kt_lang=ru", "Accept-Language" to Network.RUSSIAN_LANGUAGE,
    )).text)
    private fun label(item:JSONObject,key:String):String=listOf(item.optString(key+"_ru"),item.optString(key+"_en"),item.optString(key)).firstOrNull(Metadata::sourceValue).orEmpty()
    private fun tags(item:JSONObject):List<String> {
        fun labels(raw:Any?):List<String> = when(raw) {
            is JSONObject->raw.keys().asSequence().mapNotNull{key->val v=raw.opt(key);when(v){is JSONObject->label(v,"title");is String->v;else->null}}.toList()
            is JSONArray->(0 until raw.length()).mapNotNull{i->val v=raw.opt(i);when(v){is JSONObject->label(v,"title");is String->v;else->null}}
            else->emptyList()
        }
        val raw=item.opt("tags")
        val tags=if(raw is String)raw.split(',') else labels(raw)
        val categories=labels(item.opt("categories"))
        val encoded=item.optString("categories_data").takeIf{it.startsWith("{")||it.startsWith("[")}
        val extra=try{encoded?.let{labels(org.json.JSONTokener(it).nextValue())}.orEmpty()}catch(_:Exception){emptyList()}
        return (tags+categories+extra).mapNotNull(Metadata::tag).filterNot{it.all(Char::isDigit)}.distinct()
    }
    private fun image(item:JSONObject)=listOf("scr","thumbsrc","thumb","poster").mapNotNull{Metadata.imageUrl(mainUrl,item.optString(it))}.firstOrNull()
    private fun card(item:JSONObject):SearchResponse? {
        val id=item.optString("video_id");val title=label(item,"title")
        if(id.isBlank()||title.isBlank()||!ContentPolicy.accepts(title,tags(item)))return null
        val url="$mainUrl/video/$id/${item.optString("dir")}/"
        return newMovieSearchResponse(Metadata.title(url,listOf(title)),url,TvType.NSFW){posterUrl=image(item);posterHeaders=Network.headers(mainUrl)}
    }
    private suspend fun catalogue(query:String,page:Int,sort:String="relevance"):SearchResponseList {
        val q=URLEncoder.encode(query,"UTF-8")
        val endpoint=if(query.isBlank())"$mainUrl/api/json/videos2/86400/str/$sort/60/..$page.all...json" else "$mainUrl/api/videos2.php?params=86400/str/relevance/60/search..$page.all..&s=$q"
        val payload=json(endpoint)
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
    override suspend fun search(query: String, page: Int): SearchResponseList =
        if (query.isBlank()) newSearchResponseList(emptyList(), false) else catalogue(query, page)

    override suspend fun load(url:String):LoadResponse {
        val id=Regex("/video/(\\d+)").find(url)?.groupValues?.get(1)?.toLongOrNull() ?: throw ErrorLoadingException("Invalid video ID")
        val item=json("$mainUrl/api/json/video/86400/${id/1000000*1000000}/${id/1000*1000}/$id.json").optJSONObject("video") ?: throw ErrorLoadingException("Video metadata is missing")
        val title=label(item,"title");val labels=tags(item)
        if(!ContentPolicy.accepts(title,labels))throw ErrorLoadingException("Video hidden by category filter")
        val related=RequestLimits.optional { labels.firstOrNull()?.let{catalogue(it,1).items.filter{r->r.url!=url}} }.orEmpty()
        return newMovieLoadResponse(Metadata.title(url,listOf(title)),url,TvType.NSFW,url){
            posterUrl=image(item);posterHeaders=Network.headers(mainUrl);plot=label(item,"description");tags=labels;recommendations=related
            applyVideoDuration(item.optString("duration"))
        }
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean {
        val id=Regex("/video/(\\d+)").find(data)?.groupValues?.get(1) ?: return false
        val text=app.get("$mainUrl/api/videofile.php?video_id=$id&lifetime=8640000",headers=Network.headers(data)).text
        val files=JSONArray(text);var count=0
        val alphabet="АВСDЕFGHIJKLМNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,~"
        for(i in 0 until files.length()) {
            val item=files.optJSONObject(i)?:continue;val encoded=item.optString("video_url");if(encoded.isBlank())continue
            val normalized=encoded.map{c->val n=alphabet.indexOf(c);if(n<0)"" else "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="[n].toString()}.joinToString("")
            val path=try{normalized.decodeBase64()?.utf8() ?: continue}catch(_:Exception){continue}
            val url=java.net.URI(mainUrl).resolve(path).toString()
            if(!url.startsWith("http"))continue
            callback(com.lagradost.cloudstream3.utils.newExtractorLink(name,name,url,com.lagradost.cloudstream3.utils.INFER_TYPE){referer=data;headers=Network.headers(data)})
            count++
        }
        return count>0
    }
}
