package com.cloudextensions.russian

import java.net.URI
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import java.util.LinkedHashMap

interface SearchPolicy {
    val translateQueries:Boolean get()=true
    suspend fun fullTitle(url:String):String? = null
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
)
data class VideoCard(val title: String, val url: String, val poster: String?, val duration: String = "", val tags: List<String> = emptyList())
data class VideoDetail(val title: String, val poster: String?, val description: String, val tags: List<String>, val duration: String, val year: Int?)
data class PageRequest(val url: String, val data: Map<String, String>? = null, val allowNotFound: Boolean = false, val headers: Map<String,String> = emptyMap())

internal class BoundedMap<K,V>(private val capacity: Int): LinkedHashMap<K,V>(16, .75f, true) {
    override fun removeEldestEntry(eldest: MutableMap.MutableEntry<K,V>?) = size > capacity
}
/** Encode raw site links once; preserve existing percent escapes and query separators. */
object WebUrls {
    fun normalize(url:String):String=url.toHttpUrlOrNull()?.toString() ?: throw IllegalArgumentException("Invalid HTTP URL")
    fun resolve(base:String,raw:String):String?=base.toHttpUrlOrNull()?.resolve(raw)?.toString()
}
internal fun webUri(url:String):java.net.URI=java.net.URI(WebUrls.normalize(url))
internal fun absolute(base:String,value:String?):String? {
    val raw=value.orEmpty().trim()
    if(raw.isBlank()||raw.startsWith("data:")||raw.startsWith("javascript:")||raw=="#")return null
    return try{WebUrls.resolve(base,raw)}catch(_:Exception){null}
}
internal fun videoKey(url: String): String = try {
    val u = webUri(url)
    val path = u.rawPath.orEmpty().trimEnd('/')
    // Every migrated provider uses a path ID. Strip only tracking parameters; retain meaningful query IDs.
    val query = u.rawQuery.orEmpty().split('&').filter { it.isNotBlank() && it.substringBefore('=') !in setOf("Li", "Lii", "Lt", "Sn", "utm_source", "utm_medium", "utm_campaign") }.joinToString("&")
    "${u.host.orEmpty().removePrefix("www.")}$path" + if (query.isEmpty()) "" else "?$query"
} catch (_: Exception) { url.substringBefore('#') }
