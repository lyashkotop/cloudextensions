package com.streambundleextra
import com.cloudextensions.russian.*
class HurtSexProvider: RussianProvider(SiteSpec(
 id="HurtSex",
 title="HurtSex",
 origin="https://www.hurtsex.com",
 cards="a[href*=/video/]:has(.plugthumb)",
 link="a[href]",
 titleSelector=".titlebox",
 tagSelector=".videoinfo a[href*=/category/], .tags a",
 descriptionSelector=".videoinfo .description",
 sections=listOf(Section("Latest","/"))
)){override var lang="en"}
