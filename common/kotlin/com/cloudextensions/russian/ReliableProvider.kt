package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.Interceptor
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope

/** UI request bounds and one real preview shared by the search and detail response. */
class ReliableProvider(private val source:MainAPI):MainAPI() {
    override var name:String get()=source.name;set(value){source.name=value}
    override var mainUrl:String get()=source.mainUrl;set(value){source.mainUrl=value}
    override var lang:String get()=source.lang;set(value){source.lang=value}
    override val supportedTypes get()=source.supportedTypes
    override val hasMainPage get()=source.hasMainPage
    override val mainPage get()=source.mainPage
    override val hasQuickSearch get()=source.hasQuickSearch
    override val hasDownloadSupport get()=source.hasDownloadSupport
    override val hasChromecastSupport get()=source.hasChromecastSupport
    override val vpnStatus get()=source.vpnStatus
    private fun cards(items:List<SearchResponse>)=items.filter{ContentPolicy.accepts(it.name)}.map { card ->
        val image=Metadata.rememberPoster(card.url,card.posterUrl)
        if(card is MovieSearchResponse)card.copy(posterUrl=image,posterHeaders=card.posterHeaders.orEmpty()+Network.imageHeaders(image,mainUrl.trimEnd('/')+"/")) else card
    }
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse = RequestLimits.required("Главная") {
        val result=source.getMainPage(page,request) ?: return@required newHomePageResponse(emptyList(),false)
        newHomePageResponse(result.items.map{it.copy(list=cards(it.list))},result.hasNext)
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    private val searchHistory=java.util.Collections.synchronizedMap(BoundedMap<String,MutableMap<Int,Set<String>>>(32))
    override suspend fun search(query:String,page:Int):SearchResponseList = RequestLimits.required("Поиск") {
        if(!ContentPolicy.accepts(query))return@required newSearchResponseList(emptyList(),false)
        if(lang !in listOf("ru","en")) {
            val result=source.search(query,page)?:return@required newSearchResponseList(emptyList(),false)
            return@required newSearchResponseList(cards(result.items),result.hasNext)
        }
        data class Batch(val response:SearchResponseList?,val error:Exception?=null)
        suspend fun branch(term:String):Batch=try{Batch(Translation.originalOnly{source.search(term,page)})}catch(e:kotlinx.coroutines.CancellationException){throw e}catch(e:Exception){Batch(null,e)}
        val batches=coroutineScope {
            val original=async{branch(query)}
            val translated=async{Translation.translated(query)?.let{branch(it)}}
            listOfNotNull(original.await(),translated.await())
        }
        val responses=batches.mapNotNull{it.response}
        if(responses.isEmpty())batches.firstNotNullOfOrNull{it.error}?.let{throw it}
        val merged=cards(responses.flatMap{it.items}).distinctBy{videoKey(it.url)}
        val previous=synchronized(searchHistory){if(page==1)searchHistory[query]=mutableMapOf();searchHistory.getOrPut(query){mutableMapOf()}.filterKeys{it<page}.values.flatten().toSet()}
        val fresh=merged.filter{videoKey(it.url) !in previous}
        synchronized(searchHistory){searchHistory.getOrPut(query){mutableMapOf()}[page]=fresh.map{videoKey(it.url)}.toSet()}
        newSearchResponseList(fresh,responses.any{it.hasNext})
    }
    override suspend fun load(url:String):LoadResponse = RequestLimits.required("Карточка") {
        val result=source.load(url) ?: throw ErrorLoadingException("Источник не вернул карточку")
        if(!ContentPolicy.accepts(result.name,result.tags.orEmpty()))throw ErrorLoadingException("Видео скрыто фильтром категорий")
        result.posterUrl=Metadata.choosePoster(url,result.posterUrl)
        if(result is MovieLoadResponse)result.posterHeaders=result.posterHeaders.orEmpty()+Network.imageHeaders(result.posterUrl,url)
        result.recommendations=cards(result.recommendations.orEmpty())
        result
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean = RequestLimits.required("Плеер",45_000) {
        source.loadLinks(data,isCasting,subtitleCallback,callback)
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor?=source.getVideoInterceptor(extractorLink)
}
