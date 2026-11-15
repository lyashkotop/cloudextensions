.class final Lcom/streambundle/v43/SiteAccess$ChallengeChain;
.super Ljava/lang/Object;
.source "SiteAccess.java"

# interfaces
.implements Lokhttp3/Interceptor$Chain;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v43/SiteAccess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ChallengeChain"
.end annotation


# instance fields
.field final delegate:Lokhttp3/Interceptor$Chain;

.field final prepared:Lokhttp3/Request;


# direct methods
.method constructor <init>(Lokhttp3/Interceptor$Chain;Lokhttp3/Request;)V
    .registers 3

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    iput-object p2, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->prepared:Lokhttp3/Request;

    return-void
.end method


# virtual methods
.method public call()Lokhttp3/Call;
    .registers 2

    .line 99
    iget-object v0, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v0}, Lokhttp3/Interceptor$Chain;->call()Lokhttp3/Call;

    move-result-object v0

    return-object v0
.end method

.method public connectTimeoutMillis()I
    .registers 2

    .line 100
    iget-object v0, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v0}, Lokhttp3/Interceptor$Chain;->connectTimeoutMillis()I

    move-result v0

    return v0
.end method

.method public connection()Lokhttp3/Connection;
    .registers 2

    .line 98
    iget-object v0, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v0}, Lokhttp3/Interceptor$Chain;->connection()Lokhttp3/Connection;

    move-result-object v0

    return-object v0
.end method

.method public proceed(Lokhttp3/Request;)Lokhttp3/Response;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v0, p1}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object p1

    .line 96
    invoke-static {p1}, Lcom/streambundle/v43/SiteAccess;->isCloudflare(Lokhttp3/Response;)Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p1}, Lokhttp3/Response;->newBuilder()Lokhttp3/Response$Builder;

    move-result-object p1

    const-string v0, "Server"

    const-string v1, "cloudflare"

    invoke-virtual {p1, v0, v1}, Lokhttp3/Response$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Response$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object p1

    :cond_1c
    return-object p1
.end method

.method public readTimeoutMillis()I
    .registers 2

    .line 101
    iget-object v0, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v0}, Lokhttp3/Interceptor$Chain;->readTimeoutMillis()I

    move-result v0

    return v0
.end method

.method public request()Lokhttp3/Request;
    .registers 2

    .line 93
    iget-object v0, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->prepared:Lokhttp3/Request;

    return-object v0
.end method

.method public withConnectTimeout(ILjava/util/concurrent/TimeUnit;)Lokhttp3/Interceptor$Chain;
    .registers 5

    .line 103
    new-instance v0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;

    iget-object v1, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v1, p1, p2}, Lokhttp3/Interceptor$Chain;->withConnectTimeout(ILjava/util/concurrent/TimeUnit;)Lokhttp3/Interceptor$Chain;

    move-result-object p1

    iget-object p2, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->prepared:Lokhttp3/Request;

    invoke-direct {v0, p1, p2}, Lcom/streambundle/v43/SiteAccess$ChallengeChain;-><init>(Lokhttp3/Interceptor$Chain;Lokhttp3/Request;)V

    return-object v0
.end method

.method public withReadTimeout(ILjava/util/concurrent/TimeUnit;)Lokhttp3/Interceptor$Chain;
    .registers 5

    .line 104
    new-instance v0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;

    iget-object v1, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v1, p1, p2}, Lokhttp3/Interceptor$Chain;->withReadTimeout(ILjava/util/concurrent/TimeUnit;)Lokhttp3/Interceptor$Chain;

    move-result-object p1

    iget-object p2, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->prepared:Lokhttp3/Request;

    invoke-direct {v0, p1, p2}, Lcom/streambundle/v43/SiteAccess$ChallengeChain;-><init>(Lokhttp3/Interceptor$Chain;Lokhttp3/Request;)V

    return-object v0
.end method

.method public withWriteTimeout(ILjava/util/concurrent/TimeUnit;)Lokhttp3/Interceptor$Chain;
    .registers 5

    .line 105
    new-instance v0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;

    iget-object v1, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v1, p1, p2}, Lokhttp3/Interceptor$Chain;->withWriteTimeout(ILjava/util/concurrent/TimeUnit;)Lokhttp3/Interceptor$Chain;

    move-result-object p1

    iget-object p2, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->prepared:Lokhttp3/Request;

    invoke-direct {v0, p1, p2}, Lcom/streambundle/v43/SiteAccess$ChallengeChain;-><init>(Lokhttp3/Interceptor$Chain;Lokhttp3/Request;)V

    return-object v0
.end method

.method public writeTimeoutMillis()I
    .registers 2

    .line 102
    iget-object v0, p0, Lcom/streambundle/v43/SiteAccess$ChallengeChain;->delegate:Lokhttp3/Interceptor$Chain;

    invoke-interface {v0}, Lokhttp3/Interceptor$Chain;->writeTimeoutMillis()I

    move-result v0

    return v0
.end method
