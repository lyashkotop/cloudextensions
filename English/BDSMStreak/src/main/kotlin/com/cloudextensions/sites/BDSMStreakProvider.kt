package com.cloudextensions.sites
import com.cloudextensions.russian.*
class BDSMStreakProvider: RussianProvider(SiteSpec(
 id="BDSMStreak",title="BDSM Streak",origin="https://bdsmstreak.com",
 cards="a[href*=/video/]:has(img)",link="a[href]",titleSelector="h2,h3",
 tagSelector="main .p-4 a[href*=/search]",
 sections=listOf(Section("Videos","/"))
)){override var lang="en"}
