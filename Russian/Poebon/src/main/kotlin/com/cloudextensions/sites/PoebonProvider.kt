package com.cloudextensions.sites
import com.cloudextensions.russian.*
class PoebonProvider: RussianProvider(SiteSpec(
 id="Poebon",title="Poebon",origin="https://v.poebon.pro",cards=".list-videos .item",link="a[href]",titleSelector=".title",searchMode="get",
 sections=listOf(Section("Новинки","/"))
)){override var lang="ru"}
