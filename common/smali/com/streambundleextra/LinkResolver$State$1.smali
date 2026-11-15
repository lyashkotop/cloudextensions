.class Lcom/streambundleextra/LinkResolver$State$1;
.super Ljava/lang/Object;
.source "LinkResolver.java"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundleextra/LinkResolver$State;->process(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/streambundleextra/LinkResolver$State;


# direct methods
.method constructor <init>(Lcom/streambundleextra/LinkResolver$State;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 23
    iput-object p1, p0, Lcom/streambundleextra/LinkResolver$State$1;->this$0:Lcom/streambundleextra/LinkResolver$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    instance-of v0, p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    if-eqz v0, :cond_16

    check-cast p1, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-static {p1}, Lcom/streambundle/v48/PlaybackLinks;->verified(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    move-result-object p1

    if-eqz p1, :cond_16

    iget-object v0, p0, Lcom/streambundleextra/LinkResolver$State$1;->this$0:Lcom/streambundleextra/LinkResolver$State;

    iget-object v1, v0, Lcom/streambundleextra/LinkResolver$State;->callback:Lkotlin/jvm/functions/Function1;

    invoke-interface {v1, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/streambundleextra/LinkResolver$State;->found:Z

    :cond_16
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method
