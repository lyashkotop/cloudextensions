package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.example.websites.Strip2Provider

@CloudstreamPlugin
class Strip2Plugin: Plugin() {
    override fun load(context: Context) { com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(Strip2Provider().apply { name = "1. Strip2" })) }
}
