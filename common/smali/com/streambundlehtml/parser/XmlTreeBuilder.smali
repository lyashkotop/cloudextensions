.class public Lcom/streambundlehtml/parser/XmlTreeBuilder;
.super Lcom/streambundlehtml/parser/TreeBuilder;
.source "XmlTreeBuilder.java"


# static fields
.field private static final maxQueueDepth:I = 0x100


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Lcom/streambundlehtml/parser/TreeBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method defaultSettings()Lcom/streambundlehtml/parser/ParseSettings;
    .registers 2

    .line 28
    sget-object v0, Lcom/streambundlehtml/parser/ParseSettings;->preserveCase:Lcom/streambundlehtml/parser/ParseSettings;

    return-object v0
.end method

.method protected initialiseParse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)V
    .registers 6
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation runtime Ljavax/annotation/ParametersAreNonnullByDefault;
    .end annotation

    .line 33
    invoke-super {p0, p1, p2, p3}, Lcom/streambundlehtml/parser/TreeBuilder;->initialiseParse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)V

    .line 34
    iget-object v0, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    iget-object v0, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->xml:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    .line 36
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax(Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;)Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->xhtml:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    .line 37
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->escapeMode(Lcom/streambundlehtml/nodes/Entities$EscapeMode;)Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v0

    .line 38
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint(Z)Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 39
    return-void
.end method

.method insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;
    .registers 6
    .param p1, "startTag"    # Lcom/streambundlehtml/parser/Token$StartTag;

    .line 92
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    .line 94
    .local v0, "tag":Lcom/streambundlehtml/parser/Tag;
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttributes()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 95
    iget-object v1, p1, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v2, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Attributes;->deduplicate(Lcom/streambundlehtml/parser/ParseSettings;)I

    .line 97
    :cond_17
    new-instance v1, Lcom/streambundlehtml/nodes/Element;

    iget-object v2, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    iget-object v3, p1, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeAttributes(Lcom/streambundlehtml/nodes/Attributes;)Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 98
    .local v1, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0, v1, p1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 99
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 100
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isKnownTag()Z

    move-result v2

    if-nez v2, :cond_3d

    .line 101
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->setSelfClosing()Lcom/streambundlehtml/parser/Tag;

    goto :goto_3d

    .line 103
    :cond_38
    iget-object v2, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    :cond_3d
    :goto_3d
    return-object v1
.end method

