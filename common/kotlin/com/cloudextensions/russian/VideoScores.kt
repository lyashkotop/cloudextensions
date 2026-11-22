package com.cloudextensions.russian

import com.lagradost.cloudstream3.Score
import java.net.URI
import java.util.Collections
import java.util.concurrent.TimeUnit
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject
import org.json.JSONTokener
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
        "BDSMStreak", "Beeg", "BoundHub", "DarknessPorn", "Ebalka", "EPorner", "HcBDSMX", "HeavyR", "NoodleMagazine",
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

    private val compactCount = Regex("""([0-9]+(?:[.,][0-9]+)?)\s*([kmb])""", RegexOption.IGNORE_CASE)

    private fun voteCount(raw: String?, compact: Boolean): Double? {
        val text = raw?.trim() ?: return null
        if (count.matches(text)) return text.filter(Char::isDigit).toDoubleOrNull()
        if (!compact) return null
        val (number, unit) = compactCount.matchEntire(text)?.destructured ?: return null
        val scale = when (unit.lowercase()) {
            "k" -> 1_000.0
            "m" -> 1_000_000.0
            else -> 1_000_000_000.0
        }
        return number.replace(',', '.').toDoubleOrNull()?.times(scale)
    }

    private fun votes(up: String?, down: String?, compact: Boolean = false): Score? {
        val positive = voteCount(up, compact) ?: return null
        val negative = voteCount(down, compact) ?: return null
        val total = positive + negative
        return if (total.isFinite() && total > 0) fromValue(positive / total, 1.0) else null
    }

    fun api(item: JSONObject): Score? = votes(item.optString("likes"), item.optString("dislikes"))

    internal fun structuredRating(rating: JSONObject?): Score? {
        if (rating == null || maxOf(rating.optLong("ratingCount", 0), rating.optLong("reviewCount", 0)) <= 0) return null
        val best = rating.optDouble("bestRating", 5.0)
        if (!best.isFinite() || best <= 0) return null
        return fromValue(rating.optDouble("ratingValue"), best)
    }

    private const val NEXT_PUSH = "self.__next_f.push("
    private val hcVideoObject = Regex("""\{"id"\s*:\s*[0-9]+\s*,\s*"(?:title|likes)"\s*:""")

    internal fun hcScores(page: Element): Map<String, Score?> {
        val document = page.ownerDocument() ?: return emptyMap()
        // The site splits video objects across successive Next.js data chunks.
        val payload = buildString {
            for (script in document.select("script")) {
                val code = script.data().trimStart()
                if (!code.startsWith(NEXT_PUSH)) continue
                val chunk = try {
                    JSONTokener(code.substring(NEXT_PUSH.length)).nextValue() as? JSONArray
                } catch (_: JSONException) {
                    null
                }
                if (chunk?.optInt(0) == 1) append(chunk.optString(1))
            }
        }
        val cards = mutableMapOf<String, Score?>()
        val videoVotes = mutableMapOf<String, Score?>()
        val current = videoKey(document.baseUri())
        for (candidate in hcVideoObject.findAll(payload)) {
            val video = try {
                JSONObject(payload.substring(candidate.range.first))
            } catch (_: JSONException) {
                continue
            }
            val id = video.optLong("id", -1).takeIf { it > 0 } ?: continue
            if (!video.has("likes") || !video.has("dislikes")) continue
            val key = "hcbdsm.com/video/$id"
            if (video.has("initialVote") && key == current) {
                videoVotes[key] = api(video)
            } else if (absolute(document.baseUri(), video.optString("path"))?.let(::videoKey) == key) {
                cards[key] = api(video)
            }
        }
        return cards + videoVotes
    }

    fun card(source: String, url: String, card: Element): Score? {
        val selector = when (source) {
            "TubeBDSM" -> ".rating-badge .item-score, .rating-badge"
            "DarknessPorn", "PunishWorld" -> ".rating, .rating-nolike"
            "Perdol" -> ".rating__counter"
            "PornoMoloko" -> ".th-rating"
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
            return listed ?: partnerScore(page)
        }
        fun text(selector: String) = page.selectFirst(selector)?.text()
        fun pair(up: String, down: String) = votes(text(up), text(down))
        val score = when (source) {
            "HcBDSMX" -> {
                val key = videoKey(url)
                if (key != videoKey(page.baseUri()) || !key.startsWith("hcbdsm.com/video/")) null
                else hcScores(page)[key] ?: pair(
                    "main .card-villa button[aria-pressed]:has(svg path[d='M7 10v12'])",
                    "main .card-villa button[aria-pressed]:has(svg path[d='M17 14V2'])",
                )
            }
            "NoodleMagazine", "UKDevilz" -> votes(
                page.selectFirst(".meta .like [data-count]")?.attr("data-count"),
                page.selectFirst(".meta .dislike [data-count]")?.attr("data-count"),
            )
            "Ebalka", "BoundHub", "Pervertium" -> percentage(text(".rating-container .rating .voters, .rating-container .voters"))
                ?: pair(".rating-container .rate-like", ".rating-container .rate-dislike")
            "DarknessPorn", "PunishWorld" -> percentage(text("a[data-post_like=like] .likes_count"))
            "Perdol" -> percentage(text(".rating__counter"))
            "PornoMoloko" -> percentage(text(".video-info .video-rating"))
            "Semyana" -> percentage(text("#vote-box .vote-rate"))
            "Vpoisk" -> percentage(text(".video_vote #rate-value, .video_vote #rate-value2"))
                ?: pair(".video_vote #like, .video_vote .like:not([id^=rate-value])", ".video_vote .dislike")
            "Xnxx" -> percentage(text("#video-votes .rating-box.value, .video-votes .rating-box.value"))
                ?: pair(".vote-action-good", ".vote-action-bad")
            "SickR" -> pair(".control_likes .like-value", ".control_likes .dislike-value")
            "Strip2" -> votes(
                page.selectFirst("[id^=vote_up_cnt_]")?.text()?.ifBlank { "0" },
                page.selectFirst("[id^=vote_down_cnt_]")?.text()?.ifBlank { "0" },
            )
            "BDSMStreak" -> pair("#v2-vote [data-count=likes]", "#v2-vote [data-count=dislikes]")
            "XRares" -> pair("#video_likes", "#video_dislikes")?.let {
                val style = page.selectFirst("#video_rate")?.attr("style").orEmpty()
                percentage(Regex("""\bwidth:\s*([0-9.]+%)""").find(style)?.groupValues?.get(1)) ?: it
            }
            // The displayed percentage can be 100% even when the two public counters include dislikes.
            "XVideos" -> votes(
                text(".vote-actions .rate-infos .rating-good-nbr"),
                text(".vote-actions .rate-infos .rating-bad-nbr"),
                compact = true,
            )
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

    private val youPornWatch = Regex("""^/watch/([0-9]+)(?:/.*)?$""")
    private val votePair = Regex("""^([0-9][0-9, ]*)\s*\|\s*([0-9][0-9, ]*)$""")
    private val voteLabel = Regex("""(?i)^([0-9][0-9, ]*)\s+(likes?|dislikes?)$""")
    private val countedPercentage = Regex("""(?i)^([0-9]+(?:[.,][0-9]+)?%)\s*\(([0-9, ]+) votes?\)$""")

    private fun partnerScore(page: Document): Score? {
        val uri = URI(page.baseUri())
        val address = uri.toString()
        fun pair(up: String, down: String) = votes(page.selectFirst(up)?.text(), page.selectFirst(down)?.text())
        val score = when (uri.host.orEmpty().removePrefix("www.")) {
            "youporn.com" -> {
                val id = youPornWatch.matchEntire(uri.path.orEmpty())?.groupValues?.get(1)
                if (id == null) null else page.selectFirst("#js_videoLikeDislikeWrapper:has(#js_videoLike[data-videoid=$id]) .tm_rating_percent")
                    ?.text()?.takeUnless { it == "0%" }?.let(::percentage)
            }
            "eporner.com" -> detail("EPorner", address, page)
            "xvideos.com" -> detail("XVideos", address, page)
            "xhamster.com" -> detail("XHamster", address, page)
            "xnxx.com" -> detail("Xnxx", address, page)
            "hcbdsm.com" -> detail("HcBDSMX", address, page)
            "abxxx.com", "bdsmx.tube", "bdsmx-porn.com" -> page.selectFirst("meta[data-source-votes]")?.let {
                votes(it.attr("data-likes"), it.attr("data-dislikes"))
            }
            "fetishpapa.com", "pornoxo.com" -> pair("#item-info .js-likes-count", "#item-info .js-dislikes-count")
            "winporn.com" -> pair("#like-video-data", "#not-like-video-data")
            "fapcat.com" -> pair(".btn-rate-drop .rate-like", ".btn-rate-drop .rate-dislike")
            "xcafe.com" -> page.selectFirst(".video_meta .current_rating[itemprop=aggregateRating]")?.let { rating ->
                val count = rating.selectFirst("meta[itemprop=ratingCount]")?.attr("content")
                if ((voteCount(count, compact = false) ?: 0.0) > 0)
                    percentage(rating.selectFirst("[itemprop=ratingValue]")?.text())
                else null
            }
            else -> null
        }
        return score ?: templateRating(page) ?: structuredRating(Metadata.ownVideo(page)?.optJSONObject("aggregateRating"))
    }

    /** These voting controls belong to the player details, outside the related cards and comments. */
    private fun templateRating(page: Document): Score? {
        val up = page.selectFirst("#flag_like_this_video")
        val down = page.selectFirst("#flag_dislike_this_video")
        votes(up?.text(), down?.text())?.let { return it }
        for (panel in page.select(".video-info .rating-container, .player_tools .rating-container, .block-video .rating-container")) {
            val like = panel.selectFirst(".rate-like")
            val dislike = panel.selectFirst(".rate-dislike")
            if (like == null || dislike == null) continue
            votes(like.text(), dislike.text())?.let { return it }
            votes(
                panel.selectFirst(".vote-wrapper:has(.rate-like) .vote-wrapper__count")?.text(),
                panel.selectFirst(".vote-wrapper:has(.rate-dislike) .vote-wrapper__count")?.text(),
            )?.let { return it }
            val counts = panel.select(".rating-info .text").mapNotNull { voteLabel.matchEntire(it.text()) }
                .associate { it.groupValues[2].lowercase().trimEnd('s') to it.groupValues[1] }
            votes(counts["like"], counts["dislike"])?.let { return it }
            val text = panel.selectFirst(".rating .voters")?.text().orEmpty()
            votePair.matchEntire(text)?.destructured?.let { (positive, negative) ->
                votes(positive, negative)?.let { return it }
            }
            countedPercentage.matchEntire(text)?.destructured?.let { (value, count) ->
                if ((voteCount(count, compact = false) ?: 0.0) > 0) percentage(value)?.let { return it }
            }
        }
        return null
    }
}
