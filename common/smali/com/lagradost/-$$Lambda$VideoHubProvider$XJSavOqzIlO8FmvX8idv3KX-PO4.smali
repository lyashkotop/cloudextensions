.class public final synthetic Lcom/lagradost/-$$Lambda$VideoHubProvider$XJSavOqzIlO8FmvX8idv3KX-PO4;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/util/HashSet;

.field public final synthetic f$1:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$XJSavOqzIlO8FmvX8idv3KX-PO4;->f$0:Ljava/util/HashSet;

    iput-object p2, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$XJSavOqzIlO8FmvX8idv3KX-PO4;->f$1:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$XJSavOqzIlO8FmvX8idv3KX-PO4;->f$0:Ljava/util/HashSet;

    iget-object v1, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$XJSavOqzIlO8FmvX8idv3KX-PO4;->f$1:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-static {v0, v1, p1}, Lcom/lagradost/VideoHubProvider;->lambda$XJSavOqzIlO8FmvX8idv3KX-PO4(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
