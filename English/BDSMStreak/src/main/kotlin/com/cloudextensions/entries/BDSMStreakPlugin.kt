package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.sites.BDSMStreakProvider
@CloudstreamPlugin
class BDSMStreakPlugin:Plugin(){override fun load(context:Context){com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(BDSMStreakProvider().apply{name="3. BDSM Streak"}))}}
