package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.lagradost.XnxxProvider
@CloudstreamPlugin
class XnxxPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(XnxxProvider().apply{name="3. XNXX"}))}}
