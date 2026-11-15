.class public final Lcom/example/websites/SemyanaProvider;
.super Lcom/example/websites/WebVideoProvider;
.source "WebVideoProviders.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/example/websites/SemyanaProvider;",
        "Lcom/example/websites/WebVideoProvider;",
        "<init>",
        "()V",
        "VideoSources_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 10

    .line 172
    const-string v7, "a.video-card-link[href]"

    const-string v8, ".video-title"

    const-string v1, "semyana"

    const-string v2, "https://w.semyana.com"

    const-string v3, "Semyana"

    const-string v4, "ru"

    const-string v5, "/"

    const-string v6, ".video-card"

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/example/websites/WebVideoProvider;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
