package com.streambundleextra

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.SearchResponseList
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.newSearchResponseList
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

class ThisVidProvider: RussianProvider(SiteSpec(
 id="ThisVid",
 title="ThisVid",
 origin="https://thisvid.com",
 cards="a.tumbpu:has(img)",
 link="a[href]",
 titleSelector=".title",
 tagSelector=".box ul.description a[href*=/tags/], .box ul.description a[href*=/categories/]",
 descriptionSelector=".box ul.description > li:first-child p",
 durationSelector=".box .title-description:matchesOwn([0-9]+:[0-9]{2})",
 sections=listOf(Section("Latest","/"),Section("Popular","/popular/"))
)) {
    override var lang = "en"
    override val requiresListingReview = true
    override val includeTaxonomyResults = false

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/search/").addQueryParameter("q", term).build().toString())

    private val blockedTag = Regex("""(?iu)(?<![\p{L}\p{N}])(?:str8|srt8|straight)[\s_-]*guys?(?![\p{L}\p{N}])""")

    private fun blockedTagUrl(url: String): Boolean {
        val parts = url.toHttpUrlOrNull()?.pathSegments ?: return false
        return parts.firstOrNull() == "tags" && parts.getOrNull(1)?.let(blockedTag::matches) == true
    }

    override suspend fun search(query: String, page: Int): SearchResponseList {
        if (blockedTag.containsMatchIn(Metadata.clean(query))) return newSearchResponseList(emptyList(), false)
        return super.search(query, page)
    }

    override suspend fun page(request: PageRequest): Document {
        if (blockedTagUrl(request.url)) throw ErrorLoadingException("Video hidden by category filter")
        val videoPage = request.url.toHttpUrlOrNull()?.pathSegments?.firstOrNull() == "videos"
        // Share the video page already fetched for the search filter with details and playback.
        val document = super.page(if (videoPage) request.copy(allowNotFound = true) else request)
        if (videoPage && document.attr("data-response-code") in setOf("404", "410")) {
            throw ErrorLoadingException("Видео удалено или недоступно")
        }
        if (blockedTagUrl(document.baseUri()) || document.select(spec.tagSelector).any { tag ->
                blockedTag.matches(Metadata.clean(tag.text())) || blockedTagUrl(tag.absUrl("href"))
            }
        ) throw ErrorLoadingException("Video hidden by category filter")
        return document
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        return Playback.linksFromPage(name, mainUrl, data, document, emptyList(), subtitleCallback, callback)
    }
}
