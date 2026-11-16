package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.Interceptor

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
    private fun cards(items:List<SearchResponse>)=items.map { card ->
        val image=Metadata.rememberPoster(card.url,card.posterUrl)
        if(card is MovieSearchResponse)card.copy(posterUrl=image,posterHeaders=card.posterHeaders.orEmpty()+Network.imageHeaders(image,mainUrl.trimEnd('/')+"/")) else card
    }
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse = RequestLimits.required("Главная") {
        val result=source.getMainPage(page,request) ?: return@required newHomePageResponse(emptyList(),false)
        newHomePageResponse(result.items.map{it.copy(list=cards(it.list))},result.hasNext)
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun search(query:String,page:Int):SearchResponseList = RequestLimits.required("Поиск") {
        val result=source.search(query,page) ?: return@required newSearchResponseList(emptyList(),false)
        newSearchResponseList(cards(result.items),result.hasNext)
    }
    override suspend fun load(url:String):LoadResponse = RequestLimits.required("Карточка") {
        val result=source.load(url) ?: throw ErrorLoadingException("Источник не вернул карточку")
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
