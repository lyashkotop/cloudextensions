.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;
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

    .line 1517
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1520
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$25;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v1, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$TokenType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-string v1, "template"

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_f8

    goto/16 :goto_f7

    .line 1569
    :pswitch_12
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_19

    .line 1570
    return v2

    .line 1572
    :cond_19
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1573
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1574
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    .line 1575
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1576
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->resetInsertionMode()Z

    .line 1579
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InTemplate:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    if-eq v0, v1, :cond_3d

    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->templateModeSize()I

    move-result v0

    const/16 v1, 0xc

    if-ge v0, v1, :cond_3d

    .line 1580
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 1581
    :cond_3d
    return v2

    .line 1560
    :pswitch_3e
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v0

    .line 1561
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_53

    .line 1562
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    goto/16 :goto_f7

    .line 1564
    :cond_53
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1565
    const/4 v1, 0x0

    return v1

    .line 1527
    .end local v0    # "name":Ljava/lang/String;
    :pswitch_58
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v0

    .line 1528
    .restart local v0    # "name":Ljava/lang/String;
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTemplateToHead:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6f

    .line 1529
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    goto/16 :goto_f7

    .line 1530
    :cond_6f
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTemplateToTable:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_89

    .line 1531
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1532
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushTemplateMode(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1533
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1534
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1536
    :cond_89
    const-string v1, "col"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a3

    .line 1537
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1538
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InColumnGroup:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushTemplateMode(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1539
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InColumnGroup:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1540
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1541
    :cond_a3
    const-string v1, "tr"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bd

    .line 1542
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1543
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushTemplateMode(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1544
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1545
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1546
    :cond_bd
    const-string v1, "td"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_df

    const-string v1, "th"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_df

    .line 1552
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1553
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushTemplateMode(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1554
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1555
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1547
    :cond_df
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1548
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushTemplateMode(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1549
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1550
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1524
    .end local v0    # "name":Ljava/lang/String;
    :pswitch_f1
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 1525
    nop

    .line 1583
    :goto_f7
    return v2

    :pswitch_data_f8
    .packed-switch 0x1
        :pswitch_f1
        :pswitch_f1
        :pswitch_58
        :pswitch_3e
        :pswitch_f1
        :pswitch_12
    .end packed-switch
.end method
