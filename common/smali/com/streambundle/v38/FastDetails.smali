.class public final Lcom/streambundle/v38/FastDetails;
.super Ljava/lang/Object;
.source "FastDetails.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3

    .line 31
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/FastDetails;->enrich(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private static enrich(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4

    .line 32
    instance-of v0, p2, Lcom/lagradost/cloudstream3/LoadResponse;

    if-nez v0, :cond_5

    return-void

    .line 33
    :cond_5
    invoke-static {p2}, Lcom/streambundle/v38/SearchAndPosters;->reusePoster(Ljava/lang/Object;)V

    .line 34
    invoke-static {p2}, Lcom/streambundle/v38/DetailMetadata;->enrich(Ljava/lang/Object;)V

    .line 35
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/QuickSearch;->recommendations(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 36
    return-void
.end method

.method public static open(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 15
    new-instance v0, Lcom/streambundle/v38/FastDetails$1;

    invoke-direct {v0, p2, p0, p1}, Lcom/streambundle/v38/FastDetails$1;-><init>(Lkotlin/coroutines/Continuation;Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    nop

    .line 26
    const/4 p2, 0x2

    new-array v1, p2, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Lkotlin/coroutines/Continuation;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-array p2, p2, [Ljava/lang/Object;

    aput-object p1, p2, v3

    aput-object v0, p2, v4

    .line 25
    const-string v0, "detailUnscreened"

    invoke-static {p0, v0, v1, p2}, Lcom/streambundle/v38/Screening;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 27
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-eq p2, v0, :cond_28

    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/FastDetails;->enrich(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    :cond_28
    return-object p2
.end method

.method public static remember(Ljava/lang/Object;)V
    .registers 1

    .line 11
    return-void
.end method

.method public static warm(Ljava/lang/Object;Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "*>;)V"
        }
    .end annotation

    .line 12
    return-void
.end method
