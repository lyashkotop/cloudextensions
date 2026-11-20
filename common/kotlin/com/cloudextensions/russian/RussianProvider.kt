package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import java.net.URI
import java.util.Collections
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import org.jsoup.nodes.Document

/** Native Kotlin implementation shared by source profiles across all language groups. No legacy provider delegation. */
open class RussianProvider(val spec: SiteSpec): MainAPI(),SearchPolicy,SearchMetadataSource {
    override var name=spec.title
    override var mainUrl=spec.origin
    override var lang="ru"
    override val supportedTypes=setOf(TvType.NSFW)
    override val hasMainPage=true
    override val hasDownloadSupport=true
    override val hasQuickSearch=false
    override val mainPage get()=mainPageOf(*spec.sections.filter { ContentPolicy.accepts(it.name) }.map { it.path to it.name }.toTypedArray())
    private val homeCursors=Collections.synchronizedMap(BoundedMap<String,PageRequest>(256))
    private val homeFingerprints=Collections.synchronizedMap(BoundedMap<Pair<String,Int>,Set<String>>(256))
    private val searches=Collections.synchronizedMap(BoundedMap<String,SearchState>(24))
    private class SearchState {
        val created = System.nanoTime()
        val mutex = Mutex()
        val pages = mutableMapOf<Int, SearchResponseList>()
        val seen = mutableSetOf<String>()
        val fingerprints = mutableSetOf<Set<String>>()
        var next: PageRequest? = null
    }
    private data class SearchPage(val cards: List<VideoCard>, val next: PageRequest?)

