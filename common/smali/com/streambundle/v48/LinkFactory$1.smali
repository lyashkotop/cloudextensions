.class Lcom/streambundle/v48/LinkFactory$1;
.super Ljava/lang/Object;
.source "LinkFactory.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v48/LinkFactory;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/util/Map;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;
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
.field private final synthetic val$completed:[Ljava/lang/Object;

.field private final synthetic val$done:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>([Ljava/lang/Object;Ljava/util/concurrent/CountDownLatch;)V
    .registers 3

    .line 19
    iput-object p1, p0, Lcom/streambundle/v48/LinkFactory$1;->val$completed:[Ljava/lang/Object;

    iput-object p2, p0, Lcom/streambundle/v48/LinkFactory$1;->val$done:Ljava/util/concurrent/CountDownLatch;

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
    .registers 4

    .line 19
    iget-object v0, p0, Lcom/streambundle/v48/LinkFactory$1;->val$completed:[Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iget-object p1, p0, Lcom/streambundle/v48/LinkFactory$1;->val$done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
