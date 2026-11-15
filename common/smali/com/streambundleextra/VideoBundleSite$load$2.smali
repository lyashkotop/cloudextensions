.class final Lcom/streambundleextra/VideoBundleSite$load$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "VideoBundleSites.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundleextra/VideoBundleSite;->load$suspendImpl(Lcom/streambundleextra/VideoBundleSite;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lcom/lagradost/cloudstream3/MovieLoadResponse;",
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
        "Lcom/lagradost/cloudstream3/MovieLoadResponse;"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.streambundleextra.VideoBundleSite$load$2"
    f = "VideoBundleSites.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $description:Ljava/lang/String;

.field public $document:Lcom/streambundlehtml/nodes/Document;

.field final synthetic $poster:Ljava/lang/String;

.field public $site:Lcom/streambundleextra/VideoBundleSite;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/streambundleextra/VideoBundleSite$load$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$poster:Ljava/lang/String;

    iput-object p2, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$description:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .registers 6
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

    new-instance v0, Lcom/streambundleextra/VideoBundleSite$load$2;

    iget-object v1, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$poster:Ljava/lang/String;

    iget-object v2, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$description:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p2}, Lcom/streambundleextra/VideoBundleSite$load$2;-><init>(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    iget-object v1, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$document:Lcom/streambundlehtml/nodes/Document;

    iput-object v1, v0, Lcom/streambundleextra/VideoBundleSite$load$2;->$document:Lcom/streambundlehtml/nodes/Document;

    iget-object v1, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$site:Lcom/streambundleextra/VideoBundleSite;

    iput-object v1, v0, Lcom/streambundleextra/VideoBundleSite$load$2;->$site:Lcom/streambundleextra/VideoBundleSite;

    iput-object p1, v0, Lcom/streambundleextra/VideoBundleSite$load$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public final invoke(Lcom/lagradost/cloudstream3/MovieLoadResponse;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MovieLoadResponse;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/streambundleextra/VideoBundleSite$load$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/streambundleextra/VideoBundleSite$load$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/streambundleextra/VideoBundleSite$load$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/streambundleextra/VideoBundleSite$load$2;->invoke(Lcom/lagradost/cloudstream3/MovieLoadResponse;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "$result"    # Ljava/lang/Object;

    iget-object v0, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    .local v0, "$this$newMovieLoadResponse":Lcom/lagradost/cloudstream3/MovieLoadResponse;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 63
    iget v1, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->label:I

    packed-switch v1, :pswitch_data_3e

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_14
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 64
    iget-object v1, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$poster:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterUrl(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterHeaders(Ljava/util/Map;)V

    .line 65
    iget-object v1, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPlot(Ljava/lang/String;)V

    .line 66
    iget-object v1, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$site:Lcom/streambundleextra/VideoBundleSite;

    iget-object v2, p0, Lcom/streambundleextra/VideoBundleSite$load$2;->$document:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {p0}, Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;->getCompletion()Lkotlin/coroutines/Continuation;

    move-result-object v3

    invoke-static {v1, v0, v2, v3}, Lcom/streambundleextra/Details;->apply(Lcom/streambundleextra/VideoBundleSite;Lcom/lagradost/cloudstream3/MovieLoadResponse;Lcom/streambundlehtml/nodes/Document;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
