package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.sites.TubeBDSMProvider
@CloudstreamPlugin
class TubeBDSMPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(TubeBDSMProvider().apply{name="3. TubeBDSM"}))}}
