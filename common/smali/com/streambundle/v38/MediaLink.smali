.class public final Lcom/streambundle/v38/MediaLink;
.super Ljava/lang/Object;
.source "MediaLink.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static emit(Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/util/Map;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IZ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 18
    new-instance v5, Lcom/streambundle/v38/MediaLink$1;

    invoke-direct {v5, p0}, Lcom/streambundle/v38/MediaLink$1;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 24
    nop

    .line 25
    if-eqz p6, :cond_b

    sget-object p6, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    goto :goto_d

    :cond_b
    sget-object p6, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->VIDEO:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    :goto_d
    move-object v3, p6

    new-instance v4, Lcom/streambundle/v38/MediaLink$$ExternalSyntheticLambda0;

    invoke-direct {v4, p4, p5, p7}, Lcom/streambundle/v38/MediaLink$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;ILjava/util/Map;)V

    .line 31
    nop

    .line 24
    move-object v0, p1

    move-object v1, p2

    move-object v2, p3

    invoke-static/range {v0 .. v5}, Lcom/lagradost/cloudstream3/utils/ExtractorApiKt;->newExtractorLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .line 32
    instance-of p2, p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    if-eqz p2, :cond_24

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    :cond_24
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/String;ILjava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 26
    check-cast p3, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .line 27
    invoke-virtual {p3, p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setReferer(Ljava/lang/String;)V

    .line 28
    invoke-virtual {p3, p1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setQuality(I)V

    .line 29
    invoke-virtual {p3, p2}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setHeaders(Ljava/util/Map;)V

    .line 30
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
