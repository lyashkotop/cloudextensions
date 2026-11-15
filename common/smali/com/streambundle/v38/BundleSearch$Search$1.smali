.class Lcom/streambundle/v38/BundleSearch$Search$1;
.super Ljava/lang/Object;
.source "BundleSearch.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/BundleSearch$Search;->start(Ljava/lang/String;I)V
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
.field final synthetic this$1:Lcom/streambundle/v38/BundleSearch$Search;

.field private final synthetic val$index:I

.field private final synthetic val$once:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Lcom/streambundle/v38/BundleSearch$Search;Ljava/util/concurrent/atomic/AtomicBoolean;I)V
    .registers 4

    .line 85
    iput-object p1, p0, Lcom/streambundle/v38/BundleSearch$Search$1;->this$1:Lcom/streambundle/v38/BundleSearch$Search;

    iput-object p2, p0, Lcom/streambundle/v38/BundleSearch$Search$1;->val$once:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput p3, p0, Lcom/streambundle/v38/BundleSearch$Search$1;->val$index:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 86
    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search$1;->this$1:Lcom/streambundle/v38/BundleSearch$Search;

    # getter for: Lcom/streambundle/v38/BundleSearch$Search;->completion:Lkotlin/coroutines/Continuation;
    invoke-static {v0}, Lcom/streambundle/v38/BundleSearch$Search;->access$0(Lcom/streambundle/v38/BundleSearch$Search;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 5

    .line 88
    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search$1;->val$once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$Search$1;->this$1:Lcom/streambundle/v38/BundleSearch$Search;

    iget v1, p0, Lcom/streambundle/v38/BundleSearch$Search$1;->val$index:I

    invoke-virtual {v0, v1, p1}, Lcom/streambundle/v38/BundleSearch$Search;->complete(ILjava/lang/Object;)V

    .line 89
    :cond_11
    return-void
.end method
