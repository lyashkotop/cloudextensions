.class final enum Lcom/streambundlehtml/parser/TokeniserState$17;
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

    .line 282
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 284
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    const-string v1, "<"

    sparse-switch v0, :sswitch_data_36

    .line 299
    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 300
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 301
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$17;->ScriptData:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_35

    .line 294
    :sswitch_15
    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 295
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 296
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$17;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 297
    goto :goto_35

    .line 286
    :sswitch_21
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createTempBuffer()V

    .line 287
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$17;->ScriptDataEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 288
    goto :goto_35

    .line 290
    :sswitch_2a
    const-string v0, "<!"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 291
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$17;->ScriptDataEscapeStart:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 292
    nop

    .line 303
    :goto_35
    return-void

    :sswitch_data_36
    .sparse-switch
        0x21 -> :sswitch_2a
        0x2f -> :sswitch_21
        0xffff -> :sswitch_15
    .end sparse-switch
.end method
