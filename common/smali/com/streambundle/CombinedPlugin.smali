.class public final Lcom/streambundle/CombinedPlugin;
.super Lcom/lagradost/cloudstream3/plugins/Plugin;
.source "VideoBundlePlugin"


# annotations
.annotation runtime Lcom/lagradost/cloudstream3/plugins/CloudstreamPlugin;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/lagradost/cloudstream3/plugins/Plugin;-><init>()V

    return-void
.end method


# virtual methods
.method public load(Landroid/content/Context;)V
    .registers 7

    new-instance v0, Lcom/example/ebalka/EbalkaProvider;

    invoke-direct {v0}, Lcom/example/ebalka/EbalkaProvider;-><init>()V

    const-string v1, "01. Ebalka"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/SemyanaProvider;

    invoke-direct {v0}, Lcom/example/websites/SemyanaProvider;-><init>()V

    const-string v1, "02. Semyana"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/Strip2Provider;

    invoke-direct {v0}, Lcom/example/websites/Strip2Provider;-><init>()V

    const-string v1, "03. Strip2"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/VpoiskProvider;

    invoke-direct {v0}, Lcom/example/websites/VpoiskProvider;-><init>()V

    const-string v1, "04. Vpoisk"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/PerdolProvider;

    invoke-direct {v0}, Lcom/streambundleextra/PerdolProvider;-><init>()V

    const-string v1, "05. Perdol.net"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/ProstoPornoProvider;

    invoke-direct {v0}, Lcom/streambundleextra/ProstoPornoProvider;-><init>()V

    const-string v1, "06. ProstoPorno"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/HuyambaProvider;

    invoke-direct {v0}, Lcom/streambundleextra/HuyambaProvider;-><init>()V

    const-string v1, "07. Huyamba"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x4

    const-string v3, "MissAV"

    const-string v4, "https://missav.live"

    invoke-direct {v1, v2, v3, v4}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1}, Lcom/lagradost/VideoHubProvider;-><init>(Lcom/lagradost/CatalogSite;)V

    const-string v1, "08. MissAV"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ja"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/JavGuruProvider;

    invoke-direct {v0}, Lcom/example/websites/JavGuruProvider;-><init>()V

    const-string v1, "09. JAVGuru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ja"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x1

    const-string v3, "PornVideos.rs"

    const-string v4, "https://www.pornvideos.rs"

    invoke-direct {v1, v2, v3, v4}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1}, Lcom/lagradost/VideoHubProvider;-><init>(Lcom/lagradost/CatalogSite;)V

    const-string v1, "10. PornVideos.rs"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x3

    const-string v3, "Beeg.porn"

    const-string v4, "https://beeg.porn"

    invoke-direct {v1, v2, v3, v4}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1}, Lcom/lagradost/VideoHubProvider;-><init>(Lcom/lagradost/CatalogSite;)V

    const-string v1, "11. Beeg.porn"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/tubesafari/TubeSafariProvider;

    invoke-direct {v0}, Lcom/example/tubesafari/TubeSafariProvider;-><init>()V

    const-string v1, "13. TubeSafari"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/epawg/EpawgProvider;

    invoke-direct {v0}, Lcom/example/epawg/EpawgProvider;-><init>()V

    const-string v1, "14. Epawg"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/UKDevilzProvider;

    invoke-direct {v0}, Lcom/example/websites/UKDevilzProvider;-><init>()V

    const-string v1, "15. UKDevilz"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/BdsMxProvider;

    invoke-direct {v0}, Lcom/streambundleextra/BdsMxProvider;-><init>()V

    const-string v1, "16. BDSMX"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/HcBdsMxProvider;

    invoke-direct {v0}, Lcom/streambundleextra/HcBdsMxProvider;-><init>()V

    const-string v1, "17. hcBDSM"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/ThisVidProvider;

    invoke-direct {v0}, Lcom/streambundleextra/ThisVidProvider;-><init>()V

    const-string v1, "18. ThisVid"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/BoundHubProvider;

    invoke-direct {v0}, Lcom/streambundleextra/BoundHubProvider;-><init>()V

    const-string v1, "19. BoundHub"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/PunishWorldProvider;

    invoke-direct {v0}, Lcom/streambundleextra/PunishWorldProvider;-><init>()V

    const-string v1, "20. Punishworld"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/PunishBangProvider;

    invoke-direct {v0}, Lcom/streambundleextra/PunishBangProvider;-><init>()V

    const-string v1, "21. PunishBang"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/HurtSexProvider;

    invoke-direct {v0}, Lcom/streambundleextra/HurtSexProvider;-><init>()V

    const-string v1, "22. HurtSex"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/DarknessPornProvider;

    invoke-direct {v0}, Lcom/streambundleextra/DarknessPornProvider;-><init>()V

    const-string v1, "23. DarknessPorn"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/SickRProvider;

    invoke-direct {v0}, Lcom/streambundleextra/SickRProvider;-><init>()V

    const-string v1, "24. SICK-R"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/PervertiumProvider;

    invoke-direct {v0}, Lcom/streambundleextra/PervertiumProvider;-><init>()V

    const-string v1, "25. Pervertium"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/ForcedCinemaProvider;

    invoke-direct {v0}, Lcom/streambundleextra/ForcedCinemaProvider;-><init>()V

    const-string v1, "26. ForcedCinema"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/SickJunkProvider;

    invoke-direct {v0}, Lcom/streambundleextra/SickJunkProvider;-><init>()V

    const-string v1, "27. SickJunk"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/YouJizzProvider;

    invoke-direct {v0}, Lcom/streambundleextra/YouJizzProvider;-><init>()V

    const-string v1, "28. YouJizz"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/streambundle/CombinedPlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    return-void
.end method
