.class public final Lcom/streambundlehtml/select/Evaluator$IsRoot;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IsRoot"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 592
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 5
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 595
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Document;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/nodes/Element;->child(I)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    goto :goto_b

    :cond_a
    move-object v0, p1

    .line 596
    .local v0, "r":Lcom/streambundlehtml/nodes/Element;
    :goto_b
    if-ne p2, v0, :cond_e

    const/4 v1, 0x1

    :cond_e
    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 600
    const-string v0, ":root"

    return-object v0
.end method
