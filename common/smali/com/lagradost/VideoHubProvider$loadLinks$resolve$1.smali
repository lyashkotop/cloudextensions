.class final Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "VideoHub.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/VideoHubProvider;->loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.lagradost.VideoHubProvider"
    f = "VideoHub.kt"
    i = {
        0x0,
        0x0,
        0x0,
        0x0,
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
        0x4,
        0x4,
        0x4,
        0x4,
        0x4,
        0x4,
        0x4,
        0x4,
        0x4,
        0x4,
        0x4,
        0x4,
        0x5,
        0x5,
        0x5,
        0x5,
        0x5,
        0x5,
        0x5,
        0x5,
        0x5,
        0x5,
        0x5,
        0x5
    }
    l = {
        0xd6,
        0xd8,
        0xdd,
        0xe1,
        0xe7,
        0xe8
    }
    m = "loadLinks$resolve"
    n = {
        "visited",
        "this$0",
        "$subtitleCallback",
        "wrapped",
        "emitted",
        "url",
        "ref",
        "extracted",
        "depth",
        "visited",
        "this$0",
        "$subtitleCallback",
        "wrapped",
        "emitted",
        "url",
        "ref",
        "extracted",
        "link",
        "depth",
        "visited",
        "this$0",
        "$subtitleCallback",
        "wrapped",
        "emitted",
        "url",
        "ref",
        "depth",
        "visited",
        "this$0",
        "$subtitleCallback",
        "wrapped",
        "emitted",
        "url",
        "ref",
        "doc",
        "unpacked",
        "media",
        "depth",
        "visited",
        "this$0",
        "$subtitleCallback",
        "wrapped",
        "emitted",
        "url",
        "ref",
        "doc",
        "unpacked",
        "embed",
        "original",
        "depth",
        "visited",
        "this$0",
        "$subtitleCallback",
        "wrapped",
        "emitted",
        "url",
        "ref",
        "doc",
        "unpacked",
        "embed",
        "original",
        "depth"
    }
    nl = {
        0xd7,
        0xd9,
        0xde,
        0xe2,
        0xe8,
        0xe9
    }
    s = {
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "I$0",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$9",
        "I$0",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "I$0",
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
        "I$0",
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
        "I$0",
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
        "I$0"
    }
    v = 0x2
.end annotation


# instance fields
.field I$0:I

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$10:Ljava/lang/Object;

.field L$11:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field L$5:Ljava/lang/Object;

.field L$6:Ljava/lang/Object;

.field L$7:Ljava/lang/Object;

.field L$8:Ljava/lang/Object;

.field L$9:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lkotlin/coroutines/Continuation;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    move-object v9, p0

    check-cast v9, Lkotlin/coroutines/Continuation;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    # invokes: Lcom/lagradost/VideoHubProvider;->loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static/range {v1 .. v9}, Lcom/lagradost/VideoHubProvider;->access$loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
