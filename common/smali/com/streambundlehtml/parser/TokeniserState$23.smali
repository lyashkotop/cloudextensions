.class final enum Lcom/streambundlehtml/parser/TokeniserState$23;
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

    .line 362
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 364
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 365
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 366
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$23;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 367
    return-void

    .line 370
    :cond_f
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 371
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3e

    .line 385
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 386
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$23;->ScriptDataEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3d

    .line 377
    :sswitch_1f
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$23;->ScriptDataEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 378
    goto :goto_3d

    .line 373
    :sswitch_25
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 374
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$23;->ScriptDataEscapedDashDash:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 375
    goto :goto_3d

    .line 380
    :sswitch_2e
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 381
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 382
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$23;->ScriptDataEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 383
    nop

    .line 388
    :goto_3d
    return-void

    :sswitch_data_3e
    .sparse-switch
        0x0 -> :sswitch_2e
        0x2d -> :sswitch_25
        0x3c -> :sswitch_1f
    .end sparse-switch
.end method
