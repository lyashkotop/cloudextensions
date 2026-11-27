package com.streambundleextra
import com.cloudextensions.russian.*
import okhttp3.HttpUrl.Companion.toHttpUrl
class PervertiumProvider: RussianProvider(SiteSpec(
 id="Pervertium",
 title="Pervertium",
 origin="https://www.pervertium.com",
 cards=".pop-thumb:has(img)",
 link="a[href]",
 titleSelector=".title",
 sections=listOf(Section("Latest","/"),Section("Popular","/most-popular/"))
)) {
    override var lang = "en"

    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/search/").addQueryParameter("q", term).build().toString())
}
