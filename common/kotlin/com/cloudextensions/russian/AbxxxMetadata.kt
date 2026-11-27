package com.cloudextensions.russian

import org.json.JSONObject
import org.jsoup.nodes.Document

/** AbXXX metadata used by the TubeBDSM aggregator. */
object AbxxxMetadata {
    suspend fun enrich(page: Document, includeRelated: Boolean): Document {
        val id=EmbeddedPlayers.abId(page) ?: return page
        val origin = EmbeddedPlayers.abOrigin(page) ?: return page
        val number=id.toLongOrNull() ?: return page
        val bucket="${number/1_000_000*1_000_000}/${number/1000*1000}"
        val raw=Network.page(PageRequest("$origin/api/json/video/86400/$bucket/$id.json"),page.baseUri()).wholeText()
        val video=JSONObject(raw).optJSONObject("video") ?: return page
        if(video.optString("video_id")!=id || video.optString("is_private")=="1")return page
        val result=page.clone()
        result.body().appendElement("h1").text(video.optString("title"))
        result.body().appendElement("div").addClass("video-desc").text(video.optString("description"))
        result.head().appendElement("meta").attr("itemprop","duration").attr("content",video.optString("duration"))
        result.head().appendElement("meta").attr("property","og:image").attr("content",video.optString("thumbsrc"))
        if (video.has("likes") && video.has("dislikes")) {
            result.head().appendElement("meta").attr("data-source-votes", "")
                .attr("data-likes", video.optString("likes")).attr("data-dislikes", video.optString("dislikes"))
        }
        val tags=result.body().appendElement("div").addClass("video-tags")
        for (field in listOf("categories", "tags")) {
            val values = video.optJSONObject(field) ?: continue
            for (key in values.keys()) {
                val entry = values.optJSONObject(key) ?: continue
                val label = entry.optString("title").ifBlank { entry.optString("name") }
                Metadata.tag(label)?.let { tags.appendElement("a").text(it) }
            }
        }
        if (!includeRelated) return result
        RequestLimits.optional(850) {
            val related=Network.page(PageRequest("$origin/api/json/videos_related2/432000/20/$bucket/$id.all.1.json"),page.baseUri()).wholeText()
            val videos=JSONObject(related).optJSONArray("videos") ?: return@optional
            val box=result.body().appendElement("div").addClass("RelatedVideos")
            for(i in 0 until videos.length()) {
                val item=videos.optJSONObject(i) ?: continue
                val target=item.optString("video_id");val dir=item.optString("dir")
                if(!target.matches(Regex("\\d+")) || dir.isBlank())continue
                val a=box.appendElement("a").attr("href","$origin/video/$target/$dir/").attr("title",item.optString("title"))
                a.appendElement("img").attr("src",item.optString("scr"))
                a.appendElement("span").addClass("title").text(item.optString("title"))
            }
        }
        return result
    }
}
