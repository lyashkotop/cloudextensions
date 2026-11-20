package com.example.websites

import com.cloudextensions.russian.*
import org.jsoup.nodes.Document

class SemyanaProvider: RussianProvider(SiteSpec(
    id="Semyana", title="Semyana", origin="https://w.semyana.com",
    cards=".video-card", link="a.video-card-link[href]", titleSelector=".video-title", searchMode="get",
    tagSelector=".video-taxonomy .tax-feature-tags a[href^=/t/]", descriptionSelector="", related="#related-videos",
    sections=listOf(
        Section("Новинки","/new/"),
        Section("Популярное","/best/"),
        Section("Random","/cat/random/"),
        Section("Homemade","/cat/homemade/"),
        Section("HD","/cat/hd/"),
        Section("HD porn","/cat/hd-porn/"),
        Section("Amateurs","/cat/amateurs/"),
        Section("Blowjob","/cat/blowjob/"),
        Section("18 years old","/cat/18-years-old/"),
        Section("Ass","/cat/ass/"),
        Section("Beautiful girls","/cat/beautiful-girls/"),
        Section("Huge boobs","/cat/huge-boobs/"),
        Section("Anal sex","/cat/anal-sex/"),
        Section("Brunettes","/cat/brunettes/"),
        Section("Masturbation","/cat/masturbation/"),
        Section("Real sex","/cat/real-sex/"),
        Section("Russian porn","/cat/russian-porn/"),
        Section("Blondes","/cat/blondes/"),
        Section("Ograsm","/cat/ograsm/"),
        Section("Huge cock","/cat/huge-cock/"),
        Section("Hardcore Sex","/cat/hardcore-sex-56/"),
        Section("Big asses","/cat/big-asses/"),
    )
)) {
    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        // Semyana publishes categories and free-text searches in separate rows.
        val tags = document.select(spec.tagSelector)
            .mapNotNull { Metadata.tag(it.text()) }
            .distinctBy { it.lowercase() }
        return detail.copy(tags = tags)
    }
}
