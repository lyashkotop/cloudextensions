.class final Lcom/streambundleextra/ExtractorBridge$State;
.super Ljava/lang/Object;
.source "ExtractorBridge.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundleextra/ExtractorBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
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
.field final callback:Lkotlin/jvm/functions/Function1;

.field final completion:Lkotlin/coroutines/Continuation;

.field current:Ljava/lang/String;

.field found:Z

.field index:I

.field final links:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field produced:Z

.field final referer:Ljava/lang/String;

.field final site:Lcom/streambundleextra/VideoBundleSite;

.field stage:I

.field final subtitle:Lkotlin/jvm/functions/Function1;


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ZLkotlin/coroutines/Continuation;Lcom/streambundleextra/VideoBundleSite;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1;",
            "Lkotlin/jvm/functions/Function1;",
            "Z",
            "Lkotlin/coroutines/Continuation;",
            "Lcom/streambundleextra/VideoBundleSite;",
            ")V"
        }
    .end annotation

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->links:Ljava/util/List;

    iput-object p2, p0, Lcom/streambundleextra/ExtractorBridge$State;->referer:Ljava/lang/String;

    iput-object p3, p0, Lcom/streambundleextra/ExtractorBridge$State;->subtitle:Lkotlin/jvm/functions/Function1;

    iput-object p4, p0, Lcom/streambundleextra/ExtractorBridge$State;->callback:Lkotlin/jvm/functions/Function1;

    iput-boolean p5, p0, Lcom/streambundleextra/ExtractorBridge$State;->found:Z

    iput-object p6, p0, Lcom/streambundleextra/ExtractorBridge$State;->completion:Lkotlin/coroutines/Continuation;

    iput-object p7, p0, Lcom/streambundleextra/ExtractorBridge$State;->site:Lcom/streambundleextra/VideoBundleSite;

    return-void
.end method


# virtual methods
.method advance(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    .line 47
    nop

    :cond_1
    :goto_1
    iget v0, p0, Lcom/streambundleextra/ExtractorBridge$State;->stage:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_12

    instance-of v0, p1, Lcom/streambundlehtml/nodes/Document;

    if-eqz v0, :cond_10

    check-cast p1, Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {p0, p1}, Lcom/streambundleextra/ExtractorBridge$State;->emit(Lcom/streambundlehtml/nodes/Document;)V

    :cond_10
    iput v2, p0, Lcom/streambundleextra/ExtractorBridge$State;->stage:I

    .line 48
    :cond_12
    iget p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->stage:I

    const/4 v0, 0x0

    const/4 v3, 0x1

    if-ne p1, v3, :cond_38

    .line 49
    iput v2, p0, Lcom/streambundleextra/ExtractorBridge$State;->stage:I

    .line 50
    iget-boolean p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->produced:Z

    if-nez p1, :cond_38

    iget-object p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->site:Lcom/streambundleextra/VideoBundleSite;

    if-eqz p1, :cond_38

    .line 51
    iput v1, p0, Lcom/streambundleextra/ExtractorBridge$State;->stage:I

    :try_start_24
    iget-object p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->site:Lcom/streambundleextra/VideoBundleSite;

    iget-object v1, p0, Lcom/streambundleextra/ExtractorBridge$State;->current:Ljava/lang/String;

    # invokes: Lcom/streambundleextra/VideoBundleSite;->page(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static {p1, v1, p0}, Lcom/streambundleextra/VideoBundleSite;->access$page(Lcom/streambundleextra/VideoBundleSite;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1
    :try_end_2c
    .catch Ljava/util/concurrent/CancellationException; {:try_start_24 .. :try_end_2c} :catch_36
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_2c} :catch_2d

    goto :goto_2f

    :catch_2d
    move-exception p1

    move-object p1, v0

    .line 52
    :goto_2f
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-ne p1, v0, :cond_1

    return-object p1

    .line 51
    :catch_36
    move-exception p1

    throw p1

    .line 56
    :cond_38
    iget p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->index:I

    iget-object v1, p0, Lcom/streambundleextra/ExtractorBridge$State;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_49

    iget-boolean p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->found:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 57
    :cond_49
    iget-object p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->links:Ljava/util/List;

    iget v1, p0, Lcom/streambundleextra/ExtractorBridge$State;->index:I

    add-int/lit8 v4, v1, 0x1

    iput v4, p0, Lcom/streambundleextra/ExtractorBridge$State;->index:I

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->current:Ljava/lang/String;

    iput-boolean v2, p0, Lcom/streambundleextra/ExtractorBridge$State;->produced:Z

    iput v3, p0, Lcom/streambundleextra/ExtractorBridge$State;->stage:I

    .line 59
    :try_start_5d
    iget-object p1, p0, Lcom/streambundleextra/ExtractorBridge$State;->current:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundleextra/ExtractorBridge$State;->referer:Ljava/lang/String;

    iget-object v2, p0, Lcom/streambundleextra/ExtractorBridge$State;->subtitle:Lkotlin/jvm/functions/Function1;

    new-instance v3, Lcom/streambundleextra/ExtractorBridge$State$1;

    invoke-direct {v3, p0}, Lcom/streambundleextra/ExtractorBridge$State$1;-><init>(Lcom/streambundleextra/ExtractorBridge$State;)V

    invoke-static {p1, v1, v2, v3, p0}, Lcom/lagradost/cloudstream3/utils/ExtractorApiKt;->loadExtractor(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .line 62
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0
    :try_end_70
    .catch Ljava/util/concurrent/CancellationException; {:try_start_5d .. :try_end_70} :catch_77
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_70} :catch_74

    if-ne p1, v0, :cond_73

    return-object p1

    .line 63
    :cond_73
    goto :goto_1

    :catch_74
    move-exception p1

    move-object p1, v0

    goto :goto_1

    :catch_77
    move-exception p1

    throw p1
