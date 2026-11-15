.class public final Lcom/streambundle/v43/Repair43;
.super Ljava/lang/Object;
.source "Repair43.java"


# static fields
.field private static final BEEG:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 14
    new-instance v0, Lcom/streambundle/v43/Repair43$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/v43/Repair43$1;-><init>(IFZ)V

    .line 13
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v43/Repair43;->BEEG:Ljava/util/Map;

    .line 16
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static affected(Ljava/lang/Object;)Z
    .registers 2

    .line 28
    const-string v0, "MainUrl"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 29
    const-string v0, "tubesafari.com"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_28

    const-string v0, "strip2.co"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_28

    const-string v0, "punishbang.com"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_28

    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public static beegText(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 110
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 111
    const-string p1, "null"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    goto :goto_13

    :cond_f
    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_13
    return-object v0
.end method

.method public static clean(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 25
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_19

    :cond_5
    invoke-static {p0}, Lorg/jsoup/Jsoup;->parseBodyFragment(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->text()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\s+"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_19
    return-object p0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5

    .line 38
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "get"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_20} :catch_21

    return-object p0

    .line 39
    :catch_21
    move-exception p0

    const/4 p0, 0x0

    return-object p0
.end method

.method static host(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 32
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_d

    goto :goto_13

    :cond_d
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_13} :catch_14

    :goto_13
    return-object v0

    .line 33
    :catch_14
    move-exception p0

    return-object v0
.end method

.method public static rememberBeeg(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 10

    .line 87
    const-string p1, "video_id"

    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 88
    const-string v0, "[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_11

    return-void

    .line 90
    :cond_11
    :try_start_11
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_1a} :catch_b8

    .line 91
    const-string p0, "dur"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p0, :cond_36

    const-string p0, "is_ok"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_36

    const-string p0, "video_url"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_36

    const/4 p0, 0x0

    goto :goto_37

    :cond_36
    const/4 p0, 0x1

    .line 92
    :goto_37
    const-string v3, "related"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    sget-object v3, Lcom/streambundle/v43/Repair43;->BEEG:Ljava/util/Map;

    monitor-enter v3

    .line 94
    :try_start_3f
    sget-object v4, Lcom/streambundle/v43/Repair43;->BEEG:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 95
    if-eqz v4, :cond_9a

    .line 96
    const-string v5, "_cs3_details"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5
    :try_end_4f
    .catchall {:try_start_3f .. :try_end_4f} :catchall_b5

    if-eqz v5, :cond_62

    if-nez p0, :cond_62

    .line 97
    :try_start_53
    const-string v5, "title"

    const-string v6, "title"

    const-string v7, ""

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_60
    .catch Lorg/json/JSONException; {:try_start_53 .. :try_end_60} :catch_61
    .catchall {:try_start_53 .. :try_end_60} :catchall_b5

    goto :goto_62

    :catch_61
    move-exception v5

    .line 98
    :cond_62
    :goto_62
    :try_start_62
    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 99
    nop

    :cond_67
    :goto_67
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_6e

    goto :goto_9a

    .line 100
    :cond_6e
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 101
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_90

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_90

    const-string v7, ""

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7
    :try_end_8e
    .catchall {:try_start_62 .. :try_end_8e} :catchall_b5

    if-eqz v7, :cond_67

    .line 102
    :cond_90
    :try_start_90
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_97
    .catch Lorg/json/JSONException; {:try_start_90 .. :try_end_97} :catch_98
    .catchall {:try_start_90 .. :try_end_97} :catchall_b5

    goto :goto_67

    :catch_98
    move-exception v6

    goto :goto_67

    .line 105
    :cond_9a
    :goto_9a
    :try_start_9a
    const-string v5, "_cs3_details"

    if-nez p0, :cond_a9

    if-eqz v4, :cond_a8

    const-string p0, "_cs3_details"

    invoke-virtual {v4, p0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_a9

    :cond_a8
    const/4 v1, 0x0

    :cond_a9
    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_ac
    .catch Lorg/json/JSONException; {:try_start_9a .. :try_end_ac} :catch_ad
    .catchall {:try_start_9a .. :try_end_ac} :catchall_b5

    goto :goto_ae

    :catch_ad
    move-exception p0

    .line 106
    :goto_ae
    :try_start_ae
    sget-object p0, Lcom/streambundle/v43/Repair43;->BEEG:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    monitor-exit v3

    .line 108
    return-void

    .line 93
    :catchall_b5
    move-exception p0

    monitor-exit v3
    :try_end_b7
    .catchall {:try_start_ae .. :try_end_b7} :catchall_b5

    throw p0

    .line 90
    :catch_b8
    move-exception p0

    return-void
.end method

.method public static response(Ljava/lang/Object;)V
    .registers 10

    .line 114
    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 115
    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "jav.guru"

    invoke-static {v1, v2}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    const-string v2, "BackgroundPosterUrl"

    const-string v3, "PosterHeaders"

    const-string v4, "Referer"

    const-string v5, "LoadResponse"

    const-string v6, "PosterUrl"

    if-eqz v1, :cond_8f

    .line 116
    invoke-static {p0, v6}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 118
    :try_start_28
    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    .line 119
    const-string v1, "cdn.javmiku.com"

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8e

    .line 120
    invoke-virtual {v0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v1

    const-string v7, "/wp-content/uploads/"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8e

    .line 121
    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_8e

    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v7, "https://jav.guru"

    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 123
    const-class v1, Ljava/lang/String;

    invoke-static {p0, v6, v1, v0}, Lcom/streambundle/v43/Repair43;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 124
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_75

    const-class v1, Ljava/lang/String;

    invoke-static {p0, v2, v1, v0}, Lcom/streambundle/v43/Repair43;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 125
    :cond_75
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 126
    const-string v1, "https://jav.guru/"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const-string v1, "User-Agent"

    const-string v2, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    const-class v1, Ljava/util/Map;

    invoke-static {p0, v3, v1, v0}, Lcom/streambundle/v43/Repair43;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    :try_end_8b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_28 .. :try_end_8b} :catch_8c

    goto :goto_8d

    .line 130
    :catch_8c
    move-exception p0

    :goto_8d
    nop

    .line 131
    :cond_8e
    return-void

    .line 133
    :cond_8f
    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v7, "prostoporno.dev"

    invoke-static {v1, v7}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    const-string v7, ""

    if-eqz v1, :cond_15e

    .line 136
    invoke-static {p0, v6}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 138
    :try_start_a5
    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    .line 139
    const-string v1, "i.prostoporno.dev"

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15d

    .line 140
    invoke-virtual {v0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v1

    const-string v8, "/contents/videos_screenshots/"

    invoke-virtual {v1, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15d

    .line 141
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v8, "https://prostoporno.dev"

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 142
    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_d7

    :goto_d6
    goto :goto_eb

    :cond_d7
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "?"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_d6

    :goto_eb
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 143
    const-class v1, Ljava/lang/String;

    invoke-static {p0, v6, v1, v0}, Lcom/streambundle/v43/Repair43;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 144
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10b

    .line 145
    const-class v1, Ljava/lang/String;

    invoke-static {p0, v2, v1, v0}, Lcom/streambundle/v43/Repair43;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 146
    :cond_10b
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 147
    invoke-static {p0, v3}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 148
    instance-of v2, v1, Ljava/util/Map;

    if-eqz v2, :cond_11d

    check-cast v1, Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 149
    :cond_11d
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_12a
    :goto_12a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_13b

    .line 152
    const-string v1, "https://prostoporno.dev/"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    const-class v1, Ljava/util/Map;

    invoke-static {p0, v3, v1, v0}, Lcom/streambundle/v43/Repair43;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    goto :goto_15c

    .line 149
    :cond_13b
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 150
    const-string v5, "Cookie"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_157

    const-string v5, "Authorization"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_157

    .line 151
    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_12a

    :cond_157
    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a5 .. :try_end_15a} :catch_15b

    goto :goto_12a

    .line 155
    :catch_15b
    move-exception p0

    :goto_15c
    nop

    .line 156
    :cond_15d
    return-void

    .line 158
    :cond_15e
    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "beeg.porn"

    invoke-static {v1, v2}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16b

    return-void

    .line 159
    :cond_16b
    const-string v1, "/xid/([0-9]+)(?:/|$)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 160
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_184

    return-void

    .line 161
    :cond_184
    sget-object v1, Lcom/streambundle/v43/Repair43;->BEEG:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 162
    if-nez v0, :cond_194

    return-void

    .line 163
    :cond_194
    const-string v1, "title"

    invoke-static {v0, v1}, Lcom/streambundle/v43/Repair43;->beegText(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 164
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1a7

    const-string v3, "Name"

    const-class v4, Ljava/lang/String;

    invoke-static {p0, v3, v4, v1}, Lcom/streambundle/v43/Repair43;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 165
    :cond_1a7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1b6

    return-void

    .line 166
    :cond_1b6
    const-string v3, "description"

    invoke-static {v0, v3}, Lcom/streambundle/v43/Repair43;->beegText(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 167
    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1d4

    const-string v1, "(?is).*(?:most best porn|forget about other porn|beeg porn this is all|free porn tubes).*"

    invoke-virtual {v3, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1d4

    const-string v1, "^[\\[{].*"

    invoke-virtual {v3, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d3

    goto :goto_1d4

    :cond_1d3
    move-object v7, v3

    .line 168
    :cond_1d4
    :goto_1d4
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 169
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1e2

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    :cond_1e2
    const-string v3, "dur"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    .line 171
    if-lez v3, :cond_209

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-int/lit8 v6, v3, 0x3c

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    rem-int/lit8 v3, v3, 0x3c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v6, v7, v4

    aput-object v3, v7, v2

    const-string v2, "\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c: %d:%02d"

    invoke-static {v5, v2, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    :cond_209
    const-string v2, "quality"

    invoke-static {v0, v2}, Lcom/streambundle/v43/Repair43;->beegText(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 173
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_21b

    const-string v2, "hd"

    invoke-static {v0, v2}, Lcom/streambundle/v43/Repair43;->beegText(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 174
    :cond_21b
    const-string v0, "(?i)(?:[0-9]{3,4}p|sd|hd|full hd|4k|8k)"

    invoke-virtual {v2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_235

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "\u041a\u0430\u0447\u0435\u0441\u0442\u0432\u043e: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    :cond_235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_23e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_258

    .line 177
    const-class v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-nez v2, :cond_24e

    const/4 v0, 0x0

    goto :goto_252

    :cond_24e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_252
    const-string v2, "Plot"

    invoke-static {p0, v2, v1, v0}, Lcom/streambundle/v43/Repair43;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 178
    return-void

    .line 176
    :cond_258
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_269

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_269
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_23e
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 42
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "set"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    aput-object p3, p2, v3

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_24} :catch_25

    goto :goto_26

    .line 43
    :catch_25
    move-exception p0

    .line 44
    :goto_26
    return-void
.end method

.method static site(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1d

    const/4 p0, 0x0

    return p0

    :cond_1d
    const/4 p0, 0x1

    return p0
.end method

.method static string(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 36
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_9
    return-object p0
.end method

.method public static tubeCards(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            ")",
            "Ljava/util/List<",
            "Lcom/example/tubesafari/TubeSafariParser$Card;",
            ">;"
        }
    .end annotation

    .line 59
    const-string v0, ""

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 60
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 61
    const-string v3, ".vid_li"

    invoke-virtual {p0, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_16
    :goto_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 84
    return-object v1

    .line 61
    :cond_1d
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 62
    const-string v4, ".video_title a[href], a.vid_title[href], a[href*=/video?id=]"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    .line 63
    if-nez v4, :cond_2c

    goto :goto_16

    .line 64
    :cond_2c
    const-string v5, "href"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 66
    :try_start_32
    invoke-static {v5}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v6

    .line 67
    invoke-static {v5}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "tubesafari.com"

    invoke-static {v7, v8}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_16

    invoke-virtual {v6}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v7

    const-string v8, "/+$"

    invoke-virtual {v7, v8, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "/video"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_16

    invoke-virtual {v6}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_5b

    goto :goto_16

    .line 68
    :cond_5b
    sget-object v6, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-virtual {v6, v5}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_64

    goto :goto_16

    .line 69
    :cond_64
    const-string v6, ".video_title a[href], a.vid_title[href]"

    invoke-virtual {v3, v6}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    .line 70
    if-nez v6, :cond_6e

    move-object v6, v0

    goto :goto_76

    :cond_6e
    invoke-virtual {v6}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundle/v43/Repair43;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 71
    :goto_76
    const-string v7, "img"

    invoke-virtual {v3, v7}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    .line 72
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_8c

    const-string v6, "title"

    invoke-virtual {v4, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundle/v43/Repair43;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 73
    :cond_8c
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_9e

    if-eqz v3, :cond_9e

    const-string v4, "alt"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundle/v43/Repair43;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 74
    :cond_9e
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_16

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_ac

    goto/16 :goto_16

    .line 75
    :cond_ac
    nop

    .line 76
    if-eqz v3, :cond_e3

    const/4 v4, 0x4

    new-array v7, v4, [Ljava/lang/String;

    const-string v8, "data-src"

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const-string v8, "data-original"

    const/4 v10, 0x1

    aput-object v8, v7, v10

    const-string v8, "data-lazy-src"

    const/4 v10, 0x2

    aput-object v8, v7, v10

    const-string v8, "src"

    const/4 v10, 0x3

    aput-object v8, v7, v10

    :goto_c6
    if-lt v9, v4, :cond_c9

    goto :goto_e3

    :cond_c9
    aget-object v8, v7, v9

    .line 77
    invoke-virtual {v3, v8}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 78
    const-string v10, "https://"

    invoke-virtual {v8, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_e4

    const-string v10, "http://"

    invoke-virtual {v8, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_e0

    goto :goto_e4

    .line 76
    :cond_e0
    add-int/lit8 v9, v9, 0x1

    goto :goto_c6

    .line 80
    :cond_e3
    :goto_e3
    const/4 v8, 0x0

    :cond_e4
    :goto_e4
    if-eqz v8, :cond_f0

    sget-object v3, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-virtual {v3, v8}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f0

    goto/16 :goto_16

    .line 81
    :cond_f0
    new-instance v3, Lcom/example/tubesafari/TubeSafariParser$Card;

    invoke-direct {v3, v6, v5, v8}, Lcom/example/tubesafari/TubeSafariParser$Card;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_f8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_32 .. :try_end_f8} :catch_f9

    goto :goto_fa

    .line 82
    :catch_f9
    move-exception v3

    :goto_fa
    goto/16 :goto_16
.end method

.method public static validate(Ljava/lang/Object;)V
    .registers 5

    .line 46
    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 47
    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    const-string v1, "strip2.co"

    invoke-static {v0, v1}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_27

    const-string v1, "tubesafari.com"

    invoke-static {v0, v1}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_27

    const-string v1, "punishbang.com"

    invoke-static {v0, v1}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_27

    return-void

    .line 49
    :cond_27
    const-string v1, "Code"

    invoke-static {p0, v1}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 50
    instance-of v2, v1, Ljava/lang/Number;

    const/16 v3, 0xc8

    if-eqz v2, :cond_3a

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    goto :goto_3c

    :cond_3a
    const/16 v1, 0xc8

    .line 51
    :goto_3c
    const-string v2, "Text"

    invoke-static {p0, v2}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 52
    if-lt v1, v3, :cond_7f

    const/16 v2, 0x12c

    if-lt v1, v2, :cond_4d

    goto :goto_7f

    .line 54
    :cond_4d
    const-string v1, "(?is)<title[^>]*>\\s*(?:Just a moment|Attention Required|Access denied|Checking your browser)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_66

    .line 55
    const-string v1, "id=\"challenge-form\""

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_66

    .line 57
    return-void

    .line 56
    :cond_66
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ": \u0441\u0430\u0439\u0442 \u0442\u0440\u0435\u0431\u0443\u0435\u0442 \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0443 \u0434\u043e\u0441\u0442\u0443\u043f\u0430 \u0432\u043e \u0432\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u043e\u043c \u0431\u0440\u0430\u0443\u0437\u0435\u0440\u0435 Cloudstream."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 53
    :cond_7f
    :goto_7f
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ": HTTP "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x193

    if-ne v1, v2, :cond_9b

    const-string v1, ". \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0441\u0430\u0439\u0442 \u0432\u043e \u0432\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u043e\u043c \u0431\u0440\u0430\u0443\u0437\u0435\u0440\u0435 Cloudstream \u0438 \u043f\u0440\u043e\u0439\u0434\u0438\u0442\u0435 \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0443 \u0434\u043e\u0441\u0442\u0443\u043f\u0430."

    goto :goto_9d

    :cond_9b
    const-string v1, ". \u0421\u0430\u0439\u0442 \u0432\u0440\u0435\u043c\u0435\u043d\u043d\u043e \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d; \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0437\u0430\u043f\u0440\u043e\u0441 \u043f\u043e\u0437\u0436\u0435."

    :goto_9d
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static videoEndpoint(Ljava/lang/String;)Z
    .registers 3

    .line 20
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object p0

    .line 21
    if-eqz p0, :cond_1d

    const-string v1, "/get_file/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1b

    const-string v1, "/remote_control.php"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_19} :catch_1e

    if-eqz p0, :cond_1d

    :cond_1b
    const/4 p0, 0x1

    return p0

    :cond_1d
    return v0

    .line 22
    :catch_1e
    move-exception p0

    return v0
.end method
