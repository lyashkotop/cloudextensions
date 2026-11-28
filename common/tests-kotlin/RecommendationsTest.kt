package com.cloudextensions.russian

import com.lagradost.cloudstream3.LoadResponse
import com.lagradost.cloudstream3.MainAPI
import com.lagradost.cloudstream3.TvType
import com.lagradost.cloudstream3.newMovieLoadResponse
import com.lagradost.cloudstream3.newMovieSearchResponse
import kotlinx.coroutines.delay
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeout

internal fun testRecommendations() = runBlocking {
    val base = "https://recommendations.example"
    val provider = object : MainAPI() {
        override var mainUrl = base
        override suspend fun load(url: String): LoadResponse {
            val id = url.substringAfterLast('/')
            if (id == "slow") delay(3_000)
            return newMovieLoadResponse("Sample clip", url, TvType.NSFW, url) {
                when (id) {
                    "open" -> recommendations = listOf("good", "blocked", "description", "slow", "good", "open").map {
                        newMovieSearchResponse("Related clip", "$base/$it", TvType.NSFW)
                    }
                    "blocked" -> tags = listOf("asmr")
                    "description" -> plot = "Tagged hentai in the description."
                }
            }
        }
    }
    val api = ReliableProvider(provider)
    repeat(2) {
        check(api.load("$base/open").recommendations.orEmpty().map { it.url } == listOf("$base/good"))
    }

    val listedPoster = "$base/poster.jpg"
    val slowPoster = object : MainAPI(), PosterSource {
        override suspend fun load(url: String) = newMovieLoadResponse("Sample", url, TvType.NSFW, url) {
            posterUrl = listedPoster
        }

        override suspend fun resolvePoster(url: String, poster: String?, headers: Map<String, String>): String {
            delay(3_000)
            return "$base/replacement.jpg"
        }
    }
    val fastCard = withTimeout(2_000) { ReliableProvider(slowPoster).load("$base/item") }
    check(fastCard.posterUrl == listedPoster)

    val allowRecommendations = CompletableDeferred<Unit>()
    val deferredSource = object : MainAPI() {
        override suspend fun load(url: String): LoadResponse {
            val related = if (url.endsWith("/open")) cardRecommendations(3_000) {
                allowRecommendations.await()
                listOf("good", "blocked").map { newMovieSearchResponse("Related", "$base/$it", TvType.NSFW) }
            } else emptyList()
            return newMovieLoadResponse("Sample", url, TvType.NSFW, url) {
                recommendations = related
                if (url.endsWith("/blocked")) tags = listOf("asmr")
            }
        }
    }
    val deferred = ReliableProvider(deferredSource)
    check(withTimeout(1_000) { deferred.load("$base/open") }.recommendations.isNullOrEmpty())
    allowRecommendations.complete(Unit)
    withTimeout(2_000) {
        while (true) {
            val recommendations = deferred.load("$base/open").recommendations.orEmpty().map { it.url }
            if (recommendations.isNotEmpty()) {
                check(recommendations == listOf("$base/good"))
                break
            }
            delay(10)
        }
    }
}
