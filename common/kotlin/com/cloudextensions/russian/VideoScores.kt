package com.cloudextensions.russian

import com.lagradost.cloudstream3.Score
import java.net.URI
import java.util.Collections
import java.util.concurrent.TimeUnit
import org.json.JSONObject
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element

interface ListingScoreSource {
    suspend fun readListingScore(url: String): Score?
}

/** Ratings published by the site for this video or its own listing card. */
object VideoScores {
    private val listing = Collections.synchronizedMap(BoundedMap<Pair<String, String>, Score>(2048))
    private val watched = Collections.synchronizedMap(BoundedMap<Pair<String, String>, Pair<Long, Score>>(512))

    private val detailProfiles = setOf(
        "BDSMStreak", "Beeg", "BoundHub", "DarknessPorn", "Ebalka", "EPorner", "HeavyR", "NoodleMagazine",
        "Perdol", "Pervertium", "ProstoPorno", "PunishWorld", "Semyana", "SickR", "Strip2", "ThisVid",
        "TubeBDSM", "TubeSafari", "UKDevilz", "Vpoisk", "Xnxx", "XRares",
    )

    internal fun loadsListingScores(source: String?): Boolean = source in detailProfiles

    // A TubeBDSM outbound URL carries the identity in its signed query.
    private fun detailKey(source: String, url: String) = source to if (source == "TubeBDSM") url else videoKey(url)

    internal fun rememberDetail(source: String, url: String, score: Score?) {
        if (score != null && loadsListingScores(source)) watched[detailKey(source, url)] = System.nanoTime() to score
    }

    internal fun cachedDetail(source: String, url: String): Score? =
        watched[detailKey(source, url)]?.takeIf { System.nanoTime() - it.first < TimeUnit.MINUTES.toNanos(5) }?.second

    private val percent = Regex("""^([0-9]{1,3}(?:[.,][0-9]+)?)\s*%(?:\s*\([0-9.,\s]+ votes?\))?$""", RegexOption.IGNORE_CASE)
    private val count = Regex("""[0-9]+(?:[,\s\u00a0\u202f][0-9]{3})*""")

    private fun fromValue(value: Double?, max: Double): Score? {
        if (value == null || !value.isFinite() || value !in 0.0..max) return null
        return Score.from10((10 * value / max).coerceAtLeast(1.0))
    }

    private fun percentage(raw: String?) = fromValue(
        percent.matchEntire(raw.orEmpty().trim())?.groupValues?.get(1)?.replace(',', '.')?.toDoubleOrNull(), 100.0,
    )

    private fun votes(up: String?, down: String?): Score? {
        fun read(raw: String?): Double? = raw?.trim()?.takeIf(count::matches)
            ?.filter(Char::isDigit)?.toDoubleOrNull()
        val positive = read(up) ?: return null
        val negative = read(down) ?: return null
        val total = positive + negative
        return if (total.isFinite() && total > 0) fromValue(positive / total, 1.0) else null
    }

    fun api(item: JSONObject): Score? = votes(item.optString("likes"), item.optString("dislikes"))

    fun card(source: String, url: String, card: Element): Score? {
        val selector = when (source) {
            "TubeBDSM" -> ".rating-badge .item-score, .rating-badge"
            "DarknessPorn", "PunishWorld" -> ".rating, .rating-nolike"
            "Perdol" -> ".rating__counter"
            "Pervertium", "BoundHub", "Ebalka" -> ".rating"
            "EPorner" -> ".mbrate"
            "XRares" -> ".video-rating b"
            else -> return null
        }
        val score = card.select(selector).firstNotNullOfOrNull { percentage(it.text()) }
        if (score != null) listing[source to url] = score
        return score
    }

