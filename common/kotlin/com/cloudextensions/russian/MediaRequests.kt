package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import java.util.concurrent.TimeUnit
import okhttp3.Request
import okhttp3.Response

/** A small, cancellable request checks the actual response without downloading a media file. */
internal object MediaRequests {
    data class Result(val status: Int, val url: String, val mime: String?)

    suspend fun probe(url: String, referer: String, headers: Map<String, String>): Result? =
        RequestLimits.optional(3500) {
            val client = app.baseClient.newBuilder().callTimeout(3, TimeUnit.SECONDS).build()
            val request = Request.Builder().url(url).header("Referer", referer)
            headers.forEach { (key, value) -> request.header(key, value) }
            val result = Network.read(request.header("Range", "bytes=0-31").build(), client, ::result)
            // A server can support normal media requests while rejecting byte ranges.
            if (result.status == 416) {
                Network.read(request.removeHeader("Range").build(), client, ::result)
            } else result
        }

    private fun result(response: Response): Result {
        val url = response.request.url.toString()
        val mime = response.header("Content-Type")?.substringBefore(';')?.trim()?.lowercase()
        if (!response.isSuccessful) return Result(response.code, url, mime)
        if (mime == "text/html" || mime == "application/json" || mime?.startsWith("image/") == true) {
            return Result(415, url, mime)
        }
        if (mime?.startsWith("video/") == true || mime?.startsWith("audio/") == true ||
            mime?.contains("mpegurl") == true || mime == "application/dash+xml") {
            return Result(response.code, url, mime)
        }
        val body = response.body?.source() ?: return Result(415, url, mime)
        body.request(32)
        val prefix = body.buffer.readByteString(minOf(32L, body.buffer.size))
        val text = prefix.utf8().trimStart()
        val hex = prefix.hex()
        val format = when {
            text.startsWith("#EXTM3U") -> "application/vnd.apple.mpegurl"
            text.startsWith("<MPD") || text.startsWith("<?xml") && url.substringBefore('?').endsWith(".mpd") ->
                "application/dash+xml"
            hex.drop(8).startsWith("66747970") || hex.startsWith("1a45dfa3") ||
                hex.startsWith("464c56") || hex.startsWith("000001ba") ||
                hex.startsWith("47") && hex.length >= 32 -> "video/unknown"
            else -> return Result(415, url, mime)
        }
        return Result(response.code, url, format)
    }
}
