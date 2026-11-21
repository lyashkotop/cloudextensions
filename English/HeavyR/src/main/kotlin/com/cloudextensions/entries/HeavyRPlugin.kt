package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.byayzen.Heavy
import com.byayzen.registerHeavyRExtractors
@CloudstreamPlugin
class HeavyRPlugin: Plugin(){
 override fun load(context:Context){com.cloudextensions.russian.ImagePrefetch.configure(context);com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(com.cloudextensions.russian.AdaptedProvider(Heavy().apply { name = "3. Heavy-R" }), "HeavyR"));registerHeavyRExtractors(this)}
}
