package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
class BoundHubProvider: RussianProvider(SiteSpec(
 id="BoundHub",title="BoundHub",origin="https://www.boundhub.com",cards=".list-videos .item",link="a[href]",titleSelector=".title",searchMode="get",
 sections=listOf(Section("Videos","/"))
)) {
    override var lang = "en"

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        return Playback.linksFromPage(name, mainUrl, data, document, emptyList(), subtitleCallback, callback,
            useResolvedUrl = true)
    }
}
