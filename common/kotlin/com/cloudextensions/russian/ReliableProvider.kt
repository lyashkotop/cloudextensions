package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.Qualities
import okhttp3.Interceptor
import java.io.File
import java.net.URI
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.CoroutineStart
import kotlin.coroutines.coroutineContext
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.launch
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.selects.select
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.sync.withPermit
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeoutOrNull

private const val DETAIL_MAX_AGE_NANOS = 75_000_000_000L
private const val SEARCH_REVIEW_LIMIT = 7
private const val SEARCH_PAGE_MINIMUM = 4
private const val SEARCH_PAGE_SIZE = 20
private const val SEARCH_POSTER_COUNT = 3
private const val MAX_UPSTREAM_PAGES_PER_EXPANSION = 4
private const val SEARCH_REVIEW_BUDGET_MS = 1_600L
private const val REQUIRED_SEARCH_REVIEW_BUDGET_MS = 6_000L
private const val LISTING_TIMEOUT_MS = 22_000L
private const val RATING_REQUEST_TIMEOUT_MS = 6_500L
private const val FAST_LISTING_RATING_BUDGET_MS = 500L
private val slowFirstPageSources = setOf(
    "Vpoisk", "BoundHub", "ThisVid", "HcBDSMX", "XRares", "PornoRussia",
    "SickR", "Huyamba", "ProstoPorno",
)
private const val FIRST_PAGE_TARGET_MS = 3_000L
private const val FIRST_PAGE_MERGE_MS = 1_700L
private val uniqueResolutions = setOf("Beeg", "EPorner", "TubeBDSM")
private val tracksRemovedVideos = setOf("HcBDSMX", "HurtSex", "PornVideos", "TubeSafari")
private const val LISTING_COMPLETION_RESERVE_MS = 500L
private const val HOME_LOOKAHEAD_MS = 600L

