package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.BoundHubProvider
@CloudstreamPlugin
class BoundHubPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(BoundHubProvider().apply{name="3. BoundHub"}))}}
