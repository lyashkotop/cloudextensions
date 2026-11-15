package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.russian.AdaptedProvider
import com.kraptor.XRares
import com.kraptor.registerXRaresExtractors
@CloudstreamPlugin
class XRaresPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(AdaptedProvider(XRares().apply{name="3. XRares"}));registerXRaresExtractors(this)}
}
