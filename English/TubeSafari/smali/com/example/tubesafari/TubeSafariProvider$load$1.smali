.class final Lcom/example/tubesafari/TubeSafariProvider$load$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "TubeSafariProvider.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/tubesafari/TubeSafariProvider;->detailUnscreened(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
    c = "com.example.tubesafari.TubeSafariProvider"
    f = "TubeSafariProvider.kt"
    i = {
        0x0
    }
    l = {
        0x4e,
        0x52
    }
    m = "load"
    n = {
        "url"
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

.field final synthetic this$0:Lcom/example/tubesafari/TubeSafariProvider;


# direct methods
.method constructor <init>(Lcom/example/tubesafari/TubeSafariProvider;Lkotlin/coroutines/Continuation;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/tubesafari/TubeSafariProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/tubesafari/TubeSafariProvider$load$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/tubesafari/TubeSafariProvider$load$1;->this$0:Lcom/example/tubesafari/TubeSafariProvider;

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

    iput-object p1, p0, Lcom/example/tubesafari/TubeSafariProvider$load$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/example/tubesafari/TubeSafariProvider$load$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/example/tubesafari/TubeSafariProvider$load$1;->label:I

    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariProvider$load$1;->this$0:Lcom/example/tubesafari/TubeSafariProvider;

    const/4 v1, 0x0

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    invoke-virtual {v0, v1, v2}, Lcom/example/tubesafari/TubeSafariProvider;->detailUnscreened(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
