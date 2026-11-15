.class public final Lcom/streambundleextra/NetworkSupport;
.super Ljava/lang/Object;
.source "NetworkSupport.java"


# static fields
.field private static final SEARCH:Lokhttp3/Interceptor;

.field private static volatile cloudflare:Lokhttp3/Interceptor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Lcom/streambundleextra/NetworkSupport$1;

    invoke-direct {v0}, Lcom/streambundleextra/NetworkSupport$1;-><init>()V

    sput-object v0, Lcom/streambundleextra/NetworkSupport;->SEARCH:Lokhttp3/Interceptor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;
    .registers 4

    .line 20
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    .line 21
    if-eqz p0, :cond_15

    const-string v0, "hurtsex.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    sget-object p0, Lcom/streambundleextra/NetworkSupport;->SEARCH:Lokhttp3/Interceptor;

    return-object p0

    .line 22
    :cond_15
    if-eqz p0, :cond_9c

    const-string v0, "huyamba.name"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "huyamba.mobi"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "punishbang.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "forcedcinema.net"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "sick-r.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "pervertium.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "heavyfetish.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "twistedporn.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "sickjunk.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_67

    const-string v0, "inhumanity.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9c

    .line 23
    :cond_67
    sget-object p0, Lcom/streambundleextra/NetworkSupport;->cloudflare:Lokhttp3/Interceptor;

    if-nez p0, :cond_99

    const-class p0, Lcom/streambundleextra/NetworkSupport;

    monitor-enter p0

    .line 24
    :try_start_6e
    sget-object v0, Lcom/streambundleextra/NetworkSupport;->cloudflare:Lokhttp3/Interceptor;
    :try_end_70
    .catchall {:try_start_6e .. :try_end_70} :catchall_97

    if-nez v0, :cond_93

    :try_start_72
    const-string v0, "com.lagradost.cloudstream3.network.CloudflareKiller"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/Interceptor;

    sput-object v0, Lcom/streambundleextra/NetworkSupport;->cloudflare:Lokhttp3/Interceptor;
    :try_end_89
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_72 .. :try_end_89} :catch_8a
    .catchall {:try_start_72 .. :try_end_89} :catchall_97

    .line 25
    goto :goto_93

    :catch_8a
    move-exception v0

    :try_start_8b
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u0412 \u044d\u0442\u043e\u0439 \u0432\u0435\u0440\u0441\u0438\u0438 Cloudstream \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Cloudflare"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 26
    :cond_93
    :goto_93
    monitor-exit p0

    goto :goto_99

    :goto_95
    monitor-exit p0
    :try_end_96
    .catchall {:try_start_8b .. :try_end_96} :catchall_97

    throw v0

    :catchall_97
    move-exception v0

    goto :goto_95

    .line 27
    :cond_99
    :goto_99
    sget-object p0, Lcom/streambundleextra/NetworkSupport;->cloudflare:Lokhttp3/Interceptor;

    return-object p0

    .line 29
    :cond_9c
    const/4 p0, 0x0

    return-object p0
.end method
