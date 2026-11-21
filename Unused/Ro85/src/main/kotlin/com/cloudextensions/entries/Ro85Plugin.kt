package com.cloudextensions.entries

import android.content.Context
import com.cloudextensions.russian.ImagePrefetch
import com.cloudextensions.russian.ReliableProvider
import com.cloudextensions.russian.Translation
import com.cloudextensions.sites.Ro85Provider
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin

@CloudstreamPlugin
class Ro85Plugin : Plugin() {
    override fun load(context: Context) {
        ImagePrefetch.configure(context)
        Translation.configure(context)
        registerMainAPI(ReliableProvider(Ro85Provider()))
    }
}
