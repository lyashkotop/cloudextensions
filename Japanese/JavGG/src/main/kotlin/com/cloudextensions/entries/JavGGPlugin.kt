package com.cloudextensions.entries
import android.content.Context
import com.lagradost.cloudstream3.plugins.*
import com.Javpoint.Javgg
import com.Javpoint.registerJavGGExtractors
@CloudstreamPlugin
class JavGGPlugin: Plugin(){
 override fun load(context:Context){registerMainAPI(Javgg().apply { name = "2. Javgg" });registerJavGGExtractors(this)}
}
