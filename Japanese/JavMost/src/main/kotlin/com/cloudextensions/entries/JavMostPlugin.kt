package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.jacekun.JavMost
import com.jacekun.registerJavMostExtractors
@CloudstreamPlugin
class JavMostPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(JavMost().apply { name = "2. JavMost" }));registerJavMostExtractors(this)}
}
