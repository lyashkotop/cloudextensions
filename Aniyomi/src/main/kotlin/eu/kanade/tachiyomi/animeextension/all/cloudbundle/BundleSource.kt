package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import com.cloudextensions.russian.*
import eu.kanade.tachiyomi.animesource.AnimeSourceFactory
import eu.kanade.tachiyomi.animesource.model.*
import eu.kanade.tachiyomi.animesource.online.AnimeHttpSource
import kotlinx.coroutines.*
import okhttp3.Headers
import okhttp3.Request
import okhttp3.Response
import rx.Observable
import java.util.concurrent.TimeUnit

class BundleFactory:AnimeSourceFactory {
    override fun createSources()=Registry.profiles().map{BundleSource(it)}
}
@Suppress("OVERRIDE_DEPRECATION", "DEPRECATION")
class BundleSource(val profile:Profile):AnimeHttpSource() {
    override val name=(when(profile.lang){"ru"->"1. ";"ja"->"2. ";else->"3. "})+profile.name
    override val lang=profile.lang
    override val baseUrl=profile.base
    override val supportsLatest=Browse.supported(profile,false)
    override val client=network.cloudflareClient.newBuilder().connectTimeout(8,TimeUnit.SECONDS).readTimeout(12,TimeUnit.SECONDS).callTimeout(18,TimeUnit.SECONDS).build()
    private val engine=Engine(profile)
    init{Network.client=client;AndroidPlayer.attach(network)}
    override fun headersBuilder():Headers.Builder = super.headersBuilder().apply{profile.requestHeaders.forEach{(k,v)->set(k,v)}}
    private fun item(card:VideoCard)=SAnime.create().apply{url=card.url;title=card.title;thumbnail_url=card.poster;genre=card.tags.joinToString(", ");status=SAnime.COMPLETED}
    private fun results(result:Results)=AnimesPage(result.cards.map(::item),result.hasNext)
    override suspend fun getPopularAnime(page:Int)=withContext(Dispatchers.IO){withTimeout(20000){results(engine.browse(page,true))}}
    override suspend fun getLatestUpdates(page:Int)=withContext(Dispatchers.IO){withTimeout(20000){results(engine.browse(page,false))}}
    override suspend fun getSearchAnime(page:Int,query:String,filters:AnimeFilterList)=withContext(Dispatchers.IO){withTimeout(20000){results(engine.search(query,page,Filters.selection(filters)))}}
    override suspend fun getAnimeDetails(anime:SAnime)=withContext(Dispatchers.IO){
        val info=engine.detail(anime.url)
        SAnime.create().apply{url=anime.url;title=info.title;thumbnail_url=info.poster;description=if(profile.id=="UKDevilz")"" else info.description;genre=info.tags.joinToString(", ");status=SAnime.COMPLETED;initialized=true}
    }
    override suspend fun getEpisodeList(anime:SAnime)=listOf(SEpisode.create().apply{url=anime.url;name=anime.title;episode_number=1f})
    override suspend fun getVideoList(episode:SEpisode)=Streams.resolve(profile,episode.url).map{stream->
        val headers=Headers.Builder().apply{stream.headers.forEach{(k,v)->set(k,v)};set("Referer",stream.referer)}.build()
        Video(stream.url,stream.quality?.let{"${it}p"} ?: if(stream.hls)"Авто" else "Оригинал",stream.url,headers)
    }
    override fun getFilterList()=Filters.create(profile)
    // API 14 remains supported by current Aniyomi, including older clients using RxJava.
    private fun <T> observable(block:suspend ()->T):Observable<T> = Observable.create{subscriber->
        val job=CoroutineScope(Dispatchers.IO).launch {
            try{val result=block();if(!subscriber.isUnsubscribed){subscriber.onNext(result);subscriber.onCompleted()}}
            catch(e:TimeoutCancellationException){if(!subscriber.isUnsubscribed)subscriber.onError(java.io.IOException("Источник не ответил за 20 секунд",e))}
            catch(e:CancellationException){throw e}
            catch(e:Exception){if(!subscriber.isUnsubscribed)subscriber.onError(e)}
        }
        subscriber.add(rx.subscriptions.Subscriptions.create{job.cancel()})
    }
    override fun fetchPopularAnime(page:Int)=observable{getPopularAnime(page)}
    override fun fetchLatestUpdates(page:Int)=observable{getLatestUpdates(page)}
    override fun fetchSearchAnime(page:Int,query:String,filters:AnimeFilterList)=observable{getSearchAnime(page,query,filters)}
    override fun fetchAnimeDetails(anime:SAnime)=observable{getAnimeDetails(anime)}
    override fun fetchEpisodeList(anime:SAnime)=observable{getEpisodeList(anime)}
    override fun fetchVideoList(episode:SEpisode)=observable{getVideoList(episode)}
    override fun popularAnimeRequest(page:Int)=Request.Builder().url(baseUrl).build()
    override fun latestUpdatesRequest(page:Int)=popularAnimeRequest(page)
    override fun searchAnimeRequest(page:Int,query:String,filters:AnimeFilterList)=popularAnimeRequest(page)
    override fun popularAnimeParse(response:Response):AnimesPage=throw UnsupportedOperationException("Coroutine catalogue is used")
    override fun latestUpdatesParse(response:Response)=popularAnimeParse(response)
    override fun searchAnimeParse(response:Response)=popularAnimeParse(response)
    override fun animeDetailsParse(response:Response):SAnime=throw UnsupportedOperationException("Coroutine metadata is used")
    override fun episodeListParse(response:Response):List<SEpisode> = throw UnsupportedOperationException("One episode per source video")
}
