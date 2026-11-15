.class Lcom/streambundle/v38/BundleSearch$1;
.super Ljava/lang/Object;
.source "BundleSearch.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/BundleSearch;->primaryOnly(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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


# direct methods
.method constructor <init>(Lkotlin/coroutines/Continuation;)V
    .registers 2

    .line 57
    iput-object p1, p0, Lcom/streambundle/v38/BundleSearch$1;->val$completion:Lkotlin/coroutines/Continuation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 58
    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$1;->val$completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 59
    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$1;->val$completion:Lkotlin/coroutines/Continuation;

    # invokes: Lcom/streambundle/v38/BundleSearch;->filtered(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {p1}, Lcom/streambundle/v38/BundleSearch;->access$2(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method
