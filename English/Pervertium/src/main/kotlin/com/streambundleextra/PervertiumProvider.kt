package com.streambundleextra
import com.cloudextensions.russian.*
class PervertiumProvider: RussianProvider(SiteSpec(
 id="Pervertium",
 title="Pervertium",
 origin="https://www.pervertium.com",
 cards=".pop-thumb:has(img)",
 link="a[href]",
 titleSelector=".title",
 sections=listOf(Section("Latest","/"),Section("Popular","/most-popular/"))
)){override var lang="en"}
