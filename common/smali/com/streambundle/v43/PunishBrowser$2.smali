.class Lcom/streambundle/v43/PunishBrowser$2;
.super Ljava/lang/Object;
.source "PunishBrowser.java"

# interfaces
.implements Lkotlin/coroutines/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v43/PunishBrowser;->intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
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
.field final synthetic this$0:Lcom/streambundle/v43/PunishBrowser;

.field private final synthetic val$done:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lcom/streambundle/v43/PunishBrowser;Ljava/util/concurrent/CountDownLatch;)V
    .registers 3

    .line 60
    iput-object p1, p0, Lcom/streambundle/v43/PunishBrowser$2;->this$0:Lcom/streambundle/v43/PunishBrowser;

    iput-object p2, p0, Lcom/streambundle/v43/PunishBrowser$2;->val$done:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 2

    .line 61
    sget-object v0, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    return-object v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 2

    .line 62
    iget-object p1, p0, Lcom/streambundle/v43/PunishBrowser$2;->val$done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
