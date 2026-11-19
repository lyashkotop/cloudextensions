package com.cloudextensions.sites

import java.text.Normalizer
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element

private val minorReference = Regex(
    """(?iu)未成年|未满18|未滿18|児童|兒童|幼女|小学生|小學生|中学生|中學生|高校生|國中生|国中生|高中生|少女|(?<!\p{L})(?:underage|preteen|middle school|high school)(?!\p{L})|(?<!\d)(?:[1-9]|1[0-7])\s*[- ]?\s*(?:歳|才|歲|岁|years?[- ]old|y\s*/?\s*o\b)""",
)
internal const val RO85_CARDS = "[id^=list_videos_][id$=_items] .item > a[href*=/v/]:has(img)"
internal const val RO85_TAGS = ".tags-video a.tags-link[href*=/tags/]"

internal fun ro85Excluded(text: String): Boolean =
    minorReference.containsMatchIn(Normalizer.normalize(text, Normalizer.Form.NFKC))

internal fun ro85Catalogue(page: Document): Document {
    fun excluded(card: Element) = sequenceOf(card.attr("title"), card.text(), card.selectFirst("img")?.attr("alt").orEmpty())
        .any(::ro85Excluded)
    if (page.select(RO85_CARDS).none(::excluded)) return page
    return page.clone().apply {
        select(RO85_CARDS).filter(::excluded).forEach { it.parent()?.remove() }
    }
}

internal fun ro85Tags(page: Document): List<String> =
    page.select(RO85_TAGS).eachText().map(String::trim).filter(String::isNotBlank).distinct()
