import com.cloudextensions.russian.*
import com.sun.net.httpserver.HttpServer
import java.net.InetSocketAddress
import kotlinx.coroutines.runBlocking
import java.util.concurrent.atomic.AtomicInteger
fun main(){
 val server=HttpServer.create(InetSocketAddress("127.0.0.1",0),0);val count=AtomicInteger();val redirect=AtomicInteger();val slow=AtomicInteger()
 server.createContext("/start"){x->redirect.incrementAndGet();x.responseHeaders.add("Location","/rate");x.sendResponseHeaders(302,-1);x.close()}
 server.createContext("/rate"){x->val code=if(count.incrementAndGet()==1)429 else 200;x.responseHeaders.add("Retry-After","0");val body="<h1>ready</h1>".toByteArray();x.sendResponseHeaders(code,body.size.toLong());x.responseBody.use{it.write(body)}}
 server.createContext("/slow"){x->slow.incrementAndGet();x.responseHeaders.add("Retry-After","120");x.sendResponseHeaders(429,-1);x.close()}
 server.start()
 try{runBlocking{val base="http://127.0.0.1:${server.address.port}";val page=Network.page(PageRequest("$base/start"),base);check(page.selectFirst("h1")?.text()=="ready");check(redirect.get()==1&&count.get()==2);val error=runCatching{Network.page(PageRequest("$base/slow"),base)}.exceptionOrNull();check(error?.message.orEmpty().contains("429"));check(slow.get()==1);println("PASS real HTTP redirect and bounded 429 retry; no early retry of Retry-After 120")}}
 finally{server.stop(0)}
 kotlin.system.exitProcess(0)
}
