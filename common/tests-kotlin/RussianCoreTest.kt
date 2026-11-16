package com.cloudextensions.russian

import java.io.File
import org.jsoup.Jsoup
import org.json.JSONArray
import org.json.JSONObject
import org.json.JSONTokener

private var checks=0
private fun verify(value:Boolean,message:String){checks++;check(value){message}}
fun main(args:Array<String>) {
    val times=mapOf("123" to "02:03","PT2M3S" to "02:03","PT1H2M3.5S" to "1:02:03.5","01:02:03" to "1:02:03","12:34" to "12:34","0" to "","1:99" to "","unknown" to "","" to "")
    for((raw,expected)in times)verify(Metadata.timing(raw)==expected,"source duration $raw")
    for(word in listOf("guy","lesbian","lesbians","лесби","лесбиянки","gay lesbians","gay лесби"))verify(ContentPolicy.accepts(word),"allowed word $word")
    for(word in listOf("gay","гей","shemale","femdom"))verify(!ContentPolicy.accepts(word),"blocked word $word")
    verify(Translation.target("слово")=="en","one Russian word")
    verify(Translation.target("два слова")=="en","two Russian words")
    verify(Translation.target("two words")=="ru","two English words")
    verify(Translation.target("three different words")==null,"three words stay original")
    verify(Translation.target("123")==null,"numeric query stays original")
    verify(Translation.parse("[[[\"two words\",\"два слова\",null,null,1]],null,\"ru\"]","en")=="two words","translation parsing")
    val spec=SiteSpec("Test","Test","https://example.org",".card","a[href]",".title",listOf(Section("Latest","/")))
    val listing=Jsoup.parse("""<div class=card><a href='/video/1/' title='A complete original title'><img src='data:image/gif;base64,x' data-original='/poster.jpg'><span class=title>A complete…</span></a><span class=duration>02:03</span></div><div class=card><a href='/video/1/' title='duplicate'>duplicate</a></div><div class=card><a href='/video/2/' title='gay'>blocked</a></div>""","https://example.org/")
    val cards=Metadata.cards(listing,spec)
    verify(cards.size==1,"deduplicate and filter cards")
    verify(cards.single().poster=="https://example.org/poster.jpg","lazy source beats placeholder")
    verify(cards.single().title=="A complete original title","full source title")
    val detail=Jsoup.parse("""<h1>A title in another language</h1><meta itemprop=duration content=PT2M3S><meta itemprop=description content=''><meta property=og:description content='unrelated promotional metadata'><div class=video-tags><a>для</a><a>ра</a><a>Real tag</a><a>Real tag</a></div>""","https://example.org/video/1/")
    val metadata=Metadata.detail(detail,spec)
    verify(metadata.title==cards.single().title,"one title survives opening")
    verify(metadata.description.isEmpty(),"declared empty description does not become SEO")
    verify(metadata.tags==listOf("Real tag"),"only real declared tags; no fragments or duplicates")
    verify(Metadata.plot(metadata).isEmpty(),"duration is not duplicated in plot")
    verify(Metadata.plot(metadata.copy(duration="",description="")).isEmpty(),"no unknown duration placeholder")
    val paged=Jsoup.parse("<div class=pagination><a href='/2/'>2</a><a class=next href='/2/'>Next</a></div>","https://example.org/")
    verify(Pagination.next(paged,PageRequest(paged.baseUri()))?.url=="https://example.org/2/","source next link")
    verify(Pagination.next(Jsoup.parse("<p>End</p>","https://example.org/2/"),PageRequest("https://example.org/2/"))==null,"real end of pagination")
    val form=Jsoup.parse("<form method=post action='/find/'><input name=token value=real><input name=q><input type=button name=unused value=button></form>","https://example.org/")
    val request=Pagination.search(form,spec,"https://example.org","two words")
    verify(request.data==mapOf("token" to "real","q" to "two words"),"POST fields and original query preserved")
    val notFound=Jsoup.parse("<h1>Nothing found</h1><div class=card><a href='/other/' title='Trending'>Trending</a></div>","https://example.org/search/?q=absent").apply { attr("data-response-code","404") }
    verify(Metadata.searchCards(notFound,spec,PageRequest(notFound.baseUri())).isEmpty(),"search 404 is an empty result, never trending")
    val ajax=Jsoup.parse("""<div class=pagination><a class=next href='#search' data-block-id='list_videos_search' data-parameters='q:two%20words;from_videos+from_albums:2'>Next</a></div>""","https://example.org/search/?q=two+words")
    val cursor=Pagination.next(ajax,PageRequest(ajax.baseUri()))?.url.orEmpty()
    verify(cursor.contains("from_videos=2")&&cursor.contains("from_albums=2")&&cursor.contains("q=two+words"),"source AJAX cursor preserves search and both page fields")
    val noodleSpec=spec.copy(cards="#list_videos div.item",titleSelector=".title")
    val noMatch=Jsoup.parse("<div class=list_videos><div class=item><a href='/watch/1/' title='Fallback recommendation'>Fallback recommendation</a></div></div>","https://example.org/video/absent")
    verify(Metadata.cards(noMatch,noodleSpec).isEmpty(),"Noodle fallback recommendations are not search results")
    val realMatch=Jsoup.parse("<div id=list_videos><div class=item><a href='/watch/2/' title='Source result'>Source result</a></div></div>","https://example.org/video/query")
    verify(Metadata.cards(realMatch,noodleSpec).size==1,"Noodle genuine search block is parsed")
    val stripLazy=Jsoup.parse("<img class=js-preview src='data:image/png;base64,placeholder' data-s='https://images.example.org/actual-preview.jpg'>","https://example.org/")
    verify(Metadata.poster(stripLazy,"https://example.org/")=="https://images.example.org/actual-preview.jpg","Strip2 data-s preview survives a data URI placeholder")
    val responsive=Jsoup.parse("<picture><source srcset='/small.jpg 320w, /actual.jpg 640w'><img src='/placeholder.svg'></picture>","https://example.org/")
    verify(Metadata.poster(responsive,"https://example.org/")=="https://example.org/actual.jpg","responsive photo beats SVG placeholder")
    val queryForm=Jsoup.parse("<form action='/search'><input name=query></form>","https://tubesafari.com/")
    verify(Pagination.search(queryForm,spec,"https://tubesafari.com","two words").url=="https://tubesafari.com/search?query=two+words","TubeSafari declared query parameter")
    verify(Pagination.search(queryForm,spec.copy(searchMode="path:/video/"),"https://ukdevilz.com","two words").url=="https://ukdevilz.com/video/two%20words","UKDevilz real JavaScript search route")
    val arrow=Jsoup.parse("<li class=pagination-next><a href='/search/2/?q=guy'><i></i></a></li>","https://thisvid.com/search/?q=guy")
    verify(Pagination.next(arrow,PageRequest(arrow.baseUri()))?.url=="https://thisvid.com/search/2/?q=guy","ThisVid next control has no text")
    val genericCursor=Jsoup.parse("<div class=pagination><a data-block-id=videos data-parameters='from:2'>2</a><a data-block-id=videos data-parameters='from:3'>3</a></div>","https://example.org/videos/?from=2")
    verify(Pagination.next(genericCursor,PageRequest(genericCursor.baseUri()))?.url?.contains("from=3")==true,"KVS from cursor advances without looping")
    val tube=Jsoup.parse("<script>query=\"guy\";sort=\"best\";</script>"+(1..120).joinToString(""){"<div class=vid_li></div>"},"https://tubesafari.com/search/guy")
    val tubeNext=Pagination.next(tube,PageRequest(tube.baseUri()))?.url.orEmpty()
    verify(tubeNext.contains("/api?method=search")&&tubeNext.contains("page=1")&&tubeNext.contains("query=guy"),"TubeSafari follows source JSON scrolling API")
    tube.attr("data-results-remaining","0")
    verify(Pagination.next(tube,PageRequest(tube.baseUri()))==null,"TubeSafari respects actual end of API results")
    val clock=Jsoup.parse("<div class=card><a href='/clock/' title='Clock sample'><img src='/clock.jpg'></a><div class=prop><span>500</span><span>30:55</span></div></div>","https://example.org/")
    Metadata.cards(clock,spec)
    val clockDetail=Metadata.detail(Jsoup.parse("<h1>Clock sample</h1>","https://example.org/clock/"),spec)
    verify(clockDetail.duration=="30:55","source clock beats numeric view count")
    verify(clockDetail.poster=="https://example.org/clock.jpg","detail retains real catalogue preview")
    val ownTitle=Metadata.detail(Jsoup.parse("<h1 class=site-title>Site logo</h1><h1 class=single-entry-title>Own full video title</h1>","https://example.org/own-title/"),spec)
    verify(ownTitle.title=="Own full video title","WordPress branding is not the video title")
    val article=Metadata.detail(Jsoup.parse("<h1>Footer taxonomy</h1><article><footer class=single-entry-footer><div class=awaken-category-list><a>Actual category</a></div></footer></article><footer><a>Unrelated</a></footer>","https://example.org/taxonomy/"),spec.copy(tagSelector="article .awaken-category-list a"))
    verify(article.tags==listOf("Actual category"),"real article taxonomy is retained in its footer")
    val sourceOnly=Jsoup.parse("<video src='/actual.mp4'></video><div class=related><video src='/unrelated.mp4'></video></div>","https://example.org/video/")
    verify(Playback.sources(sourceOnly).map{it.url}==listOf("https://example.org/actual.mp4"),"player links exclude related clips")
    verify(KvsUrls.decode("function/0/https://example.org/get_file/1/x.mp4",null)==null,"undecodable KVS URLs are not emitted as fake links")
    val uk=Jsoup.parse((1..24).joinToString(""){"<div class=item></div>"}.let{"<div id=list_videos>$it</div>"},"https://ukdevilz.com/video/guy?p=1")
    val ukNext=Pagination.next(uk,PageRequest(uk.baseUri()))
    verify(ukNext?.url=="https://ukdevilz.com/video/guy?p=2"&&ukNext.data==null,"UKDevilz uses a real page permalink without CSRF-dependent POST")
    verify(Metadata.description("Watch online for free","Own title").isEmpty(),"upstream promotional plot is removed")
    verify(Metadata.tag("для")==null&&Metadata.tag("Real source tag")=="Real source tag","upstream tags preserve labels without fragment words")
    val flagCard=Jsoup.parse("<a><img class='vid-tag-info-tag-ico' data-src='/girls/flags/russian.png'><img class=video-img src='/actual-frame.jpg'></a>","https://photos.example/")
    verify(Metadata.poster(flagCard,"https://photos.example/")=="https://photos.example/actual-frame.jpg","country flag never replaces the actual video frame")
    val logoCard=Jsoup.parse("<img src='/logo.png'><img data-src='/thumb.jpg'>","https://photos.example/")
    verify(Metadata.poster(logoCard,"https://photos.example/")=="https://photos.example/thumb.jpg","skip branding and keep searching for real preview")
    Metadata.rememberPoster("https://photos.example/watch/1","/preview.jpg")
    verify(Metadata.choosePoster("https://photos.example/watch/1","/girls/flags/russian.png")=="https://photos.example/preview.jpg","opening retains the search preview instead of flag or empty poster")
    Metadata.alias("https://photos.example/watch/1","https://photos.example/video/1")
    verify(Metadata.choosePoster("https://photos.example/video/1",null)=="https://photos.example/preview.jpg","preview follows a canonical redirect")
    verify(Metadata.description("An actual source description. Watch online for free!","Video") == "An actual source description.","strip advertising sentence without discarding the source description")
    kotlinx.coroutines.runBlocking {
        val elapsed=System.nanoTime()
        val optional=RequestLimits.optional(30){kotlinx.coroutines.delay(3000);true}
        verify(optional==null && (System.nanoTime()-elapsed)<2_000_000_000L,"optional recommendation timeout releases the card")
        var timedOut=false
        try{RequestLimits.required("test",30){kotlinx.coroutines.delay(3000)}}catch(_:com.lagradost.cloudstream3.ErrorLoadingException){timedOut=true}
        verify(timedOut,"required request ends with an error rather than permanent loading")
    }
    verify(Metadata.imageUrl("https://photos.example/","/thumbs/avatar-cosplay-frame.jpg")!=null,"a video slug is not mistaken for an avatar icon")
    verify(Metadata.imageUrl("https://photos.example/","null")==null,"literal null is not a poster URL")
    kotlinx.coroutines.runBlocking {
        var handled=false
        try{RequestLimits.required("test"){throw NoClassDefFoundError("missing-host-api")}}catch(_:com.lagradost.cloudstream3.ErrorLoadingException){handled=true}
        verify(handled,"host API linkage failure reaches the UI as a load error rather than a crashed loading coroutine")
    }
    verify(Metadata.imageUrl("old serialized bookmark payload","https://photos.example/frame.jpg")=="https://photos.example/frame.jpg","an absolute image URL does not depend on a legacy bookmark payload being a valid base URI")
    println("PASS $checks Kotlin core checks; no Android or live-playback claims")
    if(args.size==2&&args[0]=="--live-dir"){live(File(args[1]));searchLive(File(args[1]))}
}
private fun live(directory:File) {
    val access=JSONArray(File(directory,"access.json").readText());val details=JSONArray(File(directory,"details-access.json").readText())
    val root=File(System.getProperty("user.dir"));val report=JSONArray()
    for(i in 0 until access.length()) {
        val record=access.getJSONObject(i);val id=record.getString("site")
        val source=File(root,"Russian/$id/src/main/kotlin").walkTopDown().first { it.name.endsWith("Provider.kt") }.readText()
        fun field(name:String):String { val raw=Regex("\\b"+name+"=(\"(?:\\\\.|[^\"\\\\])*\")").find(source)?.groupValues?.get(1) ?: return "";return JSONTokener(raw).nextValue().toString() }
        val spec=SiteSpec(id,field("title"),field("origin"),field("cards"),field("link"),field("titleSelector"),emptyList(),field("searchMode"),field("tagSelector"),field("descriptionSelector"),field("related"))
        val page=Jsoup.parse(File(directory,"pages/$id.html").readText(),record.getString("url"))
        val cards=Metadata.cards(page,spec)
        val info=(0 until details.length()).map { details.getJSONObject(it) }.first { it.getString("site")==id }
        val doc=Jsoup.parse(File(directory,"pages/$id-detail.html").readText(),info.getString("url"))
        val detail=Metadata.detail(doc,spec)
        verify(cards.isNotEmpty(),"live $id catalogue")
        verify(detail.title.isNotBlank(),"live $id title")
        verify(detail.duration.isNotBlank(),"live $id exact duration")
        verify(detail.tags.isNotEmpty(),"live $id tags")
        verify(detail.tags.none { it in listOf("ра","для") },"live $id no fragment tags")
        val item=JSONObject().put("site",id).put("cards",cards.size).put("titleLength",detail.title.length).put("descriptionLength",detail.description.length).put("tags",detail.tags.size).put("duration",detail.duration).put("poster",detail.poster!=null)
        report.put(item)
    }
    File(directory,"kotlin-metadata-results.json").writeText(report.toString(2));println(report.toString())
}