    fun detail(source: String, url: String, page: Document): Score? {
        val listed = listing[source to url]
        if (source == "TubeBDSM") {
            return listed ?: when (URI(page.baseUri()).host.orEmpty().removePrefix("www.")) {
                "eporner.com" -> detail("EPorner", page.baseUri(), page)
                "abxxx.com", "bdsmx.tube", "bdsmx-porn.com" -> page.selectFirst("meta[data-source-votes]")?.let {
                    votes(it.attr("data-likes"), it.attr("data-dislikes"))
                }
                "xhamster.com" -> detail("XHamster", page.baseUri(), page)
                else -> null
            }
        }
        fun text(selector: String) = page.selectFirst(selector)?.text()
        fun pair(up: String, down: String) = votes(text(up), text(down))
        val score = when (source) {
            "NoodleMagazine", "UKDevilz" -> votes(
                page.selectFirst(".meta .like [data-count]")?.attr("data-count"),
                page.selectFirst(".meta .dislike [data-count]")?.attr("data-count"),
            )
            "Ebalka", "BoundHub", "Pervertium" -> percentage(text(".rating-container .rating .voters, .rating-container .voters"))
                ?: pair(".rating-container .rate-like", ".rating-container .rate-dislike")
            "DarknessPorn", "PunishWorld" -> percentage(text("a[data-post_like=like] .likes_count"))
            "Perdol" -> percentage(text(".rating__counter"))
            "Semyana" -> percentage(text("#vote-box .vote-rate"))
            "Vpoisk" -> percentage(text(".video_vote #rate-value, .video_vote #rate-value2"))
                ?: pair(".video_vote #like, .video_vote .like:not([id^=rate-value])", ".video_vote .dislike")
            "Xnxx" -> percentage(text("#video-votes .rating-box.value, .video-votes .rating-box.value"))
                ?: pair(".vote-action-good", ".vote-action-bad")
            "SickR" -> pair(".control_likes .like-value", ".control_likes .dislike-value")
            "Strip2" -> pair("[id^=vote_up_cnt_]", "[id^=vote_down_cnt_]")
            "BDSMStreak" -> pair("#v2-vote [data-count=likes]", "#v2-vote [data-count=dislikes]")
            "XRares" -> pair("#video_likes", "#video_dislikes")?.let {
                val style = page.selectFirst("#video_rate")?.attr("style").orEmpty()
                percentage(Regex("""\bwidth:\s*([0-9.]+%)""").find(style)?.groupValues?.get(1)) ?: it
            }
            "XVideos" -> percentage(text(".vote-actions .rate-infos .good .rating-good-perc"))
                ?: pair(".rating-good-nbr", ".rating-bad-nbr")
            "XHamster" -> {
                val video = EmbeddedPlayers.initials(page)?.optJSONObject("videoEntity")
                val rating = video?.optJSONObject("rating")
                if (rating != null && rating.optLong("entityID", -1) == video.optLong("id", -2)) {
                    api(rating)?.let { fromValue(rating.optDouble("value"), 100.0) ?: it }
                } else null
            }
            "ProstoPorno" -> page.selectFirst(".rate-tab[itemprop=aggregateRating]")?.let { rating ->
                val count = rating.selectFirst("[itemprop=ratingCount]")?.text()?.toIntOrNull()
                val max = rating.selectFirst("meta[itemprop=bestRating]")?.attr("content")?.toDoubleOrNull()
                if (count != null && count > 0 && max == 5.0) {
                    fromValue(rating.selectFirst("meta[itemprop=ratingValue]")?.attr("content")?.toDoubleOrNull(), max)
                } else null
            }
            "ThisVid" -> fromValue(text("li:has(>#rating_container) > .title strong")?.toDoubleOrNull()?.takeIf { it > 0 }, 5.0)
            "HeavyR" -> page.select(".video_rating > .fa-star").takeIf { it.size == 5 }?.let { stars ->
                fromValue(stars.count { !it.hasClass("grey") }.takeIf { it > 0 }?.toDouble(), 5.0)
            }
            "EPorner" -> Metadata.ownVideo(page)?.optJSONObject("aggregateRating")?.let { rating ->
                if (rating.optInt("ratingCount", 0) > 0 && rating.optDouble("bestRating") == 100.0)
                    fromValue(rating.optDouble("ratingValue"), 100.0) else null
            }
            else -> null
        }
        rememberDetail(source, url, score)
        return score ?: listed
    }
}
