package com.streambundleextra
import com.cloudextensions.russian.*
class ForcedCinemaProvider: RussianProvider(SiteSpec(
 id="ForcedCinema",title="ForcedCinema",origin="https://forcedcinema.net",cards="article:has(img)",link="a[href]",titleSelector=".entry-title,h2,h3",searchMode="get",
 sections=listOf(Section("Videos","/"))
)){override var lang="en"}
