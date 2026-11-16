import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import kotlinx.coroutines.*
class Sample:MainAPI(){override var lang="en";var calls=0
 override suspend fun search(query:String,page:Int):SearchResponseList=newSearchResponseList((0..15).map{newMovieSearchResponse("clip$it","https://example.org/$it",TvType.NSFW)},false)
 override suspend fun load(url:String):LoadResponse {calls++;delay(30);val id=url.substringAfterLast('/').toInt();if(id==3)throw java.io.IOException("unavailable metadata");return newMovieLoadResponse(if(id==1)"cuckold"else "clip$id full title",url,TvType.NSFW,url){tags=if(id==2)listOf("trans")else emptyList();plot="Watch this video on Example."}}
}
fun main()=runBlocking{val raw=Sample();val api=ReliableProvider(raw);val a=api.search("three safe words",1);check(raw.calls==10);check(a.items.none{it.url.substringAfterLast('/').toInt() in 1..3});check(a.items.take(7).map{it.url.substringAfterLast('/').toInt()}==listOf(0,4,5,6,7,8,9));check(a.items.size==13);check(a.items.first().name=="clip0 full title");api.search("three safe words",1);check(raw.calls==11);val d=api.load(a.items.first().url);check(raw.calls==11);check(d.plot.isNullOrBlank());println("PASS strict visible seven: title exclusion, tag exclusion, unavailable hidden, replacement reviewed, cache and full title")}
