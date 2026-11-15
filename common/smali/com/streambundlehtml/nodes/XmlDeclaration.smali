.class public Lcom/streambundlehtml/nodes/XmlDeclaration;
.super Lcom/streambundlehtml/nodes/LeafNode;
.source "XmlDeclaration.java"


# instance fields
.field private final isProcessingInstruction:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isProcessingInstruction"    # Z

    .line 21
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;-><init>()V

    .line 22
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 23
    iput-object p1, p0, Lcom/streambundlehtml/nodes/XmlDeclaration;->value:Ljava/lang/Object;

    .line 24
    iput-boolean p2, p0, Lcom/streambundlehtml/nodes/XmlDeclaration;->isProcessingInstruction:Z

    .line 25
    return-void
.end method

.method private getWholeDeclaration(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 13
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/XmlDeclaration;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_50

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Attribute;

    .line 55
    .local v1, "attribute":Lcom/streambundlehtml/nodes/Attribute;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 57
    .local v4, "val":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/XmlDeclaration;->nodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4b

    .line 58
    const/16 v3, 0x20

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 60
    invoke-interface {p1, v2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 61
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_48

    .line 62
    const-string v3, "=\""

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 63
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v3, p1

    move-object v5, p2

    .end local p1    # "accum":Ljava/lang/Appendable;
    .end local p2    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .local v3, "accum":Ljava/lang/Appendable;
    .local v5, "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    invoke-static/range {v3 .. v9}, Lcom/streambundlehtml/nodes/Entities;->escape(Ljava/lang/Appendable;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;ZZZZ)V

    .line 64
    const/16 p1, 0x22

    invoke-interface {v3, p1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_4d

    .line 61
    .end local v3    # "accum":Ljava/lang/Appendable;
    .end local v5    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .restart local p1    # "accum":Ljava/lang/Appendable;
    .restart local p2    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :cond_48
    move-object v3, p1

    move-object v5, p2

    .end local p1    # "accum":Ljava/lang/Appendable;
    .end local p2    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .restart local v3    # "accum":Ljava/lang/Appendable;
    .restart local v5    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    goto :goto_4d

    .line 57
    .end local v3    # "accum":Ljava/lang/Appendable;
    .end local v5    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .restart local p1    # "accum":Ljava/lang/Appendable;
    .restart local p2    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :cond_4b
    move-object v3, p1

    move-object v5, p2

    .line 67
    .end local v1    # "attribute":Lcom/streambundlehtml/nodes/Attribute;
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "val":Ljava/lang/String;
    .end local p1    # "accum":Ljava/lang/Appendable;
    .end local p2    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .restart local v3    # "accum":Ljava/lang/Appendable;
    .restart local v5    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :goto_4d
    move-object p1, v3

    move-object p2, v5

    goto :goto_8

    .line 68
    .end local v3    # "accum":Ljava/lang/Appendable;
    .end local v5    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .restart local p1    # "accum":Ljava/lang/Appendable;
    .restart local p2    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :cond_50
    return-void
.end method


# virtual methods
.method public bridge synthetic absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3

    .line 12
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic baseUri()Ljava/lang/String;
    .registers 2

    .line 12
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->baseUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic childNodeSize()I
    .registers 2

    .line 12
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->childNodeSize()I

    move-result v0

    return v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 12
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/XmlDeclaration;->clone()Lcom/streambundlehtml/nodes/XmlDeclaration;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/streambundlehtml/nodes/XmlDeclaration;
    .registers 2

    .line 93
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->clone()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/XmlDeclaration;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 12
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/XmlDeclaration;->clone()Lcom/streambundlehtml/nodes/XmlDeclaration;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic empty()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 12
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->empty()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    return-object v0
.end method

.method public getWholeDeclaration()Ljava/lang/String;
    .registers 4

    .line 44
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 46
    .local v0, "sb":Ljava/lang/StringBuilder;
    :try_start_4
    new-instance v1, Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-direct {v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/streambundlehtml/nodes/XmlDeclaration;->getWholeDeclaration(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_c} :catch_16

    .line 49
    nop

    .line 50
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 47
    :catch_16
    move-exception v1

    .line 48
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/streambundlehtml/SerializationException;

    invoke-direct {v2, v1}, Lcom/streambundlehtml/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public bridge synthetic hasAttr(Ljava/lang/String;)Z
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttr(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public name()Ljava/lang/String;
    .registers 2

    .line 36
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/XmlDeclaration;->coreValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .line 28
    const-string v0, "#declaration"

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 8
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    nop

    .line 73
    const-string v0, "<"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    .line 74
    iget-boolean v1, p0, Lcom/streambundlehtml/nodes/XmlDeclaration;->isProcessingInstruction:Z

    const-string v2, "!"

    const-string v3, "?"

    if-eqz v1, :cond_11

    move-object v1, v2

    goto :goto_12

    :cond_11
    move-object v1, v3

    :goto_12
    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    .line 75
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/XmlDeclaration;->coreValue()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 76
    invoke-direct {p0, p1, p3}, Lcom/streambundlehtml/nodes/XmlDeclaration;->getWholeDeclaration(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 77
    nop

    .line 78
    iget-boolean v0, p0, Lcom/streambundlehtml/nodes/XmlDeclaration;->isProcessingInstruction:Z

    if-nez v0, :cond_26

    move-object v2, v3

    :cond_26
    invoke-interface {p1, v2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    .line 79
    const-string v1, ">"

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 80
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 84
    return-void
.end method

.method public bridge synthetic removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 88
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/XmlDeclaration;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
