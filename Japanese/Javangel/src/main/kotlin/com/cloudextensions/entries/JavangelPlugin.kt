package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.Javpoint.Javangel
import com.Javpoint.registerJavangelExtractors
@CloudstreamPlugin
class JavangelPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(Javangel().apply { name = "2. Javangel" }));registerJavangelExtractors(this)}
}
