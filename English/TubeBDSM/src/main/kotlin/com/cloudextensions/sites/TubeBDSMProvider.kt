package com.cloudextensions.sites
import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.withTimeoutOrNull
import okhttp3.Interceptor
import java.net.URI
class TubeBDSMProvider: RussianProvider(SiteSpec(
 id="TubeBDSM",title="TubeBDSM",origin="https://www.tubebdsm.com",cards=".card.sub:has(img)",link="a.item-link[href]",titleSelector=".title,h2,h3",searchMode="get",
 sections=listOf(Section("New videos","/new"),Section("Popular videos","/popular"),Section("Top rated videos","/rating"))
)){
 override var lang="en"
 override suspend fun page(request:PageRequest):org.jsoup.nodes.Document {
  val document=super.page(request)
  return RequestLimits.optional(4500){AbxxxMetadata.enrich(document)} ?: document
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
  val document=page(PageRequest(url))
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
  val fromListing=URI(url).host==URI(mainUrl).host && listingPoster!=null && result.posterUrl==listingPoster
  if(result is MovieLoadResponse)result.posterHeaders=Network.imageHeaders(result.posterUrl,if(fromListing)mainUrl else document.baseUri())
  return result
 }
 override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean {
  val document=page(PageRequest(data))
  val target=native(document.baseUri())
  val emitted=java.util.concurrent.atomic.AtomicInteger()
  if(target!=null)try{withTimeoutOrNull(12000){target.loadLinks(document.baseUri(),isCasting,subtitleCallback){link->
   target.getVideoInterceptor(link)?.let{interceptors[link.url]=it}
   callback(link);emitted.incrementAndGet()
  }}}catch(e:CancellationException){throw e}catch(_:Exception){}
  if(emitted.get()>0)return true
  return Playback.linksFromPage(
   name, mainUrl, data, document, PlayerConfig.sources(document), subtitleCallback, callback
  )
 }
 override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor? = interceptors[extractorLink.url]
 override suspend fun related(document:org.jsoup.nodes.Document,detail:VideoDetail,url:String):List<com.lagradost.cloudstream3.SearchResponse> {
  val cards=AggregatorPages.related(document,spec)
  if(cards.isEmpty())return super.related(document,detail,url)
  return cards.map{card->newMovieSearchResponse(card.title,card.url,com.lagradost.cloudstream3.TvType.NSFW){posterUrl=card.poster;posterHeaders=Network.imageHeaders(card.poster,document.baseUri())}}
 }
}
