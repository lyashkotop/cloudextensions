package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.example.websites.UKDevilzProvider
@CloudstreamPlugin
class UKDevilzPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(UKDevilzProvider().apply{name="3. UKDevilz"}))}}
