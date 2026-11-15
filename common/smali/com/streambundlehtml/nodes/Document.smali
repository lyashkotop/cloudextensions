.class public Lcom/streambundlehtml/nodes/Document;
.super Lcom/streambundlehtml/nodes/Element;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/nodes/Document$OutputSettings;,
        Lcom/streambundlehtml/nodes/Document$QuirksMode;
    }
.end annotation


# static fields
.field private static final titleEval:Lcom/streambundlehtml/select/Evaluator;


# instance fields
.field private connection:Lcom/streambundlehtml/Connection;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final location:Ljava/lang/String;

.field private outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

.field private parser:Lcom/streambundlehtml/parser/Parser;

.field private quirksMode:Lcom/streambundlehtml/nodes/Document$QuirksMode;

.field private updateMetaCharset:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 184
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$Tag;

    const-string v1, "title"

    invoke-direct {v0, v1}, Lcom/streambundlehtml/select/Evaluator$Tag;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/streambundlehtml/nodes/Document;->titleEval:Lcom/streambundlehtml/select/Evaluator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "baseUri"    # Ljava/lang/String;

    .line 40
    const-string v0, "#root"

    sget-object v1, Lcom/streambundlehtml/parser/ParseSettings;->htmlDefault:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-static {v0, v1}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V

    .line 27
    new-instance v0, Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-direct {v0}, Lcom/streambundlehtml/nodes/Document$OutputSettings;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 29
    sget-object v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;->noQuirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Document;->quirksMode:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/nodes/Document;->updateMetaCharset:Z

    .line 41
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Document;->location:Ljava/lang/String;

    .line 42
    invoke-static {}, Lcom/streambundlehtml/parser/Parser;->htmlParser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Document;->parser:Lcom/streambundlehtml/parser/Parser;

    .line 43
    return-void
.end method

