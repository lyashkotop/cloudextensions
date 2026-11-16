package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import kotlinx.coroutines.*
import org.json.*
import java.io.File
fun main(){runBlocking{
 val rows=JSONArray()
 for(p in Registry.profiles().filter{it.id in listOf("NoodleMagazine","ThisVid","Semyana","TubeSafari","BDSMX")}) {
  val e=Engine(p);val row=JSONObject().put("source",p.id)
  suspend fun measure(key:String,call:suspend ()->Results){val begin=System.nanoTime();try{val r=withTimeout(15000){call()};row.put(key+"Ms",(System.nanoTime()-begin)/1000000).put(key+"Count",r.cards.size)}catch(t:Exception){row.put(key+"Error",t.message)}}
  measure("latest"){e.browse(1,false)};measure("popular"){e.browse(1,true)};measure("search"){e.search("guy",1,Selection())};measure("repeat"){e.search("guy",1,Selection())}
  val tag=p.tags.firstOrNull{it.url.startsWith("http")};if(tag!=null)measure("tag"){e.search("",1,Selection(tags=listOf(tag.label)))}
  println("RESULT "+row);rows.put(row)
 }
 File("/workspace/aniyomi-speed.json").writeText(rows.toString(2))
 };kotlin.system.exitProcess(0)}
