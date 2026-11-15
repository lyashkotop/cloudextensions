.class public final Lcom/streambundlehtml/select/CombiningEvaluator$And;
.super Lcom/streambundlehtml/select/CombiningEvaluator;
.source "CombiningEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/CombiningEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "And"
.end annotation


# direct methods
.method constructor <init>(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/select/Evaluator;",
            ">;)V"
        }
    .end annotation

    .line 44
    .local p1, "evaluators":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/streambundlehtml/select/Evaluator;>;"
    invoke-direct {p0, p1}, Lcom/streambundlehtml/select/CombiningEvaluator;-><init>(Ljava/util/Collection;)V

    .line 45
    return-void
.end method

.method varargs constructor <init>([Lcom/streambundlehtml/select/Evaluator;)V
    .registers 3
    .param p1, "evaluators"    # [Lcom/streambundlehtml/select/Evaluator;

    .line 48
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/select/CombiningEvaluator$And;-><init>(Ljava/util/Collection;)V

    .line 49
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 7
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "node"    # Lcom/streambundlehtml/nodes/Element;

    .line 53
    iget v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator$And;->num:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_19

    .line 54
    iget-object v2, p0, Lcom/streambundlehtml/select/CombiningEvaluator$And;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/select/Evaluator;

    .line 55
    .local v2, "s":Lcom/streambundlehtml/select/Evaluator;
    invoke-virtual {v2, p1, p2}, Lcom/streambundlehtml/select/Evaluator;->matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v3

    if-nez v3, :cond_16

    .line 56
    const/4 v1, 0x0

    return v1

    .line 53
    .end local v2    # "s":Lcom/streambundlehtml/select/Evaluator;
    :cond_16
    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 58
    .end local v0    # "i":I
    :cond_19
    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 63
    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator$And;->evaluators:Ljava/util/ArrayList;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
