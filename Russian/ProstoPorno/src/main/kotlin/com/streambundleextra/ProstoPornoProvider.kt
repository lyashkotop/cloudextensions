package com.streambundleextra

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.SearchResponseList

class ProstoPornoProvider: RussianProvider(SiteSpec(
    id="ProstoPorno", title="ProstoPorno", origin="https://prostoporno.dev",
    cards=".thumb:has(a.img[href*=/videos/])", link="a.img[href]", titleSelector=".title", searchMode="path",
    tagSelector="#video-info a[href*=/categor], #video-info a[href*=/tag]", descriptionSelector="", related="#relcontent",
    sections=listOf(
        Section("Новинки","/"),
    )
)) {
    override val translateQueries = false
    override val includeTaxonomyResults = false

    override suspend fun search(query: String, page: Int): SearchResponseList {
        if (page < 1 || query.isBlank() || Translation.searchAliases(query).isNotEmpty()) {
            return super.search(query, page)
        }
        val original = super.search(query, 1)
        // Keep the site's original order and pagination once it finds matching videos.
        if (original.items.isNotEmpty() || original.hasNext) {
            return if (page == 1) original else super.search(query, page)
        }

        val translated = Translation.translated(query) ?: return original
        return super.search(translated, page)
    }
}
