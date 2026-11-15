package com.cloudextensions.probes
import com.cloudextensions.russian.*
import org.jsoup.Jsoup
import org.json.*
import java.io.File

/** Reads captured real HTTP pages; reports field counts without printing media or titles. */
fun main(args:Array<String>) {
    val directory=File(args[0]);val profiles=JSONObject(File(args[1]).readText())
    val details=JSONArray(File(directory,"details.json").readText());val rows=JSONArray()
    val roots=JSONArray(File(directory,"roots.json").readText());val searches=JSONArray(File(directory,"searches.json").readText())
    for(id in profiles.keys()) {
        val p=profiles.getJSONObject(id)
        val spec=SiteSpec(id,id,p.getString("origin"),p.getString("cards"),p.getString("link"),p.getString("titleSelector"),emptyList(),p.optString("searchMode","get"),p.optString("tagSelector"),p.optString("descriptionSelector"),detailTitleSelector=p.optString("detailTitleSelector"),durationSelector=p.optString("durationSelector"))
        val search=(0 until searches.length()).map{searches.getJSONObject(it)}.firstOrNull{it.getString("site")==id&&it.optInt("http")==200}
        val root=(0 until roots.length()).map{roots.getJSONObject(it)}.first{it.getString("site")==id}
        val file=File(directory,if(search==null)"$id.html" else "$id-search.html")
        val page=Jsoup.parse(file.readText(),(search?:root).getString("url"))
        val request=PageRequest(page.baseUri())
        val cards=Metadata.searchCards(page,spec,request)
        rows.put(JSONObject().put("site",id).put("kind","catalogue").put("cards",cards.size).put("posters",cards.count{it.poster!=null}).put("next",Pagination.next(page,request)!=null))
        for(i in 0 until details.length()) {
            val record=details.getJSONObject(i)
            if(record.getString("site")!=id||record.optInt("http")!=200)continue
            val doc=Jsoup.parse(File(directory,record.getString("file")).readText(),record.getString("url"))
            val base=Metadata.detail(doc,spec)
            val original=File(directory,"TubeSafari-canonical-"+record.getInt("number")+".html")
            val d=if(id=="TubeSafari"&&original.isFile() && original.readText().contains("property=\"og:duration\""))DetailEnrichment.merge(base,Metadata.detail(Jsoup.parse(original.readText(),DetailEnrichment.original(doc) ?: doc.baseUri()),spec.copy(tagSelector=".video-tags-list a.is-keyword",descriptionSelector=".video-description-text"))) else base
            rows.put(JSONObject().put("site",id).put("kind","detail").put("number",record.getInt("number")).put("titleLength",d.title.length).put("descriptionLength",d.description.length).put("tags",d.tags.size).put("duration",d.duration.isNotBlank()).put("poster",d.poster!=null).put("staticPlayerSources",Playback.sources(doc).size))
        }
    }
    File(directory,"kotlin-metadata-results.json").writeText(rows.toString(2))
    println(rows.toString(2))
}
