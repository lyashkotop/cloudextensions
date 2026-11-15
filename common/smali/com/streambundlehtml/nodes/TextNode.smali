.class public Lcom/streambundlehtml/nodes/TextNode;
.super Lcom/streambundlehtml/nodes/LeafNode;
.source "TextNode.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .line 19
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/streambundlehtml/nodes/TextNode;->value:Ljava/lang/Object;

    .line 21
    return-void
.end method

.method public static createFromEncoded(Ljava/lang/String;)Lcom/streambundlehtml/nodes/TextNode;
    .registers 3
    .param p0, "encodedText"    # Ljava/lang/String;

    .line 135
    invoke-static {p0}, Lcom/streambundlehtml/nodes/Entities;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Lcom/streambundlehtml/nodes/TextNode;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method static lastCharIsWhitespace(Ljava/lang/StringBuilder;)Z
    .registers 4
    .param p0, "sb"    # Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    const/16 v2, 0x20

    if-ne v0, v2, :cond_15

    goto :goto_16

    :cond_15
    const/4 v1, 0x0

    :goto_16
    return v1
.end method

.method static normaliseWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 1
    .param p0, "text"    # Ljava/lang/String;

    .line 140
    invoke-static {p0}, Lcom/streambundlehtml/internal/StringUtil;->normaliseWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 141
    return-object p0
.end method

.method static stripLeadingWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .line 145
    const-string v0, "^\\s+"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
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
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->clone()Lcom/streambundlehtml/nodes/TextNode;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/streambundlehtml/nodes/TextNode;
    .registers 2

    .line 126
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->clone()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/TextNode;

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
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->clone()Lcom/streambundlehtml/nodes/TextNode;

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

