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
    fun taxa(key:String):List<Taxon> {
        val list=taxonomy.optJSONArray(key) ?: return emptyList()
        return (0 until list.length()).map{list.getJSONObject(it)}.map{Taxon(cleanLabel(it.getString("label")),it.getString("url"),if(it.has("count"))it.optLong("count") else null)}.filter{it.label.isNotBlank()&&it.label.length<=100}.sortedBy{t->val path=java.net.URI(t.url).path;when{path.startsWith("/$lang/")->0;!Regex("^/[a-z]{2}/").containsMatchIn(path)->1;else->2}}.distinctBy{t->Regex("/(?:tags?|categories|category|genres?|cat)/([^/]+)").find(java.net.URI(t.url).path)?.value ?: t.label.lowercase()}
    }
    private fun cleanLabel(text:String)=text.replace(Regex("""\s+\d[\d,.]*\s*.*\d+%$"""),"").replace(Regex("""\s+\d+[ ]*(?:videos?|видео)$""",RegexOption.IGNORE_CASE),"").trim().removePrefix("#")
    private val publishedTags by lazy{taxa("tags")}
    private val observedTags=java.util.concurrent.ConcurrentHashMap<String,Taxon>()
    fun observeTags(values:List<String>){for(value in values)if(Metadata.tag(value)!=null&&ContentPolicy.accepts(value))observedTags.putIfAbsent(value.lowercase(),Taxon(value,""))}
    val tags get()=(publishedTags+observedTags.values).distinctBy{it.label.lowercase()}.sortedWith(compareByDescending<Taxon>{it.count ?: -1L})
    val categories by lazy{taxa("categories")}
    val orders by lazy{
        val list=catalog.optJSONArray("sorts")
        val result=if(list==null)emptyList() else (0 until list.length()).map{list.getJSONObject(it)}.map{Order(it.getString("label"),it.getString("key"),it.getString("value"))}
        result.filter{(engine!="noodle"||it.value.toIntOrNull()!=null)&&it.value.lowercase() !in setOf("relevance","relevancy","best")&&!Regex("(?iu)relevan|релевант").containsMatchIn(it.label)}.distinctBy{it.key+"="+it.value}
    }
    val requestHeaders:Map<String,String> get()=Network.headers(base+"/")+if(engine=="noodle")mapOf("Cookie" to "ui_lang=$lang","Accept-Language" to lang) else emptyMap()
}
data class Selection(val category:Taxon?=null,val tags:List<String> = emptyList(),val excluded:List<String> = emptyList(),val anyTag:Boolean=false,val order:Order?=null,val minSeconds:Int=0,val maxSeconds:Int=0,val durationBands:Set<Int> = setOf(0,1,2,3,4)) {
    val needsDetail get()=category!=null||tags.isNotEmpty()||excluded.isNotEmpty()||minSeconds>0||maxSeconds>0||durationBands.size!=5
    fun accepts(card:VideoCard,detail:VideoDetail?):Boolean {
        if(!ContentPolicy.accepts(detail?.title ?: card.title,detail?.tags ?: card.tags))return false
        val values=(detail?.tags ?: card.tags).map{Metadata.clean(it).lowercase()}.toSet()
        if(category!=null&&category.label.lowercase() !in values)return false
        if(tags.isNotEmpty() && !(if(anyTag)tags.any{it.lowercase() in values}else tags.all{it.lowercase() in values}))return false
        if(excluded.any{it.lowercase() in values})return false
        val duration=detail?.duration?.ifBlank{card.duration} ?: card.duration
        val seconds=duration.split(':').fold(0.0){a,v->a*60+(v.toDoubleOrNull()?:0.0)}
        if((minSeconds>0||maxSeconds>0||durationBands.size!=5)&&seconds<=0)return false
        if(durationBands.size!=5 && (when{seconds<300->0;seconds<600->1;seconds<1200->2;seconds<=2400->3;else->4}) !in durationBands)return false
        return (minSeconds==0||seconds>=minSeconds)&&(maxSeconds==0||seconds<=maxSeconds)
    }
}
