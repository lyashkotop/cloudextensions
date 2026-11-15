.class Lcom/streambundleextra/ExtractorBridge$State$1;
.super Ljava/lang/Object;
.source "ExtractorBridge.java"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundleextra/ExtractorBridge$State;->advance(Ljava/lang/Object;)Ljava/lang/Object;
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
.field final synthetic this$0:Lcom/streambundleextra/ExtractorBridge$State;


# direct methods
.method constructor <init>(Lcom/streambundleextra/ExtractorBridge$State;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 59
    iput-object p1, p0, Lcom/streambundleextra/ExtractorBridge$State$1;->this$0:Lcom/streambundleextra/ExtractorBridge$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 60
    iget-object v0, p0, Lcom/streambundleextra/ExtractorBridge$State$1;->this$0:Lcom/streambundleextra/ExtractorBridge$State;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/streambundleextra/ExtractorBridge$State;->found:Z

    iget-object v0, p0, Lcom/streambundleextra/ExtractorBridge$State$1;->this$0:Lcom/streambundleextra/ExtractorBridge$State;

    iput-boolean v1, v0, Lcom/streambundleextra/ExtractorBridge$State;->produced:Z

    iget-object v0, p0, Lcom/streambundleextra/ExtractorBridge$State$1;->this$0:Lcom/streambundleextra/ExtractorBridge$State;

    iget-object v0, v0, Lcom/streambundleextra/ExtractorBridge$State;->callback:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
