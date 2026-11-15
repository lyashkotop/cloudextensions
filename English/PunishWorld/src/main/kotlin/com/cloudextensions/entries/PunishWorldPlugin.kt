package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.PunishWorldProvider
@CloudstreamPlugin
class PunishWorldPlugin:Plugin(){override fun load(context:Context){registerMainAPI(PunishWorldProvider().apply{name="3. Punishworld"})}}
