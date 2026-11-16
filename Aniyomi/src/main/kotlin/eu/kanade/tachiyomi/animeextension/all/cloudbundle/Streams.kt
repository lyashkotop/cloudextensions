package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import com.cloudextensions.russian.*
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import org.json.*
import java.net.URI
import java.math.BigInteger
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.*
import okhttp3.Request

data class Stream(val url:String,val quality:Int?,val referer:String,val headers:Map<String,String>,val hls:Boolean=false)
object Streams {
    private val media=Regex("(?i)(?:/get_file/|\\.(?:m3u8|mp4|webm|mpd)(?:[/?#&]|$))")
    private fun resolution(raw:String?)=Regex("(?:^|[^0-9])(\\d{3,4})(?:p|$)").find(raw.orEmpty())?.groupValues?.get(1)?.toIntOrNull()
    fun unpack(text:String):String {
        if(!text.contains("eval(function(") && !text.contains("eval(function ("))return text
        var result=text
        val pattern=Regex("""\}\(\s*('(?:\\.|[^'\\])*+'|"(?:\\.|[^"\\])*")\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*('(?:\\.|[^'\\])*+'|"(?:\\.|[^"\\])*")\.split\(['"]\|['"]\)""")
        repeat(3) {
            val match=pattern.find(result) ?: return result
            val payload=try{JSONTokener(match.groupValues[1]).nextValue().toString()}catch(_:Exception){return result}
            val radix=match.groupValues[2].toIntOrNull()?.takeIf{it in 2..62} ?: return result
            val table=try{JSONTokener(match.groupValues[4]).nextValue().toString().split('|')}catch(_:Exception){return result}
            val alphabet="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            result=Regex("\\b[0-9A-Za-z]+\\b").replace(payload){m->var number=0L;for(c in m.value){val n=alphabet.indexOf(c);if(n !in 0 until radix)return@replace m.value;number=number*radix+n;if(number>=table.size)return@replace m.value};table[number.toInt()].ifEmpty{m.value}}
        }
        return result
    }
    private fun extras(page:Document):List<Playback.Source> {
        val result=mutableListOf<Playback.Source>()
        for(script in page.select("script:not([type=application/ld+json]):not(#__NEXT_DATA__)")) {
            val decoded=unpack(script.data())
            for(m in Regex("""(?:file|hls4|hls2|source|src)\s*[:=]\s*(['"])([^'"\s]+)\1""").findAll(decoded)) {
                val url=URI(page.baseUri()).resolve(m.groupValues[2].replace("\\/","/")).toString()
                if(media.containsMatchIn(url))result+=Playback.Source(url)
            }
            if(decoded!=script.data())for(m in Regex("""https?://[^\s'"<>]+\.m3u8[^\s'"<>]*""").findAll(decoded))result+=Playback.Source(m.value.replace("\\/","/"))
        }
        return result
    }
    suspend fun resolve(p:Profile,url:String):List<Stream> = withContext(Dispatchers.IO) {
        val queue=java.util.ArrayDeque<Pair<String,String>>();queue.add(url to p.base)
        if(p.engine=="beeg")Regex("[?&]e=([A-Za-z0-9]+)").find(url)?.groupValues?.get(1)?.let{queue.addFirst("https://www.xvideos.com/embedframe/$it" to url)}
        val visited=mutableSetOf<String>();val found=mutableListOf<Stream>()
        while(queue.isNotEmpty() && visited.size<14 && found.isEmpty()) {
            val (target,referer)=queue.removeFirst();if(!visited.add(target))continue
            try {
                if(p.engine=="bdsmx" && target==url) {
                    for(source in NativeApis.apiSources(p,url))found+=probe(source,url,p.requestHeaders)
                    if(found.isNotEmpty())break
                }
                val page=Network.page(PageRequest(target,headers=if(URI(target).host==URI(p.base).host)p.requestHeaders else emptyMap()),referer)
                val actual=page.baseUri()
                val candidates=Playback.sources(page)+extras(page)+EmbeddedPlayers.abSources(page)
                for(source in candidates.distinctBy{it.url})found+=probe(source,actual,if(p.engine=="noodle")p.requestHeaders+mapOf("User-Agent" to "stagefright/1.2 (Linux;Android 13)") else Network.headers(actual))
                if(found.isNotEmpty())break
                if(p.engine=="eporner" || URI(actual).host.orEmpty().removePrefix("www.")=="eporner.com")for(source in eporner(p,actual))found+=probe(source,p.base,Network.headers(p.base))
                EmbeddedPlayers.original(page)?.let{queue.add(it to actual)}
                for(frame in page.select("iframe[src],iframe[data-src]")) {
                    if(frame.closest(".ad,.ads,.advertisement")!=null)continue
                    val raw=frame.attr("data-src").ifBlank{frame.attr("src")}
                    if(raw.isBlank()||raw.startsWith("javascript:")||raw.startsWith("data:"))continue
                    val child=URI(actual).resolve(raw).toString()
                    if(Regex("(?i)googletagmanager|doubleclick|trafficjunky|adserver").containsMatchIn(child))continue
                    queue.add(child to actual)
                }
                if(p.id=="JavGuru") {
                    for(m in Regex(""""iframe_url":"([A-Za-z0-9+/=]+)"""").findAll(page.html())) {
                        try{queue.add(String(java.util.Base64.getDecoder().decode(m.groupValues[1])) to actual)}catch(_:Exception){}
                    }
                    val body=page.html();val cid=Regex("""cid:\s*'([a-z0-9]+)'""").find(body)?.groupValues?.get(1);val type=Regex("""rtype:\s*'([a-z]+)'""").find(body)?.groupValues?.get(1)
                    if(cid!=null && type!=null) {
                        val keys=Regex("""'(data-[a-z0-9]+)'""").findAll(body).map{it.groupValues[1]}.take(3).toList();val element=page.getElementById(cid)
                        val token=keys.joinToString(""){element?.attr(it).orEmpty()}
                        if(token.length>=6)queue.add("${p.base}/searcho/?${type}r=${token.reversed()}" to actual)
                    }
                }
            }catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        if(found.isEmpty()) {
            val target=visited.lastOrNull() ?: url
            for(captured in AndroidPlayer.capture(target,url))found+=probe(Playback.Source(captured.url),captured.referer,captured.headers)
        }
        if(found.isEmpty())throw java.io.IOException("Источник не предоставил доступный поток. Открой страницу в WebView и проверь доступ.")
        found.distinctBy{it.url}.sortedByDescending{it.quality ?: 0}
    }
    private suspend fun probe(source:Playback.Source,referer:String,headers:Map<String,String>):List<Stream> {
        val q=resolution(source.label)
        if(q!=null && q>1080)return emptyList()
        if(!source.url.startsWith("http"))return emptyList()
        return RequestLimits.optional(4500) {
            val builder=Request.Builder().url(source.url).header("Range","bytes=0-31")
            headers.forEach{(k,v)->builder.header(k,v)}
            Network.client.newBuilder().callTimeout(4,TimeUnit.SECONDS).build().newCall(builder.build()).execute().use { response ->
                if(!response.isSuccessful)return@use emptyList()
                val mime=response.header("Content-Type").orEmpty()
                if(mime.contains("text/html",true))return@use emptyList()
                val hls=mime.contains("mpegurl",true)||response.request.url.encodedPath.endsWith(".m3u8")||response.request.url.queryParameter("hls")=="1"
                val stream=Stream(response.request.url.toString(),q,referer,headers,hls)
                if(hls)hlsChoices(stream) else listOf(stream)
            }
        }.orEmpty()
    }
    private suspend fun hlsChoices(stream:Stream):List<Stream> = RequestLimits.optional(4500) {
        val request=Request.Builder().url(stream.url);stream.headers.forEach{(k,v)->request.header(k,v)}
        Network.client.newBuilder().callTimeout(4,TimeUnit.SECONDS).build().newCall(request.build()).execute().use { response ->
            if(!response.isSuccessful)return@use emptyList()
            val body=response.body?.source() ?: return@use emptyList();body.request(524289)
            if(body.buffer.size>524288)return@use listOf(stream)
            val text=body.readUtf8();if(!text.trimStart().startsWith("#EXTM3U"))return@use emptyList()
            val result=mutableListOf<Stream>();var height:Int?=null;var hasHigher=false
            val external=Regex("#EXT-X-MEDIA:.*URI=",RegexOption.IGNORE_CASE).containsMatchIn(text)
            for(line in text.lineSequence().map{it.trim()}) {
                if(line.startsWith("#EXT-X-STREAM-INF:")){height=Regex("RESOLUTION=(\\d+)x(\\d+)",RegexOption.IGNORE_CASE).find(line)?.let{minOf(it.groupValues[1].toInt(),it.groupValues[2].toInt())};if((height?:0)>1080)hasHigher=true}
                else if(line.isNotBlank()&&!line.startsWith('#')){val h=height;if(h!=null&&h in 100..1080&&!external)result+=stream.copy(url=URI(response.request.url.toString()).resolve(line).toString(),quality=h);height=null}
            }
            if(!hasHigher)result.add(0,stream)
            result.distinctBy{it.quality}
        }
    } ?: listOf(stream)
    private suspend fun eporner(p:Profile,url:String):List<Playback.Source> {
        val base=URI(url).let{"${it.scheme}://${it.rawAuthority}"}
        val id=Regex("/(?:video-|hd-porn/|embed/)([A-Za-z0-9]+)").find(url)?.groupValues?.get(1) ?: return emptyList()
        val embed="$base/embed/$id/";val text=Network.page(PageRequest(embed),url).html()
        val hash=Regex("""EP\.video\.player\.hash\s*=\s*'([^']+)'""").find(text)?.groupValues?.get(1) ?: return emptyList()
        val value=hash.chunked(8).joinToString(""){BigInteger(it,16).toString(36)}
        val endpoint="$base/xhr/video/$id?hash=$value&domain=www.eporner.com&pixelRatio=1&playerWidth=0&playerHeight=0&fallback=false&embed=true&supportedFormats=hls,dash,h265,vp9,av1,mp4"
        val raw=Network.page(PageRequest(endpoint,headers=mapOf("X-Requested-With" to "XMLHttpRequest")),embed).wholeText()
        val result=mutableListOf<Playback.Source>()
        for(m in Regex("""labelShort"\s*:\s*"(\d{3,4}p)[^"]*"\s*,\s*"src"\s*:\s*"([^"]+)"""").findAll(raw))result+=Playback.Source(m.groupValues[2].replace("\\/","/"),m.groupValues[1])
        Regex(""""srcFallback"\s*:\s*"([^"]+)"""").find(raw)?.groupValues?.get(1)?.let{result+=Playback.Source(it.replace("\\/","/"))}
        return result
    }
}
