package com.lagradost

import com.cloudextensions.russian.VideoCard
import com.lagradost.cloudstream3.SearchResponse
import java.io.File
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONArray
import org.json.JSONObject

/** A small snapshot of each first page for a quick reopen of the app. */
internal class NoodleHomeCache(private val directory: File) {
    data class Page(val number: Int, val cards: List<VideoCard>)

    suspend fun read(section: String): Page? = withContext(Dispatchers.IO) {
        runCatching {
            val file = file(section)
            val age = System.currentTimeMillis() - file.lastModified()
            if (age !in 0 until 6 * 60 * 60_000L || file.length() !in 1..128_000) return@runCatching null

            val snapshot = JSONObject(file.readText())
            val page = snapshot.getInt("page")
            if (snapshot.optString("section") != section || page !in 1..9) return@runCatching null

            val cards = snapshot.getJSONArray("cards")
            val items = (0 until cards.length()).map { index ->
                val card = cards.getJSONArray(index)
                VideoCard(card.getString(0), card.getString(1), card.optString(2).ifBlank { null })
            }
            Page(page, items).takeIf { items.isNotEmpty() }
        }.getOrNull()
    }

    suspend fun write(section: String, page: Int, cards: List<SearchResponse>) = withContext(Dispatchers.IO) {
        if (cards.isEmpty() || page !in 1..9) return@withContext
        runCatching {
            val items = JSONArray()
            cards.forEach { card ->
                items.put(JSONArray().put(card.name).put(card.url).put(card.posterUrl.orEmpty()))
            }
            val snapshot = JSONObject().put("section", section).put("page", page).put("cards", items)
            directory.mkdirs()
            val temp = File.createTempFile("page", ".tmp", directory)
            try {
                temp.writeText(snapshot.toString())
                temp.renameTo(file(section))
            } finally {
                temp.delete()
            }
        }
        Unit
    }

    private fun file(section: String) = File(directory, section.hashCode().toUInt().toString(16) + ".json")
}
