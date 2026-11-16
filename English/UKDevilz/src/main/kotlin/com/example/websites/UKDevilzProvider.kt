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
 tagSelector="#videoTagsBar a.vtag", descriptionSelector=".l_info .description",
 sections=listOf(Section("Latest","/home"),Section("Popular","/popular/month"))
)){override var lang="en"}
