package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.streambundleextra.PerdolProvider

@CloudstreamPlugin
class PerdolPlugin: Plugin() {
    override fun load(context: Context) {com.cloudextensions.russian.ImagePrefetch.configure(context); com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(PerdolProvider().apply { name = "1. Perdol.net" })) }
}
