.class public final synthetic Lcom/lagradost/-$$Lambda$VideoHubProvider$vWnICdE1cb6sxv-HRebRESl_3PA;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$vWnICdE1cb6sxv-HRebRESl_3PA;->f$0:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$vWnICdE1cb6sxv-HRebRESl_3PA;->f$0:Ljava/util/ArrayList;

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-static {v0, p1}, Lcom/lagradost/VideoHubProvider;->lambda$vWnICdE1cb6sxv-HRebRESl_3PA(Ljava/util/ArrayList;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
