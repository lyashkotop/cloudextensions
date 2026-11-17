package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import kotlinx.coroutines.*
fun main(){runBlocking{
 val p=Registry.profiles().first{it.id=="BDSMX"};val e=Engine(p);val seen=mutableSetOf<String>()
 for(page in 1..3){val r=withTimeout(15000){e.browse(page,false)};check(r.cards.isNotEmpty());check(r.cards.all{seen.add(it.url)});println("BDSMX page=$page count=${r.cards.size} next=${r.hasNext}")}
 };kotlin.system.exitProcess(0)}
