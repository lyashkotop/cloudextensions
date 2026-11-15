package com.streambundleextra
import com.cloudextensions.russian.*
class BoundHubProvider: RussianProvider(SiteSpec(
 id="BoundHub",title="BoundHub",origin="https://www.boundhub.com",cards=".list-videos .item",link="a[href]",titleSelector=".title",searchMode="get",
 sections=listOf(Section("Videos","/"))
)){override var lang="en"}
