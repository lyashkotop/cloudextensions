package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.SickJunkProvider
@CloudstreamPlugin
class SickJunkPlugin:Plugin(){override fun load(context:Context){com.cloudextensions.russian.ImagePrefetch.configure(context);com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(SickJunkProvider().apply{name="3. SickJunk"}))}}
