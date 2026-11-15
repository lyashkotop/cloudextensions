.class public final Lcom/streambundle/v43/PunishBrowser;
.super Ljava/lang/Object;
.source "PunishBrowser.java"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v43/PunishBrowser$Page;
    }
.end annotation


# static fields
.field private static final CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v43/PunishBrowser$Page;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANCE:Lcom/streambundle/v43/PunishBrowser;

.field private static final SCRIPT:Ljava/lang/String; = "(function(){if(!window.__sbReady47){window.__sbReady47=true;document.addEventListener(\'DOMContentLoaded\',function(){window.__sbPing47=new Image();window.__sbPing47.src=location.origin+\'/favicon.ico?streambundle_dom=47\';},{once:true});}return JSON.stringify({url:location.href,ready:document.readyState,html:document.documentElement?document.documentElement.outerHTML:\'\'});})()"


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 21
    new-instance v0, Lcom/streambundle/v43/PunishBrowser;

    invoke-direct {v0}, Lcom/streambundle/v43/PunishBrowser;-><init>()V

    sput-object v0, Lcom/streambundle/v43/PunishBrowser;->INSTANCE:Lcom/streambundle/v43/PunishBrowser;

    .line 23
    new-instance v0, Lcom/streambundle/v43/PunishBrowser$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x10

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/v43/PunishBrowser$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v43/PunishBrowser;->CACHE:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static decode(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundle/v43/PunishBrowser$Page;
    .registers 10

    .line 28
    const-string v0, "/+$"

    const-string v1, "^www\\."

    const-string v2, ""

    const/4 v3, 0x0

    :try_start_7
    new-instance v4, Lorg/json/JSONTokener;

    invoke-direct {v4, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p1

    .line 29
    instance-of v4, p1, Ljava/lang/String;

    if-eqz v4, :cond_1f

    new-instance v4, Lorg/json/JSONTokener;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v4, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p1

    .line 30
    :cond_1f
    instance-of v4, p1, Lorg/json/JSONObject;

    if-nez v4, :cond_24

    return-object v3

    .line 31
    :cond_24
    check-cast p1, Lorg/json/JSONObject;

    .line 32
    const-string v4, "url"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "html"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 33
    const-string v6, "ready"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v6, "interactive|complete"

    invoke-virtual {p1, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_41

    return-object v3

    .line 34
    :cond_41
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    invoke-static {v4}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p1

    .line 35
    if-eqz p0, :cond_d8

    if-eqz p1, :cond_d8

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v6

    const-string v7, "punishbang.com"

    invoke-static {v6, v7}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_d8

    .line 36
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d8

    .line 37
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d8

    .line 38
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_94

    goto :goto_d8

    .line 39
    :cond_94
    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 40
    const-string p1, "sorry, you have been blocked"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_d7

    const-string p1, "cf-chl-"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_d7

    .line 41
    const-string p1, "id=\"challenge-form\""

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_b3

    goto :goto_d7

    .line 42
    :cond_b3
    invoke-static {v5, v4}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object p1

    const-string v0, "(?is).*(just a moment|attention required|access denied).*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_d6

    .line 44
    const-string p1, ".list-videos, .list_videos, [id^=list_videos], .player, video, iframe[src]"

    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_d0

    goto :goto_d6

    .line 45
    :cond_d0
    new-instance p0, Lcom/streambundle/v43/PunishBrowser$Page;

    invoke-direct {p0, v4, v5}, Lcom/streambundle/v43/PunishBrowser$Page;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_d5
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_d5} :catch_d9

    return-object p0

    .line 44
    :cond_d6
    :goto_d6
    return-object v3

    .line 41
    :cond_d7
    :goto_d7
    return-object v3

    .line 38
    :cond_d8
    :goto_d8
    return-object v3

    .line 46
    :catch_d9
    move-exception p0

    return-object v3
.end method

.method static synthetic lambda$0(Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;Ljava/lang/String;)Lkotlin/Unit;
    .registers 4

    .line 58
    invoke-static {p0, p3}, Lcom/streambundle/v43/PunishBrowser;->decode(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundle/v43/PunishBrowser$Page;

    move-result-object p0

    if-eqz p0, :cond_d

    const/4 p3, 0x0

    invoke-static {p1, p3, p0}, Lcom/streambundle/v43/PunishBrowser$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    :cond_d
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static synthetic lambda$1(Ljava/util/concurrent/atomic/AtomicReference;Lokhttp3/Request;)Ljava/lang/Boolean;
    .registers 2

    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private static response(Lokhttp3/Request;Lcom/streambundle/v43/PunishBrowser$Page;)Lokhttp3/Response;
    .registers 4

    .line 84
    new-instance v0, Lokhttp3/Response$Builder;

    invoke-direct {v0}, Lokhttp3/Response$Builder;-><init>()V

    invoke-virtual {p0}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object p0

    iget-object v1, p1, Lcom/streambundle/v43/PunishBrowser$Page;->url:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p0

    invoke-virtual {v0, p0}, Lokhttp3/Response$Builder;->request(Lokhttp3/Request;)Lokhttp3/Response$Builder;

    move-result-object p0

    sget-object v0, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    invoke-virtual {p0, v0}, Lokhttp3/Response$Builder;->protocol(Lokhttp3/Protocol;)Lokhttp3/Response$Builder;

    move-result-object p0

    .line 85
    const/16 v0, 0xc8

    invoke-virtual {p0, v0}, Lokhttp3/Response$Builder;->code(I)Lokhttp3/Response$Builder;

    move-result-object p0

    const-string v0, "Browser DOM"

    invoke-virtual {p0, v0}, Lokhttp3/Response$Builder;->message(Ljava/lang/String;)Lokhttp3/Response$Builder;

    move-result-object p0

    iget-object p1, p1, Lcom/streambundle/v43/PunishBrowser$Page;->html:Ljava/lang/String;

    const-string v0, "text/html; charset=utf-8"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    invoke-static {p1, v0}, Lokhttp3/ResponseBody;->create(Ljava/lang/String;Lokhttp3/MediaType;)Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p0, p1}, Lokhttp3/Response$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object p0

    .line 84
    return-object p0
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    const-string v1, "resolveUsingWebView"

    invoke-interface/range {p1 .. p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v3

    .line 50
    invoke-virtual {v2}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v0

    const-string v4, "User-Agent"

    invoke-virtual {v0, v4}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string v4, "Cookie"

    invoke-virtual {v0, v4}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 51
    const-string v4, "Range"

    invoke-virtual {v0, v4}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string v4, "Accept-Encoding"

    invoke-virtual {v0, v4}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 50
    nop

    .line 52
    invoke-virtual {v2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v4

    const-string v5, "punishbang.com"

    invoke-static {v4, v5}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1a9

    invoke-virtual {v2}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v4

    const-string v5, "GET"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a9

    .line 54
    sget-object v4, Lcom/streambundle/v43/PunishBrowser;->CACHE:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundle/v43/PunishBrowser$Page;

    .line 55
    if-eqz v4, :cond_6d

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    iget-wide v8, v4, Lcom/streambundle/v43/PunishBrowser$Page;->time:J

    sub-long/2addr v6, v8

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v9, 0xa

    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v8

    cmp-long v10, v6, v8

    if-gez v10, :cond_6d

    invoke-static {v2, v4}, Lcom/streambundle/v43/PunishBrowser;->response(Lokhttp3/Request;Lcom/streambundle/v43/PunishBrowser$Page;)Lokhttp3/Response;

    move-result-object v0

    return-object v0

    .line 56
    :cond_6d
    new-instance v4, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v4}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 57
    new-instance v6, Ljava/util/concurrent/CountDownLatch;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 58
    new-instance v8, Lcom/streambundle/v43/PunishBrowser$$ExternalSyntheticLambda1;

    invoke-direct {v8, v3, v4, v6}, Lcom/streambundle/v43/PunishBrowser$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V

    .line 59
    new-instance v9, Lcom/streambundle/v43/PunishBrowser$$ExternalSyntheticLambda2;

    invoke-direct {v9, v4}, Lcom/streambundle/v43/PunishBrowser$$ExternalSyntheticLambda2;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 60
    new-instance v10, Lcom/streambundle/v43/PunishBrowser$2;

    move-object/from16 v11, p0

    invoke-direct {v10, v11, v6}, Lcom/streambundle/v43/PunishBrowser$2;-><init>(Lcom/streambundle/v43/PunishBrowser;Ljava/util/concurrent/CountDownLatch;)V

    .line 65
    :try_start_89
    const-string v12, "com.lagradost.cloudstream3.network.WebViewResolver"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    .line 66
    const/4 v13, 0x7

    new-array v14, v13, [Ljava/lang/Class;

    const-class v15, Lkotlin/text/Regex;

    const/16 v16, 0x0

    aput-object v15, v14, v16

    const-class v15, Ljava/util/List;

    aput-object v15, v14, v7

    const-class v15, Ljava/lang/String;

    const/16 v17, 0x2

    aput-object v15, v14, v17

    sget-object v15, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x3

    aput-object v15, v14, v7

    const-class v15, Ljava/lang/String;

    const/16 v18, 0x4

    aput-object v15, v14, v18

    const-class v15, Lkotlin/jvm/functions/Function1;

    const/4 v7, 0x5

    aput-object v15, v14, v7

    sget-object v15, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/16 v19, 0x6

    aput-object v15, v14, v19

    invoke-virtual {v12, v14}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v14

    new-array v13, v13, [Ljava/lang/Object;

    .line 67
    new-instance v15, Lkotlin/text/Regex;

    const-string v7, "(?!)"

    invoke-direct {v15, v7}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    aput-object v15, v13, v16

    new-instance v7, Lkotlin/text/Regex;

    const-string v15, "."

    invoke-direct {v7, v15}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const/4 v15, 0x1

    aput-object v7, v13, v15

    const/4 v7, 0x0

    aput-object v7, v13, v17

    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    const/4 v15, 0x3

    aput-object v7, v13, v15

    const-string v7, "(function(){if(!window.__sbReady47){window.__sbReady47=true;document.addEventListener(\'DOMContentLoaded\',function(){window.__sbPing47=new Image();window.__sbPing47.src=location.origin+\'/favicon.ico?streambundle_dom=47\';},{once:true});}return JSON.stringify({url:location.href,ready:document.readyState,html:document.documentElement?document.documentElement.outerHTML:\'\'});})()"

    aput-object v7, v13, v18

    const/4 v7, 0x5

    aput-object v8, v13, v7

    const-wide/16 v7, 0x1964

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v13, v19

    invoke-virtual {v14, v13}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7
    :try_end_f2
    .catch Ljava/lang/InterruptedException; {:try_start_89 .. :try_end_f2} :catch_199
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_89 .. :try_end_f2} :catch_18c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_89 .. :try_end_f2} :catch_183

    .line 66
    nop

    .line 69
    const/4 v8, 0x3

    :try_start_f4
    new-array v13, v8, [Ljava/lang/Class;

    const-class v8, Lokhttp3/Request;

    aput-object v8, v13, v16

    const-class v8, Lkotlin/jvm/functions/Function1;

    const/4 v14, 0x1

    aput-object v8, v13, v14

    const-class v8, Lkotlin/coroutines/Continuation;

    aput-object v8, v13, v17

    invoke-virtual {v12, v1, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    const/4 v13, 0x3

    new-array v14, v13, [Ljava/lang/Object;

    aput-object v0, v14, v16

    const/4 v13, 0x1

    aput-object v9, v14, v13

    aput-object v10, v14, v17

    invoke-virtual {v8, v7, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_115
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f4 .. :try_end_115} :catch_116
    .catch Ljava/lang/InterruptedException; {:try_start_f4 .. :try_end_115} :catch_199
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_f4 .. :try_end_115} :catch_18c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_f4 .. :try_end_115} :catch_183

    goto :goto_14e

    .line 70
    :catch_116
    move-exception v0

    .line 71
    const/4 v8, 0x5

    :try_start_118
    new-array v0, v8, [Ljava/lang/Class;

    const-class v8, Ljava/lang/String;

    aput-object v8, v0, v16

    const-class v8, Ljava/lang/String;

    const/4 v13, 0x1

    aput-object v8, v0, v13

    const-class v8, Ljava/lang/String;

    aput-object v8, v0, v17

    const-class v8, Lkotlin/jvm/functions/Function1;

    const/4 v13, 0x3

    aput-object v8, v0, v13

    const-class v8, Lkotlin/coroutines/Continuation;

    aput-object v8, v0, v18

    invoke-virtual {v12, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 72
    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v3, v1, v16

    const-string v8, "Referer"

    invoke-virtual {v2, v8}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v12, 0x1

    aput-object v8, v1, v12

    aput-object v5, v1, v17

    const/4 v5, 0x3

    aput-object v9, v1, v5

    aput-object v10, v1, v18

    invoke-virtual {v0, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 71
    nop

    .line 74
    :goto_14e
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_157

    invoke-virtual {v6}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 75
    :cond_157
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v7, 0x1b58

    invoke-virtual {v6, v7, v8, v0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-eqz v0, :cond_17b

    .line 76
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundle/v43/PunishBrowser$Page;

    .line 77
    if-eqz v0, :cond_173

    .line 78
    sget-object v1, Lcom/streambundle/v43/PunishBrowser;->CACHE:Ljava/util/Map;

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v2, v0}, Lcom/streambundle/v43/PunishBrowser;->response(Lokhttp3/Request;Lcom/streambundle/v43/PunishBrowser$Page;)Lokhttp3/Response;

    move-result-object v0

    return-object v0

    .line 77
    :cond_173
    new-instance v0, Ljava/io/IOException;

    const-string v1, "PunishBang: Cloudflare \u0431\u043b\u043e\u043a\u0438\u0440\u0443\u0435\u0442 \u0438 \u0431\u0440\u0430\u0443\u0437\u0435\u0440\u043d\u043e\u0435 \u043f\u043e\u0434\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u0435. \u0421\u0442\u0440\u0430\u043d\u0438\u0446\u0430 \u043a\u0430\u0442\u0430\u043b\u043e\u0433\u0430 \u043d\u0435 \u043f\u043e\u043b\u0443\u0447\u0435\u043d\u0430."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_17b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "PunishBang: \u0431\u0440\u0430\u0443\u0437\u0435\u0440 \u043d\u0435 \u0437\u0430\u0433\u0440\u0443\u0437\u0438\u043b \u043a\u0430\u0442\u0430\u043b\u043e\u0433 \u0437\u0430 7 \u0441\u0435\u043a\u0443\u043d\u0434"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_183
    .catch Ljava/lang/InterruptedException; {:try_start_118 .. :try_end_183} :catch_199
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_118 .. :try_end_183} :catch_18c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_118 .. :try_end_183} :catch_183

    .line 81
    :catch_183
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u0412 \u044d\u0442\u043e\u0439 \u0432\u0435\u0440\u0441\u0438\u0438 Cloudstream \u043d\u0435\u0442 \u0441\u043e\u0432\u043c\u0435\u0441\u0442\u0438\u043c\u043e\u0433\u043e WebView \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a\u0430"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 80
    :catch_18c
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041e\u0448\u0438\u0431\u043a\u0430 \u0431\u0440\u0430\u0443\u0437\u0435\u0440\u043d\u043e\u0433\u043e \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a\u0430 PunishBang"

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 79
    :catch_199
    move-exception v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430 PunishBang \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 52
    :cond_1a9
    move-object/from16 v11, p0

    .line 53
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0411\u0440\u0430\u0443\u0437\u0435\u0440\u043d\u044b\u0439 \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442 \u0442\u043e\u043b\u044c\u043a\u043e \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u044b PunishBang"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
