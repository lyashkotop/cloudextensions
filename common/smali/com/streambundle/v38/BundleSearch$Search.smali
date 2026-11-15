.class final Lcom/streambundle/v38/BundleSearch$Search;
.super Ljava/lang/Object;
.source "BundleSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/BundleSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Search"
.end annotation


# instance fields
.field private final completion:Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private deadline:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private final failures:[Ljava/lang/Object;

.field private finished:Z

.field private final provider:Ljava/lang/Object;

.field private final received:[Z

.field private final results:[Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$55SriHvpoRmJ3jZInQotMnQz9Bs(Lcom/streambundle/v38/BundleSearch$Search;)V
    .registers 1

    invoke-direct {p0}, Lcom/streambundle/v38/BundleSearch$Search;->onDeadline()V

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/util/List;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    iput-object v3, p0, Lcom/streambundle/v38/BundleSearch$Search;->results:[Ljava/util/List;

    .line 70
    new-array v0, v2, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->failures:[Ljava/lang/Object;

    .line 71
    new-array v0, v2, [Z

    iput-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->received:[Z

    .line 76
    iput-object p1, p0, Lcom/streambundle/v38/BundleSearch$Search;->provider:Ljava/lang/Object;

    .line 77
    iput-object p2, p0, Lcom/streambundle/v38/BundleSearch$Search;->completion:Lkotlin/coroutines/Continuation;

    .line 78
    return-void
.end method

.method static synthetic access$0(Lcom/streambundle/v38/BundleSearch$Search;)Lkotlin/coroutines/Continuation;
    .registers 1

    .line 68
    iget-object p0, p0, Lcom/streambundle/v38/BundleSearch$Search;->completion:Lkotlin/coroutines/Continuation;

    return-object p0
.end method

.method private finishLocked()Ljava/lang/Object;
    .registers 5

    .line 134
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->finished:Z

    .line 135
    iget-object v1, p0, Lcom/streambundle/v38/BundleSearch$Search;->deadline:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/streambundle/v38/BundleSearch$Search;->deadline:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 136
    :cond_d
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/streambundle/v38/BundleSearch$Search;->results:[Ljava/util/List;

    aget-object v3, v3, v2

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 137
    iget-object v3, p0, Lcom/streambundle/v38/BundleSearch$Search;->results:[Ljava/util/List;

    aget-object v0, v3, v0

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 138
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->failures:[Ljava/lang/Object;

    aget-object v0, v0, v2

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->failures:[Ljava/lang/Object;

    aget-object v0, v0, v2

    return-object v0

    .line 139
    :cond_2e
    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->cards(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private onDeadline()V
    .registers 3

    .line 126
    monitor-enter p0

    .line 127
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->finished:Z

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 128
    :cond_7
    invoke-direct {p0}, Lcom/streambundle/v38/BundleSearch$Search;->finishLocked()Ljava/lang/Object;

    move-result-object v0

    .line 126
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_12

    .line 130
    iget-object v1, p0, Lcom/streambundle/v38/BundleSearch$Search;->completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v1, v0}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 131
    return-void

    .line 126
    :catchall_12
    move-exception v0

    :try_start_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw v0
.end method


# virtual methods
.method complete(ILjava/lang/Object;)V
    .registers 9

    .line 98
    nop

    .line 99
    nop

    .line 100
    monitor-enter p0

    .line 101
    :try_start_3
    iget-boolean v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->finished:Z

    if-nez v0, :cond_7d

    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->received:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_f

    goto/16 :goto_7d

    .line 102
    :cond_f
    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->received:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_7f

    .line 103
    const/4 v0, 0x0

    :try_start_15
    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_18
    .catch Ljava/util/concurrent/CancellationException; {:try_start_15 .. :try_end_18} :catch_21
    .catchall {:try_start_15 .. :try_end_18} :catchall_19

    goto :goto_1e

    .line 109
    :catchall_19
    move-exception v2

    :try_start_1a
    iget-object v2, p0, Lcom/streambundle/v38/BundleSearch$Search;->failures:[Ljava/lang/Object;

    aput-object p2, v2, p1

    .line 111
    :goto_1e
    const/4 v2, 0x0

    const/4 v3, 0x0

    goto :goto_30

    .line 104
    :catch_21
    move-exception v2

    .line 105
    iput-boolean v1, p0, Lcom/streambundle/v38/BundleSearch$Search;->finished:Z

    .line 106
    iget-object v2, p0, Lcom/streambundle/v38/BundleSearch$Search;->deadline:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v2, :cond_2d

    iget-object v2, p0, Lcom/streambundle/v38/BundleSearch$Search;->deadline:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v2, v0}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 107
    :cond_2d
    nop

    .line 108
    move-object v2, p2

    const/4 v3, 0x1

    .line 111
    :goto_30
    iget-boolean v4, p0, Lcom/streambundle/v38/BundleSearch$Search;->finished:Z

    if-nez v4, :cond_73

    .line 112
    instance-of v4, p2, Ljava/util/List;

    if-eqz v4, :cond_42

    iget-object v4, p0, Lcom/streambundle/v38/BundleSearch$Search;->results:[Ljava/util/List;

    check-cast p2, Ljava/util/List;

    invoke-static {p2}, Lcom/streambundle/v38/BundleMetadata;->cards(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    aput-object p2, v4, p1

    .line 113
    :cond_42
    iget-object p2, p0, Lcom/streambundle/v38/BundleSearch$Search;->received:[Z

    aget-boolean p2, p2, v0

    if-eqz p2, :cond_54

    iget-object p2, p0, Lcom/streambundle/v38/BundleSearch$Search;->received:[Z

    aget-boolean p2, p2, v1

    if-eqz p2, :cond_54

    .line 114
    invoke-direct {p0}, Lcom/streambundle/v38/BundleSearch$Search;->finishLocked()Ljava/lang/Object;

    move-result-object v2

    .line 115
    nop

    .line 116
    goto :goto_74

    :cond_54
    iget-object p2, p0, Lcom/streambundle/v38/BundleSearch$Search;->results:[Ljava/util/List;
    aget-object p1, p2, p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_73

    .line 117
    # getter for: Lcom/streambundle/v38/BundleSearch;->TIMER:Ljava/util/concurrent/ScheduledExecutorService;
    invoke-static {}, Lcom/streambundle/v38/BundleSearch;->access$1()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    new-instance p2, Lcom/streambundle/v38/BundleSearch$Search$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/streambundle/v38/BundleSearch$Search$$ExternalSyntheticLambda0;-><init>(Lcom/streambundle/v38/BundleSearch$Search;)V

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x12c

    invoke-interface {p1, p2, v4, v5, v0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lcom/streambundle/v38/BundleSearch$Search;->deadline:Ljava/util/concurrent/ScheduledFuture;

    .line 100
    :cond_73
    move v1, v3

    :goto_74
    monitor-exit p0
    :try_end_75
    .catchall {:try_start_1a .. :try_end_75} :catchall_7f

    .line 121
    if-eqz v1, :cond_7c

    iget-object p1, p0, Lcom/streambundle/v38/BundleSearch$Search;->completion:Lkotlin/coroutines/Continuation;

    invoke-interface {p1, v2}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 122
    :cond_7c
    return-void

    .line 101
    :cond_7d
    :goto_7d
    :try_start_7d
    monitor-exit p0

    return-void

    .line 100
    :catchall_7f
    move-exception p1

    monitor-exit p0
    :try_end_81
    .catchall {:try_start_7d .. :try_end_81} :catchall_7f

    throw p1
.end method

.method declared-synchronized isFinished()Z
    .registers 2

    monitor-enter p0

    .line 80
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v38/BundleSearch$Search;->finished:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    .line 80
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method start(Ljava/lang/String;I)V
    .registers 5

    .line 83
    invoke-virtual {p0}, Lcom/streambundle/v38/BundleSearch$Search;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 84
    :cond_7
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 85
    new-instance v1, Lcom/streambundle/v38/BundleSearch$Search$1;

    invoke-direct {v1, p0, v0, p2}, Lcom/streambundle/v38/BundleSearch$Search$1;-><init>(Lcom/streambundle/v38/BundleSearch$Search;Ljava/util/concurrent/atomic/AtomicBoolean;I)V

    .line 92
    :try_start_11
    iget-object p2, p0, Lcom/streambundle/v38/BundleSearch$Search;->provider:Ljava/lang/Object;

    # invokes: Lcom/streambundle/v38/BundleSearch;->original(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static {p2, p1, v1}, Lcom/streambundle/v38/BundleSearch;->access$0(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .line 93
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p2

    if-eq p1, p2, :cond_29

    invoke-interface {v1, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V
    :try_end_20
    .catchall {:try_start_11 .. :try_end_20} :catchall_21

    .line 94
    goto :goto_29

    :catchall_21
    move-exception p1

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v1, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 95
    :cond_29
    :goto_29
    return-void
.end method
