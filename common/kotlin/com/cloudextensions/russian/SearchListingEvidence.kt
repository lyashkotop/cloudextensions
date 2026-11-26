package com.cloudextensions.russian

import org.json.JSONArray
import org.json.JSONObject

object SearchListingEvidence {
    /** xHamster's suggestions and popular videos are separate from its result count and list. */
    fun xHamsterResults(state: JSONObject): JSONArray? {
        val count = state.optJSONObject("searchTitleSummaryComponent")?.optString("resultCount").orEmpty()
        if (count.none { it in '1'..'9' }) return null
        return state.optJSONObject("searchResult")?.optJSONArray("videoThumbProps")
            ?.takeIf { it.length() > 0 }
    }

    /** HeavyR can swap ads and reorder a latest-uploads grid between two requests. */
    fun heavyRIsFallback(ids: Set<String>, reference: Set<String>): Boolean {
        if (ids.size < 12 || reference.size < 12) return false
        val overlap = ids.count { it in reference }
        return overlap * 4 >= maxOf(ids.size, reference.size) * 3
    }

    private val word = Regex("""[\p{L}\p{N}]+""")

    fun matchesTitle(title: String, query: String): Boolean {
        val terms = word.findAll(query.lowercase()).map { it.value }.toList()
        val titleWords = word.findAll(title.lowercase()).map { it.value }.toSet()
        return terms.isNotEmpty() && terms.all { it in titleWords }
    }
}
