import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import kotlinx.coroutines.*
class Sample:MainAPI(){override var lang="en";var calls=0
 override suspend fun search(query:String,page:Int):SearchResponseList=newSearchResponseList((0..11).map{newMovieSearchResponse("clip$it","https://example.org/$it",TvType.NSFW)},false)
 override suspend fun load(url:String):LoadResponse {calls++;delay(50);val id=url.substringAfterLast('/').toInt();return newMovieLoadResponse(if(id==1)"cuckold"else "clip$id full title",url,TvType.NSFW,url){tags=if(id==2)listOf("trans")else emptyList();plot="Watch this video on Example."}}
}
fun main()=runBlocking{val raw=Sample();val api=ReliableProvider(raw);val a=api.search("three safe words",1);check(raw.calls==10);check(a.items.none{it.url.endsWith("/1")||it.url.endsWith("/2")});check(a.items.size==10);check(a.items.first().name=="clip0 full title");api.search("three safe words",1);check(raw.calls==10);val d=api.load(a.items.first().url);check(raw.calls==10);check(d.plot.isNullOrBlank());println("PASS first 10: title/tag exclusion, full title, review cache, reuse on opening, plot cleanup")}
