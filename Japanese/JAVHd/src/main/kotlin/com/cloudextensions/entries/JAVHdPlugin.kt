package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.JAVHd.JAVHDProvider
import com.JAVHd.registerJAVHdExtractors
@CloudstreamPlugin
class JAVHdPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(JAVHDProvider().apply { name = "2. JAV HD" }));registerJAVHdExtractors(this)}
}
