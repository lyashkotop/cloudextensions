package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.russian.AdaptedProvider
import com.kraptor.XRares
import com.kraptor.registerXRaresExtractors
@CloudstreamPlugin
class XRaresPlugin: Plugin(){
 override fun load(context:Context){com.cloudextensions.russian.ImagePrefetch.configure(context);com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(AdaptedProvider(XRares().apply{name="3. XRares"}), "XRares"));registerXRaresExtractors(this)}
}
