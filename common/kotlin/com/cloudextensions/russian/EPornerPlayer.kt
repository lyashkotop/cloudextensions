package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okhttp3.Request
import org.json.JSONObject
import org.jsoup.nodes.Document

/** Shared access to the public player used by EPorner and links to it in TubeBDSM. */
object EPornerPlayer {
    private val videoPath = Regex("""^/(?:video-|embed[-/]|hd-porn/)([A-Za-z0-9]+)(?:/|$)""")
    private val hash = Regex("""EP\.video\.player\.hash\s*=\s*['"]([a-fA-F0-9]{32})['"]""")
    private val videoId = Regex("""EP\.video\.player\.vid\s*=\s*['"]([A-Za-z0-9]+)['"]""")
    private val height = Regex("""^(\d{3,4})p\b""")

    private fun playerHash(page: Document, id: String): String? {
        for (script in page.select("script")) {
            val data = script.data()
            val declaredId = videoId.find(data)?.groupValues?.get(1)
            if (declaredId != null && declaredId != id) continue
            val raw = hash.find(data)?.groupValues?.get(1) ?: continue
            return raw.chunked(8).joinToString("") { it.toLong(16).toString(36) }
        }
        return null
    }

    suspend fun sources(page: Document): List<Playback.Source> {
        val address = page.baseUri().toHttpUrlOrNull() ?: return emptyList()
        if (address.host !in setOf("eporner.com", "www.eporner.com")) return emptyList()
        val id = videoPath.find(address.encodedPath)?.groupValues?.get(1) ?: return emptyList()
        val embed = address.newBuilder().encodedPath("/embed/$id/").query(null).fragment(null).build()
        val embedPage = if (address.encodedPath == embed.encodedPath) page else {
            RequestLimits.optional(4500) { Network.page(PageRequest(embed.toString()), address.toString()) }
        } ?: return emptyList()
        val token = playerHash(embedPage, id) ?: return emptyList()
        val endpoint = embed.newBuilder().encodedPath("/xhr/video/$id")
            .addQueryParameter("hash", token)
            .addQueryParameter("domain", "www.eporner.com")
            .addQueryParameter("pixelRatio", "1")
            .addQueryParameter("playerWidth", "0")
            .addQueryParameter("playerHeight", "0")
            .addQueryParameter("fallback", "false")
            .addQueryParameter("embed", "true")
            .addQueryParameter("supportedFormats", "hls,dash,h265,vp9,av1,mp4")
            .addQueryParameter("_", System.currentTimeMillis().toString())
            .build()
        return RequestLimits.optional(4500) {
            val request = Request.Builder().url(endpoint).header("Referer", embed.toString())
                .header("X-Requested-With", "XMLHttpRequest").header("Accept", "application/json").build()
            Network.read(request, app.baseClient) { response ->
                if (!response.isSuccessful) return@read emptyList()
                val raw = response.body?.string() ?: return@read emptyList()
                val payload = JSONObject(raw)
                if (payload.optString("vid") != id || !payload.optBoolean("available")) return@read emptyList()
                readSources(endpoint, payload.optJSONObject("sources"))
            }
        }.orEmpty()
    }

    private fun readSources(base: HttpUrl, sources: JSONObject?): List<Playback.Source> {
        val mp4 = sources?.optJSONObject("mp4")
        val variants = mp4?.keys()?.asSequence()?.mapNotNull { key ->
            val entry = mp4.optJSONObject(key) ?: return@mapNotNull null
            val quality = height.find(entry.optString("labelShort"))?.groupValues?.get(1)?.toIntOrNull()
                ?: return@mapNotNull null
            if (!QualityLinks.allowed(quality)) return@mapNotNull null
            val url = base.resolve(entry.optString("src").takeIf(String::isNotBlank) ?: return@mapNotNull null)
                ?: return@mapNotNull null
            if (url.encodedPath.startsWith("/dload/")) return@mapNotNull null
            quality to Playback.Source(url.toString(), "${quality}p")
        }?.sortedByDescending { it.first }?.map { it.second }?.toList().orEmpty()
        val auto = sources?.optJSONObject("hls")?.optJSONObject("auto")
        val hls = sequenceOf(auto?.optString("srcFallback"), auto?.optString("src"))
            .filterNotNull().filter(String::isNotBlank).mapNotNull(base::resolve)
            .map { Playback.Source(it.toString()) }.take(1).toList()
        return (variants + hls).distinctBy { it.url }
    }
}
