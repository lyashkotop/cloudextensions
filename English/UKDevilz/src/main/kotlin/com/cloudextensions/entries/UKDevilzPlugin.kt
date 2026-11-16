package com.cloudextensions.entries

import android.content.Context
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin
import com.CXXX.NoodleMagazineProvider

@CloudstreamPlugin
class UKDevilzPlugin:Plugin(){
    override fun load(context:Context){
        registerMainAPI(NoodleMagazineProvider().apply{name="3. UKDevilz"})
    }
}
