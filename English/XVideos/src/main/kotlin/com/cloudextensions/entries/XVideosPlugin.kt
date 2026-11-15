package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.russian.AdaptedProvider
import com.byayzen.xVideos
import com.byayzen.registerXVideosExtractors
@CloudstreamPlugin
class XVideosPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(AdaptedProvider(xVideos().apply{name="3. xVideos"}));registerXVideosExtractors(this)}
}
