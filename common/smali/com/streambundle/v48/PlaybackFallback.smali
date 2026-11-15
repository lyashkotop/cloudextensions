.class final Lcom/streambundle/v48/PlaybackFallback;
.super Ljava/lang/Object;
.source "PlaybackFallback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v48/PlaybackFallback$Target;
    }
.end annotation


# static fields
.field private static final BODY_LIMIT:I = 0x180000

.field private static final MAX_LINKS:I = 0x6

.field private static final MAX_VISITS:I = 0x10


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static collect(Ljava/util/Deque;Lcom/streambundle/v48/PlaybackFallback$Target;Ljava/lang/String;Ljava/lang/String;)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Deque<",
            "Lcom/streambundle/v48/PlaybackFallback$Target;",
            ">;",
            "Lcom/streambundle/v48/PlaybackFallback$Target;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 99
    move-object v1, p0

    move-object v2, p1

    move-object/from16 v9, p2

    move-object/from16 v3, p3

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1e2

    iget v0, v2, Lcom/streambundle/v48/PlaybackFallback$Target;->depth:I

    const/4 v4, 0x4

    if-lt v0, v4, :cond_13

    goto/16 :goto_1e2

    .line 100
    :cond_13
    invoke-static {v3, v9}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v4

    .line 101
    new-instance v10, Ljava/util/LinkedHashSet;

    invoke-direct {v10}, Ljava/util/LinkedHashSet;-><init>()V

    .line 103
    :try_start_1c
    invoke-static {v4}, Lcom/streambundle/v38/TubeSources;->embeds(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/LinkedHashSet;->addAll(Ljava/util/Collection;)Z
    :try_end_23
    .catch Ljava/lang/RuntimeException; {:try_start_1c .. :try_end_23} :catch_24

    goto :goto_25

    .line 104
    :catch_24
    move-exception v0

    :goto_25
    nop

    .line 107
    invoke-static {v4}, Lcom/streambundle/v38/TubeSources;->sources(Lorg/jsoup/nodes/Document;)Ljava/util/LinkedHashMap;

    move-result-object v5

    .line 108
    const-string v0, "video[src], video[data-src], video source[src], video source[data-src], source[type^=video][src]"

    invoke-virtual {v4, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_34
    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const-string v7, "src"

    const-string v8, "data-src"

    if-nez v6, :cond_1a3

    .line 116
    const-string v0, "iframe[src], iframe[data-src], iframe[data-lazy-src], [data-embed-url], [data-player-url]"

    invoke-virtual {v4, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_48
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_163

    .line 128
    :try_start_4e
    invoke-static {v3, v9}, Lcom/streambundleextra/MediaFix;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 129
    invoke-static {v0}, Lcom/streambundleextra/MediaFix;->media(Lcom/streambundlehtml/nodes/Document;)V

    .line 130
    const-string v3, "source[src],video[src]"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v3

    invoke-virtual {v3}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5f
    :goto_5f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_66

    .line 136
    goto :goto_a0

    .line 130
    :cond_66
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/nodes/Element;

    .line 131
    invoke-virtual {v6, v7}, Lcom/streambundlehtml/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 132
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_77

    goto :goto_5f

    .line 133
    :cond_77
    invoke-static {v6, v0}, Lcom/streambundleextra/MediaFix;->quality(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)I

    move-result v8

    .line 134
    if-gtz v8, :cond_83

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_5f

    :cond_83
    if-lez v8, :cond_99

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v11, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "p"

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_9b

    :cond_99
    const-string v8, ""

    :goto_9b
    invoke-interface {v5, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9e
    .catch Ljava/lang/RuntimeException; {:try_start_4e .. :try_end_9e} :catch_9f

    goto :goto_5f

    .line 136
    :catch_9f
    move-exception v0

    .line 139
    :goto_a0
    invoke-static/range {p2 .. p2}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v3, "jav.guru"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c6

    .line 140
    invoke-static {v4}, Lcom/videobundle/fixes/SiteFix;->javEmbeds(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/LinkedHashSet;->addAll(Ljava/util/Collection;)Z

    .line 141
    invoke-static {v4}, Lcom/videobundle/fixes/SiteFix;->javNext(Lorg/jsoup/nodes/Document;)Ljava/lang/String;

    move-result-object v0

    .line 142
    if-eqz v0, :cond_c6

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_c6

    invoke-virtual {v10, v0}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 144
    :cond_c6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 145
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_d3
    :goto_d3
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_129

    .line 151
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0xc

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    :goto_e5
    if-gez v3, :cond_11d

    .line 152
    invoke-virtual {v10}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_eb
    :goto_eb
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_f2

    goto :goto_101

    :cond_f2
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    .line 153
    invoke-interface {p0}, Ljava/util/Deque;->size()I

    move-result v0

    const/16 v3, 0x1c

    if-lt v0, v3, :cond_102

    .line 156
    :goto_101
    return-void

    .line 154
    :cond_102
    invoke-static {v4}, Lcom/streambundle/v38/TubeSources;->excluded(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_eb

    new-instance v0, Lcom/streambundle/v48/PlaybackFallback$Target;

    iget v3, v2, Lcom/streambundle/v48/PlaybackFallback$Target;->depth:I

    add-int/lit8 v6, v3, 0x1

    const/4 v7, 0x0

    invoke-static {v4}, Lcom/streambundle/v38/TubeSources;->playable(Ljava/lang/String;)Z

    move-result v8

    move-object v3, v0

    move-object/from16 v5, p2

    invoke-direct/range {v3 .. v8}, Lcom/streambundle/v48/PlaybackFallback$Target;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-interface {p0, v0}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    goto :goto_eb

    .line 151
    :cond_11d
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundle/v48/PlaybackFallback$Target;

    invoke-interface {p0, v4}, Ljava/util/Deque;->addFirst(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, -0x1

    goto :goto_e5

    .line 145
    :cond_129
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 146
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/streambundle/v38/TubeSources;->excluded(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_d3

    .line 147
    new-instance v12, Lcom/streambundle/v48/PlaybackFallback$Target;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget v5, v2, Lcom/streambundle/v48/PlaybackFallback$Target;->depth:I

    add-int/lit8 v6, v5, 0x1

    .line 148
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v5, v3}, Lcom/streambundle/v48/PlaybackLinks;->height(Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    move-object v3, v12

    move-object/from16 v5, p2

    invoke-direct/range {v3 .. v8}, Lcom/streambundle/v48/PlaybackFallback$Target;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    .line 147
    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d3

    .line 116
    :cond_163
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lorg/jsoup/nodes/Element;

    .line 117
    const-string v0, "data-embed-url"

    const-string v12, "data-player-url"

    const-string v13, "data-lazy-src"

    filled-new-array {v8, v7, v13, v0, v12}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_17c
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_184

    goto/16 :goto_48

    :cond_184
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 118
    invoke-virtual {v11, v0}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_17c

    .line 119
    invoke-virtual {v11, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v0}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_17c

    .line 121
    invoke-virtual {v10, v0}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 122
    goto/16 :goto_48

    .line 108
    :cond_1a3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/nodes/Element;

    .line 109
    invoke-virtual {v6, v8}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1b4

    invoke-virtual {v6, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_1b8

    :cond_1b4
    invoke-virtual {v6, v7}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 110
    :goto_1b8
    invoke-static {v9, v7}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 111
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_34

    .line 112
    const-string v8, "data-quality"

    invoke-virtual {v6, v8}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1cb

    goto :goto_1cd

    :cond_1cb
    const-string v8, "label"

    :goto_1cd
    invoke-virtual {v6, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 113
    invoke-interface {v5, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1dd

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_34

    :cond_1dd
    invoke-interface {v5, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_34

    .line 99
    :cond_1e2
    :goto_1e2
    return-void
.end method

.method static fetch(Lokhttp3/OkHttpClient;Lokhttp3/Request$Builder;Z)Lokhttp3/Response;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    const-string v0, "Range"

    if-eqz p2, :cond_9

    const-string v1, "bytes=0-511"

    invoke-virtual {p1, v0, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 86
    :cond_9
    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    invoke-virtual {p0, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    .line 87
    if-eqz p2, :cond_53

    .line 88
    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result p2

    .line 89
    const/16 v2, 0x190

    if-eq p2, v2, :cond_3f

    const/16 v2, 0x193

    if-eq p2, v2, :cond_3f

    const/16 v2, 0x195

    if-eq p2, v2, :cond_3f

    const/16 v2, 0x1a0

    if-eq p2, v2, :cond_3f

    .line 90
    const/16 v2, 0xce

    if-ne p2, v2, :cond_53

    const-wide/16 v2, 0x200

    invoke-virtual {v1, v2, v3}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object p2

    invoke-static {p2}, Lcom/streambundle/v48/ResolveMedia;->validMedia([B)Z

    move-result p2

    if-nez p2, :cond_53

    .line 91
    :cond_3f
    invoke-virtual {v1}, Lokhttp3/Response;->close()V

    .line 92
    invoke-virtual {p1, v0}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    invoke-virtual {p0, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p0

    return-object p0

    .line 95
    :cond_53
    return-object v1
.end method

.method static resolve(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
            Ljava/lang/Exception;
        }
    .end annotation

    .line 28
    const-string v1, ""

    invoke-static/range {p1 .. p1}, Lcom/streambundle/Unified;->playbackUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 29
    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v2

    .line 30
    if-eqz v2, :cond_284

    .line 31
    invoke-static {v0}, Lcom/streambundleextra/MediaFix;->mediaRequestUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 32
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v5, 0xe

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    add-long v9, v2, v4

    .line 33
    new-instance v11, Ljava/util/ArrayDeque;

    invoke-direct {v11}, Ljava/util/ArrayDeque;-><init>()V

    .line 34
    new-instance v12, Lcom/streambundle/v48/PlaybackFallback$Target;

    const/4 v6, 0x0

    invoke-static {v8}, Lcom/streambundle/v38/TubeSources;->playable(Ljava/lang/String;)Z

    move-result v7

    const/4 v5, 0x0

    move-object v2, v12

    move-object v3, v8

    move-object v4, v0

    invoke-direct/range {v2 .. v7}, Lcom/streambundle/v48/PlaybackFallback$Target;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-interface {v11, v12}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 35
    invoke-static/range {p1 .. p1}, Lcom/streambundle/v48/ResolveMedia;->tube(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_51

    .line 36
    invoke-static {v0}, Lcom/streambundle/v38/TubeSources;->external(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 37
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_51

    new-instance v12, Lcom/streambundle/v48/PlaybackFallback$Target;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x1

    move-object v2, v12

    move-object v4, v0

    invoke-direct/range {v2 .. v7}, Lcom/streambundle/v48/PlaybackFallback$Target;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-interface {v11, v12}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 39
    :cond_51
    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_65

    new-instance v8, Lcom/streambundle/v48/PlaybackFallback$Target;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v2, v8

    move-object v3, v0

    move-object v4, v0

    invoke-direct/range {v2 .. v7}, Lcom/streambundle/v48/PlaybackFallback$Target;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-interface {v11, v8}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 40
    :cond_65
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 41
    nop

    .line 42
    nop

    .line 43
    const/4 v3, 0x0

    const-string v0, "\u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0430 \u043d\u0435 \u043e\u0442\u0434\u0430\u043b\u0430 \u0432\u0438\u0434\u0435\u043e\u043f\u043e\u0442\u043e\u043a"

    move-object v4, v0

    move v5, v3

    :goto_71
    invoke-interface {v11}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_264

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v0

    const/16 v6, 0x10

    if-ge v0, v6, :cond_264

    const/4 v0, 0x6

    if-lt v5, v0, :cond_84

    goto/16 :goto_264

    .line 44
    :cond_84
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_25e

    .line 45
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    sub-long v6, v9, v6

    invoke-virtual {v0, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    .line 46
    const-wide/16 v12, 0x0

    cmp-long v0, v6, v12

    if-gtz v0, :cond_a2

    goto/16 :goto_264

    .line 47
    :cond_a2
    invoke-interface {v11}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/streambundle/v48/PlaybackFallback$Target;

    .line 48
    iget v0, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->depth:I

    const/4 v12, 0x4

    if-gt v0, v12, :cond_259

    iget-object v0, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->url:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundle/v48/ResolveMedia;->unwanted(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_259

    .line 49
    iget-object v0, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->url:Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c2

    move-object/from16 v3, p2

    goto/16 :goto_25b

    .line 50
    :cond_c2
    iget-object v0, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->url:Ljava/lang/String;

    const-wide/16 v13, 0xa8c

    invoke-static {v6, v7, v13, v14}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    invoke-static {v0, v6, v7}, Lcom/streambundle/v48/PlaybackLinks;->client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 51
    iget-object v6, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->url:Ljava/lang/String;

    iget-object v7, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->referer:Ljava/lang/String;

    const/4 v13, 0x0

    invoke-static {v6, v7, v13}, Lcom/streambundle/v48/PlaybackLinks;->request(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lokhttp3/Request$Builder;

    move-result-object v6

    .line 52
    :try_start_d7
    iget-boolean v7, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->media:Z

    invoke-static {v0, v6, v7}, Lcom/streambundle/v48/PlaybackFallback;->fetch(Lokhttp3/OkHttpClient;Lokhttp3/Request$Builder;Z)Lokhttp3/Response;

    move-result-object v6
    :try_end_dd
    .catchall {:try_start_d7 .. :try_end_dd} :catchall_241

    .line 53
    :try_start_dd
    invoke-virtual {v6}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    .line 54
    invoke-virtual {v6}, Lokhttp3/Response;->isSuccessful()Z

    move-result v7

    if-eqz v7, :cond_211

    invoke-virtual {v6}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v7

    if-nez v7, :cond_f5

    move-object/from16 v3, p2

    goto/16 :goto_213

    .line 58
    :cond_f5
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/streambundle/v48/ResolveMedia;->unwanted(Ljava/lang/String;)Z

    move-result v7
    :try_end_fd
    .catchall {:try_start_dd .. :try_end_fd} :catchall_235

    if-eqz v7, :cond_111

    .line 77
    if-eqz v6, :cond_10d

    :try_start_101
    invoke-virtual {v6}, Lokhttp3/Response;->close()V
    :try_end_104
    .catchall {:try_start_101 .. :try_end_104} :catchall_108

    .line 58
    move-object/from16 v3, p2

    goto/16 :goto_25b

    .line 77
    :catchall_108
    move-exception v0

    move-object/from16 v3, p2

    goto/16 :goto_245

    :cond_10d
    move-object/from16 v3, p2

    goto/16 :goto_25b

    .line 59
    :cond_111
    const-wide/16 v14, 0x200

    :try_start_113
    invoke-virtual {v6, v14, v15}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object v7

    .line 60
    new-instance v14, Ljava/lang/String;

    sget-object v15, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v14, v7, v15}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const-string v15, "\ufeff"

    invoke-virtual {v14, v15, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 61
    invoke-static {v7}, Lcom/streambundle/v48/ResolveMedia;->validMedia([B)Z

    move-result v7
    :try_end_130
    .catchall {:try_start_113 .. :try_end_130} :catchall_235

    const-string v15, "#EXTM3U"

    if-nez v7, :cond_15b

    :try_start_134
    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13b

    goto :goto_15b

    .line 74
    :cond_13b
    invoke-virtual {v6}, Lokhttp3/Response;->code()I

    move-result v7

    const/16 v12, 0xce

    if-eq v7, v12, :cond_157

    if-nez v5, :cond_157

    .line 75
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    const-wide/32 v14, 0x180000

    invoke-virtual {v6, v14, v15}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v7

    invoke-static {v11, v8, v0, v7}, Lcom/streambundle/v48/PlaybackFallback;->collect(Ljava/util/Deque;Lcom/streambundle/v48/PlaybackFallback$Target;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    :cond_157
    move-object/from16 v3, p2

    goto/16 :goto_1eb

    .line 62
    :cond_15b
    :goto_15b
    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    .line 63
    new-array v12, v12, [Ljava/lang/String;

    const-string v16, "User-Agent"

    aput-object v16, v12, v3

    const-string v16, "Referer"

    const/16 v17, 0x1

    aput-object v16, v12, v17

    const-string v16, "Cookie"

    const/16 v17, 0x2

    aput-object v16, v12, v17

    const-string v16, "Origin"

    const/16 v17, 0x3

    aput-object v16, v12, v17

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_180
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-nez v16, :cond_1f2

    .line 67
    iget v12, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->quality:I

    if-nez v12, :cond_193

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v1, v12}, Lcom/streambundle/v48/PlaybackLinks;->height(Ljava/lang/String;Ljava/lang/String;)I

    move-result v12

    goto :goto_195

    :cond_193
    iget v12, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->quality:I

    .line 68
    :goto_195
    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    .line 69
    if-lez v12, :cond_1af

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v15, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "p"

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1b5

    :cond_1af
    if-eqz v14, :cond_1b3

    move-object v15, v1

    goto :goto_1b6

    :cond_1b3
    const-string v3, "\u041e\u0440\u0438\u0433\u0438\u043d\u0430\u043b"

    :goto_1b5
    move-object v15, v3

    .line 70
    :goto_1b6
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v16

    iget-object v0, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->referer:Ljava/lang/String;

    if-lez v12, :cond_1c1

    move/from16 v18, v12

    goto :goto_1ca

    :cond_1c1
    if-eqz v14, :cond_1c6

    const/16 v18, 0x0

    goto :goto_1ca

    :cond_1c6
    const/16 v3, 0x190

    move/from16 v18, v3

    .line 71
    :goto_1ca
    if-eqz v14, :cond_1cf

    sget-object v3, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    goto :goto_1d1

    :cond_1cf
    sget-object v3, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->VIDEO:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    :goto_1d1
    move-object/from16 v19, v3

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v22

    .line 69
    const/16 v21, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v0

    move-object/from16 v20, v7

    invoke-static/range {v14 .. v22}, Lcom/streambundle/v48/PlaybackLinks;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/lagradost/cloudstream3/utils/ExtractorLinkType;Ljava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    move-result-object v0
    :try_end_1e3
    .catchall {:try_start_134 .. :try_end_1e3} :catchall_235

    .line 72
    move-object/from16 v3, p2

    :try_start_1e5
    invoke-interface {v3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e8
    .catchall {:try_start_1e5 .. :try_end_1e8} :catchall_233

    .line 73
    add-int/lit8 v5, v5, 0x1

    .line 74
    nop

    .line 77
    :goto_1eb
    if-eqz v6, :cond_25b

    :try_start_1ed
    invoke-virtual {v6}, Lokhttp3/Response;->close()V
    :try_end_1f0
    .catchall {:try_start_1ed .. :try_end_1f0} :catchall_23f

    goto/16 :goto_25b

    .line 63
    :cond_1f2
    move-object/from16 v3, p2

    :try_start_1f4
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v13, v16

    check-cast v13, Ljava/lang/String;

    .line 64
    move-object/from16 v16, v0

    invoke-virtual {v6}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0, v13}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 65
    if-eqz v0, :cond_20b

    invoke-interface {v7, v13, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20b
    move-object/from16 v0, v16

    const/4 v3, 0x0

    const/4 v13, 0x0

    goto/16 :goto_180

    .line 54
    :cond_211
    move-object/from16 v3, p2

    .line 55
    :goto_213
    iget v0, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->depth:I

    if-nez v0, :cond_22b

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v7, "\u0441\u0435\u0440\u0432\u0435\u0440 \u0432\u0435\u0440\u043d\u0443\u043b HTTP "

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lokhttp3/Response;->code()I

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_22a
    .catchall {:try_start_1f4 .. :try_end_22a} :catchall_233

    move-object v4, v0

    .line 77
    :cond_22b
    if-eqz v6, :cond_25b

    :try_start_22d
    invoke-virtual {v6}, Lokhttp3/Response;->close()V
    :try_end_230
    .catchall {:try_start_22d .. :try_end_230} :catchall_231

    .line 56
    goto :goto_25b

    .line 77
    :catchall_231
    move-exception v0

    goto :goto_244

    :catchall_233
    move-exception v0

    goto :goto_238

    :catchall_235
    move-exception v0

    move-object/from16 v3, p2

    :goto_238
    move-object v13, v0

    if-eqz v6, :cond_23e

    :try_start_23b
    invoke-virtual {v6}, Lokhttp3/Response;->close()V

    :cond_23e
    throw v13
    :try_end_23f
    .catchall {:try_start_23b .. :try_end_23f} :catchall_23f

    :catchall_23f
    move-exception v0

    goto :goto_245

    :catchall_241
    move-exception v0

    move-object/from16 v3, p2

    :goto_244
    const/4 v13, 0x0

    :goto_245
    if-eqz v13, :cond_24d

    if-eq v13, v0, :cond_24e

    :try_start_249
    invoke-virtual {v13, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_24e

    :cond_24d
    move-object v13, v0

    :cond_24e
    :goto_24e
    throw v13
    :try_end_24f
    .catch Ljava/io/IOException; {:try_start_249 .. :try_end_24f} :catch_24f

    :catch_24f
    move-exception v0

    .line 78
    iget v0, v8, Lcom/streambundle/v48/PlaybackFallback$Target;->depth:I

    if-nez v0, :cond_256

    const-string v4, "\u043d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0437\u0430\u0433\u0440\u0443\u0437\u0438\u0442\u044c \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0443 \u0432\u0438\u0434\u0435\u043e"

    :cond_256
    const/4 v3, 0x0

    goto/16 :goto_71

    .line 48
    :cond_259
    move-object/from16 v3, p2

    .line 43
    :cond_25b
    :goto_25b
    const/4 v3, 0x0

    goto/16 :goto_71

    .line 44
    :cond_25e
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 81
    :cond_264
    :goto_264
    if-eqz v5, :cond_267

    .line 82
    return-void

    .line 81
    :cond_267
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static/range {p0 .. p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 30
    :cond_284
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0443 \u0432\u0438\u0434\u0435\u043e \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
