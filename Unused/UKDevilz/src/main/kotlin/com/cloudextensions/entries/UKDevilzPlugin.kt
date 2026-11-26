package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.CXXX.NoodleMagazineProvider

@CloudstreamPlugin
class UKDevilzPlugin:Plugin(){
    override fun load(context:Context){
        com.cloudextensions.russian.ImagePrefetch.configure(context)
        com.cloudextensions.russian.Translation.configure(context)
        registerMainAPI(com.cloudextensions.russian.ReliableProvider(NoodleMagazineProvider().apply{name="3. UKDevilz"}, "UKDevilz"))
    }
}
