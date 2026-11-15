package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.example.ebalka.EbalkaProvider

@CloudstreamPlugin
class EbalkaPlugin: Plugin() {
    override fun load(context: Context) { registerMainAPI(EbalkaProvider().apply { name = "1. Ebalka" }) }
}
