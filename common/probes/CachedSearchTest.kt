import com.cloudextensions.russian.ReliableProvider
import com.cloudextensions.russian.SearchPolicy
import com.lagradost.cloudstream3.*
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

private class RussianCatalogue : MainAPI(), SearchPolicy {
    override var lang = "ru"
    override val russianTitlesOnly = true
    val calls = mutableListOf<Pair<String, Int>>()

    override suspend fun search(query: String, page: Int): SearchResponseList {
        calls += query to page
        delay(50)
        val cards = if (query == "подруга") (1..6).map {
            newMovieSearchResponse("Видео $it", "https://example.test/$page/$it", TvType.NSFW) {
                posterUrl = "https://example.test/$page/$it.jpg"
            }
        } else emptyList()
        return newSearchResponseList(cards, cards.isNotEmpty() && page == 1)
    }

    override suspend fun load(url: String) = newMovieLoadResponse("Видео", url, TvType.NSFW, url)
}

fun main() = runBlocking {
    val site = RussianCatalogue()
    val api = ReliableProvider(site)
    val first = List(2) { async { api.search("подруга", 1).items.map { it.url } } }.awaitAll()
    check(site.calls == listOf("подруга" to 1) && first.first().size == 6 && first.first() == first.last())
    check(api.search("подруга", 2).items.none { it.url in first.first() })
    check(api.search("girlfriend", 1).items.size == 6)
    check(site.calls.takeLast(2).toSet() == setOf("girlfriend" to 1, "подруга" to 1))
    repeat(2) { check(api.search("987", 1).items.isEmpty()) }
    check(site.calls.count { it == "987" to 1 } == 2)
    println("PASS concurrent first page, real pagination, translation direction and retry after empty results")
}
