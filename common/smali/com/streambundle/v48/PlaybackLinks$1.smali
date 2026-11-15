.class Lcom/streambundle/v48/PlaybackLinks$1;
.super Ljava/lang/Object;
.source "PlaybackLinks.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v48/PlaybackLinks;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/lagradost/cloudstream3/utils/ExtractorLinkType;Ljava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/coroutines/Continuation<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 118
    sget-object v0, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 2

    .line 119
    return-void
.end method
