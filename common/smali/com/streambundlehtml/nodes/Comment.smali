.class public Lcom/streambundlehtml/nodes/Comment;
.super Lcom/streambundlehtml/nodes/LeafNode;
.source "Comment.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .line 18
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Comment;->value:Ljava/lang/Object;

    .line 20
    return-void
.end method

.method private static isXmlDeclarationData(Ljava/lang/String;)Z
    .registers 3
    .param p0, "data"    # Ljava/lang/String;

    .line 72
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_18

    const-string v0, "!"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_17

    const-string v0, "?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_17
    goto :goto_19

    :cond_18
    const/4 v1, 0x0

    :goto_19
    return v1
.end method


# virtual methods
.method public bridge synthetic absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 13
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public asXmlDeclaration()Lcom/streambundlehtml/nodes/XmlDeclaration;
    .registers 10
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 80
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->getData()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "data":Ljava/lang/String;
    const/4 v1, 0x0

    .line 83
    .local v1, "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, "declContent":Ljava/lang/String;
    invoke-static {v2}, Lcom/streambundlehtml/nodes/Comment;->isXmlDeclarationData(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 86
    const/4 v3, 0x0

    return-object v3

    .line 88
    :cond_17
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 90
    .local v3, "fragment":Ljava/lang/String;
    invoke-static {}, Lcom/streambundlehtml/parser/Parser;->htmlParser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v4

    sget-object v5, Lcom/streambundlehtml/parser/ParseSettings;->preserveCase:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {v4, v5}, Lcom/streambundlehtml/parser/Parser;->settings(Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v4

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->baseUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Lcom/streambundlehtml/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v4

    .line 91
    .local v4, "doc":Lcom/streambundlehtml/nodes/Document;
    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->children()Lcom/streambundlehtml/select/Elements;

    move-result-object v5

    invoke-virtual {v5}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v5

    if-lez v5, :cond_80

    .line 92
    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/streambundlehtml/nodes/Element;->child(I)Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    .line 93
    .local v5, "el":Lcom/streambundlehtml/nodes/Element;
    new-instance v6, Lcom/streambundlehtml/nodes/XmlDeclaration;

    invoke-static {v4}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v7

    invoke-virtual {v7}, Lcom/streambundlehtml/parser/Parser;->settings()Lcom/streambundlehtml/parser/ParseSettings;

    move-result-object v7

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "!"

    invoke-virtual {v0, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    invoke-direct {v6, v7, v8}, Lcom/streambundlehtml/nodes/XmlDeclaration;-><init>(Ljava/lang/String;Z)V

    move-object v1, v6

    .line 94
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/XmlDeclaration;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v6

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/streambundlehtml/nodes/Attributes;->addAll(Lcom/streambundlehtml/nodes/Attributes;)V

    .line 96
    .end local v5    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_80
    return-object v1
.end method

.method public bridge synthetic attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3

    .line 13
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 13
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic baseUri()Ljava/lang/String;
    .registers 2

    .line 13
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->baseUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic childNodeSize()I
    .registers 2

    .line 13
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->childNodeSize()I

    move-result v0

    return v0
.end method

.method public clone()Lcom/streambundlehtml/nodes/Comment;
    .registers 2

    .line 59
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->clone()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Comment;

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 13
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->clone()Lcom/streambundlehtml/nodes/Comment;

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

    .line 13
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->clone()Lcom/streambundlehtml/nodes/Comment;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic empty()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 13
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->empty()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    return-object v0
.end method

.method public getData()Ljava/lang/String;
    .registers 2

    .line 31
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->coreValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasAttr(Ljava/lang/String;)Z
    .registers 2

    .line 13
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttr(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public isXmlDeclaration()Z
    .registers 3

    .line 67
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->getData()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "data":Ljava/lang/String;
    invoke-static {v0}, Lcom/streambundlehtml/nodes/Comment;->isXmlDeclarationData(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .line 23
    const-string v0, "#comment"

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

    .line 41
    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->siblingIndex()I

    move-result v0

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Comment;->parentNode:Lcom/streambundlehtml/nodes/Node;

    instance-of v0, v0, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Comment;->parentNode:Lcom/streambundlehtml/nodes/Node;

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_26

    :cond_20
    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->outline()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 42
    :cond_26
    invoke-virtual {p0, p1, p2, p3}, Lcom/streambundlehtml/nodes/Comment;->indent(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 43
    :cond_29
    nop

    .line 44
    const-string v0, "<!--"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    .line 45
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->getData()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    .line 46
    const-string v1, "-->"

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 47
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 50
    return-void
.end method

.method public bridge synthetic removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 13
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public setData(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Comment;
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .line 35
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Comment;->coreValue(Ljava/lang/String;)V

    .line 36
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 54
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Comment;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
