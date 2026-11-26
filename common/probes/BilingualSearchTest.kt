import com.cloudextensions.russian.ReliableProvider
import com.cloudextensions.russian.SearchPolicy
import com.lagradost.cloudstream3.*
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

private class BilingualSite : MainAPI(), SearchPolicy {
    override var lang = "ja"
    override val requiresListingReview = true
    val checked = mutableListOf<String>()

    override suspend fun search(query: String, page: Int): SearchResponseList {
        val prefix = when (query) {
            "подруга" -> "original"
            "girlfriend" -> "translated"
            else -> return newSearchResponseList(emptyList(), false)
        }
        val ids = listOf("shared") + (1..6).map { "$prefix-$it" }
        return newSearchResponseList(ids.map {
            newMovieSearchResponse(it, "https://example.org/$it", TvType.NSFW)
        }, false)
    }

    override suspend fun load(url: String): LoadResponse {
        val id = url.substringAfterLast('/')
        checked += id
        delay(10)
        return newMovieLoadResponse(id, url, TvType.NSFW, url) {
            if (id == "translated-2") tags = listOf("asmr")
        }
    }
}

fun main() = runBlocking {
    val site = BilingualSite()
    val cards = ReliableProvider(site).search("подруга", 1).items
    val ids = cards.map { it.url.substringAfterLast('/') }
    check(site.checked.take(4).any { it.startsWith("translated-") })
    check(ids == listOf("shared") + (1..6).map { "original-$it" } +
        listOf(1, 3, 4, 5, 6).map { "translated-$it" })
    println("PASS shared detail budget, original order, unique translated results and tag filtering")
}
