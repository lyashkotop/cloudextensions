.class public final Lcom/streambundle/v38/Screening;
.super Ljava/lang/Object;
.source "Screening.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/Screening$Decision;,
        Lcom/streambundle/v38/Screening$FilteredVideo;,
        Lcom/streambundle/v38/Screening$Operation;,
        Lcom/streambundle/v38/Screening$ProbeContext;,
        Lcom/streambundle/v38/Screening$ProbeKey;
    }
.end annotation


# static fields
.field private static final CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/Screening$Decision;",
            ">;"
        }
    .end annotation
.end field

.field private static final CACHE_TTL_MS:J = 0x493e0L

.field private static final CHECKS:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static final CHECKS_PER_LIST:I = 0x3

.field private static final LISTS:Ljava/util/concurrent/ExecutorService;

.field private static final MAX_CHECKS:I = 0x12

.field private static final PROBE_KEY:Lcom/streambundle/v38/Screening$ProbeKey;

.field private static final TIME_BUDGET_MS:J = 0x6a4L


# direct methods
.method static constructor <clinit>()V
    .registers 17

    .line 23
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    new-instance v6, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v0, 0x58

    invoke-direct {v6, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    new-instance v7, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda2;

    invoke-direct {v7}, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda2;-><init>()V

    .line 23
    const/16 v1, 0xc

    const/16 v2, 0xc

    const-wide/16 v3, 0x0

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v8, Lcom/streambundle/v38/Screening;->CHECKS:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 25
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v14, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 26
    new-instance v15, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v15}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    new-instance v16, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda3;

    invoke-direct/range {v16 .. v16}, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda3;-><init>()V

    .line 25
    const/4 v10, 0x0

    const/16 v11, 0x20

    const-wide/16 v12, 0x1e

    move-object v9, v0

    invoke-direct/range {v9 .. v16}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v0, Lcom/streambundle/v38/Screening;->LISTS:Ljava/util/concurrent/ExecutorService;

    .line 28
    new-instance v0, Lcom/streambundle/v38/Screening$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x80

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/v38/Screening$1;-><init>(IFZ)V

    .line 27
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/Screening;->CACHE:Ljava/util/Map;

    .line 35
    new-instance v0, Lcom/streambundle/v38/Screening$ProbeKey;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/streambundle/v38/Screening$ProbeKey;-><init>(Lcom/streambundle/v38/Screening$ProbeKey;)V

    sput-object v0, Lcom/streambundle/v38/Screening;->PROBE_KEY:Lcom/streambundle/v38/Screening$ProbeKey;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Lcom/streambundle/v38/Screening$ProbeKey;
    .registers 1

    .line 35
    sget-object v0, Lcom/streambundle/v38/Screening;->PROBE_KEY:Lcom/streambundle/v38/Screening$ProbeKey;

    return-object v0
.end method