.method public static createShell(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 4
    .param p0, "baseUri"    # Ljava/lang/String;

    .line 51
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 53
    new-instance v0, Lcom/streambundlehtml/nodes/Document;

    invoke-direct {v0, p0}, Lcom/streambundlehtml/nodes/Document;-><init>(Ljava/lang/String;)V

    .line 54
    .local v0, "doc":Lcom/streambundlehtml/nodes/Document;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->parser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    iput-object v1, v0, Lcom/streambundlehtml/nodes/Document;->parser:Lcom/streambundlehtml/parser/Parser;

    .line 55
    const-string v1, "html"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Document;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 56
    .local v1, "html":Lcom/streambundlehtml/nodes/Element;
    const-string v2, "head"

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 57
    const-string v2, "body"

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 59
    return-object v0
.end method

.method private ensureMetaCharsetElement()V
    .registers 10

    .line 403
    iget-boolean v0, p0, Lcom/streambundlehtml/nodes/Document;->updateMetaCharset:Z

    if-eqz v0, :cond_b1

    .line 404
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    move-result-object v0

    .line 406
    .local v0, "syntax":Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;
    sget-object v1, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->html:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    if-ne v0, v1, :cond_45

    .line 407
    const-string v1, "meta[charset]"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 408
    .local v1, "metaCharset":Lcom/streambundlehtml/nodes/Element;
    const-string v2, "charset"

    if-eqz v1, :cond_26

    .line 409
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->charset()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/charset/Charset;->displayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_3b

    .line 411
    :cond_26
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    const-string v4, "meta"

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->charset()Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/charset/Charset;->displayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 413
    :goto_3b
    const-string v2, "meta[name=charset]"

    invoke-virtual {p0, v2}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/select/Elements;->remove()Lcom/streambundlehtml/select/Elements;

    .end local v1    # "metaCharset":Lcom/streambundlehtml/nodes/Element;
    goto :goto_b0

    .line 414
    :cond_45
    sget-object v1, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->xml:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    if-ne v0, v1, :cond_b0

    .line 415
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->ensureChildNodes()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Node;

    .line 416
    .local v1, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v3, v1, Lcom/streambundlehtml/nodes/XmlDeclaration;

    const-string v4, "encoding"

    const-string v5, "1.0"

    const-string v6, "xml"

    const-string v7, "version"

    if-eqz v3, :cond_99

    .line 417
    move-object v3, v1

    check-cast v3, Lcom/streambundlehtml/nodes/XmlDeclaration;

    .line 418
    .local v3, "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/XmlDeclaration;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_82

    .line 419
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->displayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/streambundlehtml/nodes/XmlDeclaration;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 420
    invoke-virtual {v3, v7}, Lcom/streambundlehtml/nodes/XmlDeclaration;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_98

    .line 421
    invoke-virtual {v3, v7, v5}, Lcom/streambundlehtml/nodes/XmlDeclaration;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    goto :goto_98

    .line 423
    :cond_82
    new-instance v8, Lcom/streambundlehtml/nodes/XmlDeclaration;

    invoke-direct {v8, v6, v2}, Lcom/streambundlehtml/nodes/XmlDeclaration;-><init>(Ljava/lang/String;Z)V

    .line 424
    .end local v3    # "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    .local v8, "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    invoke-virtual {v8, v7, v5}, Lcom/streambundlehtml/nodes/XmlDeclaration;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 425
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->displayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v4, v2}, Lcom/streambundlehtml/nodes/XmlDeclaration;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 426
    invoke-virtual {p0, v8}, Lcom/streambundlehtml/nodes/Document;->prependChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 428
    .end local v8    # "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    :cond_98
    :goto_98
    goto :goto_b1

    .line 429
    :cond_99
    new-instance v3, Lcom/streambundlehtml/nodes/XmlDeclaration;

    invoke-direct {v3, v6, v2}, Lcom/streambundlehtml/nodes/XmlDeclaration;-><init>(Ljava/lang/String;Z)V

    .line 430
    .restart local v3    # "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    invoke-virtual {v3, v7, v5}, Lcom/streambundlehtml/nodes/XmlDeclaration;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 431
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->displayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/streambundlehtml/nodes/XmlDeclaration;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 432
    invoke-virtual {p0, v3}, Lcom/streambundlehtml/nodes/Document;->prependChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_b1

    .line 414
    .end local v1    # "node":Lcom/streambundlehtml/nodes/Node;
    .end local v3    # "decl":Lcom/streambundlehtml/nodes/XmlDeclaration;
    :cond_b0
    :goto_b0
    nop

    .line 436
    .end local v0    # "syntax":Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;
    :cond_b1
    :goto_b1
    return-void
.end method

