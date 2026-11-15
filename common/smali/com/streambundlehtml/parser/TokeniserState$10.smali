.class final enum Lcom/streambundlehtml/parser/TokeniserState$10;
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

    .line 144
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 7
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 148
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consumeTagName()Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, "tagName":Ljava/lang/String;
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 151
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v1

    .line 152
    .local v1, "c":C
    sparse-switch v1, :sswitch_data_46

    .line 179
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Tag;->appendTagName(C)V

    goto :goto_44

    .line 175
    :sswitch_16
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 176
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$10;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 177
    goto :goto_44

    .line 164
    :sswitch_1f
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 165
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 168
    :sswitch_25
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 169
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$10;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 170
    goto :goto_44

    .line 161
    :sswitch_2e
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$10;->SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 162
    goto :goto_44

    .line 158
    :sswitch_34
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState$10;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 159
    goto :goto_44

    .line 172
    :sswitch_3a
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    # getter for: Lcom/streambundlehtml/parser/TokeniserState;->replacementStr:Ljava/lang/String;
    invoke-static {}, Lcom/streambundlehtml/parser/TokeniserState;->access$300()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 173
    nop

    .line 181
    :goto_44
    return-void

    nop

    :sswitch_data_46
    .sparse-switch
        0x0 -> :sswitch_3a
        0x9 -> :sswitch_34
        0xa -> :sswitch_34
        0xc -> :sswitch_34
        0xd -> :sswitch_34
        0x20 -> :sswitch_34
        0x2f -> :sswitch_2e
        0x3c -> :sswitch_1f
        0x3e -> :sswitch_25
        0xffff -> :sswitch_16
    .end sparse-switch
.end method
