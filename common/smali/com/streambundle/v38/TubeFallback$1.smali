.class Lcom/streambundle/v38/TubeFallback$1;
.super Ljava/lang/Object;
.source "TubeFallback.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/TubeFallback;->load(Ljava/lang/Object;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/coroutines/Continuation<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic val$data:Ljava/lang/String;

.field private final synthetic val$deliver:Lkotlin/jvm/functions/Function1;

.field private final synthetic val$emitted:Ljava/util/Set;

.field private final synthetic val$end:Lkotlin/coroutines/Continuation;

.field private final synthetic val$provider:Ljava/lang/Object;

.field private final synthetic val$safe:Lkotlin/coroutines/SafeContinuation;


# direct methods
.method constructor <init>(Lkotlin/coroutines/Continuation;Lkotlin/coroutines/SafeContinuation;Ljava/util/Set;Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    .line 38
    iput-object p1, p0, Lcom/streambundle/v38/TubeFallback$1;->val$end:Lkotlin/coroutines/Continuation;

    iput-object p2, p0, Lcom/streambundle/v38/TubeFallback$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    iput-object p3, p0, Lcom/streambundle/v38/TubeFallback$1;->val$emitted:Ljava/util/Set;

    iput-object p4, p0, Lcom/streambundle/v38/TubeFallback$1;->val$provider:Ljava/lang/Object;

    iput-object p5, p0, Lcom/streambundle/v38/TubeFallback$1;->val$data:Ljava/lang/String;

    iput-object p6, p0, Lcom/streambundle/v38/TubeFallback$1;->val$deliver:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 39
    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$1;->val$end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$0$com-streambundle-v38-TubeFallback$1(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Ljava/util/Set;Lkotlin/coroutines/SafeContinuation;)V
    .registers 8

    .line 51
    nop

    .line 53
    :try_start_1
    invoke-static {p2}, Lcom/streambundle/v38/ExtraPlayer;->supports(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {p3, p2, p4}, Lcom/streambundle/v38/ExtraPlayer;->fallback(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    goto :goto_12

    .line 54
    :cond_b
    invoke-virtual {p0}, Lcom/streambundle/v38/TubeFallback$1;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    # invokes: Lcom/streambundle/v38/TubeFallback;->fallback(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V
    invoke-static {p3, p2, p4, v0}, Lcom/streambundle/v38/TubeFallback;->access$1(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V

    .line 55
    :goto_12
    invoke-interface {p5}, Ljava/util/Set;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_24

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_1a
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1 .. :try_end_1a} :catch_1f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1a} :catch_1d
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_1a} :catch_1b

    .line 56
    goto :goto_24

    .line 57
    :catch_1b
    move-exception p2

    goto :goto_24

    :catch_1d
    move-exception p2

    goto :goto_24

    .line 56
    :catch_1f
    move-exception p1

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    .line 58
    :cond_24
    :goto_24
    invoke-virtual {p6, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 59
    return-void
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 12

    .line 41
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_3} :catch_4a
    .catchall {:try_start_0 .. :try_end_3} :catchall_4

    goto :goto_5

    .line 43
    :catchall_4
    move-exception v0

    .line 44
    :goto_5
    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$1;->val$emitted:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_15

    iget-object p1, p0, Lcom/streambundle/v38/TubeFallback$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v0}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    return-void

    .line 45
    :cond_15
    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$1;->val$provider:Ljava/lang/Object;

    instance-of v0, v0, Lcom/streambundleextra/VideoBundleSite;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$1;->val$data:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundle/v38/ExtraPlayer;->supports(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_29

    .line 46
    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 47
    return-void

    .line 50
    :cond_29
    :try_start_29
    # getter for: Lcom/streambundle/v38/TubeFallback;->IO:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/streambundle/v38/TubeFallback;->access$0()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iget-object v4, p0, Lcom/streambundle/v38/TubeFallback$1;->val$data:Ljava/lang/String;

    iget-object v5, p0, Lcom/streambundle/v38/TubeFallback$1;->val$provider:Ljava/lang/Object;

    iget-object v6, p0, Lcom/streambundle/v38/TubeFallback$1;->val$deliver:Lkotlin/jvm/functions/Function1;

    iget-object v7, p0, Lcom/streambundle/v38/TubeFallback$1;->val$emitted:Ljava/util/Set;

    iget-object v8, p0, Lcom/streambundle/v38/TubeFallback$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    new-instance v9, Lcom/streambundle/v38/TubeFallback$1$$ExternalSyntheticLambda0;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v8}, Lcom/streambundle/v38/TubeFallback$1$$ExternalSyntheticLambda0;-><init>(Lcom/streambundle/v38/TubeFallback$1;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Ljava/util/Set;Lkotlin/coroutines/SafeContinuation;)V

    invoke-interface {v0, v9}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_42
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_29 .. :try_end_42} :catch_43

    .line 60
    goto :goto_49

    :catch_43
    move-exception v0

    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 61
    :goto_49
    return-void

    .line 42
    :catch_4a
    move-exception v0

    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method
