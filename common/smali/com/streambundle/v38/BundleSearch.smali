.class public final Lcom/streambundle/v38/BundleSearch;
.super Ljava/lang/Object;
.source "BundleSearch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/BundleSearch$Search;
    }
.end annotation


# static fields
.field private static final TIMER:Ljava/util/concurrent/ScheduledExecutorService;

.field private static final TRANSLATION:Ljava/util/concurrent/ExecutorService;

.field private static final TRANSLATION_GRACE_MS:J = 0x7d0L


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 14
    nop

    .line 15
    new-instance v0, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda0;-><init>()V

    .line 14
    const/4 v1, 0x4

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/BundleSearch;->TRANSLATION:Ljava/util/concurrent/ExecutorService;

    .line 17
    new-instance v0, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda1;-><init>()V

    .line 16
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/BundleSearch;->TIMER:Ljava/util/concurrent/ScheduledExecutorService;

    .line 18
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 45
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/BundleSearch;->original(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1()Ljava/util/concurrent/ScheduledExecutorService;
    .registers 1

    .line 16
    sget-object v0, Lcom/streambundle/v38/BundleSearch;->TIMER:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method static synthetic access$2(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 1

    .line 52
    invoke-static {p0}, Lcom/streambundle/v38/BundleSearch;->filtered(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;
    .registers 3

    .line 22
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 23
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 24
    return-object v0
.end method

.method private static filtered(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 53
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_a

    check-cast p0, Ljava/util/List;

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->cards(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    :cond_a
    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 17
    const-string v0, "streambundle-search-deadline"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleSearch;->daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$1(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 15
    const-string v0, "streambundle-translation"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleSearch;->daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$2(Lcom/streambundle/v38/BundleSearch$Search;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 37
    invoke-virtual {p0}, Lcom/streambundle/v38/BundleSearch$Search;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 38
    :cond_7
    invoke-static {p1, p2}, Lcom/streambundle/v38/BundleTranslation;->translate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 39
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1d

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_19

    goto :goto_1d

    .line 40
    :cond_19
    invoke-virtual {p0, p2, v1}, Lcom/streambundle/v38/BundleSearch$Search;->start(Ljava/lang/String;I)V

    goto :goto_24

    .line 39
    :cond_1d
    :goto_1d
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Lcom/streambundle/v38/BundleSearch$Search;->complete(ILjava/lang/Object;)V

    .line 41
    :goto_24
    return-void
.end method

.method private static original(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 10
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

    .line 46
    const-string v0, "com.streambundle.SearchLimit"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 47
    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-class v3, Lkotlin/coroutines/Continuation;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-string v3, "run"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 46
    nop

    .line 48
    :try_start_1f
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    aput-object p1, v1, v5

    aput-object p2, v1, v6

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_2c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1f .. :try_end_2c} :catch_2d

    return-object p0

    .line 49
    :catch_2d
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    throw p0
.end method

.method private static primaryOnly(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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

    .line 57
    new-instance v0, Lcom/streambundle/v38/BundleSearch$1;

    invoke-direct {v0, p2}, Lcom/streambundle/v38/BundleSearch$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 61
    :try_start_5
    invoke-static {p0, p1, v0}, Lcom/streambundle/v38/BundleSearch;->original(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v38/BundleSearch;->filtered(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_d
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_d} :catch_17
    .catch Ljava/lang/Error; {:try_start_5 .. :try_end_d} :catch_15
    .catchall {:try_start_5 .. :try_end_d} :catchall_e

    return-object p0

    .line 63
    :catchall_e
    move-exception p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 62
    :catch_15
    move-exception p0

    goto :goto_18

    :catch_17
    move-exception p0

    :goto_18
    throw p0
.end method

.method public static run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 5
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

    invoke-static {p0}, Lcom/streambundle/v38/QuickSearch;->supports(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :generic_search

    check-cast p0, Lcom/lagradost/cloudstream3/MainAPI;
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/QuickSearch;->run(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    move-result-object p0
    return-object p0

    :generic_search
    .line 28
    if-nez p1, :cond_5

    const-string p1, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 29
    :goto_9
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 30
    :cond_14
    invoke-static {p0, p1}, Lcom/streambundle/v38/SearchAndPosters;->target(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/BundleSearch;->primaryOnly(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 33
    :cond_23
    new-instance v1, Lcom/streambundle/v38/BundleSearch$Search;

    invoke-direct {v1, p0, p2}, Lcom/streambundle/v38/BundleSearch$Search;-><init>(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V

    invoke-static {p1, v0}, Lcom/streambundle/v38/SearchAndPosters;->local(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z
    move-result p2
    if-nez p2, :remote_translation

    const/4 p2, 0x0
    invoke-virtual {v1, p0, p2}, Lcom/streambundle/v38/BundleSearch$Search;->start(Ljava/lang/String;I)V
    const/4 p2, 0x1
    invoke-virtual {v1, p1, p2}, Lcom/streambundle/v38/BundleSearch$Search;->start(Ljava/lang/String;I)V
    goto :return_search

    :remote_translation
    .line 35
    const/4 p0, 0x0

    invoke-virtual {v1, p1, p0}, Lcom/streambundle/v38/BundleSearch$Search;->start(Ljava/lang/String;I)V

    .line 36
    sget-object p0, Lcom/streambundle/v38/BundleSearch;->TRANSLATION:Ljava/util/concurrent/ExecutorService;

    new-instance p2, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;

    invoke-direct {p2, v1, p1, v0}, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;-><init>(Lcom/streambundle/v38/BundleSearch$Search;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0, p2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :return_search
    .line 42
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
