package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.Javx.Javx
import com.Javx.registerJavxExtractors
@CloudstreamPlugin
class JavxPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(Javx().apply { name = "2. Javx" }));registerJavxExtractors(this)}
}
