.class final enum Lcom/streambundlehtml/parser/TokeniserState$30;
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

    .line 488
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 490
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 491
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3c

    .line 510
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 511
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$30;->ScriptDataDoubleEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3a

    .line 506
    :sswitch_10
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 507
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$30;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 508
    goto :goto_3a

    .line 497
    :sswitch_19
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 498
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$30;->ScriptDataDoubleEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 499
    goto :goto_3a

    .line 493
    :sswitch_22
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 494
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$30;->ScriptDataDoubleEscapedDashDash:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 495
    goto :goto_3a

    .line 501
    :sswitch_2b
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 502
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 503
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$30;->ScriptDataDoubleEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 504
    nop

    .line 513
    :goto_3a
    return-void

    nop

    :sswitch_data_3c
    .sparse-switch
        0x0 -> :sswitch_2b
        0x2d -> :sswitch_22
        0x3c -> :sswitch_19
        0xffff -> :sswitch_10
    .end sparse-switch
.end method
