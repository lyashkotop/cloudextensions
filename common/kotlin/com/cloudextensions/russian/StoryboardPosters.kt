package com.cloudextensions.russian

import android.graphics.Bitmap
import android.graphics.BitmapRegionDecoder
import android.graphics.Rect
import com.lagradost.cloudstream3.app
import java.io.File
import java.security.MessageDigest
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.Request

internal object StoryboardPosters {
    private const val MAX_SHEET_BYTES = 524_288L
    private const val MAX_CACHED_POSTERS = 192
    private val coordinates = Regex("""^xywh=(\d{1,4}),(\d{1,4}),(\d{1,3}),(\d{1,3})$""")
    private val cleanup = Any()

    data class Frame(val sheet: String, val x: Int, val y: Int, val width: Int, val height: Int)

    fun frames(text: String, base: String): List<Frame> {
        if (!text.trimStart('\uFEFF').startsWith("WEBVTT")) return emptyList()
        val sheets = text.lineSequence().mapNotNull { line ->
            val url = Metadata.imageUrl(base, line.trim().takeIf { "#xywh=" in it }) ?: return@mapNotNull null
            val (x, y, width, height) = coordinates.matchEntire(url.substringAfterLast('#'))
                ?.groupValues?.drop(1)?.map(String::toInt) ?: return@mapNotNull null
            if (width < 100 || height < 75) return@mapNotNull null
            Frame(url.substringBeforeLast('#'), x, y, width, height)
        }.distinctBy { it.sheet }.take(120).toList()
        if (sheets.size <= 6) return sheets
        return listOf(0, 1, sheets.size / 2, 2, sheets.size / 4, sheets.size * 3 / 4)
            .distinct().map(sheets::get)
    }

    fun cached(video: String): String? = destination(video)?.takeIf { it.isFile && it.length() > 0 }
        ?.posterUrl()

    private fun File.posterUrl() = toURI().toASCIIString().replaceFirst("file:/", "file:///")

    private fun destination(video: String): File? {
        val cache = ImagePrefetch.cacheDirectory() ?: return null
        val key = MessageDigest.getInstance("SHA-256").digest(videoKey(video).toByteArray())
            .joinToString("") { "%02x".format(it) }
        return File(File(cache, "cloudextensions-storyboards"), "$key.jpg")
    }

    suspend fun save(video: String, frame: Frame, headers: Map<String, String>): String? {
        val destination = destination(video) ?: return null
        val request = Request.Builder().url(frame.sheet)
        headers.forEach { (key, value) -> request.header(key, value) }
        val bytes = Network.read(request.build(), app.baseClient) { response ->
            if (!response.isSuccessful) return@read null
            val body = response.body ?: return@read null
            val input = body.source()
            if (input.request(MAX_SHEET_BYTES + 1)) return@read null
            input.readByteArray()
        } ?: return null
        return withContext(Dispatchers.IO) {
            @Suppress("DEPRECATION")
            val decoder = BitmapRegionDecoder.newInstance(bytes, 0, bytes.size, false) ?: return@withContext null
            val bitmap = try {
                val right = frame.x + frame.width
                val bottom = frame.y + frame.height
                if (right > decoder.width || bottom > decoder.height) return@withContext null
                decoder.decodeRegion(Rect(frame.x, frame.y, right, bottom), null) ?: return@withContext null
            } finally {
                decoder.recycle()
            }
            try {
                val folder = destination.parentFile ?: return@withContext null
                if (!folder.isDirectory && !folder.mkdirs() && !folder.isDirectory) return@withContext null
                val temp = File.createTempFile("poster-", ".tmp", folder)
                try {
                    if (!temp.outputStream().use { bitmap.compress(Bitmap.CompressFormat.JPEG, 86, it) }) return@withContext null
                    if (!temp.renameTo(destination)) return@withContext null
                    synchronized(cleanup) {
                        val posters = folder.listFiles { file -> file.extension == "jpg" && file != destination }.orEmpty()
                        posters.sortedByDescending { it.lastModified() }.drop(MAX_CACHED_POSTERS - 1).forEach { it.delete() }
                    }
                    destination.posterUrl()
                } finally {
                    temp.delete()
                }
            } finally {
                bitmap.recycle()
            }
        }
    }
}
