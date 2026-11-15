.class final Lcom/streambundle/v38/QuickSearch$State;
.super Ljava/lang/Object;
.source "QuickSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/QuickSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field final calls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Call;",
            ">;"
        }
    .end annotation
.end field

.field deadline:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field final end:Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field finished:Z

.field pending:I

.field final provider:Lcom/lagradost/cloudstream3/MainAPI;

.field final result:Lkotlin/coroutines/SafeContinuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/SafeContinuation<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lagradost/cloudstream3/MainAPI;Lkotlin/coroutines/Continuation;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MainAPI;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundle/v38/QuickSearch$State;->calls:Ljava/util/List;

    .line 65
    iput-object p1, p0, Lcom/streambundle/v38/QuickSearch$State;->provider:Lcom/lagradost/cloudstream3/MainAPI;

    .line 66
    iput-object p2, p0, Lcom/streambundle/v38/QuickSearch$State;->end:Lkotlin/coroutines/Continuation;

    .line 67
    new-instance p1, Lkotlin/coroutines/SafeContinuation;

    invoke-direct {p1, p2}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    iput-object p1, p0, Lcom/streambundle/v38/QuickSearch$State;->result:Lkotlin/coroutines/SafeContinuation;

    .line 68
    return-void
.end method


# virtual methods
.method begin(Ljava/lang/String;)V
    .registers 5

    .line 70
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State;->provider:Lcom/lagradost/cloudstream3/MainAPI;

    invoke-static {v0, p1}, Lcom/streambundle/v38/SearchAndPosters;->target(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 71
    const-string v1, "en"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    const-string v1, "en"

    invoke-static {p1, v1}, Lcom/streambundle/v38/SearchAndPosters;->local(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_17

    :cond_15
    const-string v1, ""

    .line 72
    :goto_17
    const-string v2, "en"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2b

    const-string v0, "en"

    invoke-static {p1, v0}, Lcom/streambundle/v38/BundleTranslation;->translate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 73
    :cond_2b
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_32

    goto :goto_33

    :cond_32
    move-object p1, v1

    .line 74
    :goto_33
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State;->provider:Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {v0}, Lcom/lagradost/cloudstream3/MainAPI;->getMainUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/streambundle/v38/QuickSearch;->routes(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 75
    monitor-enter p0

    .line 76
    :try_start_3e
    iget-boolean v1, p0, Lcom/streambundle/v38/QuickSearch$State;->finished:Z

    if-eqz v1, :cond_44

    monitor-exit p0

    return-void

    .line 77
    :cond_44
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/streambundle/v38/QuickSearch$State;->pending:I

    .line 75
    monitor-exit p0
    :try_end_4d
    .catchall {:try_start_3e .. :try_end_4d} :catchall_81

    .line 79
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_51
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_77

    .line 80
    new-instance v0, Lcom/streambundle/v38/QuickSearch$State$1;

    invoke-direct {v0, p0}, Lcom/streambundle/v38/QuickSearch$State$1;-><init>(Lcom/streambundle/v38/QuickSearch$State;)V

    .line 88
    :try_start_5c
    iget-object v1, p0, Lcom/streambundle/v38/QuickSearch$State;->provider:Lcom/lagradost/cloudstream3/MainAPI;

    invoke-static {v1, p1, v0}, Lcom/streambundle/SearchLimit;->run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .line 89
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-eq p1, v1, :cond_76

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_6b} :catch_6e
    .catch Ljava/lang/LinkageError; {:try_start_5c .. :try_end_6b} :catch_6c

    .line 90
    goto :goto_76

    :catch_6c
    move-exception p1

    goto :goto_6f

    :catch_6e
    move-exception p1

    .line 91
    :goto_6f
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/streambundle/v38/QuickSearch$State;->complete(Ljava/util/List;)V

    .line 93
    :cond_76
    :goto_76
    return-void

    .line 79
    :cond_77
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/Request;

    invoke-virtual {p0, v1}, Lcom/streambundle/v38/QuickSearch$State;->send(Lokhttp3/Request;)V

    goto :goto_51

    .line 75
    :catchall_81
    move-exception p1

    :try_start_82
    monitor-exit p0
    :try_end_83
    .catchall {:try_start_82 .. :try_end_83} :catchall_81

    throw p1
.end method

.method declared-synchronized complete(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)V"
        }
    .end annotation

    monitor-enter p0

    .line 126
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v38/QuickSearch$State;->finished:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_45

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 127
    :cond_7
    :try_start_7
    iget v0, p0, Lcom/streambundle/v38/QuickSearch$State;->pending:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/streambundle/v38/QuickSearch$State;->pending:I

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 129
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_16
    :goto_16
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_33

    .line 132
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_26

    invoke-virtual {p0, v0}, Lcom/streambundle/v38/QuickSearch$State;->finish(Ljava/util/List;)V

    goto :goto_31

    .line 133
    :cond_26
    iget p1, p0, Lcom/streambundle/v38/QuickSearch$State;->pending:I

    if-nez p1, :cond_31

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/streambundle/v38/QuickSearch$State;->finish(Ljava/util/List;)V
    :try_end_31
    .catchall {:try_start_7 .. :try_end_31} :catchall_45

    .line 134
    :cond_31
    :goto_31
    monitor-exit p0

    return-void

    .line 129
    :cond_33
    :try_start_33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 130
    instance-of v2, v1, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    if-eqz v2, :cond_16

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->blocked(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_44
    .catchall {:try_start_33 .. :try_end_44} :catchall_45

    goto :goto_16

    .line 125
    :catchall_45
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized expire()V
    .registers 2

    monitor-enter p0

    .line 135
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v38/QuickSearch$State;->finished:Z

    if-nez v0, :cond_c

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundle/v38/QuickSearch$State;->finish(Ljava/util/List;)V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    :cond_c
    monitor-exit p0

    return-void

    .line 135
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method finish(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)V"
        }
    .end annotation

    .line 137
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundle/v38/QuickSearch$State;->finished:Z

    .line 138
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State;->deadline:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 139
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State;->calls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_20

    .line 140
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State;->provider:Lcom/lagradost/cloudstream3/MainAPI;

    invoke-static {v0, p1}, Lcom/streambundle/v38/QuickSearch;->remember(Ljava/lang/Object;Ljava/util/List;)V

    .line 141
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State;->result:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 142
    return-void

    .line 139
    :cond_20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/Call;

    invoke-interface {v1}, Lokhttp3/Call;->cancel()V

    goto :goto_f
.end method

.method send(Lokhttp3/Request;)V
    .registers 6

    .line 96
    :try_start_0
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/Requests;->getBaseClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 97
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xc1c

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 96
    nop

    .line 98
    iget-object v1, p0, Lcom/streambundle/v38/QuickSearch$State;->provider:Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {v1}, Lcom/lagradost/cloudstream3/MainAPI;->getMainUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "sickjunk.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_25
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_25} :catch_60
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_25} :catch_5e

    if-eqz v1, :cond_3d

    .line 100
    :try_start_27
    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v43/SiteAccess;->interceptor(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v1

    .line 101
    if-eqz v1, :cond_3d

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;
    :try_end_38
    .catch Ljava/lang/RuntimeException; {:try_start_27 .. :try_end_38} :catch_3b
    .catch Ljava/lang/LinkageError; {:try_start_27 .. :try_end_38} :catch_39

    goto :goto_3c

    .line 102
    :catch_39
    move-exception v1

    goto :goto_3c

    :catch_3b
    move-exception v1

    :goto_3c
    nop

    .line 104
    :cond_3d
    :try_start_3d
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    .line 105
    monitor-enter p0
    :try_end_46
    .catch Ljava/lang/RuntimeException; {:try_start_3d .. :try_end_46} :catch_60
    .catch Ljava/lang/LinkageError; {:try_start_3d .. :try_end_46} :catch_5e

    .line 106
    :try_start_46
    iget-boolean v0, p0, Lcom/streambundle/v38/QuickSearch$State;->finished:Z

    if-eqz v0, :cond_4c

    monitor-exit p0

    return-void

    .line 107
    :cond_4c
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State;->calls:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    monitor-exit p0
    :try_end_52
    .catchall {:try_start_46 .. :try_end_52} :catchall_5b

    .line 109
    :try_start_52
    new-instance v0, Lcom/streambundle/v38/QuickSearch$State$2;

    invoke-direct {v0, p0}, Lcom/streambundle/v38/QuickSearch$State$2;-><init>(Lcom/streambundle/v38/QuickSearch$State;)V

    invoke-interface {p1, v0}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V
    :try_end_5a
    .catch Ljava/lang/RuntimeException; {:try_start_52 .. :try_end_5a} :catch_60
    .catch Ljava/lang/LinkageError; {:try_start_52 .. :try_end_5a} :catch_5e

    .line 121
    goto :goto_68

    .line 105
    :catchall_5b
    move-exception p1

    :try_start_5c
    monitor-exit p0
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_5b

    :try_start_5d
    throw p1
    :try_end_5e
    .catch Ljava/lang/RuntimeException; {:try_start_5d .. :try_end_5e} :catch_60
    .catch Ljava/lang/LinkageError; {:try_start_5d .. :try_end_5e} :catch_5e

    .line 121
    :catch_5e
    move-exception p1

    goto :goto_61

    :catch_60
    move-exception p1

    .line 122
    :goto_61
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/streambundle/v38/QuickSearch$State;->complete(Ljava/util/List;)V

    .line 124
    :goto_68
    return-void
.end method
