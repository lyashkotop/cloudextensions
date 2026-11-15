.class final Lcom/example/ebalka/EbalkaProvider$loadLinks$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "EbalkaProvider.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/ebalka/EbalkaProvider;->linksOriginal48(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.example.ebalka.EbalkaProvider$loadLinks$2"
    f = "EbalkaProvider.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
    v = 0x1
.end annotation


# instance fields
.field final synthetic $referer:Ljava/lang/String;

.field final synthetic $stream:Lcom/example/ebalka/EbalkaParser$Stream;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/example/ebalka/EbalkaProvider;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/example/ebalka/EbalkaParser$Stream;Lcom/example/ebalka/EbalkaProvider;Lkotlin/coroutines/Continuation;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/example/ebalka/EbalkaParser$Stream;",
            "Lcom/example/ebalka/EbalkaProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/ebalka/EbalkaProvider$loadLinks$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->$referer:Ljava/lang/String;

    iput-object p2, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->$stream:Lcom/example/ebalka/EbalkaParser$Stream;

    iput-object p3, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->this$0:Lcom/example/ebalka/EbalkaProvider;

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

    new-instance v0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;

    iget-object v1, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->$referer:Ljava/lang/String;

    iget-object v2, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->$stream:Lcom/example/ebalka/EbalkaParser$Stream;

    iget-object v3, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->this$0:Lcom/example/ebalka/EbalkaProvider;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;-><init>(Ljava/lang/String;Lcom/example/ebalka/EbalkaParser$Stream;Lcom/example/ebalka/EbalkaProvider;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->L$0:Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->invoke(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 112
    iget v0, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->label:I

    packed-switch v0, :pswitch_data_50

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_10
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .local p1, "$result":Ljava/lang/Object;
    iget-object v0, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .line 113
    .local v0, "$this$newExtractorLink":Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    iget-object v1, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->$referer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setReferer(Ljava/lang/String;)V

    .line 114
    iget-object v1, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->$stream:Lcom/example/ebalka/EbalkaParser$Stream;

    invoke-virtual {v1}, Lcom/example/ebalka/EbalkaParser$Stream;->getQuality()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setQuality(I)V

    .line 115
    const/4 v1, 0x2

    new-array v1, v1, [Lkotlin/Pair;

    iget-object v2, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->this$0:Lcom/example/ebalka/EbalkaProvider;

    # getter for: Lcom/example/ebalka/EbalkaProvider;->userAgent:Ljava/lang/String;
    invoke-static {v2}, Lcom/example/ebalka/EbalkaProvider;->access$getUserAgent$p(Lcom/example/ebalka/EbalkaProvider;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "User-Agent"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Referer"

    iget-object v3, p0, Lcom/example/ebalka/EbalkaProvider$loadLinks$2;->$referer:Ljava/lang/String;

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setHeaders(Ljava/util/Map;)V

    .line 116
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static/range {v1 .. v1}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
