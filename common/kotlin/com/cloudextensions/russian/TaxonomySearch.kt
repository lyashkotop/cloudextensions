package com.cloudextensions.russian

import java.net.URI
import org.jsoup.nodes.Document

internal object TaxonomySearch {
    private val word = Regex("""[\p{L}\p{N}]+(?:[-'][\p{L}\p{N}]+)*""")
    private val count = Regex("""\s+(?:\(\d[\d ,.]*\)|\d[\d ,.]*[kKmM]?)(?:\s+(?:videos?|видео))?$""", RegexOption.IGNORE_CASE)
    private val leadingCount = Regex("""^\d[\d,.]*[kKmM]?\s+""")
    private val taxonomyPath = Regex("""/(t|tags?|categor(?:y|ies)|c|cat|free_porn|genres?)/([^/]+)""", RegexOption.IGNORE_CASE)
    fun terms(query: String): Set<String> {
        val label = Metadata.clean(query).lowercase()
        return if (word.matches(label)) setOf(label) else emptySet()
    }

    fun matches(label: String, terms: Set<String>, expandGenre: Boolean = false): Boolean {
        val normalized = leadingCount.replace(count.replace(Metadata.clean(label), ""), "").lowercase()
        if (normalized in terms) return true
        if (!expandGenre) return false
        return normalized.split(',', '/', '·').any { part ->
            Translation.searchAliases(part).any(terms::contains)
        }
    }

    fun kind(url: String): String? {
        val path = runCatching { URI(url).path }.getOrNull().orEmpty()
        val segment = taxonomyPath.find(path)?.groupValues?.get(1)?.lowercase() ?: return null
        return if (segment == "t" || segment.startsWith("tag")) "tag" else "category"
    }

    fun links(page: Document, terms: Set<String>, expandGenre: Boolean = false): List<Section> {
        val base = URI(page.baseUri())
        val host = base.host.orEmpty().removePrefix("www.")
        return page.select("a[href]").mapNotNull { link ->
            val name = link.text().ifBlank { link.attr("title") }
            val url = absolute(page.baseUri(), link.attr("href")) ?: return@mapNotNull null
            val uri = URI(url)
            if (uri.host.orEmpty().removePrefix("www.") != host) return@mapNotNull null
            val path = uri.path.orEmpty()
            val taxonomy = taxonomyPath.find(path)
            val bare = path.trim('/').takeIf { '/' !in it }
            val slug = taxonomy?.groupValues?.get(2) ?: bare
            val genrePath = expandGenre && slug != null && Translation.searchAliases(slug).any(terms::contains)
            if (taxonomy == null && !genrePath) return@mapNotNull null
            if (!genrePath && !matches(name, terms, expandGenre) && !matches(link.attr("title"), terms, expandGenre)) return@mapNotNull null
            Section(name, url)
        }
    }

    fun directories(page: Document, includeCategories: Boolean): List<String> {
        val host = URI(page.baseUri()).host.orEmpty().removePrefix("www.")
        val names = if (includeCategories) setOf("tags", "categories") else setOf("tags")
        return page.select("a[href]").mapNotNull { link ->
            val url = absolute(page.baseUri(), link.attr("href")) ?: return@mapNotNull null
            val uri = URI(url)
            url.takeIf {
                uri.host.orEmpty().removePrefix("www.") == host &&
                    uri.path.orEmpty().trim('/').lowercase() in names
            }
        }.distinctBy { URI(it).path.trim('/').lowercase() }
    }
}
