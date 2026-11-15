.class Lcom/streambundle/v38/QuickSearch$State$1;
.super Ljava/lang/Object;
.source "QuickSearch.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/QuickSearch$State;->begin(Ljava/lang/String;)V
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
.field final synthetic this$1:Lcom/streambundle/v38/QuickSearch$State;


# direct methods
.method constructor <init>(Lcom/streambundle/v38/QuickSearch$State;)V
    .registers 2

    .line 80
    iput-object p1, p0, Lcom/streambundle/v38/QuickSearch$State$1;->this$1:Lcom/streambundle/v38/QuickSearch$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 81
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State$1;->this$1:Lcom/streambundle/v38/QuickSearch$State;

    iget-object v0, v0, Lcom/streambundle/v38/QuickSearch$State;->end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 83
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$State$1;->this$1:Lcom/streambundle/v38/QuickSearch$State;

    check-cast p1, Ljava/util/List;

    invoke-virtual {v0, p1}, Lcom/streambundle/v38/QuickSearch$State;->complete(Ljava/util/List;)V

    goto :goto_15

    .line 84
    :cond_c
    iget-object p1, p0, Lcom/streambundle/v38/QuickSearch$State$1;->this$1:Lcom/streambundle/v38/QuickSearch$State;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/streambundle/v38/QuickSearch$State;->complete(Ljava/util/List;)V

    .line 85
    :goto_15
    return-void
.end method
