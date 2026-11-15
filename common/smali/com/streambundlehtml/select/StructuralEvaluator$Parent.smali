.class Lcom/streambundlehtml/select/StructuralEvaluator$Parent;
.super Lcom/streambundlehtml/select/StructuralEvaluator;
.source "StructuralEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/StructuralEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Parent"
.end annotation


# direct methods
.method public constructor <init>(Lcom/streambundlehtml/select/Evaluator;)V
    .registers 2
    .param p1, "evaluator"    # Lcom/streambundlehtml/select/Evaluator;

    .line 64
    invoke-direct {p0}, Lcom/streambundlehtml/select/StructuralEvaluator;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Parent;->evaluator:Lcom/streambundlehtml/select/Evaluator;

    .line 66
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 6
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 70
    const/4 v0, 0x0

    if-ne p1, p2, :cond_4

    .line 71
    return v0

    .line 73
    :cond_4
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 74
    .local v1, "parent":Lcom/streambundlehtml/nodes/Element;
    :goto_8
    if-eqz v1, :cond_1c

    .line 75
    iget-object v2, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Parent;->evaluator:Lcom/streambundlehtml/select/Evaluator;

    invoke-virtual {v2, p1, v1}, Lcom/streambundlehtml/select/Evaluator;->matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 76
    const/4 v0, 0x1

    return v0

    .line 77
    :cond_14
    if-ne v1, p1, :cond_17

    .line 78
    goto :goto_1c

    .line 79
    :cond_17
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    goto :goto_8

    .line 81
    :cond_1c
    :goto_1c
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 86
    iget-object v0, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Parent;->evaluator:Lcom/streambundlehtml/select/Evaluator;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "%s "

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
