.class final enum Lcom/streambundlehtml/parser/TokeniserState$40;
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

    .line 808
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 8
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 810
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$40;->attributeValueUnquoted:[C

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeToAnySorted([C)Ljava/lang/String;

    move-result-object v0

    .line 811
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_11

    .line 812
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(Ljava/lang/String;)V

    .line 814
    :cond_11
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v1

    .line 815
    .local v1, "c":C
    sparse-switch v1, :sswitch_data_68

    .line 851
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_66

    .line 839
    :sswitch_1e
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 840
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$40;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 841
    goto :goto_66

    .line 831
    :sswitch_27
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 832
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$40;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 833
    goto :goto_66

    .line 824
    :sswitch_30
    const/16 v2, 0x3e

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Lcom/streambundlehtml/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[I

    move-result-object v2

    .line 825
    .local v2, "ref":[I
    if-eqz v2, :cond_43

    .line 826
    iget-object v3, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v3, v2}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue([I)V

    goto :goto_66

    .line 828
    :cond_43
    iget-object v3, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    const/16 v4, 0x26

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 829
    goto :goto_66

    .line 847
    .end local v2    # "ref":[I
    :sswitch_4b
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 848
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 849
    goto :goto_66

    .line 821
    :sswitch_54
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$40;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 822
    goto :goto_66

    .line 835
    :sswitch_5a
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 836
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    const v3, 0xfffd

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 837
    nop

    .line 854
    :goto_66
    return-void

    nop

    :sswitch_data_68
    .sparse-switch
        0x0 -> :sswitch_5a
        0x9 -> :sswitch_54
        0xa -> :sswitch_54
        0xc -> :sswitch_54
        0xd -> :sswitch_54
        0x20 -> :sswitch_54
        0x22 -> :sswitch_4b
        0x26 -> :sswitch_30
        0x27 -> :sswitch_4b
        0x3c -> :sswitch_4b
        0x3d -> :sswitch_4b
        0x3e -> :sswitch_27
        0x60 -> :sswitch_4b
        0xffff -> :sswitch_1e
    .end sparse-switch
.end method
