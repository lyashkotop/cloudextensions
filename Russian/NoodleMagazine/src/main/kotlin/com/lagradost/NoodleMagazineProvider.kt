package com.lagradost

// Adapted from the Kotlin files supplied by the repository owner (package com.CXXX).
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import java.net.URLEncoder
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.CancellationException
import okhttp3.Headers
import okhttp3.Interceptor
import org.jsoup.nodes.Document

class NoodleMagazineProvider: MainAPI(),SearchPolicy,NoodlePosterSource {
    override var mainUrl="https://tyler-brown.com"
    override var name="Noodle Magazine"
    override var lang="ru"
    override val supportedTypes=setOf(TvType.NSFW)
    override val hasMainPage=true
    override val hasQuickSearch=false
    override val hasDownloadSupport=true
    override val mainPage=mainPageOf(
        "/popular/month" to "Popular","/popular/trending" to "Trending",
        "bdsm" to "БДСМ","homemade" to "Домашнее","anal" to "Анал",
        "lesbian" to "Лесбиянки","spanking" to "Порка",
        "blonde" to "Blonde","milf" to "MILF"
    )
    private val spec get()=SiteSpec("NoodleMagazine",name,mainUrl,"#list_videos div.item","a[href]","div.i_info div.title",emptyList(),tagSelector="#videoTagsBar a.vtag",descriptionSelector=".l_info .description",titleLanguage="ru")
    private val homePages = NoodleCatalogue()
    private val homeOrders = ConcurrentHashMap<String, List<Int>>()
    private val searchPages = NoodleCatalogue()
    private fun route(query:String,page:Int)=PageRequest("$mainUrl/video/"+URLEncoder.encode(query,"UTF-8").replace("+","%20")+"?p="+(page-1),allowNotFound=true)
    private suspend fun document(request:PageRequest)=Network.page(request.copy(headers=mapOf("Cookie" to "ui_lang=ru","Accept-Language" to "ru-RU,ru;q=0.9")),"$mainUrl/")
    private fun response(card:VideoCard):SearchResponse=newMovieSearchResponse(card.title,card.url,TvType.NSFW){posterUrl=card.poster;posterHeaders=Network.headers("$mainUrl/")}
    private suspend fun results(query:String,page:Int):List<SearchResponse>{val request=route(query,page);return Metadata.searchCards(document(request),spec,request).map(::response)}
    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse {
        if(page<1)return newHomePageResponse(request.name,emptyList(),false)
        val cards = homePages.page(request.data, page) {
            // Even the shorter Trending catalogue has these first nine pages.
            val order = homeOrders.compute(request.data) { _, previous ->
                if (page != 1 && previous != null) previous
                else (1..9).shuffled().let {
                    if (it.first() == previous?.firstOrNull()) it.drop(1) + it.first() else it
                }
            }!!
            val sourcePage = order.getOrNull(page - 1) ?: page
            val videos = categoryCards(request.data, sourcePage)
            if (videos.isNotEmpty() || page != 1 || sourcePage == 1) videos
            else {
                // Recover when the source has shortened a category since the last refresh.
                homeOrders[request.data] = listOf(1)
                categoryCards(request.data, 1)
            }
        }
        return newHomePageResponse(request.name,cards,cards.isNotEmpty())
    }

    private suspend fun categoryCards(category: String, page: Int): List<SearchResponse> {
        if (!category.startsWith("/")) return results(category, page)
        val separator = if (category.contains('?')) "&" else "?"
        val request = PageRequest("$mainUrl$category${separator}p=${page - 1}", allowNotFound = true)
        return Metadata.searchCards(document(request), spec, request).map(::response)
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
            posterUrl=detail.poster;posterHeaders=Network.headers("$mainUrl/");plot=Metadata.plot(detail);tags=detail.tags;recommendations=related
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
