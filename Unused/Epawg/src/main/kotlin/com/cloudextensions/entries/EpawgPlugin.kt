package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.kraptor.EPawg
import com.kraptor.registerEpawgExtractors
@CloudstreamPlugin
class EpawgPlugin: Plugin(){
 override fun load(context:Context){com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(com.cloudextensions.russian.AdaptedProvider(EPawg().apply { name = "3. Epawg" })));registerEpawgExtractors(this)}
}
