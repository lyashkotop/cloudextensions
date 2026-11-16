package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.Javpoint.JavEnglish
import com.Javpoint.registerJavEnglishExtractors
@CloudstreamPlugin
class JavEnglishPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(JavEnglish().apply { name = "2. Jav English" }));registerJavEnglishExtractors(this)}
}
