package com.streambundleextra
import com.cloudextensions.russian.*
class PunishWorldProvider: RussianProvider(SiteSpec(
 id="PunishWorld",
 title="Punishworld",
 origin="https://punishworld.com",
 cards=".video-block:has(img)",
 link="a.thumb[href]",
 titleSelector=".title",
 tagSelector=".video-tags a, .video-info a[href*=/tag/]",
 descriptionSelector=".video-description, .video-info .description",
 sections=listOf(Section("Latest","/"))
)){override var lang="en"}
