.class public final Lcom/lagradost/CatalogParserKt;
.super Ljava/lang/Object;
.source "CatalogParser.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\"\u0017\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "catalogSites",
        "",
        "Lcom/lagradost/CatalogSite;",
        "getCatalogSites",
        "()Ljava/util/List;"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final catalogSites:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lagradost/CatalogSite;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 27
    nop

    .line 28
    const/4 v0, 0x4

    new-array v1, v0, [Lcom/lagradost/CatalogSite;

    new-instance v2, Lcom/lagradost/CatalogSite;

    const/4 v3, 0x1

    const-string v4, "PornVideos.rs"

    const-string v5, "https://www.pornvideos.rs"

    invoke-direct {v2, v3, v4, v5}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x0

    aput-object v2, v1, v4

    .line 29
    new-instance v2, Lcom/lagradost/CatalogSite;

    const/4 v4, 0x3

    const-string v5, "Beeg.porn"

    const-string v6, "https://beeg.porn"

    invoke-direct {v2, v4, v5, v6}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    aput-object v2, v1, v3

    .line 28
    nop

    .line 30
    new-instance v2, Lcom/lagradost/CatalogSite;

    const-string v3, "MissAV"

    const-string v5, "https://missav.live"

    invoke-direct {v2, v0, v3, v5}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x2

    aput-object v2, v1, v0

    .line 28
    nop

    .line 31
    new-instance v0, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x5

    const-string v3, "EFukt.com"

    const-string v5, "https://efukt.com"

    invoke-direct {v0, v2, v3, v5}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    aput-object v0, v1, v4

    .line 28
    nop

    .line 27
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/lagradost/CatalogParserKt;->catalogSites:Ljava/util/List;

    return-void
.end method

.method public static final getCatalogSites()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/lagradost/CatalogSite;",
            ">;"
        }
    .end annotation

    .line 27
    sget-object v0, Lcom/lagradost/CatalogParserKt;->catalogSites:Ljava/util/List;

    return-object v0
.end method
