.class final enum Lcom/streambundlehtml/parser/TokeniserState$24;
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

    .line 390
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 392
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 393
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 394
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$24;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 395
    return-void

    .line 398
    :cond_f
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 399
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_42

    .line 416
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 417
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$24;->ScriptDataEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_41

    .line 407
    :sswitch_1f
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 408
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$24;->ScriptData:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 409
    goto :goto_41

    .line 404
    :sswitch_28
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$24;->ScriptDataEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 405
    goto :goto_41

    .line 401
    :sswitch_2e
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 402
    goto :goto_41

    .line 411
    :sswitch_32
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 412
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 413
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$24;->ScriptDataEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 414
    nop

    .line 419
    :goto_41
    return-void

    :sswitch_data_42
    .sparse-switch
        0x0 -> :sswitch_32
        0x2d -> :sswitch_2e
        0x3c -> :sswitch_28
        0x3e -> :sswitch_1f
    .end sparse-switch
.end method
