package com.cloudextensions.russian

import org.json.JSONObject
import org.jsoup.nodes.Document
import java.net.URI

/** Current-video JSON is shared with playback; catalogue and tag parsing is source-specific. */
internal object AggregatorVideo {
    fun props(page:Document):JSONObject? = try{JSONObject(page.selectFirst("script#__NEXT_DATA__")?.data().orEmpty()).optJSONObject("props")?.optJSONObject("pageProps")}catch(_:Exception){null}
    fun video(page:Document):JSONObject? {
        val item=props(page)?.optJSONObject("firstVideo") ?: return null
        val path=item.optString("basePath").trimEnd('/')
        val current=try{URI(page.baseUri()).path.trimEnd('/')}catch(_:Exception){""}
        return item.takeIf{path.isNotBlank() && current==path}
    }
}
