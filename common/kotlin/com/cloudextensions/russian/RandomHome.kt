package com.cloudextensions.russian

import com.lagradost.cloudstream3.HomePageList
import com.lagradost.cloudstream3.HomePageResponse
import com.lagradost.cloudstream3.MainPageRequest
import com.lagradost.cloudstream3.SearchResponse
import com.lagradost.cloudstream3.newHomePageResponse
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock

/** Mix real cards without skipping a source cursor or fetching the same page twice while scrolling. */
internal class RandomHome(private val identity: (SearchResponse) -> String) {
    private class Feed {
        val mutex = Mutex()
        val pages = BoundedMap<Int, HomePageResponse>(16)
    }

    private val feeds = BoundedMap<Pair<String, String>, Feed>(64)

    suspend fun page(
        number: Int,
        request: MainPageRequest,
        alreadyRandom: Boolean,
        lookAheadMillis: Long,
        fetch: suspend (Int) -> HomePageResponse?,
    ): HomePageResponse? {
        val feed = synchronized(feeds) { feeds.getOrPut(request.name to request.data) { Feed() } }
        return feed.mutex.withLock {
            if (number != 1) {
                feed.pages[number]?.let { return@withLock it }
                return@withLock fetch(number)?.let { response ->
                    newHomePageResponse(response.items.map { it.copy(list = it.list.distinctBy(identity).shuffled()) }, response.hasNext)
                        .also { feed.pages[number] = it }
                }
            }

            val first = fetch(1) ?: return@withLock null
            val previous = feed.pages[1]?.items.orEmpty().associate { it.name to it.list.firstOrNull()?.let(identity) }
            val second = if (first.hasNext && !alreadyRandom && lookAheadMillis > 0 && first.items.any { it.list.isNotEmpty() }) {
                RequestLimits.optional(lookAheadMillis) { fetch(2) }
                    ?.takeIf { next -> next.items.map { it.name } == first.items.map { it.name } }
            } else null

            val deferred = mutableListOf<HomePageList>()
            val rows = first.items.mapIndexed { index, row ->
                val leading = row.list.distinctBy(identity)
                val leadingKeys = leading.mapTo(hashSetOf(), identity)
                val following = second?.items?.get(index)?.list.orEmpty()
                    .distinctBy(identity).filterNot { identity(it) in leadingKeys }
                val mixed = (leading + following).shuffled().toMutableList()
                val count = leading.size
                if (count > 0 && following.isNotEmpty() && mixed.take(count).all { identity(it) in leadingKeys }) {
                    val swap = mixed.indexOfFirst { identity(it) !in leadingKeys }
                    val displaced = mixed[count - 1]
                    mixed[count - 1] = mixed[swap]
                    mixed[swap] = displaced
                }
                val visible = mixed.take(count)
                val different = if (visible.size > 1 && identity(visible.first()) == previous[row.name]) {
                    visible.drop(1) + visible.first()
                } else visible
                deferred += row.copy(list = mixed.drop(count))
                row.copy(list = different)
            }

            feed.pages.clear()
            if (second != null && deferred.any { it.list.isNotEmpty() }) {
                feed.pages[2] = newHomePageResponse(deferred, second.hasNext)
            }
            newHomePageResponse(rows, first.hasNext).also { feed.pages[1] = it }
        }
    }
}
