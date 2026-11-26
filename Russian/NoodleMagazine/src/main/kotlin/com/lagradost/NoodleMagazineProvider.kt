package com.lagradost

// Adapted from the Kotlin files supplied by the repository owner (package com.CXXX).
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import java.io.File
import java.net.URLEncoder
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.selects.select
import kotlinx.coroutines.withTimeoutOrNull
import okhttp3.Headers
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okhttp3.Interceptor
import org.jsoup.nodes.Document

class NoodleMagazineProvider(cacheDirectory: File?): MainAPI(),SearchPolicy,NoodlePosterSource {
    constructor() : this(ImagePrefetch.cacheDirectory())

    private val homeCache = cacheDirectory?.let { NoodleHomeCache(File(it, "noodle-home-v1")) }
    override val preferredTitleLanguage = "ru"
    override val reuseConfirmedPosters = true
    override val fastHomeCovers = true
    override var mainUrl="https://tyler-brown.com"
    override var name="Noodle Magazine"
    override var lang="ru"
    override val supportedTypes=setOf(TvType.NSFW)
    override val hasMainPage=true
    override val hasQuickSearch=false
    override val hasDownloadSupport=true
    private val streamsSection = "streams"
    private val streamQueryGroups = listOf(
        listOf("стрим вк", "перископ", "скайп"),
        listOf("стримы", "видеочат"),
    )
    override val mainPage = mainPageOf(
        "разделась" to "Разделась",
        streamsSection to "Стримы",
        "bdsm" to "БДСМ",
        "homemade" to "Домашнее",
        "рабыня" to "Рабыня",
        "spanking" to "Порка",
        "унижение" to "Унижение",
        "студентки" to "Студентки",
        "naked in public" to "На публике",
    )
    private val spec get()=SiteSpec("NoodleMagazine",name,mainUrl,"#list_videos div.item","a[href]","div.i_info div.title",emptyList(),tagSelector="#videoTagsBar a.vtag",descriptionSelector=".l_info .description",titleLanguage=preferredTitleLanguage)
    private val homeOrigin = "https://noodlemagazine.com"
    private val homeMirror = "https://hot.tyler-brown.com"
    @Volatile private var preferredHomeOrigin = homeOrigin
    private val catalogueHosts = setOf("noodlemagazine.com", "tyler-brown.com", "hot.tyler-brown.com")
    private val homePages = NoodleCatalogue()
    private val homeOrders = ConcurrentHashMap<String, List<Int>>()
    private val searchPages = NoodleCatalogue()
    private fun route(query:String,page:Int,origin:String=mainUrl)=PageRequest("$origin/video/"+URLEncoder.encode(query,"UTF-8").replace("+","%20")+"?p="+(page-1),allowNotFound=true)
    private fun referer(url: String): String {
        val address = url.toHttpUrlOrNull()
        return if (address != null && address.host in catalogueHosts) "${address.scheme}://${address.host}/"
        else "$mainUrl/"
    }

    private suspend fun document(request: PageRequest, home: Boolean = false): Document {
        val localized = request.copy(headers = mapOf("Cookie" to "ui_lang=ru", "Accept-Language" to Network.RUSSIAN_LANGUAGE))
        val referer = referer(request.url)
        return if (home) Network.cataloguePage(localized, referer) else Network.page(localized, referer)
    }
    private fun response(card:VideoCard):SearchResponse=newMovieSearchResponse(card.title,card.url,TvType.NSFW){posterUrl=card.poster;posterHeaders=Network.headers(referer(card.url))}
    private suspend fun results(query:String,page:Int):List<SearchResponse>{val request=route(query,page);return Metadata.searchCards(document(request),spec,request).map(::response)}
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse {
        val section = mainPage.firstOrNull { it.data == request.data }
        if (page < 1 || section == null) return newHomePageResponse(emptyList(), false)
        val streamQueries = if (section.data == streamsSection) {
            streamQueryGroups[(page - 1) % streamQueryGroups.size]
        } else emptyList()
        // Both groups use the same source page before advancing to the next one.
        val orderIndex = if (streamQueries.isEmpty()) page - 1 else (page - 1) / streamQueryGroups.size
        val cards = homePages.page(section.data, page) {
            val cached = if (page == 1 && !homeOrders.containsKey(section.data)) homeCache?.read(section.data) else null
            if (cached != null) {
                homeOrders[section.data] = listOf(cached.number) + (1..9).filter { it != cached.number }.shuffled()
                return@page cached.cards.map(::response)
            }
            val order = homeOrders.compute(section.data) { _, previous ->
                if (page != 1 && previous != null) previous
                else (1..9).shuffled().let {
                    if (it.first() == previous?.firstOrNull()) it.drop(1) + it.first() else it
                }
            }!!
            val sourcePage = order.getOrNull(orderIndex) ?: orderIndex + 1
            if (page != 1) return@page homeCards(section.data, sourcePage, streamQueries)
            val videos = if (sourcePage == 1) {
                homeCards(section.data, sourcePage, streamQueries)
            } else {
                RequestLimits.optional(8000) { homeCards(section.data, sourcePage, streamQueries) }.orEmpty()
            }
            if (videos.isNotEmpty() || sourcePage == 1) {
                homeCache?.write(section.data, sourcePage, videos)
                videos
            } else {
                // Recover when a random page has moved or is slow to respond.
                homeOrders[section.data] = listOf(1)
                homeCards(section.data, 1, streamQueries).also { homeCache?.write(section.data, 1, it) }
            }
        }
        return newHomePageResponse(section.name,cards,cards.isNotEmpty())
    }

