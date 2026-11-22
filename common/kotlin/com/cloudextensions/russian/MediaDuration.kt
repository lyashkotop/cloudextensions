package com.cloudextensions.russian

import com.lagradost.cloudstream3.app
import java.nio.ByteBuffer
import java.util.concurrent.TimeUnit
import okhttp3.Request

/** Reads the movie clock from the MP4 container with a pair of bounded HTTP range requests. */
object MediaDuration {
    private const val RANGE_BYTES = 16_384
    private const val FTYP = 0x66747970
    private const val MOOV = 0x6d6f6f76
    private const val MVHD = 0x6d766864

    internal data class Atom(val kind: Int, val size: Long, val header: Int)

    internal fun atom(data: ByteBuffer, start: Int): Atom? {
        if (start < 0 || start > data.limit() - 8) return null
        val kind = data.getInt(start + 4)
        val shortSize = data.getInt(start).toLong() and 0xffffffffL
        val extended = shortSize == 1L
        val header = if (extended) 16 else 8
        if (start > data.limit() - header) return null
        val bytes = if (extended) data.getLong(start + 8) else shortSize
        return Atom(kind, bytes, header).takeIf { bytes >= header }
    }

    private fun clock(data: ByteBuffer, start: Int, end: Int): String? {
        var child = start
        while (child < end) {
            val box = atom(data, child) ?: return null
            val payload = child + box.header
            if (box.kind == MVHD) {
                if (payload >= end || box.size < box.header + 20) return null
                val version = data.get(payload).toInt()
                val scaleAt = payload + if (version == 1) 20 else 12
                val bytes = if (version == 1) 12 else 8
                if (version !in 0..1 || scaleAt > end - bytes || box.size < scaleAt - child + bytes) return null
                val scale = data.getInt(scaleAt).toLong() and 0xffffffffL
                val ticks = if (version == 1) data.getLong(scaleAt + 4) else data.getInt(scaleAt + 4).toLong() and 0xffffffffL
                if (scale == 0L || ticks <= 0 || (version == 0 && ticks == 0xffffffffL)) return null
                return (ticks / scale).takeIf { it > 0 }?.toString()
            }
            if (box.size > end - child) return null
            child += box.size.toInt()
        }
        return null
    }

    private suspend fun range(url: String, referer: String, offset: Long): ByteArray? {
        val request = Request.Builder().url(url)
            .header("Referer", referer)
            .header("User-Agent", Network.USER_AGENT)
            .header("Accept-Encoding", "identity")
            .header("Range", "bytes=$offset-${offset + RANGE_BYTES - 1}")
            .build()
        val client = app.baseClient.newBuilder().callTimeout(2, TimeUnit.SECONDS).build()
        return Network.read(request, client) { response ->
            val valid = if (response.code == 206) {
                response.header("Content-Range")?.substringAfter("bytes ")?.substringBefore('-')?.toLongOrNull() == offset
            } else response.code == 200 && offset == 0L
            if (!valid) return@read null
            val input = response.body?.source() ?: return@read null
            input.request(RANGE_BYTES.toLong())
            input.buffer.readByteArray(minOf(RANGE_BYTES.toLong(), input.buffer.size))
        }
    }

    suspend fun fromMp4(url: String?, referer: String): String? {
        if (url.isNullOrBlank() || !url.startsWith("https://")) return null
        return RequestLimits.optional(2700) {
            var offset = 0L
            repeat(2) {
                val bytes = range(url, referer, offset) ?: return@optional null
                val data = ByteBuffer.wrap(bytes)
                if (offset == 0L && atom(data, 0)?.kind != FTYP) return@optional null
                var position = 0
                while (position < data.limit()) {
                    val box = atom(data, position) ?: return@optional null
                    if (box.kind == MOOV) {
                        val end = position + minOf(box.size, (data.limit() - position).toLong()).toInt()
                        return@optional clock(data, position + box.header, end)
                    }
                    if (box.size >= data.limit() - position) {
                        if (box.size > Long.MAX_VALUE - offset - position - RANGE_BYTES) return@optional null
                        offset += position + box.size
                        break
                    }
                    position += box.size.toInt()
                }
            }
            null
        }
    }
}
