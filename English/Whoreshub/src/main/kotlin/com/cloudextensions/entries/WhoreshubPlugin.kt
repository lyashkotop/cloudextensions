package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.russian.AdaptedProvider
import com.byayzen.Whoreshub
import com.byayzen.registerWhoreshubExtractors
@CloudstreamPlugin
class WhoreshubPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(AdaptedProvider(Whoreshub().apply{name="3. Whoreshub"}));registerWhoreshubExtractors(this)}
}
