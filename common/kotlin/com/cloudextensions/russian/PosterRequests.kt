package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import okhttp3.Request
import okhttp3.Response
import java.util.Collections
import java.util.concurrent.TimeUnit

interface PosterSource {
    val posterTimeoutMs: Long get() = 3500
    val reuseConfirmedPosters: Boolean get() = false
    suspend fun resolvePoster(url: String, poster: String?, headers: Map<String, String>): String?
    suspend fun resolveHomePoster(url: String, poster: String?, headers: Map<String, String>): String? =
        resolvePoster(url, poster, headers)
}

internal object PosterRequests {
    private data class ImageCheck(val url: String, val headers: Map<String, String>)
    private data class Checked(val available: Boolean, val expires: Long)
    private val checked = Collections.synchronizedMap(BoundedMap<ImageCheck, Checked>(512))

    suspend fun available(url: String, headers: Map<String, String>, timeoutMs: Long): Boolean =
        check(url, headers, timeoutMs) == true

    fun confirmed(url: String, headers: Map<String, String>): Boolean =
        cached(ImageCheck(url, headers)) == true

    private fun cached(key: ImageCheck): Boolean? =
        checked[key]?.takeIf { System.nanoTime() < it.expires }?.available

    /** A timeout or a temporary CDN failure leaves the image's availability unknown. */
    suspend fun check(url: String, headers: Map<String, String>, timeoutMs: Long): Boolean? {
        val key = ImageCheck(url, headers.toMap())
        cached(key)?.let { return it }
        return RequestLimits.optional(timeoutMs) {
            val request = Request.Builder().url(url)
            key.headers.forEach { (name, value) -> request.header(name, value) }
            request.header("Range", "bytes=0-15")
            val client = app.baseClient
            fun inspect(response: Response): Boolean? {
                val available = when {
                    response.isSuccessful -> isImage(response)
                    response.code == 408 || response.code == 416 || response.code == 429 || response.code >= 500 -> null
                    else -> false
                }
                if (available != null && (response.isSuccessful || response.code in listOf(404, 410))) {
                    val ttl = TimeUnit.SECONDS.toNanos(if (available) 120 else 30)
                    checked[key] = Checked(available, System.nanoTime() + ttl)
                }
                return available
            }
            val (code, available) = Network.read(request.build(), client) { it.code to inspect(it) }
            if (code == 416) {
                Network.read(request.removeHeader("Range").build(), client, ::inspect)
            } else {
                available
            }
        }
    }

    private fun isImage(response: Response): Boolean {
        val mime = response.header("Content-Type").orEmpty()
        if (mime.startsWith("image/", ignoreCase = true)) return true
        if (mime.isNotBlank() && !mime.startsWith("application/octet-stream", true)) return false
        val source = response.body?.source() ?: return false
        source.request(16)
        val prefix = source.buffer.readByteString(minOf(16L, source.buffer.size))
        val hex = prefix.hex()
        val text = prefix.utf8()
        return hex.startsWith("ffd8ff") || hex.startsWith("89504e470d0a1a0a") || text.startsWith("GIF8") ||
            (text.startsWith("RIFF") && text.drop(8).startsWith("WEBP")) || hex.drop(8).startsWith("66747970617669")
    }
}
