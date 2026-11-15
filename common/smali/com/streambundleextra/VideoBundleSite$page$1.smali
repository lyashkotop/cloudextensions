.class final Lcom/streambundleextra/VideoBundleSite$page$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "VideoBundleSites.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundleextra/VideoBundleSite;->page(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.streambundleextra.VideoBundleSite"
    f = "VideoBundleSites.kt"
    i = {
        0x0
    }
    l = {
        0x24
    }
    m = "page"
    n = {
        "path"
    }
    s = {
        "L$0"
    }
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/streambundleextra/VideoBundleSite;


# direct methods
.method constructor <init>(Lcom/streambundleextra/VideoBundleSite;Lkotlin/coroutines/Continuation;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundleextra/VideoBundleSite;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/streambundleextra/VideoBundleSite$page$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/streambundleextra/VideoBundleSite$page$1;->this$0:Lcom/streambundleextra/VideoBundleSite;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iput-object p1, p0, Lcom/streambundleextra/VideoBundleSite$page$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/streambundleextra/VideoBundleSite$page$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/streambundleextra/VideoBundleSite$page$1;->label:I

    iget-object v0, p0, Lcom/streambundleextra/VideoBundleSite$page$1;->this$0:Lcom/streambundleextra/VideoBundleSite;

    const/4 v1, 0x0

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    # invokes: Lcom/streambundleextra/VideoBundleSite;->page(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    invoke-static {v0, v1, v2}, Lcom/streambundleextra/VideoBundleSite;->access$page(Lcom/streambundleextra/VideoBundleSite;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
