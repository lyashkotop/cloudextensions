.class public final Lcom/streambundleextra/VideoBundlePlugin;
.super Lcom/lagradost/cloudstream3/plugins/Plugin;
.source "VideoBundlePlugin.kt"


# annotations
.annotation runtime Lcom/lagradost/cloudstream3/plugins/CloudstreamPlugin;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016"
    }
    d2 = {
        "Lcom/streambundleextra/VideoBundlePlugin;",
        "Lcom/lagradost/cloudstream3/plugins/Plugin;",
        "<init>",
        "()V",
        "load",
        "",
        "context",
        "Landroid/content/Context;"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Lcom/lagradost/cloudstream3/plugins/Plugin;-><init>()V

    .line 7
    return-void
.end method


# virtual methods
.method public load(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    new-instance v0, Lcom/streambundleextra/BdsMxProvider;

    invoke-direct {v0}, Lcom/streambundleextra/BdsMxProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 11
    new-instance v0, Lcom/streambundleextra/HcBdsMxProvider;

    invoke-direct {v0}, Lcom/streambundleextra/HcBdsMxProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 12
    new-instance v0, Lcom/streambundleextra/ThisVidProvider;

    invoke-direct {v0}, Lcom/streambundleextra/ThisVidProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 13
    new-instance v0, Lcom/streambundleextra/BoundHubProvider;

    invoke-direct {v0}, Lcom/streambundleextra/BoundHubProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 14
    new-instance v0, Lcom/streambundleextra/PunishWorldProvider;

    invoke-direct {v0}, Lcom/streambundleextra/PunishWorldProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/PunishBangProvider;

    invoke-direct {v0}, Lcom/streambundleextra/PunishBangProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 16
    new-instance v0, Lcom/streambundleextra/HurtSexProvider;

    invoke-direct {v0}, Lcom/streambundleextra/HurtSexProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 17
    new-instance v0, Lcom/streambundleextra/DarknessPornProvider;

    invoke-direct {v0}, Lcom/streambundleextra/DarknessPornProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 18
    new-instance v0, Lcom/streambundleextra/SickRProvider;

    invoke-direct {v0}, Lcom/streambundleextra/SickRProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 19
    new-instance v0, Lcom/streambundleextra/PervertiumProvider;

    invoke-direct {v0}, Lcom/streambundleextra/PervertiumProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 20
    new-instance v0, Lcom/streambundleextra/HeavyFetishProvider;

    invoke-direct {v0}, Lcom/streambundleextra/HeavyFetishProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 21
    new-instance v0, Lcom/streambundleextra/ForcedCinemaProvider;

    invoke-direct {v0}, Lcom/streambundleextra/ForcedCinemaProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 22
    new-instance v0, Lcom/streambundleextra/SickJunkProvider;

    invoke-direct {v0}, Lcom/streambundleextra/SickJunkProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 23
    .line 24
    new-instance v0, Lcom/streambundleextra/InhumanityProvider;

    invoke-direct {v0}, Lcom/streambundleextra/InhumanityProvider;-><init>()V

    check-cast v0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    .line 25
    .line 15
    new-instance v0, Lcom/streambundleextra/PerdolProvider;

    invoke-direct {v0}, Lcom/streambundleextra/PerdolProvider;-><init>()V

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/ProstoPornoProvider;

    invoke-direct {v0}, Lcom/streambundleextra/ProstoPornoProvider;-><init>()V

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/YouJizzProvider;

    invoke-direct {v0}, Lcom/streambundleextra/YouJizzProvider;-><init>()V

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    new-instance v0, Lcom/streambundleextra/HuyambaProvider;

    invoke-direct {v0}, Lcom/streambundleextra/HuyambaProvider;-><init>()V

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundlePlugin;->registerMainAPI(Lcom/lagradost/cloudstream3/MainAPI;)V

    return-void
.end method