    protected open suspend fun page(request: PageRequest): Document {
        val document=Network.page(request,"${mainUrl.trimEnd('/')}/")
        // Follow ordinary site redirects; never replace the provider with an unrelated host.
        val actual=URI(document.baseUri()); val host=actual.host.orEmpty()
        if(spec.id=="Huyamba" && Regex("(?i)(?:^|\\.)huyamba\\.(?:name|mobi)$").containsMatchIn(host))mainUrl="${actual.scheme}://$host"
        if(spec.id=="Ebalka" && host.matches(Regex("\\d*ebalka\\.ru\\.actor")))mainUrl="${actual.scheme}://$host"
        return document
    }
    private fun response(card: VideoCard): SearchResponse = newMovieSearchResponse(card.title,card.url,TvType.NSFW) {
        posterUrl=card.poster
        posterHeaders=Network.headers("${mainUrl.trimEnd('/')}/")
    }
    override suspend fun getMainPage(page: Int,request: MainPageRequest): HomePageResponse {
        require(page>=1)
        val key="${request.data}:$page"
        val route=if(page==1)PageRequest(absolute(mainUrl,request.data) ?: throw ErrorLoadingException("Некорректный адрес раздела")) else homeCursors[key]
            ?: return newHomePageResponse(HomePageList(request.name,emptyList(),true),false)
        val document=page(route)
        val cards=Metadata.cards(document,spec)
        val deduplicatePages = spec.id == "TubeBDSM" || spec.id == "HcBDSMX"
        val fingerprint=cards.map { videoKey(it.url) }.toSet()
        val (repeats, earlierCards) = synchronized(homeFingerprints) {
            val previous = homeFingerprints[request.data to (page - 1)]
            val earlier = if (deduplicatePages && page > 1) {
                homeFingerprints.entries.asSequence().filter { (key, _) ->
                    key.first == request.data && key.second < page
                }.flatMap { it.value.asSequence() }.toSet()
            } else emptySet()
            if (deduplicatePages && page == 1) homeFingerprints.keys.removeAll { it.first == request.data }
            homeFingerprints[request.data to page] = fingerprint
            (page > 1 && fingerprint.isNotEmpty() && fingerprint == previous) to earlier
        }
        val next=if(repeats)null else Pagination.next(document,route)?.takeUnless { it==route }
        if(next!=null)homeCursors["${request.data}:${page+1}"]=next else homeCursors.remove("${request.data}:${page+1}")
        val fresh = if (repeats) emptyList() else cards.filterNot { videoKey(it.url) in earlierCards }
        return newHomePageResponse(HomePageList(request.name,fresh.map(::response),true),next!=null)
    }
    override suspend fun search(query: String): List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query: String): List<SearchResponse> = search(query,1).items
    // This provider follows one upstream query. ReliableProvider merges the original and translated queries.
    override suspend fun search(query: String, page: Int): SearchResponseList {
        val term = Metadata.clean(query)
        if (term.isEmpty() || page < 1) return newSearchResponseList(emptyList(), false)
        val state = synchronized(searches) {
            val cached = searches[term]
            if (cached == null || page == 1 && System.nanoTime() - cached.created > 60_000_000_000L) {
                SearchState().also { searches[term] = it }
            } else cached
        }
        return state.mutex.withLock {
            state.pages[page]?.let { return@withLock it }
            // Walk the site's real cursors when CloudStream requests a later page first.
            for (number in (state.pages.size + 1)..page) {
                val route = if (number == 1) searchRequest(term) else state.next
                if (route == null) return@withLock newSearchResponseList(emptyList(), false)
                val result = fetchSearchPage(route)
                val fingerprint = result.cards.map { videoKey(it.url) }.toSet()
                val repeats = fingerprint.isNotEmpty() && !state.fingerprints.add(fingerprint)
                state.next = result.next.takeUnless { repeats }
                val fresh = if (repeats) emptyList() else result.cards.filter { state.seen.add(videoKey(it.url)) }
                state.pages[number] = newSearchResponseList(fresh.map(::response), state.next != null)
            }
            state.pages.getValue(page)
        }
    }

    private suspend fun searchRequest(term: String): PageRequest {
        Pagination.pathSearch(spec, mainUrl, term)?.let { return it }
        val root = page(PageRequest(mainUrl.trimEnd('/') + "/"))
        return Pagination.search(root, spec, mainUrl, term)
    }

    private suspend fun fetchSearchPage(route: PageRequest): SearchPage {
        val document = page(route.copy(allowNotFound = true))
        val empty = Metadata.emptySearch(document, route)
        val cards = Metadata.searchCards(document, spec, empty)
        val next = if (empty) null else Pagination.next(document, route)?.takeUnless { it == route }
        return SearchPage(cards, next)
    }

    override suspend fun fullTitle(url: String): String = searchMetadata(url, includeOriginal = false).title
    protected open fun readMetadata(document:Document):VideoDetail = Metadata.detail(document,spec)
    protected open suspend fun reviewMetadata(document: Document, detail: VideoDetail): VideoDetail = detail
    final override suspend fun searchMetadata(url: String): VideoDetail = searchMetadata(url, includeOriginal = true)

    private suspend fun searchMetadata(url: String, includeOriginal: Boolean): VideoDetail {
        val document=page(PageRequest(url))
        if(spec.id=="ThisVid" && document.selectFirst(".box ul.description")==null)throw ErrorLoadingException("Не удалось проверить категории ThisVid")
        val base = readMetadata(document)
        val meta = if (includeOriginal) reviewMetadata(document, base) else base
        val heading=document.selectFirst("h1")?.text().orEmpty()
        if(!ContentPolicy.accepts(heading,meta.tags + Metadata.cardTags(url)))throw ErrorLoadingException("Видео скрыто фильтром категорий")
        if(meta.title.isBlank())throw ErrorLoadingException("Название не получено")
        return meta
    }
    protected open suspend fun enrichMetadata(document: Document, detail: VideoDetail): VideoDetail = detail
    override suspend fun load(url: String): LoadResponse = loadDocument(url, page(PageRequest(url)))

    protected suspend fun loadDocument(url: String, document: Document): LoadResponse {
        val detail=enrichMetadata(document, readMetadata(document))
        if(detail.title.isBlank())throw ErrorLoadingException("На странице нет названия видео")
        if(!ContentPolicy.accepts(detail.title,detail.tags + Metadata.cardTags(url)))throw ErrorLoadingException("Видео скрыто фильтром категорий")
        val posterHeaders = Network.imageHeaders(detail.poster, mainUrl.trimEnd('/') + "/")
        if (this !is PosterSource) ImagePrefetch.warm(detail.poster, posterHeaders)
        val recommendations=RequestLimits.optional { related(document,detail,url) }.orEmpty()
        return newMovieLoadResponse(detail.title,url,TvType.NSFW,url) {
            posterUrl=detail.poster
            this.posterHeaders=posterHeaders
            plot=Metadata.plot(detail)
            tags=detail.tags
            year=detail.year
            this.recommendations=recommendations
            // No rounded minute value is reused as an exact duration.
            applyVideoDuration(detail.duration)
        }
    }
    protected open suspend fun related(document: Document,detail: VideoDetail,url: String): List<SearchResponse> {
        val result=LinkedHashMap<String,VideoCard>()
        fun add(cards: List<VideoCard>) { for(card in cards)if(videoKey(card.url)!=videoKey(url))if(!result.containsKey(videoKey(card.url)))result[videoKey(card.url)]=card }
        for(container in document.select(spec.related))add(Metadata.cards(container,spec))
        if(result.isEmpty()) {
            val endpoint=document.selectFirst("#related-videos[hx-get]")?.attr("hx-get")?.let { absolute(document.baseUri(),it) }
            if(endpoint!=null && URI(endpoint).host==URI(document.baseUri()).host) {
                try { add(Metadata.cards(page(PageRequest(endpoint)),spec)) }catch(e:CancellationException){throw e}catch(_:Exception){}
            }
        }
        if(result.isEmpty()) {
            // A real source search for one declared tag is the fallback. Never use unrelated trending cards.
            val tag=detail.tags.firstOrNull { ContentPolicy.accepts(it) }
            if(tag!=null)try { add(fetchSearchPage(searchRequest(tag)).cards) }catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        return result.values.map(::response)
    }
    override suspend fun loadLinks(data: String,isCasting: Boolean,subtitleCallback: (SubtitleFile)->Unit,callback: (ExtractorLink)->Unit): Boolean = Playback.links(name,mainUrl,data,subtitleCallback,callback)
}
