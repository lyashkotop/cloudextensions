package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.example.tubesafari.TubeSafariProvider
@CloudstreamPlugin
class TubeSafariPlugin:Plugin(){override fun load(context:Context){com.cloudextensions.russian.ImagePrefetch.configure(context);com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(TubeSafariProvider().apply{name="3. TubeSafari"}))}}
