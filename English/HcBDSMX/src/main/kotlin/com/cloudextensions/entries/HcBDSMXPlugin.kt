package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.HcBdsMxProvider
@CloudstreamPlugin
class HcBDSMXPlugin:Plugin(){override fun load(context:Context){com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(HcBdsMxProvider().apply{name="3. hcBDSM"}))}}
