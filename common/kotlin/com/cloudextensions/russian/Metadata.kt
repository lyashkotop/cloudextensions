package com.cloudextensions.russian

import java.math.BigDecimal
import java.math.RoundingMode
import java.util.Collections
import java.util.Locale
import org.json.JSONArray
import org.json.JSONObject
import org.json.JSONTokener
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element

/** Parses source fields only. Never derives tags from title words or a description from a URL. */
object Metadata {
    private val titles = Collections.synchronizedMap(BoundedMap<String,String>(1024))
    private val durations = Collections.synchronizedMap(BoundedMap<String,String>(1024))
    private val stopTag = Regex("(?iu)^(?:ра|для|и|а|но|что|это|как|при|the|and|for|with|from|of|to|in|on|an?|home|главная|tags|теги|categories|категории|all videos|все видео|(?:free |hd )?porn(?: videos?)?|порно(?: видео)?|xxx|hd|sd|[48]k|[0-9]{3,4}p)$")
    private val promo = Regex("(?iu)(?:смотрите (?:у нас|онлайн|бесплатно)|смотреть (?:онлайн|бесплатно)|бесплатные порно видео|watch (?:online|for free)|free porn videos|best porn site)")
    private val whitespace = Regex("\\s+")
    private val truncated = Regex("(?:…|\\.\\.\\.)$")
    private val tagSelector = "[itemprop=keywords]:not(meta), .video-taxonomy .tax-tags a, .video-taxonomy .tax-feature-tags a, .video-tags a, .video_tags a, #video-tags a, #tags a, .tagsbox a, #tab_video_info .item a[href*=/tag], #tab_video_info .item a[href*=/categor], .item_info a[href*=/tag/], .item_info a[href*=/category/], .video-info a[rel=tag], .video-info .tags a, .video-info .categories a, .video-details .tags a, .video-details .categories a, .video-links a[rel=tag], .video-taxonomy .tax-categories a, [itemprop=genre]"
    fun alias(from: String,to: String) { titles[videoKey(from)]?.let { titles[videoKey(to)]=it } }
    fun clean(value: String?) = value.orEmpty().replace('\u00a0',' ').replace(whitespace," ").trim()
    private fun value(e: Element?): String = e?.let { listOf(it.attr("content"), it.attr("datetime"), it.text()).firstOrNull(String::isNotBlank) }.orEmpty()
    fun title(url: String, candidates: List<String>): String {
        val key = videoKey(url)
        val old = titles[key]
        if (!old.isNullOrBlank() && !truncated.containsMatchIn(old)) return old
        val values = candidates.map(::clean).filter(String::isNotEmpty)
        val chosen = values.firstOrNull { !truncated.containsMatchIn(it) } ?: values.firstOrNull().orEmpty()
        if (chosen.isNotEmpty()) titles[key] = chosen
        return chosen
    }
    fun poster(element: Element, base: String): String? {
        val image = if(element.tagName()=="img")element else element.selectFirst("img,video[poster]") ?: return null
        fun candidate(value:String?):String? = absolute(base,value)?.takeUnless {
            val path=it.substringBefore('?').lowercase(Locale.ROOT)
            path.endsWith(".svg") || Regex("/(?:blank|transparent|placeholder)\\.(?:gif|png|jpg)$").containsMatchIn(path)
        }
        for(name in listOf("data-src","data-original","data-s","data-lazy-src","data-image","data-cfsrc","poster"))candidate(image.attr(name))?.let{return it}
        val source=image.parent()?.takeIf{it.tagName()=="picture"}?.selectFirst("source[data-srcset],source[srcset]")
        val set=image.attr("data-srcset").ifBlank{image.attr("srcset")}.ifBlank{source?.attr("data-srcset").orEmpty().ifBlank{source?.attr("srcset").orEmpty()}}
        if(!set.startsWith("data:")) {
            val entries=set.split(',').mapNotNull{entry->val parts=entry.trim().split(whitespace);val url=candidate(parts.firstOrNull()) ?: return@mapNotNull null;url to (parts.getOrNull(1)?.removeSuffix("w")?.toIntOrNull()?:0)}
            (entries.filter{it.second>=480}.minByOrNull{it.second}?:entries.maxByOrNull{it.second})?.first?.let{return it}
        }
        return candidate(image.attr("src"))
    }
    fun cards(page: Element, spec: SiteSpec): List<VideoCard> {
        val result = LinkedHashMap<String,VideoCard>()
        for (card in page.select(spec.cards)) {
            val link = if (card.tagName() == "a" && card.hasAttr("href")) card else card.selectFirst(spec.link) ?: continue
            val url = absolute(page.baseUri(),link.attr("href")) ?: continue
            val image = card.selectFirst("img")
            val label = title(url,listOf(link.attr("title"),link.attr("aria-label"),card.selectFirst(spec.titleSelector)?.text().orEmpty(),image?.attr("alt").orEmpty(),image?.attr("aria-label").orEmpty()))
            if (label.isBlank()) continue
            val tags = card.select("[rel=tag], [data-tag]").map { clean(it.text()) }.filter(String::isNotBlank).distinct()
            if (!ContentPolicy.accepts(label,tags)) continue
            val duration = card.select(".duration, .card__duration, .video-duration, .time, [data-duration]").asSequence().map { timing(it.attr("data-duration").ifBlank { it.text() }) }.firstOrNull(String::isNotBlank).orEmpty()
            if (duration.isNotBlank()) durations[videoKey(url)] = duration
            if(!result.containsKey(videoKey(url)))result[videoKey(url)]=VideoCard(label,url,poster(card,page.baseUri()),duration,tags)
        }
        return result.values.toList()
    }
    fun emptySearch(page: Document, request: PageRequest): Boolean {
        val current=java.net.URI(page.baseUri())
        val redirected=request.data==null && java.net.URI(request.url).path.orEmpty().contains("search") && current.path.orEmpty().trim('/').isEmpty() && current.query.isNullOrBlank()
        return page.attr("data-response-code")=="404" || redirected || page.select("h1,h2,.empty,.no-results,.no-result,.nothing-found,.list-videos .message,.message").any {
            Regex("(?iu)(?:ничего не найдено|ничего не нашлось|нет результатов|no (?:results|videos|matches|posts)(?: found)?|nothing found|0 результатов)").containsMatchIn(it.text())
        }
    }
    fun searchCards(page: Document,spec: SiteSpec,request: PageRequest): List<VideoCard> = if(emptySearch(page,request))emptyList() else cards(page,spec)
    internal fun ownVideo(page: Document): JSONObject? {
        val candidates = mutableListOf<JSONObject>()
        fun scan(node: Any?, depth: Int) {
            if (depth > 12) return
            when(node) {
                is JSONObject -> {
                    val kind=node.opt("@type"); val types=if(kind is JSONArray) (0 until kind.length()).map { kind.optString(it) } else listOf(kind?.toString().orEmpty())
                    if(types.any { it.substringAfterLast('/').equals("VideoObject",true) }) candidates+=node
                    for(key in listOf("@graph","mainEntity","video","itemListElement","item")) if(node.has(key))scan(node.opt(key),depth+1)
                }
                is JSONArray -> for(i in 0 until node.length())scan(node.opt(i),depth+1)
            }
        }
        for(script in page.select("script[type=application/ld+json]"))try { scan(JSONTokener(script.data()).nextValue(),0) }catch(_:Exception){}
        return candidates.firstOrNull { v -> listOf(v.optString("url"),v.optString("@id"),v.optString("mainEntityOfPage")).any { absolute(page.baseUri(),it)?.let(::videoKey)==videoKey(page.baseUri()) } }
            ?: candidates.singleOrNull()?.takeIf { it.optString("url").isBlank() && it.optString("@id").substringBefore('#').isBlank() }
    }
    fun detail(page: Document, spec: SiteSpec): VideoDetail {
        val data=ownVideo(page)
        val heading=page.selectFirst("h1[itemprop=name], h1.video-page-title, main h1, h1")?.text().orEmpty()
        val rawTitle=title(page.baseUri(),listOf(heading,data?.optString("name").orEmpty(),page.selectFirst("meta[property=og:title]")?.attr("content").orEmpty()))
        val tags=mutableListOf<String>()
        fun add(raw: String?) { val label=clean(raw); if((label.length>=3 || label.matches(Regex("[A-Za-z0-9]{2}"))) && label.length<=100 && !stopTag.matches(label) && tags.none { it.equals(label,true) })tags+=label }
        for(e in page.select(listOf(tagSelector,spec.tagSelector).filter(String::isNotBlank).joinToString(","))) if(e.closest("nav,header,footer,aside,.related,.related-videos,#related-videos,#relateddiv") == null) add(e.text())
        if(tags.isEmpty() && data != null) for(key in listOf("keywords","genre")) {
            when(val item=data.opt(key)) { is JSONArray -> for(i in 0 until item.length())add(item.optString(i)); is String -> item.split(',',';').forEach(::add) }
        }
        if(tags.isEmpty())page.select("meta[property=video:tag],meta[property=og:video:tag]").forEach { add(it.attr("content")) }
        val semanticDescription=page.select("[itemprop=description]").filter { it.closest(".related,.related-videos,#related-videos,#relateddiv") == null }
        val declared=semanticDescription.isNotEmpty() || data?.has("description")==true
        val descriptionFields=listOf(".video-description, .video_description, #video-description, #video_description, #tab_video_info .description, .item_info .description, .description-container",spec.descriptionSelector).filter(String::isNotBlank).joinToString(",")
        val summaryCandidates=page.select(descriptionFields).filter { it.closest(".related,.related-videos,#related-videos,#relateddiv") == null }.map(::value) + listOf(data?.optString("description").orEmpty()) + semanticDescription.map(::value) + if(declared)emptyList() else listOf(page.selectFirst("meta[property=og:description]")?.attr("content").orEmpty())
        val summary=summaryCandidates.map(::clean).firstOrNull { it.isNotBlank() && !it.equals(rawTitle,true) && !promo.containsMatchIn(it) }.orEmpty()
        val durationCandidates=listOf(data?.optString("duration").orEmpty()) + page.select("[itemprop=duration],meta[property=video:duration],meta[property=og:video:duration],meta[property=og:duration],.video-info .duration,.item_info .duration,.video-details .duration,.video-duration").filter { it.closest(".related,.related-videos,#related-videos,#relateddiv,nav,aside") == null }.map(::value)
        val duration=durationCandidates.asSequence().map(::timing).firstOrNull(String::isNotBlank) ?: durations[videoKey(page.baseUri())].orEmpty()
        if(duration.isNotBlank())durations[videoKey(page.baseUri())]=duration
        val thumbnail=data?.opt("thumbnailUrl"); val structuredPoster=if(thumbnail is JSONArray)thumbnail.optString(0) else thumbnail?.toString()
        val poster=absolute(page.baseUri(),page.selectFirst("meta[property=og:image]")?.attr("content")) ?: absolute(page.baseUri(),structuredPoster) ?: page.selectFirst("video[poster]")?.let { absolute(page.baseUri(),it.attr("poster")) }
        val year=data?.optString("uploadDate")?.take(4)?.toIntOrNull()?.takeIf { it in 1900..2100 }
        return VideoDetail(rawTitle,poster,summary,tags,duration,year)
    }
    /** Duration belongs to the host metadata field; the plot contains only the source description. */
    fun plot(detail: VideoDetail) = detail.description

