package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import com.cloudextensions.russian.*
import org.json.*
import org.jsoup.nodes.Document
import java.net.URLEncoder
import java.net.URI
import okhttp3.HttpUrl.Companion.toHttpUrl

object NativeApis {
    private fun label(item:JSONObject,key:String)=listOf(item.optString(key+"_en"),item.optString(key)).firstOrNull(Metadata::sourceValue).orEmpty()
    private fun tags(item:JSONObject):List<String> {
        val result=mutableListOf<String>()
        fun read(v:Any?) {when(v){is String->v.split(',').forEach{Metadata.tag(it)?.let(result::add)};is JSONArray->for(i in 0 until v.length())read(v.opt(i));is JSONObject->if(v.has("title")){Metadata.tag(label(v,"title"))?.let(result::add)}else for(k in v.keys())read(v.opt(k))}}
        read(item.opt("tags"));read(item.opt("categories"));return result.distinct()
    }
    private fun poster(p:Profile,item:JSONObject)=listOf("scr","thumbsrc","thumb","poster").firstNotNullOfOrNull{Metadata.imageUrl(p.base,item.optString(it))}
    private suspend fun json(p:Profile,url:String)=JSONObject(Network.page(PageRequest(url,headers=p.requestHeaders),p.base).wholeText())
    suspend fun wordpressLatest(p:Profile,page:Int):Pair<List<VideoCard>,PageRequest?> {
        val url=p.base+"/wp-json/wp/v2/posts?per_page=20&page=$page&orderby=date&order=desc&_embed=wp:featuredmedia&_fields=id,link,title,date,_links,_embedded"
        val response=Network.response(PageRequest(url,headers=p.requestHeaders),p.base)
        val rows=JSONArray(response.text)
        val cards=(0 until rows.length()).mapNotNull{i->
            val item=rows.getJSONObject(i);val link=item.optString("link").takeIf{it.startsWith("http")} ?: return@mapNotNull null
            val title=Metadata.title(link,listOf(org.jsoup.Jsoup.parse(item.optJSONObject("title")?.optString("rendered").orEmpty()).text()))
            if(title.isBlank())return@mapNotNull null
            val media=item.optJSONObject("_embedded")?.optJSONArray("wp:featuredmedia")?.optJSONObject(0)
            val sizes=media?.optJSONObject("media_details")?.optJSONObject("sizes")
            val image=listOf("medium","medium_large","large").firstNotNullOfOrNull{key->sizes?.optJSONObject(key)?.optString("source_url")?.takeIf{it.isNotBlank()}} ?: media?.optString("source_url")
            val poster=Metadata.rememberPoster(link,image)
            VideoCard(title,link,poster)
        }
        val pages=response.headers["X-WP-TotalPages"]?.toIntOrNull() ?: page
        return cards to PageRequest(url.toHttpUrl().newBuilder().setQueryParameter("page",(page+1).toString()).build().toString()).takeIf{page<pages}
    }
    suspend fun catalog(p:Profile,query:String,page:Int,request:PageRequest):Pair<List<VideoCard>,PageRequest?> {
        val sort=request.url.toHttpUrl().queryParameter("sort_by") ?: if(query.isBlank())"latest-updates" else "relevance"
        val q=URLEncoder.encode(query,"UTF-8")
        val url=if(query.isBlank())"${p.base}/api/json/videos2/86400/str/$sort/60/..$page.all...json" else "${p.base}/api/videos2.php?params=86400/str/$sort/60/search..$page.all..&s=$q"
        val payload=json(p,url);val list=payload.optJSONArray("videos") ?: JSONArray()
        val cards=(0 until list.length()).mapNotNull{i->val v=list.optJSONObject(i) ?: return@mapNotNull null;val id=v.optString("video_id");val title=label(v,"title");if(id.isBlank()||title.isBlank()||!ContentPolicy.accepts(title,tags(v)))null else VideoCard(title,"${p.base}/video/$id/${v.optString("dir")}/",poster(p,v),Metadata.timing(v.optString("duration")),tags(v))}
        return cards to request.takeIf{page<payload.optInt("pages",page)}
    }
    suspend fun detail(p:Profile,url:String):VideoDetail {
        val id=Regex("/video/(\\d+)").find(url)?.groupValues?.get(1)?.toLongOrNull() ?: throw java.io.IOException("Invalid source video ID")
        val item=json(p,"${p.base}/api/json/video/86400/${id/1000000*1000000}/${id/1000*1000}/$id.json").optJSONObject("video") ?: throw java.io.IOException("Source video metadata missing")
        val title=Metadata.title(url,listOf(label(item,"title")));val tags=tags(item)
        if(!ContentPolicy.accepts(title,tags))throw java.io.IOException("Видео скрыто фильтром категорий")
        return VideoDetail(title,poster(p,item),Metadata.description(label(item,"description"),title),tags,Metadata.timing(item.optString("duration")),null)
    }
    suspend fun apiSources(p:Profile,url:String):List<Playback.Source> {
        val id=Regex("/video/(\\d+)").find(url)?.groupValues?.get(1) ?: return emptyList()
        val raw=Network.page(PageRequest("${p.base}/api/videofile.php?video_id=$id&lifetime=8640000",headers=p.requestHeaders),url).wholeText()
        val list=JSONArray(raw)
        return (0 until list.length()).mapNotNull{i->val item=list.optJSONObject(i) ?: return@mapNotNull null;if(item.optString("format")=="_tr.mp4")return@mapNotNull null;val decoded=EmbeddedPlayers.decodeAb(item.optString("video_url")) ?: return@mapNotNull null;Playback.Source(WebUrls.resolve(p.base,decoded) ?: return@mapNotNull null)}
    }
    suspend fun beegSearch(p:Profile,query:String,page:Int):Pair<List<VideoCard>,PageRequest?> {
        val endpoint="https://api-search.xv-cdn.net/search/?format=ajax&k=${URLEncoder.encode(query,"UTF-8")}&p=$page"
        val raw=Network.page(PageRequest(endpoint),p.base).wholeText();val root=JSONTokener(raw).nextValue();val cards=mutableListOf<VideoCard>()
        fun scan(value:Any?,depth:Int) {
            if(depth>10)return
            when(value) {
                is JSONObject->{if(value.has("video_id")&&value.has("video_id_encode")&&value.has("title")) {
                    val url="${p.base}/xid/${value.optString("video_id")}/?e=${value.optString("video_id_encode")}";val title=value.optString("title")
                    if(ContentPolicy.accepts(title))cards+=VideoCard(Metadata.title(url,listOf(title)),url,Metadata.imageUrl(p.base,value.optString("thumb")),Metadata.timing(value.optString("dur")))
                }else for(key in value.keys())scan(value.opt(key),depth+1)}
                is JSONArray->for(i in 0 until value.length())scan(value.opt(i),depth+1)
            }
        }
        scan(root,0);return cards.distinctBy{it.url} to PageRequest(endpoint).takeIf{cards.isNotEmpty()}
    }
    suspend fun beegDetail(p:Profile,url:String,document:Document):VideoDetail {
        val id=Regex("/(?:xid/|play/\\d+-)(\\d+)").find(url)?.groupValues?.get(1) ?: return Metadata.detail(document,p.spec)
        val e=url.toHttpUrl().queryParameter("e").orEmpty()
        val meta=json(p,"https://api-search.xv-cdn.net/id/$id/?format=ajax&e=$e")
        val base=Metadata.detail(document,p.spec);val title=Metadata.title(url,listOf(meta.optString("title"),base.title))
        return base.copy(title=title,poster=Metadata.choosePoster(url,meta.optString("thumb"),base.poster),tags=meta.optString("cats").split(',').map{it.trim().trim('*')}.mapNotNull(Metadata::tag).ifEmpty{base.tags},duration=Metadata.timing(meta.optString("dur")).ifBlank{base.duration})
    }
}
