package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.DarknessPornProvider
@CloudstreamPlugin
class DarknessPornPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(DarknessPornProvider().apply{name="3. DarknessPorn"}))}}
