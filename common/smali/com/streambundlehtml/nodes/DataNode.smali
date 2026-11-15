.class public Lcom/streambundlehtml/nodes/DataNode;
.super Lcom/streambundlehtml/nodes/LeafNode;
.source "DataNode.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .line 15
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/streambundlehtml/nodes/DataNode;->value:Ljava/lang/Object;

    .line 17
    return-void
.end method


# virtual methods
.method public bridge synthetic absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 9
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3

    .line 9
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 9
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic baseUri()Ljava/lang/String;
    .registers 2

    .line 9
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->baseUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic childNodeSize()I
    .registers 2

    .line 9
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->childNodeSize()I

    move-result v0

    return v0
.end method

.method public clone()Lcom/streambundlehtml/nodes/DataNode;
    .registers 2

    .line 56
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->clone()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/DataNode;

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 9
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/DataNode;->clone()Lcom/streambundlehtml/nodes/DataNode;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 9
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/DataNode;->clone()Lcom/streambundlehtml/nodes/DataNode;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic empty()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 9
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->empty()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    return-object v0
.end method

.method public getWholeData()Ljava/lang/String;
    .registers 2

    .line 28
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/DataNode;->coreValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasAttr(Ljava/lang/String;)Z
    .registers 2

    .line 9
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttr(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .line 20
    const-string v0, "#data"

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/DataNode;->getWholeData()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 44
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 47
    return-void
.end method

.method public bridge synthetic removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 9
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public setWholeData(Ljava/lang/String;)Lcom/streambundlehtml/nodes/DataNode;
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .line 37
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/DataNode;->coreValue(Ljava/lang/String;)V

    .line 38
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 51
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/DataNode;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
