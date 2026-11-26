package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.Qualities
import okhttp3.Interceptor
import java.io.File
import java.net.URI
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.CoroutineStart
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.launch
import kotlinx.coroutines.awaitAll
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
private const val MAX_UPSTREAM_PAGES_PER_EXPANSION = 4
private const val SEARCH_REVIEW_BUDGET_MS = 5_000L
private const val THISVID_RECOMMENDATION_BUDGET_MS = 1_200L
private const val LISTING_TIMEOUT_MS = 22_000L
private const val RATING_REQUEST_TIMEOUT_MS = 6_500L
private const val FAST_LISTING_RATING_BUDGET_MS = 1_500L
private val uniqueResolutions = setOf("Beeg", "EPorner", "TubeBDSM")
private val tracksRemovedVideos = setOf("HcBDSMX", "HurtSex")
private const val LISTING_COMPLETION_RESERVE_MS = 500L
private const val HOME_LOOKAHEAD_MS = 600L
private const val NOODLE_HOME_POSTER_BUDGET_MS = 850L

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
    private val allowUnverifiedListing get() = (source as? SearchPolicy)?.allowUnverifiedListing == true
    private val searchMetadataSource get() = source as? SearchMetadataSource ?: (source as? AdaptedProvider)?.searchMetadataSource

    private fun accepts(title: String, tags: List<String>, description: String? = null) =
        ContentPolicy.accepts(title, tags, description, ratingProfile)
    private val removedVideos = java.util.Collections.synchronizedMap(BoundedMap<String, Long>(128))

    private fun isAvailable(url: String): Boolean {
        val removedAt = removedVideos[videoKey(url)] ?: return true
        return System.nanoTime() - removedAt >= 300_000_000_000L
    }

    private fun normalizeCard(
        card: SearchResponse,
        image: String? = Metadata.rememberPoster(card.url, card.posterUrl),
        title: String = Metadata.title(card.url, listOf(card.name), language = titleLanguage),
    ): SearchResponse {
        if (card !is MovieSearchResponse) return card
        val headers = Network.imageHeaders(image, mainUrl.trimEnd('/') + "/") + card.posterHeaders.orEmpty()
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
        val allowed = items.filter { isAvailable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }
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
        val key = videoKey(card.url)
        if (queuedHomePosters.add(key) && pendingHomePosters.trySend(card).isFailure) {
            queuedHomePosters.remove(key)
        }
    }

    private fun resolvedPosterHeaders(poster: String, url: String, headers: Map<String, String>): Map<String, String> =
        if (poster.startsWith("file:")) emptyMap() else Network.replacementImageHeaders(poster, url, headers)

    private suspend fun withResolvedPosters(
        items: List<SearchResponse>, missingOnly: Boolean = false, home: Boolean = false,
    ): List<SearchResponse> = coroutineScope {
        val provider = source as? PosterSource ?: return@coroutineScope items
        val fastHome = home && (provider as? NoodlePosterSource)?.fastHomeCovers == true
        items.mapIndexed { index, item -> async {
            if (item !is MovieSearchResponse || (missingOnly && !item.posterUrl.isNullOrBlank())) return@async item
            val headers = item.posterHeaders.orEmpty()
            val original = item.posterUrl
            val poster = when {
                provider.reuseConfirmedPosters && original != null && PosterRequests.confirmed(original, headers) -> original
                fastHome && index >= 3 && !original.isNullOrBlank() ->
                    cachedPoster(PosterKey(videoKey(item.url), original, headers)) ?: original.also { queueHomePoster(item) }
                else -> {
                    val budget = if (fastHome) NOODLE_HOME_POSTER_BUDGET_MS else provider.posterTimeoutMs
                    resolvePoster(provider, item.url, original, headers, home, budget)
                        .also { if (it == null && fastHome) queueHomePoster(item) }
                }
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
    private val reviewPermits=Semaphore(4)
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

    private suspend fun reviewedCards(items: List<SearchResponse>, deadline: Long): List<SearchResponse> = coroutineScope {
        items.map { card ->
            async {
                val checked = review(card, deadline)
                if (checked == null) return@async card.takeIf { allowUnverifiedListing }
                if (!checked.allowed) return@async null
                val full = checked.title?.let {
                    Metadata.title(card.url, listOf(it), language = titleLanguage, fromDetail = true)
                } ?: card.name
                if (card is MovieSearchResponse) card.copy(name = full) else card
            }
        }.awaitAll().filterNotNull()
    }

    private suspend fun previewSearch(items: List<SearchResponse>, deadline: Long): List<SearchResponse> {
        if (requiresListingReview) return reviewedCards(items, deadline)
        val accepted = mutableListOf<SearchResponse>()
        var cursor = 0
        while (accepted.size < SEARCH_REVIEW_LIMIT && cursor < items.size && remainingMillis(deadline) > 0) {
            val end = minOf(items.size, cursor + SEARCH_REVIEW_LIMIT - accepted.size)
            accepted += reviewedCards(items.subList(cursor, end), deadline)
            cursor = end
        }
        return accepted + items.drop(cursor).filter { savedReview(it.url)?.allowed != false }
    }

    private suspend fun prepareSearch(items: List<SearchResponse>, deadline: Long): List<SearchResponse> = coroutineScope {
        val normalized = items.filter { isAvailable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }.map { normalizeCard(it) }
        ImagePrefetch.warm(normalized, priority = true)
        val reviewed = withContext(Network.CacheDetail) { previewSearch(normalized, deadline) }
        reviewed.map { card ->
            async {
                if (card !is MovieSearchResponse || !Metadata.isTruncatedTitle(card.name)) return@async card
                val title = RequestLimits.optional(remainingMillis(deadline)) { expandTitle(card, deadline) }
                if (title == null) card
                else card.copy(name = Metadata.title(card.url, listOf(title), language = titleLanguage, fromDetail = true))
            }
        }.awaitAll()
    }
    private val ratingPermits = Semaphore(4)
    private val listingScoreSource = (source as? ListingScoreSource) ?: (source as? AdaptedProvider)?.listingScoreSource
    private val queuedRatings = ConcurrentHashMap.newKeySet<String>()
    private val unrated = java.util.Collections.synchronizedMap(BoundedMap<String, Long>(512))
    private val pendingRatings by lazy {
        Channel<String>(Channel.UNLIMITED).also { queue ->
            val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO + Network.Background)
            repeat(3) {
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
        if (remaining > 0 && missing.isNotEmpty()) withTimeoutOrNull(remaining) {
            coroutineScope {
                missing.forEach { index ->
                    launch { scores[index] = readCardScore(profile, items[index].url) }
                }
            }
        }
        for (index in missing) {
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

    private val warmingDetails = ConcurrentHashMap.newKeySet<String>()
    private val pendingDetails by lazy {
        Channel<SearchResponse>(12).also { queue ->
            val policy = source as? SearchPolicy
            val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO + Network.Background + Network.CacheDetail)
            repeat(2) {
                scope.launch {
                    for (card in queue) {
                        try {
                            if (policy != null) {
                                RequestLimits.optional(2200) { policy.fullTitle(card.url) }
                            } else {
                                // Adapted providers and BDSMX can use their own playback metadata endpoints.
                                review(card, System.nanoTime() + 2_200_000_000L, DETAIL_MAX_AGE_NANOS)
                            }
                        } catch (_: LinkageError) {
                        } finally {
                            warmingDetails.remove(card.url)
                        }
                    }
                }
            }
        }
    }

    private fun warmDetails(cards: List<SearchResponse>) {
        for (card in cards.take(12)) {
            if (warmingDetails.add(card.url) && pendingDetails.trySend(card).isFailure) {
                warmingDetails.remove(card.url)
            }
        }
    }

    private val randomHome = RandomHome(::searchKey)

    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse = RequestLimits.required("Главная", LISTING_TIMEOUT_MS) {
        val deadline = System.nanoTime() + LISTING_TIMEOUT_MS * 1_000_000L
        val result = randomHome.page(page, request, ratingProfile == "NoodleMagazine", HOME_LOOKAHEAD_MS) { number ->
            source.getMainPage(number, request)
        } ?: return@required newHomePageResponse(emptyList(), false)
        val rows = coroutineScope {
            result.items.map { row ->
                async {
                    val visible = cards(row.list, expandTitles = !requiresListingReview)
                    val checked = if (requiresListingReview) {
                        reviewedCards(visible, deadline - 6_000_000_000L)
                    } else visible
                    row.copy(list = prepareListing(checked, deadline, home = true))
                }
            }.awaitAll()
        }
        val listed = rows.flatMap { it.list }
        ImagePrefetch.warm(listed.drop(3))
        if (lang == "ru" && source is SearchPolicy) warmDetails(listed)
        val visibleRows = if (ratingProfile == "TubeSafari") rows.filter { it.list.isNotEmpty() } else rows
        newHomePageResponse(visibleRows, result.hasNext)
    }
    override suspend fun search(query:String):List<SearchResponse> = search(query,1).items
    override suspend fun quickSearch(query:String):List<SearchResponse> = search(query,1).items
    private data class SavedSearchPage(val response: SearchResponseList, val nextUpstreamPage: Int)
    private class SearchHistory {
        val mutex = Mutex()
        val pages = mutableMapOf<Int, SavedSearchPage>()
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
    ): SearchResponseList {
        if (aliases.isEmpty() && (lang !in listOf("ru", "en") || (source as? SearchPolicy)?.translateQueries == false ||
            (source as? AdaptedProvider)?.translateQueries == false)) {
            return source.search(query, page) ?: newSearchResponseList(emptyList(), false)
        }
        data class Batch(val response: SearchResponseList?, val error: Exception? = null)
        suspend fun branch(term: String): Batch = try {
            val response = source.search(term, page)
            if (term == query && response != null && !requiresListingReview) {
                val first = response.items.asSequence()
                    .filter { isAvailable(it.url) && accepts(it.name, Metadata.cardTags(it.url)) }
                    .take(3).map { normalizeCard(it, title = it.name) }.toList()
                ImagePrefetch.warm(first, priority = true)
            }
            Batch(response)
        } catch (e: kotlinx.coroutines.CancellationException) {
            throw e
        } catch (e: Exception) {
            Batch(null, e)
        }
        val forms = aliases.ifEmpty { Translation.searchForms(query) }
        val batches = coroutineScope {
            if (forms.isEmpty()) {
                val original = async { branch(query) }
                val translated = async { Translation.translated(query)?.let { branch(it) } }
                listOfNotNull(original.await(), translated.await())
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
        if (responses.isEmpty()) batches.firstNotNullOfOrNull { it.error }?.let { throw it }
        return newSearchResponseList(responses.flatMap { it.items }, responses.any { it.hasNext })
    }

    private suspend fun taxonomyResults(
        query: String, page: Int, history: SearchHistory, aliases: Set<String>,
    ): List<SearchResponseList> = coroutineScope {
        val terms = aliases.ifEmpty { TaxonomySearch.terms(query) }
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
            val discovered = linked.filter { used.add(sectionKey(it)) }
            history.taxonomy = declared + discovered
            declaredTasks + pending(discovered)
        }
        val replies = tasks.awaitAll()
        for ((section, response) in replies) {
            if (response != null && !response.hasNext) history.taxonomyEnds[section.path] = page
        }
        replies.mapNotNull { it.second }
    }

    private suspend fun combinedSearch(query: String, page: Int, history: SearchHistory): SearchResponseList = coroutineScope {
        val aliases = if (lang in listOf("ru", "en")) {
            Translation.searchAliases(query)
        } else emptySet()
        val matches = async {
            try {
                Result.success(upstreamSearch(query, page, history, aliases))
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

    override suspend fun search(query: String, page: Int): SearchResponseList = RequestLimits.required("Поиск", LISTING_TIMEOUT_MS) {
        val listingDeadline = System.nanoTime() + LISTING_TIMEOUT_MS * 1_000_000L
        if (page < 1 || !ContentPolicy.accepts(query)) return@required newSearchResponseList(emptyList(), false)
        val history = synchronized(searchHistory) {
            if (page == 1) SearchHistory().also { searchHistory[query] = it }
            else searchHistory.getOrPut(query) { SearchHistory() }
        }
        history.mutex.withLock {
            history.pages[page]?.let {
                val saved = it.response
                val fresh = saved.items.filter { card -> isAvailable(card.url) }.map(::cachedScore)
                warmDetails(fresh)
                return@withLock newSearchResponseList(fresh, saved.hasNext)
            }
            val seen = history.pages.asSequence().filter { it.key < page }
                .flatMap { it.value.response.items.asSequence() }.mapTo(mutableSetOf(), ::searchKey)
            var upstream = history.pages[page - 1]?.nextUpstreamPage ?: page
            var result = combinedSearch(query, upstream, history)
            val budget = when {
                allowUnverifiedListing -> 3_000L
                requiresListingReview -> 10_000L
                else -> SEARCH_REVIEW_BUDGET_MS
            }
            val deadline = minOf(listingDeadline - 6_000_000_000L, System.nanoTime() + budget * 1_000_000L)
            val cards = mutableListOf<SearchResponse>()
            val genre = lang in listOf("ru", "en") && Translation.searchAliases(query).isNotEmpty()
            val expandSparse = requiresListingReview || genre || ratingProfile in setOf("PornoRussia", "BdsmPorn")
            var limit = if (page == 1 && !expandSparse) 1 else MAX_UPSTREAM_PAGES_PER_EXPANSION
            while (true) {
                val unique = result.items.distinctBy(::searchKey).filter { searchKey(it) !in seen }
                val checked = prepareSearch(unique, deadline)
                cards += checked
                seen += checked.map(::searchKey)
                upstream++
                limit--
                if (cards.size >= SEARCH_PAGE_MINIMUM || !result.hasNext || limit == 0) break
                result = RequestLimits.optional(remainingMillis(deadline)) { combinedSearch(query, upstream, history) } ?: break
            }
            warmDetails(cards)
            val prepared = prepareListing(cards, listingDeadline)
            ImagePrefetch.warm(prepared.drop(3))
            val response = newSearchResponseList(prepared, result.hasNext)
            history.pages[page] = SavedSearchPage(response, upstream)
            response
        }
    }
    override suspend fun load(url: String): LoadResponse = RequestLimits.required("Карточка") { loadCard(url) }

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
            val checked = if (requiresListingReview) {
                val budget = if (ratingProfile == "ThisVid") THISVID_RECOMMENDATION_BUDGET_MS else SEARCH_REVIEW_BUDGET_MS
                reviewedCards(visible, System.nanoTime() + budget * 1_000_000L)
            } else visible
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
