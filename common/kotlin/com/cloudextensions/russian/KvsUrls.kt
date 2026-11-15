// Adapted from ByAyzen KtPlayerExtractor; upstream provenance: imports/remaining-kotlin.
package com.cloudextensions.russian
import kotlin.math.abs
/** Decode only the source player URL using its declared license; never invent media URLs. */
object KvsUrls {
    fun decode(url: String, license: String?): String? {
        if (!url.startsWith("function/0/")) return url

        val raw   = url.removePrefix("function/0/")
        val token = licenseToken(license.orEmpty())
        if (token.size < 32) {
            return null
        }

        val schemeEnd = raw.indexOf("://")
        val hostEnd   = if (schemeEnd < 0) -1 else raw.indexOf('/', schemeEnd + 3)
        if (hostEnd < 0) return null

        val rest  = raw.substring(hostEnd)
        val path  = rest.substringBefore("?")
        val parts = path.split("/").toMutableList()
        if (parts.size < 4 || parts[3].length < 32) return null

        val hash    = parts[3].take(32)
        val indices = IntArray(32) { it }
        var accum   = 0

        for (source in 32 - 1 downTo 0) {
            accum += token[source]
            val target = (source + accum) % 32
            val swap   = indices[source]
            indices[source] = indices[target]
            indices[target] = swap
        }

        parts[3] = indices.map { hash[it] }.joinToString("") + parts[3].substring(32)

        return raw.substring(0, hostEnd) + parts.joinToString("/") + rest.substring(path.length)
    }

    private fun licenseToken(licenseCode: String): List<Int> {
        val license = licenseCode.replace("$", "")
        if (license.isEmpty() || license.any { !it.isDigit() }) return emptyList()

        val digits = license.map { it - '0' }
        val masked = license.replace('0', '1')
        val center = masked.length / 2
        val front  = masked.take(center + 1).toLongOrNull() ?: return emptyList()
        val back   = masked.substring(center).toLongOrNull() ?: return emptyList()
        val scaled = (4 * abs(front - back)).toString().take(center + 1)

        val token = mutableListOf<Int>()
        scaled.forEachIndexed { index, char ->
            for (offset in 0 until 4) {
                val digit = digits.getOrNull(index + offset) ?: return emptyList()
                token += (digit + (char - '0')) % 10
            }
        }
        return token
    }

}
