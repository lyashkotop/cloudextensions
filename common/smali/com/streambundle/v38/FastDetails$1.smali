.class Lcom/streambundle/v38/FastDetails$1;
.super Ljava/lang/Object;
.source "FastDetails.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/FastDetails;->open(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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

.field private final synthetic val$provider:Ljava/lang/Object;

.field private final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lkotlin/coroutines/Continuation;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    .line 15
    iput-object p1, p0, Lcom/streambundle/v38/FastDetails$1;->val$completion:Lkotlin/coroutines/Continuation;

    iput-object p2, p0, Lcom/streambundle/v38/FastDetails$1;->val$provider:Ljava/lang/Object;

    iput-object p3, p0, Lcom/streambundle/v38/FastDetails$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 17
    iget-object v0, p0, Lcom/streambundle/v38/FastDetails$1;->val$completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 4

    .line 21
    iget-object v0, p0, Lcom/streambundle/v38/FastDetails$1;->val$provider:Ljava/lang/Object;

    iget-object v1, p0, Lcom/streambundle/v38/FastDetails$1;->val$url:Ljava/lang/String;

    # invokes: Lcom/streambundle/v38/FastDetails;->enrich(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v0, v1, p1}, Lcom/streambundle/v38/FastDetails;->access$0(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    iget-object v0, p0, Lcom/streambundle/v38/FastDetails$1;->val$completion:Lkotlin/coroutines/Continuation;

    invoke-interface {v0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 23
    return-void
.end method
