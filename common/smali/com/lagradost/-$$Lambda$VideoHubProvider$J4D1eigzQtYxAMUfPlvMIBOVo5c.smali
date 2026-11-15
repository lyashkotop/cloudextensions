.class public final synthetic Lcom/lagradost/-$$Lambda$VideoHubProvider$J4D1eigzQtYxAMUfPlvMIBOVo5c;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lcom/lagradost/VideoCard;

.field public final synthetic f$1:Lcom/lagradost/VideoHubProvider;


# direct methods
.method public synthetic constructor <init>(Lcom/lagradost/VideoCard;Lcom/lagradost/VideoHubProvider;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$J4D1eigzQtYxAMUfPlvMIBOVo5c;->f$0:Lcom/lagradost/VideoCard;

    iput-object p2, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$J4D1eigzQtYxAMUfPlvMIBOVo5c;->f$1:Lcom/lagradost/VideoHubProvider;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$J4D1eigzQtYxAMUfPlvMIBOVo5c;->f$0:Lcom/lagradost/VideoCard;

    iget-object v1, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$J4D1eigzQtYxAMUfPlvMIBOVo5c;->f$1:Lcom/lagradost/VideoHubProvider;

    check-cast p1, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    invoke-static {v0, v1, p1}, Lcom/lagradost/VideoHubProvider;->lambda$J4D1eigzQtYxAMUfPlvMIBOVo5c(Lcom/lagradost/VideoCard;Lcom/lagradost/VideoHubProvider;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
