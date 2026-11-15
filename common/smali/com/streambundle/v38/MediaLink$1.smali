.class Lcom/streambundle/v38/MediaLink$1;
.super Ljava/lang/Object;
.source "MediaLink.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/MediaLink;->emit(Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/util/Map;)V
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


# direct methods
.method constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .registers 2

    .line 18
    iput-object p1, p0, Lcom/streambundle/v38/MediaLink$1;->val$callback:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 19
    sget-object v0, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    .line 21
    instance-of v0, p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/streambundle/v38/MediaLink$1;->val$callback:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    :cond_b
    return-void
.end method
