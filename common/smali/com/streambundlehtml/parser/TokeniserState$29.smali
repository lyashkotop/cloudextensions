.class final enum Lcom/streambundlehtml/parser/TokeniserState$29;
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

    .line 461
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 463
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v0

    .line 464
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3e

    .line 483
    const/4 v1, 0x3

    new-array v1, v1, [C

    fill-array-data v1, :array_50

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v1

    .line 484
    .local v1, "data":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    goto :goto_3d

    .line 479
    .end local v1    # "data":Ljava/lang/String;
    :sswitch_15
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 480
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$29;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 481
    goto :goto_3d

    .line 470
    :sswitch_1e
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 471
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$29;->ScriptDataDoubleEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 472
    goto :goto_3d

    .line 466
    :sswitch_27
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 467
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$29;->ScriptDataDoubleEscapedDash:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 468
    goto :goto_3d

    .line 474
    :sswitch_30
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 475
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 476
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 477
    nop

    .line 486
    :goto_3d
    return-void

    :sswitch_data_3e
    .sparse-switch
        0x0 -> :sswitch_30
        0x2d -> :sswitch_27
        0x3c -> :sswitch_1e
        0xffff -> :sswitch_15
    .end sparse-switch

    :array_50
    .array-data 2
        0x2ds
        0x3cs
        0x0s
    .end array-data
.end method
