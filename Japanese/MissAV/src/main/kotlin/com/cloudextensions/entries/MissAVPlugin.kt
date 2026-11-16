package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.byayzen.MissAV
import com.byayzen.registerMissAVExtractors
@CloudstreamPlugin
class MissAVPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(com.cloudextensions.russian.AdaptedProvider(MissAV().apply { name = "2. MissAV" })));registerMissAVExtractors(this)}
}
