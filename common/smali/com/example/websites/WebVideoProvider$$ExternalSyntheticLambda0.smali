.class public final synthetic Lcom/example/websites/WebVideoProvider$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x12
    versionHash = "7de78e4c4546435adeebf26ef4b0cc5c4f405847ffd476305b2b34259a231191"
.end annotation


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Lcom/example/websites/WebVideoParser$Clip;


# direct methods
.method public synthetic constructor <init>(ILcom/example/websites/WebVideoParser$Clip;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/example/websites/WebVideoProvider$$ExternalSyntheticLambda0;->f$0:I

    iput-object p2, p0, Lcom/example/websites/WebVideoProvider$$ExternalSyntheticLambda0;->f$1:Lcom/example/websites/WebVideoParser$Clip;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 0
    iget v0, p0, Lcom/example/websites/WebVideoProvider$$ExternalSyntheticLambda0;->f$0:I

    iget-object v1, p0, Lcom/example/websites/WebVideoProvider$$ExternalSyntheticLambda0;->f$1:Lcom/example/websites/WebVideoParser$Clip;

    check-cast p1, Lcom/lagradost/cloudstream3/Episode;

    invoke-static {v0, v1, p1}, Lcom/example/websites/WebVideoProvider;->$r8$lambda$qP1oyuD5Hy3z2qRDjuCBvHcywVo(ILcom/example/websites/WebVideoParser$Clip;Lcom/lagradost/cloudstream3/Episode;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
