.class public Lcom/streambundlehtml/safety/Cleaner;
.super Ljava/lang/Object;
.source "Cleaner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/safety/Cleaner$ElementMeta;,
        Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;
    }
.end annotation


# instance fields
.field private final safelist:Lcom/streambundlehtml/safety/Safelist;


# direct methods
.method public constructor <init>(Lcom/streambundlehtml/safety/Safelist;)V
    .registers 2
    .param p1, "safelist"    # Lcom/streambundlehtml/safety/Safelist;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 44
    iput-object p1, p0, Lcom/streambundlehtml/safety/Cleaner;->safelist:Lcom/streambundlehtml/safety/Safelist;

    .line 45
    return-void
.end method

.method static synthetic access$000(Lcom/streambundlehtml/safety/Cleaner;)Lcom/streambundlehtml/safety/Safelist;
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/safety/Cleaner;

    .line 35
    iget-object v0, p0, Lcom/streambundlehtml/safety/Cleaner;->safelist:Lcom/streambundlehtml/safety/Safelist;

    return-object v0
.end method

.method static synthetic access$100(Lcom/streambundlehtml/safety/Cleaner;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/safety/Cleaner$ElementMeta;
    .registers 3
    .param p0, "x0"    # Lcom/streambundlehtml/safety/Cleaner;
    .param p1, "x1"    # Lcom/streambundlehtml/nodes/Element;

    .line 35
    invoke-direct {p0, p1}, Lcom/streambundlehtml/safety/Cleaner;->createSafeElement(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/safety/Cleaner$ElementMeta;

    move-result-object v0

    return-object v0
.end method

.method private copySafeNodes(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)I
    .registers 5
    .param p1, "source"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "dest"    # Lcom/streambundlehtml/nodes/Element;

    .line 174
    new-instance v0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;-><init>(Lcom/streambundlehtml/safety/Cleaner;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/safety/Cleaner$1;)V

    .line 175
    .local v0, "cleaningVisitor":Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;
    invoke-static {v0, p1}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 176
    # getter for: Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I
    invoke-static {v0}, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->access$300(Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;)I

    move-result v1

    return v1
.end method

.method private createSafeElement(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/safety/Cleaner$ElementMeta;
    .registers 10
    .param p1, "sourceEl"    # Lcom/streambundlehtml/nodes/Element;

    .line 180
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "sourceTag":Ljava/lang/String;
    new-instance v1, Lcom/streambundlehtml/nodes/Attributes;

    invoke-direct {v1}, Lcom/streambundlehtml/nodes/Attributes;-><init>()V

    .line 182
    .local v1, "destAttrs":Lcom/streambundlehtml/nodes/Attributes;
    new-instance v2, Lcom/streambundlehtml/nodes/Element;

    invoke-static {v0}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v3

    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 183
    .local v2, "dest":Lcom/streambundlehtml/nodes/Element;
    const/4 v3, 0x0

    .line 185
    .local v3, "numDiscarded":I
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v4

    .line 186
    .local v4, "sourceAttrs":Lcom/streambundlehtml/nodes/Attributes;
    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/nodes/Attribute;

    .line 187
    .local v6, "sourceAttr":Lcom/streambundlehtml/nodes/Attribute;
    iget-object v7, p0, Lcom/streambundlehtml/safety/Cleaner;->safelist:Lcom/streambundlehtml/safety/Safelist;

    invoke-virtual {v7, v0, p1, v6}, Lcom/streambundlehtml/safety/Safelist;->isSafeAttribute(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Attribute;)Z

    move-result v7

    if-eqz v7, :cond_37

    .line 188
    invoke-virtual {v1, v6}, Lcom/streambundlehtml/nodes/Attributes;->put(Lcom/streambundlehtml/nodes/Attribute;)Lcom/streambundlehtml/nodes/Attributes;

    goto :goto_39

    .line 190
    :cond_37
    add-int/lit8 v3, v3, 0x1

    .line 191
    .end local v6    # "sourceAttr":Lcom/streambundlehtml/nodes/Attribute;
    :goto_39
    goto :goto_1f

    .line 192
    :cond_3a
    iget-object v5, p0, Lcom/streambundlehtml/safety/Cleaner;->safelist:Lcom/streambundlehtml/safety/Safelist;

    invoke-virtual {v5, v0}, Lcom/streambundlehtml/safety/Safelist;->getEnforcedAttributes(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v5

    .line 193
    .local v5, "enforcedAttrs":Lcom/streambundlehtml/nodes/Attributes;
    invoke-virtual {v1, v5}, Lcom/streambundlehtml/nodes/Attributes;->addAll(Lcom/streambundlehtml/nodes/Attributes;)V

    .line 197
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->sourceRange()Lcom/streambundlehtml/nodes/Range;

    move-result-object v6

    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Range;->isTracked()Z

    move-result v6

    if-eqz v6, :cond_55

    .line 198
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->sourceRange()Lcom/streambundlehtml/nodes/Range;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v2, v7}, Lcom/streambundlehtml/nodes/Range;->track(Lcom/streambundlehtml/nodes/Node;Z)V

    .line 199
    :cond_55
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->endSourceRange()Lcom/streambundlehtml/nodes/Range;

    move-result-object v6

    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Range;->isTracked()Z

    move-result v6

    if-eqz v6, :cond_67

    .line 200
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->endSourceRange()Lcom/streambundlehtml/nodes/Range;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v2, v7}, Lcom/streambundlehtml/nodes/Range;->track(Lcom/streambundlehtml/nodes/Node;Z)V

    .line 202
    :cond_67
    new-instance v6, Lcom/streambundlehtml/safety/Cleaner$ElementMeta;

    invoke-direct {v6, v2, v3}, Lcom/streambundlehtml/safety/Cleaner$ElementMeta;-><init>(Lcom/streambundlehtml/nodes/Element;I)V

    return-object v6
.end method


# virtual methods
.method public clean(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;
    .registers 5
    .param p1, "dirtyDocument"    # Lcom/streambundlehtml/nodes/Document;

    .line 55
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 57
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/nodes/Document;->createShell(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 58
    .local v0, "clean":Lcom/streambundlehtml/nodes/Document;
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/streambundlehtml/safety/Cleaner;->copySafeNodes(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)I

    .line 59
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->clone()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Document;->outputSettings(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Lcom/streambundlehtml/nodes/Document;

    .line 61
    return-object v0
.end method

.method public isValid(Lcom/streambundlehtml/nodes/Document;)Z
    .registers 5
    .param p1, "dirtyDocument"    # Lcom/streambundlehtml/nodes/Document;

    .line 87
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 89
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/nodes/Document;->createShell(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 90
    .local v0, "clean":Lcom/streambundlehtml/nodes/Document;
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/streambundlehtml/safety/Cleaner;->copySafeNodes(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)I

    move-result v1

    .line 91
    .local v1, "numDiscarded":I
    if-nez v1, :cond_29

    .line 92
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_29

    const/4 v2, 0x1

    goto :goto_2a

    :cond_29
    const/4 v2, 0x0

    .line 91
    :goto_2a
    return v2
.end method

.method public isValidBodyHtml(Ljava/lang/String;)Z
    .registers 10
    .param p1, "bodyHtml"    # Ljava/lang/String;

    .line 117
    const-string v0, ""

    invoke-static {v0}, Lcom/streambundlehtml/nodes/Document;->createShell(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v1

    .line 118
    .local v1, "clean":Lcom/streambundlehtml/nodes/Document;
    invoke-static {v0}, Lcom/streambundlehtml/nodes/Document;->createShell(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v2

    .line 119
    .local v2, "dirty":Lcom/streambundlehtml/nodes/Document;
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/streambundlehtml/parser/ParseErrorList;->tracking(I)Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v4

    .line 120
    .local v4, "errorList":Lcom/streambundlehtml/parser/ParseErrorList;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    invoke-static {p1, v5, v0, v4}, Lcom/streambundlehtml/parser/Parser;->parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;Lcom/streambundlehtml/parser/ParseErrorList;)Ljava/util/List;

    move-result-object v0

    .line 121
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v0}, Lcom/streambundlehtml/nodes/Element;->insertChildren(ILjava/util/Collection;)Lcom/streambundlehtml/nodes/Element;

    .line 122
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v7

    invoke-direct {p0, v5, v7}, Lcom/streambundlehtml/safety/Cleaner;->copySafeNodes(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)I

    move-result v5

    .line 123
    .local v5, "numDiscarded":I
    if-nez v5, :cond_34

    invoke-virtual {v4}, Lcom/streambundlehtml/parser/ParseErrorList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_34

    goto :goto_35

    :cond_34
    const/4 v3, 0x0

    :goto_35
    return v3
.end method
