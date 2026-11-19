package com.cloudextensions.russian

import java.net.URI
import java.net.URLEncoder
import java.net.URLDecoder
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element

object Pagination {
    private val nextText=Regex("(?iu)^(?:next(?: page)?|далее|дальше|следующ(?:ая|ая страница|ие)?|впер[её]д|показать ещ[её]|ещ[её]|[›»→>]+)$")
    private fun address(page: Document,element: Element,attribute: String): String? = absolute(page.baseUri(),element.attr(attribute))?.takeIf { url ->
        URI(url).host.equals(URI(page.baseUri()).host,true) && url.substringBefore('#')!=page.baseUri().substringBefore('#')
    }
    fun next(page: Document, current: PageRequest): PageRequest? {
        val uri=URI(current.url)
        val parameters=uri.rawQuery.orEmpty().split('&').filter { it.isNotBlank() }.associate { URLDecoder.decode(it.substringBefore('='),"UTF-8") to URLDecoder.decode(it.substringAfter('=',""),"UTF-8") }
        // These routes and counters come from the sites' own scrolling scripts.
        if(uri.host.orEmpty().removePrefix("www.")=="tubesafari.com" && page.select(".vid_li").size>=120 && page.attr("data-results-remaining")!="0") {
            val script=page.select("script").joinToString("\n") { it.data() }
            fun declared(key:String)=Regex("""\b$key\s*=\s*("(?:\\.|[^"\\])*"|'[^']*')""").find(script)?.groupValues?.get(1)?.let { raw -> try { org.json.JSONTokener(raw).nextValue().toString() }catch(_:Exception){null} }
            val query=parameters["query"] ?: declared("query")
            val sort=parameters["sort"] ?: declared("sort")
            if(query!=null && sort!=null) {
                val number=(parameters["page"]?.toIntOrNull()?:0)+1
                return PageRequest("${uri.scheme}://${uri.rawAuthority}/api?method=search&query=${URLEncoder.encode(query,"UTF-8")}&sort=${URLEncoder.encode(sort,"UTF-8")}&page=$number")
            }
        }
        if(uri.host.orEmpty().removePrefix("www.")=="ukdevilz.com" && page.select("#list_videos .item").size>=24) {
            // The site also exposes p in history.pushState; GET avoids CSRF-dependent scrolling POSTs.
            val values=parameters.toMutableMap();values["p"]=((values["p"]?.toIntOrNull()?:0)+1).toString()
            val query=values.entries.joinToString("&"){(k,v)->URLEncoder.encode(k,"UTF-8")+"="+URLEncoder.encode(v,"UTF-8")}
            return PageRequest("${uri.scheme}://${uri.rawAuthority}${uri.rawPath}?$query")
        }
        // KVS pagers expose the actual next cursor as data parameters rather than an href.
        val currentValues=URI(current.url).rawQuery.orEmpty().split('&').associate { it.substringBefore('=') to it.substringAfter('=',"") }
        val currentNumber=currentValues.filterKeys { it=="from" || it.startsWith("from_") }.values.mapNotNull(String::toIntOrNull).maxOrNull() ?: 1
        val controls=page.select("[data-parameters][data-block-id]").filter { it.closest(".pagination,.pagination-list,.load-more,.pager")!=null || it.hasClass("next") }
        val candidates=controls.mapNotNull { e ->
            val values=linkedMapOf("mode" to "async","function" to "get_block","block_id" to e.attr("data-block-id"))
            var number:Int?=null
            for(parameter in e.attr("data-parameters").split(';')) {
                if(!parameter.contains(':'))continue
                val raw=parameter.substringAfter(':');val value=try{URLDecoder.decode(raw,"UTF-8")}catch(_:Exception){raw}
                for(name in parameter.substringBefore(':').split('+')) { values[name]=value;if((name=="from" || name.startsWith("from_")))number=value.toIntOrNull() }
            }
            if(number==null || number!!<=currentNumber)return@mapNotNull null
            val uri=URI(page.baseUri());val base="${uri.scheme}://${uri.rawAuthority}${uri.rawPath}"
            val query=values.entries.joinToString("&") { (k,v)->URLEncoder.encode(k,"UTF-8")+"="+URLEncoder.encode(v,"UTF-8") }
            number!! to PageRequest("$base?$query")
        }
        candidates.minByOrNull { it.first }?.second?.let { return it }

        for(e in page.select("a[rel=next],link[rel=next],a.next[href],li.next a[href],a.pagination-next[href],.pagination-next a[href],.pagination .next[href],.pagination__item.next[href],[data-next-page],[hx-get][hx-trigger*=revealed],[hx-get][hx-trigger*=intersect]")) {
            val attr=when { e.hasAttr("data-next-page")->"data-next-page";e.hasAttr("hx-get")->"hx-get";else->"href" }
            address(page,e,attr)?.let { return PageRequest(it) }
        }
        for(e in page.select("a[href]")) {
            if(listOf(e.text(),e.attr("title"),e.attr("aria-label")).any { nextText.matches(Metadata.clean(it)) })address(page,e,"href")?.let { return PageRequest(it) }
        }
        val single=page.select(".pagination a[href]").singleOrNull()
        if(single!=null)address(page,single,"href")?.let { return PageRequest(it) }
        // Follow source POST controls, preserving its hidden cursor/CSRF fields.
        for(form in page.select("form[method=post]")) {
            if(form.selectFirst("input[name=q],input[name=search]")!=null)continue
            val control=form.select("button,input[type=submit]").firstOrNull { nextText.matches(Metadata.clean(it.attr("value").ifBlank { it.text() })) } ?: continue
            val values=form.select("input[name]").filter { it.attr("type")!="submit" }.associate { it.attr("name") to it.attr("value") }.toMutableMap()
            if(control.hasAttr("name"))values[control.attr("name")]=control.attr("value")
            val url=absolute(page.baseUri(),form.attr("action")) ?: page.baseUri()
            val candidate=PageRequest(url,values)
            if(candidate!=current)return candidate
        }
        return null
    }
    internal fun pathSearch(spec: SiteSpec, origin: String, query: String): PageRequest? {
        val prefix = when {
            spec.searchMode.startsWith("path:") -> spec.searchMode.removePrefix("path:")
            spec.searchMode == "path" -> "/search/"
            else -> return null
        }
        val encoded = URLEncoder.encode(query, "UTF-8").replace("+", "%20")
        val suffix = if (spec.searchMode == "path") "/" else ""
        return PageRequest(origin.trimEnd('/') + prefix + encoded + suffix)
    }

