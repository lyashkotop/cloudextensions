.class final Lcom/streambundlehtml/nodes/NodeUtils;
.super Ljava/lang/Object;
.source "NodeUtils.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static outputSettings(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 4
    .param p0, "node"    # Lcom/streambundlehtml/nodes/Node;

    .line 22
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 23
    .local v0, "owner":Lcom/streambundlehtml/nodes/Document;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    goto :goto_16

    :cond_b
    new-instance v1, Lcom/streambundlehtml/nodes/Document;

    const-string v2, ""

    invoke-direct {v1, v2}, Lcom/streambundlehtml/nodes/Document;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    :goto_16
    return-object v1
.end method

.method static parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;
    .registers 4
    .param p0, "node"    # Lcom/streambundlehtml/nodes/Node;

    .line 30
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 31
    .local v0, "doc":Lcom/streambundlehtml/nodes/Document;
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->parser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    if-eqz v1, :cond_11

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->parser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    goto :goto_1b

    :cond_11
    new-instance v1, Lcom/streambundlehtml/parser/Parser;

    new-instance v2, Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    invoke-direct {v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;-><init>()V

    invoke-direct {v1, v2}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    :goto_1b
    return-object v1
.end method

.method static selectXpath(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/Class;)Ljava/util/List;
    .registers 8
    .param p0, "xpath"    # Ljava/lang/String;
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/streambundlehtml/nodes/Node;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/nodes/Element;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 41
    .local p2, "nodeType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 42
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 43
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 45
    new-instance v0, Lcom/streambundlehtml/helper/W3CDom;

    invoke-direct {v0}, Lcom/streambundlehtml/helper/W3CDom;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/helper/W3CDom;->namespaceAware(Z)Lcom/streambundlehtml/helper/W3CDom;

    move-result-object v0

    .line 46
    .local v0, "w3c":Lcom/streambundlehtml/helper/W3CDom;
    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/W3CDom;->fromJsoup(Lcom/streambundlehtml/nodes/Element;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 47
    .local v1, "wDoc":Lorg/w3c/dom/Document;
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/helper/W3CDom;->contextNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 48
    .local v2, "contextNode":Lorg/w3c/dom/Node;
    invoke-virtual {v0, p0, v2}, Lcom/streambundlehtml/helper/W3CDom;->selectXpath(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 49
    .local v3, "nodeList":Lorg/w3c/dom/NodeList;
    invoke-virtual {v0, v3, p2}, Lcom/streambundlehtml/helper/W3CDom;->sourceNodes(Lorg/w3c/dom/NodeList;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    return-object v4
.end method
