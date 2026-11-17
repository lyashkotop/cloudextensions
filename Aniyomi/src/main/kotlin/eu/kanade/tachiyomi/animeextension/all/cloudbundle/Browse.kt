package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import com.cloudextensions.russian.*
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element

/** Explicit site routes: choosing a tab never downloads the homepage to guess its address. */
object Browse {
    fun supported(p:Profile,popular:Boolean)=p.data.optJSONObject("browse")?.optString(if(popular)"popular" else "latest")?.let{it.isNotBlank()&&it!="null"}==true
    fun request(p:Profile,popular:Boolean):PageRequest {
        val config=p.data.getJSONObject("browse");val key=if(popular)"popular" else "latest"
        val raw=config.optString(key).takeUnless{it.isBlank()||it=="null"}
            ?: throw java.io.IOException(config.optString(key+"Reason","Сайт не публикует этот раздел"))
        return PageRequest(WebUrls.resolve(p.base+"/",raw) ?: throw java.io.IOException("Invalid catalogue URL"))
    }
    fun spec(p:Profile,popular:Boolean):SiteSpec {
        val selector=p.data.getJSONObject("browse").optString((if(popular)"popular" else "latest")+"Cards")
        return if(selector.isBlank())p.spec else p.spec.copy(cards=selector)
    }
    fun paginated(p:Profile,popular:Boolean)=p.data.getJSONObject("browse").optBoolean((if(popular)"popular" else "latest")+"Paginated",true)
    fun listing(doc:Document):Element {
        // A KVS front page may also contain watched/trending/promoted rows. Use its paginated list.
        for(pager in doc.select("[id$=_pagination]")) {
            val id=pager.id().removeSuffix("_pagination")
            if(!id.startsWith("list_videos_"))continue
            doc.getElementById(id+"_items")?.let{return it}
            doc.getElementById(id)?.let{return it}
        }
        return doc
    }
}
