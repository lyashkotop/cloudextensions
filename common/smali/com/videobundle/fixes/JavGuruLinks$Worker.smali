.class final Lcom/videobundle/fixes/JavGuruLinks$Worker;
.super Ljava/lang/Object;
.source "JavGuruLinks.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/videobundle/fixes/JavGuruLinks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Worker"
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

.field depth:I

.field final detail:Ljava/lang/String;

.field emitted:Z

.field index:I

.field final pending:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field referer:Ljava/lang/String;

.field stage:I

.field final subtitles:Lkotlin/jvm/functions/Function1;

.field final visited:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V
    .registers 6

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->pending:Ljava/util/List;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->visited:Ljava/util/Set;

    .line 24
    const/4 v0, 0x0

    iput v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    iput v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->index:I

    iput v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->depth:I

    iput-boolean v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->emitted:Z

    .line 25
    iput-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->detail:Ljava/lang/String;

    iput-object p2, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->subtitles:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->callback:Lkotlin/jvm/functions/Function1;

    iput-object p4, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->completion:Lkotlin/coroutines/Continuation;

    iput-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->referer:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method extract(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5

    .line 34
    iget-object v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->subtitles:Lkotlin/jvm/functions/Function1;

    new-instance v1, Lcom/videobundle/fixes/JavGuruLinks$Worker$1;

    invoke-direct {v1, p0}, Lcom/videobundle/fixes/JavGuruLinks$Worker$1;-><init>(Lcom/videobundle/fixes/JavGuruLinks$Worker;)V

    invoke-static {p1, p2, v0, v1, p0}, Lcom/lagradost/cloudstream3/utils/ExtractorApiKt;->loadExtractor(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method fetch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v14, p0

    move-object/from16 v1, p1

    .line 29
    new-instance v0, Ljava/util/LinkedHashMap;

    move-object v2, v0

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v3, "Referer"

    move-object/from16 v4, p2

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "User-Agent"

    const-string v4, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v0

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v15, 0xe1c

    const/16 v16, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/16 v7, 0xf

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    invoke-static/range {v0 .. v16}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 26
    iget-object v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 27
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/videobundle/fixes/JavGuruLinks$Worker;->run(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-eq p1, v0, :cond_1a

    iget-object v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V
    :try_end_f
    .catchall {:try_start_0 .. :try_end_f} :catchall_10

    goto :goto_1a

    :catchall_10
    move-exception p1

    iget-object v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->completion:Lkotlin/coroutines/Continuation;

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    :cond_1a
    :goto_1a
    return-void
.end method

.method run(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 37
    const-string v0, "jav.guru"

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 38
    iget v2, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    const/4 v3, 0x1

    if-nez v2, :cond_18

    iput v3, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    iget-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->detail:Ljava/lang/String;

    iget-object v2, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->detail:Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Lcom/videobundle/fixes/JavGuruLinks$Worker;->fetch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_18

    return-object v1

    .line 41
    :cond_18
    :goto_18
    const/4 v2, 0x2

    const/4 v4, 0x4

    :try_start_1a
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 42
    iget v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    const/16 v6, 0x12c

    const/16 v7, 0xc8

    if-ne v5, v3, :cond_54

    check-cast p1, Lcom/lagradost/nicehttp/NiceResponse;

    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v5

    if-lt v5, v7, :cond_4c

    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v5

    if-ge v5, v6, :cond_4c

    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p1

    iget-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->pending:Ljava/util/List;

    invoke-static {p1}, Lcom/videobundle/fixes/SiteFix;->javEmbeds(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v5, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iput v4, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    goto/16 :goto_e7

    :cond_4c
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v5, "JAVGuru page unavailable"

    invoke-direct {p1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 43
    :cond_54
    iget v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    const/4 v8, 0x3

    if-ne v5, v2, :cond_d8

    .line 44
    check-cast p1, Lcom/lagradost/nicehttp/NiceResponse;

    .line 45
    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v5

    if-lt v5, v7, :cond_d5

    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v5

    if-lt v5, v6, :cond_68

    goto :goto_d5

    .line 47
    :cond_68
    new-instance v5, Ljava/net/URI;

    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 48
    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8c

    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p1

    invoke-static {p1}, Lcom/videobundle/fixes/SiteFix;->javNext(Lorg/jsoup/nodes/Document;)Ljava/lang/String;

    move-result-object p1

    goto :goto_90

    :cond_8c
    invoke-virtual {p1}, Lcom/lagradost/nicehttp/NiceResponse;->getUrl()Ljava/lang/String;

    move-result-object p1

    .line 49
    :goto_90
    if-eqz p1, :cond_d2

    iget-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->visited:Ljava/util/Set;

    invoke-interface {v5, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_d2

    iget v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->depth:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->depth:I

    if-ge v5, v4, :cond_d2

    .line 50
    iget-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->current:Ljava/lang/String;

    iput-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->referer:Ljava/lang/String;

    iput-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->current:Ljava/lang/String;

    iget-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->visited:Ljava/util/Set;

    invoke-interface {v5, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 51
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c7

    iput v2, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    iget-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->referer:Ljava/lang/String;

    invoke-virtual {p0, p1, v5}, Lcom/videobundle/fixes/JavGuruLinks$Worker;->fetch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_18

    return-object v1

    .line 52
    :cond_c7
    iput v8, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    iget-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->referer:Ljava/lang/String;

    invoke-virtual {p0, p1, v5}, Lcom/videobundle/fixes/JavGuruLinks$Worker;->extract(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_18

    return-object v1

    .line 54
    :cond_d2
    iput v4, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    goto :goto_df

    .line 45
    :cond_d5
    :goto_d5
    iput v4, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    goto :goto_e7

    .line 56
    :cond_d8
    iget p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    if-ne p1, v8, :cond_df

    iput v4, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I
    :try_end_de
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1a .. :try_end_de} :catch_12d
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_de} :catch_e0

    .line 57
    goto :goto_e7

    .line 56
    :cond_df
    :goto_df
    goto :goto_e7

    .line 57
    :catch_e0
    move-exception p1

    iget v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    if-eq v5, v3, :cond_12c

    iput v4, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    .line 58
    :goto_e7
    iget p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->index:I

    iget-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->pending:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt p1, v5, :cond_f8

    iget-boolean p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->emitted:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 59
    :cond_f8
    iget-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->pending:Ljava/util/List;

    iget v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->index:I

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->current:Ljava/lang/String;

    iget-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->detail:Ljava/lang/String;

    iput-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->referer:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->depth:I

    iget-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->visited:Ljava/util/Set;

    iget-object v5, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->current:Ljava/lang/String;

    invoke-interface {p1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iput v2, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    .line 60
    :try_start_118
    iget-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->current:Ljava/lang/String;

    iget-object v2, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->referer:Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Lcom/videobundle/fixes/JavGuruLinks$Worker;->fetch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1
    :try_end_120
    .catch Ljava/util/concurrent/CancellationException; {:try_start_118 .. :try_end_120} :catch_12a
    .catch Ljava/lang/Exception; {:try_start_118 .. :try_end_120} :catch_123

    .line 61
    if-ne p1, v1, :cond_18

    return-object v1

    .line 60
    :catch_123
    move-exception p1

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    iput v4, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->stage:I

    goto/16 :goto_18

    :catch_12a
    move-exception p1

    throw p1

    .line 57
    :cond_12c
    throw p1

    :catch_12d
    move-exception p1

    throw p1
.end method
