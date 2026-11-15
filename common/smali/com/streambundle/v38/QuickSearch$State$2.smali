.class Lcom/streambundle/v38/QuickSearch$State$2;
.super Ljava/lang/Object;
.source "QuickSearch.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/QuickSearch$State;->send(Lokhttp3/Request;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/streambundle/v38/QuickSearch$State;


# direct methods
.method constructor <init>(Lcom/streambundle/v38/QuickSearch$State;)V
    .registers 2

    .line 109
    iput-object p1, p0, Lcom/streambundle/v38/QuickSearch$State$2;->this$1:Lcom/streambundle/v38/QuickSearch$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .registers 3

    .line 110
    iget-object p1, p0, Lcom/streambundle/v38/QuickSearch$State$2;->this$1:Lcom/streambundle/v38/QuickSearch$State;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/streambundle/v38/QuickSearch$State;->complete(Ljava/util/List;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .registers 7

    .line 112
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    .line 113
    nop

    .line 114
    :try_start_5
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_2c

    .line 115
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State$2;->this$1:Lcom/streambundle/v38/QuickSearch$State;

    iget-object v0, v0, Lcom/streambundle/v38/QuickSearch$State;->provider:Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p2}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    const-wide/32 v2, 0x16e360

    invoke-virtual {p2, v2, v3}, Lokhttp3/Response;->peekBody(J)Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/streambundle/v38/QuickSearch;->parse(Lcom/lagradost/cloudstream3/MainAPI;Lokhttp3/HttpUrl;Ljava/lang/String;)Ljava/util/List;
    invoke-static {v0, v1, v2}, Lcom/streambundle/v38/QuickSearch;->access$0(Lcom/lagradost/cloudstream3/MainAPI;Lokhttp3/HttpUrl;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1
    :try_end_2c
    .catchall {:try_start_5 .. :try_end_2c} :catchall_35

    .line 117
    :cond_2c
    if-eqz p2, :cond_49

    :try_start_2e
    invoke-virtual {p2}, Lokhttp3/Response;->close()V
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_32

    goto :goto_49

    :catchall_32
    move-exception p2

    const/4 v0, 0x0

    goto :goto_3d

    :catchall_35
    move-exception v0

    if-eqz p2, :cond_3b

    :try_start_38
    invoke-virtual {p2}, Lokhttp3/Response;->close()V

    :cond_3b
    throw v0
    :try_end_3c
    .catchall {:try_start_38 .. :try_end_3c} :catchall_3c

    :catchall_3c
    move-exception p2

    :goto_3d
    if-eqz v0, :cond_45

    if-eq v0, p2, :cond_44

    :try_start_41
    invoke-virtual {v0, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_44
    move-object p2, v0

    :cond_45
    throw p2
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_46} :catch_48
    .catch Ljava/lang/LinkageError; {:try_start_41 .. :try_end_46} :catch_46

    :catch_46
    move-exception p2

    goto :goto_49

    :catch_48
    move-exception p2

    .line 118
    :cond_49
    :goto_49
    iget-object p2, p0, Lcom/streambundle/v38/QuickSearch$State$2;->this$1:Lcom/streambundle/v38/QuickSearch$State;

    invoke-virtual {p2, p1}, Lcom/streambundle/v38/QuickSearch$State;->complete(Ljava/util/List;)V

    .line 119
    return-void
.end method
