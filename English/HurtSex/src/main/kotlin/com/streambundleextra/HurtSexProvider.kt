package com.streambundleextra
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
class HurtSexProvider: RussianProvider(SiteSpec(
 id="HurtSex",
 title="HurtSex",
 origin="https://www.hurtsex.com",
 cards="a[href*=/video/]:has(.plugthumb)",
 link="a[href]",
 titleSelector=".titlebox",
 tagSelector=".videoinfo a[href*=/category/], .tags a, .videopage .tagsbox a[href*=/tag/], .videopage .tagsbox a[href*=/category/]",
 descriptionSelector=".videoinfo .description",
 sections=listOf(Section("Latest","/"))
)) {
    override var lang = "en"

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.trimEnd('/') + "/search", data = mapOf("q" to term))

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean = Playback.links(name, mainUrl, data, subtitleCallback, callback, staticPlayerHost = "nonkporno.com")
}
