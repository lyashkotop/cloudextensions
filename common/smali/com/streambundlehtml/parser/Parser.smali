.class public Lcom/streambundlehtml/parser/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# instance fields
.field private errors:Lcom/streambundlehtml/parser/ParseErrorList;

.field private settings:Lcom/streambundlehtml/parser/ParseSettings;

.field private trackPosition:Z

.field private treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;


# direct methods
.method private constructor <init>(Lcom/streambundlehtml/parser/Parser;)V
    .registers 4
    .param p1, "copy"    # Lcom/streambundlehtml/parser/Parser;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Parser;->trackPosition:Z

    .line 41
    iget-object v0, p1, Lcom/streambundlehtml/parser/Parser;->treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TreeBuilder;->newInstance()Lcom/streambundlehtml/parser/TreeBuilder;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Parser;->treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;

    .line 42
    new-instance v0, Lcom/streambundlehtml/parser/ParseErrorList;

    iget-object v1, p1, Lcom/streambundlehtml/parser/Parser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    invoke-direct {v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;-><init>(Lcom/streambundlehtml/parser/ParseErrorList;)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Parser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    .line 43
    new-instance v0, Lcom/streambundlehtml/parser/ParseSettings;

    iget-object v1, p1, Lcom/streambundlehtml/parser/Parser;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-direct {v0, v1}, Lcom/streambundlehtml/parser/ParseSettings;-><init>(Lcom/streambundlehtml/parser/ParseSettings;)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Parser;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    .line 44
    iget-boolean v0, p1, Lcom/streambundlehtml/parser/Parser;->trackPosition:Z

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Parser;->trackPosition:Z

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/streambundlehtml/parser/TreeBuilder;)V
    .registers 3
    .param p1, "treeBuilder"    # Lcom/streambundlehtml/parser/TreeBuilder;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Parser;->trackPosition:Z

    .line 27
    iput-object p1, p0, Lcom/streambundlehtml/parser/Parser;->treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;

    .line 28
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/TreeBuilder;->defaultSettings()Lcom/streambundlehtml/parser/ParseSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Parser;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    .line 29
    invoke-static {}, Lcom/streambundlehtml/parser/ParseErrorList;->noTracking()Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Parser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    .line 30
    return-void
.end method

