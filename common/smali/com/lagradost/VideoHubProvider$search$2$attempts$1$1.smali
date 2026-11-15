.class final Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "VideoHub.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/VideoHubProvider$search$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Result<",
        "+",
        "Ljava/util/List<",
        "+",
        "Lcom/lagradost/VideoCard;",
        ">;>;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001*\u00020\u0004H\n"
    }
    d2 = {
        "<anonymous>",
        "Lkotlin/Result;",
        "",
        "Lcom/lagradost/VideoCard;",
        "Lkotlinx/coroutines/CoroutineScope;"
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
    c = "com.lagradost.VideoHubProvider$search$2$attempts$1$1"
    f = "VideoHub.kt"
    i = {}
    l = {
        0x7a,
        0x7b
    }
    m = "invokeSuspend"
    n = {}
    nl = {
        0x7b,
        0x7c
    }
    s = {}
    v = 0x2
.end annotation


# instance fields
.field final synthetic $q:Ljava/lang/String;

.field label:I

.field final synthetic this$0:Lcom/lagradost/VideoHubProvider;


# direct methods
.method constructor <init>(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/VideoHubProvider;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->this$0:Lcom/lagradost/VideoHubProvider;

    iput-object p2, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->$q:Ljava/lang/String;

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

    new-instance v0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->this$0:Lcom/lagradost/VideoHubProvider;

    iget-object v2, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->$q:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p2}, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;-><init>(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Result<",
            "+",
            "Ljava/util/List<",
            "Lcom/lagradost/VideoCard;",
            ">;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 120
    iget v1, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->label:I

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_26

    if-eq v1, v3, :cond_1b

    if-ne v1, v2, :cond_13

    :try_start_e
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_11
    .catch Ljava/util/concurrent/CancellationException; {:try_start_e .. :try_end_11} :catch_23
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_11} :catch_20

    move-object v1, p1

    goto :goto_80

    :cond_13
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1b
    :try_start_1b
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_1e
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1b .. :try_end_1e} :catch_23
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1e} :catch_20

    move-object v1, p1

    goto :goto_4d

    .line 126
    :catch_20
    move-exception v0

    goto/16 :goto_a3

    :catch_23
    move-exception v0

    goto/16 :goto_ba

    .line 120
    :cond_26
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 121
    nop

    .line 122
    :try_start_2a
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->this$0:Lcom/lagradost/VideoHubProvider;

    # getter for: Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;
    invoke-static {v1}, Lcom/lagradost/VideoHubProvider;->access$getSite$p(Lcom/lagradost/VideoHubProvider;)Lcom/lagradost/CatalogSite;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v1

    const/4 v4, 0x3

    if-ne v1, v4, :cond_52

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->this$0:Lcom/lagradost/VideoHubProvider;

    iget-object v2, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->$q:Ljava/lang/String;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput v3, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->label:I

    # invokes: Lcom/lagradost/VideoHubProvider;->beegSearch(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static {v1, v2, v4}, Lcom/lagradost/VideoHubProvider;->access$beegSearch(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_4d

    .line 120
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 122
    :cond_4d
    :goto_4d
    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_a2

    .line 123
    :cond_52
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->this$0:Lcom/lagradost/VideoHubProvider;

    iget-object v3, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->this$0:Lcom/lagradost/VideoHubProvider;

    # getter for: Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;
    invoke-static {v3}, Lcom/lagradost/VideoHubProvider;->access$getSite$p(Lcom/lagradost/VideoHubProvider;)Lcom/lagradost/CatalogSite;

    move-result-object v3

    iget-object v4, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->this$0:Lcom/lagradost/VideoHubProvider;

    iget-object v5, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->$q:Ljava/lang/String;

    # invokes: Lcom/lagradost/VideoHubProvider;->encode(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v5}, Lcom/lagradost/VideoHubProvider;->access$encode(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/lagradost/CatalogSite;->search(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v6, p0

    check-cast v6, Lkotlin/coroutines/Continuation;

    const/4 v7, 0x6

    const/4 v8, 0x0

    iput v2, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->label:I

    move-object v2, v3

    move-object v3, v4

    move v4, v5

    move-object v5, v6

    move v6, v7

    move-object v7, v8

    invoke-static/range {v1 .. v7}, Lcom/lagradost/VideoHubProvider;->fetch$default(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_80

    .line 120
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_80
    :goto_80
    check-cast v1, Lorg/jsoup/nodes/Document;

    move-object v0, v1

    .line 124
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    sget-object v1, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    move-object v2, v0

    check-cast v2, Lorg/jsoup/nodes/Element;

    iget-object v3, p0, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;->this$0:Lcom/lagradost/VideoHubProvider;

    # getter for: Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;
    invoke-static {v3}, Lcom/lagradost/VideoHubProvider;->access$getSite$p(Lcom/lagradost/VideoHubProvider;)Lcom/lagradost/CatalogSite;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v4

    const-string v5, "location(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3, v4}, Lcom/lagradost/CatalogParser;->cards(Lorg/jsoup/nodes/Element;Lcom/lagradost/CatalogSite;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_a1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2a .. :try_end_a1} :catch_23
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_a1} :catch_20

    move-object v0, v1

    .end local v0    # "doc":Lorg/jsoup/nodes/Document;
    :goto_a2
    goto :goto_b1

    .line 126
    .local v0, "e":Ljava/lang/Exception;
    :goto_a3
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v1, v0

    check-cast v1, Ljava/lang/Throwable;

    invoke-static {v1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    .end local v0    # "e":Ljava/lang/Exception;
    :goto_b1
    invoke-static {v0}, Lkotlin/Result;->box-impl(Ljava/lang/Object;)Lkotlin/Result;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .local v0, "e":Ljava/util/concurrent/CancellationException;
    :goto_ba
    throw v0
.end method
