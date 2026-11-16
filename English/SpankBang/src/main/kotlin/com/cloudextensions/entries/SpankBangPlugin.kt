package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.russian.AdaptedProvider
import com.byayzen.SpankBang
import com.byayzen.registerSpankBangExtractors
@CloudstreamPlugin
class SpankBangPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(AdaptedProvider(SpankBang().apply{name="3. SpankBang"})));registerSpankBangExtractors(this)}
}
