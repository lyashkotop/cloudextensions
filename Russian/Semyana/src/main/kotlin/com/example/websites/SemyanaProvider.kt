package com.example.websites

import com.cloudextensions.russian.*
import org.jsoup.nodes.Document
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull

class SemyanaProvider: RussianProvider(SiteSpec(
    id="Semyana", title="Semyana", origin="https://r.semyana.xyz",
    cards=".video-card", link="a.video-card-link[href]", titleSelector=".video-title", searchMode="get",
    tagSelector=".video-taxonomy .tax-feature-tags a[href^=/t/]", descriptionSelector="", related="#related-videos", titleLanguage="ru",
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
    override suspend fun page(request: PageRequest): Document {
        val current = request.url.toHttpUrlOrNull()
        val legacyHosts = setOf("w.semyana.com", "semyana.club", "dev.semyana.club")
        val host = mainUrl.toHttpUrlOrNull()?.host
        val url = if (current != null && current.host in legacyHosts && host != null) {
            current.newBuilder().host(host).build().toString()
        } else request.url
        return super.page(request.copy(url = url, headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)))
    }

    override fun readMetadata(document: Document): VideoDetail {
        val detail = super.readMetadata(document)
        // Semyana publishes categories and free-text searches in separate rows.
        val tags = document.select(spec.tagSelector)
            .mapNotNull { Metadata.tag(it.text()) }
            .distinctBy { it.lowercase() }
        return detail.copy(tags = tags)
    }
}
