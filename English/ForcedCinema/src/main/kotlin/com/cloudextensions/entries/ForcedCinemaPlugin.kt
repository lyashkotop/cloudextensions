package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.ForcedCinemaProvider
@CloudstreamPlugin
class ForcedCinemaPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(ForcedCinemaProvider().apply{name="3. ForcedCinema"}))}}
