.class public final Lcom/streambundle/v48/PlaybackLinks;
.super Ljava/lang/Object;
.source "PlaybackLinks.java"


# static fields
.field private static final ATTRIBUTE:Ljava/util/regex/Pattern;

.field private static final KNOWN:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final LABEL:Ljava/util/regex/Pattern;

.field private static final MANIFEST_BYTES:I = 0x80000

.field private static final MP4_BYTES:I = 0x40000

.field private static final RESOLUTION:Ljava/util/regex/Pattern;

.field private static final URL_LABEL:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    .line 23
    const-string v0, "(?i)(?<![0-9])(144|240|288|360|480|540|576|720|1080|1440|2160|4320)(?:p(?=$|[^a-z])|(?=$|[^0-9]))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v48/PlaybackLinks;->LABEL:Ljava/util/regex/Pattern;

    .line 24
    const-string v0, "(?i)(?:^|[/_.=&-])(144|240|288|360|480|540|576|720|1080|1440|2160|4320)(?:p(?=$|[^a-z])|(?=$|[/_.&#?-]))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v48/PlaybackLinks;->URL_LABEL:Ljava/util/regex/Pattern;

    .line 25
    const-string v0, "(?i)^(\\d{2,5})x(\\d{2,5})$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v48/PlaybackLinks;->RESOLUTION:Ljava/util/regex/Pattern;

    .line 26
    const-string v0, "(?:^|,)([A-Z0-9-]+)=(\"[^\"]*\"|[^,]*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v48/PlaybackLinks;->ATTRIBUTE:Ljava/util/regex/Pattern;

    .line 27
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x90

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0xf0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x120

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v4, 0x168

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v5, 0x1e0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v6, 0x21c

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v7, 0x240

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v8, 0x2d0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/16 v9, 0x438

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/16 v10, 0x5a0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v11, 0x870

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v12, 0x10e0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0xc

    new-array v13, v13, [Ljava/lang/Integer;

    const/4 v14, 0x0

    aput-object v1, v13, v14

    const/4 v1, 0x1

    aput-object v2, v13, v1

    const/4 v1, 0x2

    aput-object v3, v13, v1

    const/4 v1, 0x3

    aput-object v4, v13, v1

    const/4 v1, 0x4

    aput-object v5, v13, v1

    const/4 v1, 0x5

    aput-object v6, v13, v1

    const/4 v1, 0x6

    aput-object v7, v13, v1

    const/4 v1, 0x7

    aput-object v8, v13, v1

    const/16 v1, 0x8

    aput-object v9, v13, v1

    const/16 v1, 0x9

    aput-object v10, v13, v1

    const/16 v1, 0xa

    aput-object v11, v13, v1

    const/16 v1, 0xb

    aput-object v12, v13, v1

    invoke-static {v13}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/streambundle/v48/PlaybackLinks;->KNOWN:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attributes(Ljava/lang/String;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 270
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 271
    sget-object v1, Lcom/streambundle/v48/PlaybackLinks;->ATTRIBUTE:Ljava/util/regex/Pattern;

    const/16 v2, 0x3a

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 272
    nop

    :goto_18
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 277
    return-object v0

    .line 273
    :cond_1f
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 274
    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 275
    :cond_3b
    invoke-virtual {p0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18
.end method

.method private static audioTrack(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ReflectiveOperationException;
        }
    .end annotation

    .line 158
    const-string v0, "com.lagradost.cloudstream3.AudioFile"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 160
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    :try_start_9
    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v2

    const-class v5, Ljava/util/Map;

    aput-object v5, v4, v1

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 161
    new-array v5, v3, [Ljava/lang/Object;

    aput-object p0, v5, v2

    aput-object p1, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_21
    .catch Ljava/lang/NoSuchMethodException; {:try_start_9 .. :try_end_21} :catch_22

    return-object p0

    .line 162
    :catch_22
    move-exception v4

    .line 163
    const/4 v4, 0x4

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v2

    aput-object v6, v5, v1

    aput-object v6, v5, v3

    const-class v6, Ljava/util/Map;

    const/4 v7, 0x3

    aput-object v6, v5, v7

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 164
    const-string v5, "LANGUAGE"

    const-string v6, "und"

    invoke-interface {p2, v5, v6}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "NAME"

    invoke-interface {p2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v5, v4, v2

    aput-object p0, v4, v1

    aput-object p2, v4, v3

    aput-object p1, v4, v7

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;
    .registers 7

    .line 53
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/Requests;->getBaseClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    const-wide/16 v2, 0x1

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, p1, p2, v2}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 56
    :try_start_18
    invoke-static {p0}, Lcom/streambundle/v43/SiteAccess;->interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object p0

    .line 57
    if-eqz p0, :cond_30

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->interceptors()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_30

    invoke-virtual {p1, p0}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;
    :try_end_2b
    .catch Ljava/lang/RuntimeException; {:try_start_18 .. :try_end_2b} :catch_2e
    .catch Ljava/lang/LinkageError; {:try_start_18 .. :try_end_2b} :catch_2c

    goto :goto_2f

    .line 58
    :catch_2c
    move-exception p0

    goto :goto_2f

    :catch_2e
    move-exception p0

    :goto_2f
    nop

    .line 61
    :cond_30
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p0

    return-object p0
.end method

.method private static copyField(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/lang/String;Ljava/lang/Class;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 132
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "get"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 133
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "set"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Class;

    aput-object p3, v3, v2

    invoke-virtual {v0, p2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    new-array p3, v1, [Ljava/lang/Object;

    aput-object p0, p3, v2

    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_43
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_43} :catch_44

    goto :goto_45

    .line 134
    :catch_44
    move-exception p0

    :goto_45
    nop

    .line 137
    return-void
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/lagradost/cloudstream3/utils/ExtractorLinkType;Ljava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 106
    new-instance v6, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;

    move-object v0, v6

    move-object v1, p3

    move v2, p4

    move-object v3, p6

    move-object v4, p7

    move-object v5, p8

    invoke-direct/range {v0 .. v5}, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;ILjava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)V

    .line 117
    new-instance v5, Lcom/streambundle/v48/PlaybackLinks$1;

    invoke-direct {v5}, Lcom/streambundle/v48/PlaybackLinks$1;-><init>()V

    .line 106
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p5

    move-object v4, v6

    invoke-static/range {v0 .. v5}, Lcom/lagradost/cloudstream3/utils/ExtractorApiKt;->newExtractorLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    .line 121
    instance-of p1, p0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    if-eqz p1, :cond_20

    check-cast p0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    return-object p0

    .line 122
    :cond_20
    new-instance p0, Ljava/net/ProtocolException;

    const-string p1, "Cloudstream did not create a video link"

    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static height(Ljava/lang/String;Ljava/lang/String;)I
    .registers 8

    .line 32
    const-string v0, ""

    if-nez p0, :cond_6

    move-object p0, v0

    goto :goto_a

    :cond_6
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 33
    :goto_a
    const-string v1, "(?i)4k"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15

    const/16 p0, 0x870

    return p0

    .line 34
    :cond_15
    const-string v1, "(?i)8k"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_20

    const/16 p0, 0x10e0

    return p0

    .line 35
    :cond_20
    sget-object v1, Lcom/streambundle/v48/PlaybackLinks;->RESOLUTION:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_36

    const/4 p0, 0x2

    invoke-virtual {v1, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    .line 37
    :cond_36
    sget-object v1, Lcom/streambundle/v48/PlaybackLinks;->LABEL:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_4c

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    .line 39
    :cond_4c
    if-nez p1, :cond_50

    const/4 p0, 0x0

    goto :goto_54

    :cond_50
    invoke-static {p1}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    .line 40
    :goto_54
    const/4 p1, 0x0

    if-nez p0, :cond_58

    return p1

    .line 41
    :cond_58
    const-string v1, "resolution"

    const-string v3, "res"

    const-string v4, "quality"

    const-string v5, "height"

    filled-new-array {v4, v5, v1, v3}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_8b

    .line 48
    sget-object v0, Lcom/streambundle/v48/PlaybackLinks;->URL_LABEL:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_8a

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    :cond_8a
    return p1

    .line 41
    :cond_8b
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 42
    invoke-virtual {p0, v3}, Lokhttp3/HttpUrl;->queryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 43
    if-eqz v3, :cond_6c

    const-string v4, "(?i)[0-9]{2,4}p?"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6c

    .line 44
    const-string v4, "(?i)p$"

    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 45
    sget-object v4, Lcom/streambundle/v48/PlaybackLinks;->KNOWN:Ljava/util/Set;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6c

    return v3
.end method

.method private static hls(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Ljava/util/List;
    .registers 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 199
    const-string v1, "CLOSED-CAPTIONS"

    const-string v0, "Cookie"

    const-string v2, "#EXT-X-STREAM-INF:"

    invoke-virtual/range {p0 .. p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v3

    .line 200
    invoke-virtual/range {p0 .. p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getReferer()Ljava/lang/String;

    move-result-object v13

    .line 201
    invoke-virtual/range {p0 .. p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getHeaders()Ljava/util/Map;

    move-result-object v4

    .line 202
    const-wide/16 v5, 0x834

    :try_start_14
    invoke-static {v3, v5, v6}, Lcom/streambundle/v48/PlaybackLinks;->client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;

    move-result-object v5

    invoke-static {v3, v13, v4}, Lcom/streambundle/v48/PlaybackLinks;->request(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lokhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    invoke-virtual {v5, v3}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v3

    invoke-interface {v3}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v3
    :try_end_28
    .catchall {:try_start_14 .. :try_end_28} :catchall_32f

    .line 203
    :try_start_28
    invoke-virtual {v3}, Lokhttp3/Response;->isSuccessful()Z

    move-result v5

    if-eqz v5, :cond_315

    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    if-nez v5, :cond_38

    move-object/from16 v22, v3

    goto/16 :goto_317

    .line 204
    :cond_38
    const-wide/32 v5, 0x80000

    invoke-virtual {v3, v5, v6}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 205
    const-string v6, "\ufeff"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6
    :try_end_4d
    .catchall {:try_start_28 .. :try_end_4d} :catchall_323

    const/4 v15, 0x1

    if-eqz v6, :cond_5b

    :try_start_50
    invoke-virtual {v5, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5
    :try_end_54
    .catchall {:try_start_50 .. :try_end_54} :catchall_55

    goto :goto_5b

    .line 265
    :catchall_55
    move-exception v0

    move-object v14, v0

    move-object/from16 v22, v3

    goto/16 :goto_327

    .line 206
    :cond_5b
    :goto_5b
    :try_start_5b
    const-string v6, "#EXTM3U"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_309

    invoke-virtual {v5, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_6d

    move-object/from16 v22, v3

    goto/16 :goto_30b

    .line 207
    :cond_6d
    invoke-virtual {v3}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v12

    .line 208
    new-instance v11, Ljava/util/LinkedHashMap;
    :try_end_77
    .catchall {:try_start_5b .. :try_end_77} :catchall_323

    if-nez v4, :cond_7d

    :try_start_79
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v4
    :try_end_7d
    .catchall {:try_start_79 .. :try_end_7d} :catchall_55

    :cond_7d
    :try_start_7d
    invoke-direct {v11, v4}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 209
    invoke-virtual {v3}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v4

    invoke-virtual {v4, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_88
    .catchall {:try_start_7d .. :try_end_88} :catchall_323

    .line 210
    if-eqz v4, :cond_8d

    :try_start_8a
    invoke-interface {v11, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8d
    .catchall {:try_start_8a .. :try_end_8d} :catchall_55

    .line 211
    :cond_8d
    :try_start_8d
    new-instance v10, Ljava/util/LinkedHashMap;

    invoke-direct {v10}, Ljava/util/LinkedHashMap;-><init>()V

    .line 212
    new-instance v9, Ljava/util/TreeMap;

    invoke-static {}, Ljava/util/Collections;->reverseOrder()Ljava/util/Comparator;

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 213
    nop

    .line 214
    const-string v0, "\\r?\\n"

    invoke-virtual {v5, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 215
    array-length v0, v8
    :try_end_a3
    .catchall {:try_start_8d .. :try_end_a3} :catchall_323

    const/16 v16, 0x0

    move/from16 v4, v16

    :goto_a7
    const-string v7, "URI"

    const-string v6, "AUDIO"

    if-lt v4, v0, :cond_29b

    .line 227
    nop

    .line 228
    :try_start_ae
    array-length v5, v8
    :try_end_af
    .catchall {:try_start_ae .. :try_end_af} :catchall_323

    move/from16 v4, v16

    move/from16 v17, v4

    const/4 v14, 0x0

    :goto_b4
    if-lt v4, v5, :cond_ea

    .line 260
    :try_start_b6
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v9}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 261
    if-eqz v17, :cond_e3

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_e3

    .line 262
    invoke-virtual/range {p0 .. p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getSource()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v12}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v6

    sget-object v9, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    .line 263
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v12

    .line 262
    const/4 v8, 0x0

    move-object v7, v13

    move-object v10, v11

    move-object/from16 v11, p0

    invoke-static/range {v4 .. v12}, Lcom/streambundle/v48/PlaybackLinks;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/lagradost/cloudstream3/utils/ExtractorLinkType;Ljava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_e3
    .catchall {:try_start_b6 .. :try_end_e3} :catchall_55

    .line 265
    :cond_e3
    nop

    .line 266
    if-eqz v3, :cond_e9

    :try_start_e6
    invoke-virtual {v3}, Lokhttp3/Response;->close()V
    :try_end_e9
    .catchall {:try_start_e6 .. :try_end_e9} :catchall_32f

    .line 265
    :cond_e9
    return-object v0

    .line 228
    :cond_ea
    :try_start_ea
    aget-object v0, v8, v4

    .line 229
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 230
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18
    :try_end_f4
    .catchall {:try_start_ea .. :try_end_f4} :catchall_323

    if-eqz v18, :cond_111

    .line 231
    :try_start_f6
    invoke-static {v0}, Lcom/streambundle/v48/PlaybackLinks;->attributes(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v14
    :try_end_fa
    .catchall {:try_start_f6 .. :try_end_fa} :catchall_55

    .line 232
    move-object/from16 v19, v2

    move-object/from16 v22, v3

    move/from16 v20, v4

    move/from16 v21, v5

    move-object/from16 v25, v6

    move-object v15, v7

    move-object/from16 v23, v8

    move-object v2, v9

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v24, v13

    move-object v13, v10

    goto/16 :goto_283

    :cond_111
    :try_start_111
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_26e

    const-string v15, "#"

    invoke-virtual {v0, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_26e

    if-eqz v14, :cond_26e

    .line 233
    invoke-virtual {v12, v0}, Lokhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v15

    .line 234
    if-eqz v15, :cond_257

    invoke-virtual {v15}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v48/ResolveMedia;->unwanted(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_257

    .line 235
    sget-object v0, Lcom/streambundle/v48/PlaybackLinks;->RESOLUTION:Ljava/util/regex/Pattern;

    move-object/from16 v19, v2

    const-string v2, "RESOLUTION"

    move/from16 v20, v4

    const-string v4, ""

    invoke-interface {v14, v2, v4}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 236
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2
    :try_end_149
    .catchall {:try_start_111 .. :try_end_149} :catchall_323

    if-eqz v2, :cond_156

    const/4 v2, 0x2

    :try_start_14c
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_154
    .catchall {:try_start_14c .. :try_end_154} :catchall_55

    :goto_154
    move v2, v0

    goto :goto_167

    :cond_156
    :try_start_156
    const-string v0, "NAME"

    invoke-interface {v14, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v15}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/streambundle/v48/PlaybackLinks;->height(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_154

    .line 237
    :goto_167
    invoke-interface {v14, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ljava/util/Map;

    .line 238
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v21
    :try_end_176
    .catchall {:try_start_156 .. :try_end_176} :catchall_323

    .line 239
    if-eqz v4, :cond_198

    :try_start_178
    invoke-static/range {p0 .. p0}, Lcom/streambundle/v48/PlaybackLinks;->supportsSeparateAudio(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Z

    move-result v0

    if-eqz v0, :cond_198

    .line 240
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v12, v0}, Lokhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0
    :try_end_188
    .catchall {:try_start_178 .. :try_end_188} :catchall_55

    .line 241
    if-eqz v0, :cond_198

    .line 243
    :try_start_18a
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v11, v4}, Lcom/streambundle/v48/PlaybackLinks;->audioTrack(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0
    :try_end_196
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_18a .. :try_end_196} :catch_197
    .catchall {:try_start_18a .. :try_end_196} :catchall_55

    .line 244
    goto :goto_19a

    :catch_197
    move-exception v0

    .line 249
    :cond_198
    move-object/from16 v0, v21

    :goto_19a
    if-eqz v2, :cond_242

    if-eqz v4, :cond_1b7

    :try_start_19e
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4
    :try_end_1a2
    .catchall {:try_start_19e .. :try_end_1a2} :catchall_55

    if-eqz v4, :cond_1b7

    move-object/from16 v22, v3

    move/from16 v21, v5

    move-object/from16 v25, v6

    move-object v15, v7

    move-object/from16 v23, v8

    move-object v2, v9

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v24, v13

    move-object v13, v10

    goto/16 :goto_253

    .line 251
    :cond_1b7
    :try_start_1b7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v9, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_230

    .line 252
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getSource()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v22, v4

    new-instance v4, Ljava/lang/StringBuilder;

    move/from16 v23, v5

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "p"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v15}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v15

    .line 253
    sget-object v24, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;
    :try_end_1e6
    .catchall {:try_start_1b7 .. :try_end_1e6} :catchall_323

    .line 252
    move-object/from16 v28, v22

    move-object/from16 v22, v3

    move-object/from16 v3, v28

    move-object/from16 v4, v21

    move/from16 v21, v23

    move-object/from16 v25, v6

    move-object v6, v15

    move-object v15, v7

    move-object v7, v13

    move-object/from16 v23, v8

    move v8, v2

    move-object v2, v9

    move-object/from16 v9, v24

    move-object/from16 v24, v13

    move-object v13, v10

    move-object v10, v11

    move-object/from16 v26, v11

    move-object/from16 v11, p0

    move-object/from16 v27, v12

    move-object v12, v0

    :try_start_206
    invoke-static/range {v4 .. v12}, Lcom/streambundle/v48/PlaybackLinks;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/lagradost/cloudstream3/utils/ExtractorLinkType;Ljava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    const-string v0, "SUBTITLES"

    invoke-interface {v14, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22a

    invoke-interface {v14, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_227

    const-string v0, "NONE"

    invoke-interface {v14, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22a

    :cond_227
    move/from16 v0, v16

    goto :goto_22b

    :cond_22a
    const/4 v0, 0x1

    :goto_22b
    or-int v0, v17, v0

    move/from16 v17, v0

    goto :goto_26c

    .line 251
    :cond_230
    move-object/from16 v22, v3

    move/from16 v21, v5

    move-object/from16 v25, v6

    move-object v15, v7

    move-object/from16 v23, v8

    move-object v2, v9

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v24, v13

    move-object v13, v10

    goto :goto_26c

    .line 249
    :cond_242
    move-object/from16 v22, v3

    move/from16 v21, v5

    move-object/from16 v25, v6

    move-object v15, v7

    move-object/from16 v23, v8

    move-object v2, v9

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v24, v13

    move-object v13, v10

    .line 250
    :goto_253
    nop

    .line 251
    const/16 v17, 0x1

    goto :goto_26c

    .line 234
    :cond_257
    move-object/from16 v19, v2

    move-object/from16 v22, v3

    move/from16 v20, v4

    move/from16 v21, v5

    move-object/from16 v25, v6

    move-object v15, v7

    move-object/from16 v23, v8

    move-object v2, v9

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v24, v13

    move-object v13, v10

    .line 257
    :goto_26c
    const/4 v14, 0x0

    goto :goto_283

    .line 232
    :cond_26e
    move-object/from16 v19, v2

    move-object/from16 v22, v3

    move/from16 v20, v4

    move/from16 v21, v5

    move-object/from16 v25, v6

    move-object v15, v7

    move-object/from16 v23, v8

    move-object v2, v9

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v24, v13

    move-object v13, v10

    .line 228
    :goto_283
    add-int/lit8 v4, v20, 0x1

    move-object v9, v2

    move-object v10, v13

    move-object v7, v15

    move-object/from16 v2, v19

    move/from16 v5, v21

    move-object/from16 v3, v22

    move-object/from16 v8, v23

    move-object/from16 v13, v24

    move-object/from16 v6, v25

    move-object/from16 v11, v26

    move-object/from16 v12, v27

    const/4 v15, 0x1

    goto/16 :goto_b4

    .line 215
    :cond_29b
    move-object/from16 v19, v2

    move-object/from16 v22, v3

    move-object/from16 v25, v6

    move-object v15, v7

    move-object/from16 v23, v8

    move-object v2, v9

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v24, v13

    move-object v13, v10

    aget-object v3, v23, v4

    .line 216
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 217
    const-string v5, "#EXT-X-MEDIA:"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2bb

    goto :goto_2f6

    .line 218
    :cond_2bb
    invoke-static {v3}, Lcom/streambundle/v48/PlaybackLinks;->attributes(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 219
    const-string v5, "TYPE"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v6, v25

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f6

    invoke-interface {v3, v15}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2d4

    goto :goto_2f6

    .line 220
    :cond_2d4
    const-string v5, "GROUP-ID"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 221
    if-nez v5, :cond_2df

    goto :goto_2f6

    .line 222
    :cond_2df
    invoke-interface {v13, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2f3

    const-string v6, "YES"

    const-string v7, "DEFAULT"

    invoke-interface {v3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2f6

    .line 223
    :cond_2f3
    invoke-interface {v13, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    :cond_2f6
    :goto_2f6
    add-int/lit8 v4, v4, 0x1

    move-object v9, v2

    move-object v10, v13

    move-object/from16 v2, v19

    move-object/from16 v3, v22

    move-object/from16 v8, v23

    move-object/from16 v13, v24

    move-object/from16 v11, v26

    move-object/from16 v12, v27

    const/4 v15, 0x1

    goto/16 :goto_a7

    .line 206
    :cond_309
    move-object/from16 v22, v3

    :goto_30b
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_30f
    .catchall {:try_start_206 .. :try_end_30f} :catchall_321

    .line 266
    if-eqz v22, :cond_314

    :try_start_311
    invoke-virtual/range {v22 .. v22}, Lokhttp3/Response;->close()V
    :try_end_314
    .catchall {:try_start_311 .. :try_end_314} :catchall_32f

    :cond_314
    return-object v0

    .line 203
    :cond_315
    move-object/from16 v22, v3

    :goto_317
    :try_start_317
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_31b
    .catchall {:try_start_317 .. :try_end_31b} :catchall_321

    .line 266
    if-eqz v22, :cond_320

    :try_start_31d
    invoke-virtual/range {v22 .. v22}, Lokhttp3/Response;->close()V
    :try_end_320
    .catchall {:try_start_31d .. :try_end_320} :catchall_32f

    :cond_320
    return-object v0

    .line 265
    :catchall_321
    move-exception v0

    goto :goto_326

    :catchall_323
    move-exception v0

    move-object/from16 v22, v3

    :goto_326
    move-object v14, v0

    .line 266
    :goto_327
    if-eqz v22, :cond_32c

    :try_start_329
    invoke-virtual/range {v22 .. v22}, Lokhttp3/Response;->close()V

    :cond_32c
    throw v14
    :try_end_32d
    .catchall {:try_start_329 .. :try_end_32d} :catchall_32d

    :catchall_32d
    move-exception v0

    goto :goto_331

    :catchall_32f
    move-exception v0

    const/4 v14, 0x0

    :goto_331
    if-eqz v14, :cond_339

    if-eq v14, v0, :cond_33a

    invoke-virtual {v14, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_33a

    :cond_339
    move-object v14, v0

    :cond_33a
    :goto_33a
    throw v14
.end method

.method private static integer([BI)I
    .registers 4

    .line 316
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 317
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    .line 316
    or-int/2addr v0, v1

    .line 317
    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    .line 316
    or-int/2addr p0, v0

    return p0
.end method

.method private static isManifest([B)Z
    .registers 3

    .line 126
    new-instance v0, Ljava/lang/String;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const-string p0, "\ufeff"

    const-string v1, ""

    invoke-virtual {v0, p0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 127
    const-string v0, "#EXTM3U"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_25

    const-string v0, "(?s)^(?:<\\?xml[^>]*>\\s*)?<MPD(?:\\s|>).*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_25

    const/4 p0, 0x0

    return p0

    :cond_25
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$0(Ljava/lang/String;ILjava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    .line 107
    check-cast p5, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .line 108
    if-nez p0, :cond_6

    const-string p0, ""

    :cond_6
    invoke-virtual {p5, p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setReferer(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p5, p1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setQuality(I)V

    .line 110
    if-nez p2, :cond_12

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p2

    :cond_12
    invoke-virtual {p5, p2}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->setHeaders(Ljava/util/Map;)V

    .line 111
    if-eqz p3, :cond_25

    .line 112
    const-string p0, "ExtractorData"

    const-class p1, Ljava/lang/String;

    invoke-static {p3, p5, p0, p1}, Lcom/streambundle/v48/PlaybackLinks;->copyField(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/lang/String;Ljava/lang/Class;)V

    .line 113
    const-string p0, "AudioTracks"

    const-class p1, Ljava/util/List;

    invoke-static {p3, p5, p0, p1}, Lcom/streambundle/v48/PlaybackLinks;->copyField(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/lang/String;Ljava/lang/Class;)V

    .line 115
    :cond_25
    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2e

    invoke-static {p5, p4}, Lcom/streambundle/v48/PlaybackLinks;->setAudio(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)V

    .line 116
    :cond_2e
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static mp4Height(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)I
    .registers 12

    .line 281
    const-string v0, "Range"

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getReferer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getHeaders()Ljava/util/Map;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/streambundle/v48/PlaybackLinks;->request(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lokhttp3/Request$Builder;

    move-result-object v1

    .line 282
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object p0

    const-wide/16 v2, 0x514

    invoke-static {p0, v2, v3}, Lcom/streambundle/v48/PlaybackLinks;->client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;

    move-result-object p0

    .line 283
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_1e
    const-string v4, "bytes=0-262143"

    invoke-virtual {v1, v0, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v4

    invoke-virtual {p0, v4}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v4

    invoke-interface {v4}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v4
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_c2

    .line 284
    :try_start_30
    invoke-virtual {v4}, Lokhttp3/Response;->isSuccessful()Z

    move-result v5

    if-eqz v5, :cond_b4

    invoke-virtual {v4}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    if-nez v5, :cond_3e

    goto/16 :goto_b4

    .line 285
    :cond_3e
    const-wide/32 v5, 0x40000

    invoke-virtual {v4, v5, v6}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object v7

    .line 286
    invoke-static {v7}, Lcom/streambundle/v48/PlaybackLinks;->mp4Height([B)I

    move-result v8

    .line 287
    if-gtz v8, :cond_ae

    invoke-virtual {v4}, Lokhttp3/Response;->code()I

    move-result v9

    const/16 v10, 0xce

    if-ne v9, v10, :cond_ae

    invoke-static {v7}, Lcom/streambundle/v48/ResolveMedia;->validMedia([B)Z

    move-result v7
    :try_end_5b
    .catchall {:try_start_30 .. :try_end_5b} :catchall_ba

    if-nez v7, :cond_5e

    goto :goto_ae

    .line 288
    :cond_5e
    if-eqz v4, :cond_63

    :try_start_60
    invoke-virtual {v4}, Lokhttp3/Response;->close()V
    :try_end_63
    .catchall {:try_start_60 .. :try_end_63} :catchall_c2

    .line 291
    :cond_63
    :try_start_63
    const-string v4, "bytes=-262144"

    invoke-virtual {v1, v0, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {p0, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p0
    :try_end_75
    .catchall {:try_start_63 .. :try_end_75} :catchall_a2

    .line 292
    :try_start_75
    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result v0

    if-ne v0, v10, :cond_94

    invoke-virtual {p0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    if-nez v0, :cond_82

    goto :goto_94

    .line 293
    :cond_82
    invoke-virtual {p0, v5, v6}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v48/PlaybackLinks;->mp4Height([B)I

    move-result v0
    :try_end_8e
    .catchall {:try_start_75 .. :try_end_8e} :catchall_9a

    .line 294
    if-eqz p0, :cond_93

    :try_start_90
    invoke-virtual {p0}, Lokhttp3/Response;->close()V

    .line 293
    :cond_93
    return v0

    .line 294
    :cond_94
    :goto_94
    if-eqz p0, :cond_99

    invoke-virtual {p0}, Lokhttp3/Response;->close()V

    .line 292
    :cond_99
    return v2

    .line 293
    :catchall_9a
    move-exception v0

    move-object v3, v0

    .line 294
    if-eqz p0, :cond_a1

    invoke-virtual {p0}, Lokhttp3/Response;->close()V

    :cond_a1
    throw v3
    :try_end_a2
    .catchall {:try_start_90 .. :try_end_a2} :catchall_a2

    :catchall_a2
    move-exception p0

    if-eqz v3, :cond_ab

    if-eq v3, p0, :cond_aa

    :try_start_a7
    invoke-virtual {v3, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_aa
    move-object p0, v3

    :cond_ab
    throw p0
    :try_end_ac
    .catch Ljava/lang/Exception; {:try_start_a7 .. :try_end_ac} :catch_ac

    :catch_ac
    move-exception p0

    .line 295
    return v2

    .line 288
    :cond_ae
    :goto_ae
    if-eqz v4, :cond_b3

    :try_start_b0
    invoke-virtual {v4}, Lokhttp3/Response;->close()V

    :cond_b3
    return v8

    :cond_b4
    :goto_b4
    if-eqz v4, :cond_b9

    invoke-virtual {v4}, Lokhttp3/Response;->close()V

    .line 284
    :cond_b9
    return v2

    .line 288
    :catchall_ba
    move-exception p0

    move-object v3, p0

    if-eqz v4, :cond_c1

    invoke-virtual {v4}, Lokhttp3/Response;->close()V

    :cond_c1
    throw v3
    :try_end_c2
    .catchall {:try_start_b0 .. :try_end_c2} :catchall_c2

    :catchall_c2
    move-exception p0

    if-eqz v3, :cond_cb

    if-eq v3, p0, :cond_ca

    :try_start_c7
    invoke-virtual {v3, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_ca
    move-object p0, v3

    :cond_cb
    throw p0
    :try_end_cc
    .catch Ljava/lang/Exception; {:try_start_c7 .. :try_end_cc} :catch_cc

    :catch_cc
    move-exception p0

    .line 289
    return v2
.end method

.method static mp4Height([B)I
    .registers 7

    .line 300
    nop

    .line 301
    const/4 v0, 0x0

    const/4 v1, 0x4

    :goto_3
    add-int/lit8 v2, v1, 0x8

    array-length v3, p0

    if-le v2, v3, :cond_9

    .line 312
    return v0

    .line 302
    :cond_9
    aget-byte v2, p0, v1

    const/16 v3, 0x74

    if-ne v2, v3, :cond_59

    add-int/lit8 v2, v1, 0x1

    aget-byte v2, p0, v2

    const/16 v3, 0x6b

    if-ne v2, v3, :cond_59

    add-int/lit8 v2, v1, 0x2

    aget-byte v2, p0, v2

    const/16 v3, 0x68

    if-ne v2, v3, :cond_59

    add-int/lit8 v2, v1, 0x3

    aget-byte v2, p0, v2

    const/16 v4, 0x64

    if-eq v2, v4, :cond_28

    goto :goto_59

    .line 303
    :cond_28
    add-int/lit8 v2, v1, -0x4

    invoke-static {p0, v2}, Lcom/streambundle/v48/PlaybackLinks;->integer([BI)I

    move-result v4

    .line 304
    add-int/2addr v2, v4

    .line 305
    const/16 v5, 0x5c

    if-eq v4, v5, :cond_35

    if-ne v4, v3, :cond_59

    :cond_35
    array-length v3, p0

    if-le v2, v3, :cond_39

    goto :goto_59

    .line 306
    :cond_39
    add-int/lit8 v3, v2, -0x8

    invoke-static {p0, v3}, Lcom/streambundle/v48/PlaybackLinks;->integer([BI)I

    move-result v3

    ushr-int/lit8 v3, v3, 0x10

    .line 307
    add-int/lit8 v2, v2, -0x4

    invoke-static {p0, v2}, Lcom/streambundle/v48/PlaybackLinks;->integer([BI)I

    move-result v2

    ushr-int/lit8 v2, v2, 0x10

    .line 308
    const/16 v4, 0x40

    if-lt v3, v4, :cond_59

    const/16 v5, 0x4000

    if-gt v3, v5, :cond_59

    if-lt v2, v4, :cond_59

    if-gt v2, v5, :cond_59

    .line 309
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 301
    :cond_59
    :goto_59
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method static normalize(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            ">;"
        }
    .end annotation

    .line 169
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    if-eq v0, v1, :cond_d

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 170
    :cond_d
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v2

    .line 171
    invoke-static {v2}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    .line 172
    if-nez v0, :cond_1c

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 173
    :cond_1c
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getType()Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    move-result-object v1

    .line 174
    sget-object v3, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    const/4 v4, 0x0

    if-eq v1, v3, :cond_39

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v3

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v5, ".m3u8"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_39

    move v3, v4

    goto :goto_3a

    :cond_39
    const/4 v3, 0x1

    .line 175
    :goto_3a
    sget-object v5, Lcom/streambundle/v48/PlaybackLinks;->KNOWN:Ljava/util/Set;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getQuality()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4f

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getQuality()I

    move-result v5

    goto :goto_57

    :cond_4f
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v2}, Lcom/streambundle/v48/PlaybackLinks;->height(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 176
    :goto_57
    if-eqz v3, :cond_89

    .line 177
    nop

    .line 179
    :try_start_5a
    invoke-static {p0}, Lcom/streambundle/v48/PlaybackLinks;->hls(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Ljava/util/List;

    move-result-object v0

    .line 180
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_65

    return-object v0

    .line 181
    :cond_65
    sget-object v0, Lcom/streambundle/v48/PlaybackLinks;->KNOWN:Ljava/util/Set;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getQuality()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7a

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getQuality()I

    move-result v0

    goto :goto_82

    :cond_7a
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/streambundle/v48/PlaybackLinks;->height(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_82} :catch_86
    .catch Ljava/lang/LinkageError; {:try_start_5a .. :try_end_82} :catch_84

    :goto_82
    move v5, v0

    .line 182
    goto :goto_a5

    :catch_84
    move-exception v0

    goto :goto_87

    :catch_86
    move-exception v0

    .line 185
    :goto_87
    move v5, v4

    goto :goto_a5

    :cond_89
    sget-object v6, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->VIDEO:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    if-ne v1, v6, :cond_a5

    if-nez v5, :cond_a5

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v6, ".mp4"

    invoke-virtual {v0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a5

    .line 186
    invoke-static {p0}, Lcom/streambundle/v48/PlaybackLinks;->mp4Height(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)I

    move-result v5

    .line 189
    :cond_a5
    :goto_a5
    if-lez v5, :cond_bf

    :try_start_a7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "p"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c6

    .line 193
    :catch_bb
    move-exception v0

    goto :goto_f3

    :catch_bd
    move-exception v0

    goto :goto_f3

    .line 189
    :cond_bf
    if-eqz v3, :cond_c4

    const-string v0, ""

    goto :goto_c6

    :cond_c4
    const-string v0, "\u041e\u0440\u0438\u0433\u0438\u043d\u0430\u043b"

    :goto_c6
    move-object v6, v0

    .line 190
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getSource()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getReferer()Ljava/lang/String;

    move-result-object v7

    .line 191
    if-lez v5, :cond_d3

    move v4, v5

    goto :goto_d8

    :cond_d3
    if-eqz v3, :cond_d6

    goto :goto_d8

    :cond_d6
    const/16 v4, 0x190

    :goto_d8
    if-eqz v3, :cond_dc

    sget-object v1, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    :cond_dc
    move-object v5, v1

    .line 192
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getHeaders()Ljava/util/Map;

    move-result-object v8

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v9

    .line 190
    move-object v1, v6

    move-object v3, v7

    move-object v6, v8

    move-object v7, p0

    move-object v8, v9

    invoke-static/range {v0 .. v8}, Lcom/streambundle/v48/PlaybackLinks;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/lagradost/cloudstream3/utils/ExtractorLinkType;Ljava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_a7 .. :try_end_f2} :catch_bd
    .catch Ljava/lang/LinkageError; {:try_start_a7 .. :try_end_f2} :catch_bb

    return-object p0

    .line 194
    :goto_f3
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lokhttp3/Request$Builder;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lokhttp3/Request$Builder;"
        }
    .end annotation

    .line 65
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    const-string v0, "User-Agent"

    const-string v1, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-virtual {p0, v0, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    .line 66
    if-eqz p2, :cond_52

    .line 67
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1b
    :goto_1b
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_22

    goto :goto_52

    :cond_22
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 68
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "Range"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 69
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_1b

    .line 73
    :cond_52
    :goto_52
    if-eqz p1, :cond_69

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_69

    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p2

    const-string v0, "Referer"

    invoke-virtual {p2, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_69

    .line 74
    invoke-virtual {p0, v0, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 76
    :cond_69
    return-object p0
.end method

.method private static setAudio(Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 141
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setAudioTracks"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/util/List;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_19
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_19} :catch_1b

    .line 142
    nop

    .line 145
    return-void

    .line 142
    :catch_1b
    move-exception p0

    .line 143
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method private static supportsSeparateAudio(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Z
    .registers 6

    .line 149
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v1, "setAudioTracks"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/util/List;

    aput-object v4, v3, v0

    invoke-virtual {p0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_11
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_11} :catch_12

    .line 150
    return v2

    .line 151
    :catch_12
    move-exception p0

    .line 152
    return v0
.end method

.method public static verified(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    .registers 15

    .line 80
    const-string v0, "Cookie"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    const/4 v3, 0x0

    if-ne v1, v2, :cond_f2

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v48/ResolveMedia;->unwanted(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    goto/16 :goto_f2

    .line 84
    :cond_17
    :try_start_17
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v4, 0x76c

    invoke-static {v1, v4, v5}, Lcom/streambundle/v48/PlaybackLinks;->client(Ljava/lang/String;J)Lokhttp3/OkHttpClient;

    move-result-object v1

    .line 85
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getReferer()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getHeaders()Ljava/util/Map;

    move-result-object v5

    invoke-static {v2, v4, v5}, Lcom/streambundle/v48/PlaybackLinks;->request(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lokhttp3/Request$Builder;

    move-result-object v2
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_31} :catch_f0
    .catch Ljava/lang/LinkageError; {:try_start_17 .. :try_end_31} :catch_ee

    .line 86
    const/4 v4, 0x1

    :try_start_32
    invoke-static {v1, v2, v4}, Lcom/streambundle/v48/PlaybackFallback;->fetch(Lokhttp3/OkHttpClient;Lokhttp3/Request$Builder;Z)Lokhttp3/Response;

    move-result-object v1
    :try_end_36
    .catchall {:try_start_32 .. :try_end_36} :catchall_e3

    .line 87
    :try_start_36
    invoke-virtual {v1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v2

    if-eqz v2, :cond_d1

    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    if-eqz v2, :cond_d1

    invoke-virtual {v1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundle/v48/ResolveMedia;->unwanted(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_56

    goto/16 :goto_d1

    .line 88
    :cond_56
    const-wide/16 v4, 0x200

    invoke-virtual {v1, v4, v5}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object v2

    .line 89
    invoke-static {v2}, Lcom/streambundle/v48/ResolveMedia;->validMedia([B)Z

    move-result v4

    if-nez v4, :cond_72

    invoke-static {v2}, Lcom/streambundle/v48/PlaybackLinks;->isManifest([B)Z

    move-result v2
    :try_end_6a
    .catchall {:try_start_36 .. :try_end_6a} :catchall_d7

    if-nez v2, :cond_72

    .line 97
    if-eqz v1, :cond_71

    :try_start_6e
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_e3

    .line 89
    :cond_71
    return-object v3

    .line 90
    :cond_72
    :try_start_72
    new-instance v10, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getHeaders()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v10, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 91
    invoke-virtual {v1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v2, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 92
    if-eqz v2, :cond_88

    invoke-interface {v10, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    :cond_88
    invoke-virtual {v1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v6

    .line 94
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_ae

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getHeaders()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_a6
    .catchall {:try_start_72 .. :try_end_a6} :catchall_d7

    if-eqz v0, :cond_ae

    .line 97
    if-eqz v1, :cond_ad

    :try_start_aa
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_ad
    .catchall {:try_start_aa .. :try_end_ad} :catchall_e3

    :cond_ad
    return-object p0

    .line 95
    :cond_ae
    :try_start_ae
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getSource()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getReferer()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getQuality()I

    move-result v8

    .line 96
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getType()Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    move-result-object v9

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v12

    .line 95
    move-object v11, p0

    invoke-static/range {v4 .. v12}, Lcom/streambundle/v48/PlaybackLinks;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/lagradost/cloudstream3/utils/ExtractorLinkType;Ljava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    move-result-object p0
    :try_end_cb
    .catchall {:try_start_ae .. :try_end_cb} :catchall_d7

    .line 97
    if-eqz v1, :cond_d0

    :try_start_cd
    invoke-virtual {v1}, Lokhttp3/Response;->close()V

    .line 95
    :cond_d0
    return-object p0

    .line 97
    :cond_d1
    :goto_d1
    if-eqz v1, :cond_d6

    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_d6
    .catchall {:try_start_cd .. :try_end_d6} :catchall_e3

    .line 87
    :cond_d6
    return-object v3

    .line 95
    :catchall_d7
    move-exception p0

    .line 97
    if-eqz v1, :cond_dd

    :try_start_da
    invoke-virtual {v1}, Lokhttp3/Response;->close()V

    :cond_dd
    throw p0
    :try_end_de
    .catchall {:try_start_da .. :try_end_de} :catchall_de

    :catchall_de
    move-exception v0

    move-object v13, v0

    move-object v0, p0

    move-object p0, v13

    goto :goto_e5

    :catchall_e3
    move-exception p0

    move-object v0, v3

    :goto_e5
    if-eqz v0, :cond_ed

    if-eq v0, p0, :cond_ec

    :try_start_e9
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_ec
    move-object p0, v0

    :cond_ed
    throw p0
    :try_end_ee
    .catch Ljava/lang/Exception; {:try_start_e9 .. :try_end_ee} :catch_f0
    .catch Ljava/lang/LinkageError; {:try_start_e9 .. :try_end_ee} :catch_ee

    .line 98
    :catch_ee
    move-exception p0

    goto :goto_f1

    :catch_f0
    move-exception p0

    .line 99
    :goto_f1
    return-object v3

    .line 81
    :cond_f2
    :goto_f2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    if-ne v0, v1, :cond_fb

    move-object p0, v3

    :cond_fb
    return-object p0
.end method
