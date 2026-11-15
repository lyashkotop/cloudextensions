.class final Lcom/lagradost/AdultVideoProvider$loadLinks$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "AdultProviders.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/AdultVideoProvider;->loadLinks$suspendImpl(Lcom/lagradost/AdultVideoProvider;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        0x0,
        0x0,
        0x0,
        0x0,
        0x0,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3
    }
    l = {
        0x3e,
        0x4b,
        0x4f,
        0x58
    }
    m = "loadLinks$suspendImpl"
    n = {
        "$this",
        "data",
        "subtitleCallback",
        "callback",
        "isCasting",
        "$this",
        "data",
        "subtitleCallback",
        "callback",
        "doc",
        "candidates",
        "html",
        "mediaRegex",
        "media",
        "isCasting",
        "$this",
        "data",
        "subtitleCallback",
        "callback",
        "doc",
        "candidates",
        "html",
        "mediaRegex",
        "media",
        "isCasting",
        "$this",
        "data",
        "subtitleCallback",
        "callback",
        "doc",
        "candidates",
        "html",
        "mediaRegex",
        "$this$forEach$iv",
        "element$iv",
        "frame",
        "src",
        "isCasting",
        "$i$f$forEach",
        "$i$a$-forEach-AdultVideoProvider$loadLinks$5"
    }
    nl = {
        0x3f,
        0x4d,
        0x56,
        0x59
    }
    s = {
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "Z$0",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$9",
        "Z$0",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$9",
        "Z$0",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$8",
        "L$10",
        "L$11",
        "L$12",
        "Z$0",
        "I$0",
        "I$1"
    }
    v = 0x2
.end annotation


# instance fields
.field I$0:I

.field I$1:I

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$10:Ljava/lang/Object;

.field L$11:Ljava/lang/Object;

.field L$12:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field L$5:Ljava/lang/Object;

.field L$6:Ljava/lang/Object;

.field L$7:Ljava/lang/Object;

.field L$8:Ljava/lang/Object;

.field L$9:Ljava/lang/Object;

.field Z$0:Z

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
            "Lcom/lagradost/AdultVideoProvider$loadLinks$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lagradost/AdultVideoProvider$loadLinks$1;->this$0:Lcom/lagradost/AdultVideoProvider;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    iput-object p1, p0, Lcom/lagradost/AdultVideoProvider$loadLinks$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/lagradost/AdultVideoProvider$loadLinks$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/lagradost/AdultVideoProvider$loadLinks$1;->label:I

    iget-object v1, p0, Lcom/lagradost/AdultVideoProvider$loadLinks$1;->this$0:Lcom/lagradost/AdultVideoProvider;

    const/4 v5, 0x0

    move-object v6, p0

    check-cast v6, Lkotlin/coroutines/Continuation;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lcom/lagradost/AdultVideoProvider;->loadLinks$suspendImpl(Lcom/lagradost/AdultVideoProvider;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
