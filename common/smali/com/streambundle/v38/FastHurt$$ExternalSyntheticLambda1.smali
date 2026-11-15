.class public final synthetic Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lkotlin/jvm/functions/Function1;

.field public final synthetic f$3:Lkotlin/coroutines/SafeContinuation;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/SafeContinuation;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;->f$2:Lkotlin/jvm/functions/Function1;

    iput-object p4, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;->f$3:Lkotlin/coroutines/SafeContinuation;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;->f$2:Lkotlin/jvm/functions/Function1;

    iget-object v3, p0, Lcom/streambundle/v38/FastHurt$$ExternalSyntheticLambda1;->f$3:Lkotlin/coroutines/SafeContinuation;

    invoke-static {v0, v1, v2, v3}, Lcom/streambundle/v38/FastHurt;->lambda$1(Ljava/lang/Object;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/SafeContinuation;)V

    return-void
.end method
