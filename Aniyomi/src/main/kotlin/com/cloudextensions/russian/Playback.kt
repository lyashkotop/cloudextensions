package com.cloudextensions.russian

import java.util.Collections
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.withTimeoutOrNull
import kotlinx.coroutines.withContext
import kotlinx.coroutines.Dispatchers
import org.json.JSONArray
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.nodes.Document

/** Extract only source-provided URLs and quality labels. Host libraries are not copied into the plugin. */
object Playback {
    data class Source(val url: String,val label: String?=null)
    private val media=Regex("(?i)(?:/get_file/|\\.(?:m3u8|mp4|webm|m4v|mov|mpd)(?:[/?#&]|$))")
    private val advertisement=Regex("(?i)(?:^|[/_.-])(?:ads?|vast|preroll|postroll|advert)(?:[/_.?-]|$)")
    private val variables=Regex("""\b(video_(?:alt_)?url\d*(?:_text)?|contentUrl)\s*[=:]\s*(['"])(.*?)\2""")
    private fun playable(url: String)=url.startsWith("http")&&media.containsMatchIn(url)&&!advertisement.containsMatchIn(url)
    private fun unescape(raw: String): String = try { org.json.JSONTokener("\""+raw.replace("\\'","'")+"\"").nextValue() as? String ?: raw }catch(_:Exception){raw.replace("\\/","/").replace("&amp;","&")}
    fun sources(page: Document): List<Source> {
        val result=mutableListOf<Source>()
        for(e in page.select("video source[src],video[src],meta[itemprop=contentUrl],meta[property=og:video],meta[property=og:video:url],meta[property=og:video:secure_url]")) {
            if(e.closest("a[href],.tuba,.video-card,.tiled_item,.related,.related-videos,#related-videos,#list_videos_related_videos")!=null)continue
            val url=absolute(page.baseUri(),e.attr("src").ifBlank { e.attr("content") }) ?: continue
            if(playable(url)||((e.tagName()=="source"||e.tagName()=="video")&&e.attr("type").startsWith("video/")))result+=Source(url,e.attr("res").ifBlank { e.attr("label") }.takeIf(String::isNotBlank))
        }
        // Modern Next.js players declare only this video's sources in pageProps.firstVideo.
        AggregatorPages.video(page)?.let { video ->
            val list=video.optJSONArray("sources")
            val entries=mutableListOf<JSONObject>()
            video.optJSONObject("source")?.let{entries+=it}
            if(list!=null)for(i in 0 until list.length())list.optJSONObject(i)?.let{entries+=it}
            for(item in entries){val url=absolute(page.baseUri(),item.optString("src"))?:continue;if(playable(url))result+=Source(url,item.optString("label").takeIf(String::isNotBlank))}
        }
        // Player-scoped source maps (e.g. Pornvio) provide explicit resolution keys.
        for(player in page.select("[data-sources]"))try {
            if(player.closest(".tiled_item,.related,.related-videos,#related-videos")!=null)continue
            val entries=try{JSONArray(player.attr("data-sources"))}catch(_:Exception){null}
            if(entries!=null){for(i in 0 until entries.length()){val item=entries.optJSONObject(i)?:continue;val raw=item.optString("link").ifBlank{item.optString("src")};val url=absolute(page.baseUri(),raw)?:continue;if(playable(url))result+=Source(url,item.optString("height").takeIf{it.toIntOrNull()!=null})};continue}

            val map=JSONObject(player.attr("data-sources"))
            for(key in map.keys()){val url=absolute(page.baseUri(),map.optString(key))?:continue;if(playable(url))result+=Source(url,key)}
        }catch(_:Exception){}
        for(script in page.select("script")) {
            val match=Regex("""\b(?:const|let|var)\s+sources\s*=\s*""").find(script.data()) ?: continue
            try {
                val data=JSONTokener(script.data().substring(match.range.last+1)).nextValue()
                val entries=when(data){is JSONObject->listOf(data);is JSONArray->(0 until data.length()).mapNotNull{data.optJSONObject(it)};else->emptyList()}
                for(item in entries){val url=absolute(page.baseUri(),item.optString("file").ifBlank{item.optString("src")})?:continue;if(playable(url))result+=Source(url,item.optString("label").takeIf(String::isNotBlank))}
            }catch(_:Exception){}
        }
        val values=variables.findAll(page.html()).associate { it.groupValues[1] to unescape(it.groupValues[3]) }
        val license=Regex("""license_code\s*:\s*(['"])([^'"]*)\1""").find(page.html())?.groupValues?.get(2)
        for((key,value) in values)if(!key.endsWith("_text")) {
            val decoded=KvsUrls.decode(value,license) ?: continue
            val url=absolute(page.baseUri(),decoded) ?: continue
            if(playable(url))result+=Source(url,values["${key}_text"])
        }
        for(match in Regex("""html5player\.setVideo(HLS|UrlHigh|UrlLow)\(['"]([^'"]+)['"]""").findAll(page.html())) {
            absolute(page.baseUri(),unescape(match.groupValues[2]))?.takeIf(::playable)?.let { result+=Source(it) }
        }
        // Flowplayer stores its real sources as JSON in the player element.
        for(player in page.select(".flowplayer[data-item],[data-player-config]")) {
            try {
                val config=JSONObject(player.attr("data-item").ifBlank{player.attr("data-player-config")})
                val list=config.optJSONArray("sources") ?: continue
                for(i in 0 until list.length()){val item=list.optJSONObject(i)?:continue;val url=absolute(page.baseUri(),unescape(item.optString("src")))?:continue;if(playable(url))result+=Source(url,item.optString("label").takeIf(String::isNotBlank))}
            }catch(_:Exception){}
        }
        for(script in page.select("script")) {
            val assignment=Regex("""window\.playlist\s*=\s*""").find(script.data()) ?: continue
            try {
                val config=JSONTokener(script.data().substring(assignment.range.last+1)).nextValue() as? JSONObject ?: continue
                val list=config.optJSONArray("sources") ?: continue
                for(i in 0 until list.length()) {
                    val item=list.optJSONObject(i) ?: continue
                    val url=absolute(page.baseUri(),item.optString("file")) ?: continue
                    if(playable(url))result+=Source(url,item.optString("label").takeIf(String::isNotBlank))
                }
            }catch(_:Exception){}
        }
        for(script in page.select("script")) {
            val match=Regex("""["']?mediaDefinitions["']?\s*:\s*""").find(script.data()) ?: continue
            try {
                val list=JSONTokener(script.data().substring(match.range.last+1)).nextValue() as? JSONArray ?: continue
                for(i in 0 until list.length()){val item=list.optJSONObject(i)?:continue;val url=absolute(page.baseUri(),item.optString("videoUrl"))?:continue;if(playable(url))result+=Source(url,item.optString("quality").takeIf{it.toIntOrNull()!=null})}
            }catch(_:Exception){}
        }
        val structured=Metadata.ownVideo(page)?.optString("contentUrl")
        absolute(page.baseUri(),structured)?.takeIf(::playable)?.let { result+=Source(it) }
        result+=EmbeddedPlayers.sources(page).filter{playable(it.url)}
        return result.distinctBy { it.url }
    }
}
