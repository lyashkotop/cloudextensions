.class final Lcom/lagradost/AdultVideoProvider$searchAt$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "AdultProviders.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/AdultVideoProvider;->searchAt(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.lagradost.AdultVideoProvider"
    f = "AdultProviders.kt"
    i = {
        0x0
    }
    l = {
        0x1a
    }
    m = "searchAt"
    n = {
        "url"
    }
    nl = {
        0x1b
    }
    s = {
        "L$0"
    }
    v = 0x2
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/lagradost/AdultVideoProvider;


# direct methods
.method constructor <init>(Lcom/lagradost/AdultVideoProvider;Lkotlin/coroutines/Continuation;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/AdultVideoProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/AdultVideoProvider$searchAt$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lagradost/AdultVideoProvider$searchAt$1;->this$0:Lcom/lagradost/AdultVideoProvider;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    iput-object p1, p0, Lcom/lagradost/AdultVideoProvider$searchAt$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/lagradost/AdultVideoProvider$searchAt$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/lagradost/AdultVideoProvider$searchAt$1;->label:I

    iget-object v0, p0, Lcom/lagradost/AdultVideoProvider$searchAt$1;->this$0:Lcom/lagradost/AdultVideoProvider;

    const/4 v1, 0x0

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    invoke-virtual {v0, v1, v2}, Lcom/lagradost/AdultVideoProvider;->searchAt(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
