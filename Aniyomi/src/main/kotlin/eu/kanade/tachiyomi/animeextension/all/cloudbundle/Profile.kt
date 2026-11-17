package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import com.cloudextensions.russian.*
import org.json.JSONObject

data class Taxon(val label:String,val url:String,val count:Long?=null)
data class Order(val label:String,val key:String,val value:String)
class Profile(val data:JSONObject,val catalog:JSONObject,taxonomyProvider:()->JSONObject={catalog}) {
    private val taxonomy by lazy(taxonomyProvider)
    val id=data.getString("id")
    val name=data.getString("name")
    val lang=data.getString("lang")
    val base=data.getString("origin")
    val engine=data.optString("engine","html")
    val translate=data.optBoolean("translate")
    val spec=SiteSpec(id,name,base,data.getString("cards"),data.getString("link"),data.getString("titleSelector"),emptyList(),data.optString("searchMode","get"),data.optString("tagSelector"),data.optString("descriptionSelector"),detailTitleSelector=data.optString("detailTitleSelector"),durationSelector=data.optString("durationSelector"),titleLanguage=data.optString("titleLanguage"))
    private val taxonomyPath=Regex("/(?:tags?|categories|category|genres?|cat)/([^/]+)")
    private val localePath=Regex("^/([a-z]{2})/")
    fun taxa(key:String):List<Taxon> {
        val list=taxonomy.optJSONArray(key) ?: return emptyList()
        val chosen=LinkedHashMap<String,Pair<Int,Taxon>>()
        for(i in 0 until list.length()) {
            val item=list.getJSONObject(i);val label=cleanLabel(item.getString("label"));val url=item.getString("url")
            if(label.isBlank()||label.length>100||!url.startsWith("http")||serviceLabel.matches(label))continue
            // Do not construct/parse thousands of URIs on the filter UI thread.
            val path="/"+url.substringAfter("://").substringAfter('/',"").substringBefore('?').substringBefore('#')
            if(Regex("(?i)/(?:albums?|photos?|members?|models?)/|/(?:categories|tags)/page/|/(?:categories|tags)/[0-9]+/?$").containsMatchIn(path))continue
            val locale=localePath.find(path)?.groupValues?.get(1)
            if(locale!=null&&locale!=lang)continue
            val score=if(locale==lang)0 else 1
            val canonical=taxonomyPath.find(path)?.value ?: label.lowercase()
            if(chosen[canonical]?.first?.let{it<=score}==true)continue
            chosen[canonical]=score to Taxon(label,url,if(item.has("count"))item.optLong("count") else null)
        }
        return chosen.values.map{it.second}
    }
    private val serviceLabel=Regex("(?iu)^(?:show more|see (?:all|more)|view (?:all|more)(?: posts)?|all (?:tags|categories)|next(?: page)?|previous(?: page)?|показать ещ[её]|все (?:теги|категории)|далее|назад|ещ[её]|[0-9]+)[\\s.»›→]*$")
    private fun cleanLabel(text:String)=text.replace(Regex("""\s+\d[\d,.]*\s*.*\d+%$"""),"").replace(Regex("""\s+\d+[ ]*(?:videos?|видео)$""",RegexOption.IGNORE_CASE),"").trim().removePrefix("#")
    private val publishedTags by lazy{taxa("tags")}
    private val observedTags=java.util.concurrent.ConcurrentHashMap<String,Taxon>()
    fun observeTags(values:List<String>){for(value in values)if(Metadata.tag(value)!=null&&ContentPolicy.accepts(value))observedTags.putIfAbsent(value.lowercase(),Taxon(value,""))}
    val tags get()=(publishedTags+observedTags.values).distinctBy{it.label.lowercase()}.sortedWith(compareByDescending<Taxon>{it.count ?: -1L})
    val categories by lazy{taxa("categories").distinctBy{it.label.lowercase()}}
    val orders by lazy{
        val list=catalog.optJSONArray("sorts")
        val result=if(list==null)emptyList() else (0 until list.length()).map{list.getJSONObject(it)}.map{Order(it.getString("label"),it.getString("key"),it.getString("value"))}
        result.filter{!it.value.startsWith("avg_")&&!it.value.startsWith("total_")&&(engine!="noodle"||it.value.toIntOrNull()!=null)&&it.value.lowercase() !in setOf("relevance","relevancy","best")&&!Regex("(?iu)relevan|релевант").containsMatchIn(it.label)}.distinctBy{it.key+"="+it.value}
    }
    val requestHeaders:Map<String,String> get()=Network.headers(base+"/")+if(engine=="noodle")mapOf("Cookie" to "ui_lang=$lang","Accept-Language" to lang) else emptyMap()
}
data class Selection(val category:Taxon?=null,val tags:List<String> = emptyList(),val excluded:List<String> = emptyList(),val anyTag:Boolean=false,val order:Order?=null,val minSeconds:Int=0,val maxSeconds:Int=0,val durationBands:Set<Int> = setOf(0,1,2,3,4)) {
    val needsDetail get()=category!=null||tags.isNotEmpty()||excluded.isNotEmpty()||minSeconds>0||maxSeconds>0||durationBands.size!=5
    fun accepts(card:VideoCard,detail:VideoDetail?):Boolean {
        if(!ContentPolicy.accepts(detail?.title ?: card.title,detail?.tags ?: card.tags))return false
        val values=(detail?.tags ?: card.tags).map{Metadata.clean(it).lowercase()}.toSet()
        if(category!=null&&!Categories.matchesCategory(category.label,values))return false
        if(tags.isNotEmpty() && !(if(anyTag)tags.any{Categories.matches(it,values)}else tags.all{Categories.matches(it,values)}))return false
        if(excluded.any{Categories.matches(it,values)})return false
        val duration=detail?.duration?.ifBlank{card.duration} ?: card.duration
        val seconds=duration.split(':').fold(0.0){a,v->a*60+(v.toDoubleOrNull()?:0.0)}
        if((minSeconds>0||maxSeconds>0||durationBands.size!=5)&&seconds<=0)return false
        if(durationBands.size!=5 && (when{seconds<300->0;seconds<600->1;seconds<1200->2;seconds<=2400->3;else->4}) !in durationBands)return false
        return (minSeconds==0||seconds>=minSeconds)&&(maxSeconds==0||seconds<=maxSeconds)
    }
}
