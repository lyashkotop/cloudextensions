.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;
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

    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/TreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/TreeBuilder;

    .line 188
    const-string v0, "head"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/TreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 189
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 10
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 105
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Lcom/streambundlehtml/parser/Token;)Z
    invoke-static {p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$100(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_f

    .line 106
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    .line 107
    return v1

    .line 109
    :cond_f
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$25;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v2, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$TokenType;->ordinal()I

    move-result v2

    aget v0, v0, v2

    const-string v2, "template"

    const-string v3, "head"

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_142

    .line 182
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/TreeBuilder;)Z

    move-result v0

    return v0

    .line 157
    :pswitch_26
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    .line 158
    .local v0, "end":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v5

    .line 159
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 160
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 161
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->AfterHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_140

    .line 162
    :cond_3e
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InHeadEnd:[Ljava/lang/String;

    invoke-static {v5, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 163
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/TreeBuilder;)Z

    move-result v1

    return v1

    .line 164
    :cond_4b
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7e

    .line 165
    invoke-virtual {p2, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5c

    .line 166
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_140

    .line 168
    :cond_5c
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags(Z)V

    .line 169
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_70

    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 170
    :cond_70
    invoke-virtual {p2, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 171
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    .line 172
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 173
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->resetInsertionMode()Z

    goto/16 :goto_140

    .line 177
    :cond_7e
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 178
    return v4

    .line 117
    .end local v0    # "end":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v5    # "name":Ljava/lang/String;
    :pswitch_82
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    .line 118
    .local v0, "start":Lcom/streambundlehtml/parser/Token$StartTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v5

    .line 119
    .restart local v5    # "name":Ljava/lang/String;
    const-string v6, "html"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_99

    .line 120
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v1, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 121
    :cond_99
    sget-object v6, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InHeadEmpty:[Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_ba

    .line 122
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    .line 124
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    const-string v3, "base"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b8

    const-string v3, "href"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b8

    .line 125
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->maybeSetBaseUri(Lcom/streambundlehtml/nodes/Element;)V

    .line 126
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_b8
    goto/16 :goto_140

    :cond_ba
    const-string v6, "meta"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c7

    .line 127
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    goto/16 :goto_140

    .line 129
    :cond_c7
    const-string v6, "title"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d3

    .line 130
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->handleRcData(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    invoke-static {v0, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$200(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    goto :goto_140

    .line 131
    :cond_d3
    sget-object v6, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InHeadRaw:[Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_df

    .line 132
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->handleRawtext(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    invoke-static {v0, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$300(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    goto :goto_140

    .line 133
    :cond_df
    const-string v6, "noscript"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f0

    .line 135
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 136
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->InHeadNoscript:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto :goto_140

    .line 137
    :cond_f0
    const-string v6, "script"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10b

    .line 139
    iget-object v2, p2, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v3, Lcom/streambundlehtml/parser/TokeniserState;->ScriptData:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 140
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 141
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->Text:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 142
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_140

    .line 143
    :cond_10b
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_115

    .line 144
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 145
    return v4

    .line 146
    :cond_115
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12f

    .line 147
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 148
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertMarkerToFormattingElements()V

    .line 149
    invoke-virtual {p2, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 150
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->InTemplate:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 151
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->InTemplate:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushTemplateMode(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto :goto_140

    .line 153
    :cond_12f
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/TreeBuilder;)Z

    move-result v1

    return v1

    .line 114
    .end local v0    # "start":Lcom/streambundlehtml/parser/Token$StartTag;
    .end local v5    # "name":Ljava/lang/String;
    :pswitch_134
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 115
    return v4

    .line 111
    :pswitch_138
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    .line 112
    nop

    .line 184
    :goto_140
    return v1

    nop

    :pswitch_data_142
    .packed-switch 0x1
        :pswitch_138
        :pswitch_134
        :pswitch_82
        :pswitch_26
    .end packed-switch
.end method
