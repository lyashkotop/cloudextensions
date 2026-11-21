package com.cloudextensions.sites
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withTimeoutOrNull
import okhttp3.Interceptor
import java.net.URI
class TubeBDSMProvider: RussianProvider(SiteSpec(
 id="TubeBDSM",title="TubeBDSM",origin="https://www.tubebdsm.com",cards=".card.sub:has(img)",link="a.item-link[href]",titleSelector=".item-title,.title,h2,h3",titleLanguage="ru",searchMode="get",
 sections=listOf(Section("New videos","/new"),Section("Popular videos","/popular"),Section("Top rated videos","/rating"))
)){
 override var lang="en"
 private fun russian(request: PageRequest) =
  request.copy(headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE))
 override suspend fun page(request:PageRequest):org.jsoup.nodes.Document {
  val document=super.page(russian(request))
  return RequestLimits.optional(4500){AbxxxMetadata.enrich(document, includeRelated = false)} ?: document
 }
 private val interceptors=java.util.Collections.synchronizedMap(object:LinkedHashMap<String,Interceptor>(128,.75f,true){override fun removeEldestEntry(e:MutableMap.MutableEntry<String,Interceptor>?)=size>128})
 private fun native(url:String):MainAPI? = try {
  val host=URI(url).host.orEmpty().removePrefix("www.")
  if(host==URI(mainUrl).host.orEmpty().removePrefix("www."))null else {
   val api=APIHolder.getApiFromUrlNull(url) ?: APIHolder.getApiFromUrlNull(url.replace("://www.","://")) ?: APIHolder.getApiFromUrlNull(url.replaceFirst("://","://www."))
   api?.takeIf{URI(it.mainUrl).host.orEmpty().removePrefix("www.")==host}
  }
 }catch(_:Exception){null}catch(_:LinkageError){null}
 override fun readMetadata(document:org.jsoup.nodes.Document)=AggregatorPages.detail(document,spec)
 override suspend fun load(url:String):LoadResponse {
  val page = super.page(russian(PageRequest(url)))
  val document = RequestLimits.optional(4500) { AbxxxMetadata.enrich(page, includeRelated = true) } ?: page
  val listingPoster=Metadata.savedPoster(url)
  val result=loadDocument(url, document)
  val target=native(document.baseUri())
  val extra=if(target==null)null else try{withTimeoutOrNull(3000){target.load(document.baseUri())}}
   catch(e:CancellationException){throw e}catch(e:ErrorLoadingException){if(Regex("(?iu)скрыто фильтром|hidden by category filter|приватн|private video").containsMatchIn(e.message.orEmpty()))throw e else null}catch(_:Exception){null}
  if(extra!=null){
   if(result.plot.isNullOrBlank())result.plot=Metadata.description(extra.plot,result.name)
   result.tags=(result.tags.orEmpty()+extra.tags.orEmpty()).distinctBy{it.lowercase()}
   if(result.duration==null)result.duration=extra.duration
   if(result.recommendations.isNullOrEmpty())result.recommendations=extra.recommendations
  }
  if (result.recommendations.isNullOrEmpty()) {
   result.recommendations = relatedBySearch(result, url, document.baseUri())
  }
  val fromListing=URI(url).host==URI(mainUrl).host && listingPoster!=null && result.posterUrl==listingPoster
  if(result is MovieLoadResponse)result.posterHeaders=Network.imageHeaders(result.posterUrl,if(fromListing)mainUrl else document.baseUri())
  return result
 }
 private suspend fun relatedBySearch(detail: LoadResponse, original: String, sourceUrl: String): List<SearchResponse> =
  coroutineScope {
   val current = setOf(original.substringBefore('?').trimEnd('/'), sourceUrl.substringBefore('?').trimEnd('/'))
   val terms = detail.tags.orEmpty().filter { ContentPolicy.accepts(it) }.distinctBy { it.lowercase() }.take(3)
    .ifEmpty { listOf(detail.name).filter { it.count(Char::isLetter) >= 8 && ContentPolicy.accepts(it) } }
   val matches = terms.map { term ->
    async { RequestLimits.optional(3500) { search(term, 1).items }.orEmpty() }
   }.awaitAll().flatten()
   matches.distinctBy { it.url.substringBefore('?').trimEnd('/') }
    .filterNot { it.url.substringBefore('?').trimEnd('/') in current }
    .take(24)
  }
 override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean {
  val document=super.page(PageRequest(data))
  if (PlayerConfig.requiresPaidAccess(document)) {
   throw ErrorLoadingException("FapHouse ограничил доступ к полной версии видео")
  }
  val target=native(document.baseUri())
  val emitted=java.util.concurrent.atomic.AtomicInteger()
  if(target!=null)try{withTimeoutOrNull(12000){target.loadLinks(document.baseUri(),isCasting,subtitleCallback){link->
   target.getVideoInterceptor(link)?.let{interceptors[link.url]=it}
   callback(link);emitted.incrementAndGet()
  }}}catch(e:CancellationException){throw e}catch(_:Exception){}
  if(emitted.get()>0)return true
  return Playback.linksFromPage(name, mainUrl, data, document, PlayerConfig.sources(document), subtitleCallback, callback)
 }
 override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor? = interceptors[extractorLink.url]
 override suspend fun related(document:org.jsoup.nodes.Document,detail:VideoDetail,url:String):List<com.lagradost.cloudstream3.SearchResponse> {
  val cards=AggregatorPages.related(document,spec)
  if(cards.isEmpty())return super.related(document,detail,url)
  return cards.map{card->newMovieSearchResponse(card.title,card.url,com.lagradost.cloudstream3.TvType.NSFW){posterUrl=card.poster;posterHeaders=Network.imageHeaders(card.poster,document.baseUri())}}
 }
}
