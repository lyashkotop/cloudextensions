.class final Lcom/streambundle/SearchLimit$State;
.super Ljava/lang/Object;
.source "SearchLimit.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/SearchLimit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "State"
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
.field done:Z

.field final end:Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final showErrors:Z

.field timer:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field value:Ljava/lang/Object;

.field waiting:Z


# direct methods
.method constructor <init>(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/streambundle/SearchLimit$State;->end:Lkotlin/coroutines/Continuation;

    invoke-static {p1}, Lcom/streambundle/v43/Repair43;->affected(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/streambundle/SearchLimit$State;->showErrors:Z

    return-void
.end method


# virtual methods
.method complete(Ljava/lang/Object;)V
    .registers 5

    .line 44
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_4

    goto :goto_11

    :catchall_4
    move-exception v0

    .line 45
    iget-boolean v1, p0, Lcom/streambundle/SearchLimit$State;->showErrors:Z

    if-nez v1, :cond_11

    instance-of v0, v0, Ljava/util/concurrent/CancellationException;

    if-nez v0, :cond_11

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    .line 48
    :cond_11
    :goto_11
    monitor-enter p0

    .line 49
    :try_start_12
    iget-boolean v0, p0, Lcom/streambundle/SearchLimit$State;->done:Z

    if-eqz v0, :cond_18

    monitor-exit p0

    return-void

    .line 50
    :cond_18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundle/SearchLimit$State;->done:Z

    iput-object p1, p0, Lcom/streambundle/SearchLimit$State;->value:Ljava/lang/Object;

    iget-boolean v0, p0, Lcom/streambundle/SearchLimit$State;->waiting:Z

    .line 51
    iget-object v1, p0, Lcom/streambundle/SearchLimit$State;->timer:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_29

    iget-object v1, p0, Lcom/streambundle/SearchLimit$State;->timer:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 48
    :cond_29
    monitor-exit p0
    :try_end_2a
    .catchall {:try_start_12 .. :try_end_2a} :catchall_32

    .line 53
    if-eqz v0, :cond_31

    iget-object v0, p0, Lcom/streambundle/SearchLimit$State;->end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 54
    :cond_31
    return-void

    .line 48
    :catchall_32
    move-exception p1

    :try_start_33
    monitor-exit p0
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_32

    throw p1
.end method

.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 41
    iget-object v0, p0, Lcom/streambundle/SearchLimit$State;->end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method declared-synchronized result()Ljava/lang/Object;
    .registers 2

    monitor-enter p0

    .line 56
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/SearchLimit$State;->done:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/streambundle/SearchLimit$State;->value:Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_12

    monitor-exit p0

    return-object v0

    .line 57
    :cond_9
    const/4 v0, 0x1

    :try_start_a
    iput-boolean v0, p0, Lcom/streambundle/SearchLimit$State;->waiting:Z

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0
    :try_end_10
    .catchall {:try_start_a .. :try_end_10} :catchall_12

    monitor-exit p0

    return-object v0

    .line 55
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 2

    .line 42
    invoke-virtual {p0, p1}, Lcom/streambundle/SearchLimit$State;->complete(Ljava/lang/Object;)V

    return-void
.end method
