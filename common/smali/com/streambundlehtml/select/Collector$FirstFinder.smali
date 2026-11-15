.class Lcom/streambundlehtml/select/Collector$FirstFinder;
.super Ljava/lang/Object;
.source "Collector.java"

# interfaces
.implements Lcom/streambundlehtml/select/NodeFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Collector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FirstFinder"
.end annotation


# instance fields
.field private final eval:Lcom/streambundlehtml/select/Evaluator;

.field private evalRoot:Lcom/streambundlehtml/nodes/Element;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private match:Lcom/streambundlehtml/nodes/Element;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/streambundlehtml/select/Evaluator;)V
    .registers 3
    .param p1, "eval"    # Lcom/streambundlehtml/select/Evaluator;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->evalRoot:Lcom/streambundlehtml/nodes/Element;

    .line 52
    iput-object v0, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->match:Lcom/streambundlehtml/nodes/Element;

    .line 56
    iput-object p1, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->eval:Lcom/streambundlehtml/select/Evaluator;

    .line 57
    return-void
.end method


# virtual methods
.method find(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "start"    # Lcom/streambundlehtml/nodes/Element;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 60
    iput-object p1, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->evalRoot:Lcom/streambundlehtml/nodes/Element;

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->match:Lcom/streambundlehtml/nodes/Element;

    .line 62
    invoke-static {p0, p2}, Lcom/streambundlehtml/select/NodeTraversor;->filter(Lcom/streambundlehtml/select/NodeFilter;Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    .line 63
    iget-object v0, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->match:Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public head(Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 6
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 68
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_16

    .line 69
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 70
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    iget-object v1, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->eval:Lcom/streambundlehtml/select/Evaluator;

    iget-object v2, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->evalRoot:Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v1, v2, v0}, Lcom/streambundlehtml/select/Evaluator;->matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 71
    iput-object v0, p0, Lcom/streambundlehtml/select/Collector$FirstFinder;->match:Lcom/streambundlehtml/nodes/Element;

    .line 72
    sget-object v1, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v1

    .line 75
    .end local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_16
    sget-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v0
.end method

.method public tail(Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 4
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 80
    sget-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v0
.end method
