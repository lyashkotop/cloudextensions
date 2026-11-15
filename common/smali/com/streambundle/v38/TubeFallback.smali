.class public final Lcom/streambundle/v38/TubeFallback;
.super Ljava/lang/Object;
.source "TubeFallback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/TubeFallback$Target;
    }
.end annotation


# static fields
.field private static final IO:Ljava/util/concurrent/ExecutorService;

.field private static final UA:Ljava/lang/String; = "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 Chrome/131.0.0.0 Mobile Safari/537.36"


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 21
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    new-instance v6, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v6}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    new-instance v7, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda0;

    invoke-direct {v7}, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda0;-><init>()V

    .line 21
    const/4 v1, 0x0

    const/4 v2, 0x6

    const-wide/16 v3, 0x1e

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v8, Lcom/streambundle/v38/TubeFallback;->IO:Ljava/util/concurrent/ExecutorService;

    .line 26
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 21
    sget-object v0, Lcom/streambundle/v38/TubeFallback;->IO:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V
    .registers 4

    .line 73
    invoke-static {p0, p1, p2, p3}, Lcom/streambundle/v38/TubeFallback;->fallback(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V

    return-void
.end method

.method private static emit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/coroutines/CoroutineContext;",
            ")V"
        }
    .end annotation

    .line 125
    new-instance v5, Lcom/streambundle/v38/TubeFallback$2;

    invoke-direct {v5, p5, p4}, Lcom/streambundle/v38/TubeFallback$2;-><init>(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function1;)V

    .line 131
    nop

    .line 132
    if-eqz p3, :cond_b

    sget-object p3, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    goto :goto_d

    :cond_b
    sget-object p3, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->VIDEO:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    :goto_d
    move-object v3, p3

    new-instance v4, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda2;

    invoke-direct {v4, p2}, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;)V

    .line 137
    nop

    .line 131
    move-object v0, p0

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v0 .. v5}, Lcom/lagradost/cloudstream3/utils/ExtractorApiKt;->newExtractorLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    .line 138
    instance-of p1, p0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    if-eqz p1, :cond_24

    check-cast p0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-interface {p4, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    :cond_24
    return-void
.end method

.method private static excluded(Ljava/lang/String;)Z
    .registers 2

    .line 120
    invoke-static {p0}, Lcom/streambundle/v38/TubeSources;->excluded(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-virtual {v0, p0}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_10

    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method

.method private static fallback(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/coroutines/CoroutineContext;",
            ")V"
        }
    .end annotation

    .line 75
    move-object/from16 v0, p1

    invoke-static/range {p1 .. p1}, Lcom/streambundle/v38/TubeFallback;->excluded(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    return-void

    .line 76
    :cond_9
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x6

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 77
    const-string v3, "Name"

    move-object/from16 v4, p0

    invoke-static {v4, v3}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 78
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lagradost/nicehttp/Requests;->getBaseClient()Lokhttp3/OkHttpClient;

    move-result-object v10

    .line 79
    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    .line 80
    new-instance v12, Ljava/util/ArrayDeque;

    invoke-direct {v12}, Ljava/util/ArrayDeque;-><init>()V

    .line 81
    invoke-static/range {p1 .. p1}, Lcom/streambundle/v38/TubeSources;->external(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 83
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    const/4 v13, 0x1

    if-nez v5, :cond_47

    new-instance v5, Lcom/streambundle/v38/TubeFallback$Target;

    invoke-direct {v5, v4, v0, v13}, Lcom/streambundle/v38/TubeFallback$Target;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v12, v5}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 84
    :cond_47
    new-instance v4, Lcom/streambundle/v38/TubeFallback$Target;

    const/4 v14, 0x0

    invoke-direct {v4, v0, v0, v14}, Lcom/streambundle/v38/TubeFallback$Target;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v12, v4}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 86
    nop

    :cond_51
    :goto_51
    invoke-interface {v12}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1e2

    invoke-interface {v11}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v4, 0x6

    if-lt v0, v4, :cond_60

    goto/16 :goto_1e2

    .line 87
    :cond_60
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long v4, v1, v4

    invoke-virtual {v0, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    .line 88
    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-gtz v0, :cond_73

    return-void

    .line 89
    :cond_73
    invoke-interface {v12}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundle/v38/TubeFallback$Target;

    .line 90
    iget-object v6, v0, Lcom/streambundle/v38/TubeFallback$Target;->url:Ljava/lang/String;

    invoke-static {v6}, Lcom/streambundle/v38/TubeFallback;->excluded(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_51

    iget-object v6, v0, Lcom/streambundle/v38/TubeFallback$Target;->url:Ljava/lang/String;

    invoke-interface {v11, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_8a

    goto :goto_51

    .line 91
    :cond_8a
    new-instance v6, Lokhttp3/Request$Builder;

    invoke-direct {v6}, Lokhttp3/Request$Builder;-><init>()V

    iget-object v7, v0, Lcom/streambundle/v38/TubeFallback$Target;->url:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v6

    .line 92
    const-string v7, "User-Agent"

    const-string v8, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-virtual {v6, v7, v8}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v6

    const-string v7, "Referer"

    iget-object v8, v0, Lcom/streambundle/v38/TubeFallback$Target;->referer:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v6

    .line 91
    nop

    .line 93
    const/4 v15, 0x0

    :try_start_ab
    invoke-virtual {v10}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v7

    const-wide/16 v8, 0x8fc

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v4, v5, v8}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v4

    .line 94
    invoke-virtual {v4}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v4

    invoke-virtual {v4, v6}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v4

    invoke-interface {v4}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v9
    :try_end_c7
    .catchall {:try_start_ab .. :try_end_c7} :catchall_1d4

    .line 93
    nop

    .line 95
    :try_start_c8
    invoke-virtual {v9}, Lokhttp3/Response;->isSuccessful()Z

    move-result v4

    if-eqz v4, :cond_1c1

    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v4

    if-nez v4, :cond_d8

    move-object/from16 v19, v9

    goto/16 :goto_1c3

    .line 96
    :cond_d8
    invoke-virtual {v9}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v8

    .line 97
    const-string v4, "Content-Type"

    const-string v5, ""

    invoke-virtual {v9, v4, v5}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 98
    invoke-static {v8}, Lcom/streambundle/v38/TubeFallback;->excluded(Ljava/lang/String;)Z

    move-result v5
    :try_end_f0
    .catchall {:try_start_c8 .. :try_end_f0} :catchall_1ca

    if-eqz v5, :cond_f9

    .line 115
    if-eqz v9, :cond_51

    :try_start_f4
    invoke-virtual {v9}, Lokhttp3/Response;->close()V
    :try_end_f7
    .catchall {:try_start_f4 .. :try_end_f7} :catchall_1d4

    .line 98
    goto/16 :goto_51

    .line 99
    :cond_f9
    :try_start_f9
    const-string v5, "video/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5
    :try_end_ff
    .catchall {:try_start_f9 .. :try_end_ff} :catchall_1ca

    const-string v6, "mpegurl"

    if-nez v5, :cond_1a4

    :try_start_103
    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_10f

    move-object/from16 v18, v8

    move-object/from16 v19, v9

    goto/16 :goto_1a8

    .line 103
    :cond_10f
    const-wide/32 v4, 0x100000

    invoke-virtual {v9, v4, v5}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v8}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v4

    .line 104
    invoke-static {v4}, Lcom/streambundle/v38/TubeSources;->embeds(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v16

    .line 105
    nop

    .line 106
    invoke-static {v4}, Lcom/streambundle/v38/TubeSources;->sources(Lorg/jsoup/nodes/Document;)Ljava/util/LinkedHashMap;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    move v4, v14

    :goto_130
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v5
    :try_end_134
    .catchall {:try_start_103 .. :try_end_134} :catchall_1ca

    if-nez v5, :cond_178

    .line 111
    if-eqz v4, :cond_13e

    .line 115
    if-eqz v9, :cond_13d

    :try_start_13a
    invoke-virtual {v9}, Lokhttp3/Response;->close()V
    :try_end_13d
    .catchall {:try_start_13a .. :try_end_13d} :catchall_1d4

    .line 111
    :cond_13d
    return-void

    .line 112
    :cond_13e
    :try_start_13e
    iget v4, v0, Lcom/streambundle/v38/TubeFallback$Target;->depth:I
    :try_end_140
    .catchall {:try_start_13e .. :try_end_140} :catchall_173

    const/4 v5, 0x2

    if-lt v4, v5, :cond_14a

    .line 115
    if-eqz v9, :cond_51

    :try_start_145
    invoke-virtual {v9}, Lokhttp3/Response;->close()V
    :try_end_148
    .catchall {:try_start_145 .. :try_end_148} :catchall_1d4

    .line 112
    goto/16 :goto_51

    .line 113
    :cond_14a
    :try_start_14a
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_14e
    :goto_14e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5
    :try_end_152
    .catchall {:try_start_14a .. :try_end_152} :catchall_173

    if-nez v5, :cond_15b

    .line 115
    if-eqz v9, :cond_51

    :try_start_156
    invoke-virtual {v9}, Lokhttp3/Response;->close()V
    :try_end_159
    .catchall {:try_start_156 .. :try_end_159} :catchall_1d4

    goto/16 :goto_51

    .line 113
    :cond_15b
    :try_start_15b
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v11, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_14e

    .line 114
    new-instance v6, Lcom/streambundle/v38/TubeFallback$Target;

    iget v7, v0, Lcom/streambundle/v38/TubeFallback$Target;->depth:I

    add-int/2addr v7, v13

    invoke-direct {v6, v5, v8, v7}, Lcom/streambundle/v38/TubeFallback$Target;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v12, v6}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V
    :try_end_172
    .catchall {:try_start_15b .. :try_end_172} :catchall_173

    goto :goto_14e

    .line 115
    :catchall_173
    move-exception v0

    move-object v15, v0

    move-object/from16 v19, v9

    goto :goto_1ce

    .line 106
    :cond_178
    :try_start_178
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 107
    invoke-static {v5}, Lcom/streambundle/v38/TubeFallback;->excluded(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_185

    goto :goto_130

    .line 108
    :cond_185
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v6, ".m3u8"

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7
    :try_end_191
    .catchall {:try_start_178 .. :try_end_191} :catchall_1ca

    move-object v4, v3

    move-object v6, v8

    move-object/from16 v18, v8

    move-object/from16 v8, p2

    move-object/from16 v19, v9

    move-object/from16 v9, p3

    :try_start_19b
    invoke-static/range {v4 .. v9}, Lcom/streambundle/v38/TubeFallback;->emit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V

    .line 109
    move v4, v13

    move-object/from16 v8, v18

    move-object/from16 v9, v19

    goto :goto_130

    .line 99
    :cond_1a4
    move-object/from16 v18, v8

    move-object/from16 v19, v9

    .line 100
    :goto_1a8
    iget-object v0, v0, Lcom/streambundle/v38/TubeFallback$Target;->referer:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    move-object v4, v3

    move-object/from16 v5, v18

    move-object v6, v0

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    invoke-static/range {v4 .. v9}, Lcom/streambundle/v38/TubeFallback;->emit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V
    :try_end_1b9
    .catchall {:try_start_19b .. :try_end_1b9} :catchall_1bf

    .line 115
    if-eqz v19, :cond_1be

    :try_start_1bb
    invoke-virtual/range {v19 .. v19}, Lokhttp3/Response;->close()V

    .line 101
    :cond_1be
    return-void

    .line 115
    :catchall_1bf
    move-exception v0

    goto :goto_1cd

    .line 95
    :cond_1c1
    move-object/from16 v19, v9

    .line 115
    :goto_1c3
    if-eqz v19, :cond_51

    invoke-virtual/range {v19 .. v19}, Lokhttp3/Response;->close()V

    .line 95
    goto/16 :goto_51

    .line 115
    :catchall_1ca
    move-exception v0

    move-object/from16 v19, v9

    :goto_1cd
    move-object v15, v0

    :goto_1ce
    if-eqz v19, :cond_1d3

    invoke-virtual/range {v19 .. v19}, Lokhttp3/Response;->close()V

    :cond_1d3
    throw v15
    :try_end_1d4
    .catchall {:try_start_1bb .. :try_end_1d4} :catchall_1d4

    :catchall_1d4
    move-exception v0

    if-eqz v15, :cond_1dd

    if-eq v15, v0, :cond_1de

    :try_start_1d9
    invoke-virtual {v15, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1de

    :cond_1dd
    move-object v15, v0

    :cond_1de
    :goto_1de
    throw v15
    :try_end_1df
    .catch Ljava/io/IOException; {:try_start_1d9 .. :try_end_1df} :catch_1df

    :catch_1df
    move-exception v0

    goto/16 :goto_51

    .line 117
    :cond_1e2
    :goto_1e2
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 23
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "tubesafari-player"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 24
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 25
    return-object v0
.end method

.method static synthetic lambda$1(Ljava/util/Set;Lkotlin/jvm/functions/Function1;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;
    .registers 4

    .line 35
    invoke-virtual {p2}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    invoke-interface {p1, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    :cond_d
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static synthetic lambda$2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 133
    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .line 134
    invoke-virtual {p1, p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setReferer(Ljava/lang/String;)V

    .line 135
    const-string p0, "User-Agent"

    const-string p2, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-static {p0, p2}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setHeaders(Ljava/util/Map;)V

    .line 136
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public static load(Ljava/lang/Object;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Z",
            "Lkotlin/jvm/functions/Function1;",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-static {p1}, Lcom/streambundle/v38/FastHurt;->supports(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {p0, p1, p4, p5}, Lcom/streambundle/v38/FastHurt;->load(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 32
    :cond_b
    new-instance v7, Lkotlin/coroutines/SafeContinuation;

    invoke-direct {v7, p5}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 33
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    .line 34
    new-instance v8, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda1;

    invoke-direct {v8, v3, p4}, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda1;-><init>(Ljava/util/Set;Lkotlin/jvm/functions/Function1;)V

    .line 38
    new-instance p4, Lcom/streambundle/v38/TubeFallback$1;

    move-object v0, p4

    move-object v1, p5

    move-object v2, v7

    move-object v4, p0

    move-object v5, p1

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/streambundle/v38/TubeFallback$1;-><init>(Lkotlin/coroutines/Continuation;Lkotlin/coroutines/SafeContinuation;Ljava/util/Set;Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    .line 65
    :try_start_29
    const-string p5, "linksWithoutFallback"

    .line 66
    const/4 v0, 0x5

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-class v2, Lkotlin/jvm/functions/Function1;

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-class v2, Lkotlin/jvm/functions/Function1;

    const/4 v6, 0x3

    aput-object v2, v1, v6

    const-class v2, Lkotlin/coroutines/Continuation;

    const/4 v9, 0x4

    aput-object v2, v1, v9

    new-array v0, v0, [Ljava/lang/Object;

    .line 67
    aput-object p1, v0, v3

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v0, v4

    aput-object p3, v0, v5

    aput-object v8, v0, v6

    aput-object p4, v0, v9

    .line 65
    invoke-static {p0, p5, v1, v0}, Lcom/streambundle/v38/Screening;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_5b
    .catchall {:try_start_29 .. :try_end_5b} :catchall_5c

    .line 68
    goto :goto_61

    :catchall_5c
    move-exception p0

    invoke-static {p0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p0

    .line 69
    :goto_61
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-eq p0, p1, :cond_6a

    invoke-interface {p4, p0}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 70
    :cond_6a
    invoke-virtual {v7}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
