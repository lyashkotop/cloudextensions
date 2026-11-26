package com.cloudextensions.russian

import android.content.Context
import android.util.Log
import com.lagradost.cloudstream3.SearchResponse
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import kotlinx.coroutines.withTimeoutOrNull

/** Warms the host's Coil cache for the rows most likely to be shown first. */
object ImagePrefetch {
    @Volatile private var context: Context? = null
    @Volatile private var warned = false
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val priorityPermits = Semaphore(3)
    private val backgroundPermits = Semaphore(3)
    private val pendingPriority = Semaphore(12)
    private val pendingBackground = Semaphore(12)
    private data class Poster(val url: String, val headers: Map<String, String>)

    private val scheduled = BoundedMap<Poster, Long>(256)
    private val coil by lazy {
        val singleton = try { coilClass("coil3.SingletonImageLoader") } catch (_: ClassNotFoundException) { null }
        if (singleton == null) CoilAccess("coil", coilClass("coil.Coil"), "imageLoader")
        else CoilAccess("coil3", singleton, "get")
    }

    fun configure(value: Context) {
        context = value.applicationContext
    }

    fun cacheDirectory() = context?.cacheDir

    fun warm(cards: List<SearchResponse>, priority: Boolean = false) {
        val ctx = context ?: return
        cards.asSequence().mapNotNull { card ->
            card.posterUrl?.takeIf(String::isNotBlank)?.let { Poster(it, card.posterHeaders.orEmpty().toMap()) }
        }.distinct().take(if (priority) 3 else 9).forEach { warm(ctx, it, priority) }
    }

    fun warm(url: String?, headers: Map<String, String>) {
        val ctx = context ?: return
        if (!url.isNullOrBlank()) warm(ctx, Poster(url, headers.toMap()), priority = true)
    }

    private fun warm(ctx: Context, poster: Poster, priority: Boolean) {
        val queue = if (priority) pendingPriority else pendingBackground
        val workers = if (priority) priorityPermits else backgroundPermits
        val started = System.nanoTime()
        synchronized(scheduled) {
            if (scheduled[poster]?.let { started - it < 300_000_000_000L } == true) return
            if (!queue.tryAcquire()) return
            scheduled[poster] = started
        }
        scope.launch {
            try {
                val loaded = withTimeoutOrNull(5000) {
                    workers.withPermit {
                        val request = coil.enqueue(ctx, poster)
                        try {
                            val result = request.await()
                            result != null && result.javaClass.simpleName != "ErrorResult"
                        } finally {
                            if (!request.isCompleted) request.cancel()
                        }
                    }
                }
                if (loaded != true) forget(poster, started)
            } catch (e: CancellationException) {
                forget(poster, started)
                throw e
            } catch (e: Exception) {
                forget(poster, started)
                warn(e.javaClass.simpleName)
            } catch (e: LinkageError) {
                forget(poster, started)
                warn(e.javaClass.simpleName)
            } finally {
                queue.release()
            }
        }
    }

    private fun forget(poster: Poster, started: Long) = synchronized(scheduled) {
        if (scheduled[poster] == started) scheduled.remove(poster)
    }

    private fun warn(reason: String) {
        if (warned) return
        warned = true
        Log.w("CloudExtensions", "Coil preloading unavailable: $reason")
    }

    private fun coilClass(name: String): Class<*> = Class.forName(name, true, ImagePrefetch::class.java.classLoader)

    private class CoilAccess(prefix: String, singleton: Class<*>, getter: String) {
        private val imageRequest = coilClass("$prefix.request.ImageRequest")
        private val builder = coilClass("$prefix.request.ImageRequest\$Builder")
        private val newBuilder = builder.getConstructor(Context::class.java)
        private val loader = singleton.getMethod(getter, Context::class.java)
        private val data = builder.getMethod("data", Any::class.java)
        private val size = builder.getMethod("size", Int::class.javaPrimitiveType, Int::class.javaPrimitiveType)
        private val build = builder.getMethod("build")
        private val enqueue = coilClass("$prefix.ImageLoader").getMethod("enqueue", imageRequest)
        private val job = coilClass("$prefix.request.Disposable").getMethod("getJob")
        private val headerType = if (prefix == "coil3") coilClass("coil3.network.NetworkHeaders") else null
        private val headerBuilder = if (headerType != null) coilClass("coil3.network.NetworkHeaders\$Builder") else null
        private val newHeaders = headerBuilder?.getConstructor()
        private val setHeader = headerBuilder?.getMethod("set", String::class.java, String::class.java)
        private val buildHeaders = headerBuilder?.getMethod("build")
        private val applyHeaders = if (headerType == null) builder.getMethod("headers", okhttp3.Headers::class.java)
            else coilClass("coil3.network.ImageRequestsKt").getMethod("httpHeaders", builder, headerType)

        fun enqueue(context: Context, poster: Poster): Deferred<*> {
            val request = newBuilder.newInstance(context)
            data.invoke(request, poster.url)
            size.invoke(request, 480, 320)
            if (newHeaders == null) {
                val headers = okhttp3.Headers.Builder()
                poster.headers.forEach { (name, value) -> headers.set(name, value) }
                applyHeaders.invoke(request, headers.build())
            } else {
                val headers = newHeaders.newInstance()
                poster.headers.forEach { (name, value) -> setHeader!!.invoke(headers, name, value) }
                applyHeaders.invoke(null, request, buildHeaders!!.invoke(headers))
            }
            val disposable = enqueue.invoke(loader.invoke(null, context), build.invoke(request))
            return job.invoke(disposable) as Deferred<*>
        }
    }
}
