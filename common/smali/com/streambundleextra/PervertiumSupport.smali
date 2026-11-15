.class public final Lcom/streambundleextra/PervertiumSupport;
.super Ljava/lang/Object;


# direct methods
.method public static client(Lokhttp3/OkHttpClient;Ljava/lang/String;)Lokhttp3/OkHttpClient;
    .registers 5

    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2c

    const-string v1, "pervertium.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    const-string v1, ".pervertium.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2c

    :cond_1a
    invoke-static {p1}, Lcom/streambundle/v43/SiteAccess;->interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v1

    if-eqz v1, :cond_2c

    invoke-virtual {p0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p0

    :cond_2c
    return-object p0
.end method
