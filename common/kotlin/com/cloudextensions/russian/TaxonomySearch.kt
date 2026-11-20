package com.cloudextensions.russian

import java.net.URI
import org.jsoup.nodes.Document

internal object TaxonomySearch {
    private val word = Regex("""[\p{L}\p{N}]+(?:[-'][\p{L}\p{N}]+)*""")
    private val count = Regex("""\s+(?:\(\d[\d ,.]*\)|\d[\d ,.]*)(?:\s+(?:videos?|видео))?$""", RegexOption.IGNORE_CASE)
    private val taxonomyPath = Regex("""/(tags?|categor(?:y|ies)|cat|free_porn|genres?)/[^/]+""", RegexOption.IGNORE_CASE)

    fun terms(query: String): Set<String> {
        val label = Metadata.clean(query).lowercase()
        if (!word.matches(label)) return emptySet()
        return if (label in setOf("бдсм", "bdsm")) setOf("бдсм", "bdsm") else setOf(label)
    }

    fun matches(label: String, terms: Set<String>): Boolean =
        count.replace(Metadata.clean(label), "").lowercase() in terms

    fun kind(url: String): String? {
        val path = runCatching { URI(url).path }.getOrNull().orEmpty()
        val segment = taxonomyPath.find(path)?.groupValues?.get(1)?.lowercase() ?: return null
        return if (segment.startsWith("tag")) "tag" else "category"
    }

    fun links(page: Document, terms: Set<String>): List<Section> {
        val base = URI(page.baseUri())
        val host = base.host.orEmpty().removePrefix("www.")
        return page.select("a[href]").mapNotNull { link ->
            val name = link.text().ifBlank { link.attr("title") }
            if (!matches(name, terms)) return@mapNotNull null
            val url = absolute(page.baseUri(), link.attr("href")) ?: return@mapNotNull null
            if (URI(url).host.orEmpty().removePrefix("www.") != host || kind(url) == null) return@mapNotNull null
            Section(name, url)
        }
    }

    fun tagDirectory(page: Document): String? {
        val host = URI(page.baseUri()).host.orEmpty().removePrefix("www.")
        return page.select("a[href]").firstNotNullOfOrNull { link ->
            val url = absolute(page.baseUri(), link.attr("href")) ?: return@firstNotNullOfOrNull null
            val uri = URI(url)
            url.takeIf {
                uri.host.orEmpty().removePrefix("www.") == host &&
                    uri.path.orEmpty().trimEnd('/').substringAfterLast('/').equals("tags", true)
            }
        }
    }
}
