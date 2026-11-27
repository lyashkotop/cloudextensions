package com.lagradost
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import org.jsoup.nodes.Document
class VideoHubProvider: RussianProvider(SiteSpec(
 id="PornVideos",
 title="PornVideos.rs",
 origin="https://www.pornvideos.rs",
 cards="a[href*=/video/]:has(.plugthumb)",
 link="a[href]",
 titleSelector=".titlebox",
 tagSelector=".videoinfo a[href*=/category/], .video-info a[href*=/tag/], .tags a, .videopage .tagsbox a[href*=/tag/], .videopage .tagsbox a[href*=/category/]",
 descriptionSelector=".videoinfo .description, .video-description",
 detailTitleSelector=".videopage h2",
 sections=listOf(Section("Latest","/"))
)) {
    override var lang = "en"
    override val requiresListingReview = true

    override suspend fun reviewMetadata(document: Document, detail: VideoDetail): VideoDetail {
        Playback.rejectMissingStaticMedia(document, "nonkporno.com")
        return detail
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean = Playback.links(name, mainUrl, data, subtitleCallback, callback, staticPlayerHost = "nonkporno.com")
}
