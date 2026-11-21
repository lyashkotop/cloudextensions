package com.cloudextensions.russian

import java.net.URI
import java.util.LinkedHashMap

interface SearchPolicy {
    val translateQueries:Boolean get()=true
    val includeTaxonomyResults: Boolean get() = true
    val minInitialSearchResults: Int get() = 1
    suspend fun fullTitle(url:String):String? = null
}

internal interface SearchMetadataSource {
    suspend fun searchMetadata(url: String): VideoDetail
}

interface DetailTagSource {
    suspend fun missingTags(url: String): List<String>
}

/** Only application code is packaged; CloudStream, Kotlin and HTTP libraries come from the host. */
data class Section(val name: String, val path: String)
data class SiteSpec(
    val id: String, val title: String, val origin: String,
    val cards: String, val link: String, val titleSelector: String,
    val sections: List<Section>, val searchMode: String = "get",
    val tagSelector: String = "", val descriptionSelector: String = "",
    val related: String = "#related-videos, #relateddiv, .related-videos, .related, .related-videos-holder, #list_videos_related_videos",
    val detailTitleSelector: String = "", val durationSelector: String = "",
    val titleLanguage:String="",
    val searchContainer: String = "",
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
    else (URI(raw).takeIf { it.isAbsolute } ?: URI(base).resolve(raw)).normalize().toString().takeIf { it.startsWith("http://") || it.startsWith("https://") }
} catch (_: Exception) { null }
internal fun videoKey(url: String): String = try {
    val u = URI(url)
    val path = u.rawPath.orEmpty().trimEnd('/')
    val host = u.host.orEmpty().removePrefix("www.")
    val hcVideo = path.takeIf { host == "hcbdsm.com" && it.startsWith("/video/") }
        ?.removePrefix("/video/")?.substringBefore('/')?.takeIf { it.isNotEmpty() && it.all { char -> char in '0'..'9' } }
    val outboundTubeBDSM = host == "tubebdsm.com" && path.startsWith("/out/")
    // Every migrated provider uses a path ID. Strip only tracking parameters; retain meaningful query IDs.
    val tracking = setOf("Li", "Lii", "Lt", "Sn", "utm_source", "utm_medium", "utm_campaign")
    val query = u.rawQuery.orEmpty().split('&').filter { param ->
        val key = param.substringBefore('=')
        param.isNotBlank() && key !in tracking && !(outboundTubeBDSM && key in setOf("l", "c"))
    }.joinToString("&")
    if (hcVideo != null) "$host/video/$hcVideo"
    else "$host$path" + if (query.isEmpty()) "" else "?$query"
} catch (_: Exception) { url.substringBefore('#') }
