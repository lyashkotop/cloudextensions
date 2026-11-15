.class public final synthetic Lcom/lagradost/-$$Lambda$HlsPlaylist$YiBV4U5PFB5bLaHkgMbMaDzHcsA;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final synthetic INSTANCE:Lcom/lagradost/-$$Lambda$HlsPlaylist$YiBV4U5PFB5bLaHkgMbMaDzHcsA;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/-$$Lambda$HlsPlaylist$YiBV4U5PFB5bLaHkgMbMaDzHcsA;

    invoke-direct {v0}, Lcom/lagradost/-$$Lambda$HlsPlaylist$YiBV4U5PFB5bLaHkgMbMaDzHcsA;-><init>()V

    sput-object v0, Lcom/lagradost/-$$Lambda$HlsPlaylist$YiBV4U5PFB5bLaHkgMbMaDzHcsA;->INSTANCE:Lcom/lagradost/-$$Lambda$HlsPlaylist$YiBV4U5PFB5bLaHkgMbMaDzHcsA;

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

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/lagradost/HlsPlaylist;->lambda$YiBV4U5PFB5bLaHkgMbMaDzHcsA(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
