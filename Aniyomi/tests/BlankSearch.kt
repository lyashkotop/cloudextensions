package audit
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import kotlinx.coroutines.runBlocking
fun main(){runBlocking{
 val source=Registry.profiles().first{it.id=="SickJunk"};val result=Engine(source).search("",1,Selection());check(result.cards.isNotEmpty());println("PASS real blank filter query uses the available source catalogue: ${result.cards.size} items")
 val empty=Engine(Registry.profiles().first{it.id=="ThisVid"}).search("zzqvnoresult987654321",1,Selection());check(empty.cards.isEmpty()&&!empty.hasNext);println("PASS real ThisVid absent query returns no items and no next page")
 };kotlin.system.exitProcess(0)}
