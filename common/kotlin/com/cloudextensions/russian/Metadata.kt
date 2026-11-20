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
    private val posters = Collections.synchronizedMap(BoundedMap<String,String>(1024))
    private val posterTimes = Collections.synchronizedMap(BoundedMap<String,Long>(1024))
    private val durations = Collections.synchronizedMap(BoundedMap<String,String>(1024))
    private val listedTags = Collections.synchronizedMap(BoundedMap<String, List<String>>(1024))
    private val stopTag = Regex("(?iu)^(?:ра|для|и|а|но|что|это|как|при|the|and|for|with|from|of|to|in|on|an?|home|главная|tags|теги|categories|категории|all videos|все видео|(?:free |hd )?porn(?: videos?)?|порно(?: видео)?|xxx|hd|sd|[48]k|[0-9]{3,4}p)$")
    private val shortTag = Regex("[A-Za-z0-9\\u3040-\\u30ff\\u3400-\\u9fff]{2}")
    private val promo = Regex("(?iu)(?:смотрите (?:у нас|онлайн|бесплатно)|смотреть (?:онлайн|бесплатно)|бесплатные порно видео|watch (?:online|for free)|free porn videos|best porn site)")
    private val whitespace = Regex("\\s+")
    private val truncated = Regex("(?:…|\\.\\.\\.)$")
    private val placeholderPath = Regex("(?i)/(?:flags?|logos?|avatars?|icons?)/|/(?:logo|favicon|spacer|blank|transparent|placeholder|loading)(?:[_.][^/]*)?$")
    private val badgeClass = Regex("(?i)(?:flag|logo|avatar|icon|badge)")
    private val thumbnailClass = Regex("(?i)(thumb|poster|video-img|card__image|widescreen)")
    private val emptyMessage = Regex("(?iu)(?:ничего не найдено|ничего не нашлось|нет результатов|no (?:results|videos|matches|posts)(?: found)?|nothing found|0 результатов)")
    private val tagSelector = ".tags .tags-list a, .tags-list.single-vide a, .video-info #tab1 .tags-outer a, #video-info-tags li.vit-tag a, #video-info-tags li.vit-category a, .tag-list li a, .video-tags-list a.is-keyword, .video-taxonomy .tax-tags a, .video-taxonomy .tax-feature-tags a, .video-tags a, .video_tags a, #video-tags a, #tags a, .tagsbox a, #tab_video_info .item a[href*=/tag], #tab_video_info .item a[href*=/categor], .item_info a[href*=/tag/], .item_info a[href*=/category/], .video-info a[rel=tag], .video-info .tags a, .video-info .categories a, .video-details .tags a, .video-details .categories a, .video-links a[rel=tag], .video-taxonomy .tax-categories a, [itemprop=genre]"
    fun sourceValue(raw:String?):Boolean = !raw.isNullOrBlank() && raw.trim().lowercase(Locale.ROOT) !in setOf("null","undefined")
    fun description(raw:String?,title:String):String {
        val value=clean(raw)
        if(!sourceValue(value) || value.trimEnd('.','!','?').equals(title.trimEnd('.','!','?'),true))return ""
        val boilerplate=Regex("(?iu)(?:watch .+ on [\\p{L}\\d.-]+|смотр(?:и|еть|ите) .+ (?:на|в) .+|free porn video|бесплатн[а-яё]* порно|subscribe|sign up|register (?:now|for)|download (?:now|for free)|visit (?:our|the) site|лучший порно|подписывай|зарегистрируй)")
        if(boilerplate.containsMatchIn(value) || value.equals("Video $title HQ Mp4",true))return ""
        if(!promo.containsMatchIn(value))return value
        return value.split(Regex("(?<=[.!?])\\s+|[\\r\\n]+"))
            .filter { it.isNotBlank() && !promo.containsMatchIn(it) && !it.trimEnd('.','!','?').equals(title.trimEnd('.','!','?'),true) }.joinToString(" ")
    }
    fun tag(raw: String): String? = clean(raw).takeIf {
        sourceValue(it) && it.length <= 100 && (it.length >= 3 || shortTag.matches(it)) && !stopTag.matches(it)
    }
    fun alias(from: String,to: String) {
        val a=videoKey(from);val b=videoKey(to)
        titles[a]?.let{titles[b]=it};posters[a]?.let{posters[b]=it;posterTimes[a]?.let{stamp->posterTimes[b]=stamp}};durations[a]?.let{durations[b]=it}
    }
    fun imageUrl(base:String,raw:String?):String? = raw?.trim()?.takeUnless { it.isBlank() || it.lowercase(Locale.ROOT) in setOf("null","undefined","false") }?.let { absolute(base,it.replace("\\/","/").replace("&amp;","&")) }?.takeUnless {
        val path=java.net.URI(it).path.orEmpty().lowercase(Locale.ROOT)
        path.endsWith(".svg") || path.endsWith("/null") || path.endsWith("/undefined") || placeholderPath.containsMatchIn(path)
    }
    fun rememberPoster(url:String,raw:String?):String? {
        val valid=imageUrl(url,raw)
        if(valid!=null){posters[videoKey(url)]=valid;posterTimes[videoKey(url)]=System.nanoTime()}
        return valid ?: posters[videoKey(url)]
    }
    fun savedPoster(url:String):String? = posters[videoKey(url)]?.takeIf { System.nanoTime()-(posterTimes[videoKey(url)]?:0L)<180_000_000_000L }
    fun choosePoster(url:String,vararg candidates:String?):String? = savedPoster(url) ?: candidates.firstNotNullOfOrNull { imageUrl(url,it) }?.also { rememberPoster(url,it) } ?: posters[videoKey(url)]

    fun clean(value: String?) = value.orEmpty().replace('\u00a0',' ').replace(whitespace," ").trim()
    private fun value(e: Element?): String = e?.let { listOf(it.attr("content"), it.attr("datetime"), it.text()).firstOrNull(String::isNotBlank) }.orEmpty()
    internal fun isTruncatedTitle(title: String): Boolean = truncated.containsMatchIn(title.trim())
    internal fun cardTags(url: String): List<String> = listedTags[videoKey(url)].orEmpty()

    fun title(url: String, candidates: List<String>): String {
        val key = videoKey(url)
        val old = titles[key]?.takeIf(::sourceValue)
        val values = candidates.map(::clean).filter(::sourceValue)
        fun stem(v:String)=v.replace(truncated,"").trim()
        var chosen = values.firstOrNull { !truncated.containsMatchIn(it) } ?: values.firstOrNull().orEmpty()
        for(v in values)if(v.length>chosen.length && v.startsWith(stem(chosen),true))chosen=v
        if(!old.isNullOrBlank()) {
            val longer=values.filter{it.length>old.length && it.startsWith(stem(old),true)}.maxByOrNull{it.length}
            chosen=longer ?: if(!truncated.containsMatchIn(old))old else chosen
        }
        if (chosen.isNotEmpty()) titles[key] = chosen
        return chosen
    }
    fun poster(element: Element, base: String): String? {
        val images=if(element.tagName() in listOf("img","video"))listOf(element) else element.select("img,video[poster]").toList()
        // A flag/badge may precede the thumbnail inside the same video card.
        val ranked=images.filter { image ->
            val badge=badgeClass.containsMatchIn(image.className()+" "+image.id())
            val width=image.attr("width").toIntOrNull();val height=image.attr("height").toIntOrNull()
            !badge && !(width!=null && height!=null && width<96 && height<54)
        }.sortedByDescending { image ->
            val names=image.className()
            (if(thumbnailClass.containsMatchIn(names))10 else 0) + (if(image.tagName()=="img")1 else 0)
        }
        for(image in ranked) {
            fun candidate(value:String?)=imageUrl(base,value)
            for(name in listOf("data-src","data-original","data-s","data-lazy-src","data-image","data-cfsrc","data-thumb","data-thumbnail","data-poster","poster"))candidate(image.attr(name))?.let{return it}
            val source=image.parent()?.takeIf{it.tagName()=="picture"}?.selectFirst("source[data-srcset],source[srcset]")
            val set=image.attr("data-srcset").ifBlank{image.attr("srcset")}.ifBlank{source?.attr("data-srcset").orEmpty().ifBlank{source?.attr("srcset").orEmpty()}}
            if(!set.startsWith("data:")) {
                val entries=set.split(',').mapNotNull{entry->val parts=entry.trim().split(whitespace);val url=candidate(parts.firstOrNull()) ?: return@mapNotNull null;url to (parts.getOrNull(1)?.removeSuffix("w")?.toIntOrNull()?:0)}
                (entries.filter{it.second>=480}.minByOrNull{it.second}?:entries.maxByOrNull{it.second})?.first?.let{return it}
            }
            candidate(image.attr("src"))?.let{return it}
        }
        return null
    }
    private fun localizedTitle(element:Element?,language:String):String? {
        if(element==null || language.isBlank())return null
        val node=if(element.hasAttr("data-video-title-translations"))element else element.selectFirst("[data-video-title-translations]") ?: return null
        val raw=try{JSONObject(node.attr("data-video-title-translations")).optString(language)}catch(_:Exception){return null}
        if(!sourceValue(raw))return null
        // Some site dictionaries escape Unicode twice inside the HTML JSON attribute.
        return Regex("""\\u([0-9a-fA-F]{4})""").replace(raw){it.groupValues[1].toInt(16).toChar().toString()}
    }
    fun cards(page: Element, spec: SiteSpec): List<VideoCard> {
        val result = LinkedHashMap<String,VideoCard>()
        for (card in page.select(spec.cards)) {
            if(spec.id=="ThisVid" && card.selectFirst(".private,.icon-private,.svg-icon-private,img[src*=bg_private_video]")!=null)continue
            val link = if (card.tagName() == "a" && card.hasAttr("href")) card else card.selectFirst(spec.link) ?: continue
            val url = absolute(page.baseUri(),link.attr("href")) ?: continue
            val image = card.selectFirst("img")
            val label = title(url,listOf(localizedTitle(card,spec.titleLanguage).orEmpty(),link.attr("title"),link.attr("aria-label"),image?.attr("alt").orEmpty(),card.selectFirst(spec.titleSelector)?.attr("title").orEmpty(),card.selectFirst(spec.titleSelector)?.text().orEmpty(),image?.attr("aria-label").orEmpty()))
            if (label.isBlank()) continue
            val tags = (
                card.select("[rel=tag], [data-tag]").flatMap { listOf(it.text(), it.attr("data-tag")) } +
                    listOf(card.attr("data-orientation"), link.attr("data-orientation"))
                ).map(::clean).filter(String::isNotBlank).distinct()
            if (tags.isNotEmpty()) listedTags[videoKey(url)] = tags
            if (!ContentPolicy.accepts(label,tags)) continue
            val clocks=card.select(".prop span,.video_length,.m_time").map { clean(it.text()) }.filter { it.matches(Regex("(?:[0-9]+:)?[0-9]{1,2}:[0-9]{2}")) }
            val duration = (card.select(".duration, .card__duration, .video-duration, .time, [data-duration]").asSequence().map { timing(it.attr("data-duration").ifBlank { it.text() }) }.toList()+clocks.map(::timing)).firstOrNull(String::isNotBlank).orEmpty()
            if (duration.isNotBlank()) durations[videoKey(url)] = duration
            val picture=poster(link,page.baseUri()) ?: poster(card,page.baseUri());if(picture!=null)rememberPoster(url,picture)
            if(!result.containsKey(videoKey(url)))result[videoKey(url)]=VideoCard(label,url,picture,duration,tags)
        }
        return result.values.toList()
    }
    fun emptySearch(page: Document, request: PageRequest): Boolean {
        val current=java.net.URI(page.baseUri())
        // ThisVid renders trending blocks when no search matches. Those are never search results.
        val requested=java.net.URI(request.url)
        if(requested.host.orEmpty().removePrefix("www.")=="thisvid.com" && requested.path.orEmpty().startsWith("/search/") && page.selectFirst("#list_videos_common_videos_list_items")==null)return true
        if (requested.host.orEmpty().removePrefix("www.") == "tubebdsm.com" &&
            (requested.path.orEmpty().startsWith("/search") || current.path.orEmpty().startsWith("/search/")) &&
            page.select("#content h3, .search-block h3").any {
                it.closest(".card") == null && emptyMessage.containsMatchIn(it.text())
            }
        ) return true
        val redirected=request.data==null && java.net.URI(request.url).path.orEmpty().contains("search") && current.path.orEmpty().trim('/').isEmpty() && current.query.isNullOrBlank()
        return page.attr("data-response-code")=="404" || redirected || page.select("h1,h2,.empty,.no-results,.no-result,.nothing-found,.list-videos .message,.message").any {
            emptyMessage.containsMatchIn(it.text())
        }
    }
    fun searchCards(page: Document, spec: SiteSpec, request: PageRequest): List<VideoCard> =
        searchCards(page, spec, emptySearch(page, request))

    internal fun searchCards(page: Document, spec: SiteSpec, empty: Boolean): List<VideoCard> {
        if (empty) return emptyList()
        val searchSpec=if(spec.id=="ThisVid")spec.copy(cards="#list_videos_common_videos_list_items a.tumbpu:has(img)") else spec
        return cards(page,searchSpec)
    }
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
        val identities=(listOf(page.baseUri())+page.select("link[rel=canonical],meta[property=og:url]").map { it.attr("href").ifBlank{it.attr("content")} }).mapNotNull{absolute(page.baseUri(),it)?.let(::videoKey)}.toSet()
        fun identity(raw:Any?):String = when(raw){is JSONObject->raw.optString("@id").ifBlank{raw.optString("url")};is String->raw;else->""}
        return candidates.firstOrNull { v -> listOf(v.opt("url"),v.opt("@id"),v.opt("mainEntityOfPage")).map(::identity).filter(String::isNotBlank).any { absolute(page.baseUri(),it)?.let(::videoKey) in identities } }
            ?: candidates.singleOrNull()?.takeIf { it.optString("url").isBlank() && it.optString("@id").substringBefore('#').isBlank() }

    }
    fun detail(page: Document, spec: SiteSpec): VideoDetail {
        val data=ownVideo(page)
        val heading=(if(spec.detailTitleSelector.isNotBlank())page.selectFirst(spec.detailTitleSelector) else null)?.text() ?: page.selectFirst("h1[itemprop=name], h1.video-page-title, h1.single-entry-title, main h1, h1:not(.site-title)")?.text().orEmpty()
        val titleFields=listOf(localizedTitle(page.selectFirst("h1"),spec.titleLanguage).orEmpty(),heading,data?.optString("name").orEmpty()).filter(String::isNotBlank)
        val rawTitle=title(page.baseUri(),titleFields.ifEmpty{listOf(page.selectFirst("meta[property=og:title]")?.attr("content").orEmpty())})
        val tags=mutableListOf<String>()
        fun add(raw: String?) {
            val label = raw?.let(::tag) ?: return
            if (tags.none { it.equals(label, true) }) tags += label
        }
        for(e in page.select(spec.tagSelector.ifBlank{tagSelector})) if(e.closest("nav,header,aside,.related,.related-videos,#related-videos,#relateddiv,.tax-extra") == null && (e.closest("footer")==null || e.closest("article .single-entry-footer,article .entry-footer")!=null)) add(e.text())
        if(tags.isEmpty() && data != null) for(key in listOf("genre")) {
            when(val item=data.opt(key)) { is JSONArray -> for(i in 0 until item.length())add(item.optString(i)); is String -> item.split(',',';').forEach(::add) }
        }
        if(tags.isEmpty())page.select("meta[property=video:tag],meta[property=og:video:tag]").forEach { add(it.attr("content")) }
        val semanticDescription=page.select("[itemprop=description]").filter { it.closest(".related,.related-videos,#related-videos,#relateddiv") == null }
        val descriptionFields=listOf(".video-description, .video_description, #video-description, #video_description, #tab_video_info .description, .item_info .description, .description-container",spec.descriptionSelector).filter(String::isNotBlank).joinToString(",")
        val summaryCandidates=page.select(descriptionFields).filter { it.closest(".related,.related-videos,#related-videos,#relateddiv") == null }.map(::value) + listOf(data?.optString("description").orEmpty()) + semanticDescription.map(::value)
        val summary=summaryCandidates.map { description(it,rawTitle) }.firstOrNull(String::isNotBlank).orEmpty()
        val durationCandidates=listOf(data?.optString("duration").orEmpty()) + page.select(listOf("[itemprop=duration],meta[property=video:duration],meta[property=og:video:duration],meta[property=og:duration],.video-info .duration,.item_info .duration,.video-details .duration,.video-duration",spec.durationSelector).filter(String::isNotBlank).joinToString(",")).filter { it.closest(".related,.related-videos,#related-videos,#relateddiv,nav,aside") == null }.map(::value)
        val duration=durationCandidates.asSequence().map(::timing).firstOrNull(String::isNotBlank) ?: durations[videoKey(page.baseUri())].orEmpty()
        if(duration.isNotBlank())durations[videoKey(page.baseUri())]=duration
        val thumbnail=data?.opt("thumbnailUrl")
        fun picture(value:Any?):String? = when(value){is JSONObject->value.optString("url").ifBlank{value.optString("contentUrl").ifBlank{value.optString("@id")}};is String->value;else->null}
        val structuredPoster=if(thumbnail is JSONArray)(0 until thumbnail.length()).firstNotNullOfOrNull{picture(thumbnail.opt(it))} else picture(thumbnail)
        val poster=choosePoster(page.baseUri(),structuredPoster,
            page.selectFirst("meta[property=og:image]")?.attr("content"),
            page.selectFirst("meta[name=og:image]")?.attr("content"),
            page.selectFirst("video[poster]")?.attr("poster"),
            page.selectFirst("link[rel=image_src]")?.attr("href"))
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
                text.matches(Regex("(?i)[0-9]+\\s*(?:s|sec|secs|seconds?)")) -> text.takeWhile(Char::isDigit).toBigDecimal()
                text.matches(Regex("(?i)[0-9]+\\s*(?:m|min|mins|minutes?)")) -> text.takeWhile(Char::isDigit).toBigDecimal() * BigDecimal(60)
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
