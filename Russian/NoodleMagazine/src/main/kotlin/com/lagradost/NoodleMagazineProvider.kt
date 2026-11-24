package com.lagradost

// Adapted from the Kotlin files supplied by the repository owner (package com.CXXX).
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import java.net.URLEncoder
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.selects.select
import okhttp3.Headers
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okhttp3.Interceptor
import org.jsoup.nodes.Document

class NoodleMagazineProvider: MainAPI(),SearchPolicy,NoodlePosterSource {
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
        "homemade" to "Домашнее",
        "рабыня" to "Рабыня",
        "spanking" to "Порка",
        "студентки" to "Студентки",
        "naked in public" to "На публике",
    )
    private val spec get()=SiteSpec("NoodleMagazine",name,mainUrl,"#list_videos div.item","a[href]","div.i_info div.title",emptyList(),tagSelector="#videoTagsBar a.vtag",descriptionSelector=".l_info .description",titleLanguage=preferredTitleLanguage)
    private val homeOrigin = "https://noodlemagazine.com"
    private val homeMirror = "https://hot.tyler-brown.com"
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

    private suspend fun document(request: PageRequest) = Network.page(
        request.copy(headers = mapOf("Cookie" to "ui_lang=ru", "Accept-Language" to Network.RUSSIAN_LANGUAGE)),
        referer(request.url),
    )
    private fun response(card:VideoCard):SearchResponse=newMovieSearchResponse(card.title,card.url,TvType.NSFW){posterUrl=card.poster;posterHeaders=Network.headers(referer(card.url))}
    private suspend fun results(query:String,page:Int):List<SearchResponse>{val request=route(query,page);return Metadata.searchCards(document(request),spec,request).map(::response)}
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse {
        val section = mainPage.firstOrNull { it.data == request.data }
        if (page < 1 || section == null) return newHomePageResponse(emptyList(), false)
        val cards = homePages.page(section.data, page) {
            val order = homeOrders.compute(section.data) { _, previous ->
                if (page != 1 && previous != null) previous
                else (1..9).shuffled().let {
                    if (it.first() == previous?.firstOrNull()) it.drop(1) + it.first() else it
                }
            }!!
            val sourcePage = order.getOrNull(page - 1) ?: page
            if (page != 1 || sourcePage == 1) return@page homeCards(section.data, sourcePage)
            val videos = RequestLimits.optional(8000) { homeCards(section.data, sourcePage) }.orEmpty()
            if (videos.isNotEmpty()) videos else {
                // Recover when a random page has moved or is slow to respond.
                homeOrders[section.data] = listOf(1)
                homeCards(section.data, 1)
            }
        }
        return newHomePageResponse(section.name,cards,cards.isNotEmpty())
    }

    private suspend fun homeCards(category: String, page: Int): List<SearchResponse> = coroutineScope {
        suspend fun fetch(origin: String) =
            RequestLimits.optional(7000) { categoryCards(category, page, origin, requireSameRoute = true) }

        val primary = async { fetch(homeOrigin) }
        val mirror = async {
            delay(350)
            fetch(homeMirror)
        }
        val (first, remaining) = select {
            primary.onAwait { it to mirror }
            mirror.onAwait { it to primary }
        }
        if (!first.isNullOrEmpty()) {
            remaining.cancel()
            return@coroutineScope first
        }
        val second = remaining.await()
        second?.takeIf { it.isNotEmpty() } ?: first ?: second
            ?: throw ErrorLoadingException("Noodle Magazine: каталог не ответил для раздела «$category»")
    }

    private suspend fun categoryCards(
        category: String, page: Int, origin: String = mainUrl, requireSameRoute: Boolean = false,
    ): List<SearchResponse> {
        val request = if (category.startsWith("/")) {
            val separator = if (category.contains('?')) "&" else "?"
            PageRequest("$origin$category${separator}p=${page - 1}", allowNotFound = true)
        } else route(category, page, origin)
        val pageDocument = document(request)
        if (requireSameRoute) {
            val expected = request.url.toHttpUrlOrNull() ?: return emptyList()
            val actual = pageDocument.baseUri().toHttpUrlOrNull() ?: return emptyList()
            if (expected.pathSegments.dropLastWhile { it.isEmpty() } != actual.pathSegments.dropLastWhile { it.isEmpty() } ||
                actual.host !in catalogueHosts
            ) throw ErrorLoadingException("Noodle Magazine: сайт перенаправил на другую страницу")
        }
        return Metadata.searchCards(pageDocument, spec, request).map(::response)
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
