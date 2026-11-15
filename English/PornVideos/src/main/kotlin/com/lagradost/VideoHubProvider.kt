package com.lagradost
import com.cloudextensions.russian.*
class VideoHubProvider: RussianProvider(SiteSpec(
 id="PornVideos",
 title="PornVideos.rs",
 origin="https://www.pornvideos.rs",
 cards="a[href*=/video/]:has(.plugthumb)",
 link="a[href]",
 titleSelector=".titlebox",
 tagSelector=".videoinfo a[href*=/category/], .video-info a[href*=/tag/], .tags a",
 descriptionSelector=".videoinfo .description, .video-description",
 detailTitleSelector=".videopage h2",
 sections=listOf(Section("Latest","/"))
)){override var lang="en"}
