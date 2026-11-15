.class public Lcom/streambundlehtml/select/Collector;
.super Ljava/lang/Object;
.source "Collector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/select/Collector$FirstFinder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p0, "eval"    # Lcom/streambundlehtml/select/Evaluator;
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;

    .line 27
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v0}, Lcom/streambundlehtml/select/Elements;-><init>()V

    .line 28
    .local v0, "elements":Lcom/streambundlehtml/select/Elements;
    new-instance v1, Lcom/streambundlehtml/select/Collector$0;

    invoke-direct {v1, p0, p1, v0}, Lcom/streambundlehtml/select/Collector$0;-><init>(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/select/Elements;)V

    invoke-static {v1, p1}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 35
    return-object v0
.end method

.method public static findFirst(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p0, "eval"    # Lcom/streambundlehtml/select/Evaluator;
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 46
    new-instance v0, Lcom/streambundlehtml/select/Collector$FirstFinder;

    invoke-direct {v0, p0}, Lcom/streambundlehtml/select/Collector$FirstFinder;-><init>(Lcom/streambundlehtml/select/Evaluator;)V

    .line 47
    .local v0, "finder":Lcom/streambundlehtml/select/Collector$FirstFinder;
    invoke-virtual {v0, p1, p1}, Lcom/streambundlehtml/select/Collector$FirstFinder;->find(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    return-object v1
.end method

.method static synthetic lambda$collect$0(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/select/Elements;Lcom/streambundlehtml/nodes/Node;I)V
    .registers 7
    .param p0, "eval"    # Lcom/streambundlehtml/select/Evaluator;
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "elements"    # Lcom/streambundlehtml/select/Elements;
    .param p3, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p4, "depth"    # I

    .line 29
    instance-of v0, p3, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_10

    .line 30
    move-object v0, p3

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 31
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0, p1, v0}, Lcom/streambundlehtml/select/Evaluator;->matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 32
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    .line 34
    .end local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_10
    return-void
.end method
