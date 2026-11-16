package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.HurtSexProvider
@CloudstreamPlugin
class HurtSexPlugin:Plugin(){override fun load(context:Context){com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(HurtSexProvider().apply{name="3. HurtSex"}))}}
