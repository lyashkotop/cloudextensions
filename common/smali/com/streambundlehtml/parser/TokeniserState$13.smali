.class final enum Lcom/streambundlehtml/parser/TokeniserState$13;
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

    .line 214
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method

.method private anythingElse(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 255
    const-string v0, "</"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 256
    iget-object v0, p1, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/StringBuilder;)V

    .line 257
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 258
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$13;->Rcdata:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 259
    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 216
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAsciiAlpha()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 217
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consumeLetterSequence()Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 219
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    return-void

    .line 223
    .end local v0    # "name":Ljava/lang/String;
    :cond_15
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 224
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_54

    .line 250
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/TokeniserState$13;->anythingElse(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V

    goto :goto_53

    .line 242
    :sswitch_20
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->isAppropriateEndTagToken()Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 243
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 244
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$13;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_53

    .line 247
    :cond_2f
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/TokeniserState$13;->anythingElse(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V

    .line 248
    goto :goto_53

    .line 236
    :sswitch_33
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->isAppropriateEndTagToken()Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 237
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$13;->SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_53

    .line 239
    :cond_3f
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/TokeniserState$13;->anythingElse(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V

    .line 240
    goto :goto_53

    .line 230
    :sswitch_43
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->isAppropriateEndTagToken()Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 231
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$13;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_53

    .line 233
    :cond_4f
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/TokeniserState$13;->anythingElse(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V

    .line 234
    nop

    .line 252
    :goto_53
    return-void

    :sswitch_data_54
    .sparse-switch
        0x9 -> :sswitch_43
        0xa -> :sswitch_43
        0xc -> :sswitch_43
        0xd -> :sswitch_43
        0x20 -> :sswitch_43
        0x2f -> :sswitch_33
        0x3e -> :sswitch_20
    .end sparse-switch
.end method
