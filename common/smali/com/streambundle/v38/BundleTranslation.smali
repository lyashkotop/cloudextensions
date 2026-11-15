.class public final Lcom/streambundle/v38/BundleTranslation;
.super Ljava/lang/Object;
.source "BundleTranslation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/BundleTranslation$Transport;
    }
.end annotation


# static fields
.field private static final CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/FutureTask<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final FAILED:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field static volatile transport:Lcom/streambundle/v38/BundleTranslation$Transport;


# direct methods
.method public static synthetic $r8$lambda$Tj9jUbm5ENLa-sWqyOmhmkhhbew(Ljava/lang/String;I)Ljava/lang/String;
    .registers 2

    invoke-static {p0, p1}, Lcom/streambundle/v38/BundleTranslation;->request(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 4

    .line 11
    new-instance v0, Lcom/streambundle/v38/BundleTranslation$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/streambundle/v38/BundleTranslation$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/streambundle/v38/BundleTranslation;->transport:Lcom/streambundle/v38/BundleTranslation$Transport;

    .line 13
    new-instance v0, Lcom/streambundle/v38/BundleTranslation$1;

    const/16 v1, 0x20

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/streambundle/v38/BundleTranslation$1;-><init>(IFZ)V

    .line 12
    sput-object v0, Lcom/streambundle/v38/BundleTranslation;->CACHE:Ljava/util/Map;

    .line 16
    new-instance v0, Lcom/streambundle/v38/BundleTranslation$2;

    invoke-direct {v0, v1, v2, v3}, Lcom/streambundle/v38/BundleTranslation$2;-><init>(IFZ)V

    sput-object v0, Lcom/streambundle/v38/BundleTranslation;->FAILED:Ljava/util/Map;

    .line 18
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static download(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    .line 53
    const-string v0, "ru"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v0, "en"

    .line 55
    :cond_a
    const-string v0, "auto"
    :try_start_a
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/translate_a/single?client=gtx&sl="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&tl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 56
    const-string v1, "&dt=t&q="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 57
    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "https://translate.googleapis.com"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "https://translate.google.com"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    .line 58
    const/16 v3, 0x4e2

    const/16 v5, 0x28a

    filled-new-array {v3, v5}, [I

    move-result-object v3
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_48} :catch_7c

    .line 59
    nop

    :goto_49
    if-lt v4, v1, :cond_4c

    .line 65
    goto :goto_7d

    .line 61
    :cond_4c
    :try_start_4c
    sget-object v5, Lcom/streambundle/v38/BundleTranslation;->transport:Lcom/streambundle/v38/BundleTranslation$Transport;

    new-instance v6, Ljava/lang/StringBuilder;

    aget-object v7, v2, v4

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aget v7, v3, v4

    invoke-interface {v5, v6, v7}, Lcom/streambundle/v38/BundleTranslation$Transport;->get(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/streambundle/v38/BundleTranslation;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 62
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_79

    invoke-virtual {v5, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_75} :catch_78

    if-nez v6, :cond_79

    return-object v5

    .line 63
    :catch_78
    move-exception v5

    .line 59
    :cond_79
    add-int/lit8 v4, v4, 0x1

    goto :goto_49

    .line 65
    :catch_7c
    move-exception p0

    .line 66
    :goto_7d
    const-string p0, ""

    return-object p0
.end method

.method static synthetic lambda$1(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 33
    invoke-static {p0, p1}, Lcom/streambundle/v38/BundleTranslation;->download(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 71
    const-string v0, ""

    :try_start_2
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v1

    .line 72
    if-nez v1, :cond_f

    return-object v0

    .line 73
    :cond_f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    const/4 v3, 0x0

    :goto_15
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v3, v4, :cond_4d

    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 79
    const-string v1, "ru"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_29} :catch_65

    const-string v2, "(?s).*[\u0410-\u042f\u0430-\u044f\u0401\u0451].*"

    if-eqz v1, :cond_35

    :try_start_2d
    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_34

    move-object v0, p0

    :cond_34
    return-object v0

    .line 80
    :cond_35
    const-string v1, "en"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_66

    const-string p1, "(?s).*[A-Za-z].*"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4c

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4c

    move-object v0, p0

    :cond_4c
    return-object v0

    .line 75
    :cond_4d
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v4

    .line 76
    if-eqz v4, :cond_62

    invoke-virtual {v4, p0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Ljava/lang/String;

    if-eqz v5, :cond_62

    invoke-virtual {v4, p0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_62} :catch_65

    .line 74
    :cond_62
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 81
    :catch_65
    move-exception p0

    .line 82
    :cond_66
    return-object v0
.end method

.method private static request(Ljava/lang/String;I)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 86
    const-string v0, "com.lagradost.cloudstream3.MainActivityKt"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "getApp"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "getBaseClient"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/OkHttpClient;

    .line 88
    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 89
    int-to-long v1, p1

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, p1}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 90
    sget-object v0, Lokhttp3/CookieJar;->NO_COOKIES:Lokhttp3/CookieJar;

    invoke-virtual {p1, v0}, Lokhttp3/OkHttpClient$Builder;->cookieJar(Lokhttp3/CookieJar;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 91
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p1

    .line 88
    nop

    .line 92
    :try_start_40
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p0

    invoke-virtual {p1, p0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p0
    :try_end_55
    .catchall {:try_start_40 .. :try_end_55} :catchall_83

    .line 93
    :try_start_55
    invoke-virtual {p0}, Lokhttp3/Response;->isSuccessful()Z

    move-result p1

    if-eqz p1, :cond_73

    invoke-virtual {p0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    if-nez p1, :cond_62

    goto :goto_73

    .line 94
    :cond_62
    const-wide/32 v0, 0x10000

    invoke-virtual {p0, v0, v1}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1
    :try_end_6d
    .catchall {:try_start_55 .. :try_end_6d} :catchall_7b

    .line 95
    if-eqz p0, :cond_72

    :try_start_6f
    invoke-virtual {p0}, Lokhttp3/Response;->close()V

    .line 94
    :cond_72
    return-object p1

    .line 95
    :cond_73
    :goto_73
    if-eqz p0, :cond_78

    invoke-virtual {p0}, Lokhttp3/Response;->close()V
    :try_end_78
    .catchall {:try_start_6f .. :try_end_78} :catchall_83

    .line 93
    :cond_78
    const-string p0, ""

    return-object p0

    .line 94
    :catchall_7b
    move-exception p1

    move-object v3, p1

    .line 95
    if-eqz p0, :cond_82

    :try_start_7f
    invoke-virtual {p0}, Lokhttp3/Response;->close()V

    :cond_82
    throw v3
    :try_end_83
    .catchall {:try_start_7f .. :try_end_83} :catchall_83

    :catchall_83
    move-exception p0

    if-eqz v3, :cond_8c

    if-eq v3, p0, :cond_8b

    invoke-virtual {v3, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8b
    move-object p0, v3

    :cond_8c
    throw p0
.end method

.method public static translate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-static {p0, p1}, Lcom/streambundle/v43/QueryWords;->local(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_b

    return-object v0

    :cond_b
    invoke-static {p0, p1}, Lcom/streambundle/v38/BundleTranslation;->translateRemote(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static translateRemote(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 23
    const-string v0, "ru"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    const-string v0, "en"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    const-string p0, ""

    return-object p0

    .line 24
    :cond_13
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\s+"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 27
    nop

    .line 28
    sget-object v1, Lcom/streambundle/v38/BundleTranslation;->CACHE:Ljava/util/Map;

    monitor-enter v1

    .line 29
    :try_start_40
    sget-object v2, Lcom/streambundle/v38/BundleTranslation;->FAILED:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 30
    if-eqz v2, :cond_5e

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v3, v5

    const-wide/32 v5, 0xea60

    cmp-long v2, v3, v5

    if-gez v2, :cond_5e

    monitor-exit v1
    :try_end_5b
    .catchall {:try_start_40 .. :try_end_5b} :catchall_c4

    const-string p0, ""

    return-object p0

    .line 31
    :cond_5e
    :try_start_5e
    sget-object v2, Lcom/streambundle/v38/BundleTranslation;->CACHE:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/FutureTask;

    .line 32
    if-nez v2, :cond_79

    .line 33
    new-instance v2, Ljava/util/concurrent/FutureTask;

    new-instance v3, Lcom/streambundle/v38/BundleTranslation$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, p1}, Lcom/streambundle/v38/BundleTranslation$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 34
    sget-object p0, Lcom/streambundle/v38/BundleTranslation;->CACHE:Ljava/util/Map;

    invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    const/4 p0, 0x1

    goto :goto_7a

    .line 32
    :cond_79
    const/4 p0, 0x0

    .line 28
    :goto_7a
    monitor-exit v1
    :try_end_7b
    .catchall {:try_start_5e .. :try_end_7b} :catchall_c4

    .line 38
    if-eqz p0, :cond_80

    invoke-virtual {v2}, Ljava/util/concurrent/FutureTask;->run()V

    .line 40
    :cond_80
    :try_start_80
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x898

    invoke-virtual {v2, v3, v4, p0}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 41
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_b2

    sget-object p1, Lcom/streambundle/v38/BundleTranslation;->CACHE:Ljava/util/Map;

    monitor-enter p1
    :try_end_93
    .catch Ljava/lang/InterruptedException; {:try_start_80 .. :try_end_93} :catch_b9
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_80 .. :try_end_93} :catch_b5
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_80 .. :try_end_93} :catch_b3

    .line 42
    :try_start_93
    sget-object v1, Lcom/streambundle/v38/BundleTranslation;->CACHE:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v2, :cond_a0

    sget-object v1, Lcom/streambundle/v38/BundleTranslation;->CACHE:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    :cond_a0
    sget-object v1, Lcom/streambundle/v38/BundleTranslation;->FAILED:Ljava/util/Map;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p1

    goto :goto_b2

    :catchall_af
    move-exception p0

    monitor-exit p1
    :try_end_b1
    .catchall {:try_start_93 .. :try_end_b1} :catchall_af

    :try_start_b1
    throw p0
    :try_end_b2
    .catch Ljava/lang/InterruptedException; {:try_start_b1 .. :try_end_b2} :catch_b9
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_b1 .. :try_end_b2} :catch_b5
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_b1 .. :try_end_b2} :catch_b3

    .line 45
    :cond_b2
    :goto_b2
    return-object p0

    .line 49
    :catch_b3
    move-exception p0

    goto :goto_b6

    :catch_b5
    move-exception p0

    :goto_b6
    const-string p0, ""

    return-object p0

    .line 46
    :catch_b9
    move-exception p0

    .line 47
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 48
    const-string p0, ""

    return-object p0

    .line 28
    :catchall_c4
    move-exception p0

    :try_start_c5
    monitor-exit v1
    :try_end_c6
    .catchall {:try_start_c5 .. :try_end_c6} :catchall_c4

    throw p0
.end method
