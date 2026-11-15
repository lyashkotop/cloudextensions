.class public final synthetic Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lkotlin/jvm/functions/Function1;

.field public final synthetic f$1:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda2;->f$0:Lkotlin/jvm/functions/Function1;

    iput-object p2, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda2;->f$1:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda2;->f$0:Lkotlin/jvm/functions/Function1;

    iget-object v1, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda2;->f$1:Ljava/util/concurrent/atomic/AtomicBoolean;

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-static {v0, v1, p1}, Lcom/streambundle/v38/FastHurt;->lambda$2(Lkotlin/jvm/functions/Function1;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
