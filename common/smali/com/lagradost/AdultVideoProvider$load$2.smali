.class final Lcom/lagradost/AdultVideoProvider$load$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "AdultProviders.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/AdultVideoProvider;->load$suspendImpl(Lcom/lagradost/AdultVideoProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lcom/lagradost/cloudstream3/MovieLoadResponse;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAdultProviders.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AdultProviders.kt\ncom/lagradost/AdultVideoProvider$load$2\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,172:1\n1#2:173\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lcom/lagradost/cloudstream3/MovieLoadResponse;"
    }
    k = 0x3
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.lagradost.AdultVideoProvider$load$2"
    f = "AdultProviders.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    nl = {}
    s = {}
    v = 0x2
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
    value = {
        "SMAP\nAdultProviders.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AdultProviders.kt\ncom/lagradost/AdultVideoProvider$load$2\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,172:1\n1#2:173\n*E\n"
    }
.end annotation


# instance fields
.field final synthetic $description:Ljava/lang/String;

.field final synthetic $image:Ljava/lang/String;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/lagradost/AdultVideoProvider;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/lagradost/AdultVideoProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/lagradost/AdultVideoProvider;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/AdultVideoProvider$load$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lagradost/AdultVideoProvider$load$2;->$image:Ljava/lang/String;

    iput-object p2, p0, Lcom/lagradost/AdultVideoProvider$load$2;->this$0:Lcom/lagradost/AdultVideoProvider;

    iput-object p3, p0, Lcom/lagradost/AdultVideoProvider$load$2;->$description:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/lagradost/AdultVideoProvider$load$2;

    iget-object v1, p0, Lcom/lagradost/AdultVideoProvider$load$2;->$image:Ljava/lang/String;

    iget-object v2, p0, Lcom/lagradost/AdultVideoProvider$load$2;->this$0:Lcom/lagradost/AdultVideoProvider;

    iget-object v3, p0, Lcom/lagradost/AdultVideoProvider$load$2;->$description:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/lagradost/AdultVideoProvider$load$2;-><init>(Ljava/lang/String;Lcom/lagradost/AdultVideoProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/lagradost/AdultVideoProvider$load$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public final invoke(Lcom/lagradost/cloudstream3/MovieLoadResponse;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MovieLoadResponse;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/AdultVideoProvider$load$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/lagradost/AdultVideoProvider$load$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/lagradost/AdultVideoProvider$load$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/lagradost/AdultVideoProvider$load$2;->invoke(Lcom/lagradost/cloudstream3/MovieLoadResponse;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "$result"    # Ljava/lang/Object;

    iget-object v0, p0, Lcom/lagradost/AdultVideoProvider$load$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/cloudstream3/MovieLoadResponse;

    .local v0, "$this$newMovieLoadResponse":Lcom/lagradost/cloudstream3/MovieLoadResponse;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 50
    iget v1, p0, Lcom/lagradost/AdultVideoProvider$load$2;->label:I

    packed-switch v1, :pswitch_data_32

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_14
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 51
    iget-object v1, p0, Lcom/lagradost/AdultVideoProvider$load$2;->$image:Ljava/lang/String;

    if-eqz v1, :cond_26

    iget-object v2, p0, Lcom/lagradost/AdultVideoProvider$load$2;->this$0:Lcom/lagradost/AdultVideoProvider;

    .line 173
    nop

    .local v1, "p0":Ljava/lang/String;
    const/4 v3, 0x0

    .line 51
    .local v3, "$i$a$-let-AdultVideoProvider$load$2$1":I
    check-cast v2, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-static {v2, v1}, Lcom/lagradost/cloudstream3/MainAPIKt;->fixUrl(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .end local v1    # "p0":Ljava/lang/String;
    .end local v3    # "$i$a$-let-AdultVideoProvider$load$2$1":I
    goto :goto_27

    :cond_26
    const/4 v1, 0x0

    :goto_27
    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 52
    iget-object v1, p0, Lcom/lagradost/AdultVideoProvider$load$2;->$description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPlot(Ljava/lang/String;)V

    .line 53
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
