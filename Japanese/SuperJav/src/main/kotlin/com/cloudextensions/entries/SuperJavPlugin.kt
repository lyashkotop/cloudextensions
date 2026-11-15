package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.CXXX.SuperJav
import com.CXXX.registerSuperJavExtractors
@CloudstreamPlugin
class SuperJavPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(SuperJav().apply { name = "2. SupJav" }));registerSuperJavExtractors(this)}
}