private fun searchLive(directory:File) {
    val records=JSONArray(File(directory,"search-access.json").readText());val root=File(System.getProperty("user.dir"));val report=JSONArray();val counts=mutableMapOf<String,Int>();val firstPages=mutableMapOf<String,Set<String>>()
    for(i in 0 until records.length()) {
        val record=records.getJSONObject(i);val id=record.getString("site");val source=File(root,"Russian/$id/src/main/kotlin").walkTopDown().first { it.name.endsWith("Provider.kt") }.readText()
        fun field(name:String):String { val raw=Regex("\\b"+name+"=(\"(?:\\\\.|[^\"\\\\])*\")").find(source)?.groupValues?.get(1) ?: return "";return JSONTokener(raw).nextValue().toString() }
        val spec=SiteSpec(id,field("title"),field("origin"),field("cards"),field("link"),field("titleSelector"),emptyList(),field("searchMode"),field("tagSelector"),field("descriptionSelector"),field("related"))
        val page=Jsoup.parse(File(directory,"search/"+record.getString("file")).readText(),record.getString("url"));page.attr("data-response-code",record.getInt("http").toString())
        val data=record.optJSONObject("data")?.let { item->item.keys().asSequence().associateWith { item.getString(it) } }
        val request=PageRequest(record.getString("request"),data,true)
        val cards=Metadata.searchCards(page,spec,request)
        if(record.getString("kind")=="translated")firstPages[id]=cards.map { it.url }.toSet()
        if(record.getString("kind")=="translated-page2")verify(cards.isNotEmpty()&&cards.any { it.url !in firstPages[id].orEmpty() },"$id second page has real additional results")
        if(record.getString("kind")=="empty")verify(cards.isEmpty(),"$id empty query must not return trending") else counts[id]=(counts[id]?:0)+cards.size
        report.put(JSONObject().put("site",id).put("kind",record.getString("kind")).put("cards",cards.size).put("next",Pagination.next(page,request)!=null).put("nextUrl",Pagination.next(page,request)?.url.orEmpty()).put("http",record.getInt("http")))
    }
    for((id,count)in counts)verify(count>0,"$id original + translated query has actual results")
    File(directory,"kotlin-search-results.json").writeText(report.toString(2));println(report.toString())
}
