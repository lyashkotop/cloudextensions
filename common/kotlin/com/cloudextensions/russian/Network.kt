package com.cloudextensions.russian

import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.app
import com.lagradost.cloudstream3.network.CloudflareKiller
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
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okhttp3.Call
import okhttp3.Callback
import okhttp3.FormBody
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import org.jsoup.Jsoup
import org.jsoup.nodes.Document

object Network {
    private val cloudflare by lazy { CloudflareKiller() }
    private class HttpFailure(val code: Int, val url: String, val retryAfter: String? = null) :
        IOException("HTTP $code: ${url.toHttpUrlOrNull()?.host}")
    private val challengeHandler=Interceptor { chain ->
        cloudflare.intercept(object:Interceptor.Chain by chain {
            override fun proceed(request:Request):Response {
                val response=chain.proceed(request)
                // Reverse proxies can replace Server while preserving the explicit challenge marker.
                return if(response.code in setOf(403,503) && response.header("cf-mitigated").equals("challenge",true))
                    response.newBuilder().header("Server","cloudflare").build() else response
            }
        })
    }
    fun retryDelay(value:String?):Long? {
        if(value.isNullOrBlank())return 750L
        val seconds=value.trim().toLongOrNull()
        if(seconds!=null)return if(seconds in 0..3)seconds*1000L else null
        val wait=try{java.text.SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz",java.util.Locale.US).parse(value)!!.time-System.currentTimeMillis()}catch(_:Exception){return null}
        return wait.coerceAtLeast(0).takeIf{it<=3000}
    }
    private val cache = Collections.synchronizedMap(BoundedMap<PageRequest,Pair<Long,Document>>(24))
    private class PageGate(val mutex: Mutex = Mutex(), var users: Int = 1)
    private val locks = ConcurrentHashMap<PageRequest, PageGate>()
    private val permits = Semaphore(4)
    const val USER_AGENT = "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"
    fun headers(referer: String) = mapOf("User-Agent" to USER_AGENT,"Referer" to referer)
    fun imageHeaders(image:String?,referer:String):Map<String,String> {
        val result=headers(referer).toMutableMap()
        try {
            val url=(image ?: referer).toHttpUrlOrNull()
            if(url!=null) {
                val cookies=app.baseClient.cookieJar.loadForRequest(url)
                if(cookies.isNotEmpty())result["Cookie"]=cookies.joinToString("; "){it.name+"="+it.value}
            }
        }catch(_:Exception){}
        return result
    }
    internal fun replacementImageHeaders(poster: String, url: String, headers: Map<String, String>): Map<String, String> =
        headers.filterKeys { !it.equals("Cookie", ignoreCase = true) } +
            imageHeaders(poster, headers["Referer"] ?: url)

    suspend fun page(request: PageRequest, referer: String): Document = RequestLimits.required("Страница",18_000) {
        pageUnbounded(request,referer)
    }
    private suspend fun pageUnbounded(request: PageRequest, referer: String): Document {
        fun cached() = cache[request]?.takeIf { System.nanoTime()-it.first < TimeUnit.SECONDS.toNanos(30) }?.second
        cached()?.let { return it }
        val gate = locks.compute(request) { _, pending -> pending?.also { it.users++ } ?: PageGate() }!!
        return try { gate.mutex.withLock {
            cached() ?: permits.withPermit {
                // Strip2 can serve cached documents with expired signed thumbnails/media URLs.
                val refresh=java.net.URI(request.url).host.orEmpty().endsWith(".strip2.co") && request.data==null
                val fetchUrl=if(refresh)request.url+(if(request.url.contains('?')) "&" else "?")+"_refresh="+(System.currentTimeMillis()/60_000) else request.url
                val builder=Request.Builder().url(fetchUrl)
                for((k,v) in headers(referer)+request.headers)builder.header(k,v)
                request.data?.let { values -> val form=FormBody.Builder();values.forEach { (k,v)->form.add(k,v) };builder.post(form.build()) }
                val initial=builder.build()
                val document=try {
                    try { execute(initial,request.allowNotFound) } catch(failure:HttpFailure) {
                        if(failure.code!=429)throw failure
                        val delay=retryDelay(failure.retryAfter) ?: throw failure
                        kotlinx.coroutines.delay(delay)
                        // A redirect can terminate on another host; retry the failing endpoint once.
                        val retry=initial.newBuilder().url(failure.url).apply{
                            if(failure.url!=fetchUrl)get()
                            if(failure.url.toHttpUrlOrNull()?.host!=initial.url.host){removeHeader("Cookie");removeHeader("Authorization")}
                        }.build()
                        execute(retry,request.allowNotFound)
                    }
                } catch(failure:HttpFailure) {
                    if(failure.code !in setOf(403,503))throw failure
                    // Use the host's cookie-aware WebView challenge handler on Android.
                    val sameHost=failure.url.toHttpUrlOrNull()?.host==initial.url.host
                    val extra=headers(referer)+request.headers.filterKeys{sameHost || it.lowercase() !in setOf("cookie","authorization")}
                    val response=kotlinx.coroutines.withTimeout(7000) {
                        if(request.data==null || failure.url!=fetchUrl)app.get(failure.url,headers=extra,interceptor=challengeHandler)
                        else app.post(failure.url,headers=extra,data=request.data,interceptor=challengeHandler)
                    }
                    try {
                        if(response.code !in 200..299 && !(request.allowNotFound && response.code==404))throw HttpFailure(response.code,response.url)
                        Jsoup.parse(response.text, response.url).apply {
                            attr("data-response-code", response.code.toString())
                        }
                    } finally { response.okhttpResponse.close() }
                }
                if(refresh)document.setBaseUri(request.url)
                Metadata.alias(request.url,document.baseUri())
                cache[request]=System.nanoTime() to document
                document
            }
        }} finally {
            locks.computeIfPresent(request) { _, pending -> if (--pending.users == 0) null else pending }
        }
    }

    private suspend fun execute(request: Request, allowNotFound: Boolean): Document {
        val client = app.baseClient.newBuilder().callTimeout(15, TimeUnit.SECONDS)
            .connectTimeout(8, TimeUnit.SECONDS).readTimeout(12, TimeUnit.SECONDS).build()
        return read(request, client) { response ->
            if (!response.isSuccessful && !(allowNotFound && response.code == 404)) {
                throw HttpFailure(response.code, response.request.url.toString(), response.header("Retry-After"))
            }
            val text = response.body?.string() ?: throw ErrorLoadingException("Пустой ответ: ${request.url.host}")
            val envelope = if (text.trimStart().startsWith("{")) {
                try { org.json.JSONObject(text) } catch (_: org.json.JSONException) { null }
            } else null
            val page = Jsoup.parse(
                envelope?.optString("html")?.takeIf(String::isNotBlank) ?: text,
                response.request.url.toString(),
            )
            if (envelope?.has("results_remaining") == true) {
                page.attr("data-results-remaining", envelope.optInt("results_remaining").toString())
            }
            page.attr("data-response-code", response.code.toString())
            page
        }
    }

    internal suspend fun <T> read(request: Request, client: OkHttpClient, parse: (Response) -> T): T =
        suspendCancellableCoroutine { continuation ->
            val call = client.newCall(request)
            continuation.invokeOnCancellation { call.cancel() }
            call.enqueue(object : Callback {
                override fun onFailure(call: Call, e: IOException) {
                    if (continuation.isActive) continuation.resumeWithException(e)
                }

                override fun onResponse(call: Call, response: Response) {
                    try {
                        response.use {
                            if (continuation.isActive) continuation.resume(parse(it))
                        }
                    } catch (error: Exception) {
                        if (continuation.isActive) continuation.resumeWithException(error)
                    }
                }
            })
        }
}
