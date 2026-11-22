package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import java.io.File
import java.io.RandomAccessFile
import java.nio.ByteBuffer
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.Request

/** Gives the local decoder the first frames and the MP4 index at their original file offsets. */
internal object Mp4PosterInput {
    private const val PREFIX_BYTES = 512 * 1024
    private const val INDEX_BYTES = 2 * 1024 * 1024
    private const val MAX_FILE_BYTES = 2L * 1024 * 1024 * 1024
    private const val FTYP = 0x66747970
    private const val MOOV = 0x6d6f6f76
    private val contentRange = Regex("""bytes (\d+)-(\d+)/(\d+)""")

    private data class Part(val bytes: ByteArray, val total: Long)

    private suspend fun read(url: String, referer: String, offset: Long, limit: Int): Part? {
        val request = Request.Builder().url(url)
            .header("User-Agent", NoodlePlayback.USER_AGENT)
            .header("Accept-Encoding", "identity")
            .header("Range", "bytes=$offset-${offset + limit - 1}")
            .apply { if (referer.isNotBlank()) header("Referer", referer) }
            .build()
        val client = app.baseClient.newBuilder().callTimeout(2500, TimeUnit.MILLISECONDS).build()
        return Network.read(request, client) { response ->
            val body = response.body ?: return@read null
            val total = when {
                response.code == 206 -> {
                    val match = contentRange.matchEntire(response.header("Content-Range").orEmpty()) ?: return@read null
                    if (match.groupValues[1].toLongOrNull() != offset) return@read null
                    match.groupValues[3].toLongOrNull()
                }
                response.code == 200 && offset == 0L -> body.contentLength()
                else -> null
            }?.takeIf { it in (offset + 1)..MAX_FILE_BYTES } ?: return@read null
            val count = minOf(limit.toLong(), total - offset)
            val input = body.source()
            if (!input.request(count)) return@read null
            Part(input.readByteArray(count), total)
        }
    }

    suspend fun prepare(destination: File, url: String, referer: String): Boolean {
        val prefix = read(url, referer, 0L, PREFIX_BYTES) ?: return false
        val data = ByteBuffer.wrap(prefix.bytes)
        if (MediaDuration.atom(data, 0)?.kind != FTYP) return false
        var cursor = 0L
        while (cursor < data.limit()) {
            val box = MediaDuration.atom(data, cursor.toInt()) ?: break
            if (box.size > prefix.total - cursor) return false
            if (box.kind == MOOV) {
                if (box.size <= data.limit() - cursor) {
                    write(destination, prefix, 0L, null)
                    return true
                }
                break
            }
            cursor += box.size
        }
        if (cursor >= prefix.total) return false
        val index = read(url, referer, cursor, INDEX_BYTES)?.takeIf { it.total == prefix.total } ?: return false
        val indexData = ByteBuffer.wrap(index.bytes)
        var position = 0
        while (position < index.bytes.size) {
            val box = MediaDuration.atom(indexData, position) ?: return false
            if (box.size > index.bytes.size - position) return false
            if (box.kind == MOOV) {
                write(destination, prefix, cursor, index.bytes)
                return true
            }
            position += box.size.toInt()
        }
        return false
    }

    private suspend fun write(destination: File, prefix: Part, offset: Long, index: ByteArray?) =
        withContext(Dispatchers.IO) {
            RandomAccessFile(destination, "rw").use {
                it.setLength(0)
                it.setLength(prefix.total)
                it.write(prefix.bytes)
                if (index != null) {
                    it.seek(offset)
                    it.write(index)
                }
            }
        }
}
