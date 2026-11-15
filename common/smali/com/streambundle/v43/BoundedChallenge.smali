.class public final Lcom/streambundle/v43/BoundedChallenge;
.super Ljava/lang/Object;
.source "BoundedChallenge.java"


# static fields
.field private static final IO:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 8
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    new-instance v6, Ljava/util/concurrent/ArrayBlockingQueue;

    const/4 v0, 0x1

    invoke-direct {v6, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    new-instance v7, Lcom/streambundle/v43/BoundedChallenge$1;

    invoke-direct {v7}, Lcom/streambundle/v43/BoundedChallenge$1;-><init>()V

    .line 8
    const/4 v1, 0x0

    const/4 v2, 0x1

    const-wide/16 v3, 0x1e

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v8, Lcom/streambundle/v43/BoundedChallenge;->IO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static cancel(Ljava/util/concurrent/FutureTask;Lokhttp3/Interceptor$Chain;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/FutureTask<",
            "*>;",
            "Lokhttp3/Interceptor$Chain;",
            ")V"
        }
    .end annotation

    .line 27
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    .line 28
    sget-object v0, Lcom/streambundle/v43/BoundedChallenge;->IO:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    .line 29
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->call()Lokhttp3/Call;

    move-result-object p0

    if-eqz p0, :cond_12

    invoke-interface {p0}, Lokhttp3/Call;->cancel()V

    .line 30
    :cond_12
    return-void
.end method

.method static synthetic lambda$0(Lokhttp3/Interceptor;Lokhttp3/Interceptor$Chain;Ljava/util/concurrent/atomic/AtomicBoolean;)Lokhttp3/Response;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 14
    invoke-interface {p0, p1}, Lokhttp3/Interceptor;->intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;

    move-result-object p0

    .line 15
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_16

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result p1

    if-eqz p1, :cond_15

    goto :goto_16

    .line 16
    :cond_15
    return-object p0

    .line 15
    :cond_16
    :goto_16
    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Lokhttp3/Response;->close()V

    :cond_1b
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u0434\u043e\u0441\u0442\u0443\u043f\u0430 \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static solve(Lokhttp3/Interceptor;Lokhttp3/Interceptor$Chain;J)Lokhttp3/Response;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 13
    new-instance v1, Ljava/util/concurrent/FutureTask;

    new-instance v2, Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1, v0}, Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;-><init>(Lokhttp3/Interceptor;Lokhttp3/Interceptor$Chain;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-direct {v1, v2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 18
    :try_start_f
    sget-object p0, Lcom/streambundle/v43/BoundedChallenge;->IO:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_14
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_f .. :try_end_14} :catch_57

    .line 19
    const/4 p0, 0x1

    :try_start_15
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, p2, p3, v2}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lokhttp3/Response;
    :try_end_1d
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_15 .. :try_end_1d} :catch_48
    .catch Ljava/lang/InterruptedException; {:try_start_15 .. :try_end_1d} :catch_32
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_15 .. :try_end_1d} :catch_1e

    return-object p2

    .line 24
    :catch_1e
    move-exception p0

    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    instance-of p1, p0, Ljava/io/IOException;

    if-eqz p1, :cond_2a

    check-cast p0, Ljava/io/IOException;

    throw p0

    :cond_2a
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0439\u0442\u0438 \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0443 \u0434\u043e\u0441\u0442\u0443\u043f\u0430"

    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 23
    :catch_32
    move-exception p2

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-static {v1, p1}, Lcom/streambundle/v43/BoundedChallenge;->cancel(Ljava/util/concurrent/FutureTask;Lokhttp3/Interceptor$Chain;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u0434\u043e\u0441\u0442\u0443\u043f\u0430 \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    invoke-direct {p0, p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    .line 20
    :catch_48
    move-exception p2

    .line 21
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-static {v1, p1}, Lcom/streambundle/v43/BoundedChallenge;->cancel(Ljava/util/concurrent/FutureTask;Lokhttp3/Interceptor$Chain;)V

    .line 22
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u0434\u043e\u0441\u0442\u0443\u043f\u0430 \u043f\u0440\u0435\u0432\u044b\u0441\u0438\u043b\u0430 \u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u0432\u0440\u0435\u043c\u044f \u043e\u0436\u0438\u0434\u0430\u043d\u0438\u044f."

    invoke-direct {p0, p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    .line 18
    :catch_57
    move-exception p0

    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u0434\u043e\u0441\u0442\u0443\u043f\u0430 \u0443\u0436\u0435 \u0432\u044b\u043f\u043e\u043b\u043d\u044f\u0435\u0442\u0441\u044f. \u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u043f\u043e\u0441\u043b\u0435 \u0435\u0451 \u0437\u0430\u0432\u0435\u0440\u0448\u0435\u043d\u0438\u044f."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
