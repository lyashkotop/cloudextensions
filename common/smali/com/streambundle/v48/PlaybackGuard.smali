.class public final Lcom/streambundle/v48/PlaybackGuard;
.super Ljava/lang/Object;
.source "PlaybackGuard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v48/PlaybackGuard$State;
    }
.end annotation


# static fields
.field private static final TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 19
    new-instance v0, Lcom/streambundle/v48/PlaybackGuard$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/streambundle/v48/PlaybackGuard$$ExternalSyntheticLambda0;-><init>()V

    const/16 v1, 0x8

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v48/PlaybackGuard;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 20
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 21
    new-instance v1, Lcom/streambundle/v48/PlaybackGuard$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/streambundle/v48/PlaybackGuard$$ExternalSyntheticLambda1;-><init>()V

    .line 20
    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    sput-object v0, Lcom/streambundle/v48/PlaybackGuard;->TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 23
    sget-object v0, Lcom/streambundle/v48/PlaybackGuard;->TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setRemoveOnCancelPolicy(Z)V

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .registers 1

    .line 20
    sget-object v0, Lcom/streambundle/v48/PlaybackGuard;->TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    return-object v0
.end method

.method static synthetic access$1()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 19
    sget-object v0, Lcom/streambundle/v48/PlaybackGuard;->WORK:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 21
    const-string v0, "streambundle-playback-timer"

    invoke-static {p0, v0}, Lcom/streambundle/v48/PlaybackGuard;->thread(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$1(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 19
    const-string v0, "streambundle-playback"

    invoke-static {p0, v0}, Lcom/streambundle/v48/PlaybackGuard;->thread(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method public static load(Ljava/lang/Object;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Z",
            "Lkotlin/jvm/functions/Function1;",
            "Lkotlin/jvm/functions/Function1;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 35
    new-instance v7, Lcom/streambundle/v48/PlaybackGuard$State;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/streambundle/v48/PlaybackGuard$State;-><init>(Ljava/lang/Object;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    .line 36
    invoke-virtual {v7}, Lcom/streambundle/v48/PlaybackGuard$State;->start()V

    .line 37
    iget-object p0, v7, Lcom/streambundle/v48/PlaybackGuard$State;->result:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {p0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static thread(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;
    .registers 3

    .line 28
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 29
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 30
    return-object v0
.end method
