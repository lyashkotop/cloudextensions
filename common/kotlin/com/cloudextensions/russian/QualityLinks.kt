package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import com.lagradost.cloudstream3.utils.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.net.URI

/** CloudStream appends the quality itself: numeric streams must have an empty name. */
object QualityLinks {
    data class Variant(val url:String,val height:Int)
    fun variants(base:String,text:String):List<Variant> {
        if(!text.trimStart().startsWith("#EXTM3U"))return emptyList()
        // A child playlist alone cannot preserve externally declared audio/subtitle groups.
        if(Regex("#EXT-X-MEDIA:.*URI=",RegexOption.IGNORE_CASE).containsMatchIn(text))return emptyList()
        val result=mutableListOf<Variant>()
        var height:Int?=null
        for(raw in text.lineSequence()) {
            val line=raw.trim()
            if(line.startsWith("#EXT-X-STREAM-INF:")) {
                height=Regex("RESOLUTION=\\d+x(\\d+)",RegexOption.IGNORE_CASE).find(line)?.groupValues?.get(1)?.toIntOrNull()
            } else if(line.isNotBlank() && !line.startsWith('#')) {
                val resolution=height
                if(resolution!=null && resolution in 100..8640) {
                    val url=try{URI(base).resolve(line).toString()}catch(_:Exception){""}
                    if(url.startsWith("https://")||url.startsWith("http://"))result+=Variant(url,resolution)
                }
                height=null
            }
        }
        return result.distinctBy{it.url}
    }
    fun label(name:String,quality:Int,hls:Boolean):String = when {
        name.contains("preview",true) || name.contains("превью",true)->"Превью"
        quality!=Qualities.Unknown.value && quality>=0->""
        hls->""
        Regex("(?i)(?:^|[ (])high(?:[ )]|$)").containsMatchIn(name)->"Высокое"
        Regex("(?i)(?:^|[ (])low(?:[ )]|$)").containsMatchIn(name)->"Низкое"
        else->"Оригинал"
    }
    private suspend fun master(link:ExtractorLink):List<Variant> = RequestLimits.optional(2500) {
        withContext(Dispatchers.IO) {
            val request=okhttp3.Request.Builder().url(link.url).header("Referer",link.referer)
            link.headers.forEach{(k,v)->request.header(k,v)}
            app.baseClient.newBuilder().callTimeout(2,java.util.concurrent.TimeUnit.SECONDS).build().newCall(request.build()).execute().use { response ->
                if(!response.isSuccessful)return@use emptyList()
                val source=response.body?.source() ?: return@use emptyList()
                source.request(262_145)
                if(source.buffer.size>262_144)return@use emptyList()
                variants(response.request.url.toString(),source.readUtf8())
            }
        }
    }.orEmpty()

    suspend fun choices(link:ExtractorLink):List<ExtractorLink> {
        val adaptive=link.isM3u8 && link !is DrmExtractorLink && link !is ExtractorLinkPlayList && link.quality in listOf(0,Qualities.Unknown.value)
        val variants=if(adaptive)master(link) else emptyList()
        val quality=if(link.isM3u8 && link.quality==Qualities.Unknown.value)0 else link.quality
        val result=mutableListOf(rename(link,link.url,quality))
        for(variant in variants)result+=rename(link,variant.url,variant.height)
        return result
    }

    @OptIn(kotlin.uuid.ExperimentalUuidApi::class)
    private suspend fun rename(link:ExtractorLink,url:String,quality:Int):ExtractorLink {
        val name=label(link.name,quality,link.isM3u8)
        if(link is ExtractorLinkPlayList)return link.copy(name=name,quality=quality)
        val result=if(link is DrmExtractorLink)newDrmExtractorLink(link.source,name,url,link.type,link.uuid) {
            kid=link.kid;key=link.key;kty=link.kty;keyRequestParameters=link.keyRequestParameters;licenseUrl=link.licenseUrl
        }else newExtractorLink(link.source,name,url,link.type)
        result.quality=quality
        result.referer=link.referer
        result.headers=link.headers
        result.extractorData=link.extractorData
        result.audioTracks=link.audioTracks
        return result
    }
}
