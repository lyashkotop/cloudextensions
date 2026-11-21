package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.LoadResponse
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
class DarknessPornProvider: RussianProvider(SiteSpec(
 id="DarknessPorn",title="DarknessPorn",origin="https://darknessporn.com",cards=".thumb",link="a[href]",titleSelector=".title,h2,h3",searchMode="get",
 tagSelector="#single-wrapper .category-menu.tag .tags-list a[href*=/tag/]",
 sections=listOf(Section("Videos","/"), Section("Most viewed","/?filter=most-viewed"))
)) {
    override var lang = "en"
    override val translateQueries = false

    private val sitePromotion = Regex(
        """(?i)(?:^|\s+[-–—]\s+)sick\s+.*?\s*porn video!\s*Extreme\s+.*?\s*video that you won['’]t find anywhere[!.]?$"""
    )
    private val siteBrand = Regex("""(?i)\bdarkness\s*porn\b""")

    override suspend fun load(url: String): LoadResponse {
        val detail = super.load(url)
        val summary = detail.plot.orEmpty().replace(sitePromotion, "").trim()
        // The site also generates whole descriptions with its hostname and rotating ad copy.
        detail.plot = summary.takeUnless(siteBrand::containsMatchIn)
            ?.let { Metadata.description(it, detail.name).ifBlank { null } }
        return detail
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean = NosoFilesPlayback.links(name, mainUrl, data, subtitleCallback, callback)
}
