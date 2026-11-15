.class public final Lcom/streambundlehtml/select/Evaluator$IndexLessThan;
.super Lcom/streambundlehtml/select/Evaluator$IndexEvaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IndexLessThan"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "index"    # I

    .line 348
    invoke-direct {p0, p1}, Lcom/streambundlehtml/select/Evaluator$IndexEvaluator;-><init>(I)V

    .line 349
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 5
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 353
    if-eq p1, p2, :cond_c

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->elementSiblingIndex()I

    move-result v0

    iget v1, p0, Lcom/streambundlehtml/select/Evaluator$IndexLessThan;->index:I

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 358
    iget v0, p0, Lcom/streambundlehtml/select/Evaluator$IndexLessThan;->index:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, ":lt(%d)"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
