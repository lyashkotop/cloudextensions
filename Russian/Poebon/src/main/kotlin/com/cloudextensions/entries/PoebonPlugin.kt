package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.sites.PoebonProvider
@CloudstreamPlugin
class PoebonPlugin:Plugin(){override fun load(context:Context){registerMainAPI(PoebonProvider().apply{name="1. Poebon"})}}
