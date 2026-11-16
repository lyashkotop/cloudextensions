package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.ThisVidProvider
@CloudstreamPlugin
class ThisVidPlugin:Plugin(){override fun load(context:Context){com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(ThisVidProvider().apply{name="3. ThisVid"}))}}
