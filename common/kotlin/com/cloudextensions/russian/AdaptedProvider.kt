package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import kotlinx.coroutines.CancellationException
import okhttp3.Interceptor
import java.util.Collections

/** Adapts upstream site and extractor code. ReliableProvider coordinates translated search. */
class AdaptedProvider(private val source: MainAPI): MainAPI() {
    override var name: String get()=source.name;set(value){source.name=value}
    override var mainUrl: String get()=source.mainUrl;set(value){source.mainUrl=value}
    override var lang: String get()=source.lang;set(value){source.lang=value}
    override val supportedTypes get()=source.supportedTypes
    override val hasMainPage get()=source.hasMainPage
    override val hasQuickSearch=false
    override val hasDownloadSupport get()=source.hasDownloadSupport
    override val hasChromecastSupport get()=source.hasChromecastSupport
    override val mainPage get()=source.mainPage.filter{ContentPolicy.accepts(it.name)}
    override val vpnStatus get()=source.vpnStatus
    private val histories=object:LinkedHashMap<String,MutableMap<Int,Set<String>>>(16,.75f,true){override fun removeEldestEntry(e:MutableMap.MutableEntry<String,MutableMap<Int,Set<String>>>?)=size>24}
    private fun normalize(values:List<SearchResponse>):List<SearchResponse> = values.filter{ContentPolicy.accepts(it.name)}.distinctBy{videoKey(it.url)}.map{card->
        if(card is MovieSearchResponse)card.copy(name=Metadata.title(card.url,listOf(card.name)),posterHeaders=Network.headers(mainUrl)+card.posterHeaders.orEmpty()) else card
    }
    private fun uniquePage(key: String, page: Int, cards: List<SearchResponse>): List<SearchResponse> =
        synchronized(histories) {
            if (page == 1) histories[key] = mutableMapOf()
            val pages = histories.getOrPut(key) { mutableMapOf() }
            val previous = pages.entries.asSequence().filter { it.key < page }.flatMap { it.value.asSequence() }.toSet()
            cards.filter { videoKey(it.url) !in previous }.also { fresh ->
                pages[page] = fresh.mapTo(mutableSetOf()) { videoKey(it.url) }
            }
        }

    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse {
        val data=source.getMainPage(page,request) ?: return newHomePageResponse(emptyList(),false)
        val items=data.items.map { section ->
            val key = "home:${request.data}:${section.name}"
            section.copy(list = uniquePage(key, page, normalize(section.list)))
        }
        return newHomePageResponse(items,data.hasNext&&(page==1||items.any{it.list.isNotEmpty()}))
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun search(query:String,page:Int):SearchResponseList {
        val input=Metadata.clean(query)
        if(input.isEmpty()||page<1)return newSearchResponseList(emptyList(),false)
        val result = source.search(input, page)
        val fresh = uniquePage(input, page, normalize(result?.items.orEmpty()))
        return newSearchResponseList(fresh, result?.hasNext == true && (page == 1 || fresh.isNotEmpty()))
    }
    override suspend fun load(url:String):LoadResponse {
        val result=source.load(url) ?: throw ErrorLoadingException("Video metadata is missing")
        if(!ContentPolicy.accepts(result.name,result.tags.orEmpty(),result.plot))throw ErrorLoadingException("Video hidden by category filter")
        if(result is MovieLoadResponse)result.name=Metadata.title(url,listOf(result.name),fromDetail=true)
        result.plot=Metadata.description(result.plot,result.name)
        result.tags=result.tags.orEmpty().mapNotNull(Metadata::tag).distinctBy{it.lowercase()}
        if(result.plot.isNullOrBlank() || result.tags.isNullOrEmpty() || result.duration==null || Metadata.imageUrl(url,result.posterUrl)==null) {
            try {
                val page=RequestLimits.optional { Network.page(PageRequest(result.url),mainUrl) }
                val metadata=page?.let{Metadata.detail(it,SiteSpec("upstream",name,mainUrl,".none","a[href]",".title",emptyList()))}
                if(result.plot.isNullOrBlank())result.plot=metadata?.description
                if(result.tags.isNullOrEmpty())result.tags=metadata?.tags
                if(result.duration==null && metadata!=null)result.applyVideoDuration(metadata.duration)
                result.posterUrl=Metadata.choosePoster(url,result.posterUrl,metadata?.poster)
            }catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        if(!ContentPolicy.accepts(result.name,result.tags.orEmpty(),result.plot))throw ErrorLoadingException("Video hidden by category filter")
        if(result is MovieLoadResponse)result.posterHeaders=Network.headers(mainUrl)+result.posterHeaders.orEmpty()
        result.plot=result.plot.orEmpty().replaceFirst(Regex("\\AДлительность:[^\\r\\n]*(?:\\r?\\n)*"),"")
        result.recommendations=normalize(result.recommendations.orEmpty()).filter{videoKey(it.url)!=videoKey(url)}
        if(result.recommendations.isNullOrEmpty())result.tags?.firstOrNull{ContentPolicy.accepts(it)}?.let{tag->
            try{result.recommendations=normalize(RequestLimits.optional { source.search(tag,1) }?.items.orEmpty()).filter{videoKey(it.url)!=videoKey(url)}}catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        return result
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean {
        val seen=Collections.synchronizedSet(mutableSetOf<String>())
        try { source.loadLinks(data,isCasting,subtitleCallback){if(seen.add(it.url))callback(it)} }
        catch(e:CancellationException){throw e}catch(e:ErrorLoadingException){throw e}catch(_:Exception){}
        if(seen.isEmpty() && data.startsWith("http") && !data.contains(" kraptor ")) {
            Playback.links(name,mainUrl,data,subtitleCallback){if(seen.add(it.url))callback(it)}
        }
        return seen.isNotEmpty()
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor? = source.getVideoInterceptor(extractorLink)

    internal val detailTagSource: DetailTagSource? get() = source as? DetailTagSource
    internal val translateQueries: Boolean get() = (source as? SearchPolicy)?.translateQueries ?: true
}
