.class final Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "VideoHub.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/VideoHubProvider;->loadLinks$emit$deliver(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lcom/lagradost/cloudstream3/utils/ExtractorLink;"
    }
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.lagradost.VideoHubProvider$loadLinks$emit$deliver$2"
    f = "VideoHub.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    nl = {}
    s = {}
    v = 0x2
.end annotation


# instance fields
.field final synthetic $height:I

.field final synthetic $mediaHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $ref:Ljava/lang/String;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/Map;ILkotlin/coroutines/Continuation;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$ref:Ljava/lang/String;

    iput-object p2, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$mediaHeaders:Ljava/util/Map;

    iput p3, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$height:I

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$ref:Ljava/lang/String;

    iget-object v2, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$mediaHeaders:Ljava/util/Map;

    iget v3, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$height:I

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;-><init>(Ljava/lang/String;Ljava/util/Map;ILkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public final invoke(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->invoke(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "$result"    # Ljava/lang/Object;

    iget-object v0, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .local v0, "$this$newExtractorLink":Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 197
    iget v1, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->label:I

    if-nez v1, :cond_24

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 198
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$ref:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setReferer(Ljava/lang/String;)V

    .line 199
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$mediaHeaders:Ljava/util/Map;

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setHeaders(Ljava/util/Map;)V

    .line 200
    iget v1, p0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;->$height:I

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setQuality(I)V

    .line 201
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static/range {v1 .. v1}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 197
    :cond_24
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
