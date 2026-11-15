.class public abstract Lcom/streambundlehtml/select/Evaluator$IndexEvaluator;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "IndexEvaluator"
.end annotation


# instance fields
.field index:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "index"    # I

    .line 658
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    .line 659
    iput p1, p0, Lcom/streambundlehtml/select/Evaluator$IndexEvaluator;->index:I

    .line 660
    return-void
.end method
