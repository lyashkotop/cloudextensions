package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
class DarknessPornProvider: RussianProvider(SiteSpec(
 id="DarknessPorn",title="DarknessPorn",origin="https://darknessporn.com",cards=".thumb",link="a[href]",titleSelector=".title,h2,h3",searchMode="get",
 tagSelector="#single-wrapper .category-menu.tag .tags-list a[href*=/tag/]",
 sections=listOf(Section("Videos","/"), Section("Most viewed","/?filter=most-viewed"))
)) {
    override var lang = "en"

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean = NosoFilesPlayback.links(name, mainUrl, data, subtitleCallback, callback)
}
