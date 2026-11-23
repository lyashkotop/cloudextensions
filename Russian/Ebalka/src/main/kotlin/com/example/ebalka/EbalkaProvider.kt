package com.example.ebalka

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.LoadResponse
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Element
import org.jsoup.nodes.Document

class EbalkaProvider: RussianProvider(SiteSpec(
    id="Ebalka", title="Ebalka", origin="https://1ebalka.ru.actor",
    cards=".card_video", link="a[href]", titleSelector=".card__title", searchMode="get",
    tagSelector=".video__tags-container a", descriptionSelector="", related="#list_videos_related_videos",
    detailTitleSelector="h1.video__title", titleLanguage="ru",
    sections=listOf(
        Section("Новинки","/latest-videos/"),
        Section("Блюет","/tags/blyuet/"),
        Section("Инцест","/tags/incest/"),
        Section("Лишение девственности","/tags/lishenie-devstvennosti/"),
        Section("Целки","/tags/devstvennica/"),
        Section("Кастинги Пьера Вудмана","/tags/kastingi-pera-vudmana/"),
        Section("В школе","/tags/v-shkole/"),
        Section("Секс со спящими","/tags/seks-so-spyashchimi/"),
        Section("Училки","/tags/uchilki/"),
        Section("Вечеринки курских студентов","/tags/vecherinki-kurskih-studentov/"),
        Section("Женская измена","/tags/jenskaya-izmena/"),
        Section("Двойное проникновение","/tags/dvoynoe-proniknovenie/"),
        Section("Секс путешествие в Египте","/tags/seks-puteshestvie-v-egipte/"),
        Section("Свингеры","/tags/svingery/"),
        Section("Зрелые лесби с молодыми","/tags/zrelye-lesbi-s-molodymi/"),
        Section("Кап Даг","/tags/kap-dag/"),
        Section("В бане и сауне","/tags/v-bane-i-saune/"),
        Section("Зрелая с молодым","/tags/zrelaya-s-molodym/"),
        Section("Ганг - банг","/tags/gang-bang/"),
        Section("Секс за деньги","/tags/seks-za-dengi/"),
        Section("Гинекологическое зеркало","/tags/vaginalnyy-rasshiritel/"),
        Section("Секс под наркозом","/tags/seks-pod-narkozom/"),
        Section("В свадебном платье","/tags/v-svadebnom-plate/"),
        Section("Порно с китаянками","/tags/porno-s-kitayankami/"),
        Section("Босс и секретарша","/tags/sekretarsha/"),
        Section("Двойной фистинг","/tags/dvoynoy-fisting/"),
        Section("Скрытая камера в сауне","/tags/skrytaya-kamera-v-saune/"),
        Section("Подборка нарезок видео","/tags/podborka-narezka-video/"),
        Section("Ректальный градусник","/tags/rektalnyy-gradusnik/"),
        Section("МЖМ","/tags/dvoe-na-odnu/"),
        Section("Жена и муж","/tags/jena-i-muj/"),
    )
)) {
    private val englishHost = "www.fuckingbear.com"
    private val russianHost = Regex("""(?:[0-9]*ebalka|ebalka[0-9]+)\.ru\.actor""")
    private val russianText = Regex("[А-Яа-яЁё]")

    override suspend fun searchRequest(term: String): PageRequest {
        val base = mainUrl.toHttpUrlOrNull() ?: return super.searchRequest(term)
        val url = base.newBuilder().encodedPath("/search/").query(null).addQueryParameter("q", term)
        if (russianHost.matches(base.host) && !russianText.containsMatchIn(term) && term.any { it in 'A'..'Z' || it in 'a'..'z' }) {
            url.host(englishHost)
        }
        return PageRequest(url.build().toString())
    }

    override suspend fun page(request: PageRequest): Document {
        val url = request.url.toHttpUrlOrNull() ?: return super.page(request)
        val russianVideo = russianVideoUrl(url)
        val target = russianVideo ?: url
        val localized = request.copy(
            url = target.toString(),
            headers = if (russianHost.matches(target.host)) request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)
                else request.headers,
        )
        val document = if (url.host == englishHost && url.encodedPath.startsWith("/search/")) {
            val english = RequestLimits.optional(4500) { super.page(localized) }
            if (english != null && english.attr("data-response-code") != "404") english else {
                val fallback = url.newBuilder().host(mainUrl.toHttpUrlOrNull()?.host ?: return super.page(localized)).build()
                super.page(localized.copy(url = fallback.toString(), headers = localized.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE)))
            }
        } else super.page(localized)
        return if (document.baseUri().toHttpUrlOrNull()?.host == englishHost && url.encodedPath.startsWith("/search/")) {
            russianListing(document)
        } else document
    }

    private fun russianVideoUrl(url: HttpUrl): HttpUrl? {
        val segments = url.pathSegments
        if (url.host != englishHost || segments.firstOrNull() != "video" || segments.getOrNull(1)?.toIntOrNull() == null) return null
        val base = mainUrl.toHttpUrlOrNull()?.takeIf { russianHost.matches(it.host) } ?: return null
        return url.newBuilder().host(base.host).setPathSegment(0, "videos").query(null).build()
    }

    private data class RussianCard(val url: String, val title: String)

    private suspend fun russianCard(card: Element): RussianCard? {
        val link = card.selectFirst(spec.link)?.absUrl("href")?.toHttpUrlOrNull() ?: return null
        val url = russianVideoUrl(link) ?: return null
        val document = super.page(PageRequest(url.toString(), allowNotFound = true, headers = mapOf("Accept-Language" to Network.RUSSIAN_LANGUAGE)))
        if (document.selectFirst("html[lang=ru]") == null) return null
        val canonical = document.selectFirst("link[rel=canonical]")?.absUrl("href")?.toHttpUrlOrNull() ?: url
        if (!russianHost.matches(canonical.host) || canonical.pathSegments.take(2) != url.pathSegments.take(2)) return null
        val title = Metadata.detail(document, spec).title
        return title.takeIf(russianText::containsMatchIn)?.let { RussianCard(canonical.toString(), it) }
    }

    private suspend fun russianListing(document: Document): Document = coroutineScope {
        val localized = document.clone()
        val cards = localized.select(spec.cards)
        val resolved = cards.map { card -> async { RequestLimits.optional(8500) { russianCard(card) } } }.awaitAll()
        for ((card, russian) in cards.zip(resolved)) {
            if (russian == null) {
                card.remove()
                continue
            }
            card.selectFirst(spec.link)?.attr("href", russian.url)?.attr("title", russian.title)
            card.selectFirst(spec.titleSelector)?.text(russian.title)
            card.selectFirst("img")?.attr("alt", russian.title)?.attr("title", russian.title)
        }
        localized
    }

    private suspend fun openVideo(data: String): Document {
        val url = data.toHttpUrlOrNull() ?: return page(PageRequest(data))
        val id = url.pathSegments.getOrNull(1)
        if (!russianHost.matches(url.host) || url.pathSegments.firstOrNull() != "videos" ||
            id.isNullOrEmpty() || !id.all(Char::isDigit)) return page(PageRequest(data))

        val hosts = listOf(url.host, "1ebalka.ru.actor", "ebalka1.ru.actor").distinct()
        for (host in hosts) {
            val address = url.newBuilder().host(host).build()
            val document = RequestLimits.optional(3500) { page(PageRequest(address.toString(), allowNotFound = true)) }
                ?: continue
            val actual = document.baseUri().toHttpUrlOrNull() ?: continue
            if (document.attr("data-response-code") == "200" && russianHost.matches(actual.host) &&
                actual.pathSegments.take(2) == url.pathSegments.take(2) &&
                document.selectFirst("h1.video__title") != null) return document
        }
        throw ErrorLoadingException("Ebalka: страница этого видео сейчас недоступна на русских адресах сайта.")
    }

    override suspend fun load(url: String): LoadResponse = loadDocument(url, openVideo(url))

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = openVideo(data)
        return Playback.linksFromPage(name, mainUrl, document.baseUri(), document, emptyList(), subtitleCallback, callback)
    }
}
