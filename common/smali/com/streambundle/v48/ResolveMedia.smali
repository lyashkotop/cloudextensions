.class public final Lcom/streambundle/v48/ResolveMedia;
.super Ljava/lang/Object;
.source "ResolveMedia.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v48/ResolveMedia$Target;
    }
.end annotation


# static fields
.field public static final UA:Ljava/lang/String; = "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hurt(Ljava/lang/String;)Z
    .registers 3

    .line 20
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    const-string v1, "hurtsex.com"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    const-string v1, "www.hurtsex.com"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_17} :catch_1c

    if-nez p0, :cond_1a

    return v0

    :cond_1a
    const/4 p0, 0x1

    return p0

    :catch_1c
    move-exception p0

    return v0
.end method

.method public static resolve(Ljava/lang/String;Ljava/lang/String;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    .registers 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 35
    const-string v1, "Cookie"

    const-string v2, "Referer"

    const-string v3, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    const-string v4, "User-Agent"

    invoke-static/range {p1 .. p1}, Lcom/streambundle/Unified;->playbackUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/MediaFix;->mediaRequestUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 36
    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v5

    if-eqz v5, :cond_375

    .line 37
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v8, 0xc

    invoke-virtual {v7, v8, v9}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v7

    add-long/2addr v5, v7

    .line 38
    new-instance v7, Ljava/util/ArrayDeque;

    invoke-direct {v7}, Ljava/util/ArrayDeque;-><init>()V

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 39
    new-instance v9, Lcom/streambundle/v48/ResolveMedia$Target;

    const/4 v10, 0x0

    move-object/from16 v11, p1

    invoke-direct {v9, v0, v11, v10}, Lcom/streambundle/v48/ResolveMedia$Target;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v7, v9}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 40
    invoke-static/range {p1 .. p1}, Lcom/streambundle/v48/ResolveMedia;->tube(Ljava/lang/String;)Z

    move-result v9

    invoke-static/range {p1 .. p1}, Lcom/streambundle/v48/ResolveMedia;->hurt(Ljava/lang/String;)Z

    move-result v25

    .line 41
    const-string v0, "\u043d\u0435\u0442 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u043e\u0432 \u0432\u0438\u0434\u0435\u043e"

    move-object v10, v0

    :goto_43
    invoke-virtual {v7}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_352

    invoke-interface {v8}, Ljava/util/Set;->size()I

    move-result v0

    const/16 v11, 0xc

    if-ge v0, v11, :cond_352

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v11

    cmp-long v0, v11, v5

    if-gez v0, :cond_352

    .line 42
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_34c

    .line 43
    invoke-virtual {v7}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lcom/streambundle/v48/ResolveMedia$Target;

    .line 44
    iget-object v0, v11, Lcom/streambundle/v48/ResolveMedia$Target;->url:Ljava/lang/String;

    invoke-interface {v8, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_342

    iget v0, v11, Lcom/streambundle/v48/ResolveMedia$Target;->depth:I

    const/4 v12, 0x3

    if-gt v0, v12, :cond_342

    iget-object v0, v11, Lcom/streambundle/v48/ResolveMedia$Target;->url:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundle/v48/ResolveMedia;->unwanted(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_85

    move-object/from16 v19, v1

    move-wide/from16 v17, v5

    goto/16 :goto_346

    .line 45
    :cond_85
    if-eqz v9, :cond_97

    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    iget-object v12, v11, Lcom/streambundle/v48/ResolveMedia$Target;->url:Ljava/lang/String;

    invoke-virtual {v0, v12}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_97

    move-object/from16 v19, v1

    move-wide/from16 v17, v5

    goto/16 :goto_346

    .line 47
    :cond_97
    :try_start_97
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/Requests;->getBaseClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 48
    sget-object v12, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v13

    sub-long v13, v5, v13

    invoke-virtual {v12, v13, v14}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    const-wide/16 v14, 0x1

    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    const-wide/16 v14, 0xdac

    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    sget-object v14, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v12, v13, v14}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 47
    nop

    .line 49
    iget-object v12, v11, Lcom/streambundle/v48/ResolveMedia$Target;->url:Ljava/lang/String;

    invoke-static {v12}, Lcom/streambundle/v43/SiteAccess;->interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v12

    if-eqz v12, :cond_cd

    invoke-virtual {v0, v12}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 50
    :cond_cd
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 51
    new-instance v12, Lokhttp3/Request$Builder;

    invoke-direct {v12}, Lokhttp3/Request$Builder;-><init>()V

    iget-object v13, v11, Lcom/streambundle/v48/ResolveMedia$Target;->url:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v12

    invoke-virtual {v12, v4, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v12

    iget-object v13, v11, Lcom/streambundle/v48/ResolveMedia$Target;->ref:Ljava/lang/String;

    invoke-virtual {v12, v2, v13}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v12

    .line 52
    iget-object v13, v11, Lcom/streambundle/v48/ResolveMedia$Target;->url:Ljava/lang/String;

    invoke-static {v13}, Lcom/streambundle/v38/TubeSources;->playable(Ljava/lang/String;)Z

    move-result v13
    :try_end_ec
    .catch Ljava/io/IOException; {:try_start_97 .. :try_end_ec} :catch_333

    const-string v14, "Range"

    if-eqz v13, :cond_f5

    :try_start_f0
    const-string v15, "bytes=0-511"

    invoke-virtual {v12, v14, v15}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 53
    :cond_f5
    move/from16 v15, v25

    invoke-static {v0, v12, v15}, Lcom/streambundle/v48/HurtSexMedia;->fetch(Lokhttp3/OkHttpClient;Lokhttp3/Request$Builder;Z)Lokhttp3/Response;

    move-result-object v15
    :try_end_fb
    .catch Ljava/io/IOException; {:try_start_f0 .. :try_end_fb} :catch_333

    .line 55
    :try_start_fb
    invoke-virtual {v15}, Lokhttp3/Response;->isSuccessful()Z

    move-result v16
    :try_end_ff
    .catchall {:try_start_fb .. :try_end_ff} :catchall_328

    move-wide/from16 v17, v5

    const-string v5, "HTTP "

    if-eqz v16, :cond_2f3

    :try_start_105
    invoke-virtual {v15}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v6

    if-nez v6, :cond_110

    move-object/from16 v19, v1

    move-object v1, v5

    goto/16 :goto_2f6

    .line 56
    :cond_110
    invoke-virtual {v15}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundle/v48/ResolveMedia;->unwanted(Ljava/lang/String;)Z

    move-result v6
    :try_end_120
    .catchall {:try_start_105 .. :try_end_120} :catchall_2ef

    if-eqz v6, :cond_12e

    .line 89
    :try_start_122
    invoke-virtual {v15}, Lokhttp3/Response;->close()V
    :try_end_125
    .catch Ljava/io/IOException; {:try_start_122 .. :try_end_125} :catch_129

    .line 56
    move-object/from16 v19, v1

    goto/16 :goto_346

    .line 90
    :catch_129
    move-exception v0

    move-object/from16 v19, v1

    goto/16 :goto_338

    .line 57
    :cond_12e
    move-object/from16 p1, v5

    const-wide/16 v5, 0x200

    :try_start_132
    invoke-virtual {v15, v5, v6}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object v5

    .line 58
    invoke-static {v5}, Lcom/streambundle/v48/ResolveMedia;->validMedia([B)Z

    move-result v6

    if-eqz v6, :cond_189

    .line 59
    invoke-virtual {v15}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v20

    .line 60
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, v11, Lcom/streambundle/v48/ResolveMedia$Target;->ref:Ljava/lang/String;

    invoke-interface {v0, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    invoke-virtual {v15}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v6

    invoke-virtual {v6, v1}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_166

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    :cond_166
    new-instance v6, Ljava/lang/String;

    sget-object v10, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v6, v5, v10}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, "#EXTM3U"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v23

    .line 63
    iget-object v5, v11, Lcom/streambundle/v48/ResolveMedia$Target;->ref:Ljava/lang/String;

    const/16 v22, 0x0

    move-object/from16 v19, p0

    move-object/from16 v21, v5

    move-object/from16 v24, v0

    invoke-static/range {v19 .. v24}, Lcom/streambundle/v48/LinkFactory;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/util/Map;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    move-result-object v0
    :try_end_185
    .catchall {:try_start_132 .. :try_end_185} :catchall_2ef

    .line 89
    :try_start_185
    invoke-virtual {v15}, Lokhttp3/Response;->close()V
    :try_end_188
    .catch Ljava/io/IOException; {:try_start_185 .. :try_end_188} :catch_129

    .line 63
    return-object v0

    .line 66
    :cond_189
    if-eqz v13, :cond_1a6

    :try_start_18b
    invoke-virtual {v15}, Lokhttp3/Response;->code()I

    move-result v5

    const/16 v6, 0xce

    if-ne v5, v6, :cond_1a6

    invoke-virtual {v15}, Lokhttp3/Response;->close()V

    invoke-virtual {v12, v14}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v5

    invoke-virtual {v0, v5}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v15

    .line 67
    :cond_1a6
    invoke-virtual {v15}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_2d1

    invoke-virtual {v15}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    if-nez v0, :cond_1b6

    move-object/from16 v19, v1

    goto/16 :goto_2d3

    .line 68
    :cond_1b6
    const-wide/32 v5, 0x180000

    invoke-virtual {v15, v5, v6}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v5

    .line 69
    invoke-static {v0, v5}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v6

    .line 70
    new-instance v12, Ljava/util/LinkedHashSet;

    invoke-static {v6}, Lcom/streambundle/v38/TubeSources;->sources(Lorg/jsoup/nodes/Document;)Ljava/util/LinkedHashMap;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 71
    new-instance v13, Ljava/util/LinkedHashSet;

    invoke-static {v6}, Lcom/streambundle/v38/TubeSources;->embeds(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V
    :try_end_1e7
    .catchall {:try_start_18b .. :try_end_1e7} :catchall_2ef

    .line 73
    :try_start_1e7
    invoke-static {v0, v5}, Lcom/streambundleextra/MediaFix;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/MediaFix;->media(Lcom/streambundlehtml/nodes/Document;)V

    .line 74
    const-string v14, "source[src],video[src]"

    invoke-virtual {v0, v14}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v14

    invoke-virtual {v14}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1f8
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v16
    :try_end_1fc
    .catch Ljava/lang/RuntimeException; {:try_start_1e7 .. :try_end_1fc} :catch_239
    .catchall {:try_start_1e7 .. :try_end_1fc} :catchall_2ef

    move-object/from16 v19, v1

    const-string v1, "src"

    if-nez v16, :cond_221

    .line 75
    :try_start_202
    const-string v14, "iframe[src]"

    invoke-virtual {v0, v14}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_20c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_213

    .line 76
    goto :goto_23c

    .line 75
    :cond_213
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v14, v1}, Lcom/streambundlehtml/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_20c

    .line 74
    :cond_221
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 p1, v0

    move-object/from16 v0, v16

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    :try_end_232
    .catch Ljava/lang/RuntimeException; {:try_start_202 .. :try_end_232} :catch_237
    .catchall {:try_start_202 .. :try_end_232} :catchall_326

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    goto :goto_1f8

    .line 76
    :catch_237
    move-exception v0

    goto :goto_23c

    :catch_239
    move-exception v0

    move-object/from16 v19, v1

    .line 78
    :goto_23c
    :try_start_23c
    const-string v0, "jav.guru"

    invoke-static {v5}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_265

    .line 79
    invoke-static {v6}, Lcom/videobundle/fixes/SiteFix;->javEmbeds(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/util/LinkedHashSet;->addAll(Ljava/util/Collection;)Z

    .line 80
    invoke-static {v6}, Lcom/videobundle/fixes/SiteFix;->javNext(Lorg/jsoup/nodes/Document;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_265

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_265

    invoke-virtual {v13, v0}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    :try_end_262
    .catch Ljava/lang/RuntimeException; {:try_start_23c .. :try_end_262} :catch_263
    .catchall {:try_start_23c .. :try_end_262} :catchall_326

    goto :goto_264

    .line 82
    :catch_263
    move-exception v0

    :goto_264
    nop

    .line 84
    :cond_265
    const/4 v0, 0x1

    if-eqz v9, :cond_275

    :try_start_268
    invoke-virtual {v13}, Ljava/util/LinkedHashSet;->size()I

    move-result v1

    if-le v1, v0, :cond_275

    invoke-static {v5}, Lcom/streambundle/v38/TubeSources;->external(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v13, v1}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    .line 85
    :cond_275
    invoke-virtual {v13}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_279
    :goto_279
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_2b9

    .line 86
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 87
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    sub-int/2addr v6, v0

    :goto_289
    if-gez v6, :cond_29b

    .line 88
    const-string v0, "HTTP"

    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_296

    const-string v0, "\u043f\u043b\u0435\u0435\u0440 \u043d\u0435 \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u0442 \u0434\u043e\u0441\u0442\u0443\u043f\u043d\u043e\u0433\u043e \u0432\u0438\u0434\u0435\u043e\u043f\u043e\u0442\u043e\u043a\u0430"
    :try_end_295
    .catchall {:try_start_268 .. :try_end_295} :catchall_326

    .line 89
    move-object v10, v0

    :cond_296
    :try_start_296
    invoke-virtual {v15}, Lokhttp3/Response;->close()V
    :try_end_299
    .catch Ljava/io/IOException; {:try_start_296 .. :try_end_299} :catch_331

    .line 90
    goto/16 :goto_33c

    .line 87
    :cond_29b
    :try_start_29b
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    invoke-interface {v8, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2b6

    new-instance v12, Lcom/streambundle/v48/ResolveMedia$Target;

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    iget v14, v11, Lcom/streambundle/v48/ResolveMedia$Target;->depth:I

    add-int/2addr v14, v0

    invoke-direct {v12, v13, v5, v14}, Lcom/streambundle/v48/ResolveMedia$Target;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v7, v12}, Ljava/util/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    :cond_2b6
    add-int/lit8 v6, v6, -0x1

    goto :goto_289

    .line 85
    :cond_2b9
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v8, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_279

    new-instance v13, Lcom/streambundle/v48/ResolveMedia$Target;

    iget v14, v11, Lcom/streambundle/v48/ResolveMedia$Target;->depth:I

    add-int/2addr v14, v0

    invoke-direct {v13, v6, v5, v14}, Lcom/streambundle/v48/ResolveMedia$Target;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v7, v13}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    goto :goto_279

    .line 67
    :cond_2d1
    move-object/from16 v19, v1

    :goto_2d3
    new-instance v0, Ljava/lang/StringBuilder;

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Lokhttp3/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10
    :try_end_2e6
    .catchall {:try_start_29b .. :try_end_2e6} :catchall_326

    .line 89
    :try_start_2e6
    invoke-virtual {v15}, Lokhttp3/Response;->close()V
    :try_end_2e9
    .catch Ljava/io/IOException; {:try_start_2e6 .. :try_end_2e9} :catch_331

    .line 67
    move-wide/from16 v5, v17

    move-object/from16 v1, v19

    goto/16 :goto_43

    .line 89
    :catchall_2ef
    move-exception v0

    move-object/from16 v19, v1

    goto :goto_32d

    .line 55
    :cond_2f3
    move-object/from16 v19, v1

    move-object v1, v5

    :goto_2f6
    :try_start_2f6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Lokhttp3/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u043d\u0430 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v15}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10
    :try_end_31d
    .catchall {:try_start_2f6 .. :try_end_31d} :catchall_326

    .line 89
    :try_start_31d
    invoke-virtual {v15}, Lokhttp3/Response;->close()V

    .line 55
    move-wide/from16 v5, v17

    move-object/from16 v1, v19

    goto/16 :goto_43

    .line 89
    :catchall_326
    move-exception v0

    goto :goto_32d

    :catchall_328
    move-exception v0

    move-object/from16 v19, v1

    move-wide/from16 v17, v5

    :goto_32d
    invoke-virtual {v15}, Lokhttp3/Response;->close()V

    throw v0
    :try_end_331
    .catch Ljava/io/IOException; {:try_start_31d .. :try_end_331} :catch_331

    .line 90
    :catch_331
    move-exception v0

    goto :goto_338

    :catch_333
    move-exception v0

    move-object/from16 v19, v1

    move-wide/from16 v17, v5

    :goto_338
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    :goto_33c
    move-wide/from16 v5, v17

    move-object/from16 v1, v19

    goto/16 :goto_43

    .line 44
    :cond_342
    move-object/from16 v19, v1

    move-wide/from16 v17, v5

    .line 41
    :goto_346
    move-wide/from16 v5, v17

    move-object/from16 v1, v19

    goto/16 :goto_43

    .line 42
    :cond_34c
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 92
    :cond_352
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static/range {p0 .. p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". \u0412\u0438\u0434\u0435\u043e \u0443\u0434\u0430\u043b\u0435\u043d\u043e, \u0437\u0430\u043a\u0440\u044b\u0442\u043e \u0438\u043b\u0438 \u0441\u0435\u0440\u0432\u0435\u0440 \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_375
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u043d\u0435 \u043f\u0435\u0440\u0435\u0434\u0430\u043b \u0430\u0434\u0440\u0435\u0441 \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u044b \u0432\u0438\u0434\u0435\u043e"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static tube(Ljava/lang/String;)Z
    .registers 3

    .line 19
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    const-string v1, "tubesafari.com"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    const-string v1, "www.tubesafari.com"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_17} :catch_1c

    if-nez p0, :cond_1a

    return v0

    :cond_1a
    const/4 p0, 0x1

    return p0

    :catch_1c
    move-exception p0

    return v0
.end method

.method public static unwanted(Ljava/lang/String;)Z
    .registers 10

    .line 22
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_8

    return v0

    :cond_8
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 23
    const-string v7, "test-videos.co.uk"

    const-string v8, "sample-videos.com"

    const-string v1, "googletagmanager.com"

    const-string v2, "doubleclick.net"

    const-string v3, "exoclick.com"

    const-string v4, "tsyndicate.com"

    const-string v5, "mayzaent.com"

    const-string v6, "greentrafsa.com"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_28
    const/16 v4, 0x8

    if-lt v3, v4, :cond_2d

    .line 25
    return v2

    .line 23
    :cond_2d
    aget-object v4, v1, v3

    .line 24
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4e

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "."

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4b

    goto :goto_4e

    .line 23
    :cond_4b
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    .line 24
    :cond_4e
    :goto_4e
    return v0
.end method

.method public static validMedia([B)Z
    .registers 6

    .line 28
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-ge v0, v2, :cond_6

    return v1

    .line 29
    :cond_6
    new-instance v0, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 30
    const-string v3, "#EXTM3U"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v3, 0x1

    if-nez v0, :cond_68

    array-length v0, p0

    const/16 v4, 0x8

    if-lt v0, v4, :cond_3a

    aget-byte v0, p0, v2

    const/16 v2, 0x66

    if-ne v0, v2, :cond_3a

    const/4 v0, 0x5

    aget-byte v0, p0, v0

    const/16 v2, 0x74

    if-ne v0, v2, :cond_3a

    const/4 v0, 0x6

    aget-byte v0, p0, v0

    const/16 v2, 0x79

    if-ne v0, v2, :cond_3a

    const/4 v0, 0x7

    aget-byte v0, p0, v0

    const/16 v2, 0x70

    if-eq v0, v2, :cond_68

    .line 31
    :cond_3a
    aget-byte v0, p0, v1

    const/16 v2, 0x1a

    if-ne v0, v2, :cond_58

    aget-byte v0, p0, v3

    const/16 v2, 0x45

    if-ne v0, v2, :cond_58

    const/4 v0, 0x2

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v2, 0xdf

    if-ne v0, v2, :cond_58

    const/4 v0, 0x3

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v2, 0xa3

    if-eq v0, v2, :cond_68

    .line 32
    :cond_58
    array-length v0, p0

    const/16 v2, 0xbc

    if-le v0, v2, :cond_67

    aget-byte v0, p0, v1

    const/16 v4, 0x47

    if-ne v0, v4, :cond_67

    aget-byte p0, p0, v2

    if-eq p0, v4, :cond_68

    .line 30
    :cond_67
    return v1

    :cond_68
    return v3
.end method
