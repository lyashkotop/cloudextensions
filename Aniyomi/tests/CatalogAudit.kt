package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import org.json.*
import java.io.File
fun main(){runBlocking{
 val slots=Semaphore(4);val rows=Registry.profiles().map{p->async{slots.withPermit{
 val e=Engine(p);val row=JSONObject().put("source",p.id)
 suspend fun measure(key:String,call:suspend ()->Results){val start=System.nanoTime();try{val r=withTimeout(16000){call()};row.put(key,JSONObject().put("ms",(System.nanoTime()-start)/1000000).put("count",r.cards.size).put("next",r.hasNext).put("unique",r.cards.map{it.url}.distinct().size))}catch(t:Exception){row.put(key,JSONObject().put("error",t.javaClass.simpleName+": "+t.message))}}
 measure("latest"){e.browse(1,false)};measure("popular"){e.browse(1,true)}
 if(p.id in listOf("Perdol","ThisVid","Pervertium")){measure("search"){e.search("guy",1,Selection())};for(i in 2..3)measure("page$i"){e.search("guy",i,Selection())}}
 println(row.toString());row
 }}}.awaitAll();File("/workspace/aniyomi-current/catalog-audit.json").writeText(JSONArray(rows).toString(2))
 };kotlin.system.exitProcess(0)}
