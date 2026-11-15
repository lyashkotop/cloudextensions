.class public final Lcom/streambundlehtml/select/CombiningEvaluator$Or;
.super Lcom/streambundlehtml/select/CombiningEvaluator;
.source "CombiningEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/CombiningEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Or"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 84
    invoke-direct {p0}, Lcom/streambundlehtml/select/CombiningEvaluator;-><init>()V

    .line 85
    return-void
.end method

.method constructor <init>(Ljava/util/Collection;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/select/Evaluator;",
            ">;)V"
        }
    .end annotation

    .line 73
    .local p1, "evaluators":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/streambundlehtml/select/Evaluator;>;"
    invoke-direct {p0}, Lcom/streambundlehtml/select/CombiningEvaluator;-><init>()V

    .line 74
    iget v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->num:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_13

    .line 75
    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    new-instance v1, Lcom/streambundlehtml/select/CombiningEvaluator$And;

    invoke-direct {v1, p1}, Lcom/streambundlehtml/select/CombiningEvaluator$And;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18

    .line 77
    :cond_13
    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 78
    :goto_18
    invoke-virtual {p0}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->updateNumEvaluators()V

    .line 79
    return-void
.end method

.method varargs constructor <init>([Lcom/streambundlehtml/select/Evaluator;)V
    .registers 3
    .param p1, "evaluators"    # [Lcom/streambundlehtml/select/Evaluator;

    .line 81
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;-><init>(Ljava/util/Collection;)V

    return-void
.end method


# virtual methods
.method public add(Lcom/streambundlehtml/select/Evaluator;)V
    .registers 3
    .param p1, "e"    # Lcom/streambundlehtml/select/Evaluator;

    .line 88
    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    invoke-virtual {p0}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->updateNumEvaluators()V

    .line 90
    return-void
.end method

.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 6
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "node"    # Lcom/streambundlehtml/nodes/Element;

    .line 94
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->num:I

    if-ge v0, v1, :cond_18

    .line 95
    iget-object v1, p0, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/select/Evaluator;

    .line 96
    .local v1, "s":Lcom/streambundlehtml/select/Evaluator;
    invoke-virtual {v1, p1, p2}, Lcom/streambundlehtml/select/Evaluator;->matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 97
    const/4 v2, 0x1

    return v2

    .line 94
    .end local v1    # "s":Lcom/streambundlehtml/select/Evaluator;
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 99
    .end local v0    # "i":I
    :cond_18
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 104
    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    const-string v1, ", "

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
