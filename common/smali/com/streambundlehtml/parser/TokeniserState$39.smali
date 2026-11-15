.class final enum Lcom/streambundlehtml/parser/TokeniserState$39;
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

    .line 775
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 8
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 777
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeAttributeQuoted(Z)Ljava/lang/String;

    move-result-object v1

    .line 778
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_11

    .line 779
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(Ljava/lang/String;)V

    goto :goto_16

    .line 781
    :cond_11
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$Tag;->setEmptyAttributeValue()V

    .line 783
    :goto_16
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v2

    .line 784
    .local v2, "c":C
    sparse-switch v2, :sswitch_data_5a

    .line 804
    iget-object v0, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_58

    .line 800
    :sswitch_23
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 801
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$39;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 802
    goto :goto_58

    .line 786
    :sswitch_2c
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$39;->AfterAttributeValue_quoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 787
    goto :goto_58

    .line 789
    :sswitch_32
    const/16 v3, 0x27

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    invoke-virtual {p1, v3, v0}, Lcom/streambundlehtml/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[I

    move-result-object v0

    .line 790
    .local v0, "ref":[I
    if-eqz v0, :cond_44

    .line 791
    iget-object v3, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v3, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue([I)V

    goto :goto_58

    .line 793
    :cond_44
    iget-object v3, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    const/16 v4, 0x26

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 794
    goto :goto_58

    .line 796
    .end local v0    # "ref":[I
    :sswitch_4c
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 797
    iget-object v0, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    const v3, 0xfffd

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 798
    nop

    .line 806
    :goto_58
    return-void

    nop

    :sswitch_data_5a
    .sparse-switch
        0x0 -> :sswitch_4c
        0x26 -> :sswitch_32
        0x27 -> :sswitch_2c
        0xffff -> :sswitch_23
    .end sparse-switch
.end method
