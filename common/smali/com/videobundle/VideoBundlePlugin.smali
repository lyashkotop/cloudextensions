.class public final Lcom/videobundle/VideoBundlePlugin;
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

    new-instance v1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x1

    const-string v3, "PornVideos.rs"

    const-string v4, "https://www.pornvideos.rs"

    invoke-direct {v1, v2, v3, v4}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1}, Lcom/lagradost/VideoHubProvider;-><init>(Lcom/lagradost/CatalogSite;)V

    const-string v2, "01. PornVideos.rs"

    invoke-virtual {v0, v2}, Lcom/lagradost/VideoHubProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x3

    const-string v3, "Beeg.porn"

    const-string v4, "https://beeg.porn"

    invoke-direct {v1, v2, v3, v4}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1}, Lcom/lagradost/VideoHubProvider;-><init>(Lcom/lagradost/CatalogSite;)V

    const-string v2, "02. Beeg.porn"

    invoke-virtual {v0, v2}, Lcom/lagradost/VideoHubProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x4

    const-string v3, "MissAV"

    const-string v4, "https://missav.live"

    invoke-direct {v1, v2, v3, v4}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1}, Lcom/lagradost/VideoHubProvider;-><init>(Lcom/lagradost/CatalogSite;)V

    const-string v2, "03. MissAV"

    invoke-virtual {v0, v2}, Lcom/lagradost/VideoHubProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x5

    const-string v3, "EFukt.com"

    const-string v4, "https://efukt.com"

    invoke-direct {v1, v2, v3, v4}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1}, Lcom/lagradost/VideoHubProvider;-><init>(Lcom/lagradost/CatalogSite;)V

    const-string v2, "04. EFukt.com"

    invoke-virtual {v0, v2}, Lcom/lagradost/VideoHubProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/tubesafari/TubeSafariProvider;

    invoke-direct {v0}, Lcom/example/tubesafari/TubeSafariProvider;-><init>()V

    const-string v2, "05. TubeSafari"

    invoke-virtual {v0, v2}, Lcom/example/tubesafari/TubeSafariProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/epawg/EpawgProvider;

    invoke-direct {v0}, Lcom/example/epawg/EpawgProvider;-><init>()V

    const-string v2, "06. Epawg"

    invoke-virtual {v0, v2}, Lcom/example/epawg/EpawgProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/ebalka/EbalkaProvider;

    invoke-direct {v0}, Lcom/example/ebalka/EbalkaProvider;-><init>()V

    const-string v2, "07. Ebalka"

    invoke-virtual {v0, v2}, Lcom/example/ebalka/EbalkaProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/UKDevilzProvider;

    invoke-direct {v0}, Lcom/example/websites/UKDevilzProvider;-><init>()V

    const-string v2, "09. UKDevilz"

    invoke-virtual {v0, v2}, Lcom/example/websites/UKDevilzProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/SemyanaProvider;

    invoke-direct {v0}, Lcom/example/websites/SemyanaProvider;-><init>()V

    const-string v2, "10. Semyana"

    invoke-virtual {v0, v2}, Lcom/example/websites/SemyanaProvider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/Strip2Provider;

    invoke-direct {v0}, Lcom/example/websites/Strip2Provider;-><init>()V

    const-string v2, "11. Strip2"

    invoke-virtual {v0, v2}, Lcom/example/websites/Strip2Provider;->setName(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/JavGuruProvider;

    invoke-direct {v0}, Lcom/example/websites/JavGuruProvider;-><init>()V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/example/websites/VpoiskProvider;

    invoke-direct {v0}, Lcom/example/websites/VpoiskProvider;-><init>()V

    invoke-virtual {p0, v0}, Lcom/videobundle/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    return-void
.end method
