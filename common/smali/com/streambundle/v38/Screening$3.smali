.class Lcom/streambundle/v38/Screening$3;
.super Ljava/lang/Object;
.source "Screening.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/Screening;->inspect(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/CoroutineContext;J)V
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
.field private final synthetic val$completed:Ljava/util/concurrent/CountDownLatch;

.field private final synthetic val$probe:Lkotlin/coroutines/CoroutineContext;

.field private final synthetic val$reply:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Lkotlin/coroutines/CoroutineContext;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V
    .registers 4

    .line 211
    iput-object p1, p0, Lcom/streambundle/v38/Screening$3;->val$probe:Lkotlin/coroutines/CoroutineContext;

    iput-object p2, p0, Lcom/streambundle/v38/Screening$3;->val$reply:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p3, p0, Lcom/streambundle/v38/Screening$3;->val$completed:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 212
    iget-object v0, p0, Lcom/streambundle/v38/Screening$3;->val$probe:Lkotlin/coroutines/CoroutineContext;

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 213
    iget-object v0, p0, Lcom/streambundle/v38/Screening$3;->val$reply:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/streambundle/v38/Screening$3;->val$completed:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
