package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.SickRProvider
@CloudstreamPlugin
class SickRPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(SickRProvider().apply{name="3. SICK-R"}))}}
