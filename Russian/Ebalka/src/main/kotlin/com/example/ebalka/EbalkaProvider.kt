package com.example.ebalka

import com.cloudextensions.russian.*
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import org.jsoup.nodes.Document

class EbalkaProvider: RussianProvider(SiteSpec(
    id="Ebalka", title="Ebalka", origin="https://1ebalka.ru.actor",
    cards=".card_video", link="a[href]", titleSelector=".card__title", searchMode="get",
    tagSelector=".video__tags-container a", descriptionSelector="", related="#list_videos_related_videos",
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
    private val russianHost = "1ebalka.ru.actor"
    private val englishHost = "www.fuckingbear.com"
    private val cyrillic = Regex("[А-Яа-яЁё]")

    override suspend fun searchRequest(term: String): PageRequest {
        val base = mainUrl.toHttpUrlOrNull() ?: return super.searchRequest(term)
        val url = base.newBuilder().encodedPath("/search/").query(null).addQueryParameter("q", term)
        if (base.host == russianHost && !cyrillic.containsMatchIn(term) && term.any { it in 'A'..'Z' || it in 'a'..'z' }) {
            url.host(englishHost)
        }
        return PageRequest(url.build().toString())
    }

    override suspend fun page(request: PageRequest): Document {
        val url = request.url.toHttpUrlOrNull() ?: return super.page(request)
        if (url.host !in setOf(russianHost, englishHost) || request.data != null ||
            !listOf("/search/", "/latest-videos/").any { url.encodedPath.startsWith(it) }
        ) return super.page(request)

        // Both published language sites use the same catalogue routes.
        val first = RequestLimits.optional(4500) { super.page(request) }
        if (first != null && first.attr("data-response-code") != "404") return first
        val fallbackHost = if (url.host == russianHost) englishHost else russianHost
        val fallback = request.copy(url = url.newBuilder().host(fallbackHost).build().toString())
        return RequestLimits.required("Ebalka", 6500) { super.page(fallback) }
    }
}
