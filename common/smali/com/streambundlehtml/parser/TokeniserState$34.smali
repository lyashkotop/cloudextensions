.class final enum Lcom/streambundlehtml/parser/TokeniserState$34;
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

    .line 561
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 564
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 565
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_5a

    .line 602
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$Tag;->newAttribute()V

    .line 603
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 604
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$34;->AttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_58

    .line 590
    :sswitch_15
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 591
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$34;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 592
    goto :goto_58

    .line 576
    :sswitch_1e
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 577
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 580
    :sswitch_24
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 581
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$34;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 582
    goto :goto_58

    .line 573
    :sswitch_2d
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$34;->SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 574
    goto :goto_58

    .line 596
    :sswitch_33
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 597
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$Tag;->newAttribute()V

    .line 598
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeName(C)V

    .line 599
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$34;->AttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 600
    goto :goto_58

    .line 571
    :sswitch_46
    goto :goto_58

    .line 584
    :sswitch_47
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 585
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 586
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$Tag;->newAttribute()V

    .line 587
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$34;->AttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 588
    nop

    .line 606
    :goto_58
    return-void

    nop

    :sswitch_data_5a
    .sparse-switch
        0x0 -> :sswitch_47
        0x9 -> :sswitch_46
        0xa -> :sswitch_46
        0xc -> :sswitch_46
        0xd -> :sswitch_46
        0x20 -> :sswitch_46
        0x22 -> :sswitch_33
        0x27 -> :sswitch_33
        0x2f -> :sswitch_2d
        0x3c -> :sswitch_1e
        0x3d -> :sswitch_33
        0x3e -> :sswitch_24
        0xffff -> :sswitch_15
    .end sparse-switch
.end method
