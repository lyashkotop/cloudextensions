package com.cloudextensions.russian

import com.lagradost.cloudstream3.LoadResponse
import com.lagradost.cloudstream3.MainAPI
import com.lagradost.cloudstream3.SearchResponseList
import com.lagradost.cloudstream3.TvType
import com.lagradost.cloudstream3.newMovieLoadResponse
import com.lagradost.cloudstream3.newMovieSearchResponse
import com.lagradost.cloudstream3.newSearchResponseList
import java.io.File
import java.io.IOException
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeoutOrNull

private class SearchCatalogue(private val poster: String) : MainAPI() {
    override var lang = "ru"
    override var mainUrl = "https://catalogue.example"
    val requests = mutableListOf<Pair<String, Int>>()

    override suspend fun search(query: String, page: Int): SearchResponseList {
        requests += query to page
        val ids = when {
            query == "amateur" && page == 1 -> 1..47
            query == "amateur" && page == 2 -> 47..53
            query == "подруга" || query == "girlfriend" -> 1..6
            else -> IntRange.EMPTY
        }
        val cards = ids.map { id ->
            newMovieSearchResponse("Video $id", "$mainUrl/$id", TvType.NSFW) { posterUrl = poster }
        }
        return newSearchResponseList(cards, query == "amateur" && page == 1)
    }

    override suspend fun load(url: String) = newMovieLoadResponse("Video ${url.substringAfterLast('/')}", url, TvType.NSFW, url)
}

private class StrictCatalogue(private val poster: String, private val slowTail: Boolean = false) : MainAPI(), SearchPolicy {
    override var lang = "ru"
    override var mainUrl = "https://strict.example"
    override val requiresListingReview = true
    private var attempts = 0

    override suspend fun search(query: String, page: Int): SearchResponseList =
        newSearchResponseList((1..24).map { id ->
            newMovieSearchResponse("Video $id", "$mainUrl/$id", TvType.NSFW) { posterUrl = poster }
        }, false)

    override suspend fun load(url: String): LoadResponse {
        val id = url.substringAfterLast('/')
        if (slowTail && id.toInt() > 7) delay(600)
        if (!slowTail && id == "8" && attempts++ == 0) throw IOException("Temporary unavailable details")
        return newMovieLoadResponse("Video $id", url, TvType.NSFW, url)
    }
}

private class OverlappingCatalogue(private val poster: String) : MainAPI(), SearchPolicy {
    override var lang = "ru"
    override var mainUrl = "https://overlap.example"
    override val requiresListingReview = true
    private val primaryReviewed = CompletableDeferred<Unit>()

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val id = if (query == "подруга") "primary" else {
            if (withTimeoutOrNull(1_000) { primaryReviewed.await() } == null) {
                return newSearchResponseList(emptyList(), false)
            }
            "translated"
        }
        return newSearchResponseList(listOf(newMovieSearchResponse("Video $id", "$mainUrl/$id", TvType.NSFW) {
            posterUrl = poster
        }), false)
    }

    override suspend fun load(url: String): LoadResponse {
        if (url.endsWith("/primary")) primaryReviewed.complete(Unit)
        return newMovieLoadResponse("Verified video", url, TvType.NSFW, url)
    }
}

private class SlowTranslationCatalogue(private val poster: String) : MainAPI() {
    override var lang = "ru"
    override var mainUrl = "https://slow-companion.example"

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val ids = when {
            page != 1 -> IntRange.EMPTY
            query == "подруга" -> 1..5
            query == "girlfriend" -> {
                delay(2_100)
                4..9
            }
            else -> IntRange.EMPTY
        }
        return newSearchResponseList(ids.map { id ->
            newMovieSearchResponse("Video $id", "$mainUrl/$id", TvType.NSFW) { posterUrl = poster }
        }, false)
    }

    override suspend fun load(url: String): LoadResponse =
        newMovieLoadResponse("Verified video", url, TvType.NSFW, url)
}

