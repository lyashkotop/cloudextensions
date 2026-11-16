package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.streambundleextra.HuyambaProvider

@CloudstreamPlugin
class HuyambaPlugin: Plugin() {
    override fun load(context: Context) { registerMainAPI(com.cloudextensions.russian.ReliableProvider(HuyambaProvider().apply { name = "1. Huyamba" })) }
}
