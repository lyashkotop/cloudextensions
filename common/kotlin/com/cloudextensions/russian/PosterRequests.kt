package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import kotlinx.coroutines.suspendCancellableCoroutine
import okhttp3.Call
import okhttp3.Callback
import okhttp3.Request
import okhttp3.Response
import java.io.IOException
import kotlin.coroutines.resume
import java.util.Collections
import java.util.concurrent.TimeUnit

interface PosterSource {
    val posterTimeoutMs: Long get() = 3500
    suspend fun resolvePoster(url: String, poster: String?, headers: Map<String, String>): String?
}

internal object PosterRequests {
    private data class ImageCheck(val url: String, val headers: Map<String, String>)
    private val working = Collections.synchronizedMap(BoundedMap<ImageCheck, Long>(512))

    suspend fun available(url: String, headers: Map<String, String>, timeoutMs: Long): Boolean =
        check(url, headers, timeoutMs) == true

    /** A timeout or a temporary CDN failure leaves the image's availability unknown. */
    suspend fun check(url: String, headers: Map<String, String>, timeoutMs: Long): Boolean? {
        val key = ImageCheck(url, headers)
        if (working[key]?.let { System.nanoTime() - it < TimeUnit.MINUTES.toNanos(2) } == true) return true
        val result = RequestLimits.optional(timeoutMs) {
            suspendCancellableCoroutine<Boolean?> { continuation ->
                val request = Request.Builder().url(url)
                headers.forEach { (name, value) -> request.header(name, value) }
                val call = app.baseClient.newCall(request.build())
                continuation.invokeOnCancellation { call.cancel() }
                call.enqueue(object : Callback {
                    override fun onFailure(call: Call, e: IOException) = continuation.resume(null)

                    override fun onResponse(call: Call, response: Response) {
                        val image = response.use {
                            when {
                                it.isSuccessful -> it.header("Content-Type").orEmpty().startsWith("image/", ignoreCase = true)
                                it.code == 408 || it.code == 429 || it.code >= 500 -> null
                                else -> false
                            }
                        }
                        continuation.resume(image)
                    }
                })
            }
        }
        if (result == true) working[key] = System.nanoTime()
        return result
    }
}
