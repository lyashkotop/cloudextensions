package com.cloudextensions.russian

import java.io.IOException
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.delay
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.FormBody
import okhttp3.HttpUrl.Companion.toHttpUrl
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import org.json.JSONObject

/** The extension uses Aniyomi's cookie-aware Cloudflare client, never a second browser session. */
object Network {
    @Volatile var client:OkHttpClient=OkHttpClient.Builder().connectTimeout(8,TimeUnit.SECONDS).readTimeout(12,TimeUnit.SECONDS).callTimeout(18,TimeUnit.SECONDS).build()
    const val USER_AGENT="Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"
    fun headers(referer:String)=mapOf("User-Agent" to USER_AGENT,"Referer" to referer)
    private suspend fun fetch(request:Request):okhttp3.Response=suspendCancellableCoroutine { continuation ->
        val call=client.newCall(request)
        continuation.invokeOnCancellation{call.cancel()}
        call.enqueue(object:okhttp3.Callback {
            override fun onFailure(call:okhttp3.Call,error:IOException){if(continuation.isActive)continuation.resumeWithException(error)}
            override fun onResponse(call:okhttp3.Call,response:okhttp3.Response){if(continuation.isActive)continuation.resume(response){response.close()} else response.close()}
        })
    }
    data class TextResponse(val text:String,val url:String,val code:Int,val headers:okhttp3.Headers)
    suspend fun response(request:PageRequest,referer:String):TextResponse {
        val host=webUri(request.url).host.orEmpty()
        val fetch=if(host.endsWith(".strip2.co")&&request.data==null)request.url.toHttpUrl().newBuilder().setQueryParameter("_refresh",(System.currentTimeMillis()/1000).toString()).build().toString() else request.url
        val builder=Request.Builder().url(fetch)
        (headers(referer)+request.headers).forEach{(k,v)->builder.header(k,v)}
        request.data?.let{data->val form=FormBody.Builder();data.forEach{(k,v)->form.add(k,v)};builder.post(form.build())}
        var attempt=0
        while(true) {
            fetch(builder.build()).use { response ->
                if(response.code==429 && attempt++==0) {
                    val retry=response.header("Retry-After")?.toLongOrNull() ?: 1
                    if(retry !in 0..3)throw IOException("HTTP 429: ${response.request.url.host}; Retry-After: $retry")
                    delay(retry*1000);return@use
                }
                if(!response.isSuccessful && !(request.allowNotFound&&response.code==404))throw IOException("HTTP ${response.code}: ${response.request.url.host}")
                val raw=response.body?.string() ?: throw IOException("Empty source response")
                return TextResponse(raw,response.request.url.toString(),response.code,response.headers)
            }
        }
    }
    suspend fun page(request:PageRequest,referer:String):Document {
        val response=response(request,referer);val raw=response.text
        val envelope=if(raw.trimStart().startsWith('{'))try{JSONObject(raw)}catch(_:Exception){null} else null
        return Jsoup.parse(envelope?.optString("html")?.takeIf{it.isNotBlank()} ?: raw,response.url).apply {
            attr("data-response-code",response.code.toString())
            if(envelope?.has("results_remaining")==true)attr("data-results-remaining",envelope.optInt("results_remaining").toString())
        }
    }

}
