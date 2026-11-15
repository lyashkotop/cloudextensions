.class public final synthetic Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/util/Map$Entry;

.field public final synthetic f$2:Lkotlin/coroutines/CoroutineContext;

.field public final synthetic f$3:J


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/util/Map$Entry;Lkotlin/coroutines/CoroutineContext;J)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;->f$1:Ljava/util/Map$Entry;

    iput-object p3, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;->f$2:Lkotlin/coroutines/CoroutineContext;

    iput-wide p4, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;->f$3:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .registers 6

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;->f$1:Ljava/util/Map$Entry;

    iget-object v2, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;->f$2:Lkotlin/coroutines/CoroutineContext;

    iget-wide v3, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda0;->f$3:J

    invoke-static {v0, v1, v2, v3, v4}, Lcom/streambundle/v38/Screening;->lambda$5(Ljava/lang/Object;Ljava/util/Map$Entry;Lkotlin/coroutines/CoroutineContext;J)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
