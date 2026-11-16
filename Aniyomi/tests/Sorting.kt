package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import com.cloudextensions.russian.Network
import kotlinx.coroutines.runBlocking
import okhttp3.*
fun main(){runBlocking{
 val cookies=java.util.concurrent.ConcurrentHashMap<String,List<Cookie>>()
 Network.client=Network.client.newBuilder().cookieJar(object:CookieJar{override fun saveFromResponse(url:HttpUrl,values:List<Cookie>){cookies[url.host]=values};override fun loadForRequest(url:HttpUrl)=cookies[url.host].orEmpty()}).build()
 for(id in listOf("NoodleMagazine","TubeSafari")){
 val p=Registry.profiles().first{it.id==id};val orders=p.orders;check(orders.isNotEmpty())
 val a=Engine(p).search("guy",1,Selection());val b=Engine(p).search("guy",1,Selection(order=orders.last()))
 check(a.cards.isNotEmpty()&&b.cards.isNotEmpty());check(a.cards.take(10).map{it.url}!=b.cards.take(10).map{it.url}){"Source ignored sort: $id"}
 println("PASS real $id sorting changes ordered results: default / ${orders.last().value}")
 }
 };kotlin.system.exitProcess(0)}
