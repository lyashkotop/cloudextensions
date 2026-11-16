package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.BoundHubProvider
@CloudstreamPlugin
class BoundHubPlugin:Plugin(){override fun load(context:Context){com.cloudextensions.russian.ImagePrefetch.configure(context);com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(BoundHubProvider().apply{name="3. BoundHub"}))}}