.method insert(Lcom/streambundlehtml/parser/Token$Character;)V
    .registers 4
    .param p1, "token"    # Lcom/streambundlehtml/parser/Token$Character;

    .line 122
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Character;->isCData()Z

    move-result v1

    if-eqz v1, :cond_10

    new-instance v1, Lcom/streambundlehtml/nodes/CDataNode;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/nodes/CDataNode;-><init>(Ljava/lang/String;)V

    goto :goto_15

    :cond_10
    new-instance v1, Lcom/streambundlehtml/nodes/TextNode;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    :goto_15
    invoke-virtual {p0, v1, p1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 124
    return-void
.end method

.method insert(Lcom/streambundlehtml/parser/Token$Comment;)V
    .registers 5
    .param p1, "commentToken"    # Lcom/streambundlehtml/parser/Token$Comment;

    .line 109
    new-instance v0, Lcom/streambundlehtml/nodes/Comment;

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Comment;->getData()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/nodes/Comment;-><init>(Ljava/lang/String;)V

    .line 110
    .local v0, "comment":Lcom/streambundlehtml/nodes/Comment;
    move-object v1, v0

    .line 111
    .local v1, "insert":Lcom/streambundlehtml/nodes/Node;
    iget-boolean v2, p1, Lcom/streambundlehtml/parser/Token$Comment;->bogus:Z

    if-eqz v2, :cond_1b

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Comment;->isXmlDeclaration()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 114
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Comment;->asXmlDeclaration()Lcom/streambundlehtml/nodes/XmlDeclaration;

    move-result-object v2

    .line 115
    .local v2, "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    if-eqz v2, :cond_1b

    .line 116
    move-object v1, v2

    .line 118
    .end local v2    # "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    :cond_1b
    invoke-virtual {p0, v1, p1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 119
    return-void
.end method

.method insert(Lcom/streambundlehtml/parser/Token$Doctype;)V
    .registers 6
    .param p1, "d"    # Lcom/streambundlehtml/parser/Token$Doctype;

    .line 127
    new-instance v0, Lcom/streambundlehtml/nodes/DocumentType;

    iget-object v1, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Doctype;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Doctype;->getPublicIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Doctype;->getSystemIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/streambundlehtml/nodes/DocumentType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .local v0, "doctypeNode":Lcom/streambundlehtml/nodes/DocumentType;
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Doctype;->getPubSysKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/DocumentType;->setPubSysKey(Ljava/lang/String;)V

    .line 129
    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 130
    return-void
.end method

.method protected insertNode(Lcom/streambundlehtml/nodes/Node;)V
    .registers 3
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;

    .line 82
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->onNodeInserted(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 84
    return-void
.end method

.method protected insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V
    .registers 4
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "token"    # Lcom/streambundlehtml/parser/Token;

    .line 87
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 88
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->onNodeInserted(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 89
    return-void
.end method

.method bridge synthetic newInstance()Lcom/streambundlehtml/parser/TreeBuilder;
    .registers 2

    .line 26
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->newInstance()Lcom/streambundlehtml/parser/XmlTreeBuilder;

    move-result-object v0

    return-object v0
.end method

.method newInstance()Lcom/streambundlehtml/parser/XmlTreeBuilder;
    .registers 2

    .line 51
    new-instance v0, Lcom/streambundlehtml/parser/XmlTreeBuilder;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;-><init>()V

    return-object v0
.end method

.method parse(Ljava/io/Reader;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 4
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "baseUri"    # Ljava/lang/String;

    .line 42
    new-instance v0, Lcom/streambundlehtml/parser/Parser;

    invoke-direct {v0, p0}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    invoke-virtual {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->parse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 5
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;

    .line 46
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/streambundlehtml/parser/Parser;

    invoke-direct {v1, p0}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    invoke-virtual {p0, v0, p2, v1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->parse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;
    .registers 6
    .param p1, "inputFragment"    # Ljava/lang/String;
    .param p2, "context"    # Lcom/streambundlehtml/nodes/Element;
    .param p3, "baseUri"    # Ljava/lang/String;
    .param p4, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/nodes/Element;",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/parser/Parser;",
            ")",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 176
    invoke-virtual {p0, p1, p3, p4}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->parseFragment(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method parseFragment(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;
    .registers 5
    .param p1, "inputFragment"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/parser/Parser;",
            ")",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 170
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2, p3}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->initialiseParse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)V

    .line 171
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->runParser()V

    .line 172
    iget-object v0, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->childNodes()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected popStackToClose(Lcom/streambundlehtml/parser/Token$EndTag;)V
    .registers 9
    .param p1, "endTag"    # Lcom/streambundlehtml/parser/Token$EndTag;

    .line 140
    iget-object v0, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    iget-object v1, p1, Lcom/streambundlehtml/parser/Token$EndTag;->tagName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "elName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 143
    .local v1, "firstFound":Lcom/streambundlehtml/nodes/Element;
    iget-object v2, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 144
    .local v2, "bottom":I
    const/16 v3, 0x100

    if-lt v2, v3, :cond_18

    add-int/lit16 v3, v2, -0x100

    goto :goto_19

    :cond_18
    const/4 v3, 0x0

    .line 146
    .local v3, "upper":I
    :goto_19
    iget-object v4, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    .local v4, "pos":I
    :goto_21
    if-lt v4, v3, :cond_3a

    .line 147
    iget-object v5, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    .line 148
    .local v5, "next":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_37

    .line 149
    move-object v1, v5

    .line 150
    goto :goto_3a

    .line 146
    .end local v5    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_37
    add-int/lit8 v4, v4, -0x1

    goto :goto_21

    .line 153
    .end local v4    # "pos":I
    :cond_3a
    :goto_3a
    if-nez v1, :cond_3d

    .line 154
    return-void

    .line 156
    :cond_3d
    iget-object v4, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    .restart local v4    # "pos":I
    :goto_45
    if-ltz v4, :cond_5d

    .line 157
    iget-object v5, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    .line 158
    .restart local v5    # "next":Lcom/streambundlehtml/nodes/Element;
    iget-object v6, p0, Lcom/streambundlehtml/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 159
    if-ne v5, v1, :cond_5a

    .line 160
    invoke-virtual {p0, v5, p1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->onNodeClosed(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 161
    goto :goto_5d

    .line 156
    .end local v5    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_5a
    add-int/lit8 v4, v4, -0x1

    goto :goto_45

    .line 164
    .end local v4    # "pos":I
    :cond_5d
    :goto_5d
    return-void
.end method

.method protected process(Lcom/streambundlehtml/parser/Token;)Z
    .registers 4
    .param p1, "token"    # Lcom/streambundlehtml/parser/Token;

    .line 57
    sget-object v0, Lcom/streambundlehtml/parser/XmlTreeBuilder$1;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v1, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$TokenType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_52

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unexpected token type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->fail(Ljava/lang/String;)V

    goto :goto_4f

    .line 74
    :pswitch_26
    goto :goto_4f

    .line 71
    :pswitch_27
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asDoctype()Lcom/streambundlehtml/parser/Token$Doctype;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Doctype;)V

    .line 72
    goto :goto_4f

    .line 68
    :pswitch_2f
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    .line 69
    goto :goto_4f

    .line 65
    :pswitch_37
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    .line 66
    goto :goto_4f

    .line 62
    :pswitch_3f
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->popStackToClose(Lcom/streambundlehtml/parser/Token$EndTag;)V

    .line 63
    goto :goto_4f

    .line 59
    :pswitch_47
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 60
    nop

    .line 78
    :goto_4f
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_52
    .packed-switch 0x1
        :pswitch_47
        :pswitch_3f
        :pswitch_37
        :pswitch_2f
        :pswitch_27
        :pswitch_26
    .end packed-switch
.end method

.method public bridge synthetic processStartTag(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Z
    .registers 3

    .line 26
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/parser/TreeBuilder;->processStartTag(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Z

    move-result p1

    return p1
.end method
