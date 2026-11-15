.class abstract Lcom/streambundlehtml/parser/TreeBuilder;
.super Ljava/lang/Object;
.source "TreeBuilder.java"


# instance fields
.field protected baseUri:Ljava/lang/String;

.field protected currentToken:Lcom/streambundlehtml/parser/Token;

.field protected doc:Lcom/streambundlehtml/nodes/Document;

.field private end:Lcom/streambundlehtml/parser/Token$EndTag;

.field protected parser:Lcom/streambundlehtml/parser/Parser;

.field reader:Lcom/streambundlehtml/parser/CharacterReader;

.field protected seenTags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/parser/Tag;",
            ">;"
        }
    .end annotation
.end field

.field protected settings:Lcom/streambundlehtml/parser/ParseSettings;

.field protected stack:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;"
        }
    .end annotation
.end field

.field private start:Lcom/streambundlehtml/parser/Token$StartTag;

.field tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

.field private trackSourceRange:Z


# direct methods
.method constructor <init>()V
    .registers 2

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/streambundlehtml/parser/Token$StartTag;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$StartTag;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->start:Lcom/streambundlehtml/parser/Token$StartTag;

    .line 33
    new-instance v0, Lcom/streambundlehtml/parser/Token$EndTag;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$EndTag;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->end:Lcom/streambundlehtml/parser/Token$EndTag;

    return-void
.end method

.method private trackNodePosition(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;Z)V
    .registers 10
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "token"    # Lcom/streambundlehtml/parser/Token;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "start"    # Z

    .line 203
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->trackSourceRange:Z

    if-eqz v0, :cond_3c

    if-eqz p2, :cond_3c

    .line 204
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/Token;->startPos()I

    move-result v0

    .line 205
    .local v0, "startPos":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_e

    return-void

    .line 207
    :cond_e
    new-instance v1, Lcom/streambundlehtml/nodes/Range$Position;

    iget-object v2, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->lineNumber(I)I

    move-result v2

    iget-object v3, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v3, v0}, Lcom/streambundlehtml/parser/CharacterReader;->columnNumber(I)I

    move-result v3

    invoke-direct {v1, v0, v2, v3}, Lcom/streambundlehtml/nodes/Range$Position;-><init>(III)V

    .line 208
    .local v1, "startRange":Lcom/streambundlehtml/nodes/Range$Position;
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/Token;->endPos()I

    move-result v2

    .line 209
    .local v2, "endPos":I
    new-instance v3, Lcom/streambundlehtml/nodes/Range$Position;

    iget-object v4, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v4, v2}, Lcom/streambundlehtml/parser/CharacterReader;->lineNumber(I)I

    move-result v4

    iget-object v5, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v5, v2}, Lcom/streambundlehtml/parser/CharacterReader;->columnNumber(I)I

    move-result v5

    invoke-direct {v3, v2, v4, v5}, Lcom/streambundlehtml/nodes/Range$Position;-><init>(III)V

    .line 210
    .local v3, "endRange":Lcom/streambundlehtml/nodes/Range$Position;
    new-instance v4, Lcom/streambundlehtml/nodes/Range;

    invoke-direct {v4, v1, v3}, Lcom/streambundlehtml/nodes/Range;-><init>(Lcom/streambundlehtml/nodes/Range$Position;Lcom/streambundlehtml/nodes/Range$Position;)V

    .line 211
    .local v4, "range":Lcom/streambundlehtml/nodes/Range;
    invoke-virtual {v4, p1, p3}, Lcom/streambundlehtml/nodes/Range;->track(Lcom/streambundlehtml/nodes/Node;Z)V

    .line 213
    .end local v0    # "startPos":I
    .end local v1    # "startRange":Lcom/streambundlehtml/nodes/Range$Position;
    .end local v2    # "endPos":I
    .end local v3    # "endRange":Lcom/streambundlehtml/nodes/Range$Position;
    .end local v4    # "range":Lcom/streambundlehtml/nodes/Range;
    :cond_3c
    return-void
.end method


# virtual methods
.method protected currentElement()Lcom/streambundlehtml/nodes/Element;
    .registers 4

    .line 130
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 131
    .local v0, "size":I
    if-lez v0, :cond_13

    iget-object v1, p0, Lcom/streambundlehtml/parser/TreeBuilder;->stack:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    goto :goto_15

    :cond_13
    iget-object v1, p0, Lcom/streambundlehtml/parser/TreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    :goto_15
    return-object v1
