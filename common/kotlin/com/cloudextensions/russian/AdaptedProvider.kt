package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withTimeoutOrNull
import okhttp3.Interceptor
import java.util.Collections

/** Keeps upstream site/extractor code while applying the repository's common behaviour. */
class AdaptedProvider(private val source: MainAPI): MainAPI() {
    override var name: String get()=source.name;set(value){source.name=value}
    override var mainUrl: String get()=source.mainUrl;set(value){source.mainUrl=value}
    override var lang: String get()=source.lang;set(value){source.lang=value}
    override val supportedTypes get()=source.supportedTypes
    override val hasMainPage get()=source.hasMainPage
    override val hasQuickSearch=false
    override val hasDownloadSupport get()=source.hasDownloadSupport
    override val hasChromecastSupport get()=source.hasChromecastSupport
    override val mainPage get()=source.mainPage
    override val vpnStatus get()=source.vpnStatus
    private val histories=object:LinkedHashMap<String,MutableMap<Int,Set<String>>>(16,.75f,true){override fun removeEldestEntry(e:MutableMap.MutableEntry<String,MutableMap<Int,Set<String>>>?)=size>24}
    private fun normalize(values:List<SearchResponse>):List<SearchResponse> = values.filter{ContentPolicy.accepts(it.name)}.distinctBy{videoKey(it.url)}.map{card->
        if(card is MovieSearchResponse)card.copy(name=Metadata.title(card.url,listOf(card.name)),posterHeaders=Network.headers(mainUrl)+card.posterHeaders.orEmpty()) else card
    }
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse {
        val data=source.getMainPage(page,request) ?: return newHomePageResponse(emptyList(),false)
        return newHomePageResponse(data.items.map{it.copy(list=normalize(it.list))},data.hasNext)
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun search(query:String,page:Int):SearchResponseList {
        val input=Metadata.clean(query)
        if(input.isEmpty()||page<1)return newSearchResponseList(emptyList(),false)
        val batches=coroutineScope {
            val original=async{source.search(input,page)}
            val translated=async{
                try{withTimeoutOrNull(2500){Translation.translated(input)}?.let{source.search(it,page)}}catch(e:CancellationException){throw e}catch(_:Exception){null}
            }
            listOfNotNull(original.await(),translated.await())
        }
        val merged=normalize(batches.flatMap{it.items})
        val previous=synchronized(histories){if(page==1)histories[input]=mutableMapOf();histories.getOrPut(input){mutableMapOf()}.filterKeys{it<page}.values.flatten().toSet()}
        val fresh=merged.filter{videoKey(it.url) !in previous}
        synchronized(histories){histories.getValue(input)[page]=fresh.map{videoKey(it.url)}.toSet()}
        return newSearchResponseList(fresh,batches.any{it.hasNext}&&(page==1||fresh.isNotEmpty()))
    }
    override suspend fun load(url:String):LoadResponse {
        val result=source.load(url) ?: throw ErrorLoadingException("Video metadata is missing")
        if(!ContentPolicy.accepts(result.name,result.tags.orEmpty()))throw ErrorLoadingException("Video hidden by category filter")
        if(result is MovieLoadResponse)result.name=Metadata.title(url,listOf(result.name))
        result.plot=result.plot.orEmpty().replaceFirst(Regex("\\AДлительность:[^\\r\\n]*(?:\\r?\\n)*"),"")
        result.recommendations=normalize(result.recommendations.orEmpty()).filter{videoKey(it.url)!=videoKey(url)}
        if(result.recommendations.isNullOrEmpty())result.tags?.firstOrNull{ContentPolicy.accepts(it)}?.let{tag->
            try{result.recommendations=normalize(source.search(tag,1)?.items.orEmpty()).filter{videoKey(it.url)!=videoKey(url)}}catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        return result
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean {
        val seen=Collections.synchronizedSet(mutableSetOf<String>())
        source.loadLinks(data,isCasting,subtitleCallback){if(seen.add(it.url))callback(it)}
        return seen.isNotEmpty()
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor? = source.getVideoInterceptor(extractorLink)
}
