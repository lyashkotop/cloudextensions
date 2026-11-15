package com.cloudextensions.sites
import com.cloudextensions.russian.*
class TubeBDSMProvider: RussianProvider(SiteSpec(
 id="TubeBDSM",title="TubeBDSM",origin="https://www.tubebdsm.com",cards=".card.sub:has(img)",link="a.item-link[href]",titleSelector=".title,h2,h3",searchMode="get",
 sections=listOf(Section("New videos","/new"),Section("Popular videos","/popular"),Section("Top rated videos","/rating"))
)){override var lang="en"}
