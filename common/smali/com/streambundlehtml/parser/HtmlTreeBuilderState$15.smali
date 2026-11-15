.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;
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

    .line 1345
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1391
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0
.end method

.method private closeCell(Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    .registers 4
    .param p1, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1395
    const-string v0, "td"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 1396
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    goto :goto_11

    .line 1398
    :cond_c
    const-string v0, "th"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 1399
    :goto_11
    return-void
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 7
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1347
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6b

    .line 1348
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    .line 1349
    .local v0, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v2

    .line 1351
    .local v2, "name":Ljava/lang/String;
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InCellNames:[Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_40

    .line 1352
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_26

    .line 1353
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1354
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1355
    return v1

    .line 1357
    :cond_26
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 1358
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_32

    .line 1359
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1360
    :cond_32
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1361
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    .line 1362
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1376
    .end local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v2    # "name":Ljava/lang/String;
    nop

    .line 1387
    const/4 v0, 0x1

    return v0

    .line 1363
    .restart local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .restart local v2    # "name":Ljava/lang/String;
    :cond_40
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InCellBody:[Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 1364
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1365
    return v1

    .line 1366
    :cond_4c
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InCellTable:[Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_66

    .line 1367
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5e

    .line 1368
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1369
    return v1

    .line 1371
    :cond_5e
    invoke-direct {p0, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;->closeCell(Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    .line 1372
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1374
    :cond_66
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 1376
    .end local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v2    # "name":Ljava/lang/String;
    :cond_6b
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    if-eqz v0, :cond_9d

    .line 1377
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InCellCol:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9d

    .line 1378
    const-string v0, "td"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_95

    const-string v0, "th"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_95

    .line 1379
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1380
    return v1

    .line 1382
    :cond_95
    invoke-direct {p0, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;->closeCell(Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    .line 1383
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 1385
    :cond_9d
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0
.end method
