package com.cloudextensions.russian

import android.content.Context
import android.util.Log
import com.lagradost.cloudstream3.SearchResponse
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit

/** Warms the host's own Coil cache; no private image cache or bundled Coil dependency. */
object ImagePrefetch {
    @Volatile private var context:Context?=null
    @Volatile private var warned=false
    private val scope=CoroutineScope(SupervisorJob()+Dispatchers.IO)
    private val permits=Semaphore(4)
    private val jobs=BoundedMap<String,Pair<Long,Deferred<Unit>>>(256)
    fun configure(value:Context){context=value.applicationContext}

    suspend fun warm(cards:List<SearchResponse>,waitMs:Long=1000) {
        val ctx=context ?: return
        val pending=cards.filter{!it.posterUrl.isNullOrBlank()}.take(80).map { card ->
            val url=card.posterUrl!!
            val headers=card.posterHeaders.orEmpty()
            val key=url+"|"+headers.toSortedMap().hashCode()
            synchronized(jobs) {
                jobs[key]?.takeIf{System.nanoTime()-it.first<300_000_000_000L}?.second ?: scope.async {
                    permits.withPermit {
                        try {
                            val request=enqueue(ctx,url,headers)
                            val result=withTimeoutOrNull(10_000){request.await()}
                            if(result==null){request.cancel();error("Image preload timed out")}
                            if(result.javaClass.simpleName=="ErrorResult")error("Image server rejected preload")
                        }catch(e:CancellationException){throw e}catch(e:Exception){
                            synchronized(jobs){jobs.remove(key)}
                            if(!warned){warned=true;Log.w("CloudExtensions","Coil preloading unavailable: ${e.javaClass.simpleName}")}
                        }catch(e:LinkageError){if(!warned){warned=true;Log.w("CloudExtensions","Unsupported image loader")}}
                    }
                }.also{jobs[key]=System.nanoTime() to it}
            }
        }
        if(waitMs>0)withTimeoutOrNull(waitMs){pending.take(10).awaitAll()}
    }

    private fun enqueue(ctx:Context,url:String,headers:Map<String,String>):Deferred<*> {
        fun cls(name:String)=Class.forName(name,true,ImagePrefetch::class.java.classLoader)
        val version=try{cls("coil3.SingletonImageLoader");3}catch(_:ClassNotFoundException){2}
        val prefix=if(version==3)"coil3" else "coil"
        val owner=cls(if(version==3)"coil3.SingletonImageLoader" else "coil.Coil")
        val instance=owner.getMethod(if(version==3)"get" else "imageLoader",Context::class.java).invoke(null,ctx)
        val builderType=cls(prefix+".request.ImageRequest\$Builder")
        val builder=builderType.getConstructor(Context::class.java).newInstance(ctx)
        builderType.getMethod("data",Any::class.java).invoke(builder,url)
        builderType.getMethod("size",Int::class.javaPrimitiveType,Int::class.javaPrimitiveType).invoke(builder,640,360)
        if(version==3) {
            val headerBuilder=cls("coil3.network.NetworkHeaders\$Builder").getConstructor().newInstance()
            val setter=headerBuilder.javaClass.getMethod("set",String::class.java,String::class.java)
            headers.forEach{(k,v)->setter.invoke(headerBuilder,k,v)}
            val values=headerBuilder.javaClass.getMethod("build").invoke(headerBuilder)
            cls("coil3.network.ImageRequestsKt").getMethod("httpHeaders",builderType,cls("coil3.network.NetworkHeaders")).invoke(null,builder,values)
        } else {
            val headerBuilder=okhttp3.Headers.Builder()
            headers.forEach{(k,v)->headerBuilder.set(k,v)}
            builderType.getMethod("headers",okhttp3.Headers::class.java).invoke(builder,headerBuilder.build())
        }
        val request=builderType.getMethod("build").invoke(builder)
        val disposable=cls(prefix+".ImageLoader").getMethod("enqueue",cls(prefix+".request.ImageRequest")).invoke(instance,request)
        return cls(prefix+".request.Disposable").getMethod("getJob").invoke(disposable) as Deferred<*>
    }
}
