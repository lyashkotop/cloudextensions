.class public Lcom/streambundlehtml/helper/W3CDom;
.super Ljava/lang/Object;
.source "W3CDom.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;
    }
.end annotation


# static fields
.field private static final ContextNodeProperty:Ljava/lang/String; = "jsoupContextNode"

.field private static final ContextProperty:Ljava/lang/String; = "jsoupContextSource"

.field public static final SourceProperty:Ljava/lang/String; = "jsoupSource"

.field public static final XPathFactoryProperty:Ljava/lang/String; = "javax.xml.xpath.XPathFactory:jsoup"


# instance fields
.field protected factory:Ljavax/xml/parsers/DocumentBuilderFactory;

.field private namespaceAware:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/W3CDom;->namespaceAware:Z

    .line 65
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/helper/W3CDom;->factory:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 66
    iget-object v1, p0, Lcom/streambundlehtml/helper/W3CDom;->factory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v1, v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 67
    return-void
.end method

.method public static OutputHtml()Ljava/util/HashMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 158
    const-string v0, "html"

    invoke-static {v0}, Lcom/streambundlehtml/helper/W3CDom;->methodMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public static OutputXml()Ljava/util/HashMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 163
    const-string v0, "xml"

    invoke-static {v0}, Lcom/streambundlehtml/helper/W3CDom;->methodMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public static asString(Lorg/w3c/dom/Document;Ljava/util/Map;)Ljava/lang/String;
    .registers 11
    .param p0, "doc"    # Lorg/w3c/dom/Document;
    .param p1    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Document;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 121
    .local p1, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v0, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v0, p0}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 122
    .local v0, "domSource":Ljavax/xml/transform/dom/DOMSource;
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 123
    .local v1, "writer":Ljava/io/StringWriter;
    new-instance v2, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v2, v1}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 124
    .local v2, "result":Ljavax/xml/transform/stream/StreamResult;
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    .line 125
    .local v3, "tf":Ljavax/xml/transform/TransformerFactory;
    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v4

    .line 126
    .local v4, "transformer":Ljavax/xml/transform/Transformer;
    if-eqz p1, :cond_20

    .line 127
    invoke-static {p1}, Lcom/streambundlehtml/helper/W3CDom;->propertiesFromMap(Ljava/util/Map;)Ljava/util/Properties;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavax/xml/transform/Transformer;->setOutputProperties(Ljava/util/Properties;)V

    .line 129
    :cond_20
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDoctype()Lorg/w3c/dom/DocumentType;

    move-result-object v5

    if-eqz v5, :cond_76

    .line 130
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDoctype()Lorg/w3c/dom/DocumentType;

    move-result-object v5

    .line 131
    .local v5, "doctype":Lorg/w3c/dom/DocumentType;
    invoke-interface {v5}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3d

    .line 132
    const-string v6, "doctype-public"

    invoke-interface {v5}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    :cond_3d
    invoke-interface {v5}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v6
    :try_end_45
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_45} :catch_7e

    const-string v7, "doctype-system"

    if-nez v6, :cond_51

    .line 134
    :try_start_49
    invoke-interface {v5}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v7, v6}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_76

    .line 136
    :cond_51
    invoke-interface {v5}, Lorg/w3c/dom/DocumentType;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v8, "html"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_76

    .line 137
    invoke-interface {v5}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_76

    .line 138
    invoke-interface {v5}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_76

    .line 139
    const-string v6, "about:legacy-compat"

    invoke-virtual {v4, v7, v6}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .end local v5    # "doctype":Lorg/w3c/dom/DocumentType;
    :cond_76
    :goto_76
    invoke-virtual {v4, v0, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 143
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_7d
    .catch Ljavax/xml/transform/TransformerException; {:try_start_49 .. :try_end_7d} :catch_7e

    return-object v5

    .line 145
    .end local v0    # "domSource":Ljavax/xml/transform/dom/DOMSource;
    .end local v1    # "writer":Ljava/io/StringWriter;
    .end local v2    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v3    # "tf":Ljavax/xml/transform/TransformerFactory;
    .end local v4    # "transformer":Ljavax/xml/transform/Transformer;
    :catch_7e
    move-exception v0

    .line 146
    .local v0, "e":Ljavax/xml/transform/TransformerException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static convert(Lcom/streambundlehtml/nodes/Document;)Lorg/w3c/dom/Document;
    .registers 2
    .param p0, "in"    # Lcom/streambundlehtml/nodes/Document;

    .line 96
    new-instance v0, Lcom/streambundlehtml/helper/W3CDom;

    invoke-direct {v0}, Lcom/streambundlehtml/helper/W3CDom;-><init>()V

    invoke-virtual {v0, p0}, Lcom/streambundlehtml/helper/W3CDom;->fromJsoup(Lcom/streambundlehtml/nodes/Document;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method private static methodMap(Ljava/lang/String;)Ljava/util/HashMap;
    .registers 3
    .param p0, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 167
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 168
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "method"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    return-object v0
.end method

.method static propertiesFromMap(Ljava/util/Map;)Ljava/util/Properties;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Properties;"
        }
    .end annotation

    .line 151
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 152
    .local v0, "props":Ljava/util/Properties;
    invoke-virtual {v0, p0}, Ljava/util/Properties;->putAll(Ljava/util/Map;)V

    .line 153
    return-object v0
.end method


# virtual methods
.method public asString(Lorg/w3c/dom/Document;)Ljava/lang/String;
    .registers 3
    .param p1, "doc"    # Lorg/w3c/dom/Document;

    .line 331
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/W3CDom;->asString(Lorg/w3c/dom/Document;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public contextNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;
    .registers 3
    .param p1, "wDoc"    # Lorg/w3c/dom/Document;

    .line 320
    const-string v0, "jsoupContextNode"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Document;->getUserData(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Node;

    return-object v0
.end method

.method public convert(Lcom/streambundlehtml/nodes/Document;Lorg/w3c/dom/Document;)V
    .registers 3
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Document;
    .param p2, "out"    # Lorg/w3c/dom/Document;

    .line 230
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/helper/W3CDom;->convert(Lcom/streambundlehtml/nodes/Element;Lorg/w3c/dom/Document;)V

    .line 231
    return-void
.end method

.method public convert(Lcom/streambundlehtml/nodes/Element;Lorg/w3c/dom/Document;)V
    .registers 6
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "out"    # Lorg/w3c/dom/Document;

    .line 242
    new-instance v0, Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;

    invoke-direct {v0, p2}, Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;-><init>(Lorg/w3c/dom/Document;)V

    .line 243
    .local v0, "builder":Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;
    iget-boolean v1, p0, Lcom/streambundlehtml/helper/W3CDom;->namespaceAware:Z

    # setter for: Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;->namespaceAware:Z
    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;->access$002(Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;Z)Z

    .line 244
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v1

    .line 245
    .local v1, "inDoc":Lcom/streambundlehtml/nodes/Document;
    if-eqz v1, :cond_2c

    .line 246
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->location()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_21

    .line 247
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->location()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v2}, Lorg/w3c/dom/Document;->setDocumentURI(Ljava/lang/String;)V

    .line 249
    :cond_21
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    move-result-object v2

    # setter for: Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;->syntax:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;
    invoke-static {v0, v2}, Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;->access$102(Lcom/streambundlehtml/helper/W3CDom$W3CBuilder;Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;)Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    .line 251
    :cond_2c
    instance-of v2, p1, Lcom/streambundlehtml/nodes/Document;

    if-eqz v2, :cond_36

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/nodes/Element;->child(I)Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    goto :goto_37

    :cond_36
    move-object v2, p1

    .line 252
    .local v2, "rootEl":Lcom/streambundlehtml/nodes/Element;
    :goto_37
    invoke-static {v0, v2}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 253
    return-void
.end method

.method public fromJsoup(Lcom/streambundlehtml/nodes/Document;)Lorg/w3c/dom/Document;
    .registers 3
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Document;

    .line 182
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/W3CDom;->fromJsoup(Lcom/streambundlehtml/nodes/Element;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method public fromJsoup(Lcom/streambundlehtml/nodes/Element;)Lorg/w3c/dom/Document;
    .registers 11
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Element;

    .line 197
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 200
    :try_start_3
    iget-object v0, p0, Lcom/streambundlehtml/helper/W3CDom;->factory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 201
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->getDOMImplementation()Lorg/w3c/dom/DOMImplementation;

    move-result-object v1

    .line 202
    .local v1, "impl":Lorg/w3c/dom/DOMImplementation;
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    .line 203
    .local v2, "out":Lorg/w3c/dom/Document;
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v3

    .line 204
    .local v3, "inDoc":Lcom/streambundlehtml/nodes/Document;
    const/4 v4, 0x0

    if-eqz v3, :cond_1d

    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Document;->documentType()Lcom/streambundlehtml/nodes/DocumentType;

    move-result-object v5

    goto :goto_1e

    :cond_1d
    move-object v5, v4

    .line 205
    .local v5, "doctype":Lcom/streambundlehtml/nodes/DocumentType;
    :goto_1e
    if-eqz v5, :cond_33

    .line 206
    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/DocumentType;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/DocumentType;->publicId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/DocumentType;->systemId()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v6, v7, v8}, Lorg/w3c/dom/DOMImplementation;->createDocumentType(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/DocumentType;

    move-result-object v6

    .line 207
    .local v6, "documentType":Lorg/w3c/dom/DocumentType;
    invoke-interface {v2, v6}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 209
    .end local v6    # "documentType":Lorg/w3c/dom/DocumentType;
    :cond_33
    const/4 v6, 0x1

    invoke-interface {v2, v6}, Lorg/w3c/dom/Document;->setXmlStandalone(Z)V

    .line 211
    instance-of v6, p1, Lcom/streambundlehtml/nodes/Document;

    if-eqz v6, :cond_41

    const/4 v6, 0x0

    invoke-virtual {p1, v6}, Lcom/streambundlehtml/nodes/Element;->child(I)Lcom/streambundlehtml/nodes/Element;

    move-result-object v6

    goto :goto_42

    :cond_41
    move-object v6, p1

    .line 212
    .local v6, "context":Lcom/streambundlehtml/nodes/Element;
    :goto_42
    const-string v7, "jsoupContextSource"

    invoke-interface {v2, v7, v6, v4}, Lorg/w3c/dom/Document;->setUserData(Ljava/lang/String;Ljava/lang/Object;Lorg/w3c/dom/UserDataHandler;)Ljava/lang/Object;

    .line 213
    if-eqz v3, :cond_4b

    move-object v4, v3

    goto :goto_4c

    :cond_4b
    move-object v4, p1

    :goto_4c
    invoke-virtual {p0, v4, v2}, Lcom/streambundlehtml/helper/W3CDom;->convert(Lcom/streambundlehtml/nodes/Element;Lorg/w3c/dom/Document;)V
    :try_end_4f
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_3 .. :try_end_4f} :catch_50

    .line 214
    return-object v2

    .line 215
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v1    # "impl":Lorg/w3c/dom/DOMImplementation;
    .end local v2    # "out":Lorg/w3c/dom/Document;
    .end local v3    # "inDoc":Lcom/streambundlehtml/nodes/Document;
    .end local v5    # "doctype":Lcom/streambundlehtml/nodes/DocumentType;
    .end local v6    # "context":Lcom/streambundlehtml/nodes/Element;
    :catch_50
    move-exception v0

    .line 216
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public namespaceAware(Z)Lcom/streambundlehtml/helper/W3CDom;
    .registers 3
    .param p1, "namespaceAware"    # Z

    .line 84
    iput-boolean p1, p0, Lcom/streambundlehtml/helper/W3CDom;->namespaceAware:Z

    .line 85
    iget-object v0, p0, Lcom/streambundlehtml/helper/W3CDom;->factory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v0, p1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 86
    return-object p0
.end method

.method public namespaceAware()Z
    .registers 2

    .line 75
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/W3CDom;->namespaceAware:Z

    return v0
.end method

.method public selectXpath(Ljava/lang/String;Lorg/w3c/dom/Document;)Lorg/w3c/dom/NodeList;
    .registers 4
    .param p1, "xpath"    # Ljava/lang/String;
    .param p2, "doc"    # Lorg/w3c/dom/Document;

    .line 262
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/helper/W3CDom;->selectXpath(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    return-object v0
.end method

.method public selectXpath(Ljava/lang/String;Lorg/w3c/dom/Node;)Lorg/w3c/dom/NodeList;
    .registers 8
    .param p1, "xpath"    # Ljava/lang/String;
    .param p2, "contextNode"    # Lorg/w3c/dom/Node;

    .line 272
    const-string v0, "xpath"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    const-string v0, "contextNode"

    invoke-static {p2, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 278
    :try_start_a
    const-string v0, "javax.xml.xpath.XPathFactory:jsoup"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 279
    .local v0, "property":Ljava/lang/String;
    if-eqz v0, :cond_19

    .line 280
    const-string v1, "jsoup"

    invoke-static {v1}, Ljavax/xml/xpath/XPathFactory;->newInstance(Ljava/lang/String;)Ljavax/xml/xpath/XPathFactory;

    move-result-object v1

    goto :goto_1d

    .line 281
    :cond_19
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v1

    :goto_1d
    nop

    .line 283
    .local v1, "xPathFactory":Ljavax/xml/xpath/XPathFactory;
    invoke-virtual {v1}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v2

    invoke-interface {v2, p1}, Ljavax/xml/xpath/XPath;->compile(Ljava/lang/String;)Ljavax/xml/xpath/XPathExpression;

    move-result-object v2

    .line 284
    .local v2, "expression":Ljavax/xml/xpath/XPathExpression;
    sget-object v3, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    invoke-interface {v2, p2, v3}, Ljavax/xml/xpath/XPathExpression;->evaluate(Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/NodeList;

    .line 285
    .local v3, "nodeList":Lorg/w3c/dom/NodeList;
    invoke-static {v3}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V
    :try_end_31
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_a .. :try_end_31} :catch_35
    .catch Ljavax/xml/xpath/XPathFactoryConfigurationException; {:try_start_a .. :try_end_31} :catch_33

    .line 288
    .end local v0    # "property":Ljava/lang/String;
    .end local v1    # "xPathFactory":Ljavax/xml/xpath/XPathFactory;
    .end local v2    # "expression":Ljavax/xml/xpath/XPathExpression;
    nop

    .line 289
    return-object v3

    .line 286
    .end local v3    # "nodeList":Lorg/w3c/dom/NodeList;
    :catch_33
    move-exception v0

    goto :goto_36

    :catch_35
    move-exception v0

    .line 287
    .local v0, "e":Ljavax/xml/xpath/XPathException;
    :goto_36
    new-instance v1, Lcom/streambundlehtml/select/Selector$SelectorParseException;

    invoke-virtual {v0}, Ljavax/xml/xpath/XPathException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object v2, v3, v4

    const-string v2, "Could not evaluate XPath query [%s]: %s"

    invoke-direct {v1, v2, v3}, Lcom/streambundlehtml/select/Selector$SelectorParseException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1
.end method

.method public sourceNodes(Lorg/w3c/dom/NodeList;Ljava/lang/Class;)Ljava/util/List;
    .registers 8
    .param p1, "nodeList"    # Lorg/w3c/dom/NodeList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/streambundlehtml/nodes/Node;",
            ">(",
            "Lorg/w3c/dom/NodeList;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 300
    .local p2, "nodeType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 301
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 302
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 304
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_32

    .line 305
    invoke-interface {p1, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 306
    .local v2, "node":Lorg/w3c/dom/Node;
    const-string v3, "jsoupSource"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Node;->getUserData(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 307
    .local v3, "source":Ljava/lang/Object;
    invoke-virtual {p2, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 308
    invoke-virtual {p2, v3}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/nodes/Node;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    .end local v2    # "node":Lorg/w3c/dom/Node;
    .end local v3    # "source":Ljava/lang/Object;
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 311
    .end local v1    # "i":I
    :cond_32
    return-object v0
.end method
