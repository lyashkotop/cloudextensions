package com.byayzen
import android.content.Context
import com.byayzen.xVideosExtractor
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin

fun registerXVideosExtractors(plugin: Plugin) {

        plugin.registerExtractorAPI(xVideosExtractor())

}
