.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;
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

    .line 1401
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1493
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1494
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 12
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1403
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$25;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v1, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$TokenType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-string v1, "template"

    const/4 v2, 0x1

    const-string v3, "html"

    const-string v4, "select"

    const/4 v5, 0x0

    const-string v6, "optgroup"

    const-string v7, "option"

    packed-switch v0, :pswitch_data_16c

    .line 1487
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0

    .line 1483
    :pswitch_1e
    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16a

    .line 1484
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_16a

    .line 1405
    :pswitch_29
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    .line 1406
    .local v0, "c":Lcom/streambundlehtml/parser/Token$Character;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v1

    # getter for: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;
    invoke-static {}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$400()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 1407
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1408
    return v5

    .line 1410
    :cond_3f
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    .line 1412
    goto/16 :goto_16a

    .line 1450
    .end local v0    # "c":Lcom/streambundlehtml/parser/Token$Character;
    :pswitch_44
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    .line 1451
    .local v0, "end":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v3

    .line 1452
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_17c

    goto :goto_74

    :sswitch_54
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_74

    const/4 v1, 0x0

    goto :goto_75

    :sswitch_5c
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_74

    const/4 v1, 0x2

    goto :goto_75

    :sswitch_64
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_74

    const/4 v1, 0x1

    goto :goto_75

    :sswitch_6c
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_74

    const/4 v1, 0x3

    goto :goto_75

    :cond_74
    :goto_74
    const/4 v1, -0x1

    :goto_75
    packed-switch v1, :pswitch_data_18e

    .line 1479
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 1477
    :pswitch_7d
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v1

    return v1

    .line 1468
    :pswitch_84
    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inSelectScope(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8e

    .line 1469
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1470
    return v5

    .line 1472
    :cond_8e
    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1473
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->resetInsertionMode()Z

    .line 1475
    goto :goto_d6

    .line 1462
    :pswitch_95
    invoke-virtual {p2, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9f

    .line 1463
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    goto :goto_d6

    .line 1465
    :cond_9f
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1466
    goto :goto_d6

    .line 1454
    :pswitch_a3
    invoke-virtual {p2, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c8

    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->aboveOnStack(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_c8

    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->aboveOnStack(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c8

    .line 1455
    invoke-virtual {p2, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 1456
    :cond_c8
    invoke-virtual {p2, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d2

    .line 1457
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    goto :goto_d6

    .line 1459
    :cond_d2
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1460
    nop

    .line 1481
    :goto_d6
    goto/16 :goto_16a

    .line 1420
    .end local v0    # "end":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v3    # "name":Ljava/lang/String;
    :pswitch_d8
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    .line 1421
    .local v0, "start":Lcom/streambundlehtml/parser/Token$StartTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v8

    .line 1422
    .local v8, "name":Ljava/lang/String;
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ed

    .line 1423
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v1

    return v1

    .line 1424
    :cond_ed
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_100

    .line 1425
    invoke-virtual {p2, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_fc

    .line 1426
    invoke-virtual {p2, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 1427
    :cond_fc
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_16a

    .line 1428
    :cond_100
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11c

    .line 1429
    invoke-virtual {p2, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10f

    .line 1430
    invoke-virtual {p2, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 1431
    :cond_10f
    invoke-virtual {p2, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_118

    .line 1432
    invoke-virtual {p2, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 1433
    :cond_118
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_16a

    .line 1434
    :cond_11c
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12a

    .line 1435
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1436
    invoke-virtual {p2, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    move-result v1

    return v1

    .line 1437
    :cond_12a
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InSelectEnd:[Ljava/lang/String;

    invoke-static {v8, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_144

    .line 1438
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1439
    invoke-virtual {p2, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inSelectScope(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_13c

    .line 1440
    return v5

    .line 1441
    :cond_13c
    invoke-virtual {p2, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 1442
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1443
    :cond_144
    const-string v2, "script"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_157

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_157

    .line 1446
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 1444
    :cond_157
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v1

    return v1

    .line 1417
    .end local v0    # "start":Lcom/streambundlehtml/parser/Token$StartTag;
    .end local v8    # "name":Ljava/lang/String;
    :pswitch_15e
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1418
    return v5

    .line 1414
    :pswitch_162
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    .line 1415
    nop

    .line 1489
    :cond_16a
    :goto_16a
    return v2

    nop

    :pswitch_data_16c
    .packed-switch 0x1
        :pswitch_162
        :pswitch_15e
        :pswitch_d8
        :pswitch_44
        :pswitch_29
        :pswitch_1e
    .end packed-switch

    :sswitch_data_17c
    .sparse-switch
        -0x4ec53386 -> :sswitch_6c
        -0x3c35778b -> :sswitch_64
        -0x3600cb04 -> :sswitch_5c
        -0x4d08054 -> :sswitch_54
    .end sparse-switch

    :pswitch_data_18e
    .packed-switch 0x0
        :pswitch_a3
        :pswitch_95
        :pswitch_84
        :pswitch_7d
    .end packed-switch
.end method
