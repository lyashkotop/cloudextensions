package com.cloudextensions.russian

import org.json.JSONObject
import org.jsoup.nodes.Document

/** AbXXX metadata used by the TubeBDSM aggregator. */
object AbxxxMetadata {
    suspend fun enrich(page: Document, includeRelated: Boolean): Document {
        val id=EmbeddedPlayers.abId(page) ?: return page
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
        if (!includeRelated) return result
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
