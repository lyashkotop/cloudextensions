.class public final synthetic Lcom/example/ebalka/EbalkaParser$$ExternalSyntheticLambda0;
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


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    check-cast p1, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lcom/example/ebalka/EbalkaParser;->$r8$lambda$arY_uxGXj-fLeXy8nNiT1FLONxk(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
