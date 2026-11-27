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
import kotlinx.coroutines.runBlocking

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

private class StrictCatalogue(private val poster: String) : MainAPI(), SearchPolicy {
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
        if (id == "8" && attempts++ == 0) throw IOException("Temporary unavailable details")
        return newMovieLoadResponse("Video $id", url, TvType.NSFW, url)
    }
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
