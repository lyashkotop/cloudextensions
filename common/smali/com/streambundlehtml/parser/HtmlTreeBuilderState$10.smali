.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$10;
.super Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
.source "HtmlTreeBuilderState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .line 1086
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 9
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1088
    iget-object v0, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v1, Lcom/streambundlehtml/parser/Token$TokenType;->Character:Lcom/streambundlehtml/parser/Token$TokenType;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_2b

    .line 1089
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    .line 1090
    .local v0, "c":Lcom/streambundlehtml/parser/Token$Character;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v1

    # getter for: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;
    invoke-static {}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$400()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 1091
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1092
    return v3

    .line 1094
    :cond_1e
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1096
    .end local v0    # "c":Lcom/streambundlehtml/parser/Token$Character;
    nop

    .line 1117
    return v2

    .line 1097
    :cond_2b
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_96

    .line 1098
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_93

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1099
    .local v1, "character":Ljava/lang/String;
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Ljava/lang/String;)Z
    invoke-static {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$500(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_86

    .line 1101
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1102
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableFoster:[Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_77

    .line 1103
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    .line 1104
    new-instance v4, Lcom/streambundlehtml/parser/Token$Character;

    invoke-direct {v4}, Lcom/streambundlehtml/parser/Token$Character;-><init>()V

    invoke-virtual {v4, v1}, Lcom/streambundlehtml/parser/Token$Character;->data(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v4

    sget-object v5, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$10;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v4, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 1105
    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    goto :goto_92

    .line 1107
    :cond_77
    new-instance v4, Lcom/streambundlehtml/parser/Token$Character;

    invoke-direct {v4}, Lcom/streambundlehtml/parser/Token$Character;-><init>()V

    invoke-virtual {v4, v1}, Lcom/streambundlehtml/parser/Token$Character;->data(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v4

    sget-object v5, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$10;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v4, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    goto :goto_92

    .line 1110
    :cond_86
    new-instance v4, Lcom/streambundlehtml/parser/Token$Character;

    invoke-direct {v4}, Lcom/streambundlehtml/parser/Token$Character;-><init>()V

    invoke-virtual {v4, v1}, Lcom/streambundlehtml/parser/Token$Character;->data(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    .line 1111
    .end local v1    # "character":Ljava/lang/String;
    :goto_92
    goto :goto_3d

    .line 1112
    :cond_93
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->newPendingTableCharacters()V

    .line 1114
    :cond_96
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->originalState()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1115
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0
.end method
