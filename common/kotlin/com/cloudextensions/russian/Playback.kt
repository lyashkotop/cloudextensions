package com.cloudextensions.russian

import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.network.WebViewResolver
import com.lagradost.cloudstream3.utils.*
import java.util.Collections
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import kotlinx.coroutines.withTimeoutOrNull
import com.lagradost.cloudstream3.ErrorLoadingException
import org.json.JSONArray
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.nodes.Document

/** Extract only source-provided URLs and quality labels. Host libraries are not copied into the plugin. */
object Playback {
    data class Source(val url: String,val label: String?=null)
    fun streamType(url:String,contentType:String?=null):ExtractorLinkType {
        val mime=contentType.orEmpty().substringBefore(';').trim().lowercase()
        val uri=try{java.net.URI(url)}catch(_:Exception){null}
        return when {
            mime.contains("mpegurl") || uri?.path.orEmpty().endsWith(".m3u8",true) || uri?.query.orEmpty().split('&').any{it=="hls=1"}->ExtractorLinkType.M3U8
            mime=="application/dash+xml" || uri?.path.orEmpty().endsWith(".mpd",true)->ExtractorLinkType.DASH
            else->ExtractorLinkType.VIDEO
        }
    }
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
        // Modern Next.js players declare only this video's sources in pageProps.firstVideo.
        AggregatorVideo.video(page)?.let { video ->
            val list=video.optJSONArray("sources")
            val entries=mutableListOf<JSONObject>()
            video.optJSONObject("source")?.let{entries+=it}
            if(list!=null)for(i in 0 until list.length())list.optJSONObject(i)?.let{entries+=it}
            for(item in entries){val url=absolute(page.baseUri(),item.optString("src"))?:continue;if(playable(url))result+=Source(url,item.optString("label").takeIf(String::isNotBlank))}
        }
        // Player-scoped source maps (e.g. Pornvio) provide explicit resolution keys.
        for(player in page.select("[data-sources]"))try {
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
    suspend fun links(name:String,origin:String,pageUrl:String,subtitles:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean = resolveLinks(name,origin,pageUrl,subtitles,callback,false)
    suspend fun links(
        name: String, origin: String, pageUrl: String, subtitles: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit, staticPlayerHost: String
    ): Boolean = resolveLinks(name, origin, pageUrl, subtitles, callback, false, staticPlayerHost)
    suspend fun confirmedLinks(name:String,origin:String,pageUrl:String,subtitles:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean = resolveLinks(name,origin,pageUrl,subtitles,callback,true)

    /** True for media, false for a confirmed failure, null when the request timed out. */
    suspend fun checkDirectLink(link: ExtractorLink): Boolean? =
        MediaRequests.probe(link.url, link.referer, link.headers)?.let { it.status in 200..299 }

    suspend fun linksFromPage(
        name: String, origin: String, pageUrl: String, page: Document, declared: List<Source>,
        subtitles: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit
    ): Boolean = resolveLinks(name, origin, pageUrl, subtitles, callback, false, loadedPage = page, declared = declared)

    private suspend fun resolveLinks(
        name: String, origin: String, pageUrl: String, subtitles: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit, requireConfirmed: Boolean, staticPlayerHost: String? = null,
        loadedPage: Document? = null, declared: List<Source> = emptyList()
    ): Boolean {
        val page = loadedPage ?: Network.page(PageRequest(pageUrl),origin)
        val emitted=Collections.synchronizedSet(mutableSetOf<String>())
        fun accept(link: ExtractorLink) { if(playable(link.url)&&emitted.add(link.url))callback(link) }
        val rejected = mutableListOf<Int>()
        var unreachable=false
        var playerUrl=page.baseUri()
        val probeLimit = Semaphore(4)
        suspend fun verifySources(
            sources: List<Source>, referer: String, headers: Map<String, String>, confirmed: Boolean = requireConfirmed,
        ): List<Int?> = coroutineScope {
            val probes = sources.asSequence().filter { playable(it.url) }.distinctBy { it.url }.map { source ->
                async { source to probeLimit.withPermit { MediaRequests.probe(source.url, referer, headers) } }
            }.toList().awaitAll()
            probes.map { (source, probe) ->
                val status = probe?.status
                when {
                    status == null && confirmed -> unreachable = true
                    status != null && status !in 200..299 -> rejected += status
                    else -> accept(newExtractorLink(name, name, source.url, streamType(probe?.url ?: source.url, probe?.mime)) {
                        this.referer = referer
                        this.headers = headers
                        quality = getQualityFromName(source.label)
                    })
                }
                status?.takeUnless { it in 200..299 }
            }
        }
        suspend fun resolve(document:Document,referer:String): Int? {
            val headers = Network.headers(referer)
            val statuses = verifySources(sources(document), referer, headers)
            verifySources(EmbeddedPlayers.abSources(document), referer, headers)
            // Pornhub declares an MP4 catalogue URL in mediaDefinitions, not a video file.
            for(script in document.select("script")) {
                val match=Regex("""["']?mediaDefinitions["']?\s*:\s*""").find(script.data())?:continue
                val list=try{JSONTokener(script.data().substring(match.range.last+1)).nextValue() as? JSONArray}catch(_:Exception){null}?:continue
                for(i in 0 until list.length()) {
                    val entry=list.optJSONObject(i)?:continue
                    val endpoint=absolute(document.baseUri(),entry.optString("videoUrl"))?:continue
                    if(playable(endpoint)||!endpoint.contains("/video/get_media"))continue
                    val raw=RequestLimits.optional(5000){Network.page(PageRequest(endpoint),referer).wholeText()}?:continue
                    val streams=try{JSONArray(raw)}catch(_:Exception){continue}
                    val variants = (0 until streams.length()).mapNotNull { index ->
                        val item = streams.optJSONObject(index) ?: return@mapNotNull null
                        val url = absolute(endpoint, item.optString("videoUrl")) ?: return@mapNotNull null
                        Source(url, item.optString("quality"))
                    }
                    verifySources(variants, referer, headers)
                }
            }
            return statuses.firstOrNull()?.takeIf { statuses.all { code -> code == 404 || code == 410 } }
        }
        if (declared.isNotEmpty()) {
            verifySources(declared, page.baseUri(), Network.headers(page.baseUri()), confirmed = true)
            if (emitted.isNotEmpty()) return true
        }
        resolve(page,page.baseUri())
        if(emitted.isNotEmpty())return true
        // Let CloudStream's maintained extractors handle embedded hosts first.
        var missingStaticFile: Int? = null
        var unresolvedFrame = false
        val players = page.select("iframe[src],iframe[data-src]")
            .filter { it.closest(".ad,.ads,.advertisement") == null }
            .map { it.attr("data-src").ifBlank { it.attr("src") } } +
            listOfNotNull(Metadata.ownVideo(page)?.optString("embedUrl"))
        for (url in players.mapNotNull { absolute(page.baseUri(), it) }.distinct()) {
            if(url==pageUrl||advertisement.containsMatchIn(url)||java.net.URI(url).host.orEmpty().contains("googletagmanager"))continue
            // An iframe may be an HTML player even when its path ends in .mp4.
            // Resolve that declared page before falling back to an Android WebView.
            var finalUrl=url
            try {
                val child=RequestLimits.optional(6500){Network.page(PageRequest(url),pageUrl)}
                if(child!=null){
                    finalUrl = child.baseUri()
                    val missingFile = resolve(child, finalUrl)
                    if (missingFile != null && staticPlayerHost != null &&
                        java.net.URI(finalUrl).host?.removePrefix("www.") == staticPlayerHost
                    ) {
                        missingStaticFile = missingFile
                        continue
                    }
                    if(emitted.isEmpty())EmbeddedPlayers.original(child)?.let{original ->
                        val source=RequestLimits.optional(6500){Network.page(PageRequest(original),finalUrl)}
                        if(source!=null){finalUrl=source.baseUri();resolve(source,finalUrl)}
                    }
                }
                if(emitted.isNotEmpty())continue
            }catch(e:CancellationException){throw e}catch(_:Exception){}
            unresolvedFrame = true
            playerUrl=finalUrl
            try { loadExtractor(finalUrl,pageUrl,subtitles,::accept) }
            catch(e:CancellationException){throw e}catch(_:Exception){}catch(_:LinkageError){}
        }
        if(emitted.isNotEmpty())return true
        if(page.baseUri()!=pageUrl)try{loadExtractor(page.baseUri(),origin,subtitles,::accept)}
        catch(e:CancellationException){throw e}catch(_:Exception){}catch(_:LinkageError){}
        if(emitted.isNotEmpty())return true
        if (!unresolvedFrame) missingStaticFile?.let { status ->
            throw ErrorLoadingException("Сервер плеера $name вернул HTTP $status для файла видео")
        }
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
        val captured = try {
            withTimeoutOrNull(20_000) { resolver.resolveUsingWebView(playerUrl, referer = pageUrl, headers = Network.headers(playerUrl)) }
        } catch (e: NotImplementedError) {
            (missingStaticFile ?: rejected.firstOrNull())?.let { throw mediaError(it) }
            throw e
        }
        val requests=captured?.second.orEmpty().filter { playable(it.url.toString()) }
        verifySources(exposed.toList(), playerUrl, Network.headers(playerUrl))
        for(request in requests) {
            val headers=request.headers.toMap().filterKeys { it.lowercase() !in setOf("host","connection","content-length","accept-encoding","range") }
            verifySources(listOf(Source(request.url.toString())), playerUrl, headers)
        }
        val failure = missingStaticFile ?: rejected.firstOrNull()
        if (emitted.isEmpty() && failure != null) throw mediaError(failure)
        if(emitted.isEmpty() && requireConfirmed && unreachable)throw ErrorLoadingException("Сервер видео не ответил: нет подтверждённых потоков")
        return emitted.isNotEmpty()
    }

    internal fun mediaError(status: Int): ErrorLoadingException {
        val detail = when (status) {
            401, 403 -> "Сервер ограничил доступ к видео"
            404, 410 -> "Файл видео удалён или недоступен"
            415 -> "Сервер вернул страницу или ответ без видеоданных"
            429 -> "Сервер ограничил частоту запросов"
            in 500..599 -> "Сервер видео временно недоступен"
            else -> "Сервер файла видео отклонил запрос"
        }
        return ErrorLoadingException("$detail (HTTP $status)")
    }
}
