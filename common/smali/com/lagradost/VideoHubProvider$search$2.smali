.class final Lcom/lagradost/VideoHubProvider$search$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "VideoHub.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/VideoHubProvider;->search(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Ljava/util/List<",
        "+",
        "Lcom/lagradost/cloudstream3/SearchResponse;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nVideoHub.kt\nKotlin\n*S Kotlin\n*F\n+ 1 VideoHub.kt\ncom/lagradost/VideoHubProvider$search$2\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,247:1\n1739#2:248\n1814#2,3:249\n1544#2:252\n1633#2,5:253\n1849#2,8:258\n2945#2,3:266\n1939#2,3:270\n1233#2:273\n1849#2,8:274\n1739#2:282\n1814#2,3:283\n1#3:269\n*S KotlinDebug\n*F\n+ 1 VideoHub.kt\ncom/lagradost/VideoHubProvider$search$2\n*L\n120#1:248\n120#1:249,3\n128#1:252\n128#1:253,5\n128#1:258,8\n130#1:266,3\n136#1:270,3\n137#1:273\n138#1:274,8\n138#1:282\n138#1:283,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lcom/lagradost/cloudstream3/SearchResponse;",
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
    c = "com.lagradost.VideoHubProvider$search$2"
    f = "VideoHub.kt"
    i = {
        0x0,
        0x0,
        0x0,
        0x1,
        0x1,
        0x1,
        0x1,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2
    }
    l = {
        0x77,
        0x7f,
        0x84
    }
    m = "invokeSuspend"
    n = {
        "$this$coroutineScope",
        "original",
        "missavCode",
        "$this$coroutineScope",
        "original",
        "missavCode",
        "variants",
        "$this$coroutineScope",
        "original",
        "missavCode",
        "variants",
        "attempts",
        "cards"
    }
    nl = {
        0x76,
        0x78,
        0x85
    }
    s = {
        "L$0",
        "L$1",
        "L$2",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5"
    }
    v = 0x2
.end annotation


# instance fields
.field final synthetic $query:Ljava/lang/String;

