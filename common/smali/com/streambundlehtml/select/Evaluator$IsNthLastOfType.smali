.class public Lcom/streambundlehtml/select/Evaluator$IsNthLastOfType;
.super Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IsNthLastOfType"
.end annotation


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "a"    # I
    .param p2, "b"    # I

    .line 550
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;-><init>(II)V

    .line 551
    return-void
.end method


# virtual methods
.method protected calculatePosition(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)I
    .registers 8
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 555
    const/4 v0, 0x0

    .line 556
    .local v0, "pos":I
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    if-nez v1, :cond_9

    .line 557
    const/4 v1, 0x0

    return v1

    .line 558
    :cond_9
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->children()Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    .line 559
    .local v1, "family":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->elementSiblingIndex()I

    move-result v2

    .local v2, "i":I
    :goto_15
    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v3

    if-ge v2, v3, :cond_34

    .line 560
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v3

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/parser/Tag;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_31

    add-int/lit8 v0, v0, 0x1

    .line 559
    :cond_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 562
    .end local v2    # "i":I
    :cond_34
    return v0
.end method

.method protected getPseudoClass()Ljava/lang/String;
    .registers 2

    .line 567
    const-string v0, "nth-last-of-type"

    return-object v0
.end method
