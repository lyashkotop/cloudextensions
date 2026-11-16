package com.cloudextensions.russian

import java.net.URI
import kotlinx.coroutines.CancellationException
import org.jsoup.nodes.Document

/** An aggregator's declared embed identifies the actual source; metadata remains source-provided. */
object DetailEnrichment {
    fun original(page:Document):String? {
        for(frame in page.select("iframe[src]")) {
            val raw=absolute(page.baseUri(),frame.attr("src")) ?: continue
            val uri=try{URI(raw)}catch(_:Exception){continue}
            if(uri.host.orEmpty().removePrefix("www.")!="xvideos.com")continue
            val id=Regex("^/embedframe/([A-Za-z0-9]+)$").matchEntire(uri.path.orEmpty())?.groupValues?.get(1) ?: continue
            // This is the source's public ID route; its own og:url supplies the full permalink.
            return "https://www.xvideos.com/video.$id/_"
        }
        return null
    }
    fun merge(detail:VideoDetail,source:VideoDetail)=detail.copy(
        description=detail.description.ifBlank{source.description},
        tags=detail.tags.ifEmpty{source.tags},duration=detail.duration.ifBlank{source.duration},
        poster=detail.poster ?: source.poster,year=detail.year ?: source.year
    )
    suspend fun complete(page:Document,spec:SiteSpec,detail:VideoDetail):VideoDetail {
        if(spec.id!="TubeSafari")return detail
        val url=original(page) ?: return detail
        return try {
            val source=RequestLimits.optional(3000){Network.page(PageRequest(url),url)} ?: return detail
            merge(detail,Metadata.detail(source,spec.copy(tagSelector=".video-tags-list a.is-keyword",descriptionSelector=".video-description-text")))
        }catch(e:CancellationException){throw e}catch(_:Exception){detail}
    }
}
