.class Lcom/streambundleextra/Details$1;
.super Ljava/lang/Object;
.source "Details.java"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundleextra/Details;->cards(Lcom/streambundleextra/VideoBundleSite;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/lagradost/cloudstream3/MovieSearchResponse;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$page:Ljava/lang/String;

.field final synthetic val$poster:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 102
    iput-object p1, p0, Lcom/streambundleextra/Details$1;->val$poster:Ljava/lang/String;

    iput-object p2, p0, Lcom/streambundleextra/Details$1;->val$page:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 102
    check-cast p1, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    invoke-virtual {p0, p1}, Lcom/streambundleextra/Details$1;->invoke(Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method

.method public invoke(Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;
    .registers 3

    .line 103
    iget-object v0, p0, Lcom/streambundleextra/Details$1;->val$poster:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterUrl(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/streambundleextra/Details$1;->val$page:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterHeaders(Ljava/util/Map;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method
