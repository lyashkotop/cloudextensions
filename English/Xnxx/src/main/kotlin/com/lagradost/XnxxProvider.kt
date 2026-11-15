package com.lagradost
import com.cloudextensions.russian.*
class XnxxProvider: RussianProvider(SiteSpec(
 id="Xnxx",
 title="XNXX",
 origin="https://www.xnxx.com",
 cards=".mozaique .thumb-block:not(.thumb-cat)",
 link="p a[href],.thumb a[href]",
 titleSelector="p a",
 searchMode="path",
 tagSelector=".metadata-row.video-tags a.is-keyword, .metadata-row.video-tags a[href*=/search/]",
 descriptionSelector=".metadata-row.video-description",
 sections=listOf(Section("Popular","/best"),Section("Most viewed","/hits"))
)){override var lang="en"}
