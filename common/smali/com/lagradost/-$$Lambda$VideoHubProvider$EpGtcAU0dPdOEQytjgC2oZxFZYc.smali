.class public final synthetic Lcom/lagradost/-$$Lambda$VideoHubProvider$EpGtcAU0dPdOEQytjgC2oZxFZYc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final synthetic INSTANCE:Lcom/lagradost/-$$Lambda$VideoHubProvider$EpGtcAU0dPdOEQytjgC2oZxFZYc;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/-$$Lambda$VideoHubProvider$EpGtcAU0dPdOEQytjgC2oZxFZYc;

    invoke-direct {v0}, Lcom/lagradost/-$$Lambda$VideoHubProvider$EpGtcAU0dPdOEQytjgC2oZxFZYc;-><init>()V

    sput-object v0, Lcom/lagradost/-$$Lambda$VideoHubProvider$EpGtcAU0dPdOEQytjgC2oZxFZYc;->INSTANCE:Lcom/lagradost/-$$Lambda$VideoHubProvider$EpGtcAU0dPdOEQytjgC2oZxFZYc;

    return-void
.end method

.method private synthetic constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {p1}, Lcom/lagradost/VideoHubProvider;->lambda$EpGtcAU0dPdOEQytjgC2oZxFZYc(Ljava/util/Map$Entry;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
