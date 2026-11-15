.class abstract Lcom/streambundlehtml/select/StructuralEvaluator;
.super Lcom/streambundlehtml/select/Evaluator;
.source "StructuralEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/select/StructuralEvaluator$ImmediatePreviousSibling;,
        Lcom/streambundlehtml/select/StructuralEvaluator$PreviousSibling;,
        Lcom/streambundlehtml/select/StructuralEvaluator$ImmediateParent;,
        Lcom/streambundlehtml/select/StructuralEvaluator$Parent;,
        Lcom/streambundlehtml/select/StructuralEvaluator$Not;,
        Lcom/streambundlehtml/select/StructuralEvaluator$Has;,
        Lcom/streambundlehtml/select/StructuralEvaluator$Root;
    }
.end annotation


# instance fields
.field evaluator:Lcom/streambundlehtml/select/Evaluator;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    return-void
.end method
