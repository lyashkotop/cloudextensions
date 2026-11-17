package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import com.sun.net.httpserver.HttpServer
import java.net.InetSocketAddress
import kotlinx.coroutines.*
import org.json.*
import org.jsoup.Jsoup
fun main(){
 val next=Pagination.next(Jsoup.parse("<div class=pagination><a data-block-id=list_videos_search data-parameters='sort_by:post_date;from:2'>2</a></div>","https://example.test/search/?q=two%20words&sort_by=post_date"),PageRequest("https://example.test/search/?q=two%20words&sort_by=post_date"))!!
 check(next.url.contains("q=two+words"));check(next.url.contains("sort_by=post_date"));check(next.url.contains("from=2"))
 val server=HttpServer.create(InetSocketAddress("127.0.0.1",0),0)
 val queries=java.util.Collections.synchronizedList(mutableListOf<String>())
 server.start()
 try{runBlocking{
  val base="http://127.0.0.1:${server.address.port}"
  val p=Profile(JSONObject().put("id","paging").put("name","Paging").put("lang","en").put("origin",base).put("cards","a.card").put("link","a[href]").put("titleSelector",".title").put("searchMode","path").put("translate",true),JSONObject())
  // A native search form supplies the query field, as on real KVS sources.
  val p2=Profile(JSONObject(p.data.toString()).put("searchMode","get"),JSONObject())
  // Supply an actual search form for route discovery in a second context.
  server.createContext("/"){r->
   val bytes="<form action='/search/'><input name=q></form>".toByteArray();r.sendResponseHeaders(200,bytes.size.toLong());r.responseBody.use{it.write(bytes)}
  }
  // Both language branches share video 1, but have distinct later items.
  val oldHandler:com.sun.net.httpserver.HttpHandler = com.sun.net.httpserver.HttpHandler{r->
   val query=r.requestURI.rawQuery.orEmpty();queries+=query
   val n=Regex("page=(\\d+)").find(query)?.groupValues?.get(1)?.toInt()?:1;val ru=query.contains("%D0",true)
   fun c(id:Int,slug:String="title")="<a class=card href='/videos/$id/$slug/' title='Video $id'><img src='/image.jpg'></a>"
   val text=(if(n==1)c(1)+(if(ru)c(2)else "") else c(1,"changed-title")+c(if(ru)n*2 else n*2-1))+(if(n<3)"<a rel=next href='?q=${if(ru)java.net.URLEncoder.encode("парень","UTF-8") else "guy"}&page=${n+1}'>Next</a>"else "")
   val b=text.toByteArray();r.sendResponseHeaders(200,b.size.toLong());r.responseBody.use{it.write(b)}
  }
  server.createContext("/search/",oldHandler)
  val e=Engine(p2);val first=e.search("guy",1,Selection());check(first.cards.map{it.title}==listOf("Video 1","Video 2"))
  val second=e.search("guy",2,Selection());check(second.cards.map{it.title}==listOf("Video 3","Video 4"));check(second.hasNext)
  val third=e.search("guy",3,Selection());check(third.cards.map{it.title}==listOf("Video 5","Video 6"));check(!third.hasNext)
  val reverseEngine=Engine(p2);val reverse=reverseEngine.search("парень",1,Selection());check(reverse.cards.map{it.title}==listOf("Video 1","Video 2"));check(reverseEngine.search("парень",2,Selection()).cards.map{it.title}==listOf("Video 4","Video 3"))
  check(queries.any{it.contains("q=guy")});check(queries.any{it.contains("%D0",true)})
  println("PASS: original/translated branch pagination, overlapping branches stay alive, numeric-ID deduplication, KVS search and sort preservation")
 }}finally{server.stop(0)};kotlin.system.exitProcess(0)
}
