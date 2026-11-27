package com.lagradost

// Adapted from the Kotlin files supplied by the repository owner (package com.CXXX).
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import java.io.File
import java.net.URLEncoder
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.selects.select
import kotlinx.coroutines.withTimeoutOrNull
import okhttp3.Headers
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okhttp3.Interceptor
import org.jsoup.nodes.Document

class NoodleMagazineProvider(cacheDirectory: File?): MainAPI(),SearchPolicy,NoodlePosterSource,SearchMetadataSource {
    constructor() : this(ImagePrefetch.cacheDirectory())

    private val descriptionFooter = Regex("""(?iu)(?:^|\s+)watch\s+sex\s+video\b.*?\bonline[.!…]?\s*$""")
    private val homeCache = cacheDirectory?.let { NoodleHomeCache(File(it, "noodle-home-v2")) }
    private val homeDetailPermits = Semaphore(4)
    private val homemade = "домашнее/сливы/настоящее"
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
    override val mainPage = mainPageOf(
        "разделась" to "Разделась",
        "bdsm" to "БДСМ",
        homemade to "Домашнее",
        "рабыня" to "Рабыня",
        "spanking" to "Порка",
        "унижение" to "Унижение",
        "заставил заставили" to "Заставили",
        "студентки" to "Студентки",
    )
    private val spec get()=SiteSpec("NoodleMagazine",name,mainUrl,"#list_videos div.item","a[href]","div.i_info div.title",emptyList(),tagSelector="#videoTagsBar a.vtag",descriptionSelector=".l_info .description",titleLanguage=preferredTitleLanguage)
    private val homeOrigin = "https://hot.tyler-brown.com"
    private val homeMirror = "https://noodlemagazine.com"
    @Volatile private var preferredHomeOrigin = homeOrigin
    private val catalogueHosts = setOf("noodlemagazine.com", "tyler-brown.com", "hot.tyler-brown.com")
    private val homePages = NoodleCatalogue()
    private val homeOrders = ConcurrentHashMap<String, List<Int>>()
    private val refreshScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val refreshing = ConcurrentHashMap.newKeySet<String>()
    private val refreshPermits = Semaphore(2)

