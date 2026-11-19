package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import com.lagradost.cloudstream3.utils.*
import java.net.URI
import java.util.concurrent.TimeUnit
import okhttp3.Interceptor
import okhttp3.Request

/** CloudStream appends the quality itself: numeric streams must have an empty name. */
object QualityLinks {
    const val MAX_HEIGHT=1080
    fun allowed(quality:Int)=quality<=MAX_HEIGHT
    data class Master(val streams:List<Variant>,val hasHigher:Boolean)
    data class Variant(val url:String,val height:Int,val codecPreference:Int=0)
    internal data class Selection(val links: List<ExtractorLink>, val rejectedStatus: Int? = null)
    private data class ManifestCheck(val manifest: Master? = null, val rejectedStatus: Int? = null)
    fun variants(base:String,text:String):List<Variant> {
        if(!text.trimStart().startsWith("#EXTM3U"))return emptyList()
        // A child playlist alone cannot preserve externally declared audio/subtitle groups.
        if(Regex("#EXT-X-MEDIA:.*URI=",RegexOption.IGNORE_CASE).containsMatchIn(text))return emptyList()
        val result=mutableListOf<Variant>()
        var height:Int?=null
        var codec=0
        for(raw in text.lineSequence()) {
            val line=raw.trim()
            if(line.startsWith("#EXT-X-STREAM-INF:")) {
                val match=Regex("RESOLUTION=(\\d+)x(\\d+)",RegexOption.IGNORE_CASE).find(line)
                height=match?.let{minOf(it.groupValues[1].toInt(),it.groupValues[2].toInt())}
                codec=when{line.contains("avc1",true)->3;line.contains("hvc1",true)||line.contains("hev1",true)->2;line.contains("av01",true)->1;else->0}
            } else if(line.isNotBlank() && !line.startsWith('#')) {
                val resolution=height
                if(resolution!=null && resolution in 100..8640) {
                    val url=try{URI(base).resolve(line).toString()}catch(_:Exception){""}
                    if(url.startsWith("https://")||url.startsWith("http://"))result+=Variant(url,resolution,codec)
                }
                height=null
            }
        }
        return result.groupBy{it.height}.values.mapNotNull{it.maxByOrNull{v->v.codecPreference}}
    }
    fun label(name:String,quality:Int,hls:Boolean):String = when {
        name.contains("preview",true) || name.contains("превью",true)->"Превью"
        quality!=Qualities.Unknown.value && quality>=0->""
        hls->""
        Regex("(?i)(?:^|[ (])high(?:[ )]|$)").containsMatchIn(name)->"Высокое"
        Regex("(?i)(?:^|[ (])low(?:[ )]|$)").containsMatchIn(name)->"Низкое"
        else->"Оригинал"
    }
    private suspend fun checkManifest(link: ExtractorLink, interceptor: Interceptor?): ManifestCheck? =
        RequestLimits.optional(2500) {
            val request = Request.Builder().url(link.url).header("Referer", link.referer)
            link.headers.forEach { (key, value) -> request.header(key, value) }
            val client = app.baseClient.newBuilder().callTimeout(2, TimeUnit.SECONDS)
            if (interceptor != null) client.addInterceptor(interceptor)
            Network.read(request.build(), client.build()) { response ->
                if (!response.isSuccessful) {
                    return@read if (response.code in setOf(404, 410)) ManifestCheck(rejectedStatus = response.code) else null
                }
                val body = response.body?.source() ?: return@read ManifestCheck(rejectedStatus = 415)
                body.request(262_145)
                if (body.buffer.size > 262_144) return@read null
                val text = body.readUtf8().trimStart('\uFEFF').trimStart()
                if (!text.startsWith("#EXTM3U")) return@read ManifestCheck(rejectedStatus = 415)
                ManifestCheck(Master(
                    variants(response.request.url.toString(), text),
                    Regex("RESOLUTION=(\\d+)x(\\d+)", RegexOption.IGNORE_CASE).findAll(text).any {
                        minOf(it.groupValues[1].toIntOrNull() ?: 0, it.groupValues[2].toIntOrNull() ?: 0) > MAX_HEIGHT
                    },
                ))
            }
        }

    suspend fun choices(link: ExtractorLink): List<ExtractorLink> = select(link, null).links

    internal suspend fun select(link: ExtractorLink, interceptor: Interceptor?): Selection {
        if(!allowed(link.quality) && !link.isM3u8)return Selection(emptyList())
        val readableHls=link.isM3u8 && link !is ExtractorLinkPlayList
        val check = if (readableHls) checkManifest(link, interceptor) else null
        if (check?.rejectedStatus != null) return Selection(emptyList(), check.rejectedStatus)
        val manifest = check?.manifest
        val streams=manifest?.streams.orEmpty().filter{allowed(it.height)}
        val quality=if(link.isM3u8 && link.quality==Qualities.Unknown.value)0 else link.quality
        val result=mutableListOf<ExtractorLink>()
        // An unrestricted master containing higher tracks must not remain as Auto.
        if(allowed(link.quality) && manifest?.hasHigher!=true)result+=rename(link,link.url,quality)
        if(link !is DrmExtractorLink)for(variant in streams)result+=rename(link,variant.url,variant.height)

        return Selection(result)
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