.method public getWholeText()Ljava/lang/String;
    .registers 2

    .line 51
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->coreValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasAttr(Ljava/lang/String;)Z
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttr(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public isBlank()Z
    .registers 2

    .line 59
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->coreValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .line 24
    const-string v0, "#text"

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 18
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    invoke-virtual/range {p3 .. p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    .line 86
    .local v0, "prettyPrint":Z
    iget-object v1, p0, Lcom/streambundlehtml/nodes/TextNode;->parentNode:Lcom/streambundlehtml/nodes/Node;

    instance-of v1, v1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/streambundlehtml/nodes/TextNode;->parentNode:Lcom/streambundlehtml/nodes/Node;

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    .line 87
    .local v1, "parent":Lcom/streambundlehtml/nodes/Element;
    :goto_10
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_1e

    iget-object v4, p0, Lcom/streambundlehtml/nodes/TextNode;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-static {v4}, Lcom/streambundlehtml/nodes/Element;->preserveWhitespace(Lcom/streambundlehtml/nodes/Node;)Z

    move-result v4

    if-nez v4, :cond_1e

    const/4 v4, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v4, 0x0

    :goto_1f
    move v9, v4

    .line 88
    .local v9, "normaliseWhite":Z
    if-eqz v1, :cond_38

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v4

    invoke-virtual {v4}, Lcom/streambundlehtml/parser/Tag;->isBlock()Z

    move-result v4

    if-nez v4, :cond_36

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v4

    invoke-virtual {v4}, Lcom/streambundlehtml/parser/Tag;->formatAsBlock()Z

    move-result v4

    if-eqz v4, :cond_38

    :cond_36
    const/4 v4, 0x1

    goto :goto_39

    :cond_38
    const/4 v4, 0x0

    .line 89
    .local v4, "trimLikeBlock":Z
    :goto_39
    const/4 v5, 0x0

    .local v5, "trimLeading":Z
    const/4 v6, 0x0

    .line 91
    .local v6, "trimTrailing":Z
    if-eqz v9, :cond_d7

    .line 92
    if-eqz v4, :cond_43

    iget v7, p0, Lcom/streambundlehtml/nodes/TextNode;->siblingIndex:I

    if-eqz v7, :cond_49

    :cond_43
    iget-object v7, p0, Lcom/streambundlehtml/nodes/TextNode;->parentNode:Lcom/streambundlehtml/nodes/Node;

    instance-of v7, v7, Lcom/streambundlehtml/nodes/Document;

    if-eqz v7, :cond_4b

    :cond_49
    const/4 v7, 0x1

    goto :goto_4c

    :cond_4b
    const/4 v7, 0x0

    :goto_4c
    move v5, v7

    .line 93
    if-eqz v4, :cond_57

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->nextSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v7

    if-nez v7, :cond_57

    const/4 v7, 0x1

    goto :goto_58

    :cond_57
    const/4 v7, 0x0

    :goto_58
    move v6, v7

    .line 96
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->nextSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v7

    .line 97
    .local v7, "next":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->previousSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v8

    .line 98
    .local v8, "prev":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->isBlank()Z

    move-result v10

    .line 99
    .local v10, "isBlank":Z
    instance-of v11, v7, Lcom/streambundlehtml/nodes/Element;

    const-string v12, "br"

    if-eqz v11, :cond_77

    move-object v11, v7

    check-cast v11, Lcom/streambundlehtml/nodes/Element;

    move-object/from16 v13, p3

    invoke-virtual {v11, v13}, Lcom/streambundlehtml/nodes/Element;->shouldIndent(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z

    move-result v11

    if-nez v11, :cond_9a

    goto :goto_79

    :cond_77
    move-object/from16 v13, p3

    :goto_79
    instance-of v11, v7, Lcom/streambundlehtml/nodes/TextNode;

    if-eqz v11, :cond_86

    move-object v11, v7

    check-cast v11, Lcom/streambundlehtml/nodes/TextNode;

    .line 100
    invoke-virtual {v11}, Lcom/streambundlehtml/nodes/TextNode;->isBlank()Z

    move-result v11

    if-nez v11, :cond_9a

    :cond_86
    instance-of v11, v8, Lcom/streambundlehtml/nodes/Element;

    if-eqz v11, :cond_9b

    move-object v11, v8

    check-cast v11, Lcom/streambundlehtml/nodes/Element;

    .line 101
    invoke-virtual {v11}, Lcom/streambundlehtml/nodes/Element;->isBlock()Z

    move-result v11

    if-nez v11, :cond_9a

    invoke-virtual {v8, v12}, Lcom/streambundlehtml/nodes/Node;->isNode(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_9a

    goto :goto_9b

    :cond_9a
    goto :goto_9c

    :cond_9b
    :goto_9b
    const/4 v2, 0x0

    .line 103
    .local v2, "couldSkip":Z
    :goto_9c
    if-eqz v2, :cond_a1

    if-eqz v10, :cond_a1

    return-void

    .line 105
    :cond_a1
    iget v3, p0, Lcom/streambundlehtml/nodes/TextNode;->siblingIndex:I

    if-nez v3, :cond_b4

    if-eqz v1, :cond_b4

    .line 106
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v3

    invoke-virtual {v3}, Lcom/streambundlehtml/parser/Tag;->formatAsBlock()Z

    move-result v3

    if-eqz v3, :cond_b4

    if-nez v10, :cond_b4

    goto :goto_d1

    .line 107
    :cond_b4
    invoke-virtual {v13}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->outline()Z

    move-result v3

    if-eqz v3, :cond_c7

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->siblingNodes()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_c7

    if-nez v10, :cond_c7

    goto :goto_d1

    :cond_c7
    iget v3, p0, Lcom/streambundlehtml/nodes/TextNode;->siblingIndex:I

    if-lez v3, :cond_d4

    .line 108
    invoke-static {v8, v12}, Lcom/streambundlehtml/nodes/TextNode;->isNode(Lcom/streambundlehtml/nodes/Node;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d4

    .line 110
    :goto_d1
    invoke-virtual/range {p0 .. p3}, Lcom/streambundlehtml/nodes/TextNode;->indent(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 113
    .end local v2    # "couldSkip":Z
    .end local v7    # "next":Lcom/streambundlehtml/nodes/Node;
    .end local v8    # "prev":Lcom/streambundlehtml/nodes/Node;
    .end local v10    # "isBlank":Z
    :cond_d4
    move v10, v5

    move v11, v6

    goto :goto_db

    .line 91
    :cond_d7
    move-object/from16 v13, p3

    move v10, v5

    move v11, v6

    .line 113
    .end local v5    # "trimLeading":Z
    .end local v6    # "trimTrailing":Z
    .local v10, "trimLeading":Z
    .local v11, "trimTrailing":Z
    :goto_db
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->coreValue()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    move-object v5, p1

    move-object v7, v13

    invoke-static/range {v5 .. v11}, Lcom/streambundlehtml/nodes/Entities;->escape(Ljava/lang/Appendable;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;ZZZZ)V

    .line 114
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    return-void
.end method

.method public bridge synthetic removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public splitText(I)Lcom/streambundlehtml/nodes/TextNode;
    .registers 10
    .param p1, "offset"    # I

    .line 69
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->coreValue()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "text":Ljava/lang/String;
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ltz p1, :cond_a

    const/4 v3, 0x1

    goto :goto_b

    :cond_a
    const/4 v3, 0x0

    :goto_b
    const-string v4, "Split offset must be not be negative"

    invoke-static {v3, v4}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 71
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge p1, v3, :cond_18

    const/4 v3, 0x1

    goto :goto_19

    :cond_18
    const/4 v3, 0x0

    :goto_19
    const-string v4, "Split offset must not be greater than current text length"

    invoke-static {v3, v4}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 73
    invoke-virtual {v0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 74
    .local v3, "head":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 75
    .local v4, "tail":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/streambundlehtml/nodes/TextNode;->text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/TextNode;

    .line 76
    new-instance v5, Lcom/streambundlehtml/nodes/TextNode;

    invoke-direct {v5, v4}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    .line 77
    .local v5, "tailNode":Lcom/streambundlehtml/nodes/TextNode;
    iget-object v6, p0, Lcom/streambundlehtml/nodes/TextNode;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-eqz v6, :cond_40

    .line 78
    iget-object v6, p0, Lcom/streambundlehtml/nodes/TextNode;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->siblingIndex()I

    move-result v7

    add-int/2addr v7, v1

    new-array v1, v1, [Lcom/streambundlehtml/nodes/Node;

    aput-object v5, v1, v2

    invoke-virtual {v6, v7, v1}, Lcom/streambundlehtml/nodes/Node;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 80
    :cond_40
    return-object v5
.end method

.method public text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/TextNode;
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .line 42
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/TextNode;->coreValue(Ljava/lang/String;)V

    .line 43
    return-object p0
.end method

.method public text()Ljava/lang/String;
    .registers 2

    .line 33
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->getWholeText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->normaliseWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 121
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/TextNode;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