    private suspend fun homeCards(category: String, page: Int, streamQueries: List<String>): List<SearchResponse> {
        if (streamQueries.isEmpty()) return homeTermCards(category, page)
        val cards = coroutineScope {
            streamQueries.map { query ->
                async { RequestLimits.optional(3000) { homeTermCards(query, page) }.orEmpty() }
            }.awaitAll().flatten()
        }
        return cards.ifEmpty { homeTermCards(streamQueries.first(), page) }
    }

    private suspend fun homeTermCards(category: String, page: Int): List<SearchResponse> = coroutineScope {
        suspend fun fetch(origin: String) =
            RequestLimits.optional(7000) { categoryCards(category, page, origin, home = true) }

        val preferred = preferredHomeOrigin
        val alternate = if (preferred == homeOrigin) homeMirror else homeOrigin
        val primary = async { fetch(preferred) }
        val mirror = async {
            // Hedge a stalled request, or try the mirror immediately after an empty response or error.
            val cards = withTimeoutOrNull(700) { primary.await() }
            if (cards.isNullOrEmpty()) fetch(alternate) else null
        }
        val (first, remaining, origin) = select {
            primary.onAwait { Triple(it, mirror, preferred) }
            mirror.onAwait { Triple(it, primary, alternate) }
        }
        if (!first.isNullOrEmpty()) {
            preferredHomeOrigin = origin
            remaining.cancel()
            return@coroutineScope first
        }
        val second = remaining.await()
        second?.takeIf { it.isNotEmpty() }?.also { preferredHomeOrigin = if (origin == preferred) alternate else preferred } ?: first ?: second
            ?: throw ErrorLoadingException("Noodle Magazine: каталог не ответил для раздела «$category»")
    }

    private suspend fun categoryCards(
        category: String, page: Int, origin: String = mainUrl, home: Boolean = false,
    ): List<SearchResponse> {
        val request = if (category.startsWith("/")) {
            val separator = if (category.contains('?')) "&" else "?"
            PageRequest("$origin$category${separator}p=${page - 1}", allowNotFound = true)
        } else route(category, page, origin)
        val pageDocument = document(request, home)
        if (home) {
            val expected = request.url.toHttpUrlOrNull() ?: return emptyList()
            val actual = pageDocument.baseUri().toHttpUrlOrNull() ?: return emptyList()
            if (expected.pathSegments.dropLastWhile { it.isEmpty() } != actual.pathSegments.dropLastWhile { it.isEmpty() } ||
                actual.host !in catalogueHosts
            ) throw ErrorLoadingException("Noodle Magazine: сайт перенаправил на другую страницу")
        }
        if (Metadata.emptySearch(pageDocument, request)) return emptyList()
        return Metadata.cards(pageDocument, spec, applyContentFilter = !home).map(::response)
    }

    override suspend fun searchCategoryPage(category: String, page: Int): SearchResponseList {
        val cards = categoryCards(category, page)
        return newSearchResponseList(cards, cards.isNotEmpty())
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun search(query:String,page:Int):SearchResponseList {
        val input=Metadata.clean(query)
        if(input.isBlank()||page<1)return newSearchResponseList(emptyList(),false)
        val fresh = searchPages.page(input, page) { results(input, page) }
        return newSearchResponseList(fresh, fresh.isNotEmpty())
    }
    override suspend fun posterPage(url: String): Document = document(PageRequest(url))

    override suspend fun fullTitle(url:String):String? = Metadata.detail(document(PageRequest(url)),spec).title
    override suspend fun load(url:String):LoadResponse {
        val page=document(PageRequest(url));val detail=Metadata.detail(page,spec)
        rememberNoodlePosters(url, page)
        if(detail.title.isBlank())throw ErrorLoadingException("Video title is missing")
        if(!ContentPolicy.accepts(detail.title,detail.tags))throw ErrorLoadingException("Video hidden by category filter")
        var related=NoodleCatalogue.distinct(Metadata.cards(page,spec.copy(cards="div.item")).map(::response), url)
        if(related.isEmpty())detail.tags.firstOrNull{ContentPolicy.accepts(it)}?.let{tag->
            try{related=NoodleCatalogue.distinct(RequestLimits.optional { results(tag, 1) }.orEmpty(), url)}catch(e:CancellationException){throw e}catch(_:Exception){}
        }
        return newMovieLoadResponse(detail.title,url,TvType.NSFW,url){
            score = VideoScores.detail("NoodleMagazine",url,page)
            posterUrl=detail.poster;posterHeaders=Network.headers(referer(url));plot=Metadata.plot(detail);tags=detail.tags;recommendations=related
            applyVideoDuration(detail.duration)
        }
    }
    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean = NoodlePlayback.links(name, document(PageRequest(data)), data, "", callback)

    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor=Interceptor{chain->
        val original=chain.request();val headers=Headers.Builder().add("User-Agent",NoodlePlayback.USER_AGENT)
        // Retain byte ranges for seeking while using the source's required player identity.
        for(name in listOf("Range","If-Range"))original.header(name)?.let{headers.add(name,it)}
        chain.proceed(original.newBuilder().headers(headers.build()).build())
    }
}