    fun timing(raw: String?): String {
        val text=clean(raw)
        if(text.isBlank())return ""
        return try {
            val seconds=when {
                text.matches(Regex("[0-9]+(?:\\.[0-9]+)?")) -> text.toBigDecimal()
                text.startsWith("P",true) -> {
                    val m=Regex("(?i)^P(?:(\\d+)D)?T(?:(\\d+)H)?(?:(\\d+)M)?(?:(\\d+(?:\\.\\d+)?)S)?$").matchEntire(text) ?: return ""
                    fun n(i:Int)=m.groupValues[i].ifBlank { "0" }.toBigDecimal()
                    n(1)*BigDecimal(86400)+n(2)*BigDecimal(3600)+n(3)*BigDecimal(60)+n(4)
                }
                text.matches(Regex("(?:[0-9]+:)?[0-9]{1,2}:[0-9]{2}(?:\\.[0-9]+)?")) -> {
                    val p=text.split(':');val tail=p.last().toBigDecimal();val minutes=p[p.size-2].toLong()
                    if(tail>=BigDecimal(60) || (p.size==3 && minutes>=60))return ""
                    tail+BigDecimal(minutes*60)+if(p.size==3)BigDecimal(p[0].toLong()*3600) else BigDecimal.ZERO
                }
                else -> return ""
            }
            if(seconds<=BigDecimal.ZERO)return ""
            val whole=seconds.setScale(0,RoundingMode.DOWN).longValueExact();val rest=seconds.remainder(BigDecimal(60)).stripTrailingZeros();val tail=(if(rest<BigDecimal.TEN) "0" else "")+rest.toPlainString()
            if(whole>=3600)String.format(Locale.ROOT,"%d:%02d:",whole/3600,whole/60%60)+tail else String.format(Locale.ROOT,"%02d:",whole/60)+tail
        }catch(_:ArithmeticException){""}catch(_:NumberFormatException){""}
    }
}
