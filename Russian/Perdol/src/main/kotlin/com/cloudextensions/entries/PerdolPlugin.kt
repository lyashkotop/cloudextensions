package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.streambundleextra.PerdolProvider

@CloudstreamPlugin
class PerdolPlugin: Plugin() {
    override fun load(context: Context) { registerMainAPI(com.cloudextensions.russian.ReliableProvider(PerdolProvider().apply { name = "1. Perdol.net" })) }
}
