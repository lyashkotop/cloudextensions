.class public final Lcom/streambundle/v38/PunishSearch;
.super Ljava/lang/Object;
.source "PunishSearch.java"


# static fields
.field private static final IO:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 21
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    new-instance v6, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v6}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    new-instance v7, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda0;

    invoke-direct {v7}, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda0;-><init>()V

    .line 21
    const/4 v1, 0x0

    const/4 v2, 0x3

    const-wide/16 v3, 0x14

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v8, Lcom/streambundle/v38/PunishSearch;->IO:Ljava/util/concurrent/ExecutorService;

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
    sget-object v0, Lcom/streambundle/v38/PunishSearch;->IO:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 63
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/PunishSearch;->fallback(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static cards(Lcom/lagradost/cloudstream3/MainAPI;Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MainAPI;",
            "Lorg/jsoup/nodes/Document;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;"
        }
    .end annotation

    .line 106
    if-nez p1, :cond_7

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 107
    :cond_7
    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->document(Ljava/lang/Object;)V

    .line 108
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->outerHtml()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/streambundleextra/MediaFix;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/MediaFix;->searchDocument(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 109
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 110
    const-string v2, "article a[href][title]"

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_30

    .line 122
    return-object v1

    .line 110
    :cond_30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 111
    const-string v3, "href"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 112
    invoke-static {v6}, Lcom/streambundle/v38/PunishSearch;->isPunish(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_43

    goto :goto_29

    .line 113
    :cond_43
    const-string v3, "img"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    .line 114
    if-nez v3, :cond_4e

    const-string v3, ""

    goto :goto_54

    :cond_4e
    const-string v4, "src"

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 115
    :goto_54
    const-string v4, "title"

    invoke-virtual {v2, v4}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lcom/lagradost/cloudstream3/TvType;->NSFW:Lcom/lagradost/cloudstream3/TvType;

    .line 116
    new-instance v9, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;

    invoke-direct {v9, v3, v6, p1}, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/nodes/Document;)V

    .line 120
    nop

    .line 115
    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v4, p0

    invoke-static/range {v4 .. v11}, Lcom/streambundle/v38/DetailMetadata;->searchCard(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_29
.end method

.method private static fallback(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MainAPI;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0xc80

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 65
    const-string v2, "/"

    invoke-static {p1, v2}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 66
    const-string v3, "UTF-8"

    invoke-static {p2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "+"

    const-string v5, "%20"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 67
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "search/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/streambundle/v38/ExtraPlayer;->request(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    .line 68
    invoke-static {v2, v0, v1}, Lcom/streambundle/v38/PunishSearch;->fetch(Lokhttp3/Request;J)Lorg/jsoup/nodes/Document;

    move-result-object v2

    .line 69
    if-eqz v2, :cond_63

    invoke-virtual {v2}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "search"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_63

    .line 70
    invoke-static {p0, v2}, Lcom/streambundle/v38/PunishSearch;->cards(Lcom/lagradost/cloudstream3/MainAPI;Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v2

    goto :goto_67

    :cond_63
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 69
    :goto_67
    nop

    .line 71
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6f

    return-object v2

    .line 75
    :cond_6f
    invoke-static {p1, p1}, Lcom/streambundle/v38/ExtraPlayer;->request(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    invoke-static {v3, v0, v1}, Lcom/streambundle/v38/PunishSearch;->fetch(Lokhttp3/Request;J)Lorg/jsoup/nodes/Document;

    move-result-object v3

    .line 76
    if-nez v3, :cond_7e

    return-object v2

    .line 77
    :cond_7e
    const-string v4, "form"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_88
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_8f

    .line 93
    return-object v2

    .line 77
    :cond_8f
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Element;

    .line 78
    const-string v6, "input[type=search][name], input[name=q], input[name=query], input[name=search]"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    .line 79
    if-nez v6, :cond_9e

    goto :goto_88

    .line 80
    :cond_9e
    invoke-virtual {v3}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v7

    const-string v8, "action"

    invoke-virtual {v5, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 81
    invoke-static {v7}, Lcom/streambundle/v38/PunishSearch;->isPunish(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_b3

    goto :goto_88

    .line 82
    :cond_b3
    invoke-static {v7}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v2

    .line 83
    new-instance v3, Lokhttp3/FormBody$Builder;

    invoke-direct {v3}, Lokhttp3/FormBody$Builder;-><init>()V

    .line 84
    const-string v4, "method"

    invoke-virtual {v5, v4}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v7, "post"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    .line 85
    const-string v7, "input[type=hidden][name]"

    invoke-virtual {v5, v7}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_d6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const-string v8, "name"

    if-nez v7, :cond_118

    .line 88
    invoke-virtual {v2}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/streambundle/v38/ExtraPlayer;->request(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 89
    if-eqz v4, :cond_fc

    invoke-virtual {v6, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2, p2}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/FormBody$Builder;->build()Lokhttp3/FormBody;

    move-result-object p2

    invoke-virtual {p1, p2}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    goto :goto_10b

    .line 90
    :cond_fc
    invoke-virtual {v6, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, p2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object p2

    invoke-virtual {p1, p2}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    .line 91
    :goto_10b
    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    invoke-static {p1, v0, v1}, Lcom/streambundle/v38/PunishSearch;->fetch(Lokhttp3/Request;J)Lorg/jsoup/nodes/Document;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/streambundle/v38/PunishSearch;->cards(Lcom/lagradost/cloudstream3/MainAPI;Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 85
    :cond_118
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jsoup/nodes/Element;

    .line 86
    const-string v9, "value"

    if-eqz v4, :cond_12e

    invoke-virtual {v7, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v8, v7}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    goto :goto_d6

    .line 87
    :cond_12e
    invoke-virtual {v7, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v8, v7}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    goto :goto_d6
.end method

.method private static fetch(Lokhttp3/Request;J)Lorg/jsoup/nodes/Document;
    .registers 7

    .line 97
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    sub-long/2addr p1, v1

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    .line 98
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    const/4 v1, 0x0

    if-gtz v0, :cond_13

    return-object v1

    .line 99
    :cond_13
    :try_start_13
    invoke-virtual {p0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v2, 0x514

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    invoke-static {v0, p1, p2}, Lcom/streambundle/v38/ExtraPlayer;->client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;

    move-result-object p1

    invoke-virtual {p1, p0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p0
    :try_end_2d
    .catchall {:try_start_13 .. :try_end_2d} :catchall_7c

    .line 100
    :try_start_2d
    invoke-virtual {p0}, Lokhttp3/Response;->isSuccessful()Z

    move-result p1

    if-eqz p1, :cond_6d

    invoke-virtual {p0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    if-eqz p1, :cond_6d

    invoke-virtual {p0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/streambundle/v38/PunishSearch;->isPunish(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4c

    goto :goto_6d

    .line 101
    :cond_4c
    const-wide/32 p1, 0x180000

    invoke-virtual {p0, p1, p2}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p1
    :try_end_67
    .catchall {:try_start_2d .. :try_end_67} :catchall_73

    .line 102
    if-eqz p0, :cond_6c

    :try_start_69
    invoke-virtual {p0}, Lokhttp3/Response;->close()V

    .line 101
    :cond_6c
    return-object p1

    .line 102
    :cond_6d
    :goto_6d
    if-eqz p0, :cond_72

    invoke-virtual {p0}, Lokhttp3/Response;->close()V
    :try_end_72
    .catchall {:try_start_69 .. :try_end_72} :catchall_7c

    .line 100
    :cond_72
    return-object v1

    .line 101
    :catchall_73
    move-exception p1

    .line 102
    if-eqz p0, :cond_79

    :try_start_76
    invoke-virtual {p0}, Lokhttp3/Response;->close()V

    :cond_79
    throw p1
    :try_end_7a
    .catchall {:try_start_76 .. :try_end_7a} :catchall_7a

    :catchall_7a
    move-exception p0

    goto :goto_7e

    :catchall_7c
    move-exception p0

    move-object p1, v1

    :goto_7e
    if-eqz p1, :cond_86

    if-eq p1, p0, :cond_85

    :try_start_82
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_85
    move-object p0, p1

    :cond_86
    throw p0
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_82 .. :try_end_87} :catch_87

    :catch_87
    move-exception p0

    return-object v1
.end method

.method private static isPunish(Ljava/lang/String;)Z
    .registers 3

    .line 59
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    .line 60
    if-eqz p0, :cond_20

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v1, "punishbang.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    const-string v0, ".punishbang.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_20

    :cond_1e
    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 23
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "punishbang-search"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 24
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 25
    return-object v0
.end method

.method static synthetic lambda$1(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/nodes/Document;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;
    .registers 5

    .line 117
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9

    invoke-virtual {p3, p0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 118
    :cond_9
    invoke-virtual {p2}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/streambundle/v38/PunishSearch;->posterHeaders(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {p3, p0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterHeaders(Ljava/util/Map;)V

    .line 119
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static posterHeaders(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 126
    invoke-static {p0}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    .line 127
    const-string v0, "Referer"

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    return-object p0
.end method

.method public static run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 31
    const-string v0, "MainUrl"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 32
    invoke-static {v5}, Lcom/streambundle/v38/PunishSearch;->isPunish(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3e

    if-eqz p1, :cond_3e

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1d

    goto :goto_3e

    .line 35
    :cond_1d
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-direct {v0, p2}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 36
    new-instance v7, Lcom/streambundle/v38/PunishSearch$1;

    move-object v1, v7

    move-object v2, p2

    move-object v3, v0

    move-object v4, p0

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/streambundle/v38/PunishSearch$1;-><init>(Lkotlin/coroutines/Continuation;Lkotlin/coroutines/SafeContinuation;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    invoke-static {p0, p1, v7}, Lcom/streambundle/v38/BundleSearch;->run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    .line 54
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-eq p0, p1, :cond_39

    invoke-interface {v7, p0}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 55
    :cond_39
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 33
    :cond_3e
    :goto_3e
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/BundleSearch;->run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
