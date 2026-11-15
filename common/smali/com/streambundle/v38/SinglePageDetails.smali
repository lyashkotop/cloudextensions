.class final Lcom/streambundle/v38/SinglePageDetails;
.super Ljava/lang/Object;
.source "SinglePageDetails.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fetch(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MainAPI;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 39
    move-object/from16 v1, p0

    move-object/from16 v5, p1

    invoke-static/range {p1 .. p1}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v8

    .line 40
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, v5}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    .line 41
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_179

    .line 42
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/Requests;->getBaseClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v3

    const-wide/16 v6, 0xdac

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v6, v7, v4}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v3

    .line 45
    :try_start_33
    invoke-static/range {p1 .. p1}, Lcom/streambundle/v43/SiteAccess;->interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v4

    .line 46
    if-eqz v4, :cond_4b

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->interceptors()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b

    invoke-virtual {v3, v4}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;
    :try_end_46
    .catch Ljava/lang/RuntimeException; {:try_start_33 .. :try_end_46} :catch_49
    .catch Ljava/lang/LinkageError; {:try_start_33 .. :try_end_46} :catch_47

    goto :goto_4a

    .line 47
    :catch_47
    move-exception v0

    goto :goto_4a

    :catch_49
    move-exception v0

    :goto_4a
    nop

    .line 48
    :cond_4b
    const/4 v12, 0x0

    :try_start_4c
    invoke-virtual {v3}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v0, v2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v13
    :try_end_5c
    .catchall {:try_start_4c .. :try_end_5c} :catchall_16e

    .line 49
    :try_start_5c
    invoke-virtual {v13}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_160

    invoke-virtual {v13}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    if-nez v0, :cond_6a

    goto/16 :goto_160

    .line 50
    :cond_6a
    invoke-virtual {v13}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    .line 51
    invoke-static/range {p1 .. p1}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_82
    .catchall {:try_start_5c .. :try_end_82} :catchall_166

    if-nez v2, :cond_8a

    .line 85
    if-eqz v13, :cond_89

    :try_start_86
    invoke-virtual {v13}, Lokhttp3/Response;->close()V
    :try_end_89
    .catchall {:try_start_86 .. :try_end_89} :catchall_16e

    .line 51
    :cond_89
    return-object v12

    .line 52
    :cond_8a
    const-wide/32 v2, 0x1b7740

    :try_start_8d
    invoke-virtual {v13, v2, v3}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v2

    .line 53
    invoke-virtual {v2}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object v3

    const-string v4, "(?is).*(?:site unavailable|access denied|just a moment|error [45][0-9][0-9]).*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_15a

    .line 54
    const-string v3, "#challenge-form,#cf-error-details"

    invoke-virtual {v2, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_af

    goto/16 :goto_15a

    .line 55
    :cond_af
    const/4 v3, 0x3

    new-array v4, v3, [Ljava/lang/String;

    const-string v6, "meta[property=og:title]"

    const/4 v7, 0x0

    aput-object v6, v4, v7

    const-string v6, "h1"

    const/4 v9, 0x1

    aput-object v6, v4, v9

    const-string v6, "title"

    const/4 v10, 0x2

    aput-object v6, v4, v10

    invoke-static {v2, v4}, Lcom/streambundle/v38/SinglePageDetails;->text(Lorg/jsoup/nodes/Document;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 56
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6
    :try_end_c9
    .catchall {:try_start_8d .. :try_end_c9} :catchall_166

    if-eqz v6, :cond_d1

    .line 85
    if-eqz v13, :cond_d0

    :try_start_cd
    invoke-virtual {v13}, Lokhttp3/Response;->close()V
    :try_end_d0
    .catchall {:try_start_cd .. :try_end_d0} :catchall_16e

    .line 56
    :cond_d0
    return-object v12

    .line 57
    :cond_d1
    :try_start_d1
    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {p1 .. p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f0

    .line 58
    const-string v0, "meta[property=og:type][content^=video], video, #player, .video-player"

    invoke-virtual {v2, v0}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0
    :try_end_e5
    .catchall {:try_start_d1 .. :try_end_e5} :catchall_166

    if-nez v0, :cond_ed

    .line 85
    if-eqz v13, :cond_ec

    :try_start_e9
    invoke-virtual {v13}, Lokhttp3/Response;->close()V
    :try_end_ec
    .catchall {:try_start_e9 .. :try_end_ec} :catchall_16e

    .line 58
    :cond_ec
    return-object v12

    .line 59
    :cond_ed
    :try_start_ed
    invoke-virtual {v2, v5}, Lorg/jsoup/nodes/Document;->setBaseUri(Ljava/lang/String;)V

    .line 61
    :cond_f0
    invoke-static {v2, v9}, Lcom/streambundle/v38/DetailMetadata;->collectVideo(Lorg/jsoup/nodes/Document;Z)V

    .line 62
    invoke-static {v2}, Lcom/streambundle/v38/SinglePageDetails;->image(Lorg/jsoup/nodes/Document;)Ljava/lang/String;

    move-result-object v0

    .line 63
    invoke-static {v1, v2, v5}, Lcom/streambundle/v38/SinglePageDetails;->related(Lcom/lagradost/cloudstream3/MainAPI;Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/util/List;

    move-result-object v11

    .line 64
    invoke-static/range {p1 .. p1}, Lcom/streambundleextra/VideoMetadata;->cached(Ljava/lang/String;)J

    move-result-wide v14

    .line 65
    const-wide/16 v16, 0x0

    cmp-long v6, v14, v16

    if-gtz v6, :cond_12e

    .line 66
    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/String;

    const-string v14, "meta[property=video:duration]"

    aput-object v14, v6, v7

    const-string v7, "meta[property=og:video:duration]"

    aput-object v7, v6, v9

    const-string v7, "[itemprop=duration]"

    aput-object v7, v6, v10

    const-string v7, ".video-duration"

    aput-object v7, v6, v3

    const-string v3, ".duration"

    const/4 v7, 0x4

    aput-object v3, v6, v7

    invoke-static {v2, v6}, Lcom/streambundle/v38/SinglePageDetails;->text(Lorg/jsoup/nodes/Document;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundleextra/VideoMetadata;->seconds(Ljava/lang/String;)J

    move-result-wide v2

    .line 67
    cmp-long v6, v2, v16

    if-lez v6, :cond_12c

    invoke-static {v5, v2, v3}, Lcom/streambundleextra/VideoMetadata;->remember(Ljava/lang/String;J)V

    .line 68
    :cond_12c
    move-wide v9, v2

    goto :goto_12f

    .line 65
    :cond_12e
    move-wide v9, v14

    .line 70
    :goto_12f
    nop

    .line 71
    instance-of v2, v1, Lcom/streambundleextra/VideoBundleSite;

    if-eqz v2, :cond_137

    sget-object v2, Lcom/lagradost/cloudstream3/TvType;->Movie:Lcom/lagradost/cloudstream3/TvType;

    goto :goto_139

    :cond_137
    sget-object v2, Lcom/lagradost/cloudstream3/TvType;->NSFW:Lcom/lagradost/cloudstream3/TvType;

    :goto_139
    move-object v14, v2

    .line 72
    invoke-static {v4, v5}, Lcom/streambundle/v38/DetailMetadata;->listingTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v15, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;

    move-object v6, v15

    move-object v7, v0

    invoke-direct/range {v6 .. v11}, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Ljava/util/Map;JLjava/util/List;)V

    .line 84
    nop

    .line 72
    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move-object v4, v14

    move-object/from16 v5, p1

    move-object v6, v15

    move-object/from16 v7, p2

    invoke-static/range {v1 .. v7}, Lcom/lagradost/cloudstream3/MainAPIKt;->newMovieLoadResponse(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;Ljava/lang/String;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0
    :try_end_154
    .catchall {:try_start_ed .. :try_end_154} :catchall_166

    .line 85
    if-eqz v13, :cond_159

    :try_start_156
    invoke-virtual {v13}, Lokhttp3/Response;->close()V

    .line 72
    :cond_159
    return-object v0

    .line 85
    :cond_15a
    :goto_15a
    if-eqz v13, :cond_15f

    invoke-virtual {v13}, Lokhttp3/Response;->close()V

    .line 54
    :cond_15f
    return-object v12

    .line 85
    :cond_160
    :goto_160
    if-eqz v13, :cond_165

    invoke-virtual {v13}, Lokhttp3/Response;->close()V

    .line 49
    :cond_165
    return-object v12

    .line 72
    :catchall_166
    move-exception v0

    move-object v12, v0

    .line 85
    if-eqz v13, :cond_16d

    invoke-virtual {v13}, Lokhttp3/Response;->close()V

    :cond_16d
    throw v12
    :try_end_16e
    .catchall {:try_start_156 .. :try_end_16e} :catchall_16e

    :catchall_16e
    move-exception v0

    if-eqz v12, :cond_177

    if-eq v12, v0, :cond_178

    invoke-virtual {v12, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_178

    :cond_177
    move-object v12, v0

    :cond_178
    :goto_178
    throw v12

    .line 41
    :cond_179
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v4, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto/16 :goto_19
.end method

.method private static image(Lorg/jsoup/nodes/Document;)Ljava/lang/String;
    .registers 4

    .line 99
    const-string v0, "meta[name=twitter:image]"

    const-string v1, "meta[itemprop=thumbnailUrl]"

    const-string v2, "meta[property=og:image]"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/streambundle/v38/SinglePageDetails;->text(Lorg/jsoup/nodes/Document;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 101
    const-string v1, "video[poster]"

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 102
    if-eqz v1, :cond_22

    const-string v0, "poster"

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 104
    :cond_22
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/String;Ljava/util/Map;JLjava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    .line 73
    check-cast p5, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    .line 74
    invoke-static {p0}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result p6

    if-eqz p6, :cond_16

    .line 75
    invoke-virtual {p5, p0}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 76
    invoke-virtual {p5, p0}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setBackgroundPosterUrl(Ljava/lang/String;)V

    .line 77
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {p5, p0}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterHeaders(Ljava/util/Map;)V

    .line 79
    :cond_16
    const-wide/16 p0, 0x0

    cmp-long p0, p2, p0

    if-lez p0, :cond_32

    long-to-double p0, p2

    const-wide/high16 p2, 0x404e000000000000L    # 60.0

    div-double/2addr p0, p2

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    const-wide/16 p2, 0x1

    invoke-static {p2, p3, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    long-to-int p0, p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p5, p0}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setDuration(Ljava/lang/Integer;)V

    .line 80
    :cond_32
    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_40

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p5, p0}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setRecommendations(Ljava/util/List;)V

    .line 81
    :cond_40
    invoke-static {p5}, Lcom/streambundle/v38/DetailMetadata;->enrich(Ljava/lang/Object;)V

    .line 82
    invoke-static {p5}, Lcom/streambundle/v38/SearchAndPosters;->reusePoster(Ljava/lang/Object;)V

    .line 83
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static synthetic lambda$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 125
    check-cast p2, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    .line 126
    invoke-static {p0}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 127
    invoke-virtual {p2, p0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 128
    const-string v0, "Referer"

    invoke-static {p1, p0}, Lcom/streambundle/v38/PosterSupport;->referer(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterHeaders(Ljava/util/Map;)V

    .line 130
    :cond_18
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static related(Lcom/lagradost/cloudstream3/MainAPI;Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MainAPI;",
            "Lorg/jsoup/nodes/Document;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/MovieSearchResponse;",
            ">;"
        }
    .end annotation

    .line 108
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 109
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 110
    invoke-static {p2}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 111
    const-string v2, "#related-videos a[href],.related a[href],.recommendations a[href],.related-videos a[href],.video-related a[href]"

    invoke-virtual {p1, v2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1b
    :goto_1b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_23

    goto/16 :goto_c5

    :cond_23
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 112
    const-string v4, "href"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 113
    invoke-static {v7}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v4

    .line 114
    if-eqz v4, :cond_1b

    invoke-static {p2}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v7}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 115
    invoke-virtual {v4}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v4

    const-string v5, "(?i)^/(?:videos?|watch|view|play)/[^/]+.*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 116
    invoke-static {v7}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5a

    goto :goto_1b

    .line 117
    :cond_5a
    const-string v4, "img"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    .line 118
    const-string v5, "title"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 119
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_7c

    if-eqz v4, :cond_7c

    const-string v5, "alt"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 120
    :cond_7c
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_8c

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    move-object v6, v4

    goto :goto_8d

    :cond_8c
    move-object v6, v5

    .line 121
    :goto_8d
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_94

    goto :goto_1b

    .line 122
    :cond_94
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/streambundle/v38/PosterSupport;->picture(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 123
    instance-of v4, p0, Lcom/streambundleextra/VideoBundleSite;

    if-eqz v4, :cond_a3

    sget-object v4, Lcom/lagradost/cloudstream3/TvType;->Movie:Lcom/lagradost/cloudstream3/TvType;

    goto :goto_a5

    :cond_a3
    sget-object v4, Lcom/lagradost/cloudstream3/TvType;->NSFW:Lcom/lagradost/cloudstream3/TvType;

    :goto_a5
    move-object v8, v4

    .line 124
    new-instance v10, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda1;

    invoke-direct {v10, v3, p2}, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    nop

    .line 124
    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v5, p0

    invoke-static/range {v5 .. v12}, Lcom/streambundle/v38/DetailMetadata;->searchCard(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;

    move-result-object v3

    .line 132
    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->blocked(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_bd

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    :cond_bd
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0x12

    if-ne v3, v4, :cond_1b

    .line 135
    :goto_c5
    return-object v0
.end method

.method static supports(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;)Z
    .registers 11

    .line 27
    invoke-static {p1}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    .line 28
    const/4 v1, 0x0

    if-eqz v0, :cond_91

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_f

    goto/16 :goto_91

    .line 29
    :cond_f
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/MainAPI;->getMainUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 30
    invoke-static {p1}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_22

    return v1

    .line 31
    :cond_22
    const-string v7, "huyamba.name"

    const-string v8, "huyamba.mobi"

    const-string v3, "bdsmx.tube"

    const-string v4, "erome.com"

    const-string v5, "semyana.com"

    const-string v6, "strip2.co"

    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_90

    .line 32
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    const-string v3, ".semyana.com"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_90

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    const-string v3, ".strip2.co"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_90

    .line 33
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    const-string v3, ".huyamba.name"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_90

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    const-string v0, ".huyamba.mobi"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6d

    goto :goto_90

    .line 34
    :cond_6d
    instance-of p1, p0, Lcom/streambundleextra/VideoBundleSite;

    if-nez p1, :cond_8e

    instance-of p0, p0, Lcom/example/websites/WebVideoProvider;

    if-nez p0, :cond_8e

    .line 35
    const-string p0, "tubesafari.com"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8e

    const-string p0, "epawg.com"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8e

    const-string p0, "1ebalka.ru.actor"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8e

    .line 34
    return v1

    :cond_8e
    const/4 p0, 0x1

    return p0

    .line 33
    :cond_90
    :goto_90
    return v1

    .line 28
    :cond_91
    :goto_91
    return v1
.end method

.method private static varargs text(Lorg/jsoup/nodes/Document;[Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 89
    array-length v0, p1

    const/4 v1, 0x0

    :goto_2
    if-lt v1, v0, :cond_7

    .line 95
    const-string p0, ""

    return-object p0

    .line 89
    :cond_7
    aget-object v2, p1, v1

    .line 90
    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    .line 91
    if-nez v2, :cond_10

    goto :goto_2c

    .line 92
    :cond_10
    const-string v3, "content"

    invoke-virtual {v2, v3}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1d

    invoke-virtual {v2, v3}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_21

    :cond_1d
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v2

    :goto_21
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 93
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2c

    return-object v2

    .line 89
    :cond_2c
    :goto_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method
