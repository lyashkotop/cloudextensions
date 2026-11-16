package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.streambundleextra.PunishBangProvider
@CloudstreamPlugin
class PunishBangPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(PunishBangProvider().apply{name="3. PunishBang"}))}}
