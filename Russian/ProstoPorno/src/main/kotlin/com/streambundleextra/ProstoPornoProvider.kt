package com.streambundleextra

import com.cloudextensions.russian.*

class ProstoPornoProvider: RussianProvider(SiteSpec(
    id="ProstoPorno", title="ProstoPorno", origin="https://prostoporno.dev",
    cards=".thumb:has(a.img[href*=/videos/])", link="a.img[href]", titleSelector=".title", searchMode="path",
    tagSelector="#video-info a[href*=/categor], #video-info a[href*=/tag]", descriptionSelector="", related="#relcontent",
    sections=listOf(
        Section("Новинки","/"),
    )
))
