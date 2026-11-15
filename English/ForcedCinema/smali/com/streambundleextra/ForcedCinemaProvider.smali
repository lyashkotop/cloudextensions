.class public final Lcom/streambundleextra/ForcedCinemaProvider;
.super Lcom/streambundleextra/VideoBundleSite;
.source "VideoBundleSites.kt"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "ForcedCinema"

    const-string v1, "https://forcedcinema.net"

    invoke-direct {p0, v0, v1}, Lcom/streambundleextra/VideoBundleSite;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
