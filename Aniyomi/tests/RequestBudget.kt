package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import com.sun.net.httpserver.HttpServer
import java.net.InetSocketAddress
import java.util.concurrent.atomic.AtomicInteger
import kotlinx.coroutines.runBlocking
import org.json.JSONObject
fun main(){
 val detailRequests=AtomicInteger();val server=HttpServer.create(InetSocketAddress("127.0.0.1",0),0)
 val card="<a class=card href='/video/1' title='gay trans cuckold'><img src='/image.jpg'></a>"
 server.createContext("/"){r->val text=when(r.requestURI.path){"/"->"<form action='/search'><input name=q></form>";"/search","/tags/sample","/categories/sample"->card;else->{detailRequests.incrementAndGet();"<h1>detail</h1>"}};val bytes=text.toByteArray();r.sendResponseHeaders(200,bytes.size.toLong());r.responseBody.use{it.write(bytes)}}
 server.start()
 try{runBlocking{
 val base="http://127.0.0.1:${server.address.port}";val p=Profile(JSONObject().put("id","budget").put("name","Budget").put("lang","en").put("origin",base).put("cards","a.card").put("link","a[href]").put("titleSelector",".title").put("translate",false),JSONObject().put("tags",org.json.JSONArray().put(JSONObject().put("label","Sample").put("url","$base/tags/sample"))))
 val engine=Engine(p);check(engine.search("three query words",1,Selection()).cards.size==1);check(detailRequests.get()==0)
 check(engine.search("",1,Selection(tags=listOf("Sample"))).cards.size==1);check(detailRequests.get()==0)
 check(engine.search("",1,Selection(category=Taxon("Sample","$base/categories/sample"))).cards.size==1);check(detailRequests.get()==0)
 check(ContentPolicy.accepts("gay trans cuckold"));println("PASS: normal search, native tag and native category each return results without a single video-detail request; former stop words remain visible")
 }}finally{server.stop(0)};kotlin.system.exitProcess(0)
}
