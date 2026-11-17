package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import com.sun.net.httpserver.HttpServer
import java.net.InetSocketAddress
import java.util.concurrent.Executors
import java.util.concurrent.atomic.AtomicInteger
import kotlinx.coroutines.*
import org.json.JSONObject
import org.jsoup.Jsoup
fun main(){
 val profiles=Registry.profiles();check(profiles.all{Browse.supported(it,true)});check(profiles.count{Browse.supported(it,false)}==31)
 val scope=Browse.listing(Jsoup.parse("<div id=list_videos_watched_items><a class=card href='/videos/1/watched/' title=Watched><img src=/a.jpg></a></div><div id=list_videos_new_items><a class=card href='/videos/2/new/' title=New><img src=/b.jpg></a></div><div id=list_videos_new_pagination></div>","https://example.test/"));check(scope.id()=="list_videos_new_items");val scopeDoc=scope.ownerDocument()!!;check(Metadata.cards(scopeDoc,SiteSpec("scope","Scope","https://example.test/","div a.card","a",".title",emptyList()),scope).map{it.title}==listOf("New"))
 val server=HttpServer.create(InetSocketAddress("127.0.0.1",0),0);val executor=Executors.newCachedThreadPool();server.executor=executor
 val latestEntered=CompletableDeferred<Unit>();val releaseLatest=CompletableDeferred<Unit>();val latestRequests=AtomicInteger();val popularRequests=AtomicInteger();val retryRequests=AtomicInteger();val cancelRequests=AtomicInteger()
 server.createContext("/"){r->
  var code=200
  when(r.requestURI.path){"/popular"->popularRequests.incrementAndGet();"/latest"->{latestRequests.incrementAndGet();latestEntered.complete(Unit);runBlocking{withTimeout(3000){releaseLatest.await()}}};"/retry"->{if(retryRequests.incrementAndGet()==1)code=503};"/cancel"->{if(cancelRequests.incrementAndGet()==1)Thread.sleep(500)}}
  val bytes="<a class=card href='/videos/2/full/' title='Full title'><img src='/image.jpg'></a>".toByteArray()
  try{r.sendResponseHeaders(code,bytes.size.toLong());r.responseBody.use{it.write(bytes)}}catch(_:java.io.IOException){}
 };server.start()
 try{runBlocking{
  val base="http://127.0.0.1:${server.address.port}"
  fun profile(latest:String)=Profile(JSONObject().put("id","warm").put("name","Warm").put("origin",base).put("lang","en").put("cards","a.card").put("link","a[href]").put("titleSelector",".title").put("translate",false).put("browse",JSONObject().put("popular","/popular").put("latest",latest)),JSONObject())
  val e=Engine(profile("/latest"));withTimeout(1000){check(e.browse(1,true).cards.size==1)}
  withTimeout(1000){latestEntered.await()};check(!releaseLatest.isCompleted)
  releaseLatest.complete(Unit);withTimeout(1500){check(e.browse(1,false).cards.size==1)}
  check(popularRequests.get()==1&&latestRequests.get()==1);check(e.browse(1,false).cards.size==1);check(latestRequests.get()==1)
  val retry=Engine(profile("/retry"),false);try{retry.browse(1,false);error("503 must fail")}catch(_:java.io.IOException){}
  check(retry.browse(1,false).cards.size==1);check(retryRequests.get()==2)
  val cancel=Engine(profile("/cancel"),false);check(withTimeoutOrNull(100){cancel.browse(1,false)}==null);check(withTimeout(1000){cancel.browse(1,false)}.cards.size==1)
  println("PASS: explicit routes for 32 sources, KVS listing scope, nonblocking sibling-tab warming, coalesced requests/cache, retry after HTTP failure and cancellation")
 }}finally{server.stop(0);executor.shutdownNow()};kotlin.system.exitProcess(0)
}
