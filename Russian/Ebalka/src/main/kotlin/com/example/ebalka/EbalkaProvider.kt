package com.example.ebalka

import com.cloudextensions.russian.*

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
))
