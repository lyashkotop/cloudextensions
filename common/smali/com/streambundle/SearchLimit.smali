.class public final Lcom/streambundle/SearchLimit;
.super Ljava/lang/Object;
.source "SearchLimit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/SearchLimit$State;
    }
.end annotation


# static fields
.field static final CLOCK:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    new-instance v0, Lcom/streambundle/SearchLimit$1;

    invoke-direct {v0}, Lcom/streambundle/SearchLimit$1;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/streambundle/SearchLimit;->CLOCK:Ljava/util/concurrent/ScheduledExecutorService;

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static empty(Ljava/lang/Object;)Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 16
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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

    .line 18
    new-instance v0, Lcom/streambundle/SearchLimit$State;

    invoke-direct {v0, p0, p2}, Lcom/streambundle/SearchLimit$State;-><init>(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V

    .line 19
    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->affected(Ljava/lang/Object;)Z

    move-result p2

    .line 20
    sget-object v1, Lcom/streambundle/SearchLimit;->CLOCK:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Lcom/streambundle/SearchLimit$2;

    invoke-direct {v2, v0, p2, p0}, Lcom/streambundle/SearchLimit$2;-><init>(Lcom/streambundle/SearchLimit$State;ZLjava/lang/Object;)V

    .line 22
    if-eqz p2, :cond_15

    const/16 p2, 0x1e

    goto :goto_17

    :cond_15
    const/16 p2, 0xa

    :goto_17
    int-to-long v3, p2

    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 20
    invoke-interface {v1, v2, v3, v4, p2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p2

    iput-object p2, v0, Lcom/streambundle/SearchLimit$State;->timer:Ljava/util/concurrent/ScheduledFuture;

    .line 24
    :try_start_20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    const-string v1, "searchOriginal"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Lkotlin/coroutines/Continuation;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {p2, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v5

    aput-object v0, v1, v6

    invoke-virtual {p2, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 25
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-eq p0, p1, :cond_5d

    invoke-virtual {v0, p0}, Lcom/streambundle/SearchLimit$State;->complete(Ljava/lang/Object;)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_4a} :catch_4b

    .line 26
    goto :goto_5d

    :catch_4b
    move-exception p0

    .line 27
    instance-of p1, p0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz p1, :cond_56

    check-cast p0, Ljava/lang/reflect/InvocationTargetException;

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    .line 28
    :cond_56
    invoke-static {p0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/streambundle/SearchLimit$State;->complete(Ljava/lang/Object;)V

    .line 30
    :cond_5d
    :goto_5d
    invoke-virtual {v0}, Lcom/streambundle/SearchLimit$State;->result()Ljava/lang/Object;

    move-result-object p0

    .line 31
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-eq p0, p1, :cond_6a

    invoke-static {p0}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 32
    :cond_6a
    return-object p0
.end method
