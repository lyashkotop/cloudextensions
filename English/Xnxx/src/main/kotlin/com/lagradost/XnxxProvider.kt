package com.lagradost
import com.cloudextensions.russian.*
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
class XnxxProvider: RussianProvider(SiteSpec(
 id="Xnxx",
 title="XNXX",
 origin="https://www.xnxx-ru.com",
 cards=".mozaique .thumb-block:not(.thumb-cat)",
 link="p a[href],.thumb a[href]",
 titleSelector="p a",
 searchMode="path",
 tagSelector=".metadata-row.video-tags a.is-keyword, .metadata-row.video-tags a[href*=/search/]",
 descriptionSelector=".metadata-row.video-description",titleLanguage="ru",
 sections=listOf(Section("Popular","/best"),Section("Most viewed","/hits"))
)) {
    override var lang = "en"

    override suspend fun page(request: PageRequest): org.jsoup.nodes.Document {
        val current = request.url.toHttpUrlOrNull()
        val localHost = mainUrl.toHttpUrlOrNull()?.host
        val url = if (current != null && current.host.removePrefix("www.") == "xnxx.com" && localHost != null) {
            current.newBuilder().host(localHost).build().toString()
        } else request.url
        return super.page(request.copy(url = url, headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)))
    }
}
