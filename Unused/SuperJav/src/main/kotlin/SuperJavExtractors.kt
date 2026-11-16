package com.CXXX
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import android.content.Context
import com.lagradost.cloudstream3.extractors.StreamTape

fun registerSuperJavExtractors(plugin: Plugin) {

        plugin.registerExtractorAPI(EmturbovidExtractor())
        plugin.registerExtractorAPI(StreamTape())
        plugin.registerExtractorAPI(watchadsontape())
        plugin.registerExtractorAPI(fc2stream())
        plugin.registerExtractorAPI(Luminscdn())
    
}
