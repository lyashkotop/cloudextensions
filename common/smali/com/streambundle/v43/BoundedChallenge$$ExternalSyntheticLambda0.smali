.class public final synthetic Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lokhttp3/Interceptor;

.field public final synthetic f$1:Lokhttp3/Interceptor$Chain;

.field public final synthetic f$2:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public synthetic constructor <init>(Lokhttp3/Interceptor;Lokhttp3/Interceptor$Chain;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;->f$0:Lokhttp3/Interceptor;

    iput-object p2, p0, Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;->f$1:Lokhttp3/Interceptor$Chain;

    iput-object p3, p0, Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;->f$2:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;->f$0:Lokhttp3/Interceptor;

    iget-object v1, p0, Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;->f$1:Lokhttp3/Interceptor$Chain;

    iget-object v2, p0, Lcom/streambundle/v43/BoundedChallenge$$ExternalSyntheticLambda0;->f$2:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {v0, v1, v2}, Lcom/streambundle/v43/BoundedChallenge;->lambda$0(Lokhttp3/Interceptor;Lokhttp3/Interceptor$Chain;Ljava/util/concurrent/atomic/AtomicBoolean;)Lokhttp3/Response;

    move-result-object v0

    return-object v0
.end method
