.class Lcom/streambundle/v38/PunishSearch$1;
.super Ljava/lang/Object;
.source "PunishSearch.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/PunishSearch;->run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
.field private final synthetic val$base:Ljava/lang/String;

.field private final synthetic val$end:Lkotlin/coroutines/Continuation;

.field private final synthetic val$provider:Ljava/lang/Object;

.field private final synthetic val$query:Ljava/lang/String;

.field private final synthetic val$safe:Lkotlin/coroutines/SafeContinuation;


# direct methods
.method constructor <init>(Lkotlin/coroutines/Continuation;Lkotlin/coroutines/SafeContinuation;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 36
    iput-object p1, p0, Lcom/streambundle/v38/PunishSearch$1;->val$end:Lkotlin/coroutines/Continuation;

    iput-object p2, p0, Lcom/streambundle/v38/PunishSearch$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    iput-object p3, p0, Lcom/streambundle/v38/PunishSearch$1;->val$provider:Ljava/lang/Object;

    iput-object p4, p0, Lcom/streambundle/v38/PunishSearch$1;->val$base:Ljava/lang/String;

    iput-object p5, p0, Lcom/streambundle/v38/PunishSearch$1;->val$query:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/SafeContinuation;)V
    .registers 5

    .line 45
    nop

    .line 46
    :try_start_1
    check-cast p1, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    # invokes: Lcom/streambundle/v38/PunishSearch;->fallback(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    invoke-static {p1, p2, p3}, Lcom/streambundle/v38/PunishSearch;->access$1(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_e
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_b} :catch_c

    goto :goto_f

    .line 47
    :catch_c
    move-exception p1

    goto :goto_f

    :catch_e
    move-exception p1

    .line 48
    :goto_f
    invoke-virtual {p4, p0}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 49
    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 37
    iget-object v0, p0, Lcom/streambundle/v38/PunishSearch$1;->val$end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 10

    .line 39
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_2c

    move-object v0, p1

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_e

    goto :goto_2c

    .line 44
    :cond_e
    :try_start_e
    # getter for: Lcom/streambundle/v38/PunishSearch;->IO:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/streambundle/v38/PunishSearch;->access$0()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iget-object v3, p0, Lcom/streambundle/v38/PunishSearch$1;->val$provider:Ljava/lang/Object;

    iget-object v4, p0, Lcom/streambundle/v38/PunishSearch$1;->val$base:Ljava/lang/String;

    iget-object v5, p0, Lcom/streambundle/v38/PunishSearch$1;->val$query:Ljava/lang/String;

    iget-object v6, p0, Lcom/streambundle/v38/PunishSearch$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    new-instance v7, Lcom/streambundle/v38/PunishSearch$1$$ExternalSyntheticLambda0;

    move-object v1, v7

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/streambundle/v38/PunishSearch$1$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/SafeContinuation;)V

    invoke-interface {v0, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_24
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_e .. :try_end_24} :catch_25

    .line 50
    goto :goto_2b

    :catch_25
    move-exception v0

    iget-object v0, p0, Lcom/streambundle/v38/PunishSearch$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 51
    :goto_2b
    return-void

    .line 40
    :cond_2c
    :goto_2c
    iget-object v0, p0, Lcom/streambundle/v38/PunishSearch$1;->val$safe:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {v0, p1}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    .line 41
    return-void
.end method
