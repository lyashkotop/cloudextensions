.class public final synthetic Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/util/Set;

.field public final synthetic f$1:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Lkotlin/jvm/functions/Function1;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda1;->f$0:Ljava/util/Set;

    iput-object p2, p0, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda1;->f$1:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda1;->f$0:Ljava/util/Set;

    iget-object v1, p0, Lcom/streambundle/v38/TubeFallback$$ExternalSyntheticLambda1;->f$1:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-static {v0, v1, p1}, Lcom/streambundle/v38/TubeFallback;->lambda$1(Ljava/util/Set;Lkotlin/jvm/functions/Function1;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
