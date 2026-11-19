package com.cloudextensions.russian

import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.getQualityFromName
import com.lagradost.cloudstream3.utils.newExtractorLink
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.nodes.Document

/** Both catalogues publish the same player configuration and require the same player identity. */
object NoodlePlayback {
    const val USER_AGENT = "stagefright/1.2 (Linux;Android 13)"
    private val assignment = Regex("""\bwindow\.playlist\s*=\s*""")

    internal fun playlists(page: Document): List<JSONObject> = page.select("script").mapNotNull { script ->
        val text = script.data()
        val start = assignment.find(text) ?: return@mapNotNull null
        try {
            JSONTokener(text.substring(start.range.last + 1)).nextValue() as? JSONObject
        } catch (_: org.json.JSONException) {
            null
        }
    }

    suspend fun links(
        name: String, page: Document, pageUrl: String, referer: String, callback: (ExtractorLink) -> Unit,
    ): Boolean = coroutineScope {
        val base = page.baseUri().ifBlank { pageUrl }
        val sources = playlists(page).flatMap { playlist ->
            val items = playlist.optJSONArray("sources") ?: return@flatMap emptyList()
            (0 until items.length()).mapNotNull { index ->
                val item = items.optJSONObject(index) ?: return@mapNotNull null
                val url = absolute(base, item.optString("file")) ?: return@mapNotNull null
                Playback.Source(url, item.optString("label"))
            }
        }.filter { QualityLinks.allowed(getQualityFromName(it.label)) }.distinctBy { it.url }
        val headers = mapOf("User-Agent" to USER_AGENT)
        val permits = Semaphore(4)
        val checked = sources.map { source ->
            async { source to permits.withPermit { MediaRequests.probe(source.url, referer, headers) } }
        }.awaitAll()
        val available = checked.filter { (_, response) -> response != null && response.status in 200..299 }
        val selected = available + checked.filter { (_, response) -> response == null }
        if (selected.isEmpty()) {
            checked.firstNotNullOfOrNull { it.second?.status }?.let { throw Playback.mediaError(it) }
            throw ErrorLoadingException("В плейлисте нет источников видео")
        }
        for ((source, response) in selected) {
            callback(newExtractorLink(name, name, source.url, Playback.streamType(response?.url ?: source.url, response?.mime)) {
                this.referer = referer
                this.headers = headers
                quality = getQualityFromName(source.label)
            })
        }
        true
    }
}
