.class final enum Lcom/streambundlehtml/parser/TokeniserState$41;
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

    .line 857
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 859
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 860
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_32

    .line 880
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 881
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 882
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$41;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_31

    .line 876
    :sswitch_13
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 877
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$41;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 878
    goto :goto_31

    .line 872
    :sswitch_1c
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 873
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$41;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 874
    goto :goto_31

    .line 869
    :sswitch_25
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$41;->SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 870
    goto :goto_31

    .line 866
    :sswitch_2b
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$41;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 867
    nop

    .line 885
    :goto_31
    return-void

    :sswitch_data_32
    .sparse-switch
        0x9 -> :sswitch_2b
        0xa -> :sswitch_2b
        0xc -> :sswitch_2b
        0xd -> :sswitch_2b
        0x20 -> :sswitch_2b
        0x2f -> :sswitch_25
        0x3e -> :sswitch_1c
        0xffff -> :sswitch_13
    .end sparse-switch
.end method
