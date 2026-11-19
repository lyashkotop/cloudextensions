package com.cloudextensions.sites

import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.RequestLimits
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.json.JSONObject
import org.jsoup.nodes.DataNode
import org.jsoup.nodes.Document

private val foreignLetters = Regex("""[\p{L}&&[^\p{IsLatin}]]""")

internal fun ro85English(text: String): Boolean = !foreignLetters.containsMatchIn(text)

internal class Ro85English(private val translate: suspend (String) -> String?) {
    private val translations = object : LinkedHashMap<String, String>(32, .75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, String>?): Boolean = size > 384
    }

    suspend fun query(query: String): String? {
        val clean = Metadata.clean(query)
        return if (ro85English(clean)) clean else translated(listOf(clean))[clean]
    }

    suspend fun page(source: Document): Document {
        val page = ro85Catalogue(source).clone()
        val cards = page.select(RO85_CARDS).map { card ->
            val title = card.attr("title").ifBlank { card.selectFirst(".title")?.text().orEmpty() }
            card to Metadata.clean(title)
        }
        val heading = page.selectFirst(".headline-video h1")
        val title = Metadata.clean(heading?.text())
        val tagNodes = page.select(RO85_TAGS)
        val tags = tagNodes.map { Metadata.clean(it.text()) }
        val description = page.selectFirst("meta[property=og:description]")
        val summary = Metadata.clean(description?.attr("content"))
        val values = translated(cards.map { it.second } + listOf(title, summary) + tags)

        fun english(value: String): String = if (ro85English(value)) value else values[value].orEmpty()
        for ((card, raw) in cards) {
            if (raw.isBlank() || ro85English(raw)) continue
            val englishTitle = english(raw).ifBlank { fallbackTitle(card.absUrl("href")) }
            card.attr("title", englishTitle)
            card.select("img").forEach { image ->
                if (image.hasAttr("alt")) image.attr("alt", englishTitle)
            }
            card.selectFirst(".title")?.text(englishTitle)
        }
        if (heading != null && !ro85English(title)) {
            val englishTitle = english(title).ifBlank { fallbackTitle(page.baseUri()) }
            heading.text(englishTitle)
            for (script in page.select("script[type=application/ld+json]")) {
                val data = try { JSONObject(script.data()) } catch (_: org.json.JSONException) { continue }
                if (data.optString("@type") == "VideoObject" && data.has("name")) {
                    script.empty().appendChild(DataNode(data.put("name", englishTitle).toString()))
                }
            }
        }
        for ((tag, raw) in tagNodes.zip(tags)) {
            val text = english(raw)
            if (text.isBlank()) tag.remove() else if (text != raw) tag.text(text)
        }
        description?.attr("content", english(summary))
        return page
    }

    private fun fallbackTitle(url: String): String {
        val id = url.toHttpUrlOrNull()?.pathSegments?.lastOrNull()?.substringBefore('.')
        return id?.takeIf { it.isNotEmpty() && it.all(Char::isDigit) }?.let { "Video $it…" } ?: "Video…"
    }

    private suspend fun translated(values: List<String>): Map<String, String> {
        val foreign = values.distinct().filterNot(::ro85English)
        val existing = synchronized(translations) {
            foreign.mapNotNull { key -> translations[key]?.let { key to it } }.toMap()
        }
        val translated = coroutineScope {
            foreign.filterNot(existing::containsKey).chunked(8).map { batch ->
                async {
                    val response = RequestLimits.optional(3500) { translate(batch.joinToString("\n")) }
                    val lines = response?.lines()?.map(Metadata::clean)?.filter(String::isNotBlank).orEmpty()
                    if (lines.size != batch.size) return@async emptyList()
                    batch.zip(lines).filter { (_, result) -> ro85English(result) && result.any(Char::isLetter) }
                }
            }.awaitAll().flatten()
        }
        synchronized(translations) { translated.forEach { (original, result) -> translations[original] = result } }
        return existing + translated
    }
}
