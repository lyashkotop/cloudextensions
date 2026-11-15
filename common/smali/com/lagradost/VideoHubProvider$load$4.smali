.class final Lcom/lagradost/VideoHubProvider$load$4;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "VideoHub.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/VideoHubProvider;->detailUnscreened(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nVideoHub.kt\nKotlin\n*S Kotlin\n*F\n+ 1 VideoHub.kt\ncom/lagradost/VideoHubProvider$load$4\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,247:1\n1739#2:248\n1814#2,3:249\n*S KotlinDebug\n*F\n+ 1 VideoHub.kt\ncom/lagradost/VideoHubProvider$load$4\n*L\n182#1:248\n182#1:249,3\n*E\n"
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
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.lagradost.VideoHubProvider$load$4"
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
.field final synthetic $info:Lkotlin/jvm/internal/Ref$ObjectRef;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/internal/Ref$ObjectRef<",
            "Lcom/lagradost/VideoDetails;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $location:Ljava/lang/String;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/lagradost/VideoHubProvider;


# direct methods
.method constructor <init>(Lkotlin/jvm/internal/Ref$ObjectRef;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/internal/Ref$ObjectRef<",
            "Lcom/lagradost/VideoDetails;",
            ">;",
            "Lcom/lagradost/VideoHubProvider;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/VideoHubProvider$load$4;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider$load$4;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput-object p2, p0, Lcom/lagradost/VideoHubProvider$load$4;->this$0:Lcom/lagradost/VideoHubProvider;

    iput-object p3, p0, Lcom/lagradost/VideoHubProvider$load$4;->$location:Ljava/lang/String;

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

    new-instance v0, Lcom/lagradost/VideoHubProvider$load$4;

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v2, p0, Lcom/lagradost/VideoHubProvider$load$4;->this$0:Lcom/lagradost/VideoHubProvider;

    iget-object v3, p0, Lcom/lagradost/VideoHubProvider$load$4;->$location:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/lagradost/VideoHubProvider$load$4;-><init>(Lkotlin/jvm/internal/Ref$ObjectRef;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/lagradost/VideoHubProvider$load$4;->L$0:Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/VideoHubProvider$load$4;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/lagradost/VideoHubProvider$load$4;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/lagradost/VideoHubProvider$load$4;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/VideoHubProvider$load$4;->invoke(Lcom/lagradost/cloudstream3/MovieLoadResponse;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "$result"    # Ljava/lang/Object;

    iget-object v0, p0, Lcom/lagradost/VideoHubProvider$load$4;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    .local v0, "$this$newMovieLoadResponse":Lcom/lagradost/cloudstream3/MovieLoadResponse;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 175
    iget v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->label:I

    if-nez v1, :cond_a4

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 176
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoDetails;

    invoke-virtual {v1}, Lcom/lagradost/VideoDetails;->getPoster()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 177
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoDetails;

    invoke-virtual {v1}, Lcom/lagradost/VideoDetails;->getPoster()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setBackgroundPosterUrl(Ljava/lang/String;)V

    .line 178
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->this$0:Lcom/lagradost/VideoHubProvider;

    iget-object v2, p0, Lcom/lagradost/VideoHubProvider$load$4;->$location:Ljava/lang/String;

    # invokes: Lcom/lagradost/VideoHubProvider;->posterHeaders(Ljava/lang/String;)Ljava/util/Map;
    invoke-static {v1, v2}, Lcom/lagradost/VideoHubProvider;->access$posterHeaders(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterHeaders(Ljava/util/Map;)V

    .line 179
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoDetails;

    invoke-virtual {v1}, Lcom/lagradost/VideoDetails;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPlot(Ljava/lang/String;)V

    .line 180
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoDetails;

    invoke-virtual {v1}, Lcom/lagradost/VideoDetails;->getTags()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setTags(Ljava/util/List;)V

    .line 181
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoDetails;

    invoke-virtual {v1}, Lcom/lagradost/VideoDetails;->getDurationMinutes()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setDuration(Ljava/lang/Integer;)V

    .line 182
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider$load$4;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoDetails;

    invoke-virtual {v1}, Lcom/lagradost/VideoDetails;->getRelated()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$map$iv":Ljava/lang/Iterable;
    iget-object v2, p0, Lcom/lagradost/VideoHubProvider$load$4;->this$0:Lcom/lagradost/VideoHubProvider;

    const/4 v3, 0x0

    .line 248
    .local v3, "$i$f$map":I
    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v1, v5}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v1

    .local v5, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 249
    .local v6, "$i$f$mapTo":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_7c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_92

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 250
    .local v8, "item$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Lcom/lagradost/VideoCard;

    .local v9, "it":Lcom/lagradost/VideoCard;
    const/4 v10, 0x0

    .line 182
    .local v10, "$i$a$-map-VideoHubProvider$load$4$1":I
    invoke-static {v2, v9}, Lcom/lagradost/VideoHubProvider;->access$toResult(Lcom/lagradost/VideoHubProvider;Lcom/lagradost/VideoCard;)Lcom/lagradost/cloudstream3/SearchResponse;

    move-result-object v9

    .line 250
    .end local v9    # "it":Lcom/lagradost/VideoCard;
    .end local v10    # "$i$a$-map-VideoHubProvider$load$4$1":I
    invoke-interface {v4, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_7c

    .line 251
    .end local v8    # "item$iv$iv":Ljava/lang/Object;
    :cond_92
    nop

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v5    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$mapTo":I
    move-object v2, v4

    check-cast v2, Ljava/util/List;

    .line 248
    nop

    .line 182
    .end local v1    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$map":I
    invoke-virtual {v0, v2}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setRecommendations(Ljava/util/List;)V

    .line 183
    invoke-static/range {v0 .. v0}, Lcom/videobundle/fixes/MetadataSupport;->enrich(Ljava/lang/Object;)V

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static/range {v1 .. v1}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 175
    :cond_a4
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
