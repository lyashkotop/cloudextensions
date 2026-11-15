.class public final Lcom/streambundle/v38/FastHurt;
.super Ljava/lang/Object;
.source "FastHurt.java"


# static fields
.field private static final IO:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 14
    new-instance v0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda0;-><init>()V

    const/4 v1, 0x3

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/FastHurt;->IO:Ljava/util/concurrent/ExecutorService;

    .line 16
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 15
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "streambundle-hurt-player"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/SafeContinuation;)V
    .registers 6

    .line 24
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 26
    :try_start_5
    new-instance v1, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda2;

    invoke-direct {v1, p2, v0}, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda2;-><init>(Lkotlin/jvm/functions/Function1;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-static {p0, p1, v1}, Lcom/streambundle/v38/ExtraPlayer;->fallback(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    .line 27
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-eqz p0, :cond_19

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p3, p0}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    goto :goto_30

    .line 28
    :cond_19
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "HurtSex: \u043f\u043b\u0435\u0435\u0440 \u0438\u043b\u0438 \u0432\u0438\u0434\u0435\u043e \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u043d\u044b \u043d\u0430 \u0441\u0435\u0440\u0432\u0435\u0440\u0435. \u041f\u043e\u043f\u0440\u043e\u0431\u0443\u0439\u0442\u0435 \u0434\u0440\u0443\u0433\u043e\u0439 \u0440\u043e\u043b\u0438\u043a."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p3, p0}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V
    :try_end_27
    .catchall {:try_start_5 .. :try_end_27} :catchall_28

    .line 29
    goto :goto_30

    :catchall_28
    move-exception p0

    invoke-static {p0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p3, p0}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 30
    :goto_30
    return-void
.end method

.method static synthetic lambda$2(Lkotlin/jvm/functions/Function1;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;
    .registers 3

    .line 26
    invoke-interface {p0, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public static load(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 22
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-direct {v0, p3}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 23
    sget-object p3, Lcom/streambundle/v38/FastHurt;->IO:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/SafeContinuation;)V

    invoke-interface {p3, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 31
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static supports(Ljava/lang/String;)Z
    .registers 3

    .line 18
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    const-string v1, "hurtsex.com"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    const-string v1, "www.hurtsex.com"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_17} :catch_1c

    if-nez p0, :cond_1a

    return v0

    :cond_1a
    const/4 p0, 0x1

    return p0

    .line 19
    :catch_1c
    move-exception p0

    return v0
.end method
