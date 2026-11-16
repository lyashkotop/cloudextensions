package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.kraptor.CosXPlay
import com.kraptor.registerCosXPlayExtractors
@CloudstreamPlugin
class CosXPlayPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(com.cloudextensions.russian.ReliableProvider(com.cloudextensions.russian.AdaptedProvider(CosXPlay().apply { name = "3. CosXPlay" })));registerCosXPlayExtractors(this)}
}
