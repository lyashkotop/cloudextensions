.class public final synthetic Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda2;
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
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda2;->f$0:Ljava/lang/String;

    iput p2, p0, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda2;->f$1:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda2;->f$0:Ljava/lang/String;

    iget v1, p0, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda2;->f$1:I

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {v0, v1, p1}, Lcom/example/tubesafari/TubeSafariParser;->$r8$lambda$ytZMAAfNOS9Docx3aNRUG4Hd3Fw(Ljava/lang/String;ILjava/util/Map$Entry;)Lkotlin/sequences/Sequence;

    move-result-object p1

    return-object p1
.end method
