package com.cloudextensions.russian

import org.json.JSONObject
import org.jsoup.nodes.Document
import java.net.URI

/** Fields explicitly attached to the current video, never unrelated JSON feed entries. */
object AggregatorPages {
    private fun props(page:Document):JSONObject? = try{JSONObject(page.selectFirst("script#__NEXT_DATA__")?.data().orEmpty()).optJSONObject("props")?.optJSONObject("pageProps")}catch(_:Exception){null}
    fun video(page:Document):JSONObject? {
        val item=props(page)?.optJSONObject("firstVideo") ?: return null
        val path=item.optString("basePath").trimEnd('/')
        val current=try{URI(page.baseUri()).path.trimEnd('/')}catch(_:Exception){""}
        return item.takeIf{path.isNotBlank() && current==path}
    }
    private fun tags(item:JSONObject):List<String> {
        val array=item.optJSONArray("tags") ?: return emptyList()
        return (0 until array.length()).mapNotNull{array.optJSONObject(it)?.optString("name")?.let(Metadata::tag)}.distinct()
    }
    fun detail(page:Document,spec:SiteSpec):VideoDetail {
        val base=Metadata.detail(page,spec.copy(descriptionSelector=".VideoDescription, .video-desc, .vp-description"))
        val item=video(page)
        if(item==null) {
            val extra=page.select(".VideoDetailArea .VideoQuickLinks a[href*=/category/], .VideoDetailArea .VideoQuickLinks a[href*=/tag/]").mapNotNull{Metadata.tag(it.text())}.distinct()
            return base.copy(tags=base.tags.ifEmpty{extra})
        }
        val meta=item.optJSONObject("metadata")
        val duration=Metadata.timing(meta?.optString("duration")).ifBlank{Metadata.timing(item.optString("duration"))}
        return base.copy(
            tags=tags(item).ifEmpty{base.tags},
            duration=duration.ifBlank{base.duration},
            description=Metadata.description(item.optString("description"),base.title),
            poster=Metadata.choosePoster(page.baseUri(),base.poster,item.optString("poster"))
        )
    }
    fun related(page:Document,spec:SiteSpec):List<VideoCard> {
        val data=props(page)?.optJSONObject("initialRelatedVideos")?.optJSONArray("data")
        val result=mutableListOf<VideoCard>()
        if(video(page)!=null && data!=null)for(i in 0 until data.length()) {
            val item=data.optJSONObject(i) ?: continue
            val url=absolute(page.baseUri(),item.optString("basePath")) ?: continue
            val meta=item.optJSONObject("metadata")
            val title=meta?.optString("title").orEmpty().ifBlank{item.optString("title")}
            if(!Metadata.sourceValue(title))continue
            val labels=tags(item)
            if(!ContentPolicy.accepts(title,labels))continue
            val poster=item.optJSONObject("thumbnails")?.optString("md").orEmpty().ifBlank{item.optString("poster")}
            result+=VideoCard(Metadata.title(url,listOf(title)),url,Metadata.rememberPoster(url,poster),Metadata.timing(meta?.optString("duration")),labels)
        }
        if(result.isEmpty()) {
            val selectors=".RelatedVideos a[href*=/video/]:has(img), main article.card a[href*=/video/]:has(img)"
            result+=Metadata.cards(page,spec.copy(cards=selectors,link="a[href]",titleSelector=".card-t,.title,h2,h3"))
        }
        return result.filter{videoKey(it.url)!=videoKey(page.baseUri()) && URI(it.url).host==URI(page.baseUri()).host}.distinctBy{videoKey(it.url)}
    }
}
