package com.cloudextensions.russian

import java.net.URI
import java.util.LinkedHashMap

/** Only application code is packaged; CloudStream, Kotlin and HTTP libraries come from the host. */
data class Section(val name: String, val path: String)
data class SiteSpec(
    val id: String, val title: String, val origin: String,
    val cards: String, val link: String, val titleSelector: String,
    val sections: List<Section>, val searchMode: String = "get",
    val tagSelector: String = "", val descriptionSelector: String = "",
    val related: String = "#related-videos, #relateddiv, .related-videos, .related, .related-videos-holder, #list_videos_related_videos",
)
data class VideoCard(val title: String, val url: String, val poster: String?, val duration: String = "", val tags: List<String> = emptyList())
data class VideoDetail(val title: String, val poster: String?, val description: String, val tags: List<String>, val duration: String, val year: Int?)
data class PageRequest(val url: String, val data: Map<String, String>? = null, val allowNotFound: Boolean = false, val headers: Map<String,String> = emptyMap())

internal class BoundedMap<K,V>(private val capacity: Int): LinkedHashMap<K,V>(16, .75f, true) {
    override fun removeEldestEntry(eldest: MutableMap.MutableEntry<K,V>?) = size > capacity
}
internal fun absolute(base: String, value: String?): String? = try {
    val raw = value.orEmpty().trim()
    if (raw.isEmpty() || raw.startsWith("data:") || raw.startsWith("javascript:") || raw == "#") null
    else URI(base).resolve(raw).normalize().toString().takeIf { it.startsWith("http://") || it.startsWith("https://") }
} catch (_: Exception) { null }
internal fun videoKey(url: String): String = try {
    val u = URI(url)
    val path = u.rawPath.orEmpty().trimEnd('/')
    // Every migrated provider uses a path ID. Strip only tracking parameters; retain meaningful query IDs.
    val query = u.rawQuery.orEmpty().split('&').filter { it.isNotBlank() && it.substringBefore('=') !in setOf("Li", "Lii", "Lt", "Sn", "utm_source", "utm_medium", "utm_campaign") }.joinToString("&")
    "${u.host.orEmpty().removePrefix("www.")}$path" + if (query.isEmpty()) "" else "?$query"
} catch (_: Exception) { url.substringBefore('#') }
