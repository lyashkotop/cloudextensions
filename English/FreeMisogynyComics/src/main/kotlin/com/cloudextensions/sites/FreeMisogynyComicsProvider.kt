package com.cloudextensions.sites

import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.json.JSONTokener
import org.jsoup.nodes.Document

class FreeMisogynyComicsProvider : RussianProvider(
    SiteSpec(
        id = "FreeMisogynyComics",
        title = "3. Free Misogyny XXX Comics",
        origin = "https://free-misogyny-xxx-comics.com",
        cards = "article.type-videos:has(a.video-thumb-link[href]), .wpst-related-videos article.type-videos:has(a.related-video-link[href])",
        link = "a.video-thumb-link[href], a.related-video-link[href]",
        titleSelector = ".video-info-title",
        detailTitleSelector = "h1.entry-title",
        tagSelector = "main ul.tags a[href*=/photos-tag/]",
        related = ".wpst-related-videos",
        searchContainer = ".search-section-videos",
        sections = listOf(Section("Videos", "/videos/")),
    ),
) {
    override var lang = "en"
    private val mediaVariable = Regex("""\bvar\s+(prHlsMaster|prMp4Fallback)\s*=\s*("(?:\\.|[^"\\])*")""")

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/")
            .addQueryParameter("s", term).addQueryParameter("post_type", "videos").build().toString())

    override suspend fun page(request: PageRequest): Document = super.page(request).clone().apply {
        // WordPress sets this class from the photo query even when its video section has matches.
        if (selectFirst(".search-section-videos article.type-videos a.video-thumb-link[href]") != null) {
            body().removeClass("search-no-results")
        }
        select("article.type-videos .badge-duration").forEach { it.attr("data-duration", it.text()) }
        select(".wpst-related-videos article.type-videos a.pr-topic-tag[href]").attr("rel", "tag")
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val detail = page(PageRequest(data))
        val frameUrl = detail.selectFirst("iframe.gmzsvp-reference-frame[src]")
            ?.absUrl("src")?.toHttpUrlOrNull()
            ?.takeIf {
                it.isHttps && it.host == mainUrl.toHttpUrl().host && it.encodedPath == "/" &&
                    it.queryParameter("gmzsvp_frame") == "1" &&
                    !it.queryParameter("p").isNullOrBlank() && !it.queryParameter("s").isNullOrBlank()
            } ?: return false
        val player = Network.page(PageRequest(frameUrl.toString()), detail.baseUri())
        val sources = player.select("script:not([src])").flatMap { script ->
            mediaVariable.findAll(script.data()).mapNotNull { match ->
                val value = JSONTokener(match.groupValues[2]).nextValue() as? String
                val media = value?.toHttpUrlOrNull()?.takeIf {
                    it.isHttps && it.host == "videos.free-misogyny-xxx-comics.com" &&
                        it.encodedPath.endsWith(if (match.groupValues[1] == "prHlsMaster") ".m3u8" else ".mp4")
                } ?: return@mapNotNull null
                Playback.Source(media.toString())
            }.toList()
        }.distinct()
        if (sources.isEmpty()) return false
        return Playback.linksFromPage(name, mainUrl, frameUrl.toString(), player, sources, subtitleCallback, callback)
    }
}
