package com.cloudextensions.russian

import com.lagradost.cloudstream3.SearchResponse
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull

/** Both catalogues share the same watch IDs even when the host or tracking parameters change. */
class NoodleCatalogue {
    private class Feed {
        val mutex = Mutex()
        val pages = mutableMapOf<Int, Set<String>>()
    }

    private val feeds = BoundedMap<String, Feed>(32)

    suspend fun page(key: String, number: Int, fetch: suspend () -> List<SearchResponse>): List<SearchResponse> {
        val feed = synchronized(feeds) { feeds.getOrPut(key) { Feed() } }
        return feed.mutex.withLock {
            val cards = distinct(fetch())
            if (number == 1) feed.pages.clear()
            val earlier = feed.pages.asSequence().filter { it.key < number }.flatMap { it.value.asSequence() }.toSet()
            cards.filter { identity(it.url) !in earlier }.also { fresh ->
                feed.pages[number] = fresh.mapTo(mutableSetOf()) { identity(it.url) }
            }
        }
    }

    companion object {
        private val videoId = Regex("""-?\d+_\d+""")

        fun distinct(cards: List<SearchResponse>, current: String? = null): List<SearchResponse> {
            val excluded = current?.let(::identity)
            return cards.distinctBy { identity(it.url) }.filter { identity(it.url) != excluded }
        }

        internal fun identity(url: String): String {
            val path = url.toHttpUrlOrNull()?.pathSegments.orEmpty()
            val id = path.getOrNull(1)
            if (path.firstOrNull() == "watch" && !id.isNullOrBlank()) return "watch:$id"
            if (path.firstOrNull() in setOf("video", "embed") && id != null && videoId.matches(id)) return "watch:$id"
            return videoKey(url)
        }
    }
}
