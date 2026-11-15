package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.streambundleextra.ProstoPornoProvider

@CloudstreamPlugin
class ProstoPornoPlugin: Plugin() {
    override fun load(context: Context) { registerMainAPI(ProstoPornoProvider().apply { name = "1. ProstoPorno" }) }
}
