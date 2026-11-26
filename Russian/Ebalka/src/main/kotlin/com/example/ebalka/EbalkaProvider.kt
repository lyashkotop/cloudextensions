package com.example.ebalka

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.ErrorLoadingException
import com.lagradost.cloudstream3.LoadResponse
import com.lagradost.cloudstream3.SubtitleFile
import com.lagradost.cloudstream3.utils.ExtractorLink
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Element
import org.jsoup.nodes.Document

private const val DEFAULT_RUSSIAN_HOST = "29ebalka.ru.actor"

class EbalkaProvider: RussianProvider(SiteSpec(
    id="Ebalka", title="Ebalka", origin="https://$DEFAULT_RUSSIAN_HOST",
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
    private val mirrors = listOf(DEFAULT_RUSSIAN_HOST, "1ebalka.ru.actor", "ebalka1.ru.actor")
    @Volatile private var catalogueHost: String? = null
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
        val target = russianVideoUrl(url) ?: url
        if (target != url) {
            return RequestLimits.optional(2800) { russianPage(request, target) } ?: super.page(request)
        }
        if (russianHost.matches(target.host)) {
            if (target.pathSegments.firstOrNull() != "latest-videos") return russianPage(request, target)
            val russian = RequestLimits.optional(3500) { russianPage(request, target) }
            if (russian?.selectFirst(spec.cards) != null) return russian
            val english = target.newBuilder().host(englishHost).build()
            return Network.page(request.copy(url = english.toString()), "https://$englishHost/")
        }
        if (url.host != englishHost || !url.encodedPath.startsWith("/search/")) return super.page(request)

        val english = RequestLimits.optional(3500) { super.page(request) }
        if (english != null && english.attr("data-response-code") != "404") return russianListing(english)
        val host = mainUrl.toHttpUrlOrNull()?.host?.takeIf(russianHost::matches) ?: DEFAULT_RUSSIAN_HOST
        return russianPage(request, url.newBuilder().host(host).build())
    }

    private suspend fun requestMirror(request: PageRequest, url: HttpUrl, host: String): Document? {
        val address = url.newBuilder().host(host).build()
        val localized = request.copy(
            url = address.toString(),
            headers = request.headers + ("Accept-Language" to Network.RUSSIAN_LANGUAGE),
        )
        return RequestLimits.optional(2800) { Network.page(localized, "https://$host/") }
    }

    private fun isRequestedVideo(document: Document, id: String): Boolean {
        val actual = document.baseUri().toHttpUrlOrNull() ?: return false
        return russianHost.matches(actual.host) && videoId(actual) == id &&
            document.selectFirst("h1.video__title") != null
    }

    private suspend fun russianPage(request: PageRequest, url: HttpUrl): Document {
        val path = url.encodedPath.trimEnd('/')
        val video = videoId(url)
        val hosts = (listOfNotNull(catalogueHost, url.host) + mirrors).distinct()
        var missing: Document? = null
        for (host in hosts) {
            val document = requestMirror(request, url, host) ?: continue
            val actual = document.baseUri().toHttpUrlOrNull() ?: continue
            if (!russianHost.matches(actual.host)) continue
            if (video != null) {
                if (!isRequestedVideo(document, video)) continue
            } else {
                if (actual.encodedPath.trimEnd('/') != path ||
                    actual.queryParameter("q") != url.queryParameter("q")) continue
                if (document.attr("data-response-code") in setOf("404", "410") && request.allowNotFound) {
                    missing = document
                    continue
                }
                if (document.selectFirst("html[lang=ru]") == null) continue
                catalogueHost = actual.host
            }
            return document
        }
        return missing ?: throw ErrorLoadingException("Ebalka: русские зеркала сейчас не ответили на запрос.")
    }

    private fun videoId(url: HttpUrl): String? =
        url.pathSegments.getOrNull(1)?.takeIf {
            url.pathSegments.firstOrNull() == "videos" && it.isNotEmpty() && it.all(Char::isDigit)
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
        val document = russianPage(PageRequest(url.toString(), allowNotFound = true), url)
        if (document.selectFirst("html[lang=ru]") == null) return null
        val canonical = document.selectFirst("link[rel=canonical]")?.absUrl("href")?.toHttpUrlOrNull() ?: url
        if (!russianHost.matches(canonical.host) || canonical.pathSegments.take(2) != url.pathSegments.take(2)) return null
        val title = Metadata.detail(document, spec).title
        return title.takeIf(russianText::containsMatchIn)?.let { RussianCard(canonical.toString(), it) }
    }

    private suspend fun russianListing(document: Document): Document = coroutineScope {
        if (catalogueHost == null) return@coroutineScope document
        val localized = document.clone()
        val cards = localized.select(spec.cards)
        val resolved = cards.map { card -> async { RequestLimits.optional(8500) { russianCard(card) } } }.awaitAll()
        for ((card, russian) in cards.zip(resolved)) {
            if (russian == null) continue
            card.selectFirst(spec.link)?.attr("href", russian.url)?.attr("title", russian.title)
            card.selectFirst(spec.titleSelector)?.text(russian.title)
            card.selectFirst("img")?.attr("alt", russian.title)?.attr("title", russian.title)
        }
        localized
    }

    override suspend fun load(url: String): LoadResponse {
        val address = url.toHttpUrlOrNull() ?: return super.load(url)
        val target = russianVideoUrl(address) ?: address
        val id = videoId(target)?.takeIf { russianHost.matches(target.host) } ?: return super.load(url)
        val document = if (address == target) openCard(target, id) else {
            RequestLimits.optional(2800) { openCard(target, id) } ?: super.page(PageRequest(url))
        }
        return loadDocument(url, document)
    }

    private suspend fun openCard(url: HttpUrl, id: String): Document = coroutineScope {
        val knownHost = url.host.takeUnless { it in mirrors }
        val hosts = (listOfNotNull(catalogueHost, knownHost) + mirrors + url.host).distinct()
        val replies = Channel<Document?>(hosts.size)
        val request = PageRequest(url.toString())
        val attempts = hosts.mapIndexed { index, host ->
            launch {
                // Give the preferred address a head start and stop the other requests once one succeeds.
                if (index > 0) delay(index * 125L)
                replies.send(requestMirror(request, url, host)?.takeIf { isRequestedVideo(it, id) })
            }
        }
        try {
            repeat(hosts.size) {
                replies.receive()?.let { return@coroutineScope it }
            }
            throw ErrorLoadingException("Ebalka: русские зеркала сейчас не открывают этот ролик.")
        } finally {
            attempts.forEach { it.cancel() }
        }
    }

    override suspend fun loadLinks(
        data: String, isCasting: Boolean, subtitleCallback: (SubtitleFile) -> Unit, callback: (ExtractorLink) -> Unit,
    ): Boolean {
        val document = page(PageRequest(data))
        return Playback.linksFromPage(name, mainUrl, document.baseUri(), document, emptyList(), subtitleCallback, callback)
    }
}
