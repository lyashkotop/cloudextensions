.class public final Lcom/streambundle/v43/SiteAccess;
.super Ljava/lang/Object;
.source "SiteAccess.java"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v43/SiteAccess$ChallengeChain;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lokhttp3/Interceptor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 10
    new-instance v0, Lcom/streambundle/v43/SiteAccess;

    invoke-direct {v0}, Lcom/streambundle/v43/SiteAccess;-><init>()V

    sput-object v0, Lcom/streambundle/v43/SiteAccess;->INSTANCE:Lokhttp3/Interceptor;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static browserAgent()Ljava/lang/String;
    .registers 6

    .line 30
    const-string v0, ""

    :try_start_2
    const-string v1, "com.lagradost.cloudstream3.network.WebViewResolver"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 31
    const-string v2, "Companion"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getWebViewUserAgent"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 33
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_2d

    check-cast v1, Ljava/lang/String;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2c} :catch_2e

    move-object v0, v1

    :cond_2d
    return-object v0

    .line 34
    :catch_2e
    move-exception v1

    return-object v0
.end method

.method static browserCookies(Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 22
    const-string v0, ""

    :try_start_2
    const-string v1, "android.webkit.CookieManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 23
    const-string v2, "getInstance"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 24
    const-string v4, "getCookie"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v3

    invoke-virtual {v1, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v4, v5, [Ljava/lang/Object;

    aput-object p0, v4, v3

    invoke-virtual {v1, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 25
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_34

    check-cast p0, Ljava/lang/String;
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_33} :catch_35

    move-object v0, p0

    :cond_34
    return-object v0

    .line 26
    :catch_35
    move-exception p0

    return-object v0
.end method

.method public static forUrl(Ljava/lang/String;)Lokhttp3/Interceptor;
    .registers 2

    .line 13
    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 14
    const-string v0, "tubesafari.com"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "strip2.co"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "punishbang.com"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1d

    goto :goto_1f

    :cond_1d
    const/4 p0, 0x0

    goto :goto_21

    :cond_1f
    :goto_1f
    sget-object p0, Lcom/streambundle/v43/SiteAccess;->INSTANCE:Lokhttp3/Interceptor;

    :goto_21
    return-object p0
.end method

.method public static interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;
    .registers 2

    .line 17
    invoke-static {p0}, Lcom/streambundle/v43/SiteAccess;->forUrl(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v0

    .line 18
    if-nez v0, :cond_a

    invoke-static {p0}, Lcom/streambundleextra/NetworkSupport;->interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v0

    :cond_a
    return-object v0
.end method

.method static isCloudflare(Lokhttp3/Response;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x193

    const/4 v2, 0x0

    if-eq v0, v1, :cond_12

    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x1f7

    if-eq v0, v1, :cond_12

    return v2

    .line 70
    :cond_12
    const-string v0, "Server"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 71
    const-string v3, "cloudflare"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v3, 0x1

    if-nez v0, :cond_6e

    const-string v0, "CF-Ray"

    invoke-virtual {p0, v0, v1}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 72
    const-string v0, "CF-Mitigated"

    invoke-virtual {p0, v0, v1}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "challenge"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_44

    goto :goto_6e

    .line 73
    :cond_44
    const-wide/16 v0, 0x4000

    invoke-virtual {p0, v0, v1}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 74
    const-string v0, "/cdn-cgi/challenge-platform/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6d

    const-string v0, "id=\"cf-wrapper\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6d

    .line 75
    const-string v0, "<title>attention required! | cloudflare</title>"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_6d

    .line 74
    return v2

    :cond_6d
    return v3

    .line 72
    :cond_6e
    :goto_6e
    return v3
.end method

.method static withoutClearance(Lokhttp3/Request;)Lokhttp3/Request;
    .registers 8

    .line 78
    const-string v0, "Cookie"

    invoke-virtual {p0, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 79
    if-nez v1, :cond_9

    return-object p0

    .line 80
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    const-string v3, ";"

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v3, v1

    const/4 v4, 0x0

    :goto_16
    if-lt v4, v3, :cond_32

    .line 86
    invoke-virtual {p0}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    .line 87
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_2d

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 88
    :cond_2d
    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p0

    return-object p0

    .line 81
    :cond_32
    aget-object v5, v1, v4

    .line 82
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 83
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_55

    const-string v6, "cf_clearance="

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_47

    goto :goto_55

    .line 84
    :cond_47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_52

    const-string v6, "; "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_52
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    :cond_55
    :goto_55
    add-int/lit8 v4, v4, 0x1

    goto :goto_16
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v43/SiteAccess;->browserCookies(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 39
    nop

    .line 40
    const-string v2, "cf_clearance="

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_b8

    .line 41
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 42
    const-string v3, "Cookie"

    invoke-virtual {v0, v3}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundle/v43/Repair43;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4, v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_2e
    const/4 v6, 0x2

    if-lt v5, v6, :cond_8f

    .line 47
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_3e
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_64

    .line 51
    invoke-virtual {v0}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    .line 52
    invoke-static {}, Lcom/streambundle/v43/SiteAccess;->browserAgent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5f

    const-string v3, "User-Agent"

    invoke-virtual {v1, v3, v2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 54
    :cond_5f
    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    goto :goto_b9

    .line 48
    :cond_64
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 49
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_75

    const-string v2, "; "

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_75
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v4, 0x3d

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3e

    .line 42
    :cond_8f
    aget-object v7, v1, v5

    .line 43
    const-string v8, ";"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    const/4 v9, 0x0

    :goto_99
    if-lt v9, v8, :cond_9e

    .line 42
    add-int/lit8 v5, v5, 0x1

    goto :goto_2e

    .line 43
    :cond_9e
    aget-object v10, v7, v9

    .line 44
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    const-string v11, "="

    invoke-virtual {v10, v11, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v10

    .line 45
    array-length v11, v10

    if-ne v11, v6, :cond_b5

    aget-object v11, v10, v4

    const/4 v12, 0x1

    aget-object v10, v10, v12

    invoke-virtual {v2, v11, v10}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    :cond_b5
    add-int/lit8 v9, v9, 0x1

    goto :goto_99

    .line 40
    :cond_b8
    move-object v1, v0

    .line 56
    :goto_b9
    invoke-interface {p1, v1}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v2

    .line 57
    invoke-static {v2}, Lcom/streambundle/v43/SiteAccess;->isCloudflare(Lokhttp3/Response;)Z

    move-result v3

    if-nez v3, :cond_c4

    return-object v2

    .line 58
    :cond_c4
    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v3, "punishbang.com"

    invoke-static {v0, v3}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const-wide/16 v3, 0x1f40

    if-eqz v0, :cond_e9

    .line 59
    invoke-virtual {v2}, Lokhttp3/Response;->close()V

    .line 60
    sget-object v0, Lcom/streambundle/v43/PunishBrowser;->INSTANCE:Lcom/streambundle/v43/PunishBrowser;

    new-instance v2, Lcom/streambundle/v43/SiteAccess$ChallengeChain;

    invoke-static {v1}, Lcom/streambundle/v43/SiteAccess;->withoutClearance(Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v1

    invoke-direct {v2, p1, v1}, Lcom/streambundle/v43/SiteAccess$ChallengeChain;-><init>(Lokhttp3/Interceptor$Chain;Lokhttp3/Request;)V

    invoke-static {v0, v2, v3, v4}, Lcom/streambundle/v43/BoundedChallenge;->solve(Lokhttp3/Interceptor;Lokhttp3/Interceptor$Chain;J)Lokhttp3/Response;

    move-result-object p1

    return-object p1

    .line 62
    :cond_e9
    invoke-virtual {v2}, Lokhttp3/Response;->close()V

    .line 65
    const-string v0, "https://www.punishbang.com/"

    invoke-static {v0}, Lcom/streambundleextra/NetworkSupport;->interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v0

    .line 66
    if-nez v0, :cond_f9

    invoke-interface {p1, v1}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object p1

    goto :goto_106

    :cond_f9
    new-instance v2, Lcom/streambundle/v43/SiteAccess$ChallengeChain;

    invoke-static {v1}, Lcom/streambundle/v43/SiteAccess;->withoutClearance(Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v1

    invoke-direct {v2, p1, v1}, Lcom/streambundle/v43/SiteAccess$ChallengeChain;-><init>(Lokhttp3/Interceptor$Chain;Lokhttp3/Request;)V

    invoke-static {v0, v2, v3, v4}, Lcom/streambundle/v43/BoundedChallenge;->solve(Lokhttp3/Interceptor;Lokhttp3/Interceptor$Chain;J)Lokhttp3/Response;

    move-result-object p1

    :goto_106
    return-object p1
.end method
