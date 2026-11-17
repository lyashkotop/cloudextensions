package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.*
import kotlinx.coroutines.*
import java.io.File
fun main(){runBlocking{Registry.profiles().filter{it.id in listOf("ProstoPorno","PornVideos","XRares")}.map{p->async{
 val e=Engine(p);val c=e.search("guy",1,Selection()).cards.firstOrNull()?:return@async
 val d=e.page(PageRequest(c.url));File("/workspace/aniyomi-current/${p.id}-detail.html").writeText(d.outerHtml());println(p.id+" tags="+Metadata.detail(d,p.spec).tags.size)
 }}.awaitAll()};kotlin.system.exitProcess(0)}
