package com.cloudextensions.sites
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.ExtractorLinkType
import com.lagradost.cloudstream3.utils.newExtractorLink
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withTimeoutOrNull
import okhttp3.Interceptor
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import java.net.URI
import okhttp3.HttpUrl.Companion.toHttpUrl
import org.jsoup.nodes.Document
class TubeBDSMProvider: RussianProvider(SiteSpec(
 id="TubeBDSM",title="TubeBDSM",origin="https://www.tubebdsm.com",cards=".card.sub:has(img)",link="a.item-link[href]",titleSelector=".item-title,.title,h2,h3",titleLanguage="ru",searchMode="get",
 searchContainer="#content .content-block:has(> .cards-container)",
 sections=listOf(Section("New videos","/new"),Section("Popular videos","/popular"),Section("Top rated videos","/rating"))
)){
 override var lang="en"
 override val requiresListingReview = true
 override suspend fun searchRequest(term: String): PageRequest =
     PageRequest(mainUrl.toHttpUrl().newBuilder().encodedPath("/search/")
         .addQueryParameter("q", term).build().toString())

 override fun isSearchResult(document: Document, route: PageRequest): Boolean {
  val actual = document.baseUri().toHttpUrlOrNull() ?: return false
  if (!actual.encodedPath.split('/').contains("search")) return false
  val count = document.selectFirst("h1.content-header-title > span:last-child")?.text()
  return count?.replace(Regex("[^0-9]"), "")?.toLongOrNull()?.let { it > 0 } == true
 }
 private fun russian(request: PageRequest) =
  request.copy(headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE))
 private fun canonicalPartnerRequest(request: PageRequest): PageRequest {
  val target = Metadata.tubeOutboundDestination(request.url) ?: request.url.toHttpUrlOrNull()
  if (target?.host?.removePrefix("www.") != "fhgte.com" ||
      !target.encodedPath.matches(Regex("^/videos/[A-Za-z0-9]+/?$"))) return request
  // This public tracking domain redirects to the same video at the publisher's canonical host.
  return request.copy(url = target.newBuilder().scheme("https").host("faphouse.com").build().toString())
 }
 override suspend fun page(request:PageRequest):org.jsoup.nodes.Document {
  val document=super.page(russian(canonicalPartnerRequest(request)))
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
 private fun requirePublicVideo(document: Document) {
  if (PlayerConfig.requiresPaidAccess(document)) {
   throw ErrorLoadingException("FapHouse ограничил доступ к полной версии видео")
  }
 }
 override fun readMetadata(document: Document): VideoDetail {
  requirePublicVideo(document)
  return AggregatorPages.detail(document, spec)
 }
 override suspend fun load(url:String):LoadResponse {
  val page = super.page(russian(canonicalPartnerRequest(PageRequest(url))))
  var document = RequestLimits.optional(4200) { AbxxxMetadata.enrich(page, includeRelated = true) } ?: page
  val listingTitle = Metadata.title(url, emptyList(), language = spec.titleLanguage)
  if (readMetadata(document).title.isBlank() && Metadata.usableDetailTitle(listingTitle)) {
   document = document.clone().also { it.body().prependElement("h1").text(listingTitle) }
  }
  val listingPoster=Metadata.savedPoster(url)
  val result=loadDocument(url, document)
  val target=native(document.baseUri())
  val needsDetails = result.tags.isNullOrEmpty() || result.plot.isNullOrBlank() ||
   result.duration == null || result.recommendations.isNullOrEmpty()
  val extra=if(target==null || !needsDetails)null else try{withTimeoutOrNull(2300){target.load(document.baseUri())}}
   catch(e:CancellationException){throw e}catch(e:ErrorLoadingException){if(Regex("(?iu)скрыто фильтром|hidden by category filter|приватн|private video").containsMatchIn(e.message.orEmpty()))throw e else null}catch(_:Exception){null}
   catch(_:LinkageError){null}
  if(extra!=null){
   if(result.plot.isNullOrBlank())result.plot=Metadata.description(extra.plot,result.name)
   result.tags=(result.tags.orEmpty()+extra.tags.orEmpty()).distinctBy{it.lowercase()}
   if(result.duration==null)result.duration=extra.duration
   if(result.recommendations.isNullOrEmpty())result.recommendations=extra.recommendations
  }
  if (result.recommendations.isNullOrEmpty()) {
   result.recommendations = RequestLimits.optional(950) { relatedBySearch(result, url, document.baseUri()) }.orEmpty()
  }
  val fromListing=URI(url).host==URI(mainUrl).host && listingPoster!=null && result.posterUrl==listingPoster
  if(result is MovieLoadResponse)result.posterHeaders=Network.imageHeaders(result.posterUrl,if(fromListing)mainUrl else document.baseUri())
  return result
 }
 private suspend fun relatedBySearch(detail: LoadResponse, original: String, sourceUrl: String): List<SearchResponse> =
  coroutineScope {
   val current = setOf(Metadata.catalogueKey(spec.id, original), Metadata.catalogueKey(spec.id, sourceUrl))
   val terms = detail.tags.orEmpty().filter { ContentPolicy.accepts(it) }.distinctBy { it.lowercase() }.take(3)
    .ifEmpty { listOf(detail.name).filter { it.count(Char::isLetter) >= 8 && ContentPolicy.accepts(it) } }
   val matches = terms.map { term ->
    async { RequestLimits.optional(3500) { search(term, 1).items }.orEmpty() }
   }.awaitAll().flatten()
   matches.distinctBy { Metadata.catalogueKey(spec.id, it.url) }
    .filterNot { Metadata.catalogueKey(spec.id, it.url) in current }
    .take(24)
  }
 override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean {
  val request = russian(canonicalPartnerRequest(PageRequest(data)))
  val document = super.page(request)
  requirePublicVideo(document)
  if (URI(document.baseUri()).host?.removePrefix("www.") == "pawg.porn") {
   val stream = pawgStream(document) ?: return false
   callback(newExtractorLink(name, name, stream, ExtractorLinkType.M3U8) {
    referer = document.baseUri()
    headers = Network.headers(referer)
   })
   return true
  }
  val target=native(document.baseUri())
  val emitted=java.util.concurrent.atomic.AtomicInteger()
  if(target!=null)try{withTimeoutOrNull(12000){target.loadLinks(document.baseUri(),isCasting,subtitleCallback){link->
   target.getVideoInterceptor(link)?.let{interceptors[link.url]=it}
   callback(link);emitted.incrementAndGet()
   }}}catch(e:CancellationException){throw e}catch(_:Exception){}catch(_:LinkageError){}
  if(emitted.get()>0)return true
  return Playback.linksFromPage(name, mainUrl, request.url, document, PlayerConfig.sources(document), subtitleCallback, callback)
 }
 private fun pawgStream(page: Document): String? =
  page.select("#video .video-player-container video[src], #video .video-player-container video source[src]")
   .asSequence().mapNotNull { it.absUrl("src").toHttpUrlOrNull() }
   .firstOrNull {
    it.isHttps && it.host == "pawg.adultvideocdn.com" &&
     it.encodedPath.startsWith("/videos/") && it.encodedPath.endsWith(".m3u8", ignoreCase = true)
   }?.toString()
 override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor? = interceptors[extractorLink.url]
 override suspend fun related(document:org.jsoup.nodes.Document,detail:VideoDetail,url:String):List<com.lagradost.cloudstream3.SearchResponse> {
  val cards=AggregatorPages.related(document,spec)
  if(cards.isEmpty())return super.related(document,detail,url)
  return cards.map { card ->
   newMovieSearchResponse(card.title, card.url, TvType.NSFW) {
    posterUrl = card.poster
    posterHeaders = Network.imageHeaders(card.poster, document.baseUri())
   }
  }
 }
}
