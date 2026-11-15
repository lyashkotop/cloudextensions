.class public final Lcom/streambundle/v38/ExtraPlayer;
.super Ljava/lang/Object;
.source "ExtraPlayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/ExtraPlayer$Target;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addSource(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 130
    invoke-static {p1, p2}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 131
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_13

    invoke-static {p1}, Lcom/streambundle/v38/TubeSources;->excluded(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_13

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 132
    :cond_13
    return-void
.end method

.method static client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;
    .registers 5

    .line 53
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/Requests;->getBaseClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 54
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, v1}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 53
    nop

    .line 56
    :try_start_13
    invoke-static {p0}, Lcom/streambundle/v43/SiteAccess;->interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object p0

    .line 57
    if-eqz p0, :cond_21

    invoke-virtual {p1, p0}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;
    :try_end_1c
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_1c} :catch_1f
    .catch Ljava/lang/LinkageError; {:try_start_13 .. :try_end_1c} :catch_1d

    goto :goto_20

    .line 58
    :catch_1d
    move-exception p0

    goto :goto_20

    :catch_1f
    move-exception p0

    :goto_20
    nop

    .line 59
    :cond_21
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p0

    return-object p0
.end method

.method private static collectJson(Ljava/util/Set;Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    .line 140
    const/4 v0, 0x4

    if-gt p3, v0, :cond_74

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v1

    const/16 v2, 0xc

    if-lt v1, v2, :cond_c

    goto :goto_74

    .line 141
    :cond_c
    instance-of v1, p2, Lorg/json/JSONArray;

    const/4 v3, 0x0

    if-eqz v1, :cond_2c

    .line 142
    move-object v1, p2

    check-cast v1, Lorg/json/JSONArray;

    .line 143
    nop

    :goto_15
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result p2

    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    if-lt v3, p2, :cond_20

    .line 145
    goto :goto_73

    .line 144
    :cond_20
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 v0, p3, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/streambundle/v38/ExtraPlayer;->collectJson(Ljava/util/Set;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 143
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 145
    :cond_2c
    instance-of v1, p2, Lorg/json/JSONObject;

    if-eqz v1, :cond_73

    .line 146
    check-cast p2, Lorg/json/JSONObject;

    .line 147
    const-string v1, "contentUrl"

    const-string v2, "videoUrl"

    const-string v4, "file"

    const-string v5, "src"

    const-string v6, "hls"

    filled-new-array {v4, v5, v6, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    move v2, v3

    :goto_41
    const/4 v4, 0x5

    if-lt v2, v4, :cond_61

    .line 151
    const-string v1, "video"

    const-string v2, "data"

    const-string v4, "sources"

    const-string v5, "playlist"

    filled-new-array {v4, v5, v1, v2}, [Ljava/lang/String;

    move-result-object v4

    :goto_50
    if-lt v3, v0, :cond_53

    goto :goto_73

    :cond_53
    aget-object v1, v4, v3

    .line 152
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, p3, 0x1

    invoke-static {p0, p1, v1, v2}, Lcom/streambundle/v38/ExtraPlayer;->collectJson(Ljava/util/Set;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 151
    add-int/lit8 v3, v3, 0x1

    goto :goto_50

    .line 147
    :cond_61
    aget-object v4, v1, v2

    .line 148
    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 149
    instance-of v5, v4, Ljava/lang/String;

    if-eqz v5, :cond_70

    check-cast v4, Ljava/lang/String;

    invoke-static {p0, p1, v4}, Lcom/streambundle/v38/ExtraPlayer;->addSource(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    :cond_70
    add-int/lit8 v2, v2, 0x1

    goto :goto_41

    .line 154
    :cond_73
    :goto_73
    return-void

    .line 140
    :cond_74
    :goto_74
    return-void
.end method

.method private static collectJson(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 135
    :try_start_0
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p2}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/streambundle/v38/ExtraPlayer;->collectJson(Ljava/util/Set;Ljava/lang/String;Ljava/lang/Object;I)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    goto :goto_f

    .line 136
    :catch_e
    move-exception p0

    .line 137
    :goto_f
    return-void
.end method

.method private static emit(Lokhttp3/Response;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Response;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    invoke-virtual {p0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v4

    .line 178
    new-instance v8, Ljava/util/LinkedHashMap;

    invoke-static {v4}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 179
    const-string v0, "Referer"

    invoke-interface {v8, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    invoke-virtual {p0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    const-string v1, "Cookie"

    invoke-virtual {v0, v1}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 181
    if-eqz v0, :cond_29

    invoke-interface {v8, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    :cond_29
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".m3u8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_65

    .line 183
    const-string v0, "Content-Type"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "mpegurl"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_65

    .line 184
    const-wide/16 v0, 0x40

    invoke-virtual {p0, v0, v1}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "#EXTM3U"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_65

    .line 182
    const/4 p0, 0x0

    goto :goto_66

    :cond_65
    const/4 p0, 0x1

    :goto_66
    move v7, p0

    .line 185
    const/16 v6, 0x190

    move-object v1, p3

    move-object v2, p1

    move-object v3, p1

    move-object v5, p2

    invoke-static/range {v1 .. v8}, Lcom/streambundle/v38/MediaLink;->emit(Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/util/Map;)V

    .line 186
    return-void
.end method

.method static fallback(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 76
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const-string v2, "data-setup"

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v6, 0x7

    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v5

    add-long/2addr v3, v5

    .line 77
    const-string v5, "Name"

    move-object/from16 v6, p0

    invoke-static {v6, v5}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 78
    new-instance v6, Ljava/util/ArrayDeque;

    invoke-direct {v6}, Ljava/util/ArrayDeque;-><init>()V

    .line 79
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 80
    new-instance v8, Lcom/streambundle/v38/ExtraPlayer$Target;

    const-string v9, "/"

    invoke-static {v0, v9}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v8, v0, v9, v10, v10}, Lcom/streambundle/v38/ExtraPlayer$Target;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    invoke-interface {v6, v8}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 81
    invoke-static/range {p1 .. p1}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    .line 82
    if-eqz v0, :cond_67

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v8

    const-string v9, "b.perdol.net"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_67

    .line 83
    new-instance v8, Lcom/streambundle/v38/ExtraPlayer$Target;

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    const-string v9, "perdol.net"

    invoke-virtual {v0, v9}, Lokhttp3/HttpUrl$Builder;->host(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    .line 84
    const-string v9, "https://perdol.net/"

    invoke-direct {v8, v0, v9, v10, v10}, Lcom/streambundle/v38/ExtraPlayer$Target;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    .line 83
    invoke-interface {v6, v8}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 85
    nop

    :cond_67
    :goto_67
    invoke-interface {v6}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2a4

    invoke-interface {v7}, Ljava/util/Set;->size()I

    move-result v0

    const/16 v8, 0x8

    if-lt v0, v8, :cond_77

    goto/16 :goto_2a4

    .line 86
    :cond_77
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    sub-long v8, v3, v8

    invoke-virtual {v0, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    .line 87
    const-wide/16 v11, 0x0

    cmp-long v0, v8, v11

    if-gtz v0, :cond_8a

    return-void

    .line 88
    :cond_8a
    invoke-interface {v6}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundle/v38/ExtraPlayer$Target;

    .line 89
    iget-object v11, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->url:Ljava/lang/String;

    invoke-static {v11}, Lcom/streambundle/v38/TubeSources;->excluded(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_29c

    iget-object v11, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->url:Ljava/lang/String;

    invoke-interface {v7, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a1

    goto :goto_67

    .line 91
    :cond_a1
    :try_start_a1
    iget-boolean v11, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->media:Z

    if-eqz v11, :cond_ac

    .line 92
    invoke-static {v0, v5, v3, v4, v1}, Lcom/streambundle/v38/ExtraPlayer;->tryStream(Lcom/streambundle/v38/ExtraPlayer$Target;Ljava/lang/String;JLkotlin/jvm/functions/Function1;)Z

    move-result v0
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_a1 .. :try_end_a9} :catch_28f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a1 .. :try_end_a9} :catch_28d

    if-eqz v0, :cond_67

    return-void

    .line 95
    :cond_ac
    :try_start_ac
    iget-object v12, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->url:Ljava/lang/String;

    const-wide/16 v13, 0x7d0

    invoke-static {v8, v9, v13, v14}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    invoke-static {v12, v8, v9}, Lcom/streambundle/v38/ExtraPlayer;->client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;

    move-result-object v8

    .line 96
    iget-object v9, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->url:Ljava/lang/String;

    iget-object v12, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->referer:Ljava/lang/String;

    invoke-static {v9, v12}, Lcom/streambundle/v38/ExtraPlayer;->request(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v9

    invoke-virtual {v8, v9}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v8

    invoke-interface {v8}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v8
    :try_end_cc
    .catchall {:try_start_ac .. :try_end_cc} :catchall_279

    .line 95
    nop

    .line 97
    :try_start_cd
    invoke-virtual {v8}, Lokhttp3/Response;->isSuccessful()Z

    move-result v9

    if-eqz v9, :cond_250

    invoke-virtual {v8}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v9

    if-nez v9, :cond_df

    move-wide/from16 v18, v3

    move/from16 v16, v10

    goto/16 :goto_254

    .line 98
    :cond_df
    invoke-virtual {v8}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v9

    .line 99
    invoke-static {v8}, Lcom/streambundle/v38/ExtraPlayer;->isMedia(Lokhttp3/Response;)Z

    move-result v12
    :try_end_ef
    .catchall {:try_start_cd .. :try_end_ef} :catchall_26b

    if-eqz v12, :cond_104

    .line 100
    :try_start_f1
    iget-object v0, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->referer:Ljava/lang/String;

    invoke-static {v8, v5, v0, v1}, Lcom/streambundle/v38/ExtraPlayer;->emit(Lokhttp3/Response;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    :try_end_f6
    .catchall {:try_start_f1 .. :try_end_f6} :catchall_fc

    .line 124
    if-eqz v8, :cond_fb

    :try_start_f8
    invoke-virtual {v8}, Lokhttp3/Response;->close()V
    :try_end_fb
    .catchall {:try_start_f8 .. :try_end_fb} :catchall_279

    .line 101
    :cond_fb
    return-void

    .line 124
    :catchall_fc
    move-exception v0

    move-object v11, v0

    move-wide/from16 v18, v3

    move/from16 v16, v10

    goto/16 :goto_271

    .line 103
    :cond_104
    const-wide/32 v12, 0x100000

    :try_start_107
    invoke-virtual {v8, v12, v13}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v12

    invoke-virtual {v12}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v12

    .line 104
    invoke-static {v12, v9}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v13

    .line 105
    invoke-static {v13}, Lcom/streambundle/v38/TubeSources;->embeds(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v14

    .line 106
    iget v15, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->depth:I
    :try_end_119
    .catchall {:try_start_107 .. :try_end_119} :catchall_26b

    const/4 v11, 0x2

    const-string v10, "data-src"

    if-ge v15, v11, :cond_1af

    .line 107
    :try_start_11e
    const-string v15, "iframe[data-src], iframe[data-lazy-src], [data-embed-url], [data-player-url]"

    invoke-virtual {v13, v15}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v15

    invoke-virtual {v15}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_128
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v17
    :try_end_12c
    .catchall {:try_start_11e .. :try_end_12c} :catchall_1a8

    if-nez v17, :cond_162

    .line 113
    :try_start_12e
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_132
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_13e

    move-wide/from16 v18, v3

    const/16 v16, 0x0

    goto/16 :goto_1b3

    :cond_13e
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    new-instance v15, Lcom/streambundle/v38/ExtraPlayer$Target;

    iget v1, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->depth:I
    :try_end_148
    .catchall {:try_start_12e .. :try_end_148} :catchall_15a

    const/16 v17, 0x1

    add-int/lit8 v1, v1, 0x1

    move-wide/from16 v18, v3

    const/4 v3, 0x0

    :try_start_14f
    invoke-direct {v15, v14, v9, v3, v1}, Lcom/streambundle/v38/ExtraPlayer$Target;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    invoke-interface {v6, v15}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V
    :try_end_155
    .catchall {:try_start_14f .. :try_end_155} :catchall_158

    move-wide/from16 v3, v18

    goto :goto_132

    .line 124
    :catchall_158
    move-exception v0

    goto :goto_15d

    :catchall_15a
    move-exception v0

    move-wide/from16 v18, v3

    :goto_15d
    move-object v11, v0

    const/16 v16, 0x0

    goto/16 :goto_271

    .line 107
    :cond_162
    move-wide/from16 v18, v3

    :try_start_164
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 108
    const/4 v3, 0x4

    new-array v4, v3, [Ljava/lang/String;
    :try_end_16d
    .catchall {:try_start_164 .. :try_end_16d} :catchall_1a6

    const/16 v16, 0x0

    :try_start_16f
    aput-object v10, v4, v16

    const-string v17, "data-lazy-src"

    const/16 v20, 0x1

    aput-object v17, v4, v20

    const-string v17, "data-embed-url"

    aput-object v17, v4, v11

    const-string v17, "data-player-url"

    const/16 v20, 0x3

    aput-object v17, v4, v20

    move/from16 v11, v16

    :goto_183
    if-lt v11, v3, :cond_189

    move-wide/from16 v3, v18

    const/4 v11, 0x2

    goto :goto_128

    :cond_189
    aget-object v3, v4, v11

    .line 109
    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 110
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v21

    if-nez v21, :cond_1a2

    invoke-interface {v14, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_1a2

    invoke-interface {v14, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    :cond_1a2
    add-int/lit8 v11, v11, 0x1

    const/4 v3, 0x4

    goto :goto_183

    .line 124
    :catchall_1a6
    move-exception v0

    goto :goto_1ab

    :catchall_1a8
    move-exception v0

    move-wide/from16 v18, v3

    :goto_1ab
    const/16 v16, 0x0

    goto/16 :goto_270

    .line 106
    :cond_1af
    move-wide/from16 v18, v3

    const/16 v16, 0x0

    .line 115
    :goto_1b3
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-static {v13}, Lcom/streambundle/v38/TubeSources;->sources(Lorg/jsoup/nodes/Document;)Ljava/util/LinkedHashMap;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 116
    const-string v3, "video[src], video[data-src], video source[src], video source[data-src]"

    invoke-virtual {v13, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1ca
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_234

    .line 118
    const-string v3, "[data-setup], [data-config]"

    invoke-virtual {v13, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1da
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_21b

    .line 120
    const-string v3, "Content-Type"

    const-string v4, ""

    invoke-virtual {v8, v3, v4}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "json"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1f9

    .line 121
    invoke-static {v1, v9, v12}, Lcom/streambundle/v38/ExtraPlayer;->collectJson(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    :cond_1f9
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1fd
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3
    :try_end_201
    .catchall {:try_start_16f .. :try_end_201} :catchall_24e

    if-nez v3, :cond_209

    .line 124
    if-eqz v8, :cond_263

    :try_start_205
    invoke-virtual {v8}, Lokhttp3/Response;->close()V
    :try_end_208
    .catchall {:try_start_205 .. :try_end_208} :catchall_261

    goto :goto_263

    .line 122
    :cond_209
    :try_start_209
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 123
    new-instance v4, Lcom/streambundle/v38/ExtraPlayer$Target;

    iget v10, v0, Lcom/streambundle/v38/ExtraPlayer$Target;->depth:I

    const/4 v11, 0x1

    invoke-direct {v4, v3, v9, v11, v10}, Lcom/streambundle/v38/ExtraPlayer$Target;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    invoke-interface {v6, v4}, Ljava/util/Deque;->addFirst(Ljava/lang/Object;)V

    goto :goto_1fd

    .line 118
    :cond_21b
    const/4 v11, 0x1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 119
    invoke-virtual {v4, v2}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_22a

    move-object v10, v2

    goto :goto_22c

    :cond_22a
    const-string v10, "data-config"

    :goto_22c
    invoke-virtual {v4, v10}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v9, v4}, Lcom/streambundle/v38/ExtraPlayer;->collectJson(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1da

    .line 116
    :cond_234
    const/4 v11, 0x1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 117
    invoke-virtual {v4, v10}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_243

    move-object v14, v10

    goto :goto_245

    :cond_243
    const-string v14, "src"

    :goto_245
    invoke-virtual {v4, v14}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v9, v4}, Lcom/streambundle/v38/ExtraPlayer;->addSource(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_24c
    .catchall {:try_start_209 .. :try_end_24c} :catchall_24e

    goto/16 :goto_1ca

    .line 124
    :catchall_24e
    move-exception v0

    goto :goto_270

    .line 97
    :cond_250
    move-wide/from16 v18, v3

    move/from16 v16, v10

    .line 124
    :goto_254
    if-eqz v8, :cond_263

    :try_start_256
    invoke-virtual {v8}, Lokhttp3/Response;->close()V
    :try_end_259
    .catchall {:try_start_256 .. :try_end_259} :catchall_261

    .line 97
    move-object/from16 v1, p2

    move/from16 v10, v16

    move-wide/from16 v3, v18

    goto/16 :goto_67

    .line 124
    :catchall_261
    move-exception v0

    goto :goto_27e

    :cond_263
    :goto_263
    move-object/from16 v1, p2

    move/from16 v10, v16

    move-wide/from16 v3, v18

    goto/16 :goto_67

    :catchall_26b
    move-exception v0

    move-wide/from16 v18, v3

    move/from16 v16, v10

    :goto_270
    move-object v11, v0

    :goto_271
    if-eqz v8, :cond_276

    :try_start_273
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    :cond_276
    throw v11
    :try_end_277
    .catchall {:try_start_273 .. :try_end_277} :catchall_277

    :catchall_277
    move-exception v0

    goto :goto_27f

    :catchall_279
    move-exception v0

    move-wide/from16 v18, v3

    move/from16 v16, v10

    :goto_27e
    const/4 v11, 0x0

    :goto_27f
    if-eqz v11, :cond_287

    if-eq v11, v0, :cond_288

    :try_start_283
    invoke-virtual {v11, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_288

    :cond_287
    move-object v11, v0

    :cond_288
    :goto_288
    throw v11
    :try_end_289
    .catch Ljava/io/IOException; {:try_start_283 .. :try_end_289} :catch_28b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_283 .. :try_end_289} :catch_289

    .line 125
    :catch_289
    move-exception v0

    goto :goto_294

    :catch_28b
    move-exception v0

    goto :goto_294

    :catch_28d
    move-exception v0

    goto :goto_290

    :catch_28f
    move-exception v0

    :goto_290
    move-wide/from16 v18, v3

    move/from16 v16, v10

    :goto_294
    move-object/from16 v1, p2

    move/from16 v10, v16

    move-wide/from16 v3, v18

    goto/16 :goto_67

    .line 89
    :cond_29c
    move-wide/from16 v18, v3

    move/from16 v16, v10

    move-object/from16 v1, p2

    goto/16 :goto_67

    .line 127
    :cond_2a4
    :goto_2a4
    return-void
.end method

.method static isMedia(Lokhttp3/Response;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    invoke-virtual {p0}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a5

    invoke-virtual {p0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    if-nez v0, :cond_f

    goto/16 :goto_a5

    .line 34
    :cond_f
    const-string v0, "Content-Type"

    const-string v2, ""

    invoke-virtual {p0, v0, v2}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 35
    const-wide/16 v2, 0x200

    invoke-virtual {p0, v2, v3}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object p0

    .line 36
    array-length v2, p0

    if-nez v2, :cond_2b

    return v1

    .line 37
    :cond_2b
    new-instance v2, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v2, p0, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 38
    const-string v3, "<"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_a4

    const-string v3, "{"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_47

    goto :goto_a4

    .line 39
    :cond_47
    const-string v3, "video/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_a3

    const-string v3, "mpegurl"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a3

    .line 40
    const-string v0, "#EXTM3U"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a3

    .line 41
    array-length v0, p0

    const/16 v2, 0x8

    const/4 v3, 0x4

    if-lt v0, v2, :cond_81

    aget-byte v0, p0, v3

    const/16 v2, 0x66

    if-ne v0, v2, :cond_81

    const/4 v0, 0x5

    aget-byte v0, p0, v0

    const/16 v2, 0x74

    if-ne v0, v2, :cond_81

    const/4 v0, 0x6

    aget-byte v0, p0, v0

    const/16 v2, 0x79

    if-ne v0, v2, :cond_81

    const/4 v0, 0x7

    aget-byte v0, p0, v0

    const/16 v2, 0x70

    if-eq v0, v2, :cond_a3

    .line 42
    :cond_81
    array-length v0, p0

    if-lt v0, v3, :cond_a2

    aget-byte v0, p0, v1

    const/16 v2, 0x1a

    if-ne v0, v2, :cond_a2

    aget-byte v0, p0, v4

    const/16 v2, 0x45

    if-ne v0, v2, :cond_a2

    const/4 v0, 0x2

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v2, 0xdf

    if-ne v0, v2, :cond_a2

    const/4 v0, 0x3

    aget-byte p0, p0, v0

    and-int/lit16 p0, p0, 0xff

    const/16 v0, 0xa3

    if-eq p0, v0, :cond_a3

    .line 39
    :cond_a2
    return v1

    :cond_a3
    return v4

    .line 38
    :cond_a4
    :goto_a4
    return v1

    .line 33
    :cond_a5
    :goto_a5
    return v1
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;
    .registers 5

    .line 46
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 47
    invoke-static {p0}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_15
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_22

    .line 49
    const-string p0, "Referer"

    invoke-virtual {v0, p0, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    return-object p0

    .line 47
    :cond_22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 48
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_15
.end method

.method static supports(Ljava/lang/String;)Z
    .registers 3

    .line 24
    const/4 v0, 0x0

    if-eqz p0, :cond_38

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_38

    .line 25
    :cond_a
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    .line 26
    if-nez p0, :cond_11

    return v0

    .line 27
    :cond_11
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    .line 28
    const-string v1, "perdol.net"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_36

    const-string v1, ".perdol.net"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_36

    .line 29
    const-string v1, "hurtsex.com"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_36

    const-string v1, ".hurtsex.com"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_36

    .line 28
    return v0

    :cond_36
    const/4 p0, 0x1

    return p0

    .line 24
    :cond_38
    :goto_38
    return v0
.end method

.method private static tryStream(Lcom/streambundle/v38/ExtraPlayer$Target;Ljava/lang/String;JLkotlin/jvm/functions/Function1;)Z
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundle/v38/ExtraPlayer$Target;",
            "Ljava/lang/String;",
            "J",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 158
    move-object v1, p0

    const/4 v2, 0x2

    new-array v3, v2, [Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    aput-boolean v5, v3, v4

    move v6, v4

    :goto_9
    if-lt v6, v2, :cond_c

    .line 172
    return v4

    .line 158
    :cond_c
    aget-boolean v7, v3, v6

    .line 159
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    sub-long v8, p2, v8

    invoke-virtual {v0, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    .line 160
    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    if-gtz v0, :cond_21

    return v4

    .line 161
    :cond_21
    iget-object v0, v1, Lcom/streambundle/v38/ExtraPlayer$Target;->url:Ljava/lang/String;

    iget-object v10, v1, Lcom/streambundle/v38/ExtraPlayer$Target;->referer:Ljava/lang/String;

    invoke-static {v0, v10}, Lcom/streambundle/v38/ExtraPlayer;->request(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 162
    if-eqz v7, :cond_32

    const-string v10, "Range"

    const-string v11, "bytes=0-511"

    invoke-virtual {v0, v10, v11}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 163
    :cond_32
    const/4 v10, 0x0

    :try_start_33
    iget-object v11, v1, Lcom/streambundle/v38/ExtraPlayer$Target;->url:Ljava/lang/String;

    const-wide/16 v12, 0x6a4

    invoke-static {v8, v9, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    invoke-static {v11, v8, v9}, Lcom/streambundle/v38/ExtraPlayer;->client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;

    move-result-object v8

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v8, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v8
    :try_end_4b
    .catchall {:try_start_33 .. :try_end_4b} :catchall_77

    .line 164
    :try_start_4b
    invoke-static {v8}, Lcom/streambundle/v38/ExtraPlayer;->isMedia(Lokhttp3/Response;)Z

    move-result v0

    if-eqz v0, :cond_61

    .line 165
    iget-object v0, v1, Lcom/streambundle/v38/ExtraPlayer$Target;->referer:Ljava/lang/String;
    :try_end_53
    .catchall {:try_start_4b .. :try_end_53} :catchall_6a

    move-object v9, p1

    move-object/from16 v11, p4

    :try_start_56
    invoke-static {v8, p1, v0, v11}, Lcom/streambundle/v38/ExtraPlayer;->emit(Lokhttp3/Response;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_5f

    .line 168
    if-eqz v8, :cond_5e

    :try_start_5b
    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    .line 166
    :cond_5e
    return v5

    .line 168
    :catchall_5f
    move-exception v0

    goto :goto_6e

    :cond_61
    move-object v9, p1

    move-object/from16 v11, p4

    if-eqz v8, :cond_88

    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    goto :goto_88

    :catchall_6a
    move-exception v0

    move-object v9, p1

    move-object/from16 v11, p4

    :goto_6e
    move-object v10, v0

    if-eqz v8, :cond_74

    invoke-virtual {v8}, Lokhttp3/Response;->close()V

    :cond_74
    throw v10
    :try_end_75
    .catchall {:try_start_5b .. :try_end_75} :catchall_75

    :catchall_75
    move-exception v0

    goto :goto_7b

    :catchall_77
    move-exception v0

    move-object v9, p1

    move-object/from16 v11, p4

    :goto_7b
    if-eqz v10, :cond_83

    if-eq v10, v0, :cond_84

    :try_start_7f
    invoke-virtual {v10, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_84

    :cond_83
    move-object v10, v0

    :cond_84
    :goto_84
    throw v10
    :try_end_85
    .catch Ljava/io/IOException; {:try_start_7f .. :try_end_85} :catch_85

    :catch_85
    move-exception v0

    .line 169
    if-eqz v7, :cond_8c

    .line 158
    :cond_88
    :goto_88
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_9

    .line 169
    :cond_8c
    throw v0
.end method
