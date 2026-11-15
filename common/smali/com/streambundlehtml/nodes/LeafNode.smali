.class abstract Lcom/streambundlehtml/nodes/LeafNode;
.super Lcom/streambundlehtml/nodes/Node;
.source "LeafNode.java"


# instance fields
.field value:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/Node;-><init>()V

    return-void
.end method

.method private ensureAttributes()V
    .registers 5

    .line 19
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttributes()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 20
    iget-object v0, p0, Lcom/streambundlehtml/nodes/LeafNode;->value:Ljava/lang/Object;

    .line 21
    .local v0, "coreValue":Ljava/lang/Object;
    new-instance v1, Lcom/streambundlehtml/nodes/Attributes;

    invoke-direct {v1}, Lcom/streambundlehtml/nodes/Attributes;-><init>()V

    .line 22
    .local v1, "attributes":Lcom/streambundlehtml/nodes/Attributes;
    iput-object v1, p0, Lcom/streambundlehtml/nodes/LeafNode;->value:Ljava/lang/Object;

    .line 23
    if-eqz v0, :cond_1b

    .line 24
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->nodeName()Ljava/lang/String;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 26
    .end local v0    # "coreValue":Ljava/lang/Object;
    .end local v1    # "attributes":Lcom/streambundlehtml/nodes/Attributes;
    :cond_1b
    return-void
.end method


# virtual methods
.method public absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .line 69
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;->ensureAttributes()V

    .line 70
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 46
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttributes()Z

    move-result v0

    if-nez v0, :cond_13

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->nodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 47
    iput-object p2, p0, Lcom/streambundlehtml/nodes/LeafNode;->value:Ljava/lang/Object;

    goto :goto_19

    .line 49
    :cond_13
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;->ensureAttributes()V

    .line 50
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/nodes/Node;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 52
    :goto_19
    return-object p0
.end method

.method public attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .line 38
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttributes()Z

    move-result v0

    if-nez v0, :cond_18

    .line 39
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->nodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/streambundlehtml/nodes/LeafNode;->value:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_17

    :cond_15
    const-string v0, ""

    :goto_17
    return-object v0

    .line 41
    :cond_18
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final attributes()Lcom/streambundlehtml/nodes/Attributes;
    .registers 2

    .line 14
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;->ensureAttributes()V

    .line 15
    iget-object v0, p0, Lcom/streambundlehtml/nodes/LeafNode;->value:Ljava/lang/Object;

    check-cast v0, Lcom/streambundlehtml/nodes/Attributes;

    return-object v0
.end method

.method public baseUri()Ljava/lang/String;
    .registers 2

    .line 75
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->hasParent()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->parent()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->baseUri()Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    :cond_f
    const-string v0, ""

    :goto_11
    return-object v0
.end method

.method public childNodeSize()I
    .registers 2

    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method coreValue()Ljava/lang/String;
    .registers 2

    .line 29
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->nodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method coreValue(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .line 33
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->nodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 34
    return-void
.end method

.method protected doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/LeafNode;
    .registers 4
    .param p1, "parent"    # Lcom/streambundlehtml/nodes/Node;

    .line 100
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/LeafNode;

    .line 103
    .local v0, "clone":Lcom/streambundlehtml/nodes/LeafNode;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttributes()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 104
    iget-object v1, p0, Lcom/streambundlehtml/nodes/LeafNode;->value:Ljava/lang/Object;

    check-cast v1, Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Attributes;->clone()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v1

    iput-object v1, v0, Lcom/streambundlehtml/nodes/LeafNode;->value:Ljava/lang/Object;

    .line 106
    :cond_16
    return-object v0
.end method

.method protected bridge synthetic doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 5
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/LeafNode;

    move-result-object p1

    return-object p1
.end method

.method protected doSetBaseUri(Ljava/lang/String;)V
    .registers 2
    .param p1, "baseUri"    # Ljava/lang/String;

    .line 81
    return-void
.end method

.method public empty()Lcom/streambundlehtml/nodes/Node;
    .registers 1

    .line 90
    return-object p0
.end method

.method protected ensureChildNodes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 95
    sget-object v0, Lcom/streambundlehtml/nodes/LeafNode;->EmptyNodes:Ljava/util/List;

    return-object v0
.end method

.method public hasAttr(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .line 57
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;->ensureAttributes()V

    .line 58
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->hasAttr(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected final hasAttributes()Z
    .registers 2

    .line 9
    iget-object v0, p0, Lcom/streambundlehtml/nodes/LeafNode;->value:Ljava/lang/Object;

    instance-of v0, v0, Lcom/streambundlehtml/nodes/Attributes;

    return v0
.end method

.method public removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .line 63
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;->ensureAttributes()V

    .line 64
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    return-object v0
.end method
