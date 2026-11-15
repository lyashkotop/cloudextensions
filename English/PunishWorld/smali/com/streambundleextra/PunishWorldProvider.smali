.class public final Lcom/streambundleextra/PunishWorldProvider;
.super Lcom/streambundleextra/VideoBundleSite;
.source "VideoBundleSites.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Lcom/streambundleextra/PunishWorldProvider;",
        "Lcom/streambundleextra/VideoBundleSite;",
        "<init>",
        "()V"
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
    .registers 3

    .line 24
    const-string v0, "Punishworld"

    const-string v1, "https://punishworld.com"

    invoke-direct {p0, v0, v1}, Lcom/streambundleextra/VideoBundleSite;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
