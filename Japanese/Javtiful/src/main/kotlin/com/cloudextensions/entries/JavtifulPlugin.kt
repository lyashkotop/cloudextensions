package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.javtiful.Javtiful
import com.javtiful.registerJavtifulExtractors
@CloudstreamPlugin
class JavtifulPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(Javtiful().apply { name = "2. Javtiful" });registerJavtifulExtractors(this)}
}
