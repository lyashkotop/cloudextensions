package com.cloudextensions.russian

import java.net.URI
import org.json.JSONArray
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.nodes.Document

/** Player data belongs to the requested source, never to advertisements or another feed item. */
object EmbeddedPlayers {
    internal fun isXHamsterHost(host: String) = host in setOf("xhamster.com", "ru.xhamster.com")

    fun initials(page:Document):JSONObject? {
        for(script in page.select("script")) {
            val match=Regex("window\\.initials\\s*=\\s*").find(script.data()) ?: continue
            return try{JSONTokener(script.data().substring(match.range.last+1)).nextValue() as? JSONObject}catch(_:Exception){null}
        }
        return null
    }
    fun original(page:Document):String? {
        val host=try{URI(page.baseUri()).host.orEmpty().removePrefix("www.")}catch(_:Exception){return null}
        if(!isXHamsterHost(host))return null
        val url=initials(page)?.optJSONObject("sharingComponent")?.optString("shareLink") ?: return null
        return absolute(page.baseUri(),url)?.takeIf{isXHamsterHost(URI(it).host.orEmpty().removePrefix("www.")) && it!=page.baseUri()}
    }
    fun sources(page:Document):List<Playback.Source> {
        if(try{!isXHamsterHost(URI(page.baseUri()).host.orEmpty().removePrefix("www."))}catch(_:Exception){true})return emptyList()
        val data=initials(page)?.optJSONObject("xplayerSettings")?.optJSONObject("sources") ?: return emptyList()
        val result=mutableListOf<Playback.Source>()
        // Apply the same public URL transformation as the site's player.
        fun add(item:JSONObject){val url=PlayerUrls.decode(item.optString("url"));if(url.startsWith("https://")||url.startsWith("http://"))result+=Playback.Source(url,item.optString("quality"))}
        data.optJSONObject("hls")?.optJSONObject("h264")?.let(::add)
        val standard=data.optJSONObject("standard")?.optJSONArray("h264")
        if(standard!=null)for(i in 0 until standard.length())standard.optJSONObject(i)?.let(::add)
        return result
    }
    internal fun abOrigin(page: Document): String? {
        val uri=try{URI(page.baseUri())}catch(_:Exception){return null}
        val host = uri.host.orEmpty().removePrefix("www.")
        return "https://$host".takeIf { host in setOf("abxxx.com", "bdsmx-porn.com", "bdsmx.tube") }
    }
    internal fun abId(page:Document):String? {
        if (abOrigin(page) == null) return null
        return Regex("^/video/(\\d+)(?:/|$)").find(URI(page.baseUri()).path.orEmpty())?.groupValues?.get(1)
    }
    fun decodeAb(value:String):String? = try {
        val alphabet="АВСDЕFGHIJKLМNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,~"
        // The player's public base164 alphabet substitutes Cyrillic characters and punctuation.
        val bytes=java.io.ByteArrayOutputStream();var buffer=0;var bits=0
        for(character in value) {
            val index=alphabet.indexOf(character)
            if(index==64)break
            if(index<0)continue
            buffer=(buffer shl 6) or index;bits+=6
            if(bits>=8){bits-=8;bytes.write((buffer shr bits) and 255)}
        }
        val decoded=String(bytes.toByteArray(),Charsets.ISO_8859_1)
        Regex("%([0-9a-fA-F]{2})").replace(decoded){it.groupValues[1].toInt(16).toChar().toString()}.takeIf{it.startsWith("/get_file/") || it.startsWith("https://")}
    }catch(_:Exception){null}
    suspend fun abSources(page:Document):List<Playback.Source> {
        val id=abId(page) ?: return emptyList()
        val origin = abOrigin(page) ?: return emptyList()
        val endpoint="$origin/api/videofile.php?video_id=$id&lifetime=8640000"
        val raw = RequestLimits.optional(5000) { Network.page(PageRequest(endpoint),page.baseUri()).wholeText() } ?: return emptyList()
        val files=try{JSONArray(raw)}catch(_:Exception){return emptyList()}
        return (0 until files.length()).mapNotNull { i ->
            val file=files.optJSONObject(i) ?: return@mapNotNull null
            if(file.optString("format")=="_tr.mp4")return@mapNotNull null
            val url=absolute(page.baseUri(),decodeAb(file.optString("video_url"))) ?: return@mapNotNull null
            // Format names do not establish an exact numeric resolution.
            Playback.Source(url)
        }
    }
}
