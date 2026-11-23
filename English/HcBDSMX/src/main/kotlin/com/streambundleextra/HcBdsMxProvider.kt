package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
class HcBdsMxProvider: RussianProvider(SiteSpec(
 id="HcBDSMX",title="hcBDSM",origin="https://hcbdsm.com",cards="a[href^=/video/]:has(img)",link="a[href]",titleSelector="h3,h2",searchMode="path",
 tagSelector="main .min-w-0 > .mt-5 a[href^=/tags/], main .min-w-0 > .mt-3 a[href^=/categories/]",
 related="main aside:has(> h2:matchesOwn((?i)^up next$)), #related-videos, .related-videos",
 sections=listOf(Section("Latest","/latest-updates/"),Section("Popular","/trending/"),
    Section("Homemade","/categories/homemade/"),Section("Amateur","/categories/amateur/")),
 searchSections=listOf(Section("Homemade","/tags/homemade/"),Section("Amateur","/tags/amateur/"))
)) {
    override var lang = "en"

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean = Playback.links(name, mainUrl, data, subtitleCallback, callback, staticPlayerHost = "bdsmstreak.com")
}
