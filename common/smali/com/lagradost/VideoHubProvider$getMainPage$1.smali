.class final Lcom/lagradost/VideoHubProvider$getMainPage$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "VideoHub.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/VideoHubProvider;->homeUnscreened(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        0x0
    }
    l = {
        0x55
    }
    m = "getMainPage"
    n = {
        "request",
        "url",
        "page"
    }
    nl = {
        0x56
    }
    s = {
        "L$0",
        "L$1",
        "I$0"
    }
    v = 0x2
.end annotation


# instance fields
.field I$0:I

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/lagradost/VideoHubProvider;


# direct methods
.method constructor <init>(Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/VideoHubProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/VideoHubProvider$getMainPage$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider$getMainPage$1;->this$0:Lcom/lagradost/VideoHubProvider;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider$getMainPage$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/lagradost/VideoHubProvider$getMainPage$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/lagradost/VideoHubProvider$getMainPage$1;->label:I

    iget-object v0, p0, Lcom/lagradost/VideoHubProvider$getMainPage$1;->this$0:Lcom/lagradost/VideoHubProvider;

    move-object v1, p0

    check-cast v1, Lkotlin/coroutines/Continuation;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/lagradost/VideoHubProvider;->homeUnscreened(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
