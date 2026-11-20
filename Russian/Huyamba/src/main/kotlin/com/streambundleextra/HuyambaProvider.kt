package com.streambundleextra

import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.LoadResponse

class HuyambaProvider: RussianProvider(SiteSpec(
    id="Huyamba", title="Huyamba", origin="https://ru.huyamba.name",
    cards="a.card", link="a[href]", titleSelector=".title", searchMode="get",
    tagSelector=".video-controls .video-list a[href*=/categor], .video-controls .video-list a[href*=/tag]", descriptionSelector="", related="#list_videos_related_videos,#list_videos_recommended_videos",
    sections=listOf(
        Section("Новинки","/"),
        Section("Показать Еще","/categories/porn-movies/"),
        Section("Ретро порно фильмы","/categories/retro-porno-filmy/"),
        Section("Эротические фильмы","/categories/erotic-movies-full/"),
        Section("Скрытая камера","/categories/hidden-cameras-porn-videos/"),
        Section("Русские порно фильмы","/categories/russian-porn-movies/"),
        Section("Полнометражные порно фильмы","/categories/full-porn-movies/"),
        Section("Порно пародии","/categories/xxx-porn-parody/"),
        Section("Классика, любовь, поцелуи, эротика","/categories/classic-love-kisses-erotic/"),
        Section("Старушки, порно со зрелыми","/categories/granny-porn-videos/"),
        Section("Порно с переводом","/categories/porno-s-perevodom/"),
        Section("Куколд порно, измена, рогоносцы","/categories/cuckold-porn/"),
        Section("Толстушки, порно с толстыми","/categories/tolstushki-porn/"),
        Section("Публичное порно","/categories/public-porn-videos/"),
        Section("Групповое порно, свингеры","/categories/group-porn-videos/"),
        Section("Орал, анилингус, куннилингус","/categories/oral-porn-videos/"),
        Section("Сексуальные девушки","/categories/lesbians-porn-videos/"),
        Section("Порно Ужасы","/categories/horror/"),
        Section("БДСМ, доминирование, Садо Мазо","/categories/bdsm-porn-videos/"),
        Section("Русское порно","/categories/russian-porn/"),
        Section("Порно знаменитостей","/categories/celebrities-porn-videos/"),
        Section("Минет, ручная работа","/categories/blowjob-porn/"),
        Section("Порно молодых","/categories/teen-porn/"),
        Section("Азиатки","/categories/asian-porn-videos/"),
        Section("Секс машины","/categories/sex-mashines-porn-videos/"),
        Section("Анал и Анальный секс","/categories/anal-porn/"),
        Section("Межрассовое Порно","/categories/interracial-porn-videos/"),
        Section("Сперма, сквиртинг","/categories/sperm-squirt-porn/"),
        Section("Большие толстые члены","/categories/big-dick-porn/"),
        Section("Секс игрушки","/categories/sex-toys-porn-videos/"),
        Section("Фистинг, инсершн, страпон","/categories/fisting-porn-videos/"),
        Section("Худые, порно с худыми","/categories/skinny-porn/"),
        Section("Соло, стриптиз, мастурбация","/categories/solo-striptease/"),
        Section("Домашнее порно видео","/categories/homemade-porn-videos/"),
        Section("Виртуальное порно VR 360","/categories/vr-porn-videos/"),
    )
)) {
    override suspend fun load(url: String): LoadResponse {
        val detail = super.load(url)
        detail.plot = null
        val tags = detail.tags.orEmpty()
        detail.tags = tags.take(maxOf(8, (tags.size * 3 + 3) / 4))
        return detail
    }
}