private class SparseCatalogue(private val poster: String) : MainAPI() {
    override var lang = "ru"
    override var mainUrl = "https://sparse.example"

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val ids = when {
            query != "обучение" -> IntRange.EMPTY
            page == 1 -> 1..1
            page == 2 -> {
                delay(1_850)
                1..12
            }
            page == 3 -> 12..24
            else -> IntRange.EMPTY
        }
        return newSearchResponseList(ids.map { id ->
            newMovieSearchResponse("Example $id", "$mainUrl/video/$id", TvType.NSFW) { posterUrl = poster }
        }, !ids.isEmpty() && page < 3)
    }

    override suspend fun load(url: String): LoadResponse =
        newMovieLoadResponse("Verified video", url, TvType.NSFW, url)
}

internal fun testSearchPaging() {
    val poster = File.createTempFile("search-poster", ".png")
    try {
        poster.writeBytes(java.util.Base64.getDecoder().decode(
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aVp0AAAAASUVORK5CYII=",
        ))
        val source = SearchCatalogue(poster.toURI().toString())
        val plugin = ReliableProvider(source)
        runBlocking {
            fun SearchResponseList.ids() = items.map { it.url.substringAfterLast('/').toInt() }

            val first = plugin.search("amateur", 1)
            check(first.ids() == (1..20).toList() && first.hasNext)
            check(first.items.take(3).all { it.posterUrl == poster.toURI().toString() })
            check(source.requests.none { Translation.target(it.first) == "en" })

            val second = plugin.search("amateur", 2)
            check(second.ids() == (21..40).toList() && second.hasNext)
            check(source.requests.all { it.second == 1 })

            val third = plugin.search("amateur", 3)
            check(third.ids() == (41..47).toList() && third.hasNext)
            val fourth = plugin.search("amateur", 4)
            check(fourth.ids() == (48..53).toList() && !fourth.hasNext)
            check(source.requests.filter { it.first == "amateur" }.map { it.second } == listOf(1, 2))
            check(plugin.search("amateur", 2).ids() == second.ids())

            val previous = source.requests.size
            check(plugin.search("подруга", 1).items.size == 6)
            check(source.requests.drop(previous).toSet() == setOf("подруга" to 1, "girlfriend" to 1))
            check(plugin.search("absent", 1).let { it.items.isEmpty() && !it.hasNext })

            val slowCompanion = ReliableProvider(SlowTranslationCatalogue(poster.toURI().toString()), "Vpoisk")
            val fast = slowCompanion.search("подруга", 1)
            check(fast.ids() == (1..5).toList() && fast.hasNext)
            val deferred = slowCompanion.search("подруга", 2)
            check(deferred.ids() == (6..9).toList() && !deferred.hasNext)

            val sparse = ReliableProvider(SparseCatalogue(poster.toURI().toString()), "BdsmPorn")
            val expanded = sparse.search("обучение", 1)
            check(expanded.ids() == (1..12).toList() && expanded.hasNext)
            val continuation = sparse.search("обучение", 2)
            check(continuation.ids() == (13..24).toList() && !continuation.hasNext)
            check(sparse.search("qxzv947pkn", 1).let { it.items.isEmpty() && !it.hasNext })
            val overlap = ReliableProvider(OverlappingCatalogue(poster.toURI().toString()), "EPorner")
            check(overlap.search("подруга", 1).items.map { it.url.substringAfterLast('/') } == listOf("primary", "translated"))
            val fastStrict = ReliableProvider(StrictCatalogue(poster.toURI().toString(), slowTail = true), "EPorner")
            val fastFirst = fastStrict.search("123", 1)
            check(fastFirst.ids() == (1..7).toList() && fastFirst.hasNext)
            val fastSecond = fastStrict.search("123", 2)
            check(fastSecond.ids().toSet() == (8..24).toSet() && !fastSecond.hasNext)
            val strict = ReliableProvider(StrictCatalogue(poster.toURI().toString()))
            val strictFirst = strict.search("123", 1)
            check(strictFirst.ids() == (1..20).filter { it != 8 } && strictFirst.hasNext)
            val strictSecond = strict.search("123", 2)
            check(strictSecond.ids() == (21..24).toList() + 8 && !strictSecond.hasNext) {
                "Expected deferred card after new results, got ${strictSecond.ids()} (hasNext=${strictSecond.hasNext})"
            }
        }
    } finally {
        poster.delete()
    }
}
