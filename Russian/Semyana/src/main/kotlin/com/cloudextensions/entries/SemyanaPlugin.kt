package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.example.websites.SemyanaProvider

@CloudstreamPlugin
class SemyanaPlugin: Plugin() {
    override fun load(context: Context) { registerMainAPI(SemyanaProvider().apply { name = "1. Semyana" }) }
}
