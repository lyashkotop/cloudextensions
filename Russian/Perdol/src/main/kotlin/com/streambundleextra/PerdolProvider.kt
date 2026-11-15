package com.streambundleextra

import com.cloudextensions.russian.*

class PerdolProvider: RussianProvider(SiteSpec(
    id="Perdol", title="Perdol.net", origin="https://b.perdol.net",
    cards="a.card", link="a[href]", titleSelector=".card__title", searchMode="path",
    tagSelector=".trailer__col .btn-group a[href*=/categor], .trailer__col .btn-group a[href*=/tag]", descriptionSelector="", related="#list_videos_related_videos",
    sections=listOf(
        Section("Новинки","/"),
        Section("Анал 892","/categories/anal/"),
        Section("БДСМ 381","/categories/bdsm/"),
        Section("Брат и сестра 39","/categories/brat-i-sestra/"),
        Section("Групповуха 933","/categories/gruppovuha/"),
        Section("Домашнее 623","/categories/domashnee/"),
        Section("Женская мастурбация 673","/categories/jenskaya-masturbaciya/"),
        Section("Зрелые женщины 1049","/categories/zrelye-jenshchiny/"),
        Section("Зрелые мужчины 308","/categories/zrelye-mujchiny/"),
        Section("Кастинг 319","/categories/kasting/"),
        Section("Куколд и сексвайф 163","/categories/kukold-i-seksvayf/"),
        Section("Лесби 665","/categories/les/"),
        Section("Массаж 163","/categories/massaj/"),
        Section("Мать и сын 146","/categories/mat-i-syn/"),
        Section("Молодые 1376","/categories/molodye/"),
        Section("Папа и дочь 85","/categories/papa-i-doch/"),
        Section("Пикап 258","/categories/pikap/"),
        Section("Писающие 264","/categories/pisayushchie/"),
        Section("По принуждению 394","/categories/po-prinujdeniyu/"),
        Section("Полнометражные 126","/categories/polnometrajnye/"),
        Section("Пьяные 313","/categories/pyanye/"),
        Section("с WEB камер 441","/categories/s-web-kamer/"),
        Section("Семейные оргии 59","/categories/semeynye-orgii/"),
        Section("Скрытая камера 254","/categories/skrytaya-kamera/"),
        Section("У гинеколога 225","/categories/u-ginekologa/"),
        Section("Фистинг 190","/categories/fisting/"),
        Section("Фут фетиш 186","/categories/fut-fetish/"),
        Section("Эротика 476","/categories/erotika/"),
    )
))
