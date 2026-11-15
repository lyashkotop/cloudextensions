.class public final Lcom/streambundlehtml/select/Evaluator$IsFirstChild;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IsFirstChild"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 574
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 5
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 577
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 578
    .local v0, "p":Lcom/streambundlehtml/nodes/Element;
    if-eqz v0, :cond_12

    instance-of v1, v0, Lcom/streambundlehtml/nodes/Document;

    if-nez v1, :cond_12

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->elementSiblingIndex()I

    move-result v1

    if-nez v1, :cond_12

    const/4 v1, 0x1

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    :goto_13
    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 583
    const-string v0, ":first-child"

    return-object v0
.end method
