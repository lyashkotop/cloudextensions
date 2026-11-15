.class final Lcom/streambundleextra/LinkResolver$State;
.super Ljava/lang/Object;
.source "LinkResolver.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundleextra/LinkResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
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

.field final data:Ljava/lang/String;

.field doc:Lcom/streambundlehtml/nodes/Document;

.field final end:Lkotlin/coroutines/Continuation;

.field extracted:Z

.field found:Z

.field index:I

.field final site:Lcom/streambundleextra/VideoBundleSite;

.field stage:I

.field final subtitle:Lkotlin/jvm/functions/Function1;

.field final urls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/streambundleextra/VideoBundleSite;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V
    .registers 7

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->urls:Ljava/util/List;

    .line 13
    iput-object p1, p0, Lcom/streambundleextra/LinkResolver$State;->site:Lcom/streambundleextra/VideoBundleSite;

    iput-object p2, p0, Lcom/streambundleextra/LinkResolver$State;->data:Ljava/lang/String;

    iput-object p3, p0, Lcom/streambundleextra/LinkResolver$State;->subtitle:Lkotlin/jvm/functions/Function1;

    iput-object p4, p0, Lcom/streambundleextra/LinkResolver$State;->callback:Lkotlin/jvm/functions/Function1;

    iput-object p5, p0, Lcom/streambundleextra/LinkResolver$State;->end:Lkotlin/coroutines/Continuation;

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 14
    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method process(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    .line 18
    iget v0, p0, Lcom/streambundleextra/LinkResolver$State;->stage:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v2, :cond_55

    check-cast p1, Lcom/streambundlehtml/nodes/Document;

    iput-object p1, p0, Lcom/streambundleextra/LinkResolver$State;->doc:Lcom/streambundlehtml/nodes/Document;

    iget-object p1, p0, Lcom/streambundleextra/LinkResolver$State;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-static {p1}, Lcom/streambundleextra/MediaFix;->media(Lcom/streambundlehtml/nodes/Document;)V

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->doc:Lcom/streambundlehtml/nodes/Document;

    const-string v3, "source[src], video[src], a[href]"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_20
    :goto_20
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    iget-object v4, p0, Lcom/streambundleextra/LinkResolver$State;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v4

    const-string v5, "href"

    invoke-virtual {v3, v5}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3c

    const-string v5, "src"

    :cond_3c
    invoke-virtual {v3, v5}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundleextra/MediaFix;->isDirect(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_20

    invoke-virtual {p1, v3}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_20

    :cond_4e
    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->urls:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput v1, p0, Lcom/streambundleextra/LinkResolver$State;->stage:I

    .line 19
    :cond_55
    iget p1, p0, Lcom/streambundleextra/LinkResolver$State;->stage:I

    const/4 v0, 0x3

    if-ne p1, v0, :cond_5c

    iput v1, p0, Lcom/streambundleextra/LinkResolver$State;->stage:I

    .line 20
    :cond_5c
    iget p1, p0, Lcom/streambundleextra/LinkResolver$State;->index:I

    iget-object v1, p0, Lcom/streambundleextra/LinkResolver$State;->urls:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_93

    .line 21
    iget-boolean p1, p0, Lcom/streambundleextra/LinkResolver$State;->extracted:Z

    if-eqz p1, :cond_71

    iget-boolean p1, p0, Lcom/streambundleextra/LinkResolver$State;->found:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 22
    :cond_71
    iput-boolean v2, p0, Lcom/streambundleextra/LinkResolver$State;->extracted:Z

    iput v0, p0, Lcom/streambundleextra/LinkResolver$State;->stage:I

    .line 23
    new-instance v3, Lcom/streambundleextra/LinkResolver$State$1;

    invoke-direct {v3, p0}, Lcom/streambundleextra/LinkResolver$State$1;-><init>(Lcom/streambundleextra/LinkResolver$State;)V

    .line 24
    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->doc:Lcom/streambundlehtml/nodes/Document;

    iget-object v1, p0, Lcom/streambundleextra/LinkResolver$State;->data:Ljava/lang/String;

    iget-object v2, p0, Lcom/streambundleextra/LinkResolver$State;->subtitle:Lkotlin/jvm/functions/Function1;

    const/4 v4, 0x0

    iget-object v6, p0, Lcom/streambundleextra/LinkResolver$State;->site:Lcom/streambundleextra/VideoBundleSite;

    move-object v5, p0

    invoke-static/range {v0 .. v6}, Lcom/streambundleextra/ExtractorBridge;->finish(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ZLkotlin/coroutines/Continuation;Lcom/streambundleextra/VideoBundleSite;)Ljava/lang/Object;

    move-result-object p1

    .line 25
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-eq p1, v0, :cond_92

    invoke-virtual {p0, p1}, Lcom/streambundleextra/LinkResolver$State;->process(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :cond_92
    return-object p1

    .line 27
    :cond_93
    iget-object p1, p0, Lcom/streambundleextra/LinkResolver$State;->urls:Ljava/util/List;

    iget v0, p0, Lcom/streambundleextra/LinkResolver$State;->index:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/streambundleextra/LinkResolver$State;->index:I

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->data:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundleextra/LinkResolver$State;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-static {v0, v1}, Lcom/streambundleextra/MediaFix;->playbackReferer(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;

    move-result-object v0

    .line 29
    :try_start_a9
    const-string v1, "com.lagradost.cloudstream3.MainActivityKt"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getApp"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "getBaseClient"

    new-array v5, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/OkHttpClient;

    invoke-static {v1, p1}, Lcom/streambundleextra/PunishSupport;->client(Lokhttp3/OkHttpClient;Ljava/lang/String;)Lokhttp3/OkHttpClient;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/streambundleextra/HuyambaSupport;->client(Lokhttp3/OkHttpClient;Ljava/lang/String;)Lokhttp3/OkHttpClient;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/streambundleextra/PervertiumSupport;->client(Lokhttp3/OkHttpClient;Ljava/lang/String;)Lokhttp3/OkHttpClient;

    move-result-object v1

    .line 31
    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v2, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    const-string v3, "Range"

    const-string v4, "bytes=0-511"

    invoke-virtual {v2, v3, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-static {v0}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_fc
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_118

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v5, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_fc

    .line 32
    :cond_118
    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    new-instance v2, Lcom/streambundleextra/LinkResolver$State$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/streambundleextra/LinkResolver$State$2;-><init>(Lcom/streambundleextra/LinkResolver$State;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 45
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1
    :try_end_12c
    .catch Ljava/lang/Exception; {:try_start_a9 .. :try_end_12c} :catch_12d

    return-object p1

    .line 46
    :catch_12d
    move-exception v0

    move-object p1, v0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0432\u0435\u0440\u0438\u0442\u044c \u0441\u0441\u044b\u043b\u043a\u0443 \u043d\u0430 \u0432\u0438\u0434\u0435\u043e"

    invoke-direct {v0, v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 16
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lcom/streambundleextra/LinkResolver$State;->process(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-eq p1, v0, :cond_1d

    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V
    :try_end_12
    .catchall {:try_start_0 .. :try_end_12} :catchall_13

    goto :goto_1d

    :catchall_13
    move-exception p1

    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->end:Lkotlin/coroutines/Continuation;

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    :cond_1d
    :goto_1d
    return-void
.end method

.method start()Ljava/lang/Object;
    .registers 3

    .line 15
    const/4 v0, 0x1

    iput v0, p0, Lcom/streambundleextra/LinkResolver$State;->stage:I

    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State;->site:Lcom/streambundleextra/VideoBundleSite;

    iget-object v1, p0, Lcom/streambundleextra/LinkResolver$State;->data:Ljava/lang/String;

    invoke-static {v1}, Lcom/streambundleextra/MediaFix;->mediaRequestUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/streambundleextra/VideoBundleSite;->page(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static {v0, v1, p0}, Lcom/streambundleextra/VideoBundleSite;->access$page(Lcom/streambundleextra/VideoBundleSite;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_19

    invoke-virtual {p0, v0}, Lcom/streambundleextra/LinkResolver$State;->process(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :cond_19
    return-object v0
.end method
