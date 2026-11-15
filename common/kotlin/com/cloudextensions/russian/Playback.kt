package com.cloudextensions.russian

import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.network.WebViewResolver
import com.lagradost.cloudstream3.utils.*
import java.util.Collections
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.withTimeoutOrNull
import org.json.JSONArray
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
        for(e in page.select("video source[src],video[src],meta[property=og:video],meta[property=og:video:url],meta[property=og:video:secure_url]")) {
            if(e.closest("a[href],.tuba,.video-card,.tiled_item,.related,.related-videos,#related-videos,#list_videos_related_videos")!=null)continue
            val url=absolute(page.baseUri(),e.attr("src").ifBlank { e.attr("content") }) ?: continue
            if(playable(url))result+=Source(url,e.attr("label").ifBlank { e.attr("res") }.takeIf(String::isNotBlank))
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
        val structured=Metadata.ownVideo(page)?.optString("contentUrl")
        absolute(page.baseUri(),structured)?.takeIf(::playable)?.let { result+=Source(it) }
        return result.distinctBy { it.url }
    }
    suspend fun links(name: String,origin: String,pageUrl: String,subtitles: (SubtitleFile)->Unit,callback: (ExtractorLink)->Unit): Boolean {
        val page=Network.page(PageRequest(pageUrl),origin)
        val emitted=Collections.synchronizedSet(mutableSetOf<String>())
        fun accept(link: ExtractorLink) { if(playable(link.url)&&emitted.add(link.url))callback(link) }
        suspend fun emit(source: Source,referer: String,headers: Map<String,String>) {
            if(!playable(source.url))return
            if(source.url.contains(".m3u8",true)) {
                val variants=try { M3u8Helper.generateM3u8(name,source.url,referer,headers=headers) }catch(e:CancellationException){throw e}catch(_:Exception){emptyList()}
                if(variants.isNotEmpty()){variants.forEach(::accept);return}
            }
            accept(newExtractorLink(name,name,source.url,INFER_TYPE) {
                this.referer=referer
                this.headers=headers
                quality=getQualityFromName(source.label)
            })
        }
        for(source in sources(page))emit(source,pageUrl,Network.headers(pageUrl))
        if(emitted.isNotEmpty())return true
        // Let CloudStream's maintained extractors handle embedded hosts first.
        for(frame in page.select("iframe[src]").filter { it.closest(".ad,.ads,.advertisement") == null }) {
            val url=absolute(page.baseUri(),frame.attr("src")) ?: continue
            if(url==pageUrl||advertisement.containsMatchIn(url))continue
            try { loadExtractor(url,pageUrl,subtitles,::accept) }catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        if(emitted.isNotEmpty())return true
        // Players whose URLs are computed in JavaScript are resolved by the host WebView.
        // The page's own player runs normally; no fabricated links or qualities are returned.
        val exposed=Collections.synchronizedList(mutableListOf<Source>())
        val script="""
            (function(){var out=[];if(typeof flashvars!=='undefined'&&flashvars){Object.keys(flashvars).forEach(function(k){if(/^video_(alt_)?url\d*${'$'}/.test(k)){var u=flashvars[k];if(typeof u==='string'&&/^https?:/.test(u))out.push({url:u,label:flashvars[k+'_text']||null});}});}document.querySelectorAll('video,video source').forEach(function(v){var u=v.currentSrc||v.src;if(u)out.push({url:u,label:v.getAttribute('label')});});return JSON.stringify(out);})()
        """.trimIndent()
        val resolver=WebViewResolver(
            interceptUrl=media,additionalUrls=listOf(media),useOkhttp=false,script=script,
            scriptCallback={ payload ->
                try {
                    val raw=payload?.trim().orEmpty();val decoded=if(raw.startsWith('"'))org.json.JSONTokener(raw).nextValue().toString() else raw
                    val list=JSONArray(decoded)
                    for(i in 0 until list.length()){val item=list.optJSONObject(i) ?: continue;val url=item.optString("url");if(playable(url))exposed+=Source(url,item.optString("label").takeIf(String::isNotBlank))}
                }catch(_:Exception){}
            },timeout=18_000L
        )
        val captured=withTimeoutOrNull(20_000){resolver.resolveUsingWebView(pageUrl,referer=origin,headers=Network.headers(pageUrl))}
        val requests=captured?.second.orEmpty().filter { playable(it.url.toString()) }
        for(source in exposed.toList().distinctBy { it.url })emit(source,pageUrl,Network.headers(pageUrl))
        for(request in requests) {
            val headers=request.headers.toMap().filterKeys { it.lowercase() !in setOf("host","connection","content-length","accept-encoding","range") }
            emit(Source(request.url.toString()),pageUrl,headers)
        }
        return emitted.isNotEmpty()
    }
}
