.class public Lcom/streambundlehtml/select/Evaluator$IsNthOfType;
.super Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IsNthOfType"
.end annotation


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "a"    # I
    .param p2, "b"    # I

    .line 526
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;-><init>(II)V

    .line 527
    return-void
.end method


# virtual methods
.method protected calculatePosition(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)I
    .registers 9
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 530
    const/4 v0, 0x0

    .line 531
    .local v0, "pos":I
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    if-nez v1, :cond_9

    .line 532
    const/4 v1, 0x0

    return v1

    .line 533
    :cond_9
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->children()Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    .line 534
    .local v1, "family":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    .line 535
    .local v3, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v4

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/streambundlehtml/parser/Tag;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_31

    add-int/lit8 v0, v0, 0x1

    .line 536
    :cond_31
    if-eq v3, p2, :cond_34

    .line 537
    .end local v3    # "el":Lcom/streambundlehtml/nodes/Element;
    goto :goto_15

    .line 538
    :cond_34
    return v0
.end method

.method protected getPseudoClass()Ljava/lang/String;
    .registers 2

    .line 543
    const-string v0, "nth-of-type"

    return-object v0
.end method
