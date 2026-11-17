package com.cloudextensions.russian

import java.net.URI
import org.json.JSONArray
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.nodes.Document

/** Player data belongs to the requested source, never to advertisements or another feed item. */
object EmbeddedPlayers {
    private fun initials(page:Document):JSONObject? {
        for(script in page.select("script")) {
            val match=Regex("window\\.initials\\s*=\\s*").find(script.data()) ?: continue
            return try{JSONTokener(script.data().substring(match.range.last+1)).nextValue() as? JSONObject}catch(_:Exception){null}
        }
        return null
    }
    fun original(page:Document):String? {
        val host=try{webUri(page.baseUri()).host.orEmpty().removePrefix("www.")}catch(_:Exception){return null}
        if(host!="xhamster.com")return null
        val url=initials(page)?.optJSONObject("sharingComponent")?.optString("shareLink") ?: return null
        return absolute(page.baseUri(),url)?.takeIf{webUri(it).host.orEmpty().removePrefix("www.")==host && it!=page.baseUri()}
    }
    fun sources(page:Document):List<Playback.Source> {
        if(try{webUri(page.baseUri()).host.orEmpty().removePrefix("www.")!="xhamster.com"}catch(_:Exception){true})return emptyList()
        val data=initials(page)?.optJSONObject("xplayerSettings")?.optJSONObject("sources") ?: return emptyList()
        val result=mutableListOf<Playback.Source>()
        // Apply the same public URL transformation as the site's player.
        fun add(item:JSONObject){val url=PlayerUrls.decode(item.optString("url"));if(url.startsWith("https://")||url.startsWith("http://"))result+=Playback.Source(url,item.optString("quality"))}
        data.optJSONObject("hls")?.optJSONObject("h264")?.let(::add)
        val standard=data.optJSONObject("standard")?.optJSONArray("h264")
        if(standard!=null)for(i in 0 until standard.length())standard.optJSONObject(i)?.let(::add)
        return result
    }
    private fun abId(page:Document):String? {
        val uri=try{webUri(page.baseUri())}catch(_:Exception){return null}
        if(uri.host.orEmpty().removePrefix("www.")!="abxxx.com")return null
        return Regex("^/video/(\\d+)/").find(uri.path.orEmpty())?.groupValues?.get(1)
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
        val endpoint="https://abxxx.com/api/videofile.php?video_id=$id&lifetime=8640000"
        val raw=Network.page(PageRequest(endpoint),page.baseUri()).wholeText()
        val files=try{JSONArray(raw)}catch(_:Exception){return emptyList()}
        return (0 until files.length()).mapNotNull { i ->
            val file=files.optJSONObject(i) ?: return@mapNotNull null
            if(file.optString("format")=="_tr.mp4")return@mapNotNull null
            val url=absolute(page.baseUri(),decodeAb(file.optString("video_url"))) ?: return@mapNotNull null
            // Format names do not establish an exact numeric resolution.
            Playback.Source(url)
        }
    }
    suspend fun abPage(page:Document):Document {
        val id=abId(page) ?: return page
        val number=id.toLongOrNull() ?: return page
        val bucket="${number/1_000_000*1_000_000}/${number/1000*1000}"
        val raw=Network.page(PageRequest("https://abxxx.com/api/json/video/86400/$bucket/$id.json"),page.baseUri()).wholeText()
        val video=JSONObject(raw).optJSONObject("video") ?: return page
        if(video.optString("video_id")!=id || video.optString("is_private")=="1")return page
        val result=page.clone()
        result.body().appendElement("h1").text(video.optString("title"))
        result.body().appendElement("div").addClass("video-desc").text(video.optString("description"))
        result.head().appendElement("meta").attr("itemprop","duration").attr("content",video.optString("duration"))
        result.head().appendElement("meta").attr("property","og:image").attr("content",video.optString("thumbsrc"))
        val tags=result.body().appendElement("div").addClass("video-tags")
        val categories=video.optJSONObject("categories")
        if(categories!=null)for(key in categories.keys())categories.optJSONObject(key)?.let{tags.appendElement("a").text(it.optString("title"))}
        RequestLimits.optional(2000) {
            val related=Network.page(PageRequest("https://abxxx.com/api/json/videos_related2/432000/20/$bucket/$id.all.1.json"),page.baseUri()).wholeText()
            val videos=JSONObject(related).optJSONArray("videos") ?: return@optional
            val box=result.body().appendElement("div").addClass("RelatedVideos")
            for(i in 0 until videos.length()) {
                val item=videos.optJSONObject(i) ?: continue
                val target=item.optString("video_id");val dir=item.optString("dir")
                if(!target.matches(Regex("\\d+")) || dir.isBlank())continue
                val a=box.appendElement("a").attr("href","https://abxxx.com/video/$target/$dir/").attr("title",item.optString("title"))
                a.appendElement("img").attr("src",item.optString("scr"))
                a.appendElement("span").addClass("title").text(item.optString("title"))
            }
        }
        return result
    }
}