/** UI request bounds and one real preview shared by the search and detail response. */
class ReliableProvider(
    private val source: MainAPI,
    private val ratingProfile: String? = (source as? RussianProvider)?.spec?.id,
): MainAPI() {
    override var name:String get()=source.name;set(value){source.name=value}
    override var mainUrl:String get()=source.mainUrl;set(value){source.mainUrl=value}
    override var lang:String get()=source.lang;set(value){source.lang=value}
    override val supportedTypes get()=source.supportedTypes
    override val hasMainPage get()=source.hasMainPage
    override val mainPage get()=source.mainPage
    override val hasQuickSearch get()=source.hasQuickSearch
    override val hasDownloadSupport get()=source.hasDownloadSupport
    override val hasChromecastSupport get()=source.hasChromecastSupport
    override val vpnStatus get()=source.vpnStatus
    private val titleLanguage get() = (source as? SearchPolicy)?.preferredTitleLanguage.orEmpty()
    private val titlePermits = Semaphore(4)
    private val requiresListingReview get() = (source as? SearchPolicy)?.requiresListingReview == true ||
        (source as? AdaptedProvider)?.requiresListingReview == true
    private val searchMetadataSource get() = source as? SearchMetadataSource ?: (source as? AdaptedProvider)?.searchMetadataSource

    private fun accepts(title: String, tags: List<String>, description: String? = null) =
        ContentPolicy.accepts(title, tags, description, ratingProfile)
    private val removedVideos = java.util.Collections.synchronizedMap(BoundedMap<String, Long>(128))

    private fun isAvailable(url: String): Boolean {
        val removedAt = removedVideos[videoKey(url)] ?: return true
        return System.nanoTime() - removedAt >= 300_000_000_000L
    }

    private fun isListable(url: String): Boolean = isAvailable(url) && savedReview(url)?.allowed != false

    private fun normalizeCard(
        card: SearchResponse,
        image: String? = card.posterUrl?.takeIf { it.startsWith("file:") }
            ?: Metadata.rememberPoster(card.url, card.posterUrl),
        title: String = Metadata.title(card.url, listOf(card.name), language = titleLanguage),
    ): SearchResponse {
        if (card !is MovieSearchResponse) return card
        val headers = if (image?.startsWith("file:") == true) emptyMap()
        else Network.imageHeaders(image, mainUrl.trimEnd('/') + "/") + card.posterHeaders.orEmpty()
        return card.copy(name = title, posterUrl = image, posterHeaders = headers)
    }

    private suspend fun expandTitle(card: SearchResponse, deadline: Long): String? = titlePermits.withPermit {
        val budget = minOf(2500L, ((deadline - System.nanoTime()) / 1_000_000).coerceAtLeast(1))
        RequestLimits.optional(budget) {
            if (source is SearchPolicy) source.fullTitle(card.url) else {
                val page = Network.page(PageRequest(card.url), mainUrl)
                Metadata.detail(page, SiteSpec("title", name, mainUrl, ".none", "a", "h1", emptyList())).title
            }
        }?.takeIf { it.isNotBlank() }
    }

    private suspend fun cards(items: List<SearchResponse>, expandTitles: Boolean = true): List<SearchResponse> = coroutineScope {
        val deadline = System.nanoTime() + 3_000_000_000L
        val allowed = items.filter { isListable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }
        val posters = allowed.map { card -> normalizeCard(card, title = card.name) }
        ImagePrefetch.warm(posters, priority = true)
        val titles = allowed.map { card ->
            if (expandTitles && Metadata.isTruncatedTitle(card.name)) async { expandTitle(card, deadline) } else null
        }
        posters.mapIndexedNotNull { index, card ->
            val expanded = titles[index]?.await()
            val title = Metadata.title(card.url, listOf(expanded ?: card.name), language = titleLanguage, fromDetail = expanded != null)
            if (!accepts(title, Metadata.cardTags(card.url))) return@mapIndexedNotNull null
            if (card is MovieSearchResponse && title != card.name) card.copy(name = title) else card
        }
    }
    private val posterPermits = Semaphore(12)
    private data class PosterKey(val video: String, val poster: String?, val headers: Map<String, String>)
    private val resolvedPosters = java.util.Collections.synchronizedMap(BoundedMap<PosterKey, Pair<Long, String>>(256))

    private fun cachedPoster(key: PosterKey): String? = resolvedPosters[key]?.takeIf {
        System.nanoTime() - it.first < 90_000_000_000L &&
            (!it.second.startsWith("file:") || runCatching { File(URI(it.second)).isFile }.getOrDefault(false))
    }?.second

    private suspend fun resolvePoster(
        provider: PosterSource, url: String, poster: String?, headers: Map<String, String>,
        home: Boolean = false, timeoutMs: Long = provider.posterTimeoutMs,
    ): String? {
        val key = PosterKey(videoKey(url), poster, headers.toMap())
        cachedPoster(key)?.let { return it }
        val resolved = RequestLimits.optional(timeoutMs) {
            posterPermits.withPermit {
                if (home) provider.resolveHomePoster(url, poster, headers) else provider.resolvePoster(url, poster, headers)
            }
        }
        if (resolved != null && resolved != poster) resolvedPosters[key] = System.nanoTime() to resolved
        return resolved
    }

    private val queuedHomePosters = ConcurrentHashMap.newKeySet<String>()
    private val pendingHomePosters by lazy {
        Channel<MovieSearchResponse>(48).also { queue ->
            val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO + Network.Background)
            repeat(2) {
                scope.launch {
                    val provider = source as? NoodlePosterSource ?: return@launch
                    for (card in queue) {
                        try {
                            val headers = card.posterHeaders.orEmpty()
                            val poster = resolvePoster(provider, card.url, card.posterUrl, headers)
                            if (poster != null && poster != card.posterUrl) {
                                Metadata.rememberPoster(card.url, poster)
                                ImagePrefetch.warm(poster, resolvedPosterHeaders(poster, card.url, headers))
                            }
                        } catch (_: LinkageError) {
                        } finally {
                            queuedHomePosters.remove(videoKey(card.url))
                        }
                    }
                }
            }
        }
    }

    private fun queueHomePoster(card: MovieSearchResponse) {
        if (source !is NoodlePosterSource) return
        val key = videoKey(card.url)
        if (queuedHomePosters.add(key) && pendingHomePosters.trySend(card).isFailure) {
            queuedHomePosters.remove(key)
        }
    }

    private fun resolvedPosterHeaders(poster: String, url: String, headers: Map<String, String>): Map<String, String> =
        if (poster.startsWith("file:")) emptyMap() else Network.replacementImageHeaders(poster, url, headers)

    private fun fastHomeCards(items: List<SearchResponse>): List<SearchResponse> = items.mapIndexed { index, card ->
        if (card !is MovieSearchResponse) return@mapIndexed card
        val headers = card.posterHeaders.orEmpty()
        val original = card.posterUrl
        val resolved = cachedPoster(PosterKey(videoKey(card.url), original, headers))
        if (resolved != null && resolved != original) {
            cachedScore(card.copy(posterUrl = resolved, posterHeaders = resolvedPosterHeaders(resolved, card.url, headers)))
        } else {
            if (original.isNullOrBlank() || (index < 3 && !PosterRequests.confirmed(original, headers)) ||
                PosterRequests.knownUnavailable(original, headers)
            ) {
                queueHomePoster(card)
            }
            cachedScore(card)
        }
    }

    private suspend fun repairSearchPoster(card: MovieSearchResponse): MovieSearchResponse {
        val provider = source as? PosterSource ?: return SearchPosters.repairFromDetail(card)
        val headers = card.posterHeaders.orEmpty()
        val poster = resolvePoster(provider, card.url, card.posterUrl, headers)
        if (poster == null || poster == card.posterUrl) return SearchPosters.repairFromDetail(card)
        Metadata.rememberPoster(card.url, poster)
        return card.copy(posterUrl = poster, posterHeaders = resolvedPosterHeaders(poster, card.url, headers))
    }

    private fun cachedSearchPoster(item: SearchResponse): SearchResponse {
        if (source !is NoodlePosterSource || item !is MovieSearchResponse) return item
        val headers = item.posterHeaders.orEmpty()
        val image = cachedPoster(PosterKey(videoKey(item.url), item.posterUrl, headers))
            ?: StoryboardPosters.cached(item.url) ?: return item
        return item.copy(posterUrl = image, posterHeaders = resolvedPosterHeaders(image, item.url, headers))
    }

    private suspend fun withResolvedPosters(
        items: List<SearchResponse>, missingOnly: Boolean = false, home: Boolean = false,
    ): List<SearchResponse> = coroutineScope {
        val provider = source as? PosterSource ?: return@coroutineScope items
        items.mapIndexed { index, item -> async {
            if (item !is MovieSearchResponse || (missingOnly && !item.posterUrl.isNullOrBlank())) return@async item
            val headers = item.posterHeaders.orEmpty()
            val original = item.posterUrl
            val poster = if (provider.reuseConfirmedPosters && original != null && PosterRequests.confirmed(original, headers)) {
                original
            } else {
                resolvePoster(provider, item.url, original, headers, home)
            }
            val ready = if (poster == null || poster == item.posterUrl) item else {
                Metadata.rememberPoster(item.url, poster)
                item.copy(posterUrl = poster, posterHeaders = resolvedPosterHeaders(poster, item.url, headers))
            }
            if (index < 3) ImagePrefetch.warm(listOf(ready), priority = true)
            ready
        } }.awaitAll()
    }
    private data class Review(val allowed:Boolean,val detail:LoadResponse?,val title:String?=detail?.name)
    private val reviews=java.util.Collections.synchronizedMap(BoundedMap<String,Pair<Long,Review>>(128))
    private val reviewPermits = Semaphore(if (requiresListingReview) 6 else 4)
    private fun savedReview(url: String, maxAgeNanos: Long = 300_000_000_000L): Review? =
        reviews[videoKey(url)]?.takeIf { System.nanoTime() - it.first < maxAgeNanos }?.second
    private fun remainingMillis(deadline: Long) = (deadline - System.nanoTime()) / 1_000_000

    private suspend fun review(card: SearchResponse, deadline: Long, maxAgeNanos: Long = 300_000_000_000L): Review? {
        savedReview(card.url, maxAgeNanos)?.let { return it }
        val result = RequestLimits.optional(remainingMillis(deadline)) {
            reviewPermits.withPermit {
                savedReview(card.url, maxAgeNanos)?.let { return@withPermit it }
                val budget = minOf(3500L, remainingMillis(deadline))
                RequestLimits.optional(budget) {
                    try {
                        val reader = searchMetadataSource
                        if (reader != null) {
                            val meta = reader.searchMetadata(card.url)
                            Review(accepts(meta.title, meta.tags + Metadata.cardTags(card.url), meta.description), null, meta.title)
                        } else {
                            val detail = source.load(card.url) ?: return@optional null
                            Review(accepts(detail.name, detail.tags.orEmpty() + Metadata.cardTags(card.url), detail.plot), detail)
                        }
                    } catch (e: ErrorLoadingException) {
                        if (excludedDetails.containsMatchIn(e.message.orEmpty())) Review(false, null) else null
                    }
                }
            }
        } ?: return null
        reviews[videoKey(card.url)] = System.nanoTime() to result
        return result
    }

    private val excludedDetails = Regex("(?iu)hidden by category filter|скрыто фильтром|приватн|private video|видео удалено или недоступно")

    private suspend fun reviewedCards(
        items: List<SearchResponse>, deadline: Long, early: Map<String, Deferred<Review?>> = emptyMap(),
        returnAfter: Int = Int.MAX_VALUE,
    ): List<SearchResponse> = coroutineScope {
        suspend fun checked(card: SearchResponse): SearchResponse? {
            val prechecked = early[videoKey(card.url)]?.let { task ->
                RequestLimits.optional(remainingMillis(deadline)) { task.await() }
            }
            val approved = (prechecked ?: review(card, deadline))?.takeIf { it.allowed } ?: return null
            val full = approved.title?.let {
                Metadata.title(card.url, listOf(it), language = titleLanguage, fromDetail = true)
            } ?: card.name
            return if (card is MovieSearchResponse) card.copy(name = full) else card
        }

        if (items.size <= returnAfter) return@coroutineScope items.map { card ->
            async { checked(card) }
        }.awaitAll().filterNotNull()

        val completed = Channel<Pair<Int, SearchResponse?>>(items.size)
        val checks = items.mapIndexed { index, card -> launch { completed.send(index to checked(card)) } }
        val accepted = sortedMapOf<Int, SearchResponse>()
        var remaining = items.size
        suspend fun collect() {
            val (index, card) = completed.receive()
            if (card != null) accepted[index] = card
            remaining--
        }
        try {
            while (remaining > 0 && accepted.size < returnAfter) collect()
            withTimeoutOrNull(300) { while (remaining > 0) collect() }
            accepted.values.toList()
        } finally {
            checks.forEach { it.cancel() }
        }
    }

    private suspend fun previewSearch(
        items: List<SearchResponse>, deadline: Long, early: Map<String, Deferred<Review?>>,
    ): List<SearchResponse> {
        val accepted = mutableListOf<SearchResponse>()
        var cursor = 0
        while (accepted.size < SEARCH_REVIEW_LIMIT && cursor < items.size && remainingMillis(deadline) > 0) {
            val end = minOf(items.size, cursor + SEARCH_REVIEW_LIMIT - accepted.size)
            val candidates = items.subList(cursor, end)
            val checked = reviewedCards(candidates, deadline, early)
            if (remainingMillis(deadline) <= 0) {
                // A slow secondary metadata request cannot erase otherwise valid listing results.
                val byKey = checked.associateBy(::searchKey)
                accepted += candidates.mapNotNull { byKey[searchKey(it)] ?: it.takeIf { isListable(it.url) } }
            } else accepted += checked
            cursor = end
        }
        return accepted + items.drop(cursor).filter { isListable(it.url) }
    }

    private suspend fun prepareSearch(
        items: List<SearchResponse>, deadline: Long, reviewRank: Map<String, Int>, early: Map<String, Deferred<Review?>>,
        firstPage: Boolean,
    ): List<SearchResponse> = coroutineScope {
        val normalized = items.filter { isListable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }.map { normalizeCard(it) }
        ImagePrefetch.warm(normalized, priority = true)
        val reviewed = withContext(Network.CacheDetail) {
            if (!requiresListingReview) previewSearch(normalized, deadline, early)
            else {
                // Share detail checks across languages and return the verified cards in site order.
                val queue = if (reviewRank.isEmpty()) normalized else normalized.sortedBy { reviewRank[searchKey(it)] ?: Int.MAX_VALUE }
                val target = if (firstPage && ratingProfile != null) 6 else Int.MAX_VALUE
                val accepted = reviewedCards(queue, deadline, early, returnAfter = target).associateBy(::searchKey)
                normalized.mapNotNull { accepted[searchKey(it)] }
            }
        }
        reviewed.map { card ->
            async {
                if (card !is MovieSearchResponse || !Metadata.isTruncatedTitle(card.name)) return@async card
                val title = RequestLimits.optional(remainingMillis(deadline)) { expandTitle(card, deadline) }
                if (title == null) card
                else if (!accepts(title, Metadata.cardTags(card.url))) null
                else card.copy(name = Metadata.title(card.url, listOf(title), language = titleLanguage, fromDetail = true))
            }
        }.awaitAll().filterNotNull()
    }
    private val ratingPermits = Semaphore(4)
    private val listingScoreSource = (source as? ListingScoreSource) ?: (source as? AdaptedProvider)?.listingScoreSource
    private val queuedRatings = ConcurrentHashMap.newKeySet<String>()
    private val unrated = java.util.Collections.synchronizedMap(BoundedMap<String, Long>(512))
    private val pendingRatings by lazy {
        Channel<String>(6).also { queue ->
            val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO + Network.Background)
            scope.launch {
                val profile = ratingProfile ?: return@launch
                for (url in queue) {
                    try { readCardScore(profile, url) }
                    catch (_: LinkageError) {}
                    finally { queuedRatings.remove(url) }
                }
            }
        }
    }

    private fun cachedScore(card: SearchResponse): SearchResponse {
        if (card !is MovieSearchResponse || card.score != null) return card
        val profile = ratingProfile ?: return card
        val score = VideoScores.cachedDetail(profile, card.url) ?: return card
        return card.copy(score = score)
    }

    private fun recentlyUnrated(url: String): Boolean =
        unrated[url]?.let { System.nanoTime() - it < 60_000_000_000L } == true

    private suspend fun readCardScore(profile: String, url: String): Score? =
        VideoScores.cachedDetail(profile, url) ?: ratingPermits.withPermit {
            if (recentlyUnrated(url)) return@withPermit null
            VideoScores.cachedDetail(profile, url) ?: RequestLimits.optional(RATING_REQUEST_TIMEOUT_MS) {
                when (source) {
                    is RussianProvider -> source.readListingScore(url)
                    is NoodlePosterSource -> VideoScores.detail(profile, url, source.posterPage(url))
                    else -> if (listingScoreSource != null) listingScoreSource.readListingScore(url)
                    else VideoScores.detail(profile, url, Network.page(PageRequest(url), mainUrl))
                }.also { score ->
                    if (score != null) VideoScores.rememberDetail(profile, url, score)
                    else unrated[url] = System.nanoTime()
                }
            }
        }

    private suspend fun listingScores(items: List<SearchResponse>, deadline: Long): Array<Score?> {
        val scores = arrayOfNulls<Score>(items.size)
        val profile = ratingProfile?.takeIf(VideoScores::loadsListingScores) ?: return scores
        if (lang == "ru") return scores
        val missing = items.indices.filter { index ->
            val card = items[index]
            if (card !is MovieSearchResponse || card.score != null) return@filter false
            val cached = VideoScores.cachedDetail(profile, card.url)
            scores[index] = cached
            cached == null && !recentlyUnrated(card.url)
        }
        val remaining = minOf(
            (deadline - System.nanoTime()) / 1_000_000L - LISTING_COMPLETION_RESERVE_MS,
            FAST_LISTING_RATING_BUDGET_MS,
        )
        val priority = missing.take(SEARCH_POSTER_COUNT)
        if (remaining > 0 && priority.isNotEmpty()) withTimeoutOrNull(remaining) {
            coroutineScope {
                priority.forEach { index ->
                    launch { scores[index] = readCardScore(profile, items[index].url) }
                }
            }
        }
        for (index in priority) {
            val url = items[index].url
            if (scores[index] == null && !recentlyUnrated(url) && queuedRatings.add(url)) {
                if (pendingRatings.trySend(url).isFailure) queuedRatings.remove(url)
            }
        }
        return scores
    }

    private suspend fun prepareListing(
        items: List<SearchResponse>, deadline: Long, home: Boolean = false, missingPostersOnly: Boolean = false,
    ): List<SearchResponse> = coroutineScope {
        ImagePrefetch.warm(items, priority = true)
        val ratings = async { listingScores(items, deadline) }
        val posters = withResolvedPosters(items, missingOnly = missingPostersOnly, home = home)
        val scores = ratings.await()
        posters.mapIndexed { index, poster ->
            val score = scores[index]
            if (poster is MovieSearchResponse && score != null && poster.score == null) poster.copy(score = score)
            else cachedScore(poster)
        }
    }

    private val randomHome = RandomHome(::searchKey)

    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse = RequestLimits.required("Главная", LISTING_TIMEOUT_MS) {
        val deadline = System.nanoTime() + LISTING_TIMEOUT_MS * 1_000_000L
        val fastHome = (source as? NoodlePosterSource)?.fastHomeCovers == true
        val result = randomHome.page(page, request, ratingProfile == "NoodleMagazine", if (ratingProfile == "TubeSafari") 0 else HOME_LOOKAHEAD_MS) { number ->
            source.getMainPage(number, request)
        } ?: return@required newHomePageResponse(emptyList(), false)
        val rows = coroutineScope {
            result.items.map { row ->
                async {
                    if (fastHome) {
                        val catalogue = row.list.filter { isListable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }
                            .map { normalizeCard(it) }
                        val ready = fastHomeCards(catalogue)
                        ImagePrefetch.warm(ready, priority = true)
                        return@async row.copy(list = ready)
                    }
                    val visible = cards(row.list, expandTitles = !requiresListingReview)
                    val checked = if (requiresListingReview) {
                        val reviewDeadline = deadline - 6_000_000_000L
                        when (ratingProfile) {
                            "TubeSafari" -> {
                                val first = reviewedCards(visible.take(6), reviewDeadline)
                                first.ifEmpty { reviewedCards(visible.drop(6).take(12), reviewDeadline, returnAfter = 3) }
                            }
                            "HurtSex", "PornVideos", "RoughXXXTube" ->
                                reviewedCards(visible.take(20), reviewDeadline, returnAfter = 6)
                            else -> reviewedCards(visible, reviewDeadline)
                        }
                    } else visible
                    row.copy(list = prepareListing(checked, deadline, home = true))
                }
            }.awaitAll()
        }
        val listed = rows.flatMap { it.list }
        ImagePrefetch.warm(listed.drop(3))
        val visibleRows = if (ratingProfile == "TubeSafari") rows.filter { it.list.isNotEmpty() } else rows
        newHomePageResponse(visibleRows, result.hasNext)
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    private data class FirstSearchBatch(val response: SearchResponseList, val complete: Boolean = true)
    private data class SearchCandidates(
        val cards: List<SearchResponse>,
        val reviewRank: Map<String, Int>,
        val retried: Set<String> = emptySet(),
    )
    private data class SavedSearchPage(
        val response: SearchResponseList,
        val nextSourcePage: Int,
        val canFetch: Boolean,
        val pending: SearchCandidates?,
    )
    private class SearchHistory {
        val mutex = Mutex()
        @Volatile var reuseFirstUntil = System.nanoTime() + LISTING_TIMEOUT_MS * 1_000_000L
        val pages = mutableMapOf<Int, SavedSearchPage>()
        var reviewRank: Map<String, Int> = emptyMap()
        var taxonomy: List<Section>? = null
        val taxonomyEnds = mutableMapOf<String, Int>()
        val aliasEnds = mutableMapOf<String, Int>()
    }
    private val searchHistory = BoundedMap<String, SearchHistory>(32)

    private fun searchKey(card: SearchResponse): String =
        if (source is NoodlePosterSource && (source as? SearchPolicy)?.translateQueries == true) NoodleCatalogue.identity(card.url)
        else Metadata.streakReuploadKey(card.url) ?: Metadata.catalogueKey(ratingProfile, card.url)

    private suspend fun upstreamSearch(
        query: String, page: Int, history: SearchHistory, aliases: Set<String>,
        onListing: (SearchResponseList, Boolean) -> Unit,
    ): SearchResponseList {
        if (aliases.isEmpty() && ((source as? SearchPolicy)?.translateQueries == false ||
            (source as? AdaptedProvider)?.translateQueries == false)) {
            return (source.search(query, page) ?: newSearchResponseList(emptyList(), false)).also { onListing(it, true) }
        }
        data class Batch(val response: SearchResponseList?, val error: Exception? = null)
        suspend fun branch(term: String): Batch = try {
            val response = source.search(term, page)
            if (response != null) {
                onListing(response, term == query)
                val first = response.items.asSequence()
                    .filter { isListable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }
                    .take(3).map { normalizeCard(it, title = it.name) }.toList()
                ImagePrefetch.warm(first, priority = true)
            }
            Batch(response)
        } catch (e: kotlinx.coroutines.CancellationException) {
            throw e
        } catch (e: Exception) {
            Batch(null, e)
        }
        val russianOnly = (source as? SearchPolicy)?.russianTitlesOnly == true
        val forms = aliases.ifEmpty { Translation.searchForms(query) }.filterNot {
            (russianOnly && Translation.target(it) == "ru") ||
                (lang == "ru" && Translation.target(query) == "ru" && Translation.target(it) == "en")
        }
        val skipTranslation = (lang == "ru" && Translation.target(query) == "ru") ||
            (russianOnly && Translation.target(query) == "en")
        if (forms.isEmpty() && skipTranslation) {
            return (source.search(query, page) ?: newSearchResponseList(emptyList(), false)).also { onListing(it, true) }
        }
        val batches = coroutineScope {
            if (forms.isEmpty()) {
                val reviewStart = System.nanoTime() + 10_000_000_000L
                val original = async { branch(query) }
                val translated = async { Translation.translated(query)?.let { branch(it) } }
                val originalFirst = select {
                    original.onAwait { true }
                    translated.onAwait { false }
                }
                val first = if (originalFirst) original.await() else translated.await()
                val other = if (originalFirst) translated else original
                val second = if (requiresListingReview && !first?.response?.items.isNullOrEmpty() && !other.isCompleted) {
                    // Keep enough of the request deadline to validate the results already received.
                    withTimeoutOrNull(remainingMillis(reviewStart)) { other.await() }.also { other.cancel() }
                } else other.await()
                if (originalFirst) listOfNotNull(first, second) else listOfNotNull(second, first)
            } else {
                val terms = listOf(query) + forms.filterNot { it.equals(Metadata.clean(query), ignoreCase = true) }
                val replies = terms.filter { page <= (history.aliasEnds[it] ?: Int.MAX_VALUE) }.map { term ->
                    async {
                        term to if (term == query) branch(term) else RequestLimits.optional(6500) { branch(term) }
                    }
                }.awaitAll()
                for ((term, batch) in replies) {
                    if (batch?.response?.hasNext == false) history.aliasEnds[term] = page
                }
                replies.mapNotNull { it.second }
            }
        }
        val responses = batches.mapNotNull { it.response }
        history.reviewRank = if (requiresListingReview && responses.count { it.items.isNotEmpty() } > 1) {
            buildMap {
                for (response in responses) response.items.forEachIndexed { index, card ->
                    val key = searchKey(card)
                    put(key, minOf(get(key) ?: Int.MAX_VALUE, index))
                }
            }
        } else emptyMap()
        if (responses.isEmpty()) batches.firstNotNullOfOrNull { it.error }?.let { throw it }
        return newSearchResponseList(responses.flatMap { it.items }, responses.any { it.hasNext })
    }

    private suspend fun taxonomyResults(
        query: String, page: Int, history: SearchHistory, aliases: Set<String>,
    ): List<SearchResponseList> = coroutineScope {
        val englishOnly = lang == "ru" && Translation.target(query) == "ru"
        val terms = aliases.ifEmpty { TaxonomySearch.terms(query) }
            .filterNot { englishOnly && Translation.target(it) == "en" }.toSet()
        val policy = source as? SearchPolicy
        if (terms.isEmpty() || (aliases.isEmpty() && (policy?.includeTaxonomyResults == false ||
            source is NoodlePosterSource && policy?.translateQueries == false))) {
            return@coroutineScope emptyList()
        }
        val native = source as? RussianProvider
        fun pending(sections: List<Section>) =
            sections.filter { page <= (history.taxonomyEnds[it.path] ?: Int.MAX_VALUE) }.map { section ->
                async {
                    section to RequestLimits.optional(if (aliases.isNotEmpty()) 4500 else 1800) {
                        if (native != null) native.taxonomySearch(section, page)
                        else {
                            (source as? NoodlePosterSource)?.searchCategoryPage(section.path, page)
                                ?: source.getMainPage(page, MainPageRequest(section.name, section.path, false))?.let { home ->
                                    newSearchResponseList(home.items.flatMap { it.list }, home.hasNext)
                                }
                        }
                    }
                }
            }

        fun sectionKey(section: Section): String =
            if (aliases.isEmpty()) TaxonomySearch.kind(section.path) ?: "category"
            else absolute(mainUrl, section.path)?.trimEnd('/') ?: section.path

        val saved = history.taxonomy
        val tasks = if (saved != null) pending(saved) else {
            val declared = (native?.spec?.searchSections.orEmpty() + source.mainPage.map { Section(it.name, it.data) })
                .filter {
                    (!englishOnly || Translation.target(it.name) != "en") &&
                        TaxonomySearch.matches(it.name, terms, expandGenre = aliases.isNotEmpty()) &&
                        (TaxonomySearch.kind(it.path) != null || source is NoodlePosterSource && !it.path.startsWith('/') ||
                            aliases.isNotEmpty() && native != null && it.path.trim('/').isNotEmpty() &&
                            Translation.searchAliases(it.path.trim('/')).any(terms::contains))
                }.distinctBy(::sectionKey)
            val declaredTasks = pending(declared)
            val linked = native?.let {
                RequestLimits.optional(if (aliases.isNotEmpty()) 3000 else 1100) {
                    it.taxonomyLinks(terms, allMatches = aliases.isNotEmpty())
                }
            }.orEmpty()
            val used = declared.mapTo(mutableSetOf(), ::sectionKey)
            val discovered = linked.filter { (!englishOnly || Translation.target(it.name) != "en") && used.add(sectionKey(it)) }
            history.taxonomy = declared + discovered
            declaredTasks + pending(discovered)
        }
        val replies = tasks.awaitAll()
        for ((section, response) in replies) {
            if (response != null && !response.hasNext) history.taxonomyEnds[section.path] = page
        }
        replies.mapNotNull { it.second }
    }

    private suspend fun combinedSearch(
        query: String, page: Int, history: SearchHistory, onListing: (SearchResponseList, Boolean) -> Unit,
    ): SearchResponseList = coroutineScope {
        val aliases = if (lang in listOf("ru", "en")) {
            Translation.searchAliases(query)
        } else emptySet()
        val matches = async {
            try {
                Result.success(upstreamSearch(query, page, history, aliases, onListing))
            } catch (e: kotlinx.coroutines.CancellationException) {
                throw e
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
        val taxonomy = async { taxonomyResults(query, page, history, aliases) }
        val search = matches.await()
        val feeds = taxonomy.await()
        val original = if (feeds.any { it.items.isNotEmpty() }) search.getOrNull() else search.getOrThrow()
        newSearchResponseList(original?.items.orEmpty() + feeds.flatMap { it.items }, original?.hasNext == true || feeds.any { it.hasNext })
    }

    private suspend fun firstSearchBatch(
        query: String, history: SearchHistory, onListing: (SearchResponseList, Boolean) -> Unit,
    ): FirstSearchBatch = coroutineScope {
        val original = CompletableDeferred<SearchResponseList>()
        val combined = async {
            combinedSearch(query, 1, history) { response, isOriginal ->
                onListing(response, isOriginal)
                if (isOriginal) original.complete(response)
            }
        }
        withTimeoutOrNull(FIRST_PAGE_MERGE_MS) { combined.await() }?.let { return@coroutineScope FirstSearchBatch(it) }

        val (ready, full) = select<Pair<SearchResponseList?, SearchResponseList?>> {
            combined.onAwait { null to it }
            original.onAwait { it to null }
        }
        if (full != null) return@coroutineScope FirstSearchBatch(full)
        val eligible = ready?.items.orEmpty().asSequence()
            .filter { isListable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }
            .distinctBy(::searchKey).take(SEARCH_PAGE_MINIMUM).count()
        if (eligible < SEARCH_PAGE_MINIMUM) return@coroutineScope FirstSearchBatch(combined.await())

        // Revisit the same source cursor on scroll and merge its translated and taxonomy branches there.
        combined.cancel()
        FirstSearchBatch(checkNotNull(ready), complete = false)
    }

    override suspend fun search(query: String, page: Int): SearchResponseList = RequestLimits.required("Поиск", LISTING_TIMEOUT_MS) {
        val started = System.nanoTime()
        val listingDeadline = started + LISTING_TIMEOUT_MS * 1_000_000L
        val firstPageTarget = started + FIRST_PAGE_TARGET_MS * 1_000_000L
        val quickFirstPage = page == 1 && ratingProfile in slowFirstPageSources
        if (page < 1 || !ContentPolicy.accepts(query)) return@required newSearchResponseList(emptyList(), false)
        val history = synchronized(searchHistory) {
            val previous = searchHistory[query]
            if (previous != null && (page != 1 || System.nanoTime() < previous.reuseFirstUntil)) previous
            else SearchHistory().also { searchHistory[query] = it }
        }
        history.mutex.withLock {
            history.pages[page]?.let {
                val saved = it.response
                val fresh = saved.items.filter { card -> isListable(card.url) }.map { cachedScore(cachedSearchPoster(it)) }
                val visible = if (page == 1 && fresh.size != saved.items.size) {
                    SearchPosters.prepare(fresh, listingDeadline, ::repairSearchPoster)
                } else fresh.also { ImagePrefetch.warm(it, priority = true) }
                return@withLock newSearchResponseList(visible, saved.hasNext)
            }
            // CloudStream normally calls consecutive pages. Independently requested pages retain
            // the provider's existing numeric cursor behavior.
            val previous = history.pages[page - 1]
            var nextSourcePage = previous?.nextSourcePage ?: page
            var canFetch = previous?.canFetch ?: true
            var pending = previous?.pending
            val seen = history.pages.asSequence().filter { it.key < page }
                .flatMap { it.value.response.items.asSequence() }.mapTo(mutableSetOf(), ::searchKey)
            val cards = mutableListOf<SearchResponse>()
            val genre = lang in listOf("ru", "en") && Translation.searchAliases(query).isNotEmpty()
            val expandSparse = requiresListingReview || genre || ratingProfile in setOf("PornoRussia", "BdsmPorn")
            var limit = if (page == 1 && !expandSparse) 1 else MAX_UPSTREAM_PAGES_PER_EXPANSION
            var deadline: Long? = null
            var completeBatch = true
            var useFastBudget = quickFirstPage
            val early = ConcurrentHashMap<String, Deferred<Review?>>()
            val searchScope = CoroutineScope(coroutineContext)
            var firstPhotos: Job? = null
            fun prepareLeadingCards(response: SearchResponseList, isOriginal: Boolean) {
                val items = response.items
                if (page != 1 || ratingProfile == null || quickFirstPage && !requiresListingReview && !isOriginal) return
                val earlyDeadline = minOf(listingDeadline - 2_000_000_000L, System.nanoTime() + 3_500_000_000L)
                val visible = items.asSequence()
                    .filter { isListable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }
                    .distinctBy(::searchKey).take(SEARCH_REVIEW_LIMIT).toList()
                synchronized(early) {
                    if (visible.isNotEmpty() && firstPhotos == null) {
                        firstPhotos = searchScope.launch {
                            SearchPosters.precheck(visible.take(SEARCH_POSTER_COUNT).map { normalizeCard(it) })
                        }
                    }
                    for (card in visible) {
                        if (early.size >= SEARCH_REVIEW_LIMIT) break
                        early.computeIfAbsent(videoKey(card.url)) {
                            searchScope.async(Network.CacheDetail) { review(card, earlyDeadline) }
                        }
                    }
                }
            }


            while (cards.size < SEARCH_PAGE_SIZE) {
                val candidates: SearchCandidates
                if (pending != null) candidates = pending else {
                    if (!canFetch || limit == 0) break
                    history.reviewRank = emptyMap()
                    val first = if (useFastBudget && nextSourcePage == 1 && deadline == null) {
                        firstSearchBatch(query, history, ::prepareLeadingCards)
                    } else null
                    val result = first?.response ?: if (deadline == null) {
                        combinedSearch(query, nextSourcePage, history, ::prepareLeadingCards)
                    } else RequestLimits.optional(remainingMillis(deadline)) {
                        combinedSearch(query, nextSourcePage, history, ::prepareLeadingCards)
                    }
                    if (result == null) break
                    completeBatch = first?.complete != false
                    canFetch = !completeBatch || result.hasNext
                    if (completeBatch) nextSourcePage++
                    limit--
                    candidates = SearchCandidates(result.items.distinctBy(::searchKey), history.reviewRank)
                }
                val budget = if (requiresListingReview) REQUIRED_SEARCH_REVIEW_BUDGET_MS else SEARCH_REVIEW_BUDGET_MS
                val reviewDeadline = deadline ?: minOf(
                    listingDeadline - 2_000_000_000L,
                    System.nanoTime() + budget * 1_000_000L,
                ).also { deadline = it }
                val available = candidates.cards.filter {
                    searchKey(it) !in seen && isListable(it.url) && accepts(it.name, Metadata.cardTags(it.url))
                }
                val count = SEARCH_PAGE_SIZE - cards.size
                val batch = available.take(count)
                val fastDeadline = if (useFastBudget && batch.size >= SEARCH_PAGE_MINIMUM) {
                    minOf(reviewDeadline, maxOf(System.nanoTime() + 250_000_000L, firstPageTarget - 400_000_000L))
                } else reviewDeadline
                var checked = prepareSearch(batch, fastDeadline, candidates.reviewRank, early, firstPage = page == 1)
                if (checked.isEmpty() && fastDeadline < reviewDeadline) {
                    useFastBudget = false
                    checked = prepareSearch(batch, reviewDeadline, candidates.reviewRank, early, firstPage = true)
                }
                if (checked.isEmpty() && !completeBatch) {
                    useFastBudget = false
                    deadline = null
                    limit++
                    continue
                }
                // Retry unconfirmed strict candidates once, after cards that have not been checked yet.
                val checkedKeys = checked.mapTo(hashSetOf(), ::searchKey)
                val retry = if (requiresListingReview) batch.filter {
                    val key = searchKey(it)
                    key !in checkedKeys && key !in candidates.retried && savedReview(it.url)?.allowed != false
                } else emptyList()
                val unchecked = available.drop(count)
                val rest = unchecked + retry
                pending = rest.takeIf { it.isNotEmpty() }?.let {
                    candidates.copy(cards = it, retried = candidates.retried + retry.map(::searchKey))
                }
                cards += checked
                seen += checked.map(::searchKey)
                if (!completeBatch || cards.size >= SEARCH_PAGE_MINIMUM || remainingMillis(reviewDeadline) <= 0 ||
                    unchecked.isEmpty() && retry.isNotEmpty()) break
            }

            early.values.forEach { it.cancel() }
            val prepared = coroutineScope {
                val scores = async {
                    listingScores(cards.take(SEARCH_POSTER_COUNT), listingDeadline)
                        .mapIndexedNotNull { index, score -> score?.let { searchKey(cards[index]) to it } }.toMap()
                }
                val coverDeadline = if (useFastBudget) minOf(listingDeadline,
                    maxOf(System.nanoTime() + 400_000_000L, firstPageTarget)) else listingDeadline
                val posters = if (page == 1) SearchPosters.prepare(cards, coverDeadline, ::repairSearchPoster, ::queueHomePoster)
                else cards.also { ImagePrefetch.warm(it, priority = true) }
                val ratings = scores.await()
                posters.map { card ->
                    val score = ratings[searchKey(card)]
                    if (card is MovieSearchResponse && score != null && card.score == null) card.copy(score = score)
                    else cachedScore(card)
                }
            }
            firstPhotos?.cancel()
            val response = newSearchResponseList(prepared, pending != null || canFetch)
            if (page == 1) {
                history.reuseFirstUntil = if (prepared.size >= SEARCH_PAGE_MINIMUM && prepared.take(SEARCH_POSTER_COUNT).all { !it.posterUrl.isNullOrBlank() })
                    System.nanoTime() + 20_000_000_000L else 0L
            }
            if (previous?.pending != null) history.pages[page - 1] = previous.copy(pending = null)
            history.pages[page] = SavedSearchPage(response, nextSourcePage, canFetch, pending)
            response
        }
    }
    override suspend fun load(url: String): LoadResponse = RequestLimits.required("Карточка") {
        try {
            loadCard(url)
        } catch (e: ErrorLoadingException) {
            if (excludedDetails.containsMatchIn(e.message.orEmpty())) {
                reviews[videoKey(url)] = System.nanoTime() to Review(false, null)
            }
            if (ratingProfile == "TubeSafari" && e.message == "Видео удалено или недоступно") {
                removedVideos[videoKey(url)] = System.nanoTime()
            }
            throw e
        }
    }

    private suspend fun loadCard(url: String): LoadResponse = coroutineScope {
        val saved = savedReview(url, DETAIL_MAX_AGE_NANOS)?.detail as? MovieLoadResponse
        val result = saved?.copy(trailers = saved.trailers.toMutableList(), syncData = saved.syncData.toMutableMap()) ?:
            withContext(Network.OpeningDetail + Network.CacheDetail) { source.load(url) }
            ?: throw ErrorLoadingException("Источник не вернул карточку")
        val listedTags = Metadata.cardTags(url)
        val tagsSource = (source as? DetailTagSource) ?: (source as? AdaptedProvider)?.detailTagSource
        val missingTags = if (tagsSource != null && result.tags.isNullOrEmpty()) {
            async { RequestLimits.optional(5700) { tagsSource.missingTags(url) }.orEmpty() }
        } else null
        if (missingTags == null && !accepts(result.name, result.tags.orEmpty() + listedTags, result.plot)) {
            throw ErrorLoadingException("Видео скрыто фильтром категорий")
        }
        result.plot=Metadata.description(result.plot,result.name)
        result.posterUrl=Metadata.choosePoster(url,result.posterUrl)
        val initialRecommendations = result.recommendations.orEmpty()
        val recommendations = async {
            val visible = cards(initialRecommendations, expandTitles = false)
                .filterNot { searchKey(it) == Metadata.catalogueKey(ratingProfile, url) }
                .distinctBy(::searchKey)
            val checked = if (!ContentPolicy.enabled) visible else {
                val deadline = System.nanoTime() + 1_600_000_000L
                val candidates = visible.filter { savedReview(it.url) == null }.take(10)
                val verified = withContext(Network.CacheDetail) { reviewedCards(candidates, deadline) }.associateBy(::searchKey)
                visible.mapNotNull { card ->
                    verified[searchKey(card)] ?: card.takeIf { savedReview(it.url)?.allowed == true }
                }
            }
            if (ratingProfile == "NoodleMagazine" && source is NoodlePosterSource) {
                checked.filterIsInstance<MovieSearchResponse>().filter { it.posterUrl.isNullOrBlank() }.forEach(::queueHomePoster)
                checked
            } else if (ratingProfile == "UKDevilz") {
                prepareListing(checked, System.nanoTime() + 2_000_000_000L, missingPostersOnly = true)
            } else withResolvedPosters(checked, missingOnly = true)
        }
        if(result is MovieLoadResponse) {
            val headers = Network.imageHeaders(result.posterUrl, url) + result.posterHeaders.orEmpty()
            val provider = source as? PosterSource
            val poster = if (ratingProfile == "NoodleMagazine" && provider is NoodlePosterSource && !result.posterUrl.isNullOrBlank()) {
                val existing = result.posterUrl
                if (existing!!.startsWith("file:") && runCatching { File(URI(existing)).isFile }.getOrDefault(false) ||
                    PosterRequests.confirmed(existing, headers)) existing
                else resolvePoster(provider, url, existing, headers, timeoutMs = 300)
                    ?: existing.also {
                        queueHomePoster(newMovieSearchResponse(result.name, url, TvType.NSFW) {
                            posterUrl = existing
                            posterHeaders = headers
                        })
                    }
            } else provider?.let { resolvePoster(it, url, result.posterUrl, headers) }
            result.posterHeaders = if (poster != null && poster != result.posterUrl) {
                Metadata.rememberPoster(url, poster)
                result.posterUrl = poster
                resolvedPosterHeaders(poster, url, headers)
            } else headers
            if (missingTags == null) ImagePrefetch.warm(result.posterUrl, result.posterHeaders.orEmpty())
        }
        val tags = missingTags?.await() ?: result.tags.orEmpty()
        if (missingTags != null) {
            if (!accepts(result.name, tags + listedTags, result.plot)) throw ErrorLoadingException("Видео скрыто фильтром категорий")
            if (result is MovieLoadResponse) ImagePrefetch.warm(result.posterUrl, result.posterHeaders.orEmpty())
        }
        ratingProfile?.let { VideoScores.rememberDetail(it, url, result.score) }
        result.tags = tags.mapNotNull(Metadata::tag).distinctBy { it.lowercase() }
        result.recommendations = recommendations.await()
        ImagePrefetch.warm(result.recommendations.orEmpty())
        result
    }
    override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean = RequestLimits.required("Плеер",45_000) {
        val emitted = java.util.concurrent.atomic.AtomicBoolean()
        val rejected = java.util.concurrent.atomic.AtomicReference<Int>()
        val resolutions = if (ratingProfile in uniqueResolutions) ConcurrentHashMap.newKeySet<Int>() else null
        try {
            coroutineScope {
                source.loadLinks(data, isCasting, subtitleCallback) { link ->
                    launch(start = CoroutineStart.UNDISPATCHED) {
                        val interceptor = if (link.isM3u8) source.getVideoInterceptor(link) else null
                        val result = QualityLinks.select(link, interceptor)
                        result.rejectedStatus?.let { rejected.compareAndSet(null, it) }
                        for (choice in result.links) {
                            // The same resolution can be available as both MP4 and HLS.
                            if (resolutions != null && choice.name.isEmpty() && choice.quality > 0 &&
                                choice.quality != Qualities.Unknown.value && !resolutions.add(choice.quality)) continue
                            callback(choice)
                            emitted.set(true)
                        }
                    }
                }
            }
            if (!emitted.get()) rejected.get()?.let { throw Playback.mediaError(it) }
        } catch (e: ErrorLoadingException) {
            if (!emitted.get() && ratingProfile in tracksRemovedVideos && Playback.missingMedia(e)) {
                removedVideos[videoKey(data)] = System.nanoTime()
            }
            throw e
        }
        if (emitted.get()) removedVideos.remove(videoKey(data))
        emitted.get()
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor?=source.getVideoInterceptor(extractorLink)
}
