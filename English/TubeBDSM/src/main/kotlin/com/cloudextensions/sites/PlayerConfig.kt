package com.cloudextensions.sites

import com.cloudextensions.russian.Network
import com.cloudextensions.russian.EPornerPlayer
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RequestLimits
import com.lagradost.cloudstream3.app
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.json.JSONObject
import org.jsoup.nodes.Document

/** These HTML players fetch the current video's files from a same-origin JSON endpoint. */
internal object PlayerConfig {
    private val videoPath = Regex("""^/video/(\d+)(?:/|$)""")
    private val settings = Regex("""\bconfigData\s*:\s*\{([^{}]+)\}""")
    private val field = Regex("""\b(vid|aid|domain_id|embed|ref|check_speed)\s*:\s*(\d+|null)(?=\s*(?:,|$))""")
    private val qualityTitles = Regex("""\bquality_titles\s*:\s*\{([^{}]+)\}""")
    private val quality = Regex("""['"]?(lq|hq)['"]?\s*:\s*['"](\d{3,4}p)['"]""")
    private val hex = Regex("[a-fA-F0-9]+")
    private val digits = Regex("[0-9]+")

    private data class Config(val url: HttpUrl, val labels: Map<String, String> = emptyMap())

    private fun desktopDrTuber(page: Document, address: HttpUrl): Config? {
        val videoId = videoPath.find(address.encodedPath)?.groupValues?.get(1) ?: return null
        for (script in page.select("script")) {
            val js = script.data()
            if (!js.contains("htmlVideoPlayer(") || !js.contains("'/player_config_json/'")) continue
            val data = settings.find(js)?.groupValues?.get(1) ?: continue
            val params = field.findAll(data).associate { it.groupValues[1] to it.groupValues[2] }
            if (params["vid"] != videoId || params.size != 6) continue
            val url = address.newBuilder().encodedPath("/player_config_json/").query(null).fragment(null).apply {
                params.forEach { (key, value) -> addQueryParameter(key, value) }
            }.build()
            val labels = qualityTitles.find(js)?.groupValues?.get(1)?.let { values ->
                quality.findAll(values).associate { it.groupValues[1] to it.groupValues[2] }
            }.orEmpty()
            return Config(url, labels)
        }
        return null
    }

    private fun mobilePlayer(page: Document, address: HttpUrl): Config? {
        val videoId = videoPath.find(address.encodedPath)?.groupValues?.get(1) ?: return null
        val element = page.selectFirst("#video_area video[data-video_id]") ?: return null
        val hash = element.attr("data-video_hash")
        val time = element.attr("data-hash_time")
        if (element.attr("data-video_id") != videoId || !hex.matches(hash) || !digits.matches(time)) return null
        val url = address.newBuilder().encodedPath("/player_config").query(null).fragment(null)
            .addQueryParameter("video_hash", hash)
            .addQueryParameter("hash_time", time)
            .addQueryParameter("video_id", videoId)
            .build()
        return Config(url)
    }

    private fun files(config: Config, data: JSONObject): List<Playback.Source> {
        val files = data.optJSONObject("files") ?: return emptyList()
        return listOf("lq", "hq").mapNotNull { key ->
            val raw = files.optString(key).trim()
            if (raw.isEmpty() || raw == "null") return@mapNotNull null
            val url = config.url.resolve(raw) ?: return@mapNotNull null
            if (!url.encodedPath.endsWith(".mp4", true) && !url.encodedPath.endsWith(".m3u8", true)) return@mapNotNull null
            Playback.Source(url.toString(), config.labels[key])
        }
    }

    suspend fun sources(page: Document): List<Playback.Source> {
        val address = page.baseUri().toHttpUrlOrNull() ?: return emptyList()
        return when (address.host) {
            "drtuber.com", "www.drtuber.com" -> request(desktopDrTuber(page, address), page.baseUri())
            "m.drtuber.com", "viptube.com", "www.viptube.com", "m.viptube.com" -> mobileSources(page, address)
            "eporner.com", "www.eporner.com" -> EPornerPlayer.sources(page)
            else -> emptyList()
        }
    }

    fun requiresPaidAccess(page: Document): Boolean {
        val host = page.baseUri().toHttpUrlOrNull()?.host?.removePrefix("www.")
        if (host != "faphouse.com") return false
        val current = page.selectFirst("script#view-state-data[type=application/json]")?.data() ?: return false
        val video = try { JSONObject(current).optJSONObject("video") } catch (_: org.json.JSONException) { null }
        return video?.opt("videoViewAllowed") == false &&
            video.optString("videoAccessType") in setOf("premium", "paid")
    }

    private suspend fun mobileSources(page: Document, address: HttpUrl): List<Playback.Source> {
        val config = mobilePlayer(page, address) ?: return emptyList()
        val found = request(config, page.baseUri())
        if (found.isNotEmpty()) return found
        // A cached page can carry an expired hash. Refresh once with the player's current data.
        val refreshed = RequestLimits.optional(4500) {
            Network.page(PageRequest(page.baseUri(), headers = mapOf("Cache-Control" to "no-cache")), page.baseUri())
        } ?: return emptyList()
        val updated = mobilePlayer(refreshed, address)
        return if (updated == config) emptyList() else request(updated, refreshed.baseUri())
    }

    private suspend fun request(config: Config?, referrer: String): List<Playback.Source> {
        if (config == null) return emptyList()
        return RequestLimits.optional(5000) {
            app.get(config.url.toString(), headers = Network.headers(referrer) + mapOf(
                "Accept" to "application/json, text/javascript, */*; q=0.01",
                "Content-Type" to "application/x-www-form-urlencoded; charset=utf-8",
                "X-Requested-With" to "XMLHttpRequest",
            )).okhttpResponse.use { response ->
                if (!response.isSuccessful) return@use emptyList()
                val text = response.body?.string() ?: return@use emptyList()
                files(config, JSONObject(text))
            }
        }.orEmpty()
    }
}