.method public static htmlParser()Lcom/streambundlehtml/parser/Parser;
    .registers 2

    .line 251
    new-instance v0, Lcom/streambundlehtml/parser/Parser;

    new-instance v1, Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    invoke-direct {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;-><init>()V

    invoke-direct {v0, v1}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 5
    .param p0, "html"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .line 161
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;-><init>()V

    .line 162
    .local v0, "treeBuilder":Lcom/streambundlehtml/parser/TreeBuilder;
    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    new-instance v2, Lcom/streambundlehtml/parser/Parser;

    invoke-direct {v2, v0}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    invoke-virtual {v0, v1, p1, v2}, Lcom/streambundlehtml/parser/TreeBuilder;->parse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method public static parseBodyFragment(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 9
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .line 219
    invoke-static {p1}, Lcom/streambundlehtml/nodes/Document;->createShell(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 220
    .local v0, "doc":Lcom/streambundlehtml/nodes/Document;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 221
    .local v1, "body":Lcom/streambundlehtml/nodes/Element;
    invoke-static {p0, v1, p1}, Lcom/streambundlehtml/parser/Parser;->parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 222
    .local v2, "nodeList":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v3, 0x0

    new-array v4, v3, [Lcom/streambundlehtml/nodes/Node;

    invoke-interface {v2, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/streambundlehtml/nodes/Node;

    .line 223
    .local v4, "nodes":[Lcom/streambundlehtml/nodes/Node;
    array-length v5, v4

    add-int/lit8 v5, v5, -0x1

    .local v5, "i":I
    :goto_18
    if-lez v5, :cond_22

    .line 224
    aget-object v6, v4, v5

    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Node;->remove()V

    .line 223
    add-int/lit8 v5, v5, -0x1

    goto :goto_18

    .line 226
    .end local v5    # "i":I
    :cond_22
    array-length v5, v4

    :goto_23
    if-ge v3, v5, :cond_2d

    aget-object v6, v4, v3

    .line 227
    .local v6, "node":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {v1, v6}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 226
    .end local v6    # "node":Lcom/streambundlehtml/nodes/Node;
    add-int/lit8 v3, v3, 0x1

    goto :goto_23

    .line 229
    :cond_2d
    return-object v0
.end method

.method public static parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p0, "fragmentHtml"    # Ljava/lang/String;
    .param p1, "context"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/nodes/Element;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 176
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;-><init>()V

    .line 177
    .local v0, "treeBuilder":Lcom/streambundlehtml/parser/HtmlTreeBuilder;
    new-instance v1, Lcom/streambundlehtml/parser/Parser;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    invoke-virtual {v0, p0, p1, p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;Lcom/streambundlehtml/parser/ParseErrorList;)Ljava/util/List;
    .registers 7
    .param p0, "fragmentHtml"    # Ljava/lang/String;
    .param p1, "context"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "errorList"    # Lcom/streambundlehtml/parser/ParseErrorList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/nodes/Element;",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/parser/ParseErrorList;",
            ")",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 192
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;-><init>()V

    .line 193
    .local v0, "treeBuilder":Lcom/streambundlehtml/parser/HtmlTreeBuilder;
    new-instance v1, Lcom/streambundlehtml/parser/Parser;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    .line 194
    .local v1, "parser":Lcom/streambundlehtml/parser/Parser;
    iput-object p3, v1, Lcom/streambundlehtml/parser/Parser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    .line 195
    invoke-virtual {v0, p0, p1, p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method public static parseXmlFragment(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 4
    .param p0, "fragmentXml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 206
    new-instance v0, Lcom/streambundlehtml/parser/XmlTreeBuilder;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/XmlTreeBuilder;-><init>()V

    .line 207
    .local v0, "treeBuilder":Lcom/streambundlehtml/parser/XmlTreeBuilder;
    new-instance v1, Lcom/streambundlehtml/parser/Parser;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    invoke-virtual {v0, p0, p1, v1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;->parseFragment(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static unescapeEntities(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 5
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "inAttribute"    # Z

    .line 239
    new-instance v0, Lcom/streambundlehtml/parser/Tokeniser;

    new-instance v1, Lcom/streambundlehtml/parser/CharacterReader;

    invoke-direct {v1, p0}, Lcom/streambundlehtml/parser/CharacterReader;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/streambundlehtml/parser/ParseErrorList;->noTracking()Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/Tokeniser;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/ParseErrorList;)V

    .line 240
    .local v0, "tokeniser":Lcom/streambundlehtml/parser/Tokeniser;
    invoke-virtual {v0, p1}, Lcom/streambundlehtml/parser/Tokeniser;->unescapeEntities(Z)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static xmlParser()Lcom/streambundlehtml/parser/Parser;
    .registers 2

    .line 260
    new-instance v0, Lcom/streambundlehtml/parser/Parser;

    new-instance v1, Lcom/streambundlehtml/parser/XmlTreeBuilder;

    invoke-direct {v1}, Lcom/streambundlehtml/parser/XmlTreeBuilder;-><init>()V

    invoke-direct {v0, v1}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/TreeBuilder;)V

    return-object v0
.end method


# virtual methods
.method public getErrors()Lcom/streambundlehtml/parser/ParseErrorList;
    .registers 2

    .line 102
    iget-object v0, p0, Lcom/streambundlehtml/parser/Parser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    return-object v0
.end method

.method public getTreeBuilder()Lcom/streambundlehtml/parser/TreeBuilder;
    .registers 2

    .line 64
    iget-object v0, p0, Lcom/streambundlehtml/parser/Parser;->treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;

    return-object v0
.end method

.method public isContentForTagData(Ljava/lang/String;)Z
    .registers 3
    .param p1, "normalName"    # Ljava/lang/String;

    .line 148
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Parser;->getTreeBuilder()Lcom/streambundlehtml/parser/TreeBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/parser/TreeBuilder;->isContentForTagData(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isTrackErrors()Z
    .registers 2

    .line 83
    iget-object v0, p0, Lcom/streambundlehtml/parser/Parser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/ParseErrorList;->getMaxSize()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public isTrackPosition()Z
    .registers 2

    .line 111
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Parser;->trackPosition:Z

    return v0
.end method

.method public newInstance()Lcom/streambundlehtml/parser/Parser;
    .registers 2

    .line 37
    new-instance v0, Lcom/streambundlehtml/parser/Parser;

    invoke-direct {v0, p0}, Lcom/streambundlehtml/parser/Parser;-><init>(Lcom/streambundlehtml/parser/Parser;)V

    return-object v0
.end method

.method public parseFragmentInput(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p1, "fragment"    # Ljava/lang/String;
    .param p2, "context"    # Lcom/streambundlehtml/nodes/Element;
    .param p3, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/nodes/Element;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/streambundlehtml/parser/Parser;->treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;

    invoke-virtual {v0, p1, p2, p3, p0}, Lcom/streambundlehtml/parser/TreeBuilder;->parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public parseInput(Ljava/io/Reader;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 4
    .param p1, "inputHtml"    # Ljava/io/Reader;
    .param p2, "baseUri"    # Ljava/lang/String;

    .line 52
    iget-object v0, p0, Lcom/streambundlehtml/parser/Parser;->treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;

    invoke-virtual {v0, p1, p2, p0}, Lcom/streambundlehtml/parser/TreeBuilder;->parse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public parseInput(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;

    .line 48
    iget-object v0, p0, Lcom/streambundlehtml/parser/Parser;->treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;

    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, p2, p0}, Lcom/streambundlehtml/parser/TreeBuilder;->parse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public setTrackErrors(I)Lcom/streambundlehtml/parser/Parser;
    .registers 3
    .param p1, "maxErrors"    # I

    .line 92
    if-lez p1, :cond_7

    invoke-static {p1}, Lcom/streambundlehtml/parser/ParseErrorList;->tracking(I)Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v0

    goto :goto_b

    :cond_7
    invoke-static {}, Lcom/streambundlehtml/parser/ParseErrorList;->noTracking()Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v0

    :goto_b
    iput-object v0, p0, Lcom/streambundlehtml/parser/Parser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    .line 93
    return-object p0
.end method

.method public setTrackPosition(Z)Lcom/streambundlehtml/parser/Parser;
    .registers 2
    .param p1, "trackPosition"    # Z

    .line 121
    iput-boolean p1, p0, Lcom/streambundlehtml/parser/Parser;->trackPosition:Z

    .line 122
    return-object p0
.end method

.method public setTreeBuilder(Lcom/streambundlehtml/parser/TreeBuilder;)Lcom/streambundlehtml/parser/Parser;
    .registers 2
    .param p1, "treeBuilder"    # Lcom/streambundlehtml/parser/TreeBuilder;

    .line 73
    iput-object p1, p0, Lcom/streambundlehtml/parser/Parser;->treeBuilder:Lcom/streambundlehtml/parser/TreeBuilder;

    .line 74
    iput-object p0, p1, Lcom/streambundlehtml/parser/TreeBuilder;->parser:Lcom/streambundlehtml/parser/Parser;

    .line 75
    return-object p0
.end method

.method public settings()Lcom/streambundlehtml/parser/ParseSettings;
    .registers 2

    .line 140
    iget-object v0, p0, Lcom/streambundlehtml/parser/Parser;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    return-object v0
.end method

.method public settings(Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Parser;
    .registers 2
    .param p1, "settings"    # Lcom/streambundlehtml/parser/ParseSettings;

    .line 131
    iput-object p1, p0, Lcom/streambundlehtml/parser/Parser;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    .line 132
    return-object p0
.end method
