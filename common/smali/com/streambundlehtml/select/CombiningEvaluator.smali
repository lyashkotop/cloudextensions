.class public abstract Lcom/streambundlehtml/select/CombiningEvaluator;
.super Lcom/streambundlehtml/select/Evaluator;
.source "CombiningEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/select/CombiningEvaluator$Or;,
        Lcom/streambundlehtml/select/CombiningEvaluator$And;
    }
.end annotation


# instance fields
.field final evaluators:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/streambundlehtml/select/Evaluator;",
            ">;"
        }
    .end annotation
.end field

.field num:I


# direct methods
.method constructor <init>()V
    .registers 2

    .line 19
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    .line 16
    const/4 v0, 0x0

    iput v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->num:I

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->evaluators:Ljava/util/ArrayList;

    .line 21
    return-void
.end method

.method constructor <init>(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/select/Evaluator;",
            ">;)V"
        }
    .end annotation

    .line 24
    .local p1, "evaluators":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/streambundlehtml/select/Evaluator;>;"
    invoke-direct {p0}, Lcom/streambundlehtml/select/CombiningEvaluator;-><init>()V

    .line 25
    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 26
    invoke-virtual {p0}, Lcom/streambundlehtml/select/CombiningEvaluator;->updateNumEvaluators()V

    .line 27
    return-void
.end method


# virtual methods
.method replaceRightMostEvaluator(Lcom/streambundlehtml/select/Evaluator;)V
    .registers 4
    .param p1, "replacement"    # Lcom/streambundlehtml/select/Evaluator;

    .line 34
    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->evaluators:Ljava/util/ArrayList;

    iget v1, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->num:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 35
    return-void
.end method

.method rightMostEvaluator()Lcom/streambundlehtml/select/Evaluator;
    .registers 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 30
    iget v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->num:I

    if-lez v0, :cond_11

    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->evaluators:Ljava/util/ArrayList;

    iget v1, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->num:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/select/Evaluator;

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return-object v0
.end method

.method updateNumEvaluators()V
    .registers 2

    .line 39
    iget-object v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/streambundlehtml/select/CombiningEvaluator;->num:I

    .line 40
    return-void
.end method
