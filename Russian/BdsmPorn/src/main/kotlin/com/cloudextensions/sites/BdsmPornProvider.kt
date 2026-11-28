package com.cloudextensions.sites

import com.cloudextensions.russian.Metadata
import com.cloudextensions.russian.Network
import com.cloudextensions.russian.PageRequest
import com.cloudextensions.russian.Playback
import com.cloudextensions.russian.RequestLimits
import com.cloudextensions.russian.RussianProvider
import com.cloudextensions.russian.Section
import com.cloudextensions.russian.SiteSpec
import com.cloudextensions.russian.VideoDetail
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.HomePageResponse
import com.lagradost.cloudstream3.MainPageRequest
import com.lagradost.cloudstream3.SearchResponseList
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.newSearchResponseList
import java.util.Locale
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.withTimeoutOrNull
import com.lagradost.cloudstream3.utils.ExtractorLink
import com.lagradost.cloudstream3.utils.newExtractorLink
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element

private const val SEARCH_BATCH_SIZE = 20

class BdsmPornProvider : RussianProvider(
    SiteSpec(
        id = "BdsmPorn",
        title = "1. BDSM-Porn.cc",
        origin = "https://ru.bdsm-porn.cc",
        cards = ".video:has(> a[href^=/video/])",
        link = "a[href^=/video/]",
        titleSelector = "h3 .title",
        detailTitleSelector = ".video-header h1",
        titleLanguage = "ru",
        tagSelector = ".description .tags a[href], .description .tags-alt a[href]",
        related = ".video-page .videos-page",
        sections = listOf(
            Section("Новинки", "/videos"),
            Section("В тренде", "/videos/trending"),
            Section("БДСМ", "/bdsm"),
            Section("Порка", "/spanking"),
            Section("Связывание", "/bondage"),
            Section("Садомазо", "/sadomaso"),
        ),
    ),
) {
    override suspend fun searchRequest(term: String): PageRequest =
        PageRequest(mainUrl.toHttpUrl().newBuilder()
            .encodedPath("/search").query(null).addQueryParameter("q", term).build().toString())

    private val guyTitle = Regex("""(?iu)(?<![\p{L}\p{N}])(?:пар(?:ень|ня|ню|нем|не|ни|ней|ням|нями|нях)|guys?)(?![\p{L}\p{N}])""")
    private val slaveTitle = Regex("""(?iu)(?<![\p{L}\p{N}])(?:рабын(?:я|и|ю|ей|ь|ям|ями|ях)|slaves?)(?![\p{L}\p{N}])""")
    private val titleWord = Regex("""[\p{L}\p{N}]+""")

    private data class SavedSection(val timestamp: Long, val response: HomePageResponse)
    private val savedSections = ConcurrentHashMap<Pair<String, Int>, SavedSection>()

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val listing = super.getMainPage(page, request)
        if (page in 1..4 && spec.sections.any { it.path == request.data } && listing.items.any { it.list.isNotEmpty() }) {
            savedSections[request.data to page] = SavedSection(System.nanoTime(), listing)
        }
        return listing
    }

    override suspend fun search(query: String, page: Int): SearchResponseList = coroutineScope {
        val term = Metadata.clean(query).lowercase(Locale.ROOT)
        val words = titleWords(term)
        if (page < 1 || words.isEmpty()) return@coroutineScope newSearchResponseList(emptyList(), false)

        val native = async { RequestLimits.optional(2600) { super.search(query, page) } }
        val sections = async {
            // When native search is slow or sparse, fetch sections without waiting for its timeout.
            val quick = withTimeoutOrNull(400) { native.await() }
            if (quick != null && quick.items.size >= SEARCH_BATCH_SIZE) emptyList() else spec.sections.map { section ->
                async { searchSection(section, page) }
            }.awaitAll().filterNotNull()
        }
        val original = native.await()
        if (original != null && original.items.size >= SEARCH_BATCH_SIZE) {
            sections.cancel()
            return@coroutineScope original
        }
        val catalogues = sections.await()
        if (catalogues.isEmpty()) return@coroutineScope original
            ?: throw ErrorLoadingException("BDSM-Porn.cc: поиск и каталог не ответили")
        fun matching(listings: List<HomePageResponse>) = listings.flatMap { listing -> listing.items.flatMap { it.list } }
            .filter { card ->
                when (term) {
                    "парень", "guy" -> guyTitle.containsMatchIn(card.name)
                    "рабыня", "рабыни", "slave", "slaves" -> slaveTitle.containsMatchIn(card.name)
                    else -> titleWords(card.name).containsAll(words)
                }
            }
        var matches = matching(catalogues)
        var hasNext = catalogues.any { it.hasNext }
        if (page == 1 && original == null && matches.isEmpty() && term in setOf("guy", "парень")) {
            val paged = spec.sections.filter { section ->
                catalogues.any { it.hasNext && it.items.any { row -> row.name == section.name } }
            }
            val second = paged.map { section -> async { searchSection(section, 2) } }.awaitAll().filterNotNull()
            matches = matching(second)
            hasNext = second.any { it.hasNext }
        }
        val combined = (original?.items.orEmpty() + matches).distinctBy { Metadata.catalogueKey(spec.id, it.url) }
        val moreMatches = (combined.isNotEmpty() || page > 1) && hasNext
        newSearchResponseList(combined, original?.hasNext == true || moreMatches)
    }

    private suspend fun searchSection(section: Section, page: Int): HomePageResponse? {
        fun cached(number: Int) = savedSections[section.path to number]
            ?.takeIf { System.nanoTime() - it.timestamp < 300_000_000_000L }?.response
        return cached(page) ?: RequestLimits.optional(2300) {
            val request = MainPageRequest(section.name, section.path, sequentialMainPage)
            if (page in 2..4 && cached(page - 1) == null) {
                // A full native result can skip the section fetch that discovers its next cursor.
                for (number in 1 until page) {
                    val previous = cached(number) ?: getMainPage(number, request)
                    if (!previous.hasNext) return@optional previous.copy(items = emptyList())
                }
            }
            getMainPage(page, request)
        }
    }

    private fun titleWords(value: String): Set<String> =
        titleWord.findAll(value.lowercase(Locale.ROOT)).map { it.value }.toSet()

    private fun listingPoster(card: Element, base: String): String? {
        Metadata.poster(card, base)?.let { return it }
        val labels = "[data-poster], [data-thumbnail], [data-thumb]"
        return (sequenceOf(card) + card.select(labels).asSequence()).firstNotNullOfOrNull { element ->
            listOf("data-poster", "data-thumbnail", "data-thumb").firstNotNullOfOrNull {
                Metadata.imageUrl(base, element.attr(it))
            }
        }
    }

    override suspend fun page(request: PageRequest): Document {
        val localized = request.copy(headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE))
        val document = super.page(localized)
        val requested = request.url.toHttpUrl()
        if (requested.encodedPath.trimEnd('/') == "/search" && !isSearchResult(requested, document)) {
            // A suggested tag can be a redirect. Its feed is handled separately from title matches.
            return Document(request.url).apply { attr("data-response-code", "404") }
        }
        return document.clone().apply {
            selectFirst(".video-header h1")?.children()?.remove()
            for (card in select(spec.cards)) {
                if (Metadata.poster(card, baseUri()) != null) continue
                val poster = listingPoster(card, baseUri()) ?: continue
                card.selectFirst(spec.link)?.appendElement("img")?.attr("src", poster)
            }
            nextPage(this)?.let { (anchor, next) ->
                anchor.attr("rel", "next").attr("href", next.toString())
            }
        }
    }

    private fun isSearchResult(requested: HttpUrl, document: Document): Boolean {
        val actual = document.baseUri().toHttpUrlOrNull() ?: return false
        return actual.host in setOf(requested.host, "bdsm-porn.cc", "ru.bdsm-porn.cc") &&
            actual.encodedPath.trimEnd('/') == "/search" &&
            actual.queryParameter("q").equals(requested.queryParameter("q"), ignoreCase = true)
    }

    private fun nextPage(document: Document): Pair<Element, HttpUrl>? {
        val address = document.baseUri().toHttpUrl()
        val current = address.queryParameter("page")?.toIntOrNull() ?: 1
        val query = address.queryParameter("q")
        return document.select("a.pagenav[href]").firstNotNullOfOrNull { anchor ->
            val next = anchor.absUrl("href").toHttpUrlOrNull() ?: return@firstNotNullOfOrNull null
            if (next.host != address.host || next.encodedPath.trimEnd('/') != address.encodedPath.trimEnd('/') ||
                next.queryParameter("page")?.toIntOrNull() != current + 1
            ) return@firstNotNullOfOrNull null
            val outgoingQuery = next.queryParameter("q")
            if (outgoingQuery != null && outgoingQuery != query) return@firstNotNullOfOrNull null
            val resolved = if (query != null && outgoingQuery == null) {
                next.newBuilder().addQueryParameter("q", query).build()
            } else next
            anchor to resolved
        }
    }

    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        val description = document.selectFirst("meta[property=og:description]")?.attr("content").orEmpty()
        val summary = description.takeUnless { it.startsWith("Сочное видео с тегами", ignoreCase = true) }
        val player = document.selectFirst("video#player")
        val poster = player?.let { Metadata.poster(it, document.baseUri()) }
        return detail.copy(
            poster = poster ?: detail.poster,
            description = detail.description.ifBlank { Metadata.description(summary, detail.title) },
        )
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit,
    ): Boolean = coroutineScope {
        val document = page(PageRequest(data))
        val referer = document.baseUri()
        val pageHost = referer.toHttpUrl().host
        val publisherHosts = setOf(pageHost, "bdsm-porn.cc", "ru.bdsm-porn.cc")
        val sources = document.select("video#player, video#player source").asSequence().mapNotNull { node ->
            val type = node.attr("type").ifBlank { node.attr("data-type") }
            val source = sequenceOf("src", "data-src").firstNotNullOfOrNull { attribute ->
                node.absUrl(attribute).toHttpUrlOrNull()
            } ?: return@mapNotNull null
            if (source.host !in publisherHosts) return@mapNotNull null
            val supported = source.encodedPath.startsWith("/link_cs/") ||
                source.encodedPath.endsWith(".mp4", true) ||
                source.encodedPath.endsWith(".m3u8", true) ||
                type.startsWith("video/", true) || type.contains("mpegurl", true)
            if (supported) source.toString() to type else null
        }.distinctBy { it.first }.take(4).toList()

        val links = sources.map { (url, type) ->
            async {
                val link = newExtractorLink(name, name, url, Playback.streamType(url, type)) {
                    this.referer = referer
                    headers = Network.headers(referer) + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)
                }
                link.takeIf { Playback.checkDirectLink(it) == true }
            }
        }.awaitAll().filterNotNull()
        links.forEach(callback)
        links.isNotEmpty() || Playback.linksFromPage(name, mainUrl, referer, document, emptyList(), subtitleCallback, callback)
    }

}
