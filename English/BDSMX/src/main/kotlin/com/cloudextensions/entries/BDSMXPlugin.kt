package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.BdsMxProvider
@CloudstreamPlugin
class BDSMXPlugin:Plugin(){override fun load(context:Context){registerMainAPI(BdsMxProvider().apply{name="3. BDSMX"})}}
