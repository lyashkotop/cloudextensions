package com.cloudextensions.russian

import com.lagradost.cloudstream3.LoadResponse

private fun seconds(clock: String): Long? {
    if (clock.isBlank()) return null
    return clock.split(':').fold(0L) { total, component ->
        total * 60 + (component.substringBefore('.').toLongOrNull() ?: return null)
    }.takeIf { it > 0 }
}

fun LoadResponse.applyVideoDuration(raw: String?) {
    val clock = Metadata.timing(raw.orEmpty())
    val seconds = seconds(clock) ?: return
    duration = (seconds / 60).coerceAtLeast(1).takeIf { it <= Int.MAX_VALUE }?.toInt()
}