.end method

.method protected currentElementIs(Ljava/lang/String;)Z
    .registers 5
    .param p1, "normalName"    # Ljava/lang/String;

    .line 140
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    .line 141
    return v1

    .line 142
    :cond_a
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 143
    .local v0, "current":Lcom/streambundlehtml/nodes/Element;
    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    const/4 v1, 0x1

    :cond_1b
    return v1
.end method

.method abstract defaultSettings()Lcom/streambundlehtml/parser/ParseSettings;
.end method

.method protected error(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .line 151
    const/4 v0, 0x0

    move-object v1, v0

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {p0, p1, v0}, Lcom/streambundlehtml/parser/TreeBuilder;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 152
    return-void
.end method

.method protected varargs error(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 160
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->parser:Lcom/streambundlehtml/parser/Parser;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Parser;->getErrors()Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v0

    .line 161
    .local v0, "errors":Lcom/streambundlehtml/parser/ParseErrorList;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/ParseErrorList;->canAddError()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 162
    new-instance v1, Lcom/streambundlehtml/parser/ParseError;

    iget-object v2, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-direct {v1, v2, p1, p2}, Lcom/streambundlehtml/parser/ParseError;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 163
    :cond_16
    return-void
.end method

.method protected initialiseParse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)V
    .registers 7
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation runtime Ljavax/annotation/ParametersAreNonnullByDefault;
    .end annotation

    .line 40
    const-string v0, "input"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    const-string v0, "baseUri"

    invoke-static {p2, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    invoke-static {p3}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 44
    new-instance v0, Lcom/streambundlehtml/nodes/Document;

    invoke-direct {v0, p2}, Lcom/streambundlehtml/nodes/Document;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    .line 45
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v0, p3}, Lcom/streambundlehtml/nodes/Document;->parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    .line 46
    iput-object p3, p0, Lcom/streambundlehtml/parser/TreeBuilder;->parser:Lcom/streambundlehtml/parser/Parser;

    .line 47
    invoke-virtual {p3}, Lcom/streambundlehtml/parser/Parser;->settings()Lcom/streambundlehtml/parser/ParseSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    .line 48
    new-instance v0, Lcom/streambundlehtml/parser/CharacterReader;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/parser/CharacterReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    .line 49
    invoke-virtual {p3}, Lcom/streambundlehtml/parser/Parser;->isTrackPosition()Z

    move-result v0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->trackSourceRange:Z

    .line 50
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {p3}, Lcom/streambundlehtml/parser/Parser;->isTrackErrors()Z

    move-result v1

    if-nez v1, :cond_3c

    iget-boolean v1, p0, Lcom/streambundlehtml/parser/TreeBuilder;->trackSourceRange:Z

    if-nez v1, :cond_3c

    const/4 v1, 0x0

    goto :goto_3d

    :cond_3c
    const/4 v1, 0x1

    :goto_3d
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/CharacterReader;->trackNewlines(Z)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    .line 52
    new-instance v0, Lcom/streambundlehtml/parser/Tokeniser;

    iget-object v1, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {p3}, Lcom/streambundlehtml/parser/Parser;->getErrors()Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/Tokeniser;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/ParseErrorList;)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->stack:Ljava/util/ArrayList;

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->seenTags:Ljava/util/Map;

    .line 55
    iput-object p2, p0, Lcom/streambundlehtml/parser/TreeBuilder;->baseUri:Ljava/lang/String;

    .line 56
    return-void
.end method

.method protected isContentForTagData(Ljava/lang/String;)Z
    .registers 3
    .param p1, "normalName"    # Ljava/lang/String;

    .line 170
    const/4 v0, 0x0

    return v0
.end method

.method abstract newInstance()Lcom/streambundlehtml/parser/TreeBuilder;
.end method

