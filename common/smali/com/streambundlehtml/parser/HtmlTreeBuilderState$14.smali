.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;
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

    .line 1283
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1334
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0
.end method

.method private handleMissingTr(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/TreeBuilder;)Z
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/TreeBuilder;

    .line 1338
    const-string v0, "tr"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/TreeBuilder;->processEndTag(Ljava/lang/String;)Z

    move-result v0

    .line 1339
    .local v0, "processed":Z
    if-eqz v0, :cond_d

    .line 1340
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/TreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1342
    :cond_d
    const/4 v1, 0x0

    return v1
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 8
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1285
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 1286
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    .line 1287
    .local v0, "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v1

    .line 1289
    .local v1, "name":Ljava/lang/String;
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InCellNames:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 1290
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableRowContext()V

    .line 1291
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1292
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->InCell:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1293
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertMarkerToFormattingElements()V

    .line 1299
    .end local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    .end local v1    # "name":Ljava/lang/String;
    goto :goto_91

    .line 1294
    .restart local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    .restart local v1    # "name":Ljava/lang/String;
    :cond_25
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InRowMissing:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 1295
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->handleMissingTr(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/TreeBuilder;)Z

    move-result v2

    return v2

    .line 1297
    :cond_32
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    .line 1299
    .end local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    .end local v1    # "name":Ljava/lang/String;
    :cond_37
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    if-eqz v0, :cond_a8

    .line 1300
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    .line 1301
    .local v0, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v1

    .line 1303
    .restart local v1    # "name":Ljava/lang/String;
    const-string v2, "tr"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_64

    .line 1304
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_58

    .line 1305
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1306
    return v4

    .line 1308
    :cond_58
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableRowContext()V

    .line 1309
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 1310
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto :goto_90

    .line 1311
    :cond_64
    const-string v3, "table"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_71

    .line 1312
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->handleMissingTr(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/TreeBuilder;)Z

    move-result v2

    return v2

    .line 1313
    :cond_71
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableToBody:[Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_97

    .line 1314
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_93

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_93

    .line 1318
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableRowContext()V

    .line 1319
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 1320
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1327
    .end local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :goto_90
    nop

    .line 1330
    :goto_91
    const/4 v0, 0x1

    return v0

    .line 1315
    .restart local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .restart local v1    # "name":Ljava/lang/String;
    :cond_93
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1316
    return v4

    .line 1321
    :cond_97
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InRowIgnore:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a3

    .line 1322
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1323
    return v4

    .line 1325
    :cond_a3
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    .line 1328
    .end local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :cond_a8
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0
.end method
