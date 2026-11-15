.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;
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

    .line 224
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 274
    const-string v0, "body"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 275
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 276
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 7
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 226
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Lcom/streambundlehtml/parser/Token;)Z
    invoke-static {p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$100(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 227
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    goto/16 :goto_c6

    .line 228
    :cond_f
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isComment()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 229
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    goto/16 :goto_c6

    .line 230
    :cond_1e
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isDoctype()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 231
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_c6

    .line 232
    :cond_29
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_97

    .line 233
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    .line 234
    .local v0, "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v2

    .line 235
    .local v2, "name":Ljava/lang/String;
    const-string v3, "html"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 236
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v1

    return v1

    .line 237
    :cond_47
    const-string v3, "body"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5b

    .line 238
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 239
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 240
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto :goto_96

    .line 241
    :cond_5b
    const-string v3, "frameset"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6c

    .line 242
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 243
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;->InFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto :goto_96

    .line 244
    :cond_6c
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartToHead:[Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_87

    .line 245
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 246
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getHeadElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 247
    .local v1, "head":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->push(Lcom/streambundlehtml/nodes/Element;)V

    .line 248
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 249
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromStack(Lcom/streambundlehtml/nodes/Element;)Z

    .line 250
    .end local v1    # "head":Lcom/streambundlehtml/nodes/Element;
    goto :goto_96

    :cond_87
    const-string v3, "head"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_93

    .line 251
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 252
    return v1

    .line 254
    :cond_93
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    .line 256
    .end local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    .end local v2    # "name":Ljava/lang/String;
    :goto_96
    goto :goto_c6

    :cond_97
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    if-eqz v0, :cond_c3

    .line 257
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v0

    .line 258
    .local v0, "name":Ljava/lang/String;
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->AfterHeadBody:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b1

    .line 259
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    goto :goto_be

    .line 260
    :cond_b1
    const-string v2, "template"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_bf

    .line 261
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 267
    .end local v0    # "name":Ljava/lang/String;
    :goto_be
    goto :goto_c6

    .line 264
    .restart local v0    # "name":Ljava/lang/String;
    :cond_bf
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 265
    return v1

    .line 268
    .end local v0    # "name":Ljava/lang/String;
    :cond_c3
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    .line 270
    :goto_c6
    const/4 v0, 0x1

    return v0
.end method
