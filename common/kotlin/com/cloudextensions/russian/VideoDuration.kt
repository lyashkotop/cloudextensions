package com.cloudextensions.russian

import com.lagradost.cloudstream3.LoadResponse

private fun seconds(clock: String): Long? {
    if (clock.isBlank()) return null
    return clock.split(':').fold(0L) { total, component ->
        total * 60 + (component.toLongOrNull() ?: return null)
    }.takeIf { it > 0 }
}

fun LoadResponse.applyVideoDuration(raw: String?) {
    val clock = Metadata.timing(raw.orEmpty())
    val seconds = seconds(clock) ?: return
    Metadata.rememberDuration(url, clock)
    duration = (seconds / 60).takeIf { it in 1..Int.MAX_VALUE }?.toInt()
}

internal fun LoadResponse.showShortDuration() {
    if ((duration ?: 0) > 0) return
    val seconds = seconds(Metadata.savedDuration(url).orEmpty()) ?: return
    if (seconds >= 60) return
    duration = null
    val label = "${seconds}s"
    val description = plot.orEmpty()
    if (description == label || description.startsWith("$label\n")) return
    plot = if (description.isBlank()) label else "$label\n\n$description"
}
