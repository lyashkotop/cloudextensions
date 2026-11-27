package com.cloudextensions.russian

import com.lagradost.cloudstream3.LoadResponse
import com.lagradost.cloudstream3.MainAPI
import com.lagradost.cloudstream3.TvType
import com.lagradost.cloudstream3.newMovieLoadResponse
import com.lagradost.cloudstream3.newMovieSearchResponse
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

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
}