.method static synthetic access$1(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3

    .line 243
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/Screening;->prepareDetail(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$2()Ljava/util/Map;
    .registers 1

    .line 27
    sget-object v0, Lcom/streambundle/v38/Screening;->CACHE:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$3(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 62
    invoke-static {p0, p1}, Lcom/streambundle/v38/Screening;->key(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Ljava/lang/Object;)Z
    .registers 1

    .line 141
    invoke-static {p0}, Lcom/streambundle/v38/Screening;->hasCards(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$5()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 25
    sget-object v0, Lcom/streambundle/v38/Screening;->LISTS:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$6(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)Ljava/lang/Object;
    .registers 3

    .line 159
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/Screening;->filter(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$7(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 252
    invoke-static {p0, p1}, Lcom/streambundle/v38/Screening;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static cached(Ljava/lang/String;)Lcom/streambundle/v38/Screening$Decision;
    .registers 5

    .line 67
    sget-object v0, Lcom/streambundle/v38/Screening;->CACHE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/streambundle/v38/Screening$Decision;

    .line 68
    if-eqz p0, :cond_19

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/streambundle/v38/Screening$Decision;->time:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x493e0

    cmp-long v0, v0, v2

    if-gez v0, :cond_19

    goto :goto_1a

    :cond_19
    const/4 p0, 0x0

    :goto_1a
    return-object p0
.end method

.method private static checkDetails(Ljava/lang/Object;Ljava/util/Map;Lkotlin/coroutines/CoroutineContext;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/CoroutineContext;",
            ")V"
        }
    .end annotation

    .line 174
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 175
    :cond_7
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x6a4

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 176
    new-instance v2, Ljava/util/concurrent/ExecutorCompletionService;

    sget-object v3, Lcom/streambundle/v38/Screening;->CHECKS:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-direct {v2, v3}, Ljava/util/concurrent/ExecutorCompletionService;-><init>(Ljava/util/concurrent/Executor;)V

    .line 177
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 178
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 179
    nop

    .line 181
    const/4 v4, 0x0

    :goto_2a
    const/4 v10, 0x1

    :try_start_2b
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    cmp-long v5, v5, v0

    if-ltz v5, :cond_34

    .line 195
    goto :goto_7c

    .line 181
    :cond_34
    move v11, v4

    .line 182
    :goto_35
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    const/4 v5, 0x3

    if-ge v4, v5, :cond_61

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_61

    const/16 v4, 0x12

    if-lt v11, v4, :cond_47

    goto :goto_61

    .line 183
    :cond_47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Ljava/util/Map$Entry;

    .line 184
    new-instance v12, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;

    move-object v4, v12

    move-object v5, p0

    move-object v7, p2

    move-wide v8, v0

    invoke-direct/range {v4 .. v9}, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Ljava/util/Map$Entry;Lkotlin/coroutines/CoroutineContext;J)V

    invoke-interface {v2, v12}, Ljava/util/concurrent/CompletionService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 188
    add-int/lit8 v11, v11, 0x1

    goto :goto_35

    .line 190
    :cond_61
    :goto_61
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_68

    goto :goto_7c

    .line 191
    :cond_68
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long v4, v0, v4

    const-wide/16 v6, 0x0

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v4, v5, v6}, Ljava/util/concurrent/CompletionService;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/Future;

    move-result-object v4
    :try_end_7a
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2b .. :try_end_7a} :catch_ca
    .catch Ljava/lang/InterruptedException; {:try_start_2b .. :try_end_7a} :catch_98
    .catchall {:try_start_2b .. :try_end_7a} :catchall_96

    .line 192
    if-nez v4, :cond_91

    .line 200
    :goto_7c
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_80
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_87

    goto :goto_d5

    :cond_87
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Future;

    invoke-interface {p0, v10}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_80

    .line 193
    :cond_91
    :try_start_91
    invoke-interface {v3, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_94
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_91 .. :try_end_94} :catch_ca
    .catch Ljava/lang/InterruptedException; {:try_start_91 .. :try_end_94} :catch_98
    .catchall {:try_start_91 .. :try_end_94} :catchall_96

    move v4, v11

    goto :goto_2a

    .line 199
    :catchall_96
    move-exception p0

    goto :goto_b5

    .line 197
    :catch_98
    move-exception p0

    .line 198
    :try_start_99
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V
    :try_end_a0
    .catchall {:try_start_99 .. :try_end_a0} :catchall_96

    .line 200
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_a4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_ab

    goto :goto_d5

    :cond_ab
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Future;

    invoke-interface {p1, v10}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_a4

    :goto_b5
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_b9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_c9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/concurrent/Future;

    invoke-interface {p2, v10}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_b9

    .line 201
    :cond_c9
    throw p0

    .line 195
    :catch_ca
    move-exception p0

    .line 200
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_cf
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_d6

    .line 202
    :goto_d5
    return-void

    .line 200
    :cond_d6
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Future;

    invoke-interface {p1, v10}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_cf
.end method

.method private static collect(Ljava/lang/Object;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;)V"
        }
    .end annotation

    .line 149
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_1f

    .line 150
    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_11

    .line 151
    goto :goto_51

    .line 150
    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    instance-of v1, p0, Lcom/lagradost/cloudstream3/SearchResponse;

    if-eqz v1, :cond_a

    check-cast p0, Lcom/lagradost/cloudstream3/SearchResponse;

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 151
    :cond_1f
    instance-of v0, p0, Lcom/lagradost/cloudstream3/HomePageResponse;

    if-eqz v0, :cond_42

    .line 152
    check-cast p0, Lcom/lagradost/cloudstream3/HomePageResponse;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/HomePageResponse;->getItems()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_34

    .line 153
    goto :goto_51

    .line 152
    :cond_34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/lagradost/cloudstream3/HomePageList;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/HomePageList;->getList()Ljava/util/List;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/streambundle/v38/Screening;->collect(Ljava/lang/Object;Ljava/util/List;)V

    goto :goto_2d

    .line 153
    :cond_42
    if-eqz p0, :cond_51

    .line 154
    const-string v0, "Recommendations"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 155
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_51

    invoke-static {p0, p1}, Lcom/streambundle/v38/Screening;->collect(Ljava/lang/Object;Ljava/util/List;)V

    .line 157
    :cond_51
    :goto_51
    return-void
.end method

.method private static daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;
    .registers 3

    .line 47
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 48
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 49
    return-object v0
.end method

.method public static detail(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 126
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/FastDetails;->open(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static detailOriginal(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 130
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Lkotlin/coroutines/Continuation;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    aput-object p2, v0, v4

    const-string p1, "detailUnscreened"

    invoke-static {p0, p1, v1, v0}, Lcom/streambundle/v38/Screening;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static dispatch(Ljava/lang/Object;Ljava/lang/String;Lcom/streambundle/v38/Screening$Operation;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/Screening$Operation;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 75
    sget-boolean v0, Lcom/streambundle/v38/BundleSettings;->HIDE_BLOCKED_CATEGORIES:Z

    if-nez v0, :cond_f

    .line 76
    :try_start_4
    invoke-interface {p2, p3}, Lcom/streambundle/v38/Screening$Operation;->call(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0
    :try_end_8
    .catchall {:try_start_4 .. :try_end_8} :catchall_9

    return-object p0

    .line 77
    :catchall_9
    move-exception p0

    invoke-static {p0}, Lcom/streambundle/v38/Screening;->raise(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 79
    :cond_f
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-direct {v0, p3}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 80
    new-instance v1, Lcom/streambundle/v38/Screening$2;

    invoke-direct {v1, p3, p1, p0, v0}, Lcom/streambundle/v38/Screening$2;-><init>(Lkotlin/coroutines/Continuation;Ljava/lang/String;Ljava/lang/Object;Lkotlin/coroutines/SafeContinuation;)V

    .line 110
    :try_start_19
    invoke-interface {p2, v1}, Lcom/streambundle/v38/Screening$Operation;->call(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0
    :try_end_1d
    .catchall {:try_start_19 .. :try_end_1d} :catchall_2b

    .line 112
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-eq p0, p1, :cond_26

    invoke-interface {v1, p0}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 113
    :cond_26
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 111
    :catchall_2b
    move-exception p0

    invoke-static {p0}, Lcom/streambundle/v38/Screening;->raise(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static filter(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)Ljava/lang/Object;
    .registers 3
    invoke-static {p1, p0}, Lcom/streambundle/v38/Screening;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    return-object p0
.end method

.method private static hasCards(Ljava/lang/Object;)Z
    .registers 3

    .line 142
    instance-of v0, p0, Ljava/util/List;

    const/4 v1, 0x1

    if-eqz v0, :cond_d

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    .line 143
    :cond_d
    instance-of v0, p0, Lcom/lagradost/cloudstream3/HomePageResponse;

    if-eqz v0, :cond_1d

    check-cast p0, Lcom/lagradost/cloudstream3/HomePageResponse;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/HomePageResponse;->getItems()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    .line 144
    :cond_1d
    const-string v0, "Recommendations"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 145
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_30

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_30

    return v1

    :cond_30
    const/4 p0, 0x0

    return p0
.end method

.method public static home(Ljava/lang/Object;ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I",
            "Lcom/lagradost/cloudstream3/MainPageRequest;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 121
    new-instance v0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0, p1, p2}, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;-><init>(Ljava/lang/Object;ILcom/lagradost/cloudstream3/MainPageRequest;)V

    .line 122
    nop

    .line 121
    const/4 p1, 0x0

    invoke-static {p0, p1, v0, p3}, Lcom/streambundle/v38/Screening;->dispatch(Ljava/lang/Object;Ljava/lang/String;Lcom/streambundle/v38/Screening$Operation;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static inspect(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/CoroutineContext;J)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 206
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    cmp-long v0, v0, p4

    if-gez v0, :cond_a9

    invoke-static {p2}, Lcom/streambundle/v38/Screening;->cached(Ljava/lang/String;)Lcom/streambundle/v38/Screening$Decision;

    move-result-object v0

    if-eqz v0, :cond_10

    goto/16 :goto_a9

    .line 207
    :cond_10
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 208
    new-instance v1, Ljava/util/concurrent/CountDownLatch;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 209
    sget-object v3, Lkotlinx/coroutines/Job;->Key:Lkotlinx/coroutines/Job$Key;

    invoke-interface {p3, v3}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v3

    check-cast v3, Lkotlinx/coroutines/Job;

    invoke-static {v3}, Lkotlinx/coroutines/JobKt;->Job(Lkotlinx/coroutines/Job;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v3

    .line 210
    invoke-interface {p3, v3}, Lkotlin/coroutines/CoroutineContext;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p3

    new-instance v4, Lcom/streambundle/v38/Screening$ProbeContext;

    invoke-direct {v4}, Lcom/streambundle/v38/Screening$ProbeContext;-><init>()V

    invoke-interface {p3, v4}, Lkotlin/coroutines/CoroutineContext;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p3

    .line 211
    new-instance v4, Lcom/streambundle/v38/Screening$3;

    invoke-direct {v4, p3, v0, v1}, Lcom/streambundle/v38/Screening$3;-><init>(Lkotlin/coroutines/CoroutineContext;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V

    .line 216
    const/4 p3, 0x0

    :try_start_3a
    invoke-static {p0, p1, v4}, Lcom/streambundle/v38/Screening;->detailOriginal(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v4

    .line 217
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v5

    if-ne v4, v5, :cond_5f

    .line 218
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long/2addr p4, v4

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, p4, p5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p4

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, p4, p5, v4}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result p4
    :try_end_55
    .catch Lcom/streambundle/v38/Screening$FilteredVideo; {:try_start_3a .. :try_end_55} :catch_96
    .catch Ljava/lang/InterruptedException; {:try_start_3a .. :try_end_55} :catch_94
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_55} :catch_8f
    .catch Ljava/lang/LinkageError; {:try_start_3a .. :try_end_55} :catch_8d
    .catchall {:try_start_3a .. :try_end_55} :catchall_88

    if-nez p4, :cond_5b

    .line 235
    invoke-interface {v3, p3}, Lkotlinx/coroutines/CompletableJob;->cancel(Ljava/util/concurrent/CancellationException;)V

    .line 218
    return-void

    .line 219
    :cond_5b
    :try_start_5b
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    .line 221
    :cond_5f
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 222
    invoke-static {v4}, Lcom/streambundle/v38/Screening;->isDetail(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_84

    invoke-static {p0, p1, v4}, Lcom/streambundle/v38/BundleMetadata;->inspected(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6f

    goto :goto_84

    .line 223
    :cond_6f
    invoke-static {v4}, Lcom/streambundle/v38/BundleMetadata;->blocked(Ljava/lang/Object;)Z

    move-result p0

    .line 224
    xor-int/2addr p0, v2

    if-eqz p0, :cond_79

    invoke-static {p1, v4}, Lcom/streambundle/v38/PosterSupport;->rememberLoaded(Ljava/lang/String;Ljava/lang/Object;)V

    .line 225
    :cond_79
    sget-object p1, Lcom/streambundle/v38/Screening;->CACHE:Ljava/util/Map;

    new-instance p4, Lcom/streambundle/v38/Screening$Decision;

    invoke-direct {p4, p0}, Lcom/streambundle/v38/Screening$Decision;-><init>(Z)V

    invoke-interface {p1, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_83
    .catch Lcom/streambundle/v38/Screening$FilteredVideo; {:try_start_5b .. :try_end_83} :catch_96
    .catch Ljava/lang/InterruptedException; {:try_start_5b .. :try_end_83} :catch_94
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_83} :catch_8f
    .catch Ljava/lang/LinkageError; {:try_start_5b .. :try_end_83} :catch_8d
    .catchall {:try_start_5b .. :try_end_83} :catchall_88

    .line 226
    goto :goto_90

    .line 235
    :cond_84
    :goto_84
    invoke-interface {v3, p3}, Lkotlinx/coroutines/CompletableJob;->cancel(Ljava/util/concurrent/CancellationException;)V

    .line 222
    return-void

    .line 232
    :catchall_88
    move-exception p0

    .line 233
    :try_start_89
    invoke-static {p0}, Lcom/streambundle/v38/Screening;->raise(Ljava/lang/Throwable;)Ljava/lang/Object;
    :try_end_8c
    .catchall {:try_start_89 .. :try_end_8c} :catchall_a4

    goto :goto_90

    .line 230
    :catch_8d
    move-exception p0

    goto :goto_90

    :catch_8f
    move-exception p0

    .line 235
    :goto_90
    invoke-interface {v3, p3}, Lkotlinx/coroutines/CompletableJob;->cancel(Ljava/util/concurrent/CancellationException;)V

    goto :goto_a3

    .line 228
    :catch_94
    move-exception p0

    .line 229
    :try_start_95
    throw p0

    .line 226
    :catch_96
    move-exception p0

    .line 227
    sget-object p0, Lcom/streambundle/v38/Screening;->CACHE:Ljava/util/Map;

    new-instance p1, Lcom/streambundle/v38/Screening$Decision;

    const/4 p4, 0x0

    invoke-direct {p1, p4}, Lcom/streambundle/v38/Screening$Decision;-><init>(Z)V

    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a2
    .catchall {:try_start_95 .. :try_end_a2} :catchall_a4

    goto :goto_90

    .line 237
    :goto_a3
    return-void

    .line 234
    :catchall_a4
    move-exception p0

    .line 235
    invoke-interface {v3, p3}, Lkotlinx/coroutines/CompletableJob;->cancel(Ljava/util/concurrent/CancellationException;)V

    .line 236
    throw p0

    .line 206
    :cond_a9
    :goto_a9
    return-void
.end method

.method static varargs invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 134
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_c} :catch_d

    return-object p0

    .line 135
    :catch_d
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    throw p0
.end method

.method private static isDetail(Ljava/lang/Object;)Z
    .registers 2

    .line 240
    if-eqz p0, :cond_14

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "LoadResponse"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public static isProbe(Lkotlin/coroutines/Continuation;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "*>;)Z"
        }
    .end annotation

    .line 41
    if-eqz p0, :cond_10

    invoke-interface {p0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    sget-object v0, Lcom/streambundle/v38/Screening;->PROBE_KEY:Lcom/streambundle/v38/Screening$ProbeKey;

    invoke-interface {p0, v0}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method private static key(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "|"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 24
    const-string v0, "streambundle-metadata"

    invoke-static {p0, v0}, Lcom/streambundle/v38/Screening;->daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$1(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 26
    const-string v0, "streambundle-cards"

    invoke-static {p0, v0}, Lcom/streambundle/v38/Screening;->daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$2(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 117
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/PunishSearch;->run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$3(Ljava/lang/Object;ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 121
    nop

    .line 122
    const/4 v0, 0x3

    new-array v1, v0, [Ljava/lang/Class;

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Lcom/lagradost/cloudstream3/MainPageRequest;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-class v2, Lkotlin/coroutines/Continuation;

    const/4 v5, 0x2

    aput-object v2, v1, v5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    aput-object p2, v0, v4

    aput-object p3, v0, v5

    .line 121
    const-string p1, "homeUnscreened"

    invoke-static {p0, p1, v1, v0}, Lcom/streambundle/v38/Screening;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 122
    return-object p0
.end method

.method static synthetic lambda$4(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 126
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/Screening;->detailOriginal(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$5(Ljava/lang/Object;Ljava/util/Map$Entry;Lkotlin/coroutines/CoroutineContext;J)Ljava/lang/Void;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 185
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    move-object v1, p0

    move-object v4, p2

    move-wide v5, p3

    invoke-static/range {v1 .. v6}, Lcom/streambundle/v38/Screening;->inspect(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/CoroutineContext;J)V

    .line 186
    const/4 p0, 0x0

    return-object p0
.end method

.method private static prepareDetail(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4

    .line 244
    invoke-static {p2}, Lcom/streambundle/v38/Screening;->isDetail(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 245
    :cond_7
    invoke-static {p2}, Lcom/streambundle/v38/BundleMetadata;->checkDetail(Ljava/lang/Object;)V

    .line 246
    invoke-static {p1, p2}, Lcom/streambundle/v38/PosterSupport;->rememberLoaded(Ljava/lang/String;Ljava/lang/Object;)V

    .line 247
    invoke-static {p0, p1}, Lcom/streambundle/v38/Screening;->key(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 248
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/BundleMetadata;->inspected(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_22

    sget-object p0, Lcom/streambundle/v38/Screening;->CACHE:Ljava/util/Map;

    new-instance p1, Lcom/streambundle/v38/Screening$Decision;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Lcom/streambundle/v38/Screening$Decision;-><init>(Z)V

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    :cond_22
    return-void
.end method

.method static raise(Ljava/lang/Throwable;)Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/lang/Object;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 139
    throw p0
.end method

.method private static replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 253
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_b

    check-cast p0, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/streambundle/v38/Screening;->screened(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/streambundle/v38/QuickSearch;->remember(Ljava/lang/Object;Ljava/util/List;)V

    return-object p0

    .line 254
    :cond_b
    instance-of v0, p0, Lcom/lagradost/cloudstream3/HomePageResponse;

    if-eqz v0, :cond_33

    .line 255
    move-object v0, p0

    check-cast v0, Lcom/lagradost/cloudstream3/HomePageResponse;

    invoke-virtual {v0}, Lcom/lagradost/cloudstream3/HomePageResponse;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_21

    .line 257
    return-object p0

    .line 255
    :cond_21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lagradost/cloudstream3/HomePageList;

    .line 256
    invoke-virtual {v1}, Lcom/lagradost/cloudstream3/HomePageList;->getList()Ljava/util/List;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/streambundle/v38/Screening;->screened(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/lagradost/cloudstream3/HomePageList;->setList(Ljava/util/List;)V

    invoke-static {p1, v2}, Lcom/streambundle/v38/QuickSearch;->remember(Ljava/lang/Object;Ljava/util/List;)V

    goto :goto_1a

    .line 259
    :cond_33
    const-string v0, "Recommendations"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 260
    instance-of v2, v1, Ljava/util/List;

    if-eqz v2, :cond_48

    .line 261
    const-class v2, Ljava/util/List;

    check-cast v1, Ljava/util/List;

    invoke-static {v1, p1}, Lcom/streambundle/v38/Screening;->screened(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {p0, v0, v2, p1}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 262
    :cond_48
    return-object p0
.end method

.method private static screened(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;"
        }
    .end annotation

    .line 266
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 267
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_9
    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_10

    .line 284
    return-object v0

    .line 267
    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 268
    instance-of v2, v1, Lcom/lagradost/cloudstream3/SearchResponse;

    if-nez v2, :cond_19

    goto :goto_9

    .line 269
    :cond_19
    check-cast v1, Lcom/lagradost/cloudstream3/SearchResponse;

    .line 270
    invoke-interface {v1}, Lcom/lagradost/cloudstream3/SearchResponse;->getUrl()Ljava/lang/String;

    move-result-object v2

    .line 271
    if-eqz v2, :cond_9

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_28

    goto :goto_9

    .line 272
    :cond_28
    invoke-static {p1, v2}, Lcom/streambundle/v38/Screening;->key(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/v38/Screening;->cached(Ljava/lang/String;)Lcom/streambundle/v38/Screening$Decision;

    move-result-object v3

    .line 273
    if-eqz v3, :cond_3d

    .line 274
    iget-boolean v3, v3, Lcom/streambundle/v38/Screening$Decision;->allowed:Z

    if-eqz v3, :cond_9

    .line 275
    invoke-static {v1, v2}, Lcom/streambundle/v38/BundleMetadata;->restoreSearchPoster(Ljava/lang/Object;Ljava/lang/String;)V

    .line 276
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    goto :goto_9

    .line 280
    :cond_3d
    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->blocked(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_44

    goto :goto_9

    .line 281
    :cond_44
    invoke-static {v1, v2}, Lcom/streambundle/v38/BundleMetadata;->restoreSearchPoster(Ljava/lang/Object;Ljava/lang/String;)V

    .line 282
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9
.end method

.method public static search(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 117
    new-instance v0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/streambundle/v38/Screening;->dispatch(Ljava/lang/Object;Ljava/lang/String;Lcom/streambundle/v38/Screening$Operation;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
