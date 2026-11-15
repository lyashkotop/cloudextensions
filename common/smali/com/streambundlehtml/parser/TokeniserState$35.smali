.class final enum Lcom/streambundlehtml/parser/TokeniserState$35;
.super Lcom/streambundlehtml/parser/TokeniserState;
.source "TokeniserState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/TokeniserState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .line 608
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 611
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$35;->attributeNameCharsSorted:[C

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeToAnySorted([C)Ljava/lang/String;

    move-result-object v0

    .line 612
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeName(Ljava/lang/String;)V

    .line 614
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v1

    .line 615
    .local v1, "c":C
    sparse-switch v1, :sswitch_data_46

    .line 644
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeName(C)V

    goto :goto_45

    .line 634
    :sswitch_18
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 635
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$35;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 636
    goto :goto_45

    .line 630
    :sswitch_21
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 631
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$35;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 632
    goto :goto_45

    .line 627
    :sswitch_2a
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$35;->BeforeAttributeValue:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 628
    goto :goto_45

    .line 624
    :sswitch_30
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$35;->SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 625
    goto :goto_45

    .line 640
    :sswitch_36
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 641
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeName(C)V

    .line 642
    goto :goto_45

    .line 621
    :sswitch_3f
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$35;->AfterAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 622
    nop

    .line 646
    :goto_45
    return-void

    :sswitch_data_46
    .sparse-switch
        0x9 -> :sswitch_3f
        0xa -> :sswitch_3f
        0xc -> :sswitch_3f
        0xd -> :sswitch_3f
        0x20 -> :sswitch_3f
        0x22 -> :sswitch_36
        0x27 -> :sswitch_36
        0x2f -> :sswitch_30
        0x3c -> :sswitch_36
        0x3d -> :sswitch_2a
        0x3e -> :sswitch_21
        0xffff -> :sswitch_18
    .end sparse-switch
.end method
