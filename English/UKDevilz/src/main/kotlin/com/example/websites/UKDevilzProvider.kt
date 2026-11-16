package com.example.websites
import com.cloudextensions.russian.*
class UKDevilzProvider: RussianProvider(SiteSpec(
 id="UKDevilz",
 title="UKDevilz",
 origin="https://ukdevilz.com",
 cards=".list_videos .item, #list_videos .item",
 link="a.item_link[href]",
 titleSelector=".title",
 searchMode="path:/video/",
 tagSelector="#videoTagsBar a.vtag", descriptionSelector=".l_info .description", titleLanguage="en",
 sections=listOf(Section("Popular","/popular/month"))
)){
 override var lang="en"
 override val translateQueries=false
 override suspend fun page(request:PageRequest):org.jsoup.nodes.Document {
  val doc=super.page(request.copy(headers=request.headers+mapOf("Cookie" to "ui_lang=en","Accept-Language" to "en-US,en;q=0.9")))

  return doc
 }
 override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(com.lagradost.cloudstream3.SubtitleFile)->Unit,callback:(com.lagradost.cloudstream3.utils.ExtractorLink)->Unit):Boolean = Playback.confirmedLinks(name,mainUrl,data,subtitleCallback,callback)
 override suspend fun load(url:String):com.lagradost.cloudstream3.LoadResponse {
  val result=super.load(url)
  result.plot=null
  val original=result.tags.orEmpty()
  val cyrillic=Regex("[А-Яа-яЁё]")
  val terminology=mapOf("член" to "penis")
  val pending=original.filter{cyrillic.containsMatchIn(it) && it.lowercase() !in terminology}
  val translated=if(pending.isEmpty())emptyList() else RequestLimits.optional(3500){Translation.text(pending.joinToString("\n"),"en")}?.split(Regex("[\r\n]+"))?.map(String::trim)?.filter(String::isNotBlank)
  val mapping=if(translated?.size==pending.size)pending.zip(translated).toMap() else emptyMap()
  result.tags=original.mapNotNull{if(cyrillic.containsMatchIn(it))terminology[it.lowercase()] ?: mapping[it] else it}.mapNotNull(Metadata::tag).distinctBy{it.lowercase()}
  return result
 }
}
