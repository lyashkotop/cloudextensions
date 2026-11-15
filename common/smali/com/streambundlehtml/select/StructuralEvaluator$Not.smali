.class Lcom/streambundlehtml/select/StructuralEvaluator$Not;
.super Lcom/streambundlehtml/select/StructuralEvaluator;
.source "StructuralEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/StructuralEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Not"
.end annotation


# direct methods
.method public constructor <init>(Lcom/streambundlehtml/select/Evaluator;)V
    .registers 2
    .param p1, "evaluator"    # Lcom/streambundlehtml/select/Evaluator;

    .line 48
    invoke-direct {p0}, Lcom/streambundlehtml/select/StructuralEvaluator;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Not;->evaluator:Lcom/streambundlehtml/select/Evaluator;

    .line 50
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 4
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "node"    # Lcom/streambundlehtml/nodes/Element;

    .line 54
    iget-object v0, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Not;->evaluator:Lcom/streambundlehtml/select/Evaluator;

    invoke-virtual {v0, p1, p2}, Lcom/streambundlehtml/select/Evaluator;->matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 59
    iget-object v0, p0, Lcom/streambundlehtml/select/StructuralEvaluator$Not;->evaluator:Lcom/streambundlehtml/select/Evaluator;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, ":not(%s)"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
