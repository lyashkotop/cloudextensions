import com.cloudextensions.russian.ReliableProvider
import com.cloudextensions.russian.SearchPolicy
import com.lagradost.cloudstream3.*
import java.io.IOException
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

class Sample : MainAPI() {
    override var lang = "en"
    var calls = 0

    override suspend fun search(query: String, page: Int): SearchResponseList =
        newSearchResponseList((0..15).map {
            newMovieSearchResponse("clip$it", "https://example.org/$it", TvType.NSFW)
        }, false)

    override suspend fun load(url: String): LoadResponse {
        calls++
        delay(30)
        val id = url.substringAfterLast('/').toInt()
        if (id == 3) throw IOException("unavailable metadata")
        val title = if (id == 1) "cuckold" else "clip$id full title"
        return newMovieLoadResponse(title, url, TvType.NSFW, url) {
            tags = if (id == 2 || id == 10) listOf("trans") else emptyList()
            plot = "Watch this video on Example."
        }
    }
}

private class PagedSource(private val slow: Boolean = false) : MainAPI(), SearchPolicy {
    override var lang = "en"
    override val translateQueries = false
    val requestedPages = mutableListOf<Int>()

    override suspend fun search(query: String, page: Int): SearchResponseList {
        requestedPages += page
        val ids = when {
            slow -> (1..12).toList()
            page == 1 -> (1..4).toList()
            else -> listOf(page + 3)
        }
        return newSearchResponseList(ids.map {
            newMovieSearchResponse("Result $it", "https://example.net/clip/$it", TvType.NSFW)
        }, !slow && page < 6)
    }

    override suspend fun load(url: String): LoadResponse {
        if (slow) delay(1_300)
        return newMovieLoadResponse("Result " + url.substringAfterLast('/'), url, TvType.NSFW, url)
    }
}

fun main() = runBlocking {
    val raw = Sample()
    val api = ReliableProvider(raw)
    val query = "three safe words"
    val result = api.search(query, 1)
    val ids = result.items.map { it.url.substringAfterLast('/').toInt() }
    check(ids == listOf(0, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15))
    check(raw.calls == 14)
    check(result.items.first().name == "clip0 full title")
    api.search(query, 1)
    check(raw.calls == 15)
    val detail = api.load(result.items.first().url)
    check(raw.calls == 15)
    check(detail.plot.isNullOrBlank())
    println("PASS strict visible ten: ordered results, title and tag checks, unavailable details, and cache")

    val slow = ReliableProvider(PagedSource(slow = true))
    fun SearchResponseList.ids() = items.map { it.url.substringAfterLast('/').toInt() }
    check(slow.search(query, 1).ids() == (1..12).toList())

    val paged = PagedSource()
    val expanded = ReliableProvider(paged)
    check(expanded.search(query, 1).ids() == (1..4).toList())
    val second = expanded.search(query, 2)
    check(second.ids() == (5..8).toList() && second.hasNext)
    check(expanded.search(query, 2).ids() == second.ids())
    val third = expanded.search(query, 3)
    check(third.ids() == listOf(9) && !third.hasNext)
    check(paged.requestedPages == (1..6).toList())
    println("PASS queued reviews and grouped follow-up pages preserve order and the upstream cursor")
}
