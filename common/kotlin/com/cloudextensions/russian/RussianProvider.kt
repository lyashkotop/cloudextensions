package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import java.net.URI
import java.util.Collections
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withTimeoutOrNull
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import org.jsoup.nodes.Document

/** Native Kotlin implementation shared by source profiles across all language groups. No legacy provider delegation. */
open class RussianProvider(val spec: SiteSpec): MainAPI(),SearchPolicy {
    override var name=spec.title
    override var mainUrl=spec.origin
    override var lang="ru"
    override val supportedTypes=setOf(TvType.NSFW)
    override val hasMainPage=true
    override val hasDownloadSupport=true
    override val hasQuickSearch=false
    override val mainPage get()=mainPageOf(*spec.sections.filter { ContentPolicy.accepts(it.name) }.map { it.path to it.name }.toTypedArray())
    private val homeCursors=Collections.synchronizedMap(BoundedMap<String,PageRequest>(256))
    private val homeFingerprints=Collections.synchronizedMap(BoundedMap<String,Set<String>>(256))
    private val searches=Collections.synchronizedMap(BoundedMap<String,SearchState>(24))
    private class Branch(val term: String) {
        val cursors=mutableMapOf<Int,PageRequest>()
        val fingerprints=mutableMapOf<Int,Set<String>>()
        var ended=false
    }
    private class SearchState {
        val created=System.nanoTime()
        val mutex=Mutex()
        val branches=mutableListOf<Branch>()
        val pages=mutableMapOf<Int,SearchResponseList>()
        val seen=mutableSetOf<String>()
        var initialized=false
    }
    private data class BranchResult(val branch: Branch,val cards: List<VideoCard>,val next: PageRequest?,val fingerprint: Set<String>,val error: Exception?=null)
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
        val fingerprint=cards.map { videoKey(it.url) }.toSet()
        val repeats=page>1 && fingerprint.isNotEmpty() && fingerprint==homeFingerprints["${request.data}:${page-1}"]
        val next=if(repeats)null else Pagination.next(document,route)?.takeUnless { it==route }
        if(next!=null)homeCursors["${request.data}:${page+1}"]=next else homeCursors.remove("${request.data}:${page+1}")
        homeFingerprints[key]=fingerprint
        return newHomePageResponse(HomePageList(request.name,if(repeats)emptyList() else cards.map(::response),true),next!=null)
    }
    override suspend fun search(query: String): List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query: String): List<SearchResponse> = search(query,1).items
    override suspend fun search(query: String,page: Int): SearchResponseList {
        val normalized=Metadata.clean(query)
        if(normalized.isEmpty() || page<1)return newSearchResponseList(emptyList(),false)
        val state=synchronized(searches){
            val previous=searches[normalized]
            if(previous==null || (page==1 && System.nanoTime()-previous.created>60_000_000_000L))SearchState().also { searches[normalized]=it } else previous
        }
        return state.mutex.withLock {
            state.pages[page]?.let { return@withLock it }
            if(!state.initialized) {
                // Start the original request before waiting for translation; merge in original-first order.
                val original=Branch(normalized);state.branches+=original
                val first=coroutineScope {
                    val first=async { branchPage(original,1) }
                    val second=async {
                        val term=if(translateQueries)withTimeoutOrNull(2500){Translation.translated(normalized)} else null
                        term?.takeUnless { it.equals(normalized,true) }?.let { translated -> Branch(translated).also { state.branches+=it } }?.let { branchPage(it,1) }
                    }
                    listOfNotNull(first.await(),second.await())
                }
                state.pages[1]=merged(state,first,1)
                state.initialized=true
            }
            if(page==1)return@withLock state.pages.getValue(1)
            // A direct request for a later page walks real source cursors, rather than inventing URLs.
            for(number in 2..page)if(!state.pages.containsKey(number)) {
                val batches=coroutineScope { state.branches.filter { !it.ended && it.cursors.containsKey(number) }.map { branch -> async { branchPage(branch,number) } }.map { it.await() } }
                state.pages[number]=merged(state,batches,number)
            }
            state.pages.getValue(page)
        }
    }
    private fun merged(state: SearchState,batches: List<BranchResult>,number: Int): SearchResponseList {
        if(batches.isNotEmpty() && batches.all { it.error!=null })throw batches.first().error!!
        val cards=mutableListOf<VideoCard>()
        for(batch in batches) {
            if(batch.error!=null)continue
            val repeated=batch.fingerprint.isNotEmpty() && batch.branch.fingerprints.values.any { it==batch.fingerprint }
            batch.branch.fingerprints[number]=batch.fingerprint
            val next=batch.next?.takeUnless { repeated }
            if(next!=null)batch.branch.cursors[number+1]=next else batch.branch.ended=true
            if(!repeated)for(card in batch.cards)if(state.seen.add(videoKey(card.url)))cards+=card
        }
        return newSearchResponseList(cards.map(::response),state.branches.any { !it.ended && it.cursors.containsKey(number+1) })
    }
    private suspend fun branchPage(branch: Branch,number: Int): BranchResult {
        return try {
            val route=if(number==1) {
                val root=page(PageRequest(mainUrl.trimEnd('/')+"/"))
                Pagination.search(root,spec,mainUrl,branch.term)
            } else branch.cursors[number] ?: return BranchResult(branch,emptyList(),null,emptySet())
            val document=page(route.copy(allowNotFound=true))
            val emptyNotice=Metadata.emptySearch(document,route)
            val cards=Metadata.searchCards(document,spec,route)
            BranchResult(branch,cards,if(emptyNotice)null else Pagination.next(document,route)?.takeUnless { it==route },cards.map { videoKey(it.url) }.toSet())
        }catch(e:CancellationException){throw e}catch(e:Exception){BranchResult(branch,emptyList(),null,emptySet(),e)}
    }
    override suspend fun fullTitle(url:String):String? = searchMetadata(url).title
    protected open fun readMetadata(document:Document):VideoDetail = Metadata.detail(document,spec)
    suspend fun searchMetadata(url:String):VideoDetail {
        val document=page(PageRequest(url))
        if(spec.id=="ThisVid" && document.selectFirst(".box ul.description")==null)throw ErrorLoadingException("Не удалось проверить категории ThisVid")
        val meta=readMetadata(document)
        val heading=document.selectFirst("h1")?.text().orEmpty()
        if(!ContentPolicy.accepts(heading,meta.tags))throw ErrorLoadingException("Видео скрыто фильтром категорий")
        if(meta.title.isBlank())throw ErrorLoadingException("Название не получено")
        return meta
    }
    override suspend fun load(url: String): LoadResponse {
        val document=page(PageRequest(url))
        val detail=DetailEnrichment.complete(document,spec,readMetadata(document))
        if(detail.title.isBlank())throw ErrorLoadingException("На странице нет названия видео")
        if(!ContentPolicy.accepts(detail.title,detail.tags))throw ErrorLoadingException("Видео скрыто фильтром категорий")
        val recommendations=RequestLimits.optional { related(document,detail,url) }.orEmpty()
        return newMovieLoadResponse(detail.title,url,TvType.NSFW,url) {
            posterUrl=detail.poster
            posterHeaders=Network.headers("${mainUrl.trimEnd('/')}/")
            plot=Metadata.plot(detail)
            tags=detail.tags
            year=detail.year
            this.recommendations=recommendations
            // No rounded minute value is reused as an exact duration.
            val parts=detail.duration.split(':');val seconds=parts.fold(0.0){total,value->total*60+(value.toDoubleOrNull()?:0.0)}
            if(seconds>0)duration=(seconds/60).toInt()
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
            if(tag!=null)try { add(branchPage(Branch(tag),1).cards) }catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        return result.values.map(::response)
    }
    override suspend fun loadLinks(data: String,isCasting: Boolean,subtitleCallback: (SubtitleFile)->Unit,callback: (ExtractorLink)->Unit): Boolean = Playback.links(name,mainUrl,data,subtitleCallback,callback)
}
