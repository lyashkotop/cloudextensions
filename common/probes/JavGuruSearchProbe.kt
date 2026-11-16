import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.jacekun.JavGuru
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.*
import org.json.*
import java.io.File
fun main(args:Array<String>)=runBlocking {
 val api=ReliableProvider(AdaptedProvider(JavGuru()));val output=JSONArray();val gate=Semaphore(4)
 for(query in listOf("guy","woman")) for(page in 1..2){
 val start=System.nanoTime();val cards=api.search(query,page).items;check(cards.isNotEmpty());check(cards.all{it.posterUrl?.startsWith("https://jav.guru/wp-content/uploads/")==true})
 val images=cards.map{card->async(Dispatchers.IO){gate.withPermit{
 val b=okhttp3.Request.Builder().url(card.posterUrl!!).header("Range","bytes=0-31");for((k,v)in card.posterHeaders.orEmpty())b.header(k,v)
 app.baseClient.newBuilder().callTimeout(10,java.util.concurrent.TimeUnit.SECONDS).build().newCall(b.build()).execute().use{r->val bytes=r.body?.source()?.readByteArray(2)?:byteArrayOf();check(r.isSuccessful);check(r.header("Content-Type").orEmpty().startsWith("image/"));check(bytes.size==2&&bytes[0]==(-1).toByte()&&bytes[1]==(-40).toByte());r.code}
 }}}.awaitAll()
 val row=JSONObject().put("query",query).put("page",page).put("cards",cards.size).put("verifiedImages",images.size).put("http",JSONArray(images.distinct())).put("milliseconds",(System.nanoTime()-start)/1000000);println("RESULT "+row);output.put(row)
 if(query=="guy"&&page==1){val detail=api.load(cards.first().url);check(detail.posterUrl==cards.first().posterUrl);println("DETAIL retained origin preview")}
 }
 File(args.firstOrNull() ?: "javguru-search-live.json").writeText(output.toString(2))
}
