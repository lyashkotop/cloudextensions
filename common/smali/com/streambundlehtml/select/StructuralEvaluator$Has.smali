.class Lcom/streambundlehtml/select/StructuralEvaluator$Has;
.super Lcom/streambundlehtml/select/StructuralEvaluator;
.source "StructuralEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/StructuralEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Has"
.end annotation


# instance fields
.field final finder:Lcom/streambundlehtml/select/Collector$FirstFinder;


# direct methods
.method public constructor <init>(Lcom/streambundlehtml/select/Evaluator;)V
    .registers 3
    .param p1, "evaluator"    # Lcom/streambundlehtml/select/Evaluator;

    .line 22
    invoke-direct {p0}, Lcom/streambundlehtml/select/StructuralEvaluator;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Has;->evaluator:Lcom/streambundlehtml/select/Evaluator;

    .line 24
    new-instance v0, Lcom/streambundlehtml/select/Collector$FirstFinder;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Collector$FirstFinder;-><init>(Lcom/streambundlehtml/select/Evaluator;)V

    iput-object v0, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Has;->finder:Lcom/streambundlehtml/select/Collector$FirstFinder;

    .line 25
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 7
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 30
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v1

    if-ge v0, v1, :cond_1f

    .line 31
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/nodes/Element;->childNode(I)Lcom/streambundlehtml/nodes/Node;

    move-result-object v1

    .line 32
    .local v1, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v2, v1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v2, :cond_1c

    .line 33
    iget-object v2, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Has;->finder:Lcom/streambundlehtml/select/Collector$FirstFinder;

    move-object v3, v1

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v2, p2, v3}, Lcom/streambundlehtml/select/Collector$FirstFinder;->find(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    .line 34
    .local v2, "match":Lcom/streambundlehtml/nodes/Element;
    if-eqz v2, :cond_1c

    .line 35
    const/4 v3, 0x1

    return v3

    .line 30
    .end local v1    # "node":Lcom/streambundlehtml/nodes/Node;
    .end local v2    # "match":Lcom/streambundlehtml/nodes/Element;
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 38
    .end local v0    # "i":I
    :cond_1f
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 43
    iget-object v0, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Has;->evaluator:Lcom/streambundlehtml/select/Evaluator;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, ":has(%s)"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
