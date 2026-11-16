package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.Javpoint.Javdoe
import com.Javpoint.registerJavdoeExtractors
@CloudstreamPlugin
class JavdoePlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(Javdoe().apply { name = "2. Javdoe" }));registerJavdoeExtractors(this)}
}
