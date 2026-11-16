package com.streambundleextra
import com.cloudextensions.russian.*
class ThisVidProvider: RussianProvider(SiteSpec(
 id="ThisVid",
 title="ThisVid",
 origin="https://thisvid.com",
 cards="a.tumbpu:has(img)",
 link="a[href]",
 titleSelector=".title",
 tagSelector=".box ul.description a[href*=/tags/], .box ul.description a[href*=/categories/]",
 descriptionSelector=".box ul.description > li:first-child p",
 durationSelector=".box .title-description:matchesOwn([0-9]+:[0-9]{2})",
 sections=listOf(Section("Latest","/"),Section("Popular","/popular/"))
)){override var lang="en"}
