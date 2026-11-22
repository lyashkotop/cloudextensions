package com.cloudextensions.entries

import android.content.Context
import com.cloudextensions.russian.ImagePrefetch
import com.cloudextensions.russian.ReliableProvider
import com.cloudextensions.russian.Translation
import com.cloudextensions.sites.ECamRipsProvider
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin

@CloudstreamPlugin
class ECamRipsPlugin : Plugin() {
    override fun load(context: Context) {
        ImagePrefetch.configure(context)
        Translation.configure(context)
        registerMainAPI(ReliableProvider(ECamRipsProvider().apply { name = "3. eCamRips" }))
    }
}