.method private htmlEl()Lcom/streambundlehtml/nodes/Element;
    .registers 5

    .line 105
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->childElementsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "html"

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 106
    .local v1, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 107
    return-object v1

    .line 108
    .end local v1    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_21
    goto :goto_8

    .line 109
    :cond_22
    invoke-virtual {p0, v2}, Lcom/streambundlehtml/nodes/Document;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method private normaliseStructure(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;)V
    .registers 9
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "htmlEl"    # Lcom/streambundlehtml/nodes/Element;

    .line 256
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Document;->getElementsByTag(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    .line 257
    .local v0, "elements":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->first()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 258
    .local v1, "master":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_42

    .line 259
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 260
    .local v2, "toMove":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_15
    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v4

    if-ge v3, v4, :cond_2e

    .line 261
    invoke-virtual {v0, v3}, Lcom/streambundlehtml/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/nodes/Node;

    .line 262
    .local v4, "dupe":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 263
    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Node;->remove()V

    .line 260
    .end local v4    # "dupe":Lcom/streambundlehtml/nodes/Node;
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 266
    .end local v3    # "i":I
    :cond_2e
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_32
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_42

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/nodes/Node;

    .line 267
    .restart local v4    # "dupe":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {v1, v4}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_32

    .line 270
    .end local v2    # "toMove":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    .end local v4    # "dupe":Lcom/streambundlehtml/nodes/Node;
    :cond_42
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    if-eqz v2, :cond_55

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/streambundlehtml/nodes/Element;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_55

    .line 271
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 273
    :cond_55
    return-void
.end method

.method private normaliseTextNodes(Lcom/streambundlehtml/nodes/Element;)V
    .registers 8
    .param p1, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 237
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 238
    .local v0, "toMove":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    iget-object v1, p1, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Node;

    .line 239
    .local v2, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v3, v2, Lcom/streambundlehtml/nodes/TextNode;

    if-eqz v3, :cond_27

    .line 240
    move-object v3, v2

    check-cast v3, Lcom/streambundlehtml/nodes/TextNode;

    .line 241
    .local v3, "tn":Lcom/streambundlehtml/nodes/TextNode;
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/TextNode;->isBlank()Z

    move-result v4

    if-nez v4, :cond_27

    .line 242
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    .end local v2    # "node":Lcom/streambundlehtml/nodes/Node;
    .end local v3    # "tn":Lcom/streambundlehtml/nodes/TextNode;
    :cond_27
    goto :goto_b

    .line 246
    :cond_28
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_2e
    if-ltz v1, :cond_51

    .line 247
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Node;

    .line 248
    .restart local v2    # "node":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {p1, v2}, Lcom/streambundlehtml/nodes/Element;->removeChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 249
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    new-instance v4, Lcom/streambundlehtml/nodes/TextNode;

    const-string v5, " "

    invoke-direct {v4, v5}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/nodes/Element;->prependChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 250
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/streambundlehtml/nodes/Element;->prependChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 246
    .end local v2    # "node":Lcom/streambundlehtml/nodes/Node;
    add-int/lit8 v1, v1, -0x1

    goto :goto_2e

    .line 252
    .end local v1    # "i":I
    :cond_51
    return-void
.end method


# virtual methods
.method public body()Lcom/streambundlehtml/nodes/Element;
    .registers 6

    .line 139
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/Document;->htmlEl()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 140
    .local v0, "html":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "body"

    if-eqz v2, :cond_32

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 141
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_31

    const-string v3, "frameset"

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_31

    .line 143
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    goto :goto_c

    .line 142
    .restart local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_31
    return-object v2

    .line 144
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_32
    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    return-object v1
.end method

.method public charset()Ljava/nio/charset/Charset;
    .registers 2

    .line 335
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset()Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0
.end method

.method public charset(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .line 321
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->updateMetaCharsetElement(Z)V

    .line 322
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset(Ljava/nio/charset/Charset;)Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 323
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/Document;->ensureMetaCharsetElement()V

    .line 324
    return-void
.end method

.method public clone()Lcom/streambundlehtml/nodes/Document;
    .registers 3

    .line 369
    invoke-super {p0}, Lcom/streambundlehtml/nodes/Element;->clone()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Document;

    .line 370
    .local v0, "clone":Lcom/streambundlehtml/nodes/Document;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->clone()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    iput-object v1, v0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 371
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Element;
    .registers 2

    .line 25
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->clone()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 25
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->clone()Lcom/streambundlehtml/nodes/Document;

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

    .line 25
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->clone()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public connection()Lcom/streambundlehtml/Connection;
    .registers 2

    .line 79
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->connection:Lcom/streambundlehtml/Connection;

    if-nez v0, :cond_9

    .line 80
    invoke-static {}, Lcom/streambundlehtml/Jsoup;->newSession()Lcom/streambundlehtml/Connection;

    move-result-object v0

    return-object v0

    .line 82
    :cond_9
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->connection:Lcom/streambundlehtml/Connection;

    return-object v0
.end method

.method public connection(Lcom/streambundlehtml/Connection;)Lcom/streambundlehtml/nodes/Document;
    .registers 2
    .param p1, "connection"    # Lcom/streambundlehtml/Connection;

    .line 702
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 703
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Document;->connection:Lcom/streambundlehtml/Connection;

    .line 704
    return-object p0
.end method

.method public createElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .line 205
    new-instance v0, Lcom/streambundlehtml/nodes/Element;

    sget-object v1, Lcom/streambundlehtml/parser/ParseSettings;->preserveCase:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-static {p1, v1}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v1

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V

    return-object v0
.end method

.method public documentType()Lcom/streambundlehtml/nodes/DocumentType;
    .registers 4
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Node;

    .line 91
    .local v1, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v2, v1, Lcom/streambundlehtml/nodes/DocumentType;

    if-eqz v2, :cond_1a

    .line 92
    move-object v0, v1

    check-cast v0, Lcom/streambundlehtml/nodes/DocumentType;

    return-object v0

    .line 93
    :cond_1a
    instance-of v2, v1, Lcom/streambundlehtml/nodes/LeafNode;

    if-nez v2, :cond_1f

    .line 94
    goto :goto_20

    .line 95
    .end local v1    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_1f
    goto :goto_6

    .line 96
    :cond_20
    :goto_20
    const/4 v0, 0x0

    return-object v0
.end method

.method public expectForm(Ljava/lang/String;)Lcom/streambundlehtml/nodes/FormElement;
    .registers 6
    .param p1, "cssQuery"    # Ljava/lang/String;

    .line 167
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    .line 168
    .local v0, "els":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 169
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    instance-of v3, v2, Lcom/streambundlehtml/nodes/FormElement;

    if-eqz v3, :cond_1c

    move-object v1, v2

    check-cast v1, Lcom/streambundlehtml/nodes/FormElement;

    return-object v1

    .line 170
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_1c
    goto :goto_8

    .line 171
    :cond_1d
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "No form elements matched the query \'%s\' in the document."

    invoke-static {v2, v1}, Lcom/streambundlehtml/helper/Validate;->fail(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 172
    const/4 v1, 0x0

    return-object v1
.end method

.method public forms()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/FormElement;",
            ">;"
        }
    .end annotation

    .line 155
    const-string v0, "form"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->forms()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public head()Lcom/streambundlehtml/nodes/Element;
    .registers 6

    .line 121
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/Document;->htmlEl()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 122
    .local v0, "html":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "head"

    if-eqz v2, :cond_26

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 123
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 124
    return-object v2

    .line 125
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_25
    goto :goto_c

    .line 126
    :cond_26
    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Element;->prependElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    return-object v1
.end method

.method public location()Ljava/lang/String;
    .registers 2

    .line 69
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->location:Ljava/lang/String;

    return-object v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .line 293
    const-string v0, "#document"

    return-object v0
.end method

.method public normalise()Lcom/streambundlehtml/nodes/Document;
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 217
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/Document;->htmlEl()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 218
    .local v0, "htmlEl":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 219
    .local v1, "head":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    .line 223
    invoke-direct {p0, v1}, Lcom/streambundlehtml/nodes/Document;->normaliseTextNodes(Lcom/streambundlehtml/nodes/Element;)V

    .line 224
    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Document;->normaliseTextNodes(Lcom/streambundlehtml/nodes/Element;)V

    .line 225
    invoke-direct {p0, p0}, Lcom/streambundlehtml/nodes/Document;->normaliseTextNodes(Lcom/streambundlehtml/nodes/Element;)V

    .line 227
    const-string v2, "head"

    invoke-direct {p0, v2, v0}, Lcom/streambundlehtml/nodes/Document;->normaliseStructure(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;)V

    .line 228
    const-string v2, "body"

    invoke-direct {p0, v2, v0}, Lcom/streambundlehtml/nodes/Document;->normaliseStructure(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;)V

    .line 230
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/Document;->ensureMetaCharsetElement()V

    .line 232
    return-object p0
.end method

.method public outerHtml()Ljava/lang/String;
    .registers 2

    .line 277
    invoke-super {p0}, Lcom/streambundlehtml/nodes/Element;->html()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 2

    .line 646
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    return-object v0
.end method

.method public outputSettings(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Lcom/streambundlehtml/nodes/Document;
    .registers 2
    .param p1, "outputSettings"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 655
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 656
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 657
    return-object p0
.end method

.method public parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;
    .registers 2
    .param p1, "parser"    # Lcom/streambundlehtml/parser/Parser;

    .line 688
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Document;->parser:Lcom/streambundlehtml/parser/Parser;

    .line 689
    return-object p0
.end method

.method public parser()Lcom/streambundlehtml/parser/Parser;
    .registers 2

    .line 678
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->parser:Lcom/streambundlehtml/parser/Parser;

    return-object v0
.end method

.method public quirksMode()Lcom/streambundlehtml/nodes/Document$QuirksMode;
    .registers 2

    .line 665
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document;->quirksMode:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    return-object v0
.end method

.method public quirksMode(Lcom/streambundlehtml/nodes/Document$QuirksMode;)Lcom/streambundlehtml/nodes/Document;
    .registers 2
    .param p1, "quirksMode"    # Lcom/streambundlehtml/nodes/Document$QuirksMode;

    .line 669
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Document;->quirksMode:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    .line 670
    return-object p0
.end method

.method public shallowClone()Lcom/streambundlehtml/nodes/Document;
    .registers 3

    .line 376
    new-instance v0, Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/nodes/Document;-><init>(Ljava/lang/String;)V

    .line 377
    .local v0, "clone":Lcom/streambundlehtml/nodes/Document;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Document;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v1, :cond_15

    .line 378
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Document;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Attributes;->clone()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v1

    iput-object v1, v0, Lcom/streambundlehtml/nodes/Document;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 379
    :cond_15
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->clone()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    iput-object v1, v0, Lcom/streambundlehtml/nodes/Document;->outputSettings:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 380
    return-object v0
.end method

.method public bridge synthetic shallowClone()Lcom/streambundlehtml/nodes/Element;
    .registers 2

    .line 25
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->shallowClone()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic shallowClone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 25
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->shallowClone()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .line 287
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Element;->text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 288
    return-object p0
.end method

.method public title()Ljava/lang/String;
    .registers 3

    .line 181
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/nodes/Document;->titleEval:Lcom/streambundlehtml/select/Evaluator;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Lcom/streambundlehtml/select/Evaluator;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 182
    .local v0, "titleEl":Lcom/streambundlehtml/nodes/Element;
    if-eqz v0, :cond_19

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundlehtml/internal/StringUtil;->normaliseWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_1b

    :cond_19
    const-string v1, ""

    :goto_1b
    return-object v1
.end method

.method public title(Ljava/lang/String;)V
    .registers 5
    .param p1, "title"    # Ljava/lang/String;

    .line 192
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 193
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/nodes/Document;->titleEval:Lcom/streambundlehtml/select/Evaluator;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Lcom/streambundlehtml/select/Evaluator;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 194
    .local v0, "titleEl":Lcom/streambundlehtml/nodes/Element;
    if-nez v0, :cond_19

    .line 195
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    const-string v2, "title"

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 196
    :cond_19
    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Element;->text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 197
    return-void
.end method

.method public updateMetaCharsetElement(Z)V
    .registers 2
    .param p1, "update"    # Z

    .line 352
    iput-boolean p1, p0, Lcom/streambundlehtml/nodes/Document;->updateMetaCharset:Z

    .line 353
    return-void
.end method

.method public updateMetaCharsetElement()Z
    .registers 2

    .line 364
    iget-boolean v0, p0, Lcom/streambundlehtml/nodes/Document;->updateMetaCharset:Z

    return v0
.end method
