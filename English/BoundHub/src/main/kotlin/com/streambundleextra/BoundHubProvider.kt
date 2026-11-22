package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import org.jsoup.nodes.Document
class BoundHubProvider: RussianProvider(SiteSpec(
 id="BoundHub",title="BoundHub",origin="https://www.boundhub.com",cards=".list-videos .item",link="a[href]",titleSelector=".title",searchMode="get",
 sections=listOf(Section("Videos","/")),
 searchContainer="#list_videos_videos_list_search_result"
)) {
    override var lang = "en"
    override val includeTaxonomyResults = false

    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        val duration = document.selectFirst(".block-details .info .item span:matchesOwn((?i)^Duration:)")?.text()
        val exact = Metadata.timing(duration?.substringAfter(':'))
        return detail.copy(duration = exact.ifBlank { detail.duration })
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        return Playback.linksFromPage(name, mainUrl, data, document, emptyList(), subtitleCallback, callback,
            useResolvedUrl = true)
    }
}
