.class public Lcom/streambundlehtml/nodes/CDataNode;
.super Lcom/streambundlehtml/nodes/TextNode;
.source "CDataNode.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .line 10
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    .line 11
    return-void
.end method


# virtual methods
.method public clone()Lcom/streambundlehtml/nodes/CDataNode;
    .registers 2

    .line 41
    invoke-super {p0}, Lcom/streambundlehtml/nodes/TextNode;->clone()Lcom/streambundlehtml/nodes/TextNode;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/CDataNode;

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 8
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/CDataNode;->clone()Lcom/streambundlehtml/nodes/CDataNode;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/TextNode;
    .registers 2

    .line 8
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/CDataNode;->clone()Lcom/streambundlehtml/nodes/CDataNode;

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

    .line 8
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/CDataNode;->clone()Lcom/streambundlehtml/nodes/CDataNode;

    move-result-object v0

    return-object v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .line 15
    const-string v0, "#cdata"

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    nop

    .line 30
    const-string v0, "<![CDATA["

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    .line 31
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/CDataNode;->getWholeText()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 32
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    const-string v0, "]]>"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 37
    return-void
.end method

.method public text()Ljava/lang/String;
    .registers 2

    .line 24
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/CDataNode;->getWholeText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
