.class final enum Lcom/streambundlehtml/parser/TokeniserState$31;
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

    .line 515
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 517
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 518
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_40

    .line 540
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 541
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$31;->ScriptDataDoubleEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3e

    .line 536
    :sswitch_10
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 537
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$31;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 538
    goto :goto_3e

    .line 527
    :sswitch_19
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 528
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$31;->ScriptData:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 529
    goto :goto_3e

    .line 523
    :sswitch_22
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 524
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$31;->ScriptDataDoubleEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 525
    goto :goto_3e

    .line 520
    :sswitch_2b
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 521
    goto :goto_3e

    .line 531
    :sswitch_2f
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 532
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 533
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$31;->ScriptDataDoubleEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 534
    nop

    .line 543
    :goto_3e
    return-void

    nop

    :sswitch_data_40
    .sparse-switch
        0x0 -> :sswitch_2f
        0x2d -> :sswitch_2b
        0x3c -> :sswitch_22
        0x3e -> :sswitch_19
        0xffff -> :sswitch_10
    .end sparse-switch
.end method
