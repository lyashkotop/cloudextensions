package com.streambundleextra
import com.cloudextensions.russian.*
class DarknessPornProvider: RussianProvider(SiteSpec(
 id="DarknessPorn",title="DarknessPorn",origin="https://darknessporn.com",cards=".thumb",link="a[href]",titleSelector=".title,h2,h3",searchMode="get",
 tagSelector="#single-wrapper .category-menu.tag .tags-list a[href*=/tag/]",
 sections=listOf(Section("Videos","/"))
)){override var lang="en"}
