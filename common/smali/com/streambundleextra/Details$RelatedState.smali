.class final Lcom/streambundleextra/Details$RelatedState;
.super Ljava/lang/Object;
.source "Details.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundleextra/Details;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RelatedState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/coroutines/Continuation<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field awaiting:I

.field final end:Lkotlin/coroutines/Continuation;

.field final queries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field queryIndex:I

.field final related:Ljava/lang/String;

.field final response:Lcom/lagradost/cloudstream3/MovieLoadResponse;

.field final site:Lcom/streambundleextra/VideoBundleSite;

.field triedRelated:Z


# direct methods
.method constructor <init>(Lcom/streambundleextra/VideoBundleSite;Lcom/lagradost/cloudstream3/MovieLoadResponse;Ljava/lang/String;Ljava/util/List;Lkotlin/coroutines/Continuation;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundleextra/VideoBundleSite;",
            "Lcom/lagradost/cloudstream3/MovieLoadResponse;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/Continuation;",
            ")V"
        }
    .end annotation

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    const/4 v0, 0x0

    iput v0, p0, Lcom/streambundleextra/Details$RelatedState;->queryIndex:I

    iput v0, p0, Lcom/streambundleextra/Details$RelatedState;->awaiting:I

    iput-boolean v0, p0, Lcom/streambundleextra/Details$RelatedState;->triedRelated:Z

    .line 153
    iput-object p1, p0, Lcom/streambundleextra/Details$RelatedState;->site:Lcom/streambundleextra/VideoBundleSite;

    iput-object p2, p0, Lcom/streambundleextra/Details$RelatedState;->response:Lcom/lagradost/cloudstream3/MovieLoadResponse;

    iput-object p3, p0, Lcom/streambundleextra/Details$RelatedState;->related:Ljava/lang/String;

    iput-object p4, p0, Lcom/streambundleextra/Details$RelatedState;->queries:Ljava/util/List;

    iput-object p5, p0, Lcom/streambundleextra/Details$RelatedState;->end:Lkotlin/coroutines/Continuation;

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 154
    iget-object v0, p0, Lcom/streambundleextra/Details$RelatedState;->end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 157
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_3} :catch_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_4
    .catchall {:try_start_0 .. :try_end_3} :catchall_19

    goto :goto_6

    :catch_4
    move-exception p1

    const/4 p1, 0x0

    .line 158
    :goto_6
    const/4 v0, 0x1

    :try_start_7
    invoke-virtual {p0, p1, v0}, Lcom/streambundleextra/Details$RelatedState;->step(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-eq p1, v0, :cond_16

    iget-object v0, p0, Lcom/streambundleextra/Details$RelatedState;->end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 159
    :cond_16
    goto :goto_23

    .line 157
    :catch_17
    move-exception p1

    throw p1
    :try_end_19
    .catchall {:try_start_7 .. :try_end_19} :catchall_19

    .line 159
    :catchall_19
    move-exception p1

    iget-object v0, p0, Lcom/streambundleextra/Details$RelatedState;->end:Lkotlin/coroutines/Continuation;

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 160
    :goto_23
    return-void
.end method

.method step(Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 8

    .line 163
    nop

    :goto_1
    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eqz p2, :cond_63

    if-eqz p1, :cond_63

    .line 164
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 165
    iget v2, p0, Lcom/streambundleextra/Details$RelatedState;->awaiting:I

    if-ne v2, v1, :cond_23

    instance-of v2, p1, Lcom/streambundlehtml/nodes/Document;

    if-eqz v2, :cond_23

    iget-object p2, p0, Lcom/streambundleextra/Details$RelatedState;->site:Lcom/streambundleextra/VideoBundleSite;

    move-object v2, p1

    check-cast v2, Lcom/streambundlehtml/nodes/Document;

    iget-object v3, p0, Lcom/streambundleextra/Details$RelatedState;->response:Lcom/lagradost/cloudstream3/MovieLoadResponse;

    invoke-virtual {v3}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getUrl()Ljava/lang/String;

    move-result-object v3

    # invokes: Lcom/streambundleextra/Details;->cards(Lcom/streambundleextra/VideoBundleSite;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/util/List;
    invoke-static {p2, v2, v3}, Lcom/streambundleextra/Details;->access$000(Lcom/streambundleextra/VideoBundleSite;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/util/List;

    move-result-object p2

    .line 166
    :cond_23
    iget v2, p0, Lcom/streambundleextra/Details$RelatedState;->awaiting:I

    if-ne v2, v0, :cond_55

    instance-of v2, p1, Ljava/util/List;

    if-eqz v2, :cond_55

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_31
    :goto_31
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_55

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Lcom/lagradost/cloudstream3/SearchResponse;

    if-eqz v3, :cond_31

    check-cast v2, Lcom/lagradost/cloudstream3/SearchResponse;

    invoke-interface {v2}, Lcom/lagradost/cloudstream3/SearchResponse;->getUrl()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/streambundleextra/Details$RelatedState;->response:Lcom/lagradost/cloudstream3/MovieLoadResponse;

    invoke-virtual {v4}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getUrl()Ljava/lang/String;

    move-result-object v4

    # invokes: Lcom/streambundleextra/Details;->samePage(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v3, v4}, Lcom/streambundleextra/Details;->access$100(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_31

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 167
    :cond_55
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_63

    iget-object p1, p0, Lcom/streambundleextra/Details$RelatedState;->response:Lcom/lagradost/cloudstream3/MovieLoadResponse;

    invoke-virtual {p1, p2}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setRecommendations(Ljava/util/List;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 169
    :cond_63
    nop

    .line 171
    :try_start_64
    iget-boolean p1, p0, Lcom/streambundleextra/Details$RelatedState;->triedRelated:Z

    if-nez p1, :cond_7d

    iget-object p1, p0, Lcom/streambundleextra/Details$RelatedState;->related:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7d

    iput-boolean v1, p0, Lcom/streambundleextra/Details$RelatedState;->triedRelated:Z

    iput v1, p0, Lcom/streambundleextra/Details$RelatedState;->awaiting:I

    iget-object p1, p0, Lcom/streambundleextra/Details$RelatedState;->site:Lcom/streambundleextra/VideoBundleSite;

    iget-object p2, p0, Lcom/streambundleextra/Details$RelatedState;->related:Ljava/lang/String;

    # invokes: Lcom/streambundleextra/VideoBundleSite;->page(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static {p1, p2, p0}, Lcom/streambundleextra/VideoBundleSite;->access$page(Lcom/streambundleextra/VideoBundleSite;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_9d

    .line 172
    :cond_7d
    iget p1, p0, Lcom/streambundleextra/Details$RelatedState;->queryIndex:I

    iget-object p2, p0, Lcom/streambundleextra/Details$RelatedState;->queries:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-ge p1, p2, :cond_a5

    iput v0, p0, Lcom/streambundleextra/Details$RelatedState;->awaiting:I

    iget-object p1, p0, Lcom/streambundleextra/Details$RelatedState;->site:Lcom/streambundleextra/VideoBundleSite;

    iget-object p2, p0, Lcom/streambundleextra/Details$RelatedState;->queries:Ljava/util/List;

    iget v0, p0, Lcom/streambundleextra/Details$RelatedState;->queryIndex:I

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/streambundleextra/Details$RelatedState;->queryIndex:I

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p1, p2, p0}, Lcom/streambundle/v38/BundleSearch;->run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .line 174
    :goto_9d
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p2

    if-ne p1, p2, :cond_a4

    return-object p1

    .line 175
    :cond_a4
    goto :goto_aa

    .line 173
    :cond_a5
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_a7
    .catch Ljava/util/concurrent/CancellationException; {:try_start_64 .. :try_end_a7} :catch_ad
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_a7} :catch_a8

    return-object p1

    .line 175
    :catch_a8
    move-exception p1

    const/4 p1, 0x0

    :goto_aa
    const/4 p2, 0x1

    goto/16 :goto_1

    :catch_ad
    move-exception p1

    throw p1
.end method
