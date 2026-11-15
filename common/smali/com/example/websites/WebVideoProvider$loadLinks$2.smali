.class final Lcom/example/websites/WebVideoProvider$loadLinks$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "WebVideoProviders.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/websites/WebVideoProvider;->loadLinks$suspendImpl(Lcom/example/websites/WebVideoProvider;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
    c = "com.example.websites.WebVideoProvider$loadLinks$2"
    f = "WebVideoProviders.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
    v = 0x1
.end annotation


# instance fields
.field final synthetic $stream:Lcom/example/tubesafari/TubeSafariParser$Stream;

.field final synthetic $url:Ljava/lang/String;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/example/websites/WebVideoProvider;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/example/tubesafari/TubeSafariParser$Stream;Lcom/example/websites/WebVideoProvider;Lkotlin/coroutines/Continuation;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/example/tubesafari/TubeSafariParser$Stream;",
            "Lcom/example/websites/WebVideoProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/websites/WebVideoProvider$loadLinks$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->$url:Ljava/lang/String;

    iput-object p2, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->$stream:Lcom/example/tubesafari/TubeSafariParser$Stream;

    iput-object p3, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->this$0:Lcom/example/websites/WebVideoProvider;

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

    new-instance v0, Lcom/example/websites/WebVideoProvider$loadLinks$2;

    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->$url:Ljava/lang/String;

    iget-object v2, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->$stream:Lcom/example/tubesafari/TubeSafariParser$Stream;

    iget-object v3, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->this$0:Lcom/example/websites/WebVideoProvider;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/example/websites/WebVideoProvider$loadLinks$2;-><init>(Ljava/lang/String;Lcom/example/tubesafari/TubeSafariParser$Stream;Lcom/example/websites/WebVideoProvider;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->L$0:Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/example/websites/WebVideoProvider$loadLinks$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/websites/WebVideoProvider$loadLinks$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/websites/WebVideoProvider$loadLinks$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/websites/WebVideoProvider$loadLinks$2;->invoke(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 148
    iget v0, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->label:I

    packed-switch v0, :pswitch_data_38

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_10
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .local p1, "$result":Ljava/lang/Object;
    iget-object v0, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .line 149
    .local v0, "$this$newExtractorLink":Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setReferer(Ljava/lang/String;)V

    .line 150
    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->$stream:Lcom/example/tubesafari/TubeSafariParser$Stream;

    invoke-virtual {v1}, Lcom/example/tubesafari/TubeSafariParser$Stream;->getQuality()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setQuality(I)V

    .line 151
    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->this$0:Lcom/example/websites/WebVideoProvider;

    iget-object v2, p0, Lcom/example/websites/WebVideoProvider$loadLinks$2;->$url:Ljava/lang/String;

    # invokes: Lcom/example/websites/WebVideoProvider;->headers(Ljava/lang/String;)Ljava/util/Map;
    invoke-static {v1, v2}, Lcom/example/websites/WebVideoProvider;->access$headers(Lcom/example/websites/WebVideoProvider;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setHeaders(Ljava/util/Map;)V

    .line 152
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static/range {v1 .. v1}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
