package com.streambundleextra

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.ErrorLoadingException
import org.jsoup.nodes.Document

class ProstoPornoProvider: RussianProvider(SiteSpec(
    id="ProstoPorno", title="ProstoPorno", origin="https://prostoporno.dev",
    cards=".thumb:has(a.img[href*=/videos/]):not(.is_private):not(:has(.is_private))", link="a.img[href]", titleSelector=".title", searchMode="path",
    tagSelector="#video-info a[href*=/categor], #video-info a[href*=/tag]", descriptionSelector="", related="#relcontent",
    sections=listOf(
        Section("Новинки","/"),
    )
)) {
    override val includeTaxonomyResults = false

    override suspend fun page(request: PageRequest): Document {
        val document = super.page(request)
        val accessNotice = document.selectFirst("#player > p")?.ownText().orEmpty()
        if (accessNotice.startsWith("Это личное видео пользователя", ignoreCase = true)) {
            throw ErrorLoadingException("Приватное видео")
        }
        return document
    }
}
