.class final Lcom/example/tubesafari/TubeSafariProvider$search$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "TubeSafariProvider.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/tubesafari/TubeSafariProvider;->search(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ljava/lang/String;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Ljava/util/List<",
        "+",
        "Lcom/lagradost/cloudstream3/SearchResponse;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0004H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lcom/lagradost/cloudstream3/SearchResponse;",
        "term",
        ""
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
    c = "com.example.tubesafari.TubeSafariProvider$search$2"
    f = "TubeSafariProvider.kt"
    i = {}
    l = {
        0x4a
    }
    m = "invokeSuspend"
    n = {}
    s = {}
    v = 0x1
.end annotation


# instance fields
.field synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/example/tubesafari/TubeSafariProvider;


# direct methods
.method constructor <init>(Lcom/example/tubesafari/TubeSafariProvider;Lkotlin/coroutines/Continuation;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/tubesafari/TubeSafariProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/tubesafari/TubeSafariProvider$search$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->this$0:Lcom/example/tubesafari/TubeSafariProvider;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .registers 5
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

    new-instance v0, Lcom/example/tubesafari/TubeSafariProvider$search$2;

    iget-object v1, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->this$0:Lcom/example/tubesafari/TubeSafariProvider;

    invoke-direct {v0, v1, p2}, Lcom/example/tubesafari/TubeSafariProvider$search$2;-><init>(Lcom/example/tubesafari/TubeSafariProvider;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Ljava/lang/String;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/tubesafari/TubeSafariProvider$search$2;->invoke(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "+",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/example/tubesafari/TubeSafariProvider$search$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/tubesafari/TubeSafariProvider$search$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/tubesafari/TubeSafariProvider$search$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 73
    iget v1, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->label:I

    packed-switch v1, :pswitch_data_4c

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_11
    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/example/tubesafari/TubeSafariProvider;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v2, v0

    move-object v0, p1

    goto :goto_3d

    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1b
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->L$0:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 74
    .local v1, "term":Ljava/lang/String;
    iget-object v2, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->this$0:Lcom/example/tubesafari/TubeSafariProvider;

    iget-object v3, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->this$0:Lcom/example/tubesafari/TubeSafariProvider;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput-object v2, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->L$0:Ljava/lang/Object;

    const/4 v5, 0x1

    iput v5, p0, Lcom/example/tubesafari/TubeSafariProvider$search$2;->label:I

    const-string v6, "best"

    # invokes: Lcom/example/tubesafari/TubeSafariProvider;->catalogue(Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static {v3, v1, v6, v5, v4}, Lcom/example/tubesafari/TubeSafariProvider;->access$catalogue(Lcom/example/tubesafari/TubeSafariProvider;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "term":Ljava/lang/String;
    if-ne v1, v0, :cond_3b

    .line 73
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 74
    :cond_3b
    move-object v0, p1

    move-object p1, v1

    .end local p1    # "$result":Ljava/lang/Object;
    .local v0, "$result":Ljava/lang/Object;
    :goto_3d
    check-cast p1, Lcom/example/tubesafari/TubeSafariParser$Page;

    invoke-virtual {p1}, Lcom/example/tubesafari/TubeSafariParser$Page;->getCards()Ljava/util/List;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/example/tubesafari/TubeSafariProvider;->access$searchResponses(Lcom/example/tubesafari/TubeSafariProvider;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_11
    .end packed-switch
.end method
