.class public final synthetic Lcom/streambundleextra/VideoBundleSite$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/streambundleextra/VideoBundleSite;"
    method = "search$lambda$7$lambda$6"
    proto = "(Ljava/lang/String;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundleextra/VideoBundleSite$0;->f$0:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/streambundleextra/VideoBundleSite$0;->f$0:Ljava/lang/String;

    check-cast p1, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    invoke-static {v0, p1}, Lcom/streambundleextra/VideoBundleSite;->search$lambda$7$lambda$6(Ljava/lang/String;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