    // Prepare a different page for the next visit without changing the current scroll order.
    private fun prepareNextVisit(section: String, shown: Int) {
        val cache = homeCache ?: return
        if (!refreshing.add(section)) return
        refreshScope.launch {
            try {
                delay(1000) // Give visible posters first use of the connection.
                refreshPermits.withPermit {
                    val next = (1..9).filter { it != shown }.random()
                    val cards = RequestLimits.optional(8000) { homeCards(section, next) }
                    if (!cards.isNullOrEmpty()) cache.write(section, next, reviewHomeCards(cards, 2000))
                }
            } finally {
                refreshing.remove(section)
            }
        }
    }

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
        val cards = homePages.page(section.data, page) {
            val cached = if (page == 1) homeCache?.read(section.data) else null
            if (cached != null) {
                homeOrders[section.data] = listOf(cached.number) + (1..9).filter { it != cached.number }.shuffled()
                prepareNextVisit(section.data, cached.number)
                return@page cached.cards.filter(::allowsHomeCard).map(::response)
            }
            val order = homeOrders.compute(section.data) { _, previous ->
                if (page != 1 && previous != null) previous
                else (1..9).shuffled().let {
                    if (it.first() == previous?.firstOrNull()) it.drop(1) + it.first() else it
                }
            }!!
            val sourcePage = order.getOrNull(page - 1) ?: page
            if (page != 1) return@page homeCards(section.data, sourcePage).map(::response)
            val videos = if (sourcePage == 1) {
                homeCards(section.data, sourcePage)
            } else {
                RequestLimits.optional(8000) { homeCards(section.data, sourcePage) }.orEmpty()
            }
            // Recover when a random page has moved or is slow to respond.
            val shownPage = if (videos.isEmpty() && sourcePage != 1) 1 else sourcePage
            if (shownPage != sourcePage) homeOrders[section.data] = listOf(1) + (2..9).shuffled()
            val listed = if (shownPage == sourcePage) videos else homeCards(section.data, shownPage)
            val reviewed = reviewHomeCards(listed, 1000)
            homeCache?.write(section.data, shownPage, reviewed)
            if (reviewed.isNotEmpty()) prepareNextVisit(section.data, shownPage)
            reviewed.map(::response)
        }
        return newHomePageResponse(section.name,cards,cards.isNotEmpty())
    }

    private fun allowsHomeCard(card: VideoCard): Boolean =
        ContentPolicy.accepts(card.title, card.tags, source = "NoodleMagazine")

    private suspend fun reviewHomeCards(cards: List<VideoCard>, budget: Long): List<VideoCard> = coroutineScope {
        if (cards.isEmpty()) return@coroutineScope cards
        val batch = cards.take(10).map { card ->
            async {
                val page = RequestLimits.optional(budget) {
                    homeDetailPermits.withPermit { document(PageRequest(card.url, allowNotFound = true)) }
                } ?: return@async card to false
                if (page.attr("data-response-code") in setOf("404", "410")) return@async null
                val detail = Metadata.detail(page, spec)
                if (detail.title.isBlank()) return@async card to false
                val tags = (card.tags + detail.tags).distinct()
                if (!ContentPolicy.accepts(detail.title, tags, detail.description, source = "NoodleMagazine")) {
                    null
                } else card.copy(title = detail.title, poster = card.poster ?: detail.poster, tags = tags) to true
            }
        }.awaitAll().filterNotNull()
        // Prioritize reviewed cards while keeping cards whose detail pages timed out.
        val (reviewed, unchecked) = batch.partition { it.second }
        (reviewed + unchecked).map { it.first } + cards.drop(10)
    }

    private suspend fun homeCards(category: String, page: Int): List<VideoCard> =
        if (category == homemade) groupedHomeCards(page) else homeCategoryCards(category, page).shuffled()

    private suspend fun groupedHomeCards(page: Int, home: Boolean = true): List<VideoCard> = coroutineScope {
        val sections = homemade.split('/')
        val feeds = sections.map { term ->
            async {
                RequestLimits.optional(if (home) 3500 else 6500) {
                    if (home) homeCategoryCards(term, page) else categoryCards(term, page)
                }
            }
        }.awaitAll()
        if (feeds.all { it == null }) throw ErrorLoadingException("Noodle Magazine: каталог не ответил для раздела «Домашнее»")
        // Round robin gives each of the three catalogues space at the start of the row.
        val shuffled = feeds.map { it.orEmpty().shuffled() }
        (0 until shuffled.maxOf { it.size }).flatMap { index -> shuffled.mapNotNull { it.getOrNull(index) } }
            .distinctBy { it.url.toHttpUrlOrNull()?.encodedPath ?: it.url }
    }

    private suspend fun homeCategoryCards(category: String, page: Int): List<VideoCard> = coroutineScope {
        suspend fun fetch(origin: String) =
            RequestLimits.optional(7000) { categoryCards(category, page, origin, home = true) }

        val preferred = preferredHomeOrigin
        val alternate = if (preferred == homeOrigin) homeMirror else homeOrigin
        val primary = async { fetch(preferred) }
        val mirror = async {
            // Hedge a stalled request or try the mirror after a transport failure.
            val cards = withTimeoutOrNull(700) { primary.await() }
            if (cards == null) fetch(alternate) else null
        }
        val (first, remaining, origin) = select {
            primary.onAwait { Triple(it, mirror, preferred) }
            mirror.onAwait { Triple(it, primary, alternate) }
        }
        if (first != null) {
            preferredHomeOrigin = origin
            remaining.cancel()
            return@coroutineScope first
        }
        val second = remaining.await()
        second?.also { preferredHomeOrigin = if (origin == preferred) alternate else preferred }
            ?: throw ErrorLoadingException("Noodle Magazine: каталог не ответил для раздела «$category»")
    }

    private suspend fun categoryCards(
        category: String, page: Int, origin: String = mainUrl, home: Boolean = false,
    ): List<VideoCard> {
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
        return Metadata.cards(pageDocument, spec)
    }

    override suspend fun searchCategoryPage(category: String, page: Int): SearchResponseList {
        val cards = if (category == homemade) groupedHomeCards(page, home = false) else categoryCards(category, page)
        return newSearchResponseList(cards.map(::response), cards.isNotEmpty())
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

    override suspend fun searchMetadata(url: String): VideoDetail = Metadata.detail(document(PageRequest(url)), spec)
    override suspend fun fullTitle(url:String):String? = searchMetadata(url).title
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
            posterUrl=detail.poster;posterHeaders=Network.headers(referer(url));plot=Metadata.plot(detail).replaceFirst(descriptionFooter, "").trimEnd();tags=detail.tags;recommendations=related
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
