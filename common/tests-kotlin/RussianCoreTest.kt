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
    verify(Metadata.plot(metadata)=="Длительность: 02:03","exact duration first in plot")
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
