package com.cloudextensions.russian

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.Interceptor
import java.io.File
import java.net.URI
import kotlinx.coroutines.CoroutineStart
import kotlinx.coroutines.launch
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.sync.withPermit
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withTimeoutOrNull

private const val SEARCH_REVIEW_LIMIT = 10
private const val SEARCH_PAGE_MINIMUM = 4
private const val MAX_UPSTREAM_PAGES_PER_EXPANSION = 4
private const val SEARCH_REVIEW_BUDGET_MS = 5_000L
private const val LISTING_TIMEOUT_MS = 22_000L
private const val RATING_REQUEST_TIMEOUT_MS = 6_500L
private const val LISTING_COMPLETION_RESERVE_MS = 500L

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
    private val requiresListingReview get() = (source as? SearchPolicy)?.requiresListingReview == true

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
        val allowed = items.filter { ContentPolicy.accepts(it.name, Metadata.cardTags(it.url)) }
        val posters = allowed.map { card -> normalizeCard(card, title = card.name) }
        if (source !is PosterSource) ImagePrefetch.warm(posters)
        val titles = allowed.map { card ->
            if (expandTitles && Metadata.isTruncatedTitle(card.name)) async { expandTitle(card, deadline) } else null
        }
        posters.mapIndexedNotNull { index, card ->
            val expanded = titles[index]?.await()
            val title = Metadata.title(card.url, listOf(expanded ?: card.name), language = titleLanguage, fromDetail = expanded != null)
            if (!ContentPolicy.accepts(title, Metadata.cardTags(card.url))) return@mapIndexedNotNull null
            if (card is MovieSearchResponse && title != card.name) card.copy(name = title) else card
        }
    }
    private val posterPermits = Semaphore(12)
    private data class PosterKey(val video: String, val poster: String?, val headers: Map<String, String>)
    private val resolvedPosters = java.util.Collections.synchronizedMap(BoundedMap<PosterKey, Pair<Long, String>>(256))

    private suspend fun resolvePoster(
        provider: PosterSource, url: String, poster: String?, headers: Map<String, String>, home: Boolean = false,
    ): String? {
        val key = PosterKey(videoKey(url), poster, headers.toMap())
        resolvedPosters[key]?.takeIf {
            System.nanoTime() - it.first < 90_000_000_000L &&
                (!it.second.startsWith("file:") || runCatching { File(URI(it.second)).isFile }.getOrDefault(false))
        }?.let { return it.second }
        val resolved = RequestLimits.optional(provider.posterTimeoutMs) {
            posterPermits.withPermit {
                if (home) provider.resolveHomePoster(url, poster, headers) else provider.resolvePoster(url, poster, headers)
            }
        }
        if (resolved != null && resolved != poster) resolvedPosters[key] = System.nanoTime() to resolved
        return resolved
    }

    private fun resolvedPosterHeaders(poster: String, url: String, headers: Map<String, String>): Map<String, String> =
        if (poster.startsWith("file:")) emptyMap() else Network.replacementImageHeaders(poster, url, headers)

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
            if (index < 7) ImagePrefetch.warm(listOf(ready))
            ready
        } }.awaitAll()
    }
    private data class Review(val allowed:Boolean,val detail:LoadResponse?,val title:String?=detail?.name)
    private val reviews=java.util.Collections.synchronizedMap(BoundedMap<String,Pair<Long,Review>>(128))
    private val reviewPermits=Semaphore(4)
    private fun savedReview(url:String)=reviews[videoKey(url)]?.takeIf{System.nanoTime()-it.first<300_000_000_000L}?.second
    private fun remainingMillis(deadline: Long) = (deadline - System.nanoTime()) / 1_000_000

    private suspend fun review(card: SearchResponse, deadline: Long): Review? {
        savedReview(card.url)?.let { return it }
        val result = RequestLimits.optional(remainingMillis(deadline)) {
            reviewPermits.withPermit {
                savedReview(card.url)?.let { return@withPermit it }
                val budget = minOf(3500L, remainingMillis(deadline))
                RequestLimits.optional(budget) {
                    try {
                        if (source is SearchMetadataSource) {
                            val meta = source.searchMetadata(card.url)
                            Review(ContentPolicy.accepts(meta.title, meta.tags + Metadata.cardTags(card.url), meta.description), null, meta.title)
                        } else {
                            val detail = source.load(card.url) ?: return@optional null
                            Review(ContentPolicy.accepts(detail.name, detail.tags.orEmpty() + Metadata.cardTags(card.url), detail.plot), detail)
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
                val checked = review(card, deadline)?.takeIf { it.allowed } ?: return@async null
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
        return if (accepted.size >= SEARCH_REVIEW_LIMIT) accepted + items.drop(cursor) else accepted
    }

    private suspend fun prepareSearch(items: List<SearchResponse>, deadline: Long): List<SearchResponse> = coroutineScope {
        val normalized = items.filter { ContentPolicy.accepts(it.name, Metadata.cardTags(it.url)) }.map { normalizeCard(it) }
        val reviewed = previewSearch(normalized, deadline)
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

    private suspend fun readCardScore(profile: String, url: String): Score? =
        VideoScores.cachedDetail(profile, url) ?: ratingPermits.withPermit {
            VideoScores.cachedDetail(profile, url) ?: RequestLimits.optional(RATING_REQUEST_TIMEOUT_MS) {
                when (source) {
                    is RussianProvider -> source.readListingScore(url)
                    is NoodlePosterSource -> VideoScores.detail(profile, url, source.posterPage(url))
                    else -> if (listingScoreSource != null) listingScoreSource.readListingScore(url)
                    else VideoScores.detail(profile, url, Network.page(PageRequest(url), mainUrl))
                }?.also { VideoScores.rememberDetail(profile, url, it) }
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
            cached == null
        }
        val remaining = (deadline - System.nanoTime()) / 1_000_000L - LISTING_COMPLETION_RESERVE_MS
        if (remaining > 0 && missing.isNotEmpty()) withTimeoutOrNull(remaining) {
            coroutineScope {
                missing.forEach { index ->
                    launch { scores[index] = readCardScore(profile, items[index].url) }
                }
            }
        }
        return scores
    }

    private suspend fun prepareListing(
        items: List<SearchResponse>, deadline: Long, home: Boolean = false,
    ): List<SearchResponse> = coroutineScope {
        val ratings = async { listingScores(items, deadline) }
        val posters = withResolvedPosters(items, home = home)
        val scores = ratings.await()
        posters.mapIndexed { index, poster ->
            val score = scores[index]
            if (poster is MovieSearchResponse && score != null && poster.score == null) poster.copy(score = score)
            else poster
        }
    }

    override suspend fun getMainPage(page:Int,request:MainPageRequest):HomePageResponse = RequestLimits.required("Главная", LISTING_TIMEOUT_MS) {
        val deadline = System.nanoTime() + LISTING_TIMEOUT_MS * 1_000_000L
        val result=source.getMainPage(page,request) ?: return@required newHomePageResponse(emptyList(),false)
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
        ImagePrefetch.warm(rows.flatMap{it.list})
        newHomePageResponse(rows,result.hasNext)
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
            Batch(source.search(term, page))
        } catch (e: kotlinx.coroutines.CancellationException) {
            throw e
        } catch (e: Exception) {
            Batch(null, e)
        }
        val batches = coroutineScope {
            if (aliases.isEmpty()) {
                val original = async { branch(query) }
                val translated = async { Translation.translated(query)?.let { branch(it) } }
                listOfNotNull(original.await(), translated.await())
            } else {
                val terms = listOf(query) + aliases.filterNot { it.equals(Metadata.clean(query), ignoreCase = true) }
                val replies = terms.filter { page <= (history.aliasEnds[it] ?: Int.MAX_VALUE) }.map { term ->
                    async {
                        term to if (term == query) branch(term) else RequestLimits.optional(4500) { branch(term) }
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
        val sections = history.taxonomy ?: run {
            val declared = source.mainPage.filter {
                TaxonomySearch.matches(it.name, terms) &&
                    (TaxonomySearch.kind(it.data) != null || source is NoodlePosterSource && !it.data.startsWith('/'))
            }.map { Section(it.name, it.data) }
            val linked = native?.let { RequestLimits.optional(1100) { it.taxonomyLinks(terms, allMatches = aliases.isNotEmpty()) } }.orEmpty()
            (declared + linked).distinctBy {
                if (aliases.isEmpty()) TaxonomySearch.kind(it.path) ?: "category"
                else absolute(mainUrl, it.path)?.trimEnd('/') ?: it.path
            }.also { history.taxonomy = it }
        }
        val replies = sections.filter { page <= (history.taxonomyEnds[it.path] ?: Int.MAX_VALUE) }.map { section ->
            async {
                section to RequestLimits.optional(1800) {
                    if (native != null) native.taxonomySearch(section, page)
                    else {
                        (source as? NoodlePosterSource)?.searchCategoryPage(section.path, page)
                            ?: source.getMainPage(page, MainPageRequest(section.name, section.path, false))?.let { home ->
                                newSearchResponseList(home.items.flatMap { it.list }, home.hasNext)
                            }
                    }
                }
            }
        }.awaitAll()
        for ((section, response) in replies) {
            if (response != null && !response.hasNext) history.taxonomyEnds[section.path] = page
        }
        replies.mapNotNull { it.second }
    }

    private suspend fun combinedSearch(query: String, page: Int, history: SearchHistory): SearchResponseList = coroutineScope {
        val aliases = if (lang in listOf("ru", "en") && (source as? SearchPolicy)?.expandSearchAliases != false) {
            Translation.searchAliases(query)
        } else emptySet()
        val matches = async { upstreamSearch(query, page, history, aliases) }
        val taxonomy = async { taxonomyResults(query, page, history, aliases) }
        val original = matches.await()
        val feeds = taxonomy.await()
        newSearchResponseList(original.items + feeds.flatMap { it.items }, original.hasNext || feeds.any { it.hasNext })
    }

    override suspend fun search(query: String, page: Int): SearchResponseList = RequestLimits.required("Поиск", LISTING_TIMEOUT_MS) {
        val listingDeadline = System.nanoTime() + LISTING_TIMEOUT_MS * 1_000_000L
        if (page < 1 || !ContentPolicy.accepts(query)) return@required newSearchResponseList(emptyList(), false)
        val history = synchronized(searchHistory) {
            if (page == 1) SearchHistory().also { searchHistory[query] = it }
            else searchHistory.getOrPut(query) { SearchHistory() }
        }
        history.mutex.withLock {
            history.pages[page]?.let { return@withLock it.response }
            val seen = history.pages.asSequence().filter { it.key < page }
                .flatMap { it.value.response.items.asSequence() }.mapTo(mutableSetOf(), ::searchKey)
            var upstream = history.pages[page - 1]?.nextUpstreamPage ?: page
            var result = combinedSearch(query, upstream, history)
            val budget = if (requiresListingReview) 10_000L else SEARCH_REVIEW_BUDGET_MS
            val deadline = minOf(listingDeadline - 6_000_000_000L, System.nanoTime() + budget * 1_000_000L)
            val cards = mutableListOf<SearchResponse>()
            var limit = if (page == 1 && !requiresListingReview) 1 else MAX_UPSTREAM_PAGES_PER_EXPANSION
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
            val prepared = prepareListing(cards, listingDeadline)
            ImagePrefetch.warm(prepared)
            val response = newSearchResponseList(prepared, result.hasNext)
            history.pages[page] = SavedSearchPage(response, upstream)
            response
        }
    }
    override suspend fun load(url: String): LoadResponse = RequestLimits.required("Карточка") { loadCard(url) }

    private suspend fun loadCard(url: String): LoadResponse = coroutineScope {
        val result=savedReview(url)?.detail ?: source.load(url) ?: throw ErrorLoadingException("Источник не вернул карточку")
        val listedTags = Metadata.cardTags(url)
        val tagsSource = (source as? DetailTagSource) ?: (source as? AdaptedProvider)?.detailTagSource
        val missingTags = if (tagsSource != null && result.tags.isNullOrEmpty()) {
            async { RequestLimits.optional(5700) { tagsSource.missingTags(url) }.orEmpty() }
        } else null
        if (missingTags == null && !ContentPolicy.accepts(result.name, result.tags.orEmpty() + listedTags, result.plot)) {
            throw ErrorLoadingException("Видео скрыто фильтром категорий")
        }
        result.plot=Metadata.description(result.plot,result.name)
        result.posterUrl=Metadata.choosePoster(url,result.posterUrl)
        val initialRecommendations = result.recommendations.orEmpty()
        val recommendations = async {
            val visible = cards(initialRecommendations, expandTitles = false)
            val checked = if (requiresListingReview) {
                reviewedCards(visible, System.nanoTime() + SEARCH_REVIEW_BUDGET_MS * 1_000_000L)
            } else visible
            withResolvedPosters(checked, missingOnly = true)
        }
        if(result is MovieLoadResponse) {
            val headers = Network.imageHeaders(result.posterUrl, url) + result.posterHeaders.orEmpty()
            val provider = source as? PosterSource
            val poster = provider?.let {
                resolvePoster(it, url, result.posterUrl, headers)
            }
            result.posterHeaders = if (poster != null && poster != result.posterUrl) {
                Metadata.rememberPoster(url, poster)
                result.posterUrl = poster
                resolvedPosterHeaders(poster, url, headers)
            } else headers
            if (missingTags == null) ImagePrefetch.warm(result.posterUrl, result.posterHeaders.orEmpty())
        }
        val tags = missingTags?.await() ?: result.tags.orEmpty()
        if (missingTags != null) {
            if (!ContentPolicy.accepts(result.name, tags + listedTags, result.plot)) throw ErrorLoadingException("Видео скрыто фильтром категорий")
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
        coroutineScope {
            source.loadLinks(data, isCasting, subtitleCallback) { link ->
                launch(start = CoroutineStart.UNDISPATCHED) {
                    val interceptor = if (link.isM3u8) source.getVideoInterceptor(link) else null
                    val result = QualityLinks.select(link, interceptor)
                    result.rejectedStatus?.let { rejected.compareAndSet(null, it) }
                    for (choice in result.links) {
                        callback(choice)
                        emitted.set(true)
                    }
                }
            }
        }
        if (!emitted.get()) rejected.get()?.let { throw Playback.mediaError(it) }
        emitted.get()
    }
    override fun getVideoInterceptor(extractorLink:ExtractorLink):Interceptor?=source.getVideoInterceptor(extractorLink)
}
