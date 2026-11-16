package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.jacekun.JavGuru
import com.jacekun.registerJavGuruExtractors
@CloudstreamPlugin
class JavGuruPlugin: Plugin(){
 override fun load(context:Context){com.cloudextensions.russian.ImagePrefetch.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(com.cloudextensions.russian.AdaptedProvider(JavGuru().apply { name = "2. JAVGuru" })));registerJavGuruExtractors(this)}
}
