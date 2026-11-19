package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.Interceptor
import kotlinx.coroutines.CoroutineStart
import kotlinx.coroutines.launch
import kotlinx.coroutines.joinAll
import kotlinx.coroutines.Job
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
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
    private val titlePermits = Semaphore(4)

    private fun normalizeCard(
        card: SearchResponse,
        image: String? = Metadata.rememberPoster(card.url, card.posterUrl),
        title: String = Metadata.title(card.url, listOf(card.name)),
    ): SearchResponse {
        if (card !is MovieSearchResponse) return card
        val headers = Network.imageHeaders(image, mainUrl.trimEnd('/') + "/") + card.posterHeaders.orEmpty()
        return card.copy(name = title, posterUrl = image, posterHeaders = headers)
    }

    private suspend fun expandTitle(card: SearchResponse, deadline: Long): String = titlePermits.withPermit {
        val budget = minOf(2500L, ((deadline - System.nanoTime()) / 1_000_000).coerceAtLeast(1))
        RequestLimits.optional(budget) {
            if (source is SearchPolicy) source.fullTitle(card.url) else {
                val page = Network.page(PageRequest(card.url), mainUrl)
                Metadata.detail(page, SiteSpec("title", name, mainUrl, ".none", "a", "h1", emptyList())).title
            }
        }?.takeIf { it.isNotBlank() } ?: card.name
    }

    private suspend fun cards(items: List<SearchResponse>, prefetch: Boolean = false): List<SearchResponse> = coroutineScope {
        val deadline = System.nanoTime() + 3_000_000_000L
        items.filter { ContentPolicy.accepts(it.name) }.map { card -> async {
            val ready = if (Metadata.isTruncatedTitle(card.name)) {
                val image = Metadata.rememberPoster(card.url, card.posterUrl)
                normalizeCard(card, image, expandTitle(card, deadline))
            } else normalizeCard(card)
            if (prefetch) ImagePrefetch.warm(listOf(ready), 0)
            ready
        } }.awaitAll()
    }
    private val posterPermits = Semaphore(12)
    private suspend fun withResolvedPosters(items: List<SearchResponse>): List<SearchResponse> = coroutineScope {
        val provider = source as? PosterSource ?: return@coroutineScope items
        items.map { item -> async {
            if (item !is MovieSearchResponse) return@async item
            val headers = item.posterHeaders.orEmpty()
            val poster = RequestLimits.optional(provider.posterTimeoutMs) {
                posterPermits.withPermit { provider.resolvePoster(item.url, item.posterUrl, headers) }
            }
            if (poster == null || poster == item.posterUrl) return@async item
            Metadata.rememberPoster(item.url, poster)
            item.copy(posterUrl = poster, posterHeaders = Network.replacementImageHeaders(poster, item.url, headers))
        } }.awaitAll()
    }
    private data class Review(val allowed:Boolean,val detail:LoadResponse?,val title:String?=detail?.name)
    private val reviews=java.util.Collections.synchronizedMap(BoundedMap<String,Pair<Long,Review>>(128))
    private val reviewPermits=Semaphore(4)
    private fun savedReview(url:String)=reviews[videoKey(url)]?.takeIf{System.nanoTime()-it.first<300_000_000_000L}?.second
    private suspend fun review(card:SearchResponse,budget:Long=3500):Review? {
        savedReview(card.url)?.let{return it}
        val result=RequestLimits.optional(budget){reviewPermits.withPermit {
            try {
                if(source is SearchMetadataSource){
                    val meta=source.searchMetadata(card.url)
                    return@withPermit Review(ContentPolicy.accepts(meta.title,meta.tags),null,meta.title)
                }
                val detail=source.load(card.url) ?: return@withPermit null
                Review(ContentPolicy.accepts(detail.name,detail.tags.orEmpty()),detail)
            }catch(e:ErrorLoadingException){
                if(Regex("(?iu)hidden by category filter|скрыто фильтром|приватн|private video").containsMatchIn(e.message.orEmpty()))Review(false,null) else null
            }
        }} ?: return null
        reviews[videoKey(card.url)]=System.nanoTime() to result
        return result
    }
    private suspend fun previewSearch(items:List<SearchResponse>):List<SearchResponse> = coroutineScope {
        val accepted=mutableListOf<SearchResponse>()
        val deadline=System.nanoTime()+5_000_000_000L
        var cursor=0
        while(accepted.size<7 && cursor<items.size) {
            val budget=((deadline-System.nanoTime())/1_000_000).coerceAtMost(3500)
            if(budget<=0)break
            val batch=items.drop(cursor).take(7-accepted.size)
            cursor+=batch.size
            accepted+=batch.map { card -> async {
                val checked=review(card,budget) ?: return@async null
                if(!checked.allowed)return@async null
                val full=checked.title?.let{Metadata.title(card.url,listOf(it))} ?: card.name
                val ready=if(card is MovieSearchResponse)card.copy(name=full) else card
                ImagePrefetch.warm(listOf(ready),0)
                ready
            }}.awaitAll().filterNotNull()
        }
        // Keep unreviewed cards below a fully checked prefix. Never shift one into the first seven.
        if(accepted.size>=7)accepted+items.drop(cursor) else accepted
    }
    private suspend fun prepareSearch(items:List<SearchResponse>):List<SearchResponse> = coroutineScope {
        val normalized = items.filter { ContentPolicy.accepts(it.name) }.map { normalizeCard(it) }
        val expanded = async {
            val deadline = System.nanoTime() + 3_000_000_000L
            normalized.filter { Metadata.isTruncatedTitle(it.name) && ContentPolicy.accepts(it.name) }
                .map { card -> async { videoKey(card.url) to expandTitle(card, deadline) } }.awaitAll().toMap()
        }
        val reviewed = previewSearch(normalized)
        val titles = expanded.await()
        reviewed.map { card ->
            val full=Metadata.title(card.url,listOf(card.name,titles[videoKey(card.url)].orEmpty()))
            if(card is MovieSearchResponse)card.copy(name=full) else card
        }
    }
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse = RequestLimits.required("Главная") {
        val result=source.getMainPage(page,request) ?: return@required newHomePageResponse(emptyList(),false)
        val rows=result.items.map{it.copy(list=withResolvedPosters(cards(it.list,prefetch=true)))}
        ImagePrefetch.warm(rows.flatMap{it.list})
        newHomePageResponse(rows,result.hasNext)
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    private suspend fun searchPage(items: List<SearchResponse>, page: Int, hasNext: Boolean): SearchResponseList {
        val minimum = (source as? SearchPolicy)?.minInitialSearchResults ?: 1
        if (minimum > 1 && page == 1 && items.size < minimum) {
            return newSearchResponseList(emptyList(), false)
        }
        ImagePrefetch.warm(items)
        return newSearchResponseList(items, hasNext)
    }
    private val searchHistory=java.util.Collections.synchronizedMap(BoundedMap<String,MutableMap<Int,Set<String>>>(32))
    override suspend fun search(query:String,page:Int):SearchResponseList = RequestLimits.required("Поиск") {
        if(!ContentPolicy.accepts(query))return@required newSearchResponseList(emptyList(),false)
        if(lang !in listOf("ru","en") || (source as? SearchPolicy)?.translateQueries==false) {
            val result=Translation.originalOnly{source.search(query,page)}?:return@required newSearchResponseList(emptyList(),false)
            val ready=withResolvedPosters(prepareSearch(result.items))
            return@required searchPage(ready, page, result.hasNext)
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
        val merged=responses.flatMap{it.items}.filter{ContentPolicy.accepts(it.name)}.distinctBy{videoKey(it.url)}
        val previous=synchronized(searchHistory){if(page==1)searchHistory[query]=mutableMapOf();searchHistory.getOrPut(query){mutableMapOf()}.filterKeys{it<page}.values.flatten().toSet()}
        val fresh=withResolvedPosters(prepareSearch(merged.filter{videoKey(it.url) !in previous}))
        synchronized(searchHistory){searchHistory.getOrPut(query){mutableMapOf()}[page]=fresh.map{videoKey(it.url)}.toSet()}
        searchPage(fresh, page, responses.any { it.hasNext })
    }
    override suspend fun load(url:String):LoadResponse = RequestLimits.required("Карточка") {
        val result=savedReview(url)?.detail ?: source.load(url) ?: throw ErrorLoadingException("Источник не вернул карточку")
        if(!ContentPolicy.accepts(result.name,result.tags.orEmpty()))throw ErrorLoadingException("Видео скрыто фильтром категорий")
        result.plot=Metadata.description(result.plot,result.name)
        result.tags=result.tags.orEmpty().mapNotNull(Metadata::tag).distinctBy{it.lowercase()}
        result.posterUrl=Metadata.choosePoster(url,result.posterUrl)
        if(result is MovieLoadResponse) {
            val headers = Network.imageHeaders(result.posterUrl, url) + result.posterHeaders.orEmpty()
            val provider = source as? PosterSource
            val poster = provider?.let {
                RequestLimits.optional(it.posterTimeoutMs) { it.resolvePoster(url, result.posterUrl, headers) }
            }
            result.posterHeaders = if (poster != null && poster != result.posterUrl) {
                result.posterUrl = Metadata.rememberPoster(url, poster)
                Network.replacementImageHeaders(poster, url, headers)
            } else headers
        }
        result.recommendations=withResolvedPosters(cards(result.recommendations.orEmpty(),prefetch=true))
        ImagePrefetch.warm(result.recommendations.orEmpty(),0)
        result
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean = RequestLimits.required("Плеер",45_000) {
        coroutineScope {
            val jobs=java.util.Collections.synchronizedList(mutableListOf<Job>())
            val count=java.util.concurrent.atomic.AtomicInteger()
            source.loadLinks(data,isCasting,subtitleCallback){link->
                jobs+=launch(start=CoroutineStart.UNDISPATCHED){
                    for(choice in QualityLinks.choices(link)){callback(choice);count.incrementAndGet()}
                }
            }
            jobs.toList().joinAll()
            count.get()>0
        }
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor?=source.getVideoInterceptor(extractorLink)
}
