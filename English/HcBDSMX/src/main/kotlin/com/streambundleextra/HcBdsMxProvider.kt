package com.streambundleextra
import com.cloudextensions.russian.*
class HcBdsMxProvider: RussianProvider(SiteSpec(
 id="HcBDSMX",title="hcBDSM",origin="https://hcbdsm.com",cards="a[href*=/video/]:has(img)",link="a[href]",titleSelector="h3,h2",searchMode="get",
 sections=listOf(Section("Latest","/latest-updates/"),Section("Popular","/trending/"))
)){override var lang="en"}
