import com.cloudextensions.russian.ReliableProvider
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
}
