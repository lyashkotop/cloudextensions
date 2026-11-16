package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import org.json.*
import java.io.File
import java.util.concurrent.TimeUnit
import okhttp3.Request
fun main(args:Array<String>){runBlocking{supervisorScope{
 val output=File(args.firstOrNull() ?: "Aniyomi/build/live-audit.json");val slots=Semaphore(4);val rows=java.util.Collections.synchronizedList(mutableListOf<JSONObject>())
 Registry.profiles().filter{args.size<2||it.id in args.drop(1)}.map{p->async(Dispatchers.IO){slots.withPermit{
 val start=System.nanoTime();val row=JSONObject().put("source",p.id).put("tagsInCatalog",p.tags.size).put("categoriesInCatalog",p.categories.size).put("sorts",p.orders.size);val engine=Engine(p)
 suspend fun attempt(key:String,block:suspend ()->Results):Results? {return try{withTimeout(45000){block()}.also{row.put(key,it.cards.size).put(key+"Next",it.hasNext)}}catch(e:Exception){row.put(key+"Error",e.javaClass.simpleName+": "+e.message?.take(100));null}}
 val latest=attempt("latest"){engine.browse(1,false)};val popular=attempt("popular"){engine.browse(1,true)};val search=attempt("search"){engine.search("guy",1,Selection())}
 val candidates=(search?.cards.orEmpty()+latest?.cards.orEmpty()+popular?.cards.orEmpty()).distinctBy{it.url}
 for(card in candidates.take(3)) {
  try{
   val detail=withTimeout(18000){engine.detail(card.url)};row.put("sample",card.url);row.put("detail",true).put("titlePresent",detail.title.isNotBlank()).put("tagsPresent",detail.tags.size).put("durationPresent",detail.duration.isNotBlank()).put("descriptionPresent",detail.description.isNotBlank())
   val poster=detail.poster?:card.poster
   if(poster!=null)try{val req=Request.Builder().url(poster).header("Range","bytes=0-15");p.requestHeaders.forEach{(k,v)->req.header(k,v)};Network.client.newBuilder().callTimeout(7,TimeUnit.SECONDS).build().newCall(req.build()).execute().use{r->val bytes=r.body?.source()?.readByteArray(8);row.put("imageHttp",r.code).put("imageMime",r.header("Content-Type"))}}catch(e:Exception){row.put("imageError",e.javaClass.simpleName)}
   try{val streams=withTimeout(45000){Streams.resolve(p,card.url)};row.put("streams",streams.size).put("qualities",JSONArray(streams.map{it.quality?:0}.distinct()));}catch(e:Exception){row.put("streamsError",e.javaClass.simpleName+": "+e.message?.take(110))}
   break
  }catch(e:Exception){row.put("detailError",e.javaClass.simpleName+": "+e.message?.take(100))}
 }
 row.put("seconds",(System.nanoTime()-start)/1e9);rows+=row;synchronized(output){output.writeText(JSONArray(rows).toString(2))};println("RESULT "+row)
 }}}.awaitAll()
 }};kotlin.system.exitProcess(0)}
