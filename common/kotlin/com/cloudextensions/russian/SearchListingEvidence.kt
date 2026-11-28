package com.cloudextensions.russian

import java.util.Locale
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

    private val bdsmPornGuy = Regex("""пар(?:ень|ня|ню|нем|не|ни|ней|ням|нями|нях)|guys?""")
    private val bdsmPornSlave = Regex("""рабын(?:я|и|ю|ей|ь|ям|ями|ях)|slaves?""")
    private val bdsmPornRussian = Regex("""русск(?:ая|ую|ой|ие|их|ий|ое|ого|им|ими|ом)|russian""")
    private val bdsmPornHumiliation = Regex("""униж\p{L}+|униз\p{L}+|humiliat\p{L}+""")

    fun bdsmPornTitleMatcher(query: String): (String) -> Boolean {
        val term = Metadata.clean(query).lowercase(Locale.ROOT)
        val aliases = Translation.searchAliases(term)
        val wordPattern = when {
            term in setOf("guy", "парень") -> bdsmPornGuy
            term in setOf("рабыня", "рабыни", "slave", "slaves") -> bdsmPornSlave
            term in setOf("русская", "русские", "russian") -> bdsmPornRussian
            "унижение" in aliases -> bdsmPornHumiliation
            else -> null
        }
        val phrases = (listOf(term) + aliases).map { text -> word.findAll(text).map { it.value }.toList() }
            .filter { it.isNotEmpty() }
        return { title ->
            val titleWords = word.findAll(title.lowercase(Locale.ROOT)).map { it.value }.toSet()
            if (wordPattern != null) titleWords.any(wordPattern::matches) || term in titleWords
            else phrases.any { titleWords.containsAll(it) }
        }
    }
}
