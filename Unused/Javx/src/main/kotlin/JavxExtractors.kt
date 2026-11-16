package com.Javx
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import android.content.Context

fun registerJavxExtractors(plugin: Plugin) {

        // All providers should be added in this manner. Please don't edit the providers list directly.

        plugin.registerExtractorAPI(StreamwishHG())
    
}
