package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import org.json.*
import java.io.File
fun main(){runBlocking{
 for(q in listOf("guy","парень","young guy","молодой парень")){val t=System.nanoTime();val v=withTimeoutOrNull(4000){Translation.translated(q)};println(JSONObject().put("query",q).put("translated",v).put("ms",(System.nanoTime()-t)/1000000))}
 val slots=Semaphore(4);val rows=Registry.profiles().filter{it.translate&&it.lang!="ja"}.map{p->async{slots.withPermit{
 val row=JSONObject().put("source",p.id);val e=Engine(p)
 try{withTimeout(20000){
  val en=e.search("guy",1,Selection());val ru=e.search("парень",1,Selection());val a=en.cards.map{it.url}.toSet();val b=ru.cards.map{it.url}.toSet()
  row.put("en",a.size).put("ru",b.size).put("sameMergedSet",a==b).put("nextEn",en.hasNext).put("nextRu",ru.hasNext)
 }}catch(t:Exception){row.put("error",t.javaClass.simpleName+": "+t.message)}
 println(row);row
 }}}.awaitAll();File("/workspace/aniyomi-current/bilingual.json").writeText(JSONArray(rows).toString(2))
 };kotlin.system.exitProcess(0)}
