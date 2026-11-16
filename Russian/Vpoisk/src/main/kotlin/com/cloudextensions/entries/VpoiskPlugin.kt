package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.example.websites.VpoiskProvider

@CloudstreamPlugin
class VpoiskPlugin: Plugin() {
    override fun load(context: Context) { registerMainAPI(com.cloudextensions.russian.ReliableProvider(VpoiskProvider().apply { name = "1. Vpoisk" })) }
}
