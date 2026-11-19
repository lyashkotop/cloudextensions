package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
class PunishWorldProvider: RussianProvider(SiteSpec(
 id="PunishWorld",
 title="Punishworld",
 origin="https://punishworld.com",
 cards=".video-block:has(img)",
 link="a.thumb[href]",
 titleSelector=".title",
 tagSelector=".video-tags a, .video-info a[href*=/tag/], #single-wrapper .category-menu.tag .tags-list a[href*=/tag/]",
 descriptionSelector=".video-description, .video-info .description",
 sections=listOf(Section("Latest","/"), Section("Most viewed","/?filter=most-viewed"))
)) {
    override var lang = "en"

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean = NosoFilesPlayback.links(name, mainUrl, data, subtitleCallback, callback)
}
