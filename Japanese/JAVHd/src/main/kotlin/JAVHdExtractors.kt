package com.JAVHd
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import android.content.Context
import com.lagradost.cloudstream3.extractors.StreamTape

fun registerJAVHdExtractors(plugin: Plugin) {

        plugin.registerExtractorAPI(StreamTape())
        plugin.registerExtractorAPI(Stbturbo())
        plugin.registerExtractorAPI(Turbovid())
        plugin.registerExtractorAPI(MyCloudZ())
        plugin.registerExtractorAPI(Cloudwish())
        plugin.registerExtractorAPI(TurbovidVip())
        plugin.registerExtractorAPI(Streambeast())
    
}