.field I$0:I

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field L$5:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/lagradost/VideoHubProvider;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/lagradost/VideoHubProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/VideoHubProvider$search$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider$search$2;->$query:Ljava/lang/String;

    iput-object p2, p0, Lcom/lagradost/VideoHubProvider$search$2;->this$0:Lcom/lagradost/VideoHubProvider;

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

    new-instance v0, Lcom/lagradost/VideoHubProvider$search$2;

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$search$2;->$query:Ljava/lang/String;

    iget-object v2, p0, Lcom/lagradost/VideoHubProvider$search$2;->this$0:Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1, v2, p2}, Lcom/lagradost/VideoHubProvider$search$2;-><init>(Ljava/lang/String;Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/lagradost/VideoHubProvider$search$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/VideoHubProvider$search$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Ljava/util/List<",
            "+",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/VideoHubProvider$search$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/lagradost/VideoHubProvider$search$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/lagradost/VideoHubProvider$search$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 34
    .param p1, "$result"    # Ljava/lang/Object;

    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$0:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lkotlinx/coroutines/CoroutineScope;

    .local v8, "$this$coroutineScope":Lkotlinx/coroutines/CoroutineScope;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 114
    iget v2, v1, Lcom/lagradost/VideoHubProvider$search$2;->label:I

    const/16 v9, 0xa

    const/4 v10, 0x3

    const/4 v11, 0x0

    const/4 v12, 0x2

    const/4 v13, 0x0

    const/4 v14, 0x1

    if-eqz v2, :cond_7f

    if-eq v2, v14, :cond_61

    if-eq v2, v12, :cond_4b

    if-ne v2, v10, :cond_43

    iget-object v0, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$5:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/util/List;

    .local v2, "cards":Ljava/util/List;
    iget-object v0, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$4:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/util/List;

    .local v3, "attempts":Ljava/util/List;
    iget-object v0, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$3:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/util/List;

    .local v4, "variants":Ljava/util/List;
    iget-object v0, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$2:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .local v5, "missavCode":Ljava/lang/String;
    iget-object v0, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$1:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    .local v6, "original":Ljava/lang/String;
    :try_start_35
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_38
    .catch Ljava/util/concurrent/CancellationException; {:try_start_35 .. :try_end_38} :catch_40
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_38} :catch_3c

    move-object/from16 v7, p1

    goto/16 :goto_2a3

    .line 134
    :catch_3c
    move-exception v0

    move v10, v13

    goto/16 :goto_2bf

    :catch_40
    move-exception v0

    goto/16 :goto_2bb

    .line 114
    .end local v2    # "cards":Ljava/util/List;
    .end local v3    # "attempts":Ljava/util/List;
    .end local v4    # "variants":Ljava/util/List;
    .end local v5    # "missavCode":Ljava/lang/String;
    .end local v6    # "original":Ljava/lang/String;
    :cond_43
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4b
    iget-object v2, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$3:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    .local v2, "variants":Ljava/util/List;
    iget-object v3, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$2:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .local v3, "missavCode":Ljava/lang/String;
    iget-object v4, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$1:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    .local v4, "original":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v5, v3

    move-object v6, v4

    move-object v4, v2

    move-object/from16 v2, p1

    goto/16 :goto_18e

    .end local v2    # "variants":Ljava/util/List;
    .end local v3    # "missavCode":Ljava/lang/String;
    .end local v4    # "original":Ljava/lang/String;
    :cond_61
    iget v2, v1, Lcom/lagradost/VideoHubProvider$search$2;->I$0:I

    iget-object v3, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$4:Ljava/lang/Object;

    check-cast v3, [Ljava/lang/String;

    iget-object v4, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$3:Ljava/lang/Object;

    check-cast v4, [Ljava/lang/String;

    iget-object v5, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$2:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    .restart local v5    # "missavCode":Ljava/lang/String;
    iget-object v6, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$1:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .restart local v6    # "original":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move v3, v2

    move-object/from16 v2, p1

    goto/16 :goto_ed

    .end local v5    # "missavCode":Ljava/lang/String;
    .end local v6    # "original":Ljava/lang/String;
    :cond_7f
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 115
    iget-object v2, v1, Lcom/lagradost/VideoHubProvider$search$2;->$query:Ljava/lang/String;

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 116
    .restart local v6    # "original":Ljava/lang/String;
    move-object v2, v6

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_a0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 117
    :cond_a0
    iget-object v2, v1, Lcom/lagradost/VideoHubProvider$search$2;->this$0:Lcom/lagradost/VideoHubProvider;

    # getter for: Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;
    invoke-static {v2}, Lcom/lagradost/VideoHubProvider;->access$getSite$p(Lcom/lagradost/VideoHubProvider;)Lcom/lagradost/CatalogSite;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_b4

    sget-object v2, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    invoke-virtual {v2, v6}, Lcom/lagradost/MissavSearch;->code(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_b5

    :cond_b4
    move-object v2, v11

    :goto_b5
    move-object v5, v2

    .line 118
    .restart local v5    # "missavCode":Ljava/lang/String;
    if-eqz v5, :cond_c2

    sget-object v2, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    invoke-virtual {v2, v6}, Lcom/lagradost/MissavSearch;->variants(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    move-object v15, v5

    move-object/from16 v16, v6

    goto :goto_fc

    .line 119
    :cond_c2
    new-array v3, v12, [Ljava/lang/String;

    aput-object v6, v3, v13

    iget-object v2, v1, Lcom/lagradost/VideoHubProvider$search$2;->this$0:Lcom/lagradost/VideoHubProvider;

    move-object v4, v1

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput-object v8, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$0:Ljava/lang/Object;

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$1:Ljava/lang/Object;

    iput-object v5, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$2:Ljava/lang/Object;

    iput-object v3, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$3:Ljava/lang/Object;

    iput-object v3, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$4:Ljava/lang/Object;

    iput v14, v1, Lcom/lagradost/VideoHubProvider$search$2;->I$0:I

    iput v14, v1, Lcom/lagradost/VideoHubProvider$search$2;->label:I

    # invokes: Lcom/lagradost/VideoHubProvider;->translated(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static {v2, v6, v4}, Lcom/lagradost/VideoHubProvider;->access$translated(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_e8

    .line 114
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 119
    :cond_e8
    move-object v4, v3

    move-object v7, v6

    move-object v6, v5

    move v3, v14

    move-object v5, v4

    .end local v5    # "missavCode":Ljava/lang/String;
    .local v6, "missavCode":Ljava/lang/String;
    .local v7, "original":Ljava/lang/String;
    :goto_ed
    aput-object v2, v4, v3

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->listOfNotNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    move-object v15, v6

    move-object/from16 v16, v7

    .line 118
    .end local v6    # "missavCode":Ljava/lang/String;
    .end local v7    # "original":Ljava/lang/String;
    .local v15, "missavCode":Ljava/lang/String;
    .local v16, "original":Ljava/lang/String;
    :goto_fc
    move-object/from16 v17, v2

    .line 127
    .local v17, "variants":Ljava/util/List;
    nop

    .line 120
    move-object/from16 v7, v17

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$map$iv":Ljava/lang/Iterable;
    iget-object v6, v1, Lcom/lagradost/VideoHubProvider$search$2;->this$0:Lcom/lagradost/VideoHubProvider;

    const/16 v18, 0x0

    .line 248
    .local v18, "$i$f$map":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v7, v9}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    .local v5, "destination$iv$iv":Ljava/util/Collection;
    move-object/from16 v19, v7

    .local v19, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/16 v20, 0x0

    .line 249
    .local v20, "$i$f$mapTo":I
    invoke-interface/range {v19 .. v19}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_11b
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15a

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    .line 250
    .local v22, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v4, v22

    check-cast v4, Ljava/lang/String;

    .local v4, "q":Ljava/lang/String;
    const/16 v23, 0x0

    .line 120
    .local v23, "$i$a$-map-VideoHubProvider$search$2$attempts$1":I
    const/4 v3, 0x0

    const/16 v24, 0x0

    new-instance v2, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;

    invoke-direct {v2, v6, v4, v11}, Lcom/lagradost/VideoHubProvider$search$2$attempts$1$1;-><init>(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    move-object/from16 v25, v2

    check-cast v25, Lkotlin/jvm/functions/Function2;

    const/16 v26, 0x3

    const/16 v27, 0x0

    move-object v2, v8

    move-object/from16 v28, v4

    .end local v4    # "q":Ljava/lang/String;
    .local v28, "q":Ljava/lang/String;
    move-object/from16 v4, v24

    move-object v14, v5

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .local v14, "destination$iv$iv":Ljava/util/Collection;
    move-object/from16 v5, v25

    move-object/from16 v25, v6

    move/from16 v6, v26

    move-object/from16 v26, v7

    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .local v26, "$this$map$iv":Ljava/lang/Iterable;
    move-object/from16 v7, v27

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->async$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Deferred;

    move-result-object v2

    .line 127
    nop

    .line 250
    .end local v23    # "$i$a$-map-VideoHubProvider$search$2$attempts$1":I
    .end local v28    # "q":Ljava/lang/String;
    invoke-interface {v14, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object v5, v14

    move-object/from16 v6, v25

    move-object/from16 v7, v26

    const/4 v14, 0x1

    goto :goto_11b

    .line 251
    .end local v14    # "destination$iv$iv":Ljava/util/Collection;
    .end local v22    # "item$iv$iv":Ljava/lang/Object;
    .end local v26    # "$this$map$iv":Ljava/lang/Iterable;
    .restart local v5    # "destination$iv$iv":Ljava/util/Collection;
    .restart local v7    # "$this$map$iv":Ljava/lang/Iterable;
    :cond_15a
    move-object v14, v5

    move-object/from16 v26, v7

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v19    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v20    # "$i$f$mapTo":I
    .restart local v26    # "$this$map$iv":Ljava/lang/Iterable;
    move-object v2, v14

    check-cast v2, Ljava/util/List;

    .line 248
    nop

    .end local v18    # "$i$f$map":I
    .end local v26    # "$this$map$iv":Ljava/lang/Iterable;
    check-cast v2, Ljava/util/Collection;

    move-object v3, v1

    check-cast v3, Lkotlin/coroutines/Continuation;

    .line 127
    invoke-static {v8}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$0:Ljava/lang/Object;

    invoke-static/range {v16 .. v16}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$1:Ljava/lang/Object;

    iput-object v15, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$2:Ljava/lang/Object;

    invoke-static/range {v17 .. v17}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$3:Ljava/lang/Object;

    iput-object v11, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$4:Ljava/lang/Object;

    iput v12, v1, Lcom/lagradost/VideoHubProvider$search$2;->label:I

    invoke-static {v2, v3}, Lkotlinx/coroutines/AwaitKt;->awaitAll(Ljava/util/Collection;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_189

    .line 114
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 127
    :cond_189
    move-object v5, v15

    move-object/from16 v6, v16

    move-object/from16 v4, v17

    .line 114
    .end local v15    # "missavCode":Ljava/lang/String;
    .end local v16    # "original":Ljava/lang/String;
    .end local v17    # "variants":Ljava/util/List;
    .local v4, "variants":Ljava/util/List;
    .local v5, "missavCode":Ljava/lang/String;
    .local v6, "original":Ljava/lang/String;
    :goto_18e
    check-cast v2, Ljava/util/List;

    .line 120
    move-object v3, v2

    .line 128
    .local v3, "attempts":Ljava/util/List;
    move-object v2, v3

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$flatMap$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 252
    .local v7, "$i$f$flatMap":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    check-cast v11, Ljava/util/Collection;

    .local v11, "destination$iv$iv":Ljava/util/Collection;
    move-object v12, v2

    .local v12, "$this$flatMapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v14, 0x0

    .line 253
    .local v14, "$i$f$flatMapTo":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_1a2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_1cf

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    .line 254
    .local v16, "element$iv$iv":Ljava/lang/Object;
    move-object/from16 v17, v16

    check-cast v17, Lkotlin/Result;

    invoke-virtual/range {v17 .. v17}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object v17

    .local v17, "it":Ljava/lang/Object;
    const/16 v18, 0x0

    .line 128
    .local v18, "$i$a$-flatMap-VideoHubProvider$search$2$cards$1":I
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v19

    invoke-static/range {v17 .. v17}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_1c1

    goto :goto_1c3

    :cond_1c1
    move-object/from16 v19, v17

    :goto_1c3
    check-cast v19, Ljava/lang/Iterable;

    .line 254
    .end local v17    # "it":Ljava/lang/Object;
    .end local v18    # "$i$a$-flatMap-VideoHubProvider$search$2$cards$1":I
    move-object/from16 v17, v19

    .line 255
    .local v17, "list$iv$iv":Ljava/lang/Iterable;
    move-object/from16 v9, v17

    .end local v17    # "list$iv$iv":Ljava/lang/Iterable;
    .local v9, "list$iv$iv":Ljava/lang/Iterable;
    invoke-static {v11, v9}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    const/16 v9, 0xa

    goto :goto_1a2

    .line 257
    .end local v9    # "list$iv$iv":Ljava/lang/Iterable;
    .end local v16    # "element$iv$iv":Ljava/lang/Object;
    :cond_1cf
    nop

    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v12    # "$this$flatMapTo$iv$iv":Ljava/lang/Iterable;
    .end local v14    # "$i$f$flatMapTo":I
    move-object v9, v11

    check-cast v9, Ljava/util/List;

    .line 252
    nop

    .end local v2    # "$this$flatMap$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$flatMap":I
    check-cast v9, Ljava/lang/Iterable;

    .line 128
    move-object v2, v9

    .local v2, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 258
    .local v7, "$i$f$distinctBy":I
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 259
    .local v9, "set$iv":Ljava/util/HashSet;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 260
    .local v11, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_1e6
    :goto_1e6
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_204

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .line 261
    .local v14, "e$iv":Ljava/lang/Object;
    move-object v15, v14

    check-cast v15, Lcom/lagradost/VideoCard;

    .local v15, "it":Lcom/lagradost/VideoCard;
    const/16 v16, 0x0

    .line 128
    .local v16, "$i$a$-distinctBy-VideoHubProvider$search$2$cards$2":I
    invoke-virtual {v15}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v15

    .line 261
    .end local v15    # "it":Lcom/lagradost/VideoCard;
    .end local v16    # "$i$a$-distinctBy-VideoHubProvider$search$2$cards$2":I
    nop

    .line 262
    .local v15, "key$iv":Ljava/lang/Object;
    invoke-virtual {v9, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_1e6

    .line 263
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1e6

    .line 265
    .end local v14    # "e$iv":Ljava/lang/Object;
    .end local v15    # "key$iv":Ljava/lang/Object;
    :cond_204
    move-object v2, v11

    check-cast v2, Ljava/util/List;

    .end local v2    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$distinctBy":I
    .end local v9    # "set$iv":Ljava/util/HashSet;
    .end local v11    # "list$iv":Ljava/util/ArrayList;
    check-cast v2, Ljava/util/Collection;

    .line 128
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v2

    .line 130
    .local v2, "cards":Ljava/util/List;
    if-eqz v5, :cond_2be

    move-object v7, v2

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$none$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 266
    .local v9, "$i$f$none":I
    instance-of v11, v7, Ljava/util/Collection;

    if-eqz v11, :cond_222

    move-object v11, v7

    check-cast v11, Ljava/util/Collection;

    invoke-interface {v11}, Ljava/util/Collection;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_222

    const/4 v7, 0x1

    goto :goto_241

    .line 267
    :cond_222
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_226
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_240

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .local v12, "element$iv":Ljava/lang/Object;
    move-object v14, v12

    check-cast v14, Lcom/lagradost/VideoCard;

    .local v14, "it":Lcom/lagradost/VideoCard;
    const/4 v15, 0x0

    .line 130
    .local v15, "$i$a$-none-VideoHubProvider$search$2$1":I
    sget-object v13, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    invoke-virtual {v13, v14, v5}, Lcom/lagradost/MissavSearch;->matches(Lcom/lagradost/VideoCard;Ljava/lang/String;)Z

    move-result v13

    .line 267
    .end local v14    # "it":Lcom/lagradost/VideoCard;
    .end local v15    # "$i$a$-none-VideoHubProvider$search$2$1":I
    if-eqz v13, :cond_23e

    const/4 v7, 0x0

    goto :goto_241

    :cond_23e
    const/4 v13, 0x0

    goto :goto_226

    .line 268
    .end local v12    # "element$iv":Ljava/lang/Object;
    :cond_240
    const/4 v7, 0x1

    .line 130
    .end local v7    # "$this$none$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$none":I
    :goto_241
    if-eqz v7, :cond_2bc

    .line 131
    nop

    .line 132
    :try_start_244
    iget-object v7, v1, Lcom/lagradost/VideoHubProvider$search$2;->this$0:Lcom/lagradost/VideoHubProvider;

    iget-object v9, v1, Lcom/lagradost/VideoHubProvider$search$2;->this$0:Lcom/lagradost/VideoHubProvider;

    invoke-virtual {v9}, Lcom/lagradost/VideoHubProvider;->getMainUrl()Ljava/lang/String;

    move-result-object v9

    sget-object v11, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v12, "ROOT"

    invoke-static {v11, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v5, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "toLowerCase(...)"

    invoke-static {v11, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "/en/"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    const/16 v27, 0x0

    const/16 v28, 0x0

    move-object/from16 v29, v1

    check-cast v29, Lkotlin/coroutines/Continuation;

    const/16 v30, 0x6

    const/16 v31, 0x0

    invoke-static {v8}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$0:Ljava/lang/Object;

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$1:Ljava/lang/Object;

    iput-object v5, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$2:Ljava/lang/Object;

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$3:Ljava/lang/Object;

    iput-object v3, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$4:Ljava/lang/Object;

    iput-object v2, v1, Lcom/lagradost/VideoHubProvider$search$2;->L$5:Ljava/lang/Object;

    iput v10, v1, Lcom/lagradost/VideoHubProvider$search$2;->label:I

    move-object/from16 v25, v7

    invoke-static/range {v25 .. v31}, Lcom/lagradost/VideoHubProvider;->fetch$default(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v0, :cond_2a3

    .line 114
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_2a3
    :goto_2a3
    check-cast v7, Lorg/jsoup/nodes/Document;

    move-object v0, v7

    .line 133
    .local v0, "direct":Lorg/jsoup/nodes/Document;
    sget-object v7, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    invoke-virtual {v7, v0, v5}, Lcom/lagradost/MissavSearch;->detail(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Lcom/lagradost/VideoCard;

    move-result-object v7
    :try_end_2ac
    .catch Ljava/util/concurrent/CancellationException; {:try_start_244 .. :try_end_2ac} :catch_40
    .catch Ljava/lang/Exception; {:try_start_244 .. :try_end_2ac} :catch_2b8

    if-eqz v7, :cond_2b6

    .line 269
    .local v7, "it":Lcom/lagradost/VideoCard;
    const/4 v9, 0x0

    .line 133
    .local v9, "$i$a$-let-VideoHubProvider$search$2$2":I
    const/4 v10, 0x0

    :try_start_2b0
    invoke-interface {v2, v10, v7}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_2b3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2b0 .. :try_end_2b3} :catch_40
    .catch Ljava/lang/Exception; {:try_start_2b0 .. :try_end_2b3} :catch_2b4

    .end local v7    # "it":Lcom/lagradost/VideoCard;
    .end local v9    # "$i$a$-let-VideoHubProvider$search$2$2":I
    goto :goto_2bf

    .line 134
    .end local v0    # "direct":Lorg/jsoup/nodes/Document;
    :catch_2b4
    move-exception v0

    goto :goto_2bf

    .line 133
    .restart local v0    # "direct":Lorg/jsoup/nodes/Document;
    :cond_2b6
    const/4 v10, 0x0

    .end local v0    # "direct":Lorg/jsoup/nodes/Document;
    goto :goto_2bf

    .line 134
    :catch_2b8
    move-exception v0

    const/4 v10, 0x0

    goto :goto_2bf

    .local v0, "e":Ljava/util/concurrent/CancellationException;
    :goto_2bb
    throw v0

    .line 130
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    :cond_2bc
    const/4 v10, 0x0

    goto :goto_2bf

    :cond_2be
    move v10, v13

    .line 136
    :goto_2bf
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_313

    move-object v0, v3

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$all$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 270
    .local v7, "$i$f$all":I
    instance-of v9, v0, Ljava/util/Collection;

    if-eqz v9, :cond_2d8

    move-object v9, v0

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_2d8

    const/4 v13, 0x1

    goto :goto_2f7

    .line 271
    :cond_2d8
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2dc
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2f6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .local v11, "element$iv":Ljava/lang/Object;
    move-object v12, v11

    check-cast v12, Lkotlin/Result;

    invoke-virtual {v12}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object v12

    .local v12, "it":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 136
    .local v13, "$i$a$-all-VideoHubProvider$search$2$4":I
    invoke-static {v12}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v12

    .line 271
    .end local v12    # "it":Ljava/lang/Object;
    .end local v13    # "$i$a$-all-VideoHubProvider$search$2$4":I
    if-nez v12, :cond_2dc

    move v13, v10

    goto :goto_2f7

    .line 272
    .end local v11    # "element$iv":Ljava/lang/Object;
    :cond_2f6
    const/4 v13, 0x1

    .line 136
    .end local v0    # "$this$all$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$all":I
    :goto_2f7
    if-eqz v13, :cond_313

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/Result;

    invoke-virtual {v0}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_312

    new-instance v0, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    const-string v7, "\u041f\u043e\u0438\u0441\u043a \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d"

    invoke-direct {v0, v7}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Throwable;

    :cond_312
    throw v0

    .line 137
    :cond_313
    if-nez v5, :cond_317

    move-object v9, v2

    goto :goto_326

    :cond_317
    move-object v0, v2

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 273
    .local v7, "$i$f$sortedByDescending":I
    new-instance v9, Lcom/lagradost/VideoHubProvider$search$2$invokeSuspend$$inlined$sortedByDescending$1;

    invoke-direct {v9, v5}, Lcom/lagradost/VideoHubProvider$search$2$invokeSuspend$$inlined$sortedByDescending$1;-><init>(Ljava/lang/String;)V

    check-cast v9, Ljava/util/Comparator;

    invoke-static {v0, v9}, Lkotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v9

    .line 137
    .end local v0    # "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$sortedByDescending":I
    :goto_326
    move-object v0, v9

    .line 138
    .local v0, "sorted":Ljava/util/List;
    move-object v7, v0

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 274
    .local v9, "$i$f$distinctBy":I
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    .line 275
    .local v10, "set$iv":Ljava/util/HashSet;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 276
    .local v11, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_339
    :goto_339
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_356

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .line 277
    .local v13, "e$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Lcom/lagradost/VideoCard;

    .restart local v14    # "it":Lcom/lagradost/VideoCard;
    const/4 v15, 0x0

    .line 138
    .local v15, "$i$a$-distinctBy-VideoHubProvider$search$2$5":I
    invoke-virtual {v14}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v14

    .line 277
    .end local v14    # "it":Lcom/lagradost/VideoCard;
    .end local v15    # "$i$a$-distinctBy-VideoHubProvider$search$2$5":I
    nop

    .line 278
    .local v14, "key$iv":Ljava/lang/Object;
    invoke-virtual {v10, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_339

    .line 279
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_339

    .line 281
    .end local v13    # "e$iv":Ljava/lang/Object;
    .end local v14    # "key$iv":Ljava/lang/Object;
    :cond_356
    move-object v7, v11

    check-cast v7, Ljava/util/List;

    .end local v7    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$distinctBy":I
    .end local v10    # "set$iv":Ljava/util/HashSet;
    .end local v11    # "list$iv":Ljava/util/ArrayList;
    check-cast v7, Ljava/lang/Iterable;

    iget-object v9, v1, Lcom/lagradost/VideoHubProvider$search$2;->this$0:Lcom/lagradost/VideoHubProvider;

    .line 138
    nop

    .local v7, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 282
    .local v10, "$i$f$map":I
    new-instance v11, Ljava/util/ArrayList;

    const/16 v12, 0xa

    invoke-static {v7, v12}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v11, Ljava/util/Collection;

    .local v11, "destination$iv$iv":Ljava/util/Collection;
    move-object v12, v7

    .local v12, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 283
    .local v13, "$i$f$mapTo":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_372
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_38d

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 284
    .local v15, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v0

    .end local v0    # "sorted":Ljava/util/List;
    .local v16, "sorted":Ljava/util/List;
    move-object v0, v15

    check-cast v0, Lcom/lagradost/VideoCard;

    .local v0, "it":Lcom/lagradost/VideoCard;
    const/16 v17, 0x0

    .line 138
    .local v17, "$i$a$-map-VideoHubProvider$search$2$6":I
    invoke-static {v9, v0}, Lcom/lagradost/VideoHubProvider;->access$toResult(Lcom/lagradost/VideoHubProvider;Lcom/lagradost/VideoCard;)Lcom/lagradost/cloudstream3/SearchResponse;

    move-result-object v0

    .line 284
    .end local v0    # "it":Lcom/lagradost/VideoCard;
    .end local v17    # "$i$a$-map-VideoHubProvider$search$2$6":I
    invoke-interface {v11, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v16

    goto :goto_372

    .line 285
    .end local v15    # "item$iv$iv":Ljava/lang/Object;
    .end local v16    # "sorted":Ljava/util/List;
    .local v0, "sorted":Ljava/util/List;
    :cond_38d
    move-object/from16 v16, v0

    .end local v0    # "sorted":Ljava/util/List;
    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v12    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v13    # "$i$f$mapTo":I
    .restart local v16    # "sorted":Ljava/util/List;
    move-object v0, v11

    check-cast v0, Ljava/util/List;

    .line 282
    nop

    .line 138
    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$map":I
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
