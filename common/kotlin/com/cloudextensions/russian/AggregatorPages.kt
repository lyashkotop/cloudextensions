package com.cloudextensions.russian

import org.json.JSONObject
import org.json.JSONArray
import org.jsoup.nodes.Document
import java.net.URI

/** Fields explicitly attached to the current video, never unrelated JSON feed entries. */
object AggregatorPages {
    fun video(page: Document): JSONObject? = AggregatorVideo.video(page)

    private fun labels(value: Any?): List<String> = when (value) {
        is JSONArray -> (0 until value.length()).flatMap { labels(value.opt(it)) }
        is JSONObject -> labels(value.optString("name").ifBlank { value.optString("label") })
        is String -> value.split(',').mapNotNull(Metadata::tag)
        else -> emptyList()
    }
    private fun tags(item: JSONObject): List<String> =
        (labels(item.opt("tags")) + labels(item.opt("categories"))).distinctBy { it.lowercase() }

    private fun pageTags(page: Document, state: JSONObject?): List<String> {
        val address = URI(page.baseUri()).host.orEmpty().removePrefix("www.")
        val host = if (address.endsWith(".faphouse.com")) "faphouse.com" else address
        val selector = when (host) {
            "m.drtuber.com", "drtuber.com" -> ".watch .tools_cat a[href*=/tags/], .watch .tools_cat a[href*=/categories/], .video_box .categories_list a[href*=/tags/], .video_box .categories_list a[href*=/categories/]"
            "m.viptube.com", "viptube.com" -> ".data_name .list a.selected"
            "faphouse.com" -> ".video-info-details__categories a[href^=/c/]"
            "pornezy.com", "fapvana.com", "pornvio.com", "bondagenest.com", "sexpester.com",
            "matur3.com", "w4nkr.com", "extremehoes.com", "threesomerz.com" -> ".vp-i .taxl a[href^=/tag/], .vp-i .taxl a[href^=/tags/], .vp-i .taxl a.tx-c"
            "yesvids.com" -> ".chips-row a[href^=/categories/]"
            "reflectivedesire.com" -> ".video-tags .video-tags-list a, .video-tags-line .video-tags-links a"
            "fapcat.com" -> ".block-details .item a[href*=/tags/], .block-details .item a[href*=/categories/]"
            "vrporn.com" -> ".list.mt2-6 a[href^=/tag/]"
            "lujuriax.com" -> ".xv-tags-box a"
            "youporn.com" -> ":is(#watch-container, .watch-container) .videoTags a.tm_carousel_tag:is([href^=/category/], [href^=/porntags/])"
            else -> ".VideoDetailArea .VideoQuickLinks a[href*=/category/], .VideoDetailArea .VideoQuickLinks a[href*=/tag/]"
        }
        val visible = page.select(selector).mapNotNull { Metadata.tag(it.text()) }
        if (!EmbeddedPlayers.isXHamsterHost(host)) return visible + page
            .select("meta[property=video:tag], meta[name=video:tag], meta[property=og:video:tag]")
            .flatMap { labels(it.attr("content")) }

        if (state == null) return visible
        val component = state.optJSONObject("videoTagsComponent") ?: return visible
        val id = state.optJSONObject("videoEntity")?.optString("id").orEmpty()
        if (id.isBlank() || component.optString("videoId") != id) return visible
        val items = component.optJSONArray("tags") ?: return visible
        return (0 until items.length()).mapNotNull { index ->
            val item = items.optJSONObject(index) ?: return@mapNotNull null
            if (!item.optBoolean("isTag") && !item.optBoolean("isCategory")) return@mapNotNull null
            Metadata.tag(item.optString("name"))
        }
    }
    fun detail(page:Document,spec:SiteSpec):VideoDetail {
        val address = URI(page.baseUri())
        val mobileDrTuber = address.host == "m.drtuber.com"
        val titleSelector = if (mobileDrTuber) ".video_play > .container > .thumbs_result:not(#footer-lc) .heading h2"
            else spec.detailTitleSelector
        val base=Metadata.detail(page,spec.copy(descriptionSelector=".VideoDescription, .video-desc, .vp-description", detailTitleSelector=titleSelector))
        val item=video(page)
        val state = if (EmbeddedPlayers.isXHamsterHost(address.host.orEmpty().removePrefix("www."))) EmbeddedPlayers.initials(page) else null
        val tags = (item?.let(::tags).orEmpty() + pageTags(page, state) + base.tags.flatMap(::labels)).distinctBy { it.lowercase() }
        if(item==null) {
            val xHamsterVideo = state?.optJSONObject("videoEntity")?.takeIf { entity ->
                val hash = entity.optString("idHashSlug")
                hash.isNotBlank() && address.path.orEmpty().trimEnd('/').endsWith("-$hash")
            }
            return base.copy(
                tags = tags,
                duration = Metadata.timing(xHamsterVideo?.optString("duration")).ifBlank { base.duration },
                description = base.description.ifBlank { Metadata.description(xHamsterVideo?.optString("description"), base.title) },
            )
        }
        val meta=item.optJSONObject("metadata")
        val duration=Metadata.timing(meta?.optString("duration")).ifBlank{Metadata.timing(item.optString("duration"))}
        return base.copy(
            title = base.title.ifBlank {
                Metadata.title(page.baseUri(), listOf(meta?.optString("title").orEmpty(), item.optString("title")),
                    language = spec.titleLanguage, fromDetail = true)
            },
            tags=tags,
            duration=duration.ifBlank{base.duration},
            description=Metadata.description(item.optString("description"),base.title),
            poster=Metadata.choosePoster(page.baseUri(),base.poster,item.optString("poster")),
            score=VideoScores.api(item) ?: base.score,
        )
    }
    fun related(page:Document,spec:SiteSpec):List<VideoCard> {
        val host = URI(page.baseUri()).host
        val data=AggregatorVideo.props(page)?.optJSONObject("initialRelatedVideos")?.optJSONArray("data")
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
            result += VideoCard(
                Metadata.title(url, listOf(title)), url, Metadata.rememberPoster(url, poster),
                Metadata.timing(meta?.optString("duration")), labels, VideoScores.api(item),
            )
        }
        if (result.isEmpty() && host.orEmpty().removePrefix("www.") == "youporn.com") {
            result += Metadata.cards(page, spec.copy(
                cards = ":is(#relatedVideosWrapper, #relatedVideos) article.video-box:has(img)",
                link = "a.video-title-text[href^=/watch/]",
                titleSelector = "a.video-title-text",
            ))
        }
        if(result.isEmpty()) {
            val selectors = listOf(
                ".RelatedVideos a[href*=/video/]:has(img)",
                "main article.card a[href*=/video/]:has(img)",
                "#list_videos_related_videos_items a[href*=/videos/]:has(img)",
                "#list_videos_related_videos_items a[href*=/video/]:has(img)",
                "#relateddiv a[href*=/video-]:has(img)",
                ".video_play > .thumbs_result a[href*=/video/]:has(img)",
            ).joinToString(",")
            result+=Metadata.cards(page,spec.copy(cards=selectors,link="a[href]",titleSelector=".card-t,.title,h2,h3"))
        }
        return result.filter{videoKey(it.url)!=videoKey(page.baseUri()) && URI(it.url).host==host}.distinctBy{videoKey(it.url)}
    }
}
