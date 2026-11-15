.class final Lcom/example/websites/WebVideoProvider$load$3;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "WebVideoProviders.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/websites/WebVideoProvider;->load$suspendImpl(Lcom/example/websites/WebVideoProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.example.websites.WebVideoProvider$load$3"
    f = "WebVideoProviders.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
    v = 0x1
.end annotation


# instance fields
.field final synthetic $clips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/example/websites/WebVideoParser$Clip;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $page:Lorg/jsoup/nodes/Document;

.field final synthetic $related:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;"
        }
    .end annotation
.end field

.field private synthetic L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;Lorg/jsoup/nodes/Document;Lkotlin/coroutines/Continuation;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;",
            "Ljava/util/List<",
            "Lcom/example/websites/WebVideoParser$Clip;",
            ">;",
            "Lorg/jsoup/nodes/Document;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/websites/WebVideoProvider$load$3;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/websites/WebVideoProvider$load$3;->$related:Ljava/util/List;

    iput-object p2, p0, Lcom/example/websites/WebVideoProvider$load$3;->$clips:Ljava/util/List;

    iput-object p3, p0, Lcom/example/websites/WebVideoProvider$load$3;->$page:Lorg/jsoup/nodes/Document;

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

    new-instance v0, Lcom/example/websites/WebVideoProvider$load$3;

    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$load$3;->$related:Ljava/util/List;

    iget-object v2, p0, Lcom/example/websites/WebVideoProvider$load$3;->$clips:Ljava/util/List;

    iget-object v3, p0, Lcom/example/websites/WebVideoProvider$load$3;->$page:Lorg/jsoup/nodes/Document;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/example/websites/WebVideoProvider$load$3;-><init>(Ljava/util/List;Ljava/util/List;Lorg/jsoup/nodes/Document;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/example/websites/WebVideoProvider$load$3;->L$0:Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/example/websites/WebVideoProvider$load$3;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/websites/WebVideoProvider$load$3;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/websites/WebVideoProvider$load$3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/websites/WebVideoProvider$load$3;->invoke(Lcom/lagradost/cloudstream3/MovieLoadResponse;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 130
    iget v0, p0, Lcom/example/websites/WebVideoProvider$load$3;->label:I

    packed-switch v0, :pswitch_data_62

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_10
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .local p1, "$result":Ljava/lang/Object;
    iget-object v0, p0, Lcom/example/websites/WebVideoProvider$load$3;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    .line 131
    .local v0, "$this$newMovieLoadResponse":Lcom/lagradost/cloudstream3/MovieLoadResponse;
    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$load$3;->$related:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setRecommendations(Ljava/util/List;)V

    .line 132
    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$load$3;->$clips:Ljava/util/List;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/websites/WebVideoParser$Clip;

    .end local v0    # "$this$newMovieLoadResponse":Lcom/lagradost/cloudstream3/MovieLoadResponse;
    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Lcom/example/websites/WebVideoParser$Clip;->getPoster()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_53

    :cond_2c
    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$load$3;->$page:Lorg/jsoup/nodes/Document;

    const-string v2, "video[poster]"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3e

    const-string v3, "poster"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3f

    :cond_3e
    move-object v1, v2

    :goto_3f
    if-nez v1, :cond_53

    .line 133
    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$load$3;->$page:Lorg/jsoup/nodes/Document;

    const-string v3, "meta[property=og:image]"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_52

    const-string v2, "content"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_53

    :cond_52
    move-object v1, v2

    .line 132
    :cond_53
    :goto_53
    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 134
    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$load$3;->$page:Lorg/jsoup/nodes/Document;

    invoke-static {v0, v1}, Lcom/videobundle/fixes/MetadataSupport;->enrichDocument(Ljava/lang/Object;Lorg/jsoup/nodes/Document;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
