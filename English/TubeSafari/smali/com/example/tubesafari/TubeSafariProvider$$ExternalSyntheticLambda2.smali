.class public final synthetic Lcom/example/tubesafari/TubeSafariProvider$$ExternalSyntheticLambda2;
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
.field public final synthetic f$0:Lcom/example/tubesafari/TubeSafariParser$Card;


# direct methods
.method public synthetic constructor <init>(Lcom/example/tubesafari/TubeSafariParser$Card;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/tubesafari/TubeSafariProvider$$ExternalSyntheticLambda2;->f$0:Lcom/example/tubesafari/TubeSafariParser$Card;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariProvider$$ExternalSyntheticLambda2;->f$0:Lcom/example/tubesafari/TubeSafariParser$Card;

    check-cast p1, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    invoke-static {v0, p1}, Lcom/example/tubesafari/TubeSafariProvider;->$r8$lambda$YaT8CRrL9yDAZfN-aJM4ZGHuLI0(Lcom/example/tubesafari/TubeSafariParser$Card;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
