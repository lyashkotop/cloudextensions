.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;
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


# static fields
.field private static final MaxStackScan:I = 0x18


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .line 279
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private inBodyEndTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 11
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 694
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    .line 695
    .local v0, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v1

    .line 697
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x1

    const-string v4, "br"

    const-string v5, "template"

    const-string v6, "body"

    const/4 v7, 0x0

    sparse-switch v2, :sswitch_data_220

    goto/16 :goto_cd

    :sswitch_19
    const-string v2, "sarcasm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/4 v2, 0x1

    goto/16 :goto_ce

    :sswitch_24
    const-string v2, "span"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/4 v2, 0x2

    goto/16 :goto_ce

    :sswitch_2f
    const-string v2, "html"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/4 v2, 0x5

    goto/16 :goto_ce

    :sswitch_3a
    const-string v2, "form"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/4 v2, 0x6

    goto/16 :goto_ce

    :sswitch_45
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/4 v2, 0x4

    goto/16 :goto_ce

    :sswitch_4e
    const-string v2, "li"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/4 v2, 0x3

    goto/16 :goto_ce

    :sswitch_59
    const-string v2, "h6"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0xf

    goto/16 :goto_ce

    :sswitch_65
    const-string v2, "h5"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0xe

    goto :goto_ce

    :sswitch_70
    const-string v2, "h4"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0xd

    goto :goto_ce

    :sswitch_7b
    const-string v2, "h3"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0xc

    goto :goto_ce

    :sswitch_86
    const-string v2, "h2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0xb

    goto :goto_ce

    :sswitch_91
    const-string v2, "h1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0xa

    goto :goto_ce

    :sswitch_9c
    const-string v2, "dt"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0x9

    goto :goto_ce

    :sswitch_a7
    const-string v2, "dd"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0x8

    goto :goto_ce

    :sswitch_b2
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/16 v2, 0x10

    goto :goto_ce

    :sswitch_bb
    const-string v2, "p"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/4 v2, 0x7

    goto :goto_ce

    :sswitch_c5
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    const/4 v2, 0x0

    goto :goto_ce

    :cond_cd
    :goto_cd
    const/4 v2, -0x1

    :goto_ce
    packed-switch v2, :pswitch_data_266

    .line 800
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyEndAdoptionFormatters:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1cb

    .line 801
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->inBodyEndTagAdoption(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    .line 795
    :pswitch_de
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 796
    invoke-virtual {p2, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 797
    return v7

    .line 784
    :pswitch_e5
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope([Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_f1

    .line 785
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 786
    return v7

    .line 788
    :cond_f1
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 789
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_fd

    .line 790
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 791
    :cond_fd
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose([Ljava/lang/String;)V

    .line 793
    goto/16 :goto_219

    .line 768
    :pswitch_104
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_10e

    .line 769
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 770
    return v7

    .line 772
    :cond_10e
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 773
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_11a

    .line 774
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 775
    :cond_11a
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 777
    goto/16 :goto_219

    .line 755
    :pswitch_11f
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_130

    .line 756
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 757
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 758
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v2

    return v2

    .line 760
    :cond_130
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 761
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_13c

    .line 762
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 763
    :cond_13c
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 765
    goto/16 :goto_219

    .line 732
    :pswitch_141
    invoke-virtual {p2, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_16c

    .line 733
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFormElement()Lcom/streambundlehtml/nodes/FormElement;

    move-result-object v2

    .line 734
    .local v2, "currentForm":Lcom/streambundlehtml/nodes/Element;
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->setFormElement(Lcom/streambundlehtml/nodes/FormElement;)V

    .line 735
    if-eqz v2, :cond_168

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_168

    .line 739
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 740
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_163

    .line 741
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 743
    :cond_163
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromStack(Lcom/streambundlehtml/nodes/Element;)Z

    .line 744
    .end local v2    # "currentForm":Lcom/streambundlehtml/nodes/Element;
    goto/16 :goto_219

    .line 736
    .restart local v2    # "currentForm":Lcom/streambundlehtml/nodes/Element;
    :cond_168
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 737
    return v7

    .line 745
    .end local v2    # "currentForm":Lcom/streambundlehtml/nodes/Element;
    :cond_16c
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_176

    .line 746
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 747
    return v7

    .line 749
    :cond_176
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 750
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_182

    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 751
    :cond_182
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 753
    goto/16 :goto_219

    .line 727
    :pswitch_187
    invoke-virtual {p2, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    move-result v2

    .line 728
    .local v2, "notIgnored":Z
    if-eqz v2, :cond_219

    .line 729
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v3

    return v3

    .line 717
    .end local v2    # "notIgnored":Z
    :pswitch_192
    invoke-virtual {p2, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_19c

    .line 718
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 719
    return v7

    .line 722
    :cond_19c
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    .line 723
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->AfterBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 725
    goto/16 :goto_219

    .line 706
    :pswitch_1a6
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inListItemScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1b0

    .line 707
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 708
    return v7

    .line 710
    :cond_1b0
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 711
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1bc

    .line 712
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 713
    :cond_1bc
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 715
    goto :goto_219

    .line 704
    :pswitch_1c0
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    .line 699
    :pswitch_1c5
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 700
    goto :goto_219

    .line 802
    :cond_1cb
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyEndClosers:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1ed

    .line 803
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1dd

    .line 805
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 806
    return v7

    .line 808
    :cond_1dd
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 809
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1e9

    .line 810
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 811
    :cond_1e9
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_219

    .line 813
    :cond_1ed
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartApplets:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_21a

    .line 814
    const-string v2, "name"

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_219

    .line 815
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_207

    .line 816
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 817
    return v7

    .line 819
    :cond_207
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 820
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_213

    .line 821
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 822
    :cond_213
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 823
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    .line 829
    :cond_219
    :goto_219
    return v3

    .line 826
    :cond_21a
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v2

    return v2

    nop

    :sswitch_data_220
    .sparse-switch
        -0x4ec53386 -> :sswitch_c5
        0x70 -> :sswitch_bb
        0xc50 -> :sswitch_b2
        0xc80 -> :sswitch_a7
        0xc90 -> :sswitch_9c
        0xcc9 -> :sswitch_91
        0xcca -> :sswitch_86
        0xccb -> :sswitch_7b
        0xccc -> :sswitch_70
        0xccd -> :sswitch_65
        0xcce -> :sswitch_59
        0xd7d -> :sswitch_4e
        0x2e39a2 -> :sswitch_45
        0x300cc4 -> :sswitch_3a
        0x3107ab -> :sswitch_2f
        0x35f74a -> :sswitch_24
        0x6f67a51c -> :sswitch_19
    .end sparse-switch

    :pswitch_data_266
    .packed-switch 0x0
        :pswitch_1c5
        :pswitch_1c0
        :pswitch_1c0
        :pswitch_1a6
        :pswitch_192
        :pswitch_187
        :pswitch_141
        :pswitch_11f
        :pswitch_104
        :pswitch_104
        :pswitch_e5
        :pswitch_e5
        :pswitch_e5
        :pswitch_e5
        :pswitch_e5
        :pswitch_e5
        :pswitch_de
    .end packed-switch
.end method

.method private inBodyEndTagAdoption(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 21
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 863
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {p1 .. p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v2

    .line 864
    .local v2, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v3

    .line 866
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v4

    .line 868
    .local v4, "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_11
    const/16 v6, 0x8

    const/4 v7, 0x1

    if-ge v5, v6, :cond_143

    .line 869
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getActiveFormattingElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v6

    .line 870
    .local v6, "formatEl":Lcom/streambundlehtml/nodes/Element;
    if-nez v6, :cond_21

    .line 871
    invoke-virtual/range {p0 .. p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v7

    return v7

    .line 872
    :cond_21
    invoke-virtual {v1, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v8

    if-nez v8, :cond_2e

    .line 873
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 874
    invoke-virtual {v1, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 875
    return v7

    .line 876
    :cond_2e
    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3d

    .line 877
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 878
    const/4 v7, 0x0

    return v7

    .line 879
    :cond_3d
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v8

    if-eq v8, v6, :cond_46

    .line 880
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 882
    :cond_46
    const/4 v8, 0x0

    .line 883
    .local v8, "furthestBlock":Lcom/streambundlehtml/nodes/Element;
    const/4 v9, 0x0

    .line 884
    .local v9, "commonAncestor":Lcom/streambundlehtml/nodes/Element;
    const/4 v10, 0x0

    .line 886
    .local v10, "seenFormattingElement":Z
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 887
    .local v11, "stackSize":I
    const/4 v12, -0x1

    .line 888
    .local v12, "bookmark":I
    const/4 v13, 0x1

    .local v13, "si":I
    :goto_4f
    if-ge v13, v11, :cond_79

    const/16 v14, 0x40

    if-ge v13, v14, :cond_79

    .line 890
    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/streambundlehtml/nodes/Element;

    .line 891
    .local v14, "el":Lcom/streambundlehtml/nodes/Element;
    if-ne v14, v6, :cond_6c

    .line 892
    add-int/lit8 v15, v13, -0x1

    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    move-object v9, v15

    check-cast v9, Lcom/streambundlehtml/nodes/Element;

    .line 893
    const/4 v10, 0x1

    .line 895
    invoke-virtual {v1, v14}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->positionOfElement(Lcom/streambundlehtml/nodes/Element;)I

    move-result v12

    goto :goto_76

    .line 896
    :cond_6c
    if-eqz v10, :cond_76

    invoke-virtual {v1, v14}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->isSpecial(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v15

    if-eqz v15, :cond_76

    .line 897
    move-object v8, v14

    .line 898
    goto :goto_79

    .line 888
    :cond_76
    :goto_76
    add-int/lit8 v13, v13, 0x1

    goto :goto_4f

    .line 901
    .end local v13    # "si":I
    .end local v14    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_79
    :goto_79
    if-nez v8, :cond_86

    .line 902
    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 903
    invoke-virtual {v1, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 904
    return v7

    .line 907
    :cond_86
    move-object v13, v8

    .line 908
    .local v13, "node":Lcom/streambundlehtml/nodes/Element;
    move-object v14, v8

    .line 909
    .local v14, "lastNode":Lcom/streambundlehtml/nodes/Element;
    const/4 v15, 0x0

    .local v15, "j":I
    :goto_89
    const/16 v16, 0x1

    const/4 v7, 0x3

    if-ge v15, v7, :cond_e4

    .line 910
    invoke-virtual {v1, v13}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v7

    if-eqz v7, :cond_98

    .line 911
    invoke-virtual {v1, v13}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->aboveOnStack(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v13

    .line 912
    :cond_98
    invoke-virtual {v1, v13}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->isInActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v7

    if-nez v7, :cond_a4

    .line 913
    invoke-virtual {v1, v13}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromStack(Lcom/streambundlehtml/nodes/Element;)Z

    .line 914
    move-object/from16 v17, v2

    goto :goto_dc

    .line 915
    :cond_a4
    if-ne v13, v6, :cond_a9

    .line 916
    move-object/from16 v17, v2

    goto :goto_e6

    .line 918
    :cond_a9
    new-instance v7, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v13}, Lcom/streambundlehtml/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v17, v2

    .end local v2    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .local v17, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    sget-object v2, Lcom/streambundlehtml/parser/ParseSettings;->preserveCase:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {v1, v0, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getBaseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v0, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V

    .line 920
    .local v7, "replacement":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, v13, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->replaceActiveFormattingElement(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V

    .line 921
    invoke-virtual {v1, v13, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->replaceOnStack(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V

    .line 922
    move-object v0, v7

    .line 924
    .end local v13    # "node":Lcom/streambundlehtml/nodes/Element;
    .local v0, "node":Lcom/streambundlehtml/nodes/Element;
    if-ne v14, v8, :cond_cd

    .line 927
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->positionOfElement(Lcom/streambundlehtml/nodes/Element;)I

    move-result v2

    add-int/lit8 v12, v2, 0x1

    .line 929
    :cond_cd
    invoke-virtual {v14}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    if-eqz v2, :cond_d6

    .line 930
    invoke-virtual {v14}, Lcom/streambundlehtml/nodes/Element;->remove()V

    .line 931
    :cond_d6
    invoke-virtual {v0, v14}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 933
    move-object v2, v0

    move-object v13, v0

    move-object v14, v2

    .line 909
    .end local v0    # "node":Lcom/streambundlehtml/nodes/Element;
    .end local v7    # "replacement":Lcom/streambundlehtml/nodes/Element;
    .restart local v13    # "node":Lcom/streambundlehtml/nodes/Element;
    :goto_dc
    add-int/lit8 v15, v15, 0x1

    const/4 v7, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, v17

    goto :goto_89

    .end local v17    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .restart local v2    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    :cond_e4
    move-object/from16 v17, v2

    .line 936
    .end local v2    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v15    # "j":I
    .restart local v17    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    :goto_e6
    if-eqz v9, :cond_10d

    .line 937
    invoke-virtual {v9}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyEndTableFosters:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_101

    .line 938
    invoke-virtual {v14}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_fd

    .line 939
    invoke-virtual {v14}, Lcom/streambundlehtml/nodes/Element;->remove()V

    .line 940
    :cond_fd
    invoke-virtual {v1, v14}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertInFosterParent(Lcom/streambundlehtml/nodes/Node;)V

    goto :goto_10d

    .line 942
    :cond_101
    invoke-virtual {v14}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_10a

    .line 943
    invoke-virtual {v14}, Lcom/streambundlehtml/nodes/Element;->remove()V

    .line 944
    :cond_10a
    invoke-virtual {v9, v14}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 948
    :cond_10d
    :goto_10d
    new-instance v0, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v2

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getBaseUri()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v2, v7}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V

    .line 949
    .local v0, "adopter":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v2

    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/streambundlehtml/nodes/Attributes;->addAll(Lcom/streambundlehtml/nodes/Attributes;)V

    .line 950
    invoke-virtual {v8}, Lcom/streambundlehtml/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/nodes/Element;->appendChildren(Ljava/util/Collection;)Lcom/streambundlehtml/nodes/Element;

    .line 951
    invoke-virtual {v8, v0}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 952
    invoke-virtual {v1, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 954
    invoke-virtual {v1, v0, v12}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushWithBookmark(Lcom/streambundlehtml/nodes/Element;I)V

    .line 955
    invoke-virtual {v1, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromStack(Lcom/streambundlehtml/nodes/Element;)Z

    .line 956
    invoke-virtual {v1, v8, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertOnStackAfter(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V

    .line 868
    .end local v0    # "adopter":Lcom/streambundlehtml/nodes/Element;
    .end local v6    # "formatEl":Lcom/streambundlehtml/nodes/Element;
    .end local v8    # "furthestBlock":Lcom/streambundlehtml/nodes/Element;
    .end local v9    # "commonAncestor":Lcom/streambundlehtml/nodes/Element;
    .end local v10    # "seenFormattingElement":Z
    .end local v11    # "stackSize":I
    .end local v12    # "bookmark":I
    .end local v13    # "node":Lcom/streambundlehtml/nodes/Element;
    .end local v14    # "lastNode":Lcom/streambundlehtml/nodes/Element;
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, v17

    goto/16 :goto_11

    .end local v17    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .restart local v2    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    :cond_143
    const/16 v16, 0x1

    .line 958
    .end local v5    # "i":I
    return v16
.end method

.method private inBodyStartTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 23
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 321
    move-object/from16 v1, p2

    invoke-virtual/range {p1 .. p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v2

    .line 322
    .local v2, "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v3

    .line 326
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    const-string v5, "isindex"

    const-string v6, "input"

    const-string v7, "svg"

    const-string v8, "img"

    const-string v11, "nobr"

    const-string v12, "form"

    const-string v13, "li"

    const-string v14, "hr"

    const-string v15, "option"

    const-string v9, "button"

    const-string v10, "body"

    move/from16 v16, v4

    const-string v4, "a"

    const/16 v17, 0x1

    sparse-switch v16, :sswitch_data_86a

    goto/16 :goto_28d

    :sswitch_2f
    const-string v0, "noembed"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x12

    goto/16 :goto_28e

    :sswitch_3b
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0xe

    goto/16 :goto_28e

    :sswitch_45
    const-string v0, "plaintext"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/4 v0, 0x7

    goto/16 :goto_28e

    :sswitch_50
    const-string v0, "listing"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x1d

    goto/16 :goto_28e

    :sswitch_5c
    const-string v0, "table"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0xa

    goto/16 :goto_28e

    :sswitch_68
    const-string v0, "small"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x31

    goto/16 :goto_28e

    :sswitch_74
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0xb

    goto/16 :goto_28e

    :sswitch_7e
    const-string v0, "image"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0xd

    goto/16 :goto_28e

    :sswitch_8a
    const-string v0, "embed"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x26

    goto/16 :goto_28e

    :sswitch_96
    const-string v0, "span"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/4 v0, 0x1

    goto/16 :goto_28e

    :sswitch_a1
    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x9

    goto/16 :goto_28e

    :sswitch_ab
    const-string v0, "math"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x14

    goto/16 :goto_28e

    :sswitch_b7
    const-string v0, "html"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/4 v0, 0x3

    goto/16 :goto_28e

    :sswitch_c2
    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/4 v0, 0x6

    goto/16 :goto_28e

    :sswitch_cb
    const-string v0, "font"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x2e

    goto/16 :goto_28e

    :sswitch_d7
    const-string v0, "code"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x2c

    goto/16 :goto_28e

    :sswitch_e3
    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/4 v0, 0x4

    goto/16 :goto_28e

    :sswitch_ec
    const-string v0, "area"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x24

    goto/16 :goto_28e

    :sswitch_f8
    const-string v0, "xmp"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x10

    goto/16 :goto_28e

    :sswitch_104
    const-string v0, "wbr"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x29

    goto/16 :goto_28e

    :sswitch_110
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x15

    goto/16 :goto_28e

    :sswitch_11a
    const-string v0, "pre"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x1c

    goto/16 :goto_28e

    :sswitch_126
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x27

    goto/16 :goto_28e

    :sswitch_130
    const-string v0, "big"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x2b

    goto/16 :goto_28e

    :sswitch_13c
    const-string v0, "tt"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x34

    goto/16 :goto_28e

    :sswitch_148
    const-string v0, "rt"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x23

    goto/16 :goto_28e

    :sswitch_154
    const-string v0, "rp"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x22

    goto/16 :goto_28e

    :sswitch_160
    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/4 v0, 0x2

    goto/16 :goto_28e

    :sswitch_169
    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0xc

    goto/16 :goto_28e

    :sswitch_173
    const-string v0, "h6"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x1b

    goto/16 :goto_28e

    :sswitch_17f
    const-string v0, "h5"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x1a

    goto/16 :goto_28e

    :sswitch_18b
    const-string v0, "h4"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x19

    goto/16 :goto_28e

    :sswitch_197
    const-string v0, "h3"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x18

    goto/16 :goto_28e

    :sswitch_1a3
    const-string v0, "h2"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x17

    goto/16 :goto_28e

    :sswitch_1af
    const-string v0, "h1"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x16

    goto/16 :goto_28e

    :sswitch_1bb
    const-string v0, "em"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x2d

    goto/16 :goto_28e

    :sswitch_1c7
    const-string v0, "dt"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x1f

    goto/16 :goto_28e

    :sswitch_1d3
    const-string v0, "dd"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x1e

    goto/16 :goto_28e

    :sswitch_1df
    const-string v0, "br"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x25

    goto/16 :goto_28e

    :sswitch_1eb
    const-string v0, "u"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x35

    goto/16 :goto_28e

    :sswitch_1f7
    const-string v0, "s"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x30

    goto/16 :goto_28e

    :sswitch_203
    const-string v0, "i"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x2f

    goto/16 :goto_28e

    :sswitch_20f
    const-string v0, "b"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x2a

    goto/16 :goto_28e

    :sswitch_21b
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/4 v0, 0x0

    goto/16 :goto_28e

    :sswitch_224
    const-string v0, "optgroup"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x20

    goto :goto_28e

    :sswitch_22f
    const-string v0, "strong"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x33

    goto :goto_28e

    :sswitch_23a
    const-string v0, "strike"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x32

    goto :goto_28e

    :sswitch_245
    const-string v0, "select"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x13

    goto :goto_28e

    :sswitch_250
    const-string v0, "textarea"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0xf

    goto :goto_28e

    :sswitch_25b
    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x21

    goto :goto_28e

    :sswitch_264
    const-string v0, "keygen"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x28

    goto :goto_28e

    :sswitch_26f
    const-string v0, "iframe"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x11

    goto :goto_28e

    :sswitch_27a
    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/16 v0, 0x8

    goto :goto_28e

    :sswitch_283
    const-string v0, "frameset"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28d

    const/4 v0, 0x5

    goto :goto_28e

    :cond_28d
    :goto_28d
    const/4 v0, -0x1

    :goto_28e
    move/from16 v18, v0

    const-string v0, "template"

    move-object/from16 v19, v3

    .end local v3    # "name":Ljava/lang/String;
    .local v19, "name":Ljava/lang/String;
    const-string v3, "p"

    packed-switch v18, :pswitch_data_944

    .line 665
    move-object/from16 v0, p0

    invoke-static/range {v19 .. v19}, Lcom/streambundlehtml/parser/Tag;->isKnownTag(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_805

    .line 666
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-object/from16 v4, p1

    move-object/from16 v5, v19

    goto/16 :goto_867

    .line 659
    :pswitch_2aa
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 660
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 661
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 662
    move-object/from16 v0, p0

    move-object/from16 v4, p1

    move-object/from16 v5, v19

    goto/16 :goto_867

    .line 642
    .end local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    :pswitch_2bc
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 643
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 644
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 645
    move-object/from16 v0, p0

    move-object/from16 v4, p1

    move-object/from16 v5, v19

    goto/16 :goto_867

    .line 625
    :pswitch_2ce
    const-string v0, "ruby"

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2f4

    .line 626
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 627
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2e8

    .line 628
    move-object/from16 v4, p0

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 629
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToBefore(Ljava/lang/String;)V

    goto :goto_2ea

    .line 627
    :cond_2e8
    move-object/from16 v4, p0

    .line 631
    :goto_2ea
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 625
    :cond_2f4
    move-object/from16 v4, p0

    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 617
    :pswitch_2fd
    move-object/from16 v4, p0

    invoke-virtual {v1, v15}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_308

    .line 618
    invoke-virtual {v1, v15}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 619
    :cond_308
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 620
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 621
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 596
    :pswitch_315
    move-object/from16 v4, p0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 597
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v0

    .line 598
    .local v0, "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    .line 599
    .local v5, "bottom":I
    const/16 v6, 0x18

    if-lt v5, v6, :cond_32e

    add-int/lit8 v6, v5, -0x18

    move/from16 v16, v6

    goto :goto_330

    :cond_32e
    const/16 v16, 0x0

    :goto_330
    move/from16 v6, v16

    .line 600
    .local v6, "upper":I
    move v7, v5

    .local v7, "i":I
    :goto_333
    if-lt v7, v6, :cond_365

    .line 601
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/streambundlehtml/nodes/Element;

    .line 602
    .local v8, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v8}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;

    invoke-static {v9, v10}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_34f

    .line 603
    invoke-virtual {v8}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 604
    goto :goto_365

    .line 606
    :cond_34f
    invoke-virtual {v1, v8}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->isSpecial(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v9

    if-eqz v9, :cond_362

    invoke-virtual {v8}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartLiBreakers:[Ljava/lang/String;

    invoke-static {v9, v10}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_362

    .line 607
    goto :goto_365

    .line 600
    :cond_362
    add-int/lit8 v7, v7, -0x1

    goto :goto_333

    .line 609
    .end local v7    # "i":I
    .end local v8    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_365
    :goto_365
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_36e

    .line 610
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 612
    :cond_36e
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 613
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 586
    .end local v0    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    .end local v5    # "bottom":I
    .end local v6    # "upper":I
    :pswitch_378
    move-object/from16 v4, p0

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_383

    .line 587
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 589
    :cond_383
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 590
    iget-object v0, v1, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    const-string v3, "\n"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    .line 591
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 592
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 574
    :pswitch_398
    move-object/from16 v4, p0

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3a3

    .line 575
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 577
    :cond_3a3
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;

    invoke-static {v0, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3b9

    .line 578
    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 579
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 581
    :cond_3b9
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 582
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 563
    :pswitch_3c3
    move-object/from16 v4, p0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 565
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 566
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 558
    :pswitch_3d2
    move-object/from16 v4, p0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 560
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 561
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 546
    :pswitch_3e1
    move-object/from16 v4, p0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 547
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 548
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 549
    iget-boolean v0, v2, Lcom/streambundlehtml/parser/Token$StartTag;->selfClosing:Z

    if-eqz v0, :cond_3f8

    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 551
    :cond_3f8
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-result-object v0

    .line 552
    .local v0, "state":Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_430

    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InCaption:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_430

    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_430

    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_430

    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InCell:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_430

    .line 555
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InSelect:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 556
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 553
    :cond_430
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InSelectInTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 543
    .end local v0    # "state":Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    :pswitch_43c
    move-object/from16 v4, p0

    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->handleRawtext(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    invoke-static {v2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$300(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    .line 544
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 538
    :pswitch_448
    move-object/from16 v4, p0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 539
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->handleRawtext(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    invoke-static {v2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$300(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    .line 540
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 530
    :pswitch_458
    move-object/from16 v4, p0

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_463

    .line 531
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 533
    :cond_463
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 534
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 535
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->handleRawtext(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    invoke-static {v2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$300(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    .line 536
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 521
    :pswitch_474
    move-object/from16 v4, p0

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 522
    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$StartTag;->isSelfClosing()Z

    move-result v0

    if-nez v0, :cond_499

    .line 523
    iget-object v0, v1, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v3, Lcom/streambundlehtml/parser/TokeniserState;->Rcdata:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 524
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 525
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 526
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->Text:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 522
    :cond_499
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 485
    :pswitch_4a0
    move-object/from16 v4, p0

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 486
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFormElement()Lcom/streambundlehtml/nodes/FormElement;

    move-result-object v0

    if-eqz v0, :cond_4ae

    .line 487
    const/16 v16, 0x0

    return v16

    .line 489
    :cond_4ae
    invoke-virtual {v1, v12}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 490
    const-string v0, "action"

    invoke-virtual {v2, v0}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4d2

    .line 491
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFormElement()Lcom/streambundlehtml/nodes/FormElement;

    move-result-object v3

    .line 492
    .local v3, "form":Lcom/streambundlehtml/nodes/Element;
    if-eqz v3, :cond_4d2

    invoke-virtual {v2, v0}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttribute(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4d2

    .line 493
    iget-object v7, v2, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v7, v0}, Lcom/streambundlehtml/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 494
    .local v7, "action":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v8

    invoke-virtual {v8, v0, v7}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 497
    .end local v3    # "form":Lcom/streambundlehtml/nodes/Element;
    .end local v7    # "action":Ljava/lang/String;
    :cond_4d2
    invoke-virtual {v1, v14}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 498
    const-string v0, "label"

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 500
    const-string v3, "prompt"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttribute(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4eb

    .line 501
    iget-object v3, v2, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    const-string v7, "prompt"

    invoke-virtual {v3, v7}, Lcom/streambundlehtml/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_4ed

    .line 502
    :cond_4eb
    const-string v3, "This is a searchable index. Enter search keywords: "

    :goto_4ed
    nop

    .line 504
    .local v3, "prompt":Ljava/lang/String;
    new-instance v7, Lcom/streambundlehtml/parser/Token$Character;

    invoke-direct {v7}, Lcom/streambundlehtml/parser/Token$Character;-><init>()V

    invoke-virtual {v7, v3}, Lcom/streambundlehtml/parser/Token$Character;->data(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    .line 507
    new-instance v7, Lcom/streambundlehtml/nodes/Attributes;

    invoke-direct {v7}, Lcom/streambundlehtml/nodes/Attributes;-><init>()V

    .line 508
    .local v7, "inputAttribs":Lcom/streambundlehtml/nodes/Attributes;
    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttributes()Z

    move-result v8

    if-eqz v8, :cond_527

    .line 509
    iget-object v8, v2, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v8}, Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_50b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_527

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/streambundlehtml/nodes/Attribute;

    .line 510
    .local v9, "attr":Lcom/streambundlehtml/nodes/Attribute;
    invoke-virtual {v9}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartInputAttribs:[Ljava/lang/String;

    invoke-static {v10, v11}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_526

    .line 511
    invoke-virtual {v7, v9}, Lcom/streambundlehtml/nodes/Attributes;->put(Lcom/streambundlehtml/nodes/Attribute;)Lcom/streambundlehtml/nodes/Attributes;

    .line 512
    .end local v9    # "attr":Lcom/streambundlehtml/nodes/Attribute;
    :cond_526
    goto :goto_50b

    .line 514
    :cond_527
    const-string v8, "name"

    invoke-virtual {v7, v8, v5}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 515
    invoke-virtual {v1, v6, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Z

    .line 516
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 517
    invoke-virtual {v1, v14}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 518
    invoke-virtual {v1, v12}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 519
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 478
    .end local v3    # "prompt":Ljava/lang/String;
    .end local v7    # "inputAttribs":Lcom/streambundlehtml/nodes/Attributes;
    :pswitch_53f
    move-object/from16 v4, p0

    invoke-virtual {v1, v7}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-nez v0, :cond_550

    .line 479
    invoke-virtual {v2, v8}, Lcom/streambundlehtml/parser/Token$StartTag;->name(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 481
    :cond_550
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 482
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 471
    :pswitch_55a
    move-object/from16 v4, p0

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_565

    .line 472
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 474
    :cond_565
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 475
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 476
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 465
    :pswitch_573
    move-object/from16 v4, p0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 466
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 467
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    const-string v3, "type"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "hidden"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_595

    .line 468
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 467
    :cond_595
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 457
    .end local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    :pswitch_59c
    move-object/from16 v4, p0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->quirksMode()Lcom/streambundlehtml/nodes/Document$QuirksMode;

    move-result-object v0

    sget-object v5, Lcom/streambundlehtml/nodes/Document$QuirksMode;->quirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    if-eq v0, v5, :cond_5b3

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5b3

    .line 458
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 460
    :cond_5b3
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 461
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 462
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 463
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 447
    :pswitch_5c6
    move-object/from16 v4, p0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 448
    invoke-virtual {v1, v11}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5da

    .line 449
    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 450
    invoke-virtual {v1, v11}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 451
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 453
    :cond_5da
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 454
    .restart local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 455
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 435
    .end local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    :pswitch_5e8
    move-object/from16 v4, p0

    invoke-virtual {v1, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_600

    .line 437
    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 438
    invoke-virtual {v1, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 439
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 441
    :cond_600
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 442
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 443
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 445
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 428
    :pswitch_611
    move-object/from16 v4, p0

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_61c

    .line 429
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 431
    :cond_61c
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 432
    iget-object v0, v1, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v3, Lcom/streambundlehtml/parser/TokeniserState;->PLAINTEXT:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 433
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 418
    :pswitch_62d
    move-object/from16 v4, p0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFormElement()Lcom/streambundlehtml/nodes/FormElement;

    move-result-object v5

    if-eqz v5, :cond_641

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_641

    .line 419
    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 420
    const/16 v16, 0x0

    return v16

    .line 422
    :cond_641
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_64a

    .line 423
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->closeElement(Ljava/lang/String;)V

    .line 425
    :cond_64a
    const/4 v0, 0x1

    invoke-virtual {v1, v2, v0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertForm(Lcom/streambundlehtml/parser/Token$StartTag;ZZ)Lcom/streambundlehtml/nodes/FormElement;

    .line 426
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 399
    :pswitch_655
    const/4 v0, 0x1

    move-object/from16 v4, p0

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 400
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v3

    .line 401
    .local v3, "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-eq v5, v0, :cond_6b5

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x2

    if-le v5, v6, :cond_67c

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6b5

    .line 404
    :cond_67c
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk()Z

    move-result v0

    if-nez v0, :cond_685

    .line 405
    const/16 v16, 0x0

    return v16

    .line 407
    :cond_685
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 408
    .local v0, "second":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    if-eqz v5, :cond_696

    .line 409
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->remove()V

    .line 411
    :cond_696
    :goto_696
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_6a6

    .line 412
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v6

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_696

    .line 413
    :cond_6a6
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 414
    sget-object v5, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v1, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 416
    .end local v0    # "second":Lcom/streambundlehtml/nodes/Element;
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 403
    :cond_6b5
    const/16 v16, 0x0

    return v16

    .line 381
    .end local v3    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    :pswitch_6b8
    move-object/from16 v4, p0

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 382
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v3

    .line 383
    .restart local v3    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_721

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v7, 0x2

    if-le v5, v7, :cond_6df

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_721

    :cond_6df
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_721

    .line 387
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 390
    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_71a

    invoke-virtual {v1, v10}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    move-object v5, v0

    .local v5, "body":Lcom/streambundlehtml/nodes/Element;
    if-eqz v0, :cond_71a

    .line 391
    iget-object v0, v2, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6fc
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_71a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/nodes/Attribute;

    .line 392
    .local v6, "attribute":Lcom/streambundlehtml/nodes/Attribute;
    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_719

    .line 393
    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/streambundlehtml/nodes/Attributes;->put(Lcom/streambundlehtml/nodes/Attribute;)Lcom/streambundlehtml/nodes/Attributes;

    .line 394
    .end local v6    # "attribute":Lcom/streambundlehtml/nodes/Attribute;
    :cond_719
    goto :goto_6fc

    .line 397
    .end local v5    # "body":Lcom/streambundlehtml/nodes/Element;
    :cond_71a
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 385
    :cond_721
    const/4 v5, 0x0

    return v5

    .line 366
    .end local v3    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    :pswitch_723
    const/4 v5, 0x0

    move-object/from16 v4, p0

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 367
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_730

    return v5

    .line 369
    :cond_730
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v0

    .line 370
    .local v0, "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_775

    .line 371
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    .line 372
    .local v3, "html":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttributes()Z

    move-result v5

    if-eqz v5, :cond_76e

    .line 373
    iget-object v5, v2, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_750
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_76e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/nodes/Attribute;

    .line 374
    .restart local v6    # "attribute":Lcom/streambundlehtml/nodes/Attribute;
    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_76d

    .line 375
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/streambundlehtml/nodes/Attributes;->put(Lcom/streambundlehtml/nodes/Attribute;)Lcom/streambundlehtml/nodes/Attributes;

    .line 376
    .end local v6    # "attribute":Lcom/streambundlehtml/nodes/Attribute;
    :cond_76d
    goto :goto_750

    .line 378
    .end local v3    # "html":Lcom/streambundlehtml/nodes/Element;
    :cond_76e
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 370
    :cond_775
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 349
    .end local v0    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    :pswitch_77c
    move-object/from16 v4, p0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 350
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v0

    .line 351
    .restart local v0    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/16 v17, 0x1

    add-int/lit8 v5, v5, -0x1

    .local v5, "i":I
    :goto_78e
    if-lez v5, :cond_7ba

    .line 352
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/nodes/Element;

    .line 353
    .local v6, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7a4

    .line 354
    invoke-virtual {v1, v13}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 355
    goto :goto_7ba

    .line 357
    :cond_7a4
    invoke-virtual {v1, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->isSpecial(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v7

    if-eqz v7, :cond_7b7

    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartLiBreakers:[Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_7b7

    .line 358
    goto :goto_7ba

    .line 351
    :cond_7b7
    add-int/lit8 v5, v5, -0x1

    goto :goto_78e

    .line 360
    .end local v5    # "i":I
    .end local v6    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_7ba
    :goto_7ba
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7c3

    .line 361
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 363
    :cond_7c3
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 364
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 345
    .end local v0    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    :pswitch_7cd
    move-object/from16 v4, p0

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 346
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 347
    move-object v0, v4

    move-object/from16 v5, v19

    move-object/from16 v4, p1

    goto/16 :goto_867

    .line 328
    :pswitch_7dc
    move-object/from16 v0, p0

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getActiveFormattingElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_7f6

    .line 329
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 330
    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 333
    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    .line 334
    .local v3, "remainingA":Lcom/streambundlehtml/nodes/Element;
    if-eqz v3, :cond_7f6

    .line 335
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 336
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeFromStack(Lcom/streambundlehtml/nodes/Element;)Z

    .line 339
    .end local v3    # "remainingA":Lcom/streambundlehtml/nodes/Element;
    :cond_7f6
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 340
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    .line 341
    .local v3, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 342
    move-object/from16 v4, p1

    move-object/from16 v5, v19

    goto :goto_867

    .line 667
    .end local v3    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_805
    sget-object v4, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartPClosers:[Ljava/lang/String;

    move-object/from16 v5, v19

    .end local v19    # "name":Ljava/lang/String;
    .local v5, "name":Ljava/lang/String;
    invoke-static {v5, v4}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_81e

    .line 668
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_818

    .line 669
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 671
    :cond_818
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-object/from16 v4, p1

    goto :goto_867

    .line 672
    :cond_81e
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartToHead:[Ljava/lang/String;

    invoke-static {v5, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_82f

    .line 673
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-object/from16 v4, p1

    invoke-virtual {v1, v4, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v3

    return v3

    .line 674
    :cond_82f
    move-object/from16 v4, p1

    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartApplets:[Ljava/lang/String;

    invoke-static {v5, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_847

    .line 675
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 676
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 677
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertMarkerToFormattingElements()V

    .line 678
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto :goto_867

    .line 679
    :cond_847
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartMedia:[Ljava/lang/String;

    invoke-static {v5, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_853

    .line 680
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_867

    .line 681
    :cond_853
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InBodyStartDrop:[Ljava/lang/String;

    invoke-static {v5, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_861

    .line 682
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 683
    const/16 v16, 0x0

    return v16

    .line 685
    :cond_861
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 686
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 689
    :goto_867
    const/16 v17, 0x1

    return v17

    :sswitch_data_86a
    .sparse-switch
        -0x620c002b -> :sswitch_283
        -0x521dd8ce -> :sswitch_27a
        -0x47007d5c -> :sswitch_26f
        -0x43a19f6f -> :sswitch_264
        -0x3c35778b -> :sswitch_25b
        -0x3bcc48c6 -> :sswitch_250
        -0x3600cb04 -> :sswitch_245
        -0x352aa04e -> :sswitch_23a
        -0x352a8969 -> :sswitch_22f
        -0x4d08054 -> :sswitch_224
        0x61 -> :sswitch_21b
        0x62 -> :sswitch_20f
        0x69 -> :sswitch_203
        0x73 -> :sswitch_1f7
        0x75 -> :sswitch_1eb
        0xc50 -> :sswitch_1df
        0xc80 -> :sswitch_1d3
        0xc90 -> :sswitch_1c7
        0xca8 -> :sswitch_1bb
        0xcc9 -> :sswitch_1af
        0xcca -> :sswitch_1a3
        0xccb -> :sswitch_197
        0xccc -> :sswitch_18b
        0xccd -> :sswitch_17f
        0xcce -> :sswitch_173
        0xd0a -> :sswitch_169
        0xd7d -> :sswitch_160
        0xe3e -> :sswitch_154
        0xe42 -> :sswitch_148
        0xe80 -> :sswitch_13c
        0x17d00 -> :sswitch_130
        0x197c3 -> :sswitch_126
        0x1b2a3 -> :sswitch_11a
        0x1be64 -> :sswitch_110
        0x1cb07 -> :sswitch_104
        0x1d01b -> :sswitch_f8
        0x2dd08d -> :sswitch_ec
        0x2e39a2 -> :sswitch_e3
        0x2eaded -> :sswitch_d7
        0x300c4f -> :sswitch_cb
        0x300cc4 -> :sswitch_c2
        0x3107ab -> :sswitch_b7
        0x330708 -> :sswitch_ab
        0x33add1 -> :sswitch_a1
        0x35f74a -> :sswitch_96
        0x5c24ed9 -> :sswitch_8a
        0x5faa95b -> :sswitch_7e
        0x5fb57ca -> :sswitch_74
        0x6879507 -> :sswitch_68
        0x6903bce -> :sswitch_5c
        0xad8ba84 -> :sswitch_50
        0x759d29f7 -> :sswitch_45
        0x7ca6c5e8 -> :sswitch_3b
        0x7e19b1b8 -> :sswitch_2f
    .end sparse-switch

    :pswitch_data_944
    .packed-switch 0x0
        :pswitch_7dc
        :pswitch_7cd
        :pswitch_77c
        :pswitch_723
        :pswitch_6b8
        :pswitch_655
        :pswitch_62d
        :pswitch_611
        :pswitch_5e8
        :pswitch_5c6
        :pswitch_59c
        :pswitch_573
        :pswitch_55a
        :pswitch_53f
        :pswitch_4a0
        :pswitch_474
        :pswitch_458
        :pswitch_448
        :pswitch_43c
        :pswitch_3e1
        :pswitch_3d2
        :pswitch_3c3
        :pswitch_398
        :pswitch_398
        :pswitch_398
        :pswitch_398
        :pswitch_398
        :pswitch_398
        :pswitch_378
        :pswitch_378
        :pswitch_315
        :pswitch_315
        :pswitch_2fd
        :pswitch_2fd
        :pswitch_2ce
        :pswitch_2ce
        :pswitch_2bc
        :pswitch_2bc
        :pswitch_2bc
        :pswitch_2bc
        :pswitch_2bc
        :pswitch_2bc
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
        :pswitch_2aa
    .end packed-switch
.end method


# virtual methods
.method anyOtherEndTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 11
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 833
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    iget-object v0, v0, Lcom/streambundlehtml/parser/Token$EndTag;->normalName:Ljava/lang/String;

    .line 834
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v1

    .line 837
    .local v1, "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    .line 838
    .local v2, "elFromStack":Lcom/streambundlehtml/nodes/Element;
    const/4 v3, 0x0

    if-nez v2, :cond_15

    .line 839
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 840
    return v3

    .line 843
    :cond_15
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    .local v4, "pos":I
    :goto_1b
    if-ltz v4, :cond_4a

    .line 844
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/nodes/Element;

    .line 845
    .local v6, "node":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3d

    .line 846
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 847
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_39

    .line 848
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 849
    :cond_39
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 850
    goto :goto_4a

    .line 852
    :cond_3d
    invoke-virtual {p2, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->isSpecial(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v7

    if-eqz v7, :cond_47

    .line 853
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 854
    return v3

    .line 843
    .end local v6    # "node":Lcom/streambundlehtml/nodes/Element;
    :cond_47
    add-int/lit8 v4, v4, -0x1

    goto :goto_1b

    .line 858
    .end local v4    # "pos":I
    :cond_4a
    :goto_4a
    return v5
.end method

.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 7
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 281
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$25;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v1, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$TokenType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_68

    goto :goto_65

    .line 311
    :pswitch_f
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->templateModeSize()I

    move-result v0

    if-lez v0, :cond_65

    .line 312
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->InTemplate:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0

    .line 283
    :pswitch_1c
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    .line 284
    .local v0, "c":Lcom/streambundlehtml/parser/Token$Character;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v2

    # getter for: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;
    invoke-static {}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$400()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 286
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 287
    return v1

    .line 288
    :cond_32
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk()Z

    move-result v2

    if-eqz v2, :cond_45

    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Lcom/streambundlehtml/parser/Token;)Z
    invoke-static {v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$100(Lcom/streambundlehtml/parser/Token;)Z

    move-result v2

    if-eqz v2, :cond_45

    .line 289
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 290
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    goto :goto_65

    .line 292
    :cond_45
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 293
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    .line 294
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 296
    goto :goto_65

    .line 309
    .end local v0    # "c":Lcom/streambundlehtml/parser/Token$Character;
    :pswitch_4f
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->inBodyEndTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0

    .line 307
    :pswitch_54
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;->inBodyStartTag(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0

    .line 303
    :pswitch_59
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 304
    return v1

    .line 299
    :pswitch_5d
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    .line 300
    nop

    .line 317
    :cond_65
    :goto_65
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_5d
        :pswitch_59
        :pswitch_54
        :pswitch_4f
        :pswitch_1c
        :pswitch_f
    .end packed-switch
.end method
