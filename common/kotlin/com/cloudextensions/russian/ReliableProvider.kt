package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.Interceptor
import kotlinx.coroutines.CoroutineStart
import kotlinx.coroutines.launch
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope

private const val SEARCH_REVIEW_LIMIT = 10

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

    private suspend fun cards(items: List<SearchResponse>): List<SearchResponse> = coroutineScope {
        val deadline = System.nanoTime() + 3_000_000_000L
        val allowed = items.filter { ContentPolicy.accepts(it.name) }
        val posters = allowed.map { card -> normalizeCard(card, title = card.name) }
        if (source !is PosterSource) ImagePrefetch.warm(posters)
        val titles = allowed.map { card ->
            if (Metadata.isTruncatedTitle(card.name)) async { expandTitle(card, deadline) } else null
        }
        posters.mapIndexed { index, card ->
            val title = titles[index]?.await() ?: Metadata.title(card.url, listOf(card.name))
            if (card is MovieSearchResponse && title != card.name) card.copy(name = title) else card
        }
    }
    private val posterPermits = Semaphore(12)
    private data class PosterKey(val video: String, val poster: String?, val headers: Map<String, String>)
    private val resolvedPosters = java.util.Collections.synchronizedMap(BoundedMap<PosterKey, Pair<Long, String>>(256))

    private suspend fun resolvePoster(
        provider: PosterSource, url: String, poster: String?, headers: Map<String, String>,
    ): String? {
        val key = PosterKey(videoKey(url), poster, headers.toMap())
        resolvedPosters[key]?.takeIf { System.nanoTime() - it.first < 90_000_000_000L }?.let { return it.second }
        val resolved = RequestLimits.optional(provider.posterTimeoutMs) {
            posterPermits.withPermit { provider.resolvePoster(url, poster, headers) }
        }
        if (resolved != null && resolved != poster) resolvedPosters[key] = System.nanoTime() to resolved
        return resolved
    }

    private suspend fun withResolvedPosters(items: List<SearchResponse>): List<SearchResponse> = coroutineScope {
        val provider = source as? PosterSource ?: return@coroutineScope items
        items.mapIndexed { index, item -> async {
            if (item !is MovieSearchResponse) return@async item
            val headers = item.posterHeaders.orEmpty()
            val poster = resolvePoster(provider, item.url, item.posterUrl, headers)
            val ready = if (poster == null || poster == item.posterUrl) item else {
                Metadata.rememberPoster(item.url, poster)
                item.copy(posterUrl = poster, posterHeaders = Network.replacementImageHeaders(poster, item.url, headers))
            }
            if (index < 7) ImagePrefetch.warm(listOf(ready))
            ready
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
        while(accepted.size<SEARCH_REVIEW_LIMIT && cursor<items.size) {
            val budget=((deadline-System.nanoTime())/1_000_000).coerceAtMost(3500)
            if(budget<=0)break
            val batch=items.drop(cursor).take(SEARCH_REVIEW_LIMIT-accepted.size)
            cursor+=batch.size
            accepted+=batch.map { card -> async {
                val checked=review(card,budget) ?: return@async null
                if(!checked.allowed)return@async null
                val full=checked.title?.let{Metadata.title(card.url,listOf(it))} ?: card.name
                val ready=if(card is MovieSearchResponse)card.copy(name=full) else card
                if (source !is PosterSource) ImagePrefetch.warm(listOf(ready))
                ready
            }}.awaitAll().filterNotNull()
        }
        // Append unreviewed cards only after filling the checked prefix.
        if(accepted.size>=SEARCH_REVIEW_LIMIT)accepted+items.drop(cursor) else accepted
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
        val rows=result.items.map{it.copy(list=withResolvedPosters(cards(it.list)))}
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
            val result=source.search(query,page)?:return@required newSearchResponseList(emptyList(),false)
            val ready=withResolvedPosters(prepareSearch(result.items))
            return@required searchPage(ready, page, result.hasNext)
        }
        data class Batch(val response:SearchResponseList?,val error:Exception?=null)
        suspend fun branch(term:String):Batch=try{Batch(source.search(term,page))}catch(e:kotlinx.coroutines.CancellationException){throw e}catch(e:Exception){Batch(null,e)}
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
    override suspend fun load(url: String): LoadResponse = RequestLimits.required("Карточка") { loadCard(url) }

    private suspend fun loadCard(url: String): LoadResponse = coroutineScope {
        val result=savedReview(url)?.detail ?: source.load(url) ?: throw ErrorLoadingException("Источник не вернул карточку")
        if (!ContentPolicy.accepts(result.name, result.tags.orEmpty())) throw ErrorLoadingException("Видео скрыто фильтром категорий")
        val tagsSource = (source as? DetailTagSource) ?: (source as? AdaptedProvider)?.detailTagSource
        val missingTags = if (tagsSource != null && result.tags.isNullOrEmpty()) {
            async { RequestLimits.optional(5700) { tagsSource.missingTags(url) }.orEmpty() }
        } else null
        result.plot=Metadata.description(result.plot,result.name)
        result.posterUrl=Metadata.choosePoster(url,result.posterUrl)
        val initialRecommendations = result.recommendations.orEmpty()
        val recommendations = async { withResolvedPosters(cards(initialRecommendations)) }
        if(result is MovieLoadResponse) {
            val headers = Network.imageHeaders(result.posterUrl, url) + result.posterHeaders.orEmpty()
            val provider = source as? PosterSource
            val poster = provider?.let {
                resolvePoster(it, url, result.posterUrl, headers)
            }
            result.posterHeaders = if (poster != null && poster != result.posterUrl) {
                result.posterUrl = Metadata.rememberPoster(url, poster)
                Network.replacementImageHeaders(poster, url, headers)
            } else headers
            if (missingTags == null) ImagePrefetch.warm(result.posterUrl, result.posterHeaders.orEmpty())
        }
        val tags = missingTags?.await() ?: result.tags.orEmpty()
        if (missingTags != null) {
            if (!ContentPolicy.accepts(result.name, tags)) throw ErrorLoadingException("Видео скрыто фильтром категорий")
            if (result is MovieLoadResponse) ImagePrefetch.warm(result.posterUrl, result.posterHeaders.orEmpty())
        }
        result.tags = tags.mapNotNull(Metadata::tag).distinctBy { it.lowercase() }
        result.recommendations = recommendations.await()
        ImagePrefetch.warm(result.recommendations.orEmpty())
        result
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean = RequestLimits.required("Плеер",45_000) {
        val emitted = java.util.concurrent.atomic.AtomicBoolean()
        val rejected = java.util.concurrent.atomic.AtomicReference<Int>()
        coroutineScope {
            source.loadLinks(data, isCasting, subtitleCallback) { link ->
                launch(start = CoroutineStart.UNDISPATCHED) {
                    val interceptor = if (link.isM3u8) source.getVideoInterceptor(link) else null
                    val result = QualityLinks.select(link, interceptor)
                    result.rejectedStatus?.let { rejected.compareAndSet(null, it) }
                    for (choice in result.links) {
                        callback(choice)
                        emitted.set(true)
                    }
                }
            }
        }
        if (!emitted.get()) rejected.get()?.let { throw Playback.mediaError(it) }
        emitted.get()
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor?=source.getVideoInterceptor(extractorLink)
}
