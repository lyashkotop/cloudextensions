.class Lcom/streambundle/v38/Screening$2;
.super Ljava/lang/Object;
.source "Screening.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/Screening;->dispatch(Ljava/lang/Object;Ljava/lang/String;Lcom/streambundle/v38/Screening$Operation;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
.field private final synthetic val$completion:Lkotlin/coroutines/Continuation;

.field private final synthetic val$detailUrl:Ljava/lang/String;

.field private final synthetic val$provider:Ljava/lang/Object;

.field private final synthetic val$safe:Lkotlin/coroutines/SafeContinuation;


# direct methods
.method constructor <init>(Lkotlin/coroutines/Continuation;Ljava/lang/String;Ljava/lang/Object;Lkotlin/coroutines/SafeContinuation;)V
    .registers 5

    .line 80
    iput-object p1, p0, Lcom/streambundle/v38/Screening$2;->val$completion:Lkotlin/coroutines/Continuation;

    iput-object p2, p0, Lcom/streambundle/v38/Screening$2;->val$detailUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/streambundle/v38/Screening$2;->val$provider:Ljava/lang/Object;

    iput-object p4, p0, Lcom/streambundle/v38/Screening$2;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 81
    iget-object v0, p0, Lcom/streambundle/v38/Screening$2;->val$completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$0$com-streambundle-v38-Screening$2(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/coroutines/SafeContinuation;)V
    .registers 5

    .line 100
    :try_start_0
    invoke-virtual {p0}, Lcom/streambundle/v38/Screening$2;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    # invokes: Lcom/streambundle/v38/Screening;->filter(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)Ljava/lang/Object;
    invoke-static {p1, p2, v0}, Lcom/streambundle/v38/Screening;->access$6(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)Ljava/lang/Object;

    move-result-object p1
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_e

    .line 101
    :catch_9
    move-exception v0

    # invokes: Lcom/streambundle/v38/Screening;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {p2, p1}, Lcom/streambundle/v38/Screening;->access$7(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 102
    :goto_e
    invoke-virtual {p3, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 103
    return-void
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 6

    .line 84
    :try_start_0
    iget-object v0, p0, Lcom/streambundle/v38/Screening$2;->val$detailUrl:Ljava/lang/String;

    if-eqz v0, :cond_f

    .line 85
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 86
    iget-object v0, p0, Lcom/streambundle/v38/Screening$2;->val$provider:Ljava/lang/Object;

    iget-object v1, p0, Lcom/streambundle/v38/Screening$2;->val$detailUrl:Ljava/lang/String;

    # invokes: Lcom/streambundle/v38/Screening;->prepareDetail(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v0, v1, p1}, Lcom/streambundle/v38/Screening;->access$1(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_e
    .catch Lcom/streambundle/v38/Screening$FilteredVideo; {:try_start_0 .. :try_end_e} :catch_44
    .catchall {:try_start_0 .. :try_end_e} :catchall_39

    .line 88
    nop

    .line 96
    :cond_f
    # invokes: Lcom/streambundle/v38/Screening;->hasCards(Ljava/lang/Object;)Z
    invoke-static {p1}, Lcom/streambundle/v38/Screening;->access$4(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    iget-object v0, p0, Lcom/streambundle/v38/Screening$2;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    return-void

    .line 98
    :cond_1b
    :try_start_1b
    # getter for: Lcom/streambundle/v38/Screening;->LISTS:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/streambundle/v38/Screening;->access$5()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundle/v38/Screening$2;->val$provider:Ljava/lang/Object;

    iget-object v2, p0, Lcom/streambundle/v38/Screening$2;->val$safe:Lkotlin/coroutines/SafeContinuation;

    new-instance v3, Lcom/streambundle/v38/Screening$2$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v1, p1, v2}, Lcom/streambundle/v38/Screening$2$$ExternalSyntheticLambda0;-><init>(Lcom/streambundle/v38/Screening$2;Ljava/lang/Object;Ljava/lang/Object;Lkotlin/coroutines/SafeContinuation;)V

    invoke-interface {v0, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_2b
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1b .. :try_end_2b} :catch_2c

    .line 104
    goto :goto_38

    :catch_2c
    move-exception v0

    .line 105
    iget-object v0, p0, Lcom/streambundle/v38/Screening$2;->val$safe:Lkotlin/coroutines/SafeContinuation;

    iget-object v1, p0, Lcom/streambundle/v38/Screening$2;->val$provider:Ljava/lang/Object;

    # invokes: Lcom/streambundle/v38/Screening;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {p1, v1}, Lcom/streambundle/v38/Screening;->access$7(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 107
    :goto_38
    return-void

    .line 92
    :catchall_39
    move-exception p1

    .line 93
    iget-object v0, p0, Lcom/streambundle/v38/Screening$2;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 94
    return-void

    .line 88
    :catch_44
    move-exception p1

    .line 89
    # getter for: Lcom/streambundle/v38/Screening;->CACHE:Ljava/util/Map;
    invoke-static {}, Lcom/streambundle/v38/Screening;->access$2()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundle/v38/Screening$2;->val$provider:Ljava/lang/Object;

    iget-object v2, p0, Lcom/streambundle/v38/Screening$2;->val$detailUrl:Ljava/lang/String;

    # invokes: Lcom/streambundle/v38/Screening;->key(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/streambundle/v38/Screening;->access$3(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/streambundle/v38/Screening$Decision;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/streambundle/v38/Screening$Decision;-><init>(Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    iget-object v0, p0, Lcom/streambundle/v38/Screening$2;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 91
    return-void
.end method
