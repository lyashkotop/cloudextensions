package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.lagradost.VideoHubProvider
@CloudstreamPlugin
class PornVideosPlugin:Plugin(){override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(VideoHubProvider().apply{name="3. PornVideos.rs"}))}}
