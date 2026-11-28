package com.cloudextensions.russian

import com.lagradost.cloudstream3.SearchResponse
import kotlin.coroutines.AbstractCoroutineContextElement
import kotlin.coroutines.coroutineContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.async
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit

internal class CardRecommendations(
    private val scope: CoroutineScope,
    private val permits: Semaphore,
) : AbstractCoroutineContextElement(Key) {
    companion object Key : kotlin.coroutines.CoroutineContext.Key<CardRecommendations>

    private val pending = mutableListOf<Pair<Long, suspend () -> List<SearchResponse>>>()

    fun schedule(milliseconds: Long, fetch: suspend () -> List<SearchResponse>) {
        pending += milliseconds to fetch
    }

    fun start(): Deferred<List<SearchResponse>>? {
        if (pending.isEmpty()) return null
        return scope.async {
            RequestLimits.optional(pending.sumOf { it.first } + 500) {
                permits.withPermit {
                    pending.firstNotNullOfOrNull { (milliseconds, fetch) ->
                        RequestLimits.optional(milliseconds, fetch)?.takeIf { it.isNotEmpty() }
                    }.orEmpty()
                }
            }.orEmpty()
        }
    }
}

/** Keep recommendations already on the page and defer any extra catalogue request. */
suspend fun cardRecommendations(
    milliseconds: Long,
    fetch: suspend () -> List<SearchResponse>,
): List<SearchResponse> {
    val request = coroutineContext[CardRecommendations] ?: return RequestLimits.optional(milliseconds, fetch).orEmpty()
    request.schedule(milliseconds, fetch)
    return emptyList()
}
