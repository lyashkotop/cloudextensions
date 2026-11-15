package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.byayzen.Javseen
import com.byayzen.registerJavseenExtractors
@CloudstreamPlugin
class JavseenPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(Javseen().apply { name = "2. Javseen" }));registerJavseenExtractors(this)}
}
