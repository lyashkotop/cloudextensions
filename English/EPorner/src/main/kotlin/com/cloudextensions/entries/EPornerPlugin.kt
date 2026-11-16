package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.byayzen.EPorner
import com.byayzen.registerEPornerExtractors
@CloudstreamPlugin
class EPornerPlugin: Plugin(){
 override fun load(context:Context){com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(com.cloudextensions.russian.AdaptedProvider(EPorner().apply { name = "3. EPorner" })));registerEPornerExtractors(this)}
}
