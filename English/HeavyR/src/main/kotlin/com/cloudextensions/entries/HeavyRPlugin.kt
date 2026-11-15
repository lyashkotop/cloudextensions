package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.byayzen.Heavy
import com.byayzen.registerHeavyRExtractors
@CloudstreamPlugin
class HeavyRPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(Heavy().apply { name = "3. Heavy-R" }));registerHeavyRExtractors(this)}
}
