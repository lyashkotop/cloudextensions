package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.HcBdsMxProvider
@CloudstreamPlugin
class HcBDSMXPlugin:Plugin(){override fun load(context:Context){registerMainAPI(HcBdsMxProvider().apply{name="3. hcBDSM"})}}
