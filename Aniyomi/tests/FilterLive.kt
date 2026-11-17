package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import org.json.*
import java.io.File
fun main(){runBlocking{
 val slots=Semaphore(3)
 val rows=Registry.profiles().filter{it.id in listOf("Perdol","ThisVid","Pervertium","Semyana","Vpoisk","BDSMStreak","ProstoPorno","PornVideos","XRares","BDSMX","NoodleMagazine","UKDevilz")}.map{p->async{slots.withPermit{
 val row=JSONObject().put("source",p.id);val e=Engine(p)
 try{withTimeout(22000){
  val list=e.search("guy",1,Selection());val card=list.cards.firstOrNull()
  if(card!=null){val d=e.detail(card.url);row.put("metadataTags",d.tags.size).put("duration",d.duration.isNotBlank())
   val tag=d.tags.firstOrNull()
   if(tag!=null){val start=System.nanoTime();val selection=Selection(tags=listOf(tag),excluded=listOf("__no_such_source_tag__"));val r=e.search("guy",1,selection);row.put("combinedCount",r.cards.size).put("combinedMs",(System.nanoTime()-start)/1000000).put("retainedSample",r.cards.any{it.url==card.url});for(c in r.cards)check(selection.accepts(c,e.detail(c.url)))
   }
  }
  val category=p.categories.firstOrNull();if(category!=null){val r=e.search("",1,Selection(category=category));row.put("categoryCount",r.cards.size)}
 }}catch(t:Exception){row.put("error",t.javaClass.simpleName+": "+t.message)}
 println(row);row
 }}}.awaitAll();File("/workspace/aniyomi-current/filters.json").writeText(JSONArray(rows).toString(2))
 };kotlin.system.exitProcess(0)}