    fun search(page: Document, spec: SiteSpec, origin: String, query: String): PageRequest {
        pathSearch(spec, origin, query)?.let { return it }
        val form=page.select("form").firstOrNull { it.selectFirst("input[name=q],input[name=search],input[name=search_query],input[name=s],input[name=query],input[name=k],input[name=story],input[name='search_query[query]']")!=null }
        val input=form?.selectFirst("input[name=q],input[name=search],input[name=search_query],input[name=s],input[name=query],input[name=k],input[name=story],input[name='search_query[query]']")
        val values=form?.select("input[name]")?.filter { it.attr("type")!in listOf("button","reset") }?.associate { it.attr("name") to it.attr("value") }?.toMutableMap() ?: mutableMapOf()
        values[input?.attr("name") ?: "q"]=query
        val action=absolute(page.baseUri(),form?.attr("action")) ?: origin.trimEnd('/')+"/search/"
        if(form?.attr("method").equals("post",true)||spec.searchMode=="post")return PageRequest(action,values)
        val encodedValues=values.entries.joinToString("&") { (k,v)->URLEncoder.encode(k,"UTF-8")+"="+URLEncoder.encode(v,"UTF-8") }
        return PageRequest(action+(if(action.contains('?')) "&" else "?")+encodedValues)
    }
}
