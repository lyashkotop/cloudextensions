package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.watchuu.beeg.BeegProvider
import com.watchuu.beeg.registerBeegExtractors
@CloudstreamPlugin
class BeegPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.AdaptedProvider(BeegProvider().apply{name="3. Beeg.porn"}));registerBeegExtractors(this)}
}
