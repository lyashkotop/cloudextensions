package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.lagradost.NoodleMagazineProvider

@CloudstreamPlugin
class NoodleMagazinePlugin: Plugin() {
    override fun load(context: Context) { registerMainAPI(NoodleMagazineProvider()) }
}
