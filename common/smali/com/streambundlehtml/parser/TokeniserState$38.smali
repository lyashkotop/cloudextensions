.class final enum Lcom/streambundlehtml/parser/TokeniserState$38;
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

    .line 742
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 8
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 744
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeAttributeQuoted(Z)Ljava/lang/String;

    move-result-object v0

    .line 745
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_11

    .line 746
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(Ljava/lang/String;)V

    goto :goto_16

    .line 748
    :cond_11
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$Tag;->setEmptyAttributeValue()V

    .line 750
    :goto_16
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v1

    .line 751
    .local v1, "c":C
    sparse-switch v1, :sswitch_data_5a

    .line 771
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_59

    .line 767
    :sswitch_23
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 768
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$38;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 769
    goto :goto_59

    .line 756
    :sswitch_2c
    const/16 v2, 0x22

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Lcom/streambundlehtml/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[I

    move-result-object v2

    .line 757
    .local v2, "ref":[I
    if-eqz v2, :cond_3f

    .line 758
    iget-object v3, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v3, v2}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue([I)V

    goto :goto_59

    .line 760
    :cond_3f
    iget-object v3, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    const/16 v4, 0x26

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 761
    goto :goto_59

    .line 753
    .end local v2    # "ref":[I
    :sswitch_47
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$38;->AfterAttributeValue_quoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 754
    goto :goto_59

    .line 763
    :sswitch_4d
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 764
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    const v3, 0xfffd

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 765
    nop

    .line 773
    :goto_59
    return-void

    :sswitch_data_5a
    .sparse-switch
        0x0 -> :sswitch_4d
        0x22 -> :sswitch_47
        0x26 -> :sswitch_2c
        0xffff -> :sswitch_23
    .end sparse-switch
.end method
