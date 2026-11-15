.class public final Lcom/streambundlehtml/select/Evaluator$IsOnlyOfType;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IsOnlyOfType"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 616
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 11
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 619
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 620
    .local v0, "p":Lcom/streambundlehtml/nodes/Element;
    const/4 v1, 0x0

    if-eqz v0, :cond_36

    instance-of v2, v0, Lcom/streambundlehtml/nodes/Document;

    if-nez v2, :cond_36

    .line 622
    const/4 v2, 0x0

    .line 623
    .local v2, "pos":I
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->children()Lcom/streambundlehtml/select/Elements;

    move-result-object v3

    .line 624
    .local v3, "family":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {v3}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_14
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_31

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    .line 625
    .local v5, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v6

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/streambundlehtml/parser/Tag;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_30

    add-int/lit8 v2, v2, 0x1

    .line 626
    .end local v5    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_30
    goto :goto_14

    .line 627
    :cond_31
    const/4 v4, 0x1

    if-ne v2, v4, :cond_35

    const/4 v1, 0x1

    :cond_35
    return v1

    .line 620
    .end local v2    # "pos":I
    .end local v3    # "family":Lcom/streambundlehtml/select/Elements;
    :cond_36
    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 631
    const-string v0, ":only-of-type"

    return-object v0
.end method
