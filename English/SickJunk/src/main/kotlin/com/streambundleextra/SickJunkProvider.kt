package com.streambundleextra
import com.cloudextensions.russian.*
class SickJunkProvider: RussianProvider(SiteSpec(
 id="SickJunk",
 title="SickJunk",
 origin="https://sickjunk.com",
 cards="article.genaral-post-item:has(img)",
 link=".genpost-featured-image a[href],h2 a[href]",
 titleSelector=".entry-title",
 tagSelector="article .single-entry-footer .awaken-category-list a",
 descriptionSelector=".entry-content > p, .genpost-entry-content > p",
 detailTitleSelector="h1.single-entry-title",
 sections=listOf(Section("Latest","/"))
)){override var lang="en"}
