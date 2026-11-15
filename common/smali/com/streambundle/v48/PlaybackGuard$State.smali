.class final Lcom/streambundle/v48/PlaybackGuard$State;
.super Ljava/lang/Object;
.source "PlaybackGuard.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v48/PlaybackGuard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
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
.field backup:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field backupDone:Z

.field backupStarted:Z

.field final callback:Lkotlin/jvm/functions/Function1;

.field final casting:Z

.field final completion:Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final data:Ljava/lang/String;

.field deadline:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field delay:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field done:Z

.field final emitted:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field error:Ljava/lang/Throwable;

.field final name:Ljava/lang/String;

.field originalDone:Z

.field pending:I

.field final pendingUrls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final provider:Ljava/lang/Object;

.field final result:Lkotlin/coroutines/SafeContinuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/SafeContinuation<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final subtitles:Lkotlin/jvm/functions/Function1;


# direct methods
.method public static synthetic $r8$lambda$_m2ys0lkeBbnpvPP9XiUD0RUW1c(Lcom/streambundle/v48/PlaybackGuard$State;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;
    .registers 2

    invoke-direct {p0, p1}, Lcom/streambundle/v48/PlaybackGuard$State;->accept(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$nz0as4LouIo4fF5_Ytb7l40M9Us(Lcom/streambundle/v48/PlaybackGuard$State;)V
    .registers 1

    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->original()V

    return-void
.end method

.method public static synthetic $r8$lambda$pn2cDf31sz1cRnMJOag9bo0efNs(Lcom/streambundle/v48/PlaybackGuard$State;)V
    .registers 1

    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->startBackup()V

    return-void
.end method

.method public static synthetic $r8$lambda$xp_eUEpk8NqvyCWo4GS4lmjmGMw(Lcom/streambundle/v48/PlaybackGuard$State;)V
    .registers 1

    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->expire()V

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V
    .registers 8
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
            ">;)V"
        }
    .end annotation

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->pendingUrls:Ljava/util/Set;

    .line 50
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->emitted:Ljava/util/Set;

    .line 63
    iput-object p1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->provider:Ljava/lang/Object;

    .line 64
    iput-object p2, p0, Lcom/streambundle/v48/PlaybackGuard$State;->data:Ljava/lang/String;

    .line 65
    instance-of p2, p1, Lcom/lagradost/cloudstream3/MainAPI;

    if-eqz p2, :cond_20

    check-cast p1, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MainAPI;->getName()Ljava/lang/String;

    move-result-object p1

    goto :goto_28

    :cond_20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    :goto_28
    iput-object p1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->name:Ljava/lang/String;

    .line 66
    iput-boolean p3, p0, Lcom/streambundle/v48/PlaybackGuard$State;->casting:Z

    .line 67
    iput-object p4, p0, Lcom/streambundle/v48/PlaybackGuard$State;->subtitles:Lkotlin/jvm/functions/Function1;

    .line 68
    iput-object p5, p0, Lcom/streambundle/v48/PlaybackGuard$State;->callback:Lkotlin/jvm/functions/Function1;

    .line 69
    iput-object p6, p0, Lcom/streambundle/v48/PlaybackGuard$State;->completion:Lkotlin/coroutines/Continuation;

    .line 70
    new-instance p1, Lkotlin/coroutines/SafeContinuation;

    invoke-direct {p1, p6}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    iput-object p1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->result:Lkotlin/coroutines/SafeContinuation;

    .line 71
    return-void
.end method

.method private declared-synchronized accept(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;
    .registers 4

    monitor-enter p0

    .line 131
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->done:Z

    if-nez v0, :cond_61

    if-eqz p1, :cond_61

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v48/ResolveMedia;->unwanted(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    goto :goto_61

    .line 132
    :cond_12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getType()Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getQuality()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->pendingUrls:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_49
    .catchall {:try_start_1 .. :try_end_49} :catchall_65

    monitor-exit p0

    return-object p1

    .line 134
    :cond_4b
    :try_start_4b
    iget v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->pending:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->pending:I

    .line 135
    # getter for: Lcom/streambundle/v48/PlaybackGuard;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/streambundle/v48/PlaybackGuard;->access$1()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda5;-><init>(Lcom/streambundle/v48/PlaybackGuard$State;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 142
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_5f
    .catchall {:try_start_4b .. :try_end_5f} :catchall_65

    monitor-exit p0

    return-object p1

    .line 131
    :cond_61
    :goto_61
    :try_start_61
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_63
    .catchall {:try_start_61 .. :try_end_63} :catchall_65

    monitor-exit p0

    return-object p1

    .line 130
    :catchall_65
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized backupFinished(Ljava/lang/Throwable;)V
    .registers 3

    monitor-enter p0

    .line 124
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->done:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_13

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 125
    :cond_7
    if-eqz p1, :cond_b

    :try_start_9
    iput-object p1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->error:Ljava/lang/Throwable;

    .line 126
    :cond_b
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backupDone:Z

    .line 127
    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->checkDone()V
    :try_end_11
    .catchall {:try_start_9 .. :try_end_11} :catchall_13

    .line 128
    monitor-exit p0

    return-void

    .line 123
    :catchall_13
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private checkDone()V
    .registers 4

    .line 155
    iget v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->pending:I

    if-lez v0, :cond_5

    return-void

    .line 156
    :cond_5
    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->emitted:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1f

    .line 157
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->originalDone:Z

    if-eqz v0, :cond_1e

    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backupStarted:Z

    if-eqz v0, :cond_19

    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backupDone:Z

    if-eqz v0, :cond_1e

    :cond_19
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p0, v0}, Lcom/streambundle/v48/PlaybackGuard$State;->finish(Ljava/lang/Object;)V

    .line 158
    :cond_1e
    return-void

    .line 160
    :cond_1f
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->originalDone:Z

    if-eqz v0, :cond_2a

    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backupStarted:Z

    if-nez v0, :cond_2a

    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->startBackup()V

    .line 161
    :cond_2a
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->originalDone:Z

    if-eqz v0, :cond_5e

    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backupDone:Z

    if-eqz v0, :cond_5e

    .line 162
    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->error:Ljava/lang/Throwable;

    instance-of v0, v0, Ljava/io/IOException;

    if-eqz v0, :cond_3b

    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->error:Ljava/lang/Throwable;

    goto :goto_57

    :cond_3b
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/streambundle/v48/PlaybackGuard$State;->name:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ": \u0441\u0430\u0439\u0442 \u043d\u0435 \u0432\u0435\u0440\u043d\u0443\u043b \u0434\u043e\u0441\u0442\u0443\u043f\u043d\u0443\u044e \u0432\u0438\u0434\u0435\u043e\u0441\u0441\u044b\u043b\u043a\u0443"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/streambundle/v48/PlaybackGuard$State;->error:Ljava/lang/Throwable;

    invoke-direct {v0, v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 163
    :goto_57
    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/streambundle/v48/PlaybackGuard$State;->finish(Ljava/lang/Object;)V

    .line 165
    :cond_5e
    return-void
.end method

.method private declared-synchronized emit(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)V
    .registers 5

    monitor-enter p0

    .line 146
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->done:Z

    if-nez v0, :cond_31

    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->emitted:Ljava/util/Set;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getQuality()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->callback:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_33

    .line 147
    :cond_31
    monitor-exit p0

    return-void

    .line 145
    :catchall_33
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized expire()V
    .registers 4

    monitor-enter p0

    .line 168
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->done:Z

    if-nez v0, :cond_31

    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->emitted:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_2e

    .line 169
    :cond_10
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/streambundle/v48/PlaybackGuard$State;->name:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ": \u0438\u0441\u0442\u0435\u043a\u043b\u043e \u0432\u0440\u0435\u043c\u044f \u043e\u0436\u0438\u0434\u0430\u043d\u0438\u044f \u0432\u0438\u0434\u0435\u043e\u0441\u0441\u044b\u043b\u043e\u043a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    .line 168
    :goto_2e
    invoke-direct {p0, v0}, Lcom/streambundle/v48/PlaybackGuard$State;->finish(Ljava/lang/Object;)V
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_33

    .line 170
    :cond_31
    monitor-exit p0

    return-void

    .line 167
    :catchall_33
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private finish(Ljava/lang/Object;)V
    .registers 5

    .line 173
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->done:Z

    .line 174
    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->deadline:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->deadline:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 175
    :cond_d
    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->delay:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->delay:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 176
    :cond_16
    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backup:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_23

    iget-boolean v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backupDone:Z

    if-nez v1, :cond_23

    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backup:Ljava/util/concurrent/Future;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 177
    :cond_23
    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->result:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 178
    return-void
.end method

.method private original()V
    .registers 12

    .line 81
    :try_start_0
    new-instance v0, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda1;-><init>(Lcom/streambundle/v48/PlaybackGuard$State;)V

    .line 82
    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->provider:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "linksOriginal48"

    const/4 v3, 0x5

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    .line 83
    const-class v5, Lkotlin/jvm/functions/Function1;

    const/4 v8, 0x2

    aput-object v5, v4, v8

    const-class v5, Lkotlin/jvm/functions/Function1;

    const/4 v9, 0x3

    aput-object v5, v4, v9

    const-class v5, Lkotlin/coroutines/Continuation;

    const/4 v10, 0x4

    aput-object v5, v4, v10

    .line 82
    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 84
    iget-object v2, p0, Lcom/streambundle/v48/PlaybackGuard$State;->provider:Ljava/lang/Object;

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/streambundle/v48/PlaybackGuard$State;->data:Ljava/lang/String;

    aput-object v4, v3, v6

    iget-boolean v4, p0, Lcom/streambundle/v48/PlaybackGuard$State;->casting:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v7

    iget-object v4, p0, Lcom/streambundle/v48/PlaybackGuard$State;->subtitles:Lkotlin/jvm/functions/Function1;

    aput-object v4, v3, v8

    aput-object v0, v3, v9

    aput-object p0, v3, v10

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 82
    nop

    .line 85
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_6a

    invoke-virtual {p0, v0}, Lcom/streambundle/v48/PlaybackGuard$State;->resumeWith(Ljava/lang/Object;)V
    :try_end_53
    .catchall {:try_start_0 .. :try_end_53} :catchall_54

    .line 86
    goto :goto_6a

    :catchall_54
    move-exception v0

    .line 87
    instance-of v1, v0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_63

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_63

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 88
    :cond_63
    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundle/v48/PlaybackGuard$State;->resumeWith(Ljava/lang/Object;)V

    .line 90
    :cond_6a
    :goto_6a
    return-void
.end method

.method private declared-synchronized processed()V
    .registers 2

    monitor-enter p0

    .line 150
    :try_start_1
    iget v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->pending:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->pending:I

    .line 151
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->done:Z

    if-nez v0, :cond_e

    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->checkDone()V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 152
    :cond_e
    monitor-exit p0

    return-void

    .line 149
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized startBackup()V
    .registers 3

    monitor-enter p0

    .line 110
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->done:Z

    if-nez v0, :cond_26

    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backupStarted:Z

    if-nez v0, :cond_26

    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->emitted:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_12

    goto :goto_26

    .line 111
    :cond_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backupStarted:Z

    .line 112
    # getter for: Lcom/streambundle/v48/PlaybackGuard;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/streambundle/v48/PlaybackGuard;->access$1()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda0;-><init>(Lcom/streambundle/v48/PlaybackGuard$State;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->backup:Ljava/util/concurrent/Future;
    :try_end_24
    .catchall {:try_start_1 .. :try_end_24} :catchall_28

    .line 121
    monitor-exit p0

    return-void

    .line 110
    :cond_26
    :goto_26
    monitor-exit p0

    return-void

    .line 109
    :catchall_28
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 92
    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$4$com-streambundle-v48-PlaybackGuard$State()V
    .registers 4

    .line 113
    nop

    .line 115
    :try_start_1
    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->name:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->data:Ljava/lang/String;

    new-instance v2, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda1;-><init>(Lcom/streambundle/v48/PlaybackGuard$State;)V

    invoke-static {v0, v1, v2}, Lcom/streambundle/v48/PlaybackFallback;->resolve(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 116
    const/4 v0, 0x0

    goto :goto_11

    :catchall_f
    move-exception v0

    .line 117
    nop

    .line 119
    :goto_11
    invoke-direct {p0, v0}, Lcom/streambundle/v48/PlaybackGuard$State;->backupFinished(Ljava/lang/Throwable;)V

    .line 120
    return-void
.end method

.method synthetic lambda$6$com-streambundle-v48-PlaybackGuard$State(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)V
    .registers 3

    .line 137
    :try_start_0
    invoke-static {p1}, Lcom/streambundle/v48/PlaybackLinks;->normalize(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_1d

    if-nez v0, :cond_13

    .line 138
    nop

    .line 139
    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->processed()V

    .line 141
    return-void

    .line 137
    :cond_13
    :try_start_13
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-direct {p0, v0}, Lcom/streambundle/v48/PlaybackGuard$State;->emit(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)V
    :try_end_1c
    .catchall {:try_start_13 .. :try_end_1c} :catchall_1d

    goto :goto_8

    .line 138
    :catchall_1d
    move-exception p1

    .line 139
    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->processed()V

    .line 140
    throw p1
.end method

.method public declared-synchronized resumeWith(Ljava/lang/Object;)V
    .registers 3

    monitor-enter p0

    .line 96
    :try_start_1
    iget-boolean v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->done:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1c

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 98
    :cond_7
    :try_start_7
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/util/concurrent/CancellationException; {:try_start_7 .. :try_end_a} :catch_16
    .catchall {:try_start_7 .. :try_end_a} :catchall_b

    .line 99
    goto :goto_e

    .line 102
    :catchall_b
    move-exception p1

    .line 103
    :try_start_c
    iput-object p1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->error:Ljava/lang/Throwable;

    .line 105
    :goto_e
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/streambundle/v48/PlaybackGuard$State;->originalDone:Z

    .line 106
    invoke-direct {p0}, Lcom/streambundle/v48/PlaybackGuard$State;->checkDone()V
    :try_end_14
    .catchall {:try_start_c .. :try_end_14} :catchall_1c

    .line 107
    monitor-exit p0

    return-void

    .line 99
    :catch_16
    move-exception v0

    .line 100
    :try_start_17
    invoke-direct {p0, p1}, Lcom/streambundle/v48/PlaybackGuard$State;->finish(Ljava/lang/Object;)V
    :try_end_1a
    .catchall {:try_start_17 .. :try_end_1a} :catchall_1c

    .line 101
    monitor-exit p0

    return-void

    .line 95
    :catchall_1c
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method start()V
    .registers 6

    .line 74
    # getter for: Lcom/streambundle/v48/PlaybackGuard;->TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    invoke-static {}, Lcom/streambundle/v48/PlaybackGuard;->access$0()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    new-instance v1, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda2;-><init>(Lcom/streambundle/v48/PlaybackGuard$State;)V

    const-wide/16 v2, 0x16

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->deadline:Ljava/util/concurrent/ScheduledFuture;

    .line 75
    # getter for: Lcom/streambundle/v48/PlaybackGuard;->TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    invoke-static {}, Lcom/streambundle/v48/PlaybackGuard;->access$0()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    new-instance v1, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda3;-><init>(Lcom/streambundle/v48/PlaybackGuard$State;)V

    const-wide/16 v2, 0x578

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State;->delay:Ljava/util/concurrent/ScheduledFuture;

    .line 76
    # getter for: Lcom/streambundle/v48/PlaybackGuard;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/streambundle/v48/PlaybackGuard;->access$1()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda4;-><init>(Lcom/streambundle/v48/PlaybackGuard$State;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 77
    return-void
.end method
