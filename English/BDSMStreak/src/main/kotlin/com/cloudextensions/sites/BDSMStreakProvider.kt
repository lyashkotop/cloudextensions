package com.cloudextensions.sites

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import org.jsoup.nodes.Document
class BDSMStreakProvider: RussianProvider(SiteSpec(
 id="BDSMStreak",title="BDSM Streak",origin="https://bdsmstreak.com",
 cards="a[href*=/video/]:has(img)",link="a[href]",titleSelector="h2,h3",
 tagSelector="main a.v2-tag[href*=/search], main .p-4 a[href*=/search]",
 related="main aside section:has(> h3:matchesOwn((?i)^related videos$)), #related-videos, .related-videos",
 sections=listOf(Section("Videos","/"))
)) {
    override var lang = "en"

    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        val description = document.selectFirst("meta[property=og:description]")?.attr("content")
        return detail.copy(description = detail.description.ifBlank { Metadata.description(description, detail.title) })
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        if (document.selectFirst("main video[data-vid]") == null) {
            return Playback.linksFromPage(name, mainUrl, data, document, emptyList(), subtitleCallback, callback)
        }
        val playerPage = document.clone()
        playerPage.select("video:not([data-vid])").remove()
        return Playback.linksFromPage(name, mainUrl, data, playerPage, emptyList(), subtitleCallback, callback)
    }
}
