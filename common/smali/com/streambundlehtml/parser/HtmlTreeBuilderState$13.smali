.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;
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

    .line 1223
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1280
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0
.end method

.method private exitTableBody(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1269
    const-string v0, "tbody"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "thead"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "tfoot"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 1271
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1272
    const/4 v0, 0x0

    return v0

    .line 1274
    :cond_1d
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableBodyContext()V

    .line 1275
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 1276
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 7
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1225
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$25;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v1, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$TokenType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_9a

    .line 1263
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0

    .line 1243
    :pswitch_12
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    .line 1244
    .local v0, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v1

    .line 1245
    .local v1, "name":Ljava/lang/String;
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableEndIgnore:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_39

    .line 1246
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2d

    .line 1247
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1248
    return v3

    .line 1250
    :cond_2d
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableBodyContext()V

    .line 1251
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 1252
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto :goto_72

    .line 1254
    :cond_39
    const-string v2, "table"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 1255
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;->exitTableBody(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    .line 1256
    :cond_46
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableBodyEndIgnore:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_52

    .line 1257
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1258
    return v3

    .line 1260
    :cond_52
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    .line 1227
    .end local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_57
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    .line 1228
    .local v0, "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v1

    .line 1229
    .restart local v1    # "name":Ljava/lang/String;
    const-string v2, "tr"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_74

    .line 1230
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableBodyContext()V

    .line 1231
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1232
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1265
    .end local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    .end local v1    # "name":Ljava/lang/String;
    :goto_72
    const/4 v0, 0x1

    return v0

    .line 1233
    .restart local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    .restart local v1    # "name":Ljava/lang/String;
    :cond_74
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InCellNames:[Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_87

    .line 1234
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1235
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 1236
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v2

    return v2

    .line 1237
    :cond_87
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableBodyExit:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_94

    .line 1238
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;->exitTableBody(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    .line 1240
    :cond_94
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    nop

    :pswitch_data_9a
    .packed-switch 0x3
        :pswitch_57
        :pswitch_12
    .end packed-switch
.end method
