package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import com.cloudextensions.russian.*
import java.net.URI
import java.net.URLEncoder
import java.util.Collections
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.sync.withPermit
import org.json.JSONArray
import org.json.JSONObject
import org.jsoup.nodes.Document
import okhttp3.HttpUrl.Companion.toHttpUrl

data class Results(val cards:List<VideoCard>,val hasNext:Boolean)
class Engine(val profile:Profile) {
    private val p get()=profile
    private val metadata=Collections.synchronizedMap(object:LinkedHashMap<String,VideoDetail>(128,.75f,true){override fun removeEldestEntry(e:MutableMap.MutableEntry<String,VideoDetail>?)=size>128})
    private val root=object {var page:Document?=null}
    suspend fun page(request:PageRequest):Document=Network.page(request.copy(headers=p.requestHeaders+request.headers),p.base+"/")
    private suspend fun homepage():Document=root.page ?: page(PageRequest(p.base+if(p.engine=="noodle")"/recent" else "/")).also{root.page=it}
    private fun enc(text:String)=URLEncoder.encode(text,"UTF-8").replace("+","%20")
    private suspend fun searchRoute(query:String):PageRequest=when(p.engine) {
        "noodle"->PageRequest(p.base+"/video/"+enc(query)+"?p=0",allowNotFound=true)
        "eporner"->PageRequest(p.base+"/search/"+enc(query.replace(' ','-'))+"/",allowNotFound=true)
        "heavy"->PageRequest(p.base+"/search/"+enc(query)+"_1.html",allowNotFound=true)
        "wordpress"->PageRequest(p.base+"/?s="+enc(query),allowNotFound=true)
        "missav"->PageRequest(p.base+"/en/search/"+enc(query),allowNotFound=true)
        "avideo"->PageRequest(p.base+"/search/videos?search_query="+enc(query)+"&type=public",allowNotFound=true)
        "safari"->PageRequest(p.base+"/search/"+enc(query),allowNotFound=true)
        else->Pagination.search(homepage(),p.spec,p.base,query).copy(allowNotFound=true)
    }
    private fun withOrder(request:PageRequest,order:Order?):PageRequest {
        if(order==null)return request
        if(request.data!=null)return request.copy(data=request.data+mapOf(order.key to order.value))
        return request.copy(url=request.url.toHttpUrl().newBuilder().setQueryParameter(order.key,order.value).build().toString())
    }
    private suspend fun browseRoute(popular:Boolean):String {
        if(p.engine=="bdsmx")return p.base+if(popular)"/?sort_by=top-rated" else "/?sort_by=latest-updates"
        if(p.engine=="safari")return p.base+"/api?method=search&query=&sort="+(if(popular)"best" else "new")+"&page=0"
        if(p.id=="Huyamba"&&popular)return p.base+"/videos/?by=video_viewed"
        if(p.engine=="noodle")return p.base+if(popular)"/popular/trending" else "/recent"
        val desired=if(popular)Regex("(?iu)popular|most.view|trending|популяр|top rated|топ|лучшее|просмотры") else Regex("(?iu)latest|recent|new video|новин|новые")
        val nav=p.catalog.optJSONArray("navigation")
        if(nav!=null)for(i in 0 until nav.length()){val item=nav.getJSONObject(i);if(desired.containsMatchIn(item.optString("label")))return item.getString("url")}
        val sections=p.data.optJSONArray("sections")
        if(sections!=null)for(i in 0 until sections.length()){val item=sections.getJSONObject(i);if(desired.containsMatchIn(item.optString("name")))return WebUrls.resolve(p.base,item.getString("path")) ?: continue}
        if(!popular)return p.base+"/"
        val doc=homepage()
        for(a in doc.select("nav a[href],header a[href],.sort a[href],.sorting a[href],a[href]")) {
            if(a.selectFirst("img")!=null || !desired.containsMatchIn(a.text()+" "+a.attr("title")) || a.text().length>60)continue
            val route=webUri(WebUrls.resolve(doc.baseUri(),a.attr("href")) ?: continue);if(route.host==webUri(doc.baseUri()).host && route.toString()!=doc.baseUri() && route.fragment==null)return route.toString()
        }
        return when(p.engine) {
            "eporner"->p.base+if(popular)"/most-viewed/" else "/"
            "beeg"->p.base+if(popular)"/trends/" else "/new/"
            "missav"->p.base+if(popular)"/en/monthly-hot" else "/en/new"
            "avideo"->p.base+"/videos?type=public&o="+if(popular)"mv" else "mr"
            "wordpress"->if(popular)p.base+"/most-watched-rank/" else p.base+"/"
            else->if(!popular)p.base+"/" else throw java.io.IOException("Сайт не публикует доступный раздел популярного")
        }
    }
    private class Branch(val query:String,var cursor:PageRequest?,var ended:Boolean=false)
    private class State(val branches:MutableList<Branch>,val selection:Selection) {
        val created=System.nanoTime();val mutex=Mutex();val pages=mutableMapOf<Int,Results>();val seen=mutableSetOf<String>();var number=0
    }
    private val states=Collections.synchronizedMap(object:LinkedHashMap<String,State>(16,.75f,true){override fun removeEldestEntry(e:MutableMap.MutableEntry<String,State>?)=size>16})
    suspend fun browse(page:Int,popular:Boolean)=search("",page,Selection(),if(popular)"popular" else "latest")
    suspend fun search(query:String,page:Int,selection:Selection,mode:String="search"):Results {
        require(page>0)
        if(selection.durationBands.isEmpty())return Results(emptyList(),false)
        if(query.isNotBlank() && !ContentPolicy.accepts(query))return Results(emptyList(),false)
        val directTag=if(query.isBlank()&&selection.category==null&&selection.tags.size==1)selection.tags.single().let{tag->p.tags.firstOrNull{it.label.equals(tag,true)&&it.url.startsWith("http")}} else null
        val directCategory=selection.category?.takeIf{it.url.startsWith("http")}
        val effective=if(query.isBlank())selection.copy(category=if(directCategory!=null)null else selection.category,tags=if(directTag!=null)emptyList() else selection.tags) else selection
        val key="$mode|$query|$selection"
        val state=synchronized(states){if(page==1&&states[key]?.let{System.nanoTime()-it.created>8_000_000_000L}==true)states.remove(key);states.getOrPut(key){State(mutableListOf(),selection)}}
        return Metadata.scoped(p.id){state.mutex.withLock {
            if(state.branches.isEmpty() && state.number==0) {
                if(mode!="search" || query.isBlank()) {
                    val route=directCategory?.url ?: directTag?.url ?: browseRoute(mode=="popular")
                    state.branches+=Branch("",withOrder(PageRequest(route),selection.order))
                }else {
                    state.branches+=Branch(query,withOrder(searchRoute(query),selection.order))
                    if(p.translate)RequestLimits.optional(2500){Translation.translated(query)}?.takeUnless{it.equals(query,true)}?.let{state.branches+=Branch(it,withOrder(searchRoute(it),selection.order))}
                }
            }
            while(state.number<page) {
                val items=mutableListOf<VideoCard>()
                var succeeded=false
                var failed:Exception?=null
                // Each branch retains its own native cursor; original-language items stay first.
                val batches=coroutineScope{state.branches.filter{!it.ended}.map{branch->async(Dispatchers.IO){branch to try{Result.success(fetch(branch.query,branch.cursor!!,state.number+1))}catch(e:CancellationException){throw e}catch(e:Exception){Result.failure(e)}}}.awaitAll()}
                for((branch,batch) in batches) {
                    val result=batch.getOrElse{branch.ended=true;branch.cursor=null;failed=it as? Exception;null} ?: continue
                    succeeded=true
                    branch.cursor=result.second?.let{withOrder(it,selection.order)};branch.ended=branch.cursor==null
                    var cards=result.first.filter{videoKey(it.url) !in state.seen}
                    if(result.first.isNotEmpty()&&cards.isEmpty()){branch.ended=true;branch.cursor=null}
                    if(effective.needsDetail)cards=filter(cards,effective)
                    for(card in cards)if(state.seen.add(videoKey(card.url)))items+=card
                }
                if(!succeeded)failed?.let{throw it}
                state.number++;state.pages[state.number]=Results(items,state.branches.any{!it.ended})
            }
            state.pages[page] ?: Results(emptyList(),false)
        }}
    }
    private suspend fun filter(cards:List<VideoCard>,selection:Selection):List<VideoCard> = coroutineScope {
        val slots=Semaphore(8)
        cards.map{card->async(Dispatchers.IO){slots.withPermit{
            val needsLabels=selection.category!=null||selection.tags.isNotEmpty()||selection.excluded.isNotEmpty()
            if((!needsLabels&&card.duration.isNotBlank()) || (selection.excluded.isEmpty()&&selection.accepts(card,null)))card.takeIf{selection.accepts(card,null)}
            else {val detail=RequestLimits.optional(4000){detail(card.url)};card.takeIf{detail!=null&&selection.accepts(card,detail)}}
        }}}.awaitAll().filterNotNull()
    }
    suspend fun detail(url:String):VideoDetail = Metadata.scoped(p.id){readDetail(url)}
    private suspend fun readDetail(url:String):VideoDetail {
        metadata[url]?.let{return it}
        if(p.engine=="bdsmx")return NativeApis.detail(p,url).also{metadata[url]=it;p.observeTags(it.tags)}
        var document=page(PageRequest(url))
        if(p.id=="TubeBDSM")document=EmbeddedPlayers.abPage(document)
        if(p.engine=="beeg")return NativeApis.beegDetail(p,url,document).also{metadata[url]=it;p.observeTags(it.tags)}
        var info=if(p.id=="TubeBDSM")AggregatorPages.detail(document,p.spec) else Metadata.detail(document,p.spec)
        info=DetailEnrichment.complete(document,p.spec,info)
        info=info.copy(poster=Metadata.savedPoster(url) ?: info.poster)
        if(!ContentPolicy.accepts(info.title,info.tags))throw java.io.IOException("Видео скрыто фильтром категорий")
        if(info.title.isBlank())throw java.io.IOException("Источник не вернул название видео")
        p.observeTags(info.tags)
        metadata[url]=info;return info
    }
    private suspend fun fetch(query:String,request:PageRequest,number:Int):Pair<List<VideoCard>,PageRequest?> {
        if(p.engine=="bdsmx")return NativeApis.catalog(p,query,number,request)
        if(p.engine=="beeg" && query.isNotBlank())return NativeApis.beegSearch(p,query,number)
        val doc=page(request)
        if(webUri(request.url).path.orEmpty().trim('/').isEmpty())root.page=doc
        val list=if(query.isNotBlank())Metadata.searchCards(doc,p.spec,request) else Metadata.cards(doc,p.spec)
        if(query.isNotBlank() && Metadata.emptySearch(doc,request))return emptyList<VideoCard>() to null
        var next=Pagination.next(doc,request)
        if(next==null && list.isNotEmpty())next=when(p.engine) {
            "noodle"->PageRequest(request.url.toHttpUrl().newBuilder().setQueryParameter("p",number.toString()).build().toString(),allowNotFound=true)
            "heavy"->if(query.isNotBlank())PageRequest(p.base+"/search/"+enc(query)+"_${number+1}.html",allowNotFound=true) else null
            else->null
        }
        // Repeated pages end the branch, including sites which ignore a cursor.
        return list to next
    }
}
