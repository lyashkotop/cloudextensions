package com.cloudextensions.russian

import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.getQualityFromName
import com.lagradost.cloudstream3.utils.newExtractorLink
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

/** Replays the sources published by the shared DarknessPorn and PunishWorld player. */
object NosoFilesPlayback {
    private val refresh = mapOf("Cache-Control" to "no-cache")

    private fun HttpUrl.root() = newBuilder().encodedPath("/").query(null).fragment(null).build().toString()

    private fun sources(page: Document): List<Playback.Source> {
        val player = page.selectFirst("video#video-placeholder") ?: return emptyList()
        val entries = player.select("source[src], source[data-src]") + player
        val sources = entries.mapNotNull { element ->
            val raw = element.attr("src").ifBlank { element.attr("data-src") }
            val url = absolute(page.baseUri(), raw) ?: return@mapNotNull null
            val label = element.attr("label").ifBlank { element.attr("title") }
            Playback.Source(url, label)
        }
        val alternate = absolute(page.baseUri(), Metadata.ownVideo(page)?.optString("contentUrl"))
        return (sources + listOfNotNull(alternate?.let { Playback.Source(it) })).distinctBy { it.url }
    }

    suspend fun links(
        name: String, origin: String, url: String, subtitles: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val page = Network.page(PageRequest(url), origin)
        if (sources(page).isEmpty()) return Playback.linksFromPage(name, origin, url, page, emptyList(), subtitles, callback)
        val attempted = mutableSetOf<String>()
        val errors = mutableListOf<Int>()
        val pending = mutableListOf<ExtractorLink>()

        suspend fun publish(document: Document): Boolean = coroutineScope {
            val root = document.baseUri().toHttpUrlOrNull()?.root() ?: return@coroutineScope false
            val checks = sources(document).asSequence().filter { attempted.add(it.url) }.take(4).map { source ->
                async {
                    val referer = if (source.url.toHttpUrlOrNull()?.root() == root) document.baseUri() else root
                    val headers = Network.headers(referer) + ("Origin" to root.removeSuffix("/"))
                    val result = MediaRequests.probe(source.url, referer, headers)
                    val link = newExtractorLink(name, listOfNotNull(name, source.label).joinToString(" "),
                        source.url, Playback.streamType(result?.url ?: source.url, result?.mime)) {
                        this.referer = referer
                        this.headers = headers
                        quality = getQualityFromName(source.label)
                    }
                    link to result?.status
                }
            }.toList().awaitAll()
            for ((link, status) in checks) {
                when (status) {
                    null -> pending += link
                    in 200..299 -> callback(link)
                    else -> errors += status
                }
            }
            checks.any { (_, status) -> status != null && status in 200..299 }
        }

        if (publish(page)) return true
        val base = page.baseUri().toHttpUrlOrNull()
        val embed = absolute(page.baseUri(), Metadata.ownVideo(page)?.optString("embedUrl"))?.toHttpUrlOrNull()
        if (embed != null && embed.root() == base?.root() && embed.encodedPath.startsWith("/embed/")) {
            val player = RequestLimits.optional(5000) {
                Network.page(PageRequest(embed.toString(), headers = refresh), page.baseUri())
            }
            if (player != null && publish(player)) return true
        }
        if (errors.any { it in setOf(401, 403, 404, 410) }) {
            val current = RequestLimits.optional(5000) {
                Network.page(PageRequest(url, headers = refresh), origin)
            }
            if (current != null && publish(current)) return true
        }
        if (pending.isNotEmpty()) {
            pending.forEach(callback)
            return true
        }
        errors.firstOrNull { it == 403 || it == 401 }?.let { throw Playback.mediaError(it) }
        errors.firstOrNull()?.let { throw Playback.mediaError(it) }
        throw ErrorLoadingException("Сервер видео не ответил")
    }
}
