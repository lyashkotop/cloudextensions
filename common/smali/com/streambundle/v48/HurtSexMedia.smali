.class public final Lcom/streambundle/v48/HurtSexMedia;
.super Ljava/lang/Object;
.source "HurtSexMedia.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fetch(Lokhttp3/OkHttpClient;Lokhttp3/Request$Builder;Z)Lokhttp3/Response;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v0

    .line 15
    if-eqz p2, :cond_45

    const-string p2, "Range"

    invoke-virtual {p1, p2}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_17

    goto :goto_45

    .line 16
    :cond_17
    invoke-virtual {v0}, Lokhttp3/Response;->code()I

    move-result v1

    .line 17
    const/16 v2, 0x190

    if-eq v1, v2, :cond_2d

    const/16 v2, 0x193

    if-eq v1, v2, :cond_2d

    const/16 v2, 0x195

    if-eq v1, v2, :cond_2d

    const/16 v2, 0x1a0

    if-ne v1, v2, :cond_2c

    goto :goto_2d

    .line 21
    :cond_2c
    return-object v0

    .line 18
    :cond_2d
    :goto_2d
    invoke-virtual {v0}, Lokhttp3/Response;->close()V

    .line 19
    invoke-virtual {p1}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    invoke-virtual {p0, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p0

    return-object p0

    .line 15
    :cond_45
    :goto_45
    return-object v0
.end method
