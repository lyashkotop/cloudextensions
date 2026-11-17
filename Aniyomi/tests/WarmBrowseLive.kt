package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import kotlinx.coroutines.*
import org.json.*
import java.io.File
fun main(args:Array<String>){runBlocking{
 val rows=Registry.profiles().filter{it.id in listOf("Perdol","NoodleMagazine","DarknessPorn")}.map{p->async{
  val e=Engine(p);val t=System.nanoTime();val pop=e.browse(1,true);val row=JSONObject().put("source",p.id).put("popularMs",(System.nanoTime()-t)/1000000).put("popularCount",pop.cards.size)
  // Approximate time spent looking at the first screen; the other tab warms in the background.
  delay(1500);val start=System.nanoTime();val latest=e.browse(1,false);row.put("latestSwitchMs",(System.nanoTime()-start)/1000000).put("latestCount",latest.cards.size);println(row);row
 }}.awaitAll();File(args.firstOrNull() ?: "Aniyomi/build/warm-browse.json").apply{parentFile?.mkdirs()}.writeText(JSONArray(rows).toString(2))
 };kotlin.system.exitProcess(0)}