.method protected onNodeClosed(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V
    .registers 4
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "token"    # Lcom/streambundlehtml/parser/Token;

    .line 199
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TreeBuilder;->trackNodePosition(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;Z)V

    .line 200
    return-void
.end method

.method protected onNodeInserted(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V
    .registers 4
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "token"    # Lcom/streambundlehtml/parser/Token;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 189
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TreeBuilder;->trackNodePosition(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;Z)V

    .line 190
    return-void
.end method

.method parse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;
    .registers 5
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation runtime Ljavax/annotation/ParametersAreNonnullByDefault;
    .end annotation

    .line 60
    invoke-virtual {p0, p1, p2, p3}, Lcom/streambundlehtml/parser/TreeBuilder;->initialiseParse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)V

    .line 61
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TreeBuilder;->runParser()V

    .line 64
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/CharacterReader;->close()V

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    .line 66
    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    .line 67
    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->stack:Ljava/util/ArrayList;

    .line 68
    iput-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->seenTags:Ljava/util/Map;

    .line 70
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    return-object v0
.end method

.method abstract parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;
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
.end method

.method protected abstract process(Lcom/streambundlehtml/parser/Token;)Z
.end method

.method protected processEndTag(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .line 117
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    iget-object v1, p0, Lcom/streambundlehtml/parser/TreeBuilder;->end:Lcom/streambundlehtml/parser/Token$EndTag;

    if-ne v0, v1, :cond_14

    .line 118
    new-instance v0, Lcom/streambundlehtml/parser/Token$EndTag;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$EndTag;-><init>()V

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/parser/Token$EndTag;->name(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 120
    :cond_14
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->end:Lcom/streambundlehtml/parser/Token$EndTag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/parser/Token$Tag;->name(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0
.end method

.method protected processStartTag(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .line 99
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->start:Lcom/streambundlehtml/parser/Token$StartTag;

    .line 100
    .local v0, "start":Lcom/streambundlehtml/parser/Token$StartTag;
    iget-object v1, p0, Lcom/streambundlehtml/parser/TreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    if-ne v1, v0, :cond_14

    .line 101
    new-instance v1, Lcom/streambundlehtml/parser/Token$StartTag;

    invoke-direct {v1}, Lcom/streambundlehtml/parser/Token$StartTag;-><init>()V

    invoke-virtual {v1, p1}, Lcom/streambundlehtml/parser/Token$StartTag;->name(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 103
    :cond_14
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/streambundlehtml/parser/Token$Tag;->name(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1
.end method

.method public processStartTag(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Lcom/streambundlehtml/nodes/Attributes;

    .line 107
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->start:Lcom/streambundlehtml/parser/Token$StartTag;

    .line 108
    .local v0, "start":Lcom/streambundlehtml/parser/Token$StartTag;
    iget-object v1, p0, Lcom/streambundlehtml/parser/TreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    if-ne v1, v0, :cond_14

    .line 109
    new-instance v1, Lcom/streambundlehtml/parser/Token$StartTag;

    invoke-direct {v1}, Lcom/streambundlehtml/parser/Token$StartTag;-><init>()V

    invoke-virtual {v1, p1, p2}, Lcom/streambundlehtml/parser/Token$StartTag;->nameAttr(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 111
    :cond_14
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    .line 112
    invoke-virtual {v0, p1, p2}, Lcom/streambundlehtml/parser/Token$StartTag;->nameAttr(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Lcom/streambundlehtml/parser/Token$StartTag;

    .line 113
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1
.end method

.method protected runParser()V
    .registers 5

    .line 82
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    .line 83
    .local v0, "tokeniser":Lcom/streambundlehtml/parser/Tokeniser;
    sget-object v1, Lcom/streambundlehtml/parser/Token$TokenType;->EOF:Lcom/streambundlehtml/parser/Token$TokenType;

    .line 86
    .local v1, "eof":Lcom/streambundlehtml/parser/Token$TokenType;
    :goto_4
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tokeniser;->read()Lcom/streambundlehtml/parser/Token;

    move-result-object v2

    .line 87
    .local v2, "token":Lcom/streambundlehtml/parser/Token;
    invoke-virtual {p0, v2}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    .line 88
    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token;->reset()Lcom/streambundlehtml/parser/Token;

    .line 90
    iget-object v3, v2, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v3, v1, :cond_14

    .line 91
    nop

    .line 93
    .end local v2    # "token":Lcom/streambundlehtml/parser/Token;
    return-void

    .line 92
    :cond_14
    goto :goto_4
.end method

.method protected tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;
    .param p2, "settings"    # Lcom/streambundlehtml/parser/ParseSettings;

    .line 174
    iget-object v0, p0, Lcom/streambundlehtml/parser/TreeBuilder;->seenTags:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/parser/Tag;

    .line 175
    .local v0, "tag":Lcom/streambundlehtml/parser/Tag;
    if-nez v0, :cond_13

    .line 176
    invoke-static {p1, p2}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    .line 177
    iget-object v1, p0, Lcom/streambundlehtml/parser/TreeBuilder;->seenTags:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    :cond_13
    return-object v0
.end method
