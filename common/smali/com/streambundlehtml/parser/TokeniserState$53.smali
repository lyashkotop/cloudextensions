.class final enum Lcom/streambundlehtml/parser/TokeniserState$53;
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

    .line 1161
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1163
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->matchesLetter()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 1164
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consumeLetterSequence()Ljava/lang/String;

    move-result-object v0

    .line 1165
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iget-object v1, v1, Lcom/streambundlehtml/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1166
    return-void

    .line 1168
    .end local v0    # "name":Ljava/lang/String;
    :cond_12
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1169
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_50

    .line 1192
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iget-object v1, v1, Lcom/streambundlehtml/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4f

    .line 1186
    :sswitch_21
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1187
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1188
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1189
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$53;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1190
    goto :goto_4f

    .line 1171
    :sswitch_32
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1172
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$53;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1173
    goto :goto_4f

    .line 1179
    :sswitch_3b
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$53;->AfterDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1180
    goto :goto_4f

    .line 1182
    :sswitch_41
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1183
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iget-object v1, v1, Lcom/streambundlehtml/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1184
    nop

    .line 1194
    :goto_4f
    return-void

    :sswitch_data_50
    .sparse-switch
        0x0 -> :sswitch_41
        0x9 -> :sswitch_3b
        0xa -> :sswitch_3b
        0xc -> :sswitch_3b
        0xd -> :sswitch_3b
        0x20 -> :sswitch_3b
        0x3e -> :sswitch_32
        0xffff -> :sswitch_21
    .end sparse-switch
.end method
