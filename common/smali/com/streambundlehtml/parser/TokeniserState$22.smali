.class final enum Lcom/streambundlehtml/parser/TokeniserState$22;
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

    .line 335
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 337
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 338
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 339
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$22;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 340
    return-void

    .line 343
    :cond_f
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v0

    sparse-switch v0, :sswitch_data_44

    .line 357
    const/4 v0, 0x3

    new-array v0, v0, [C

    fill-array-data v0, :array_52

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v0

    .line 358
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    goto :goto_42

    .line 349
    .end local v0    # "data":Ljava/lang/String;
    :sswitch_24
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$22;->ScriptDataEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 350
    goto :goto_42

    .line 345
    :sswitch_2a
    const/16 v0, 0x2d

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 346
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$22;->ScriptDataEscapedDash:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 347
    goto :goto_42

    .line 352
    :sswitch_35
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 353
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 354
    const v0, 0xfffd

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 355
    nop

    .line 360
    :goto_42
    return-void

    nop

    :sswitch_data_44
    .sparse-switch
        0x0 -> :sswitch_35
        0x2d -> :sswitch_2a
        0x3c -> :sswitch_24
    .end sparse-switch

    :array_52
    .array-data 2
        0x2ds
        0x3cs
        0x0s
    .end array-data
.end method
