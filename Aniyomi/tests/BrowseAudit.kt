package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import org.json.*
import java.io.File
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicInteger
fun main(args:Array<String>){runBlocking{
 val active=ConcurrentHashMap<String,String>();val counts=ConcurrentHashMap<String,AtomicInteger>();val urls=ConcurrentHashMap<String,MutableList<String>>();val wire=ConcurrentHashMap<String,MutableList<String>>()
 Network.client=Network.client.newBuilder().addInterceptor{chain->
  val req=chain.request();val key=req.header("Referer").orEmpty().trimEnd('/')+"|"+req.header("Cookie").orEmpty()
  active[key]?.let{label->counts.computeIfAbsent(label){AtomicInteger()}.incrementAndGet();urls.computeIfAbsent(label){java.util.Collections.synchronizedList(mutableListOf())}.add(req.url.toString())};chain.proceed(req)
 }.addNetworkInterceptor{chain->
  val req=chain.request();val key=req.header("Referer").orEmpty().trimEnd('/')+"|"+req.header("Cookie").orEmpty();val res=chain.proceed(req)
  active[key]?.let{label->wire.computeIfAbsent(label){java.util.Collections.synchronizedList(mutableListOf())}.add("${res.code} ${req.url}")};res
 }.build()
 val slots=Semaphore(4);val rows=Registry.profiles().map{p->async{slots.withPermit{
  val e=Engine(p,false);val row=JSONObject().put("source",p.id);val key=p.base.trimEnd('/')+"|"+(if(p.engine=="noodle")"ui_lang=${p.lang}"else "")
  for(popular in listOf(true,false)){
   val mode=if(popular)"popular"else "latest";val data=JSONObject();row.put(mode,data)
   if(!Browse.supported(p,popular)){data.put("unsupported",p.data.getJSONObject("browse").optString(mode+"Reason"));continue}
   suspend fun measure(stage:String,call:suspend ()->Results):Results?{
    val label=p.id+":"+mode+":"+stage;active[key]=label;val t=System.nanoTime()
    return try{val r=withTimeout(15000){call()};data.put(stage,JSONObject().put("ms",(System.nanoTime()-t)/1000000).put("count",r.cards.size).put("next",r.hasNext).put("requests",counts[label]?.get()?:0).put("urls",JSONArray(urls[label]?:emptyList<String>())).put("wire",JSONArray(wire[label]?:emptyList<String>())));r}catch(ex:Exception){data.put(stage,JSONObject().put("error",ex.javaClass.simpleName+": "+ex.message).put("ms",(System.nanoTime()-t)/1000000).put("requests",counts[label]?.get()?:0));null}
   }
   val first=measure("first"){e.browse(1,popular)}
   if(first!=null&&first.cards.isNotEmpty()){
    val cached=measure("repeat"){e.browse(1,popular)};check(cached==first)
    if(first.hasNext){val second=measure("second"){e.browse(2,popular)};if(second!=null){val seen=first.cards.map{it.url}.toSet();check(second.cards.none{it.url in seen});data.put("noPageOverlap",true)}}
   }
  }
  println(row);row
 }}}.awaitAll();File(args.firstOrNull() ?: "Aniyomi/build/browse-audit.json").apply{parentFile?.mkdirs()}.writeText(JSONArray(rows).toString(2))
 };kotlin.system.exitProcess(0)}