.end method

.method emit(Lcom/streambundlehtml/nodes/Document;)V
    .registers 15

    .line 37
    invoke-static {p1}, Lcom/streambundleextra/MediaFix;->media(Lcom/streambundlehtml/nodes/Document;)V

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 38
    const-string v1, "source[src], video[src], a[href]"

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_12
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_75

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 39
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v3

    const-string v4, "href"

    invoke-virtual {v2, v4}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2c

    const-string v4, "src"

    :cond_2c
    invoke-virtual {v2, v4}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 40
    invoke-static {v7}, Lcom/streambundleextra/MediaFix;->isDirect(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 41
    iget-object v2, p0, Lcom/streambundleextra/ExtractorBridge$State;->site:Lcom/streambundleextra/VideoBundleSite;

    invoke-virtual {v2}, Lcom/streambundleextra/VideoBundleSite;->getName()Ljava/lang/String;

    move-result-object v5

    .line 42
    iget-object v2, p0, Lcom/streambundleextra/ExtractorBridge$State;->callback:Lkotlin/jvm/functions/Function1;

    new-instance v4, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-static {v5, v7, p1}, Lcom/streambundleextra/MediaFix;->qualityName(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, p1}, Lcom/streambundleextra/MediaFix;->quality(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)I

    move-result v9

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v7, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v10, ".m3u8"

    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v11

    const/4 v12, 0x0

    invoke-direct/range {v4 .. v12}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/util/Map;Ljava/lang/String;)V

    invoke-interface {v2, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/streambundleextra/ExtractorBridge$State;->found:Z

    .line 43
    goto :goto_12

    .line 44
    :cond_75
    return-void
.end method

.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 29
    iget-object v0, p0, Lcom/streambundleextra/ExtractorBridge$State;->completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 32
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_3} :catch_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_4
    .catchall {:try_start_0 .. :try_end_3} :catchall_18

    goto :goto_6

    :catch_4
    move-exception p1

    const/4 p1, 0x0

    .line 33
    :goto_6
    :try_start_6
    invoke-virtual {p0, p1}, Lcom/streambundleextra/ExtractorBridge$State;->advance(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-eq p1, v0, :cond_15

    iget-object v0, p0, Lcom/streambundleextra/ExtractorBridge$State;->completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 34
    :cond_15
    goto :goto_22

    .line 32
    :catch_16
    move-exception p1

    throw p1
    :try_end_18
    .catchall {:try_start_6 .. :try_end_18} :catchall_18

    .line 34
    :catchall_18
    move-exception p1

    iget-object v0, p0, Lcom/streambundleextra/ExtractorBridge$State;->completion:Lkotlin/coroutines/Continuation;

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 35
    :goto_22
    return-void
.end method
