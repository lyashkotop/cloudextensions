package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.cloudextensions.russian.AdaptedProvider
import com.kraptor.YouJizz
import com.kraptor.registerYouJizzExtractors
@CloudstreamPlugin
class YouJizzPlugin: Plugin(){
 override fun load(context:Context){com.cloudextensions.russian.Translation.configure(context);registerMainAPI(com.cloudextensions.russian.ReliableProvider(AdaptedProvider(YouJizz().apply{name="3. YouJizz"})));registerYouJizzExtractors(this)}
}
