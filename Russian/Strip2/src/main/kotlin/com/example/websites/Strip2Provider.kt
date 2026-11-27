package com.example.websites

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.HomePageResponse
import com.lagradost.cloudstream3.MainPageRequest
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.newHomePageResponse
import com.lagradost.cloudstream3.utils.ExtractorLink
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

class Strip2Provider: RussianProvider(SiteSpec(
    id="Strip2", title="Strip2", origin="https://vps402.strip2.co",
    cards=".tiled_item", link="a[href*=/video/]", titleSelector=".tile_descr_2l", searchMode="post",
    tagSelector="[itemprop=tag], .info-table [itemprop=genre]", descriptionSelector=".file-card__description", related=".tiles_wrapper",
    sections=listOf(
        Section("Новинки","/"),
        Section("Неделя","/videocat/most-popular/"),
        Section("Месяц","/videocat/mobile/"),
        Section("ТОП","/videocat/top-rated/"),
        Section("Альтушки","/videocat/tag/altuwki/"),
        Section("Секс на вписке","/videocat/tag/seks-na-vpiske/"),
        Section("Русское частное","/videocat/tag/russkoe-chastnoe/"),
        Section("Мама и сын","/videocat/tag/mama-i-syn/"),
        Section("Казашки","/videocat/tag/kazawki/"),
        Section("Чеченки","/videocat/tag/chechenki/"),
        Section("Теща","/videocat/tag/tescha/"),
        Section("Ебут жену","/videocat/tag/ebut-zhenu/"),
        Section("Сексвайф","/videocat/tag/seksvajf/"),
        Section("Русские мамки","/videocat/tag/russkie-mamki/"),
        Section("Юные девушки 18+","/videocat/tag/junye-devuwki-18/"),
        Section("Подростки 18+","/videocat/tag/podrostki-18/"),
        Section("Alina Rai","/videocat/tag/alina-rai/"),
        Section("Александр Пистолетов","/videocat/tag/aleksandr-pistoletov/"),
        Section("Desert Angel","/videocat/tag/desert-angel/"),
        Section("Ava Addams","/videocat/tag/ava-addams/"),
        Section("Danny D","/videocat/tag/danny-d/"),
        Section("Елена Беркова","/videocat/tag/elena-berkova/"),
        Section("Jeny Smith","/videocat/tag/jeny-smith/"),
        Section("Brianna Beach","/videocat/tag/brianna-beach/"),
        Section("Mia Khalifa","/videocat/tag/mia-khalifa/"),
        Section("Kendra Lust","/videocat/tag/kendra-lust/"),
        Section("Gina Gerson","/videocat/tag/gina-gerson/"),
        Section("Rocco Siffredi","/videocat/tag/rocco-siffredi/"),
    )
)) {
    private val dimensions = Regex("""(\d+)\s*[×x]\s*(\d+)""")

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        // CloudStream requests all rows together. A failed category should not cancel the home page.
        val row = RequestLimits.optional(10_000L) { super.getMainPage(page, request) }
        return row?.takeIf { it.items.any { section -> section.list.isNotEmpty() } }
            ?: newHomePageResponse(emptyList(), false)
    }

    fun downloadableSources(document: Document): List<Playback.Source> = downloadSources(document, limitQuality = true)

    private fun downloadSources(document: Document, limitQuality: Boolean): List<Playback.Source> {
        val address = document.baseUri().toHttpUrlOrNull() ?: return emptyList()
        return document.select("a[href*=/video/download/]").mapNotNull { link ->
            val url = address.resolve(link.attr("href")) ?: return@mapNotNull null
            if (url.host != address.host || !url.encodedPath.startsWith("/video/download/") ||
                !url.encodedPath.endsWith(".mp4", true)) return@mapNotNull null
            val size = dimensions.find(link.text())
            val width = size?.groupValues?.get(1)?.toIntOrNull()
            val height = size?.groupValues?.get(2)?.toIntOrNull()
            val shortSide = if (width != null && height != null) minOf(width, height) else null
            if (limitQuality && shortSide != null && !QualityLinks.allowed(shortSide)) return@mapNotNull null
            Playback.Source(url.toString(), shortSide?.let { "${it}p" })
        }.distinctBy { it.url }
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val document = page(PageRequest(data))
        val downloads = downloadableSources(document)
        val actual = document.baseUri().toHttpUrlOrNull()
        val direct = document.selectFirst(".file-card link[itemprop=contentUrl][href]")?.absUrl("href")
            ?.toHttpUrlOrNull()?.takeIf { it.isHttps && it.encodedPath.endsWith(".mp4", true) }
            ?.takeIf { media -> actual?.pathSegments?.getOrNull(1) != null &&
                actual.pathSegments[1] in media.pathSegments }
            ?.let { media ->
                val identity = media.pathSegments.dropLast(1).takeLast(3)
                val matching = downloadSources(document, limitQuality = false).firstOrNull {
                    it.url.toHttpUrlOrNull()?.pathSegments?.dropLast(1)?.takeLast(3) == identity
                }
                val quality = matching?.label?.removeSuffix("p")?.toIntOrNull()
                if (quality != null && !QualityLinks.allowed(quality)) null else Playback.Source(media.toString(), matching?.label)
            }
        return Playback.linksFromPage(
            name, mainUrl, document.baseUri(), document, listOfNotNull(direct) + downloads,
            subtitleCallback, callback, useResolvedUrl = true,
        )
    }
}
