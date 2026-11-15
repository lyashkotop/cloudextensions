package com.streambundleextra
import com.cloudextensions.russian.*
class PunishBangProvider: RussianProvider(SiteSpec(
 id="PunishBang",
 title="PunishBang",
 origin="https://www.punishbang.com",
 cards=".list-videos .item, .video-block:has(img)",
 link="a[href]",
 titleSelector=".title",
 sections=listOf(Section("Latest","/"))
)){override var lang="en"}
