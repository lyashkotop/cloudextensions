package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import android.content.Context
import android.app.Application
import uy.kohesive.injekt.Injekt
import uy.kohesive.injekt.api.get
import android.os.Handler
import android.os.Looper
import android.webkit.*
import com.cloudextensions.russian.Network
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.withTimeoutOrNull
import java.io.ByteArrayInputStream
import kotlin.coroutines.resume

/** Last resort for source players which compute their signed media URLs in JavaScript. */
object AndroidPlayer {
    @Volatile private var context:Context?=null
    fun attach(networkHelper:Any) {
        if(context!=null)return
        try{context=Injekt.get<Application>().applicationContext;return}catch(_:Exception){}
        try {
            var type:Class<*>?=networkHelper.javaClass
            while(type!=null) {
                for(field in type.declaredFields)if(Context::class.java.isAssignableFrom(field.type)) {
                    field.isAccessible=true
                    (field.get(networkHelper) as? Context)?.applicationContext?.let{context=it;return}
                }
                type=type.superclass
            }
        }catch(_:Exception){}
    }
    data class Captured(val url:String,val referer:String,val headers:Map<String,String>)
    private val media=Regex("(?i)(?:/get_file/|\\.(?:m3u8|mp4|webm|mpd)(?:[/?#&]|$))")
    private val ads=Regex("(?i)(?:^|[/_.-])(?:ads?|vast|preroll|postroll|advert)(?:[/_.?-]|$)")
    suspend fun capture(url:String,referer:String):List<Captured> {
        val app=context ?: return emptyList()
        val handler=Handler(Looper.getMainLooper())
        var view:WebView?=null
        return try {withTimeoutOrNull(14000) {
            suspendCancellableCoroutine<List<Captured>> { continuation ->
                val results=java.util.Collections.synchronizedList(mutableListOf<Captured>())
                var finishing=false
                val current=java.util.concurrent.atomic.AtomicReference(url)
                fun complete(){if(continuation.isActive)continuation.resume(results.toList())}
                continuation.invokeOnCancellation{handler.post{view?.stopLoading();view?.destroy();view=null}}
                handler.post {
                    if(!continuation.isActive)return@post
                    try {
                        val browser=WebView(app);view=browser
                        browser.settings.javaScriptEnabled=true
                        browser.settings.domStorageEnabled=true
                        browser.settings.blockNetworkImage=true
                        browser.settings.mediaPlaybackRequiresUserGesture=false
                        browser.settings.userAgentString=Network.USER_AGENT
                        browser.webViewClient=object:WebViewClient() {
                            override fun shouldInterceptRequest(webView:WebView,request:WebResourceRequest):WebResourceResponse? {
                                val target=request.url.toString()
                                if(media.containsMatchIn(target)&&!ads.containsMatchIn(target)) {
                                    val headers=request.requestHeaders.toMutableMap()
                                    headers["User-Agent"]=Network.USER_AGENT
                                    try{CookieManager.getInstance().getCookie(target)?.let{headers["Cookie"]=it}}catch(_:Exception){}
                                    results+=Captured(target,request.requestHeaders["Referer"] ?: current.get(),headers)
                                    synchronized(results){if(!finishing){finishing=true;handler.postDelayed({complete()},400)}}
                                    // Capture addresses only; do not load/play media inside this hidden resolver.
                                    return WebResourceResponse("text/plain","UTF-8",ByteArrayInputStream(byteArrayOf()))
                                }
                                return null
                            }
                            override fun onPageFinished(webView:WebView,target:String) {
                                current.set(target)
                                webView.evaluateJavascript("document.querySelectorAll('video').forEach(function(v){v.muted=true;v.play().catch(function(){});});",null)
                            }
                        }
                        browser.loadUrl(url,Network.headers(referer))
                    }catch(_:Exception){complete()}
                }
            }
        }.orEmpty()} finally {handler.post{view?.stopLoading();view?.destroy();view=null}}
    }
}
