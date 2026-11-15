.class public abstract Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CssNthEvaluator"
.end annotation


# instance fields
.field protected final a:I

.field protected final b:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "b"    # I

    .line 448
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;-><init>(II)V

    .line 449
    return-void
.end method

.method public constructor <init>(II)V
    .registers 3
    .param p1, "a"    # I
    .param p2, "b"    # I

    .line 443
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    .line 444
    iput p1, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->a:I

    .line 445
    iput p2, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->b:I

    .line 446
    return-void
.end method


# virtual methods
.method protected abstract calculatePosition(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)I
.end method

.method protected abstract getPseudoClass()Ljava/lang/String;
.end method

.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 9
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 453
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 454
    .local v0, "p":Lcom/streambundlehtml/nodes/Element;
    const/4 v1, 0x0

    if-eqz v0, :cond_2f

    instance-of v2, v0, Lcom/streambundlehtml/nodes/Document;

    if-nez v2, :cond_2f

    .line 456
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->calculatePosition(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)I

    move-result v2

    .line 457
    .local v2, "pos":I
    iget v3, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->a:I

    const/4 v4, 0x1

    if-nez v3, :cond_1a

    iget v3, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->b:I

    if-ne v2, v3, :cond_19

    const/4 v1, 0x1

    :cond_19
    return v1

    .line 459
    :cond_1a
    iget v3, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->b:I

    sub-int v3, v2, v3

    iget v5, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->a:I

    mul-int v3, v3, v5

    if-ltz v3, :cond_2e

    iget v3, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->b:I

    sub-int v3, v2, v3

    iget v5, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->a:I

    rem-int/2addr v3, v5

    if-nez v3, :cond_2e

    const/4 v1, 0x1

    :cond_2e
    return v1

    .line 454
    .end local v2    # "pos":I
    :cond_2f
    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .line 464
    iget v0, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->a:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-nez v0, :cond_1e

    .line 465
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->getPseudoClass()Ljava/lang/String;

    move-result-object v0

    iget v4, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->b:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    aput-object v4, v3, v1

    const-string v0, ":%s(%d)"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 466
    :cond_1e
    iget v0, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->b:I

    if-nez v0, :cond_39

    .line 467
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->getPseudoClass()Ljava/lang/String;

    move-result-object v0

    iget v4, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    aput-object v4, v3, v1

    const-string v0, ":%s(%dn)"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 468
    :cond_39
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->getPseudoClass()Ljava/lang/String;

    move-result-object v0

    iget v4, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v5, p0, Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;->b:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v0, v6, v2

    aput-object v4, v6, v1

    aput-object v5, v6, v3

    const-string v0, ":%s(%dn%+d)"

    invoke-static {v0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
