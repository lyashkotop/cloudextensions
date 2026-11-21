package com.streambundleextra
import com.cloudextensions.russian.*
class SickRProvider: RussianProvider(SiteSpec(
 id="SickR",
 title="SICK-R",
 origin="https://sick-r.com",
 cards=".listing__item.item-video",
 link="a[href]",
 titleSelector=".title, .listing__item-title",
 tagSelector=".info-wrapper .info-tag",
 descriptionSelector=".info-row:has(.info-title:matchesOwn(Description)) .info-value",
 sections=listOf(Section("Latest","/"),Section("Popular","/most-popular/"))
)) {
    override var lang = "en"

    override suspend fun page(request: PageRequest): org.jsoup.nodes.Document =
        super.page(request.copy(headers = request.headers + mapOf(
            "Cookie" to "kt_lang=ru",
            "Accept-Language" to Network.RUSSIAN_LANGUAGE,
        )))
}
