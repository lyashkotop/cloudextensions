package com.cloudextensions.russian

import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.app
import java.io.IOException
import java.util.Collections
import java.util.concurrent.TimeUnit
import java.util.concurrent.ConcurrentHashMap
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.sync.withPermit
import okhttp3.Call
import okhttp3.Callback
import okhttp3.FormBody
import okhttp3.Request
import okhttp3.Response
import org.jsoup.Jsoup
import org.jsoup.nodes.Document

internal object Network {
    private val cache = Collections.synchronizedMap(BoundedMap<PageRequest,Pair<Long,Document>>(24))
    private val locks = ConcurrentHashMap<PageRequest,Mutex>()
    private val permits = Semaphore(4)
    const val USER_AGENT = "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"
    fun headers(referer: String) = mapOf("User-Agent" to USER_AGENT,"Referer" to referer)
    suspend fun page(request: PageRequest, referer: String): Document {
        fun cached() = cache[request]?.takeIf { System.nanoTime()-it.first < TimeUnit.SECONDS.toNanos(30) }?.second
        cached()?.let { return it }
        val lock=locks.getOrPut(request){Mutex()}
        return try { lock.withLock {
            cached() ?: permits.withPermit {
                // Strip2 can serve cached documents with expired signed thumbnails/media URLs.
                val refresh=java.net.URI(request.url).host.orEmpty().endsWith(".strip2.co") && request.data==null
                val fetchUrl=if(refresh)request.url+(if(request.url.contains('?')) "&" else "?")+"_refresh="+(System.currentTimeMillis()/60_000) else request.url
                val builder=Request.Builder().url(fetchUrl)
                for((k,v) in headers(referer))builder.header(k,v)
                request.data?.let { values -> val form=FormBody.Builder();values.forEach { (k,v)->form.add(k,v) };builder.post(form.build()) }
                val document=execute(builder.build(),request.allowNotFound)
                if(refresh)document.setBaseUri(request.url)
                cache[request]=System.nanoTime() to document
                document
            }
        }} finally { locks.remove(request,lock) }
    }
    private suspend fun execute(request: Request,allowNotFound: Boolean): Document = suspendCancellableCoroutine { continuation ->
        val client=app.baseClient.newBuilder().callTimeout(15,TimeUnit.SECONDS).connectTimeout(8,TimeUnit.SECONDS).readTimeout(12,TimeUnit.SECONDS).build()
        val call=client.newCall(request)
        continuation.invokeOnCancellation { call.cancel() }
        call.enqueue(object: Callback {
            override fun onFailure(call: Call,e: IOException) { if(continuation.isActive)continuation.resumeWithException(e) }
            override fun onResponse(call: Call,response: Response) {
                try {
                    response.use {
                        if(!it.isSuccessful && !(allowNotFound && it.code==404))throw ErrorLoadingException("HTTP ${it.code}: ${request.url.host}")
                        val text=it.body?.string() ?: throw ErrorLoadingException("Пустой ответ: ${request.url.host}")
                        val page=Jsoup.parse(text,it.request.url.toString())
                        page.attr("data-response-code",it.code.toString())
                        if(continuation.isActive)continuation.resume(page)
                    }
                }catch(error:Exception){if(continuation.isActive)continuation.resumeWithException(error)}
            }
        })
    }
}
