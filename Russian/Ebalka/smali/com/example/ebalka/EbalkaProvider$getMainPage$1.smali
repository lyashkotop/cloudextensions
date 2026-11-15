.class final Lcom/example/ebalka/EbalkaProvider$getMainPage$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "EbalkaProvider.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/ebalka/EbalkaProvider;->homeUnscreened(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.example.ebalka.EbalkaProvider"
    f = "EbalkaProvider.kt"
    i = {
        0x0
    }
    l = {
        0x45
    }
    m = "getMainPage"
    n = {
        "request"
    }
    s = {
        "L$0"
    }
    v = 0x1
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/example/ebalka/EbalkaProvider;


# direct methods
.method constructor <init>(Lcom/example/ebalka/EbalkaProvider;Lkotlin/coroutines/Continuation;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/ebalka/EbalkaProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/ebalka/EbalkaProvider$getMainPage$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/ebalka/EbalkaProvider$getMainPage$1;->this$0:Lcom/example/ebalka/EbalkaProvider;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    iput-object p1, p0, Lcom/example/ebalka/EbalkaProvider$getMainPage$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/example/ebalka/EbalkaProvider$getMainPage$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/example/ebalka/EbalkaProvider$getMainPage$1;->label:I

    iget-object v0, p0, Lcom/example/ebalka/EbalkaProvider$getMainPage$1;->this$0:Lcom/example/ebalka/EbalkaProvider;

    const/4 v1, 0x0

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1, v2}, Lcom/example/ebalka/EbalkaProvider;->homeUnscreened(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
