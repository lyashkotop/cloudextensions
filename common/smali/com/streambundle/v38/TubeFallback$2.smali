.class Lcom/streambundle/v38/TubeFallback$2;
.super Ljava/lang/Object;
.source "TubeFallback.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/TubeFallback;->emit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/CoroutineContext;)V
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
.field private final synthetic val$callback:Lkotlin/jvm/functions/Function1;

.field private final synthetic val$context:Lkotlin/coroutines/CoroutineContext;


# direct methods
.method constructor <init>(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function1;)V
    .registers 3

    .line 125
    iput-object p1, p0, Lcom/streambundle/v38/TubeFallback$2;->val$context:Lkotlin/coroutines/CoroutineContext;

    iput-object p2, p0, Lcom/streambundle/v38/TubeFallback$2;->val$callback:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 126
    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$2;->val$context:Lkotlin/coroutines/CoroutineContext;

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 128
    instance-of v0, p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$2;->val$callback:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    :cond_b
    return-void
.end method
