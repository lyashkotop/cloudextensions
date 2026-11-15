.class final enum Lcom/streambundlehtml/parser/TokeniserState$52;
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

    .line 1126
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1128
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAsciiAlpha()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1129
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createDoctypePending()V

    .line 1130
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$52;->DoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1131
    return-void

    .line 1133
    :cond_f
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1134
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_52

    .line 1155
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createDoctypePending()V

    .line 1156
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iget-object v1, v1, Lcom/streambundlehtml/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1157
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$52;->DoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_51

    .line 1148
    :sswitch_26
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1149
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createDoctypePending()V

    .line 1150
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1151
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1152
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$52;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1153
    goto :goto_51

    .line 1140
    :sswitch_3a
    goto :goto_51

    .line 1142
    :sswitch_3b
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1143
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createDoctypePending()V

    .line 1144
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iget-object v1, v1, Lcom/streambundlehtml/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1145
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$52;->DoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1146
    nop

    .line 1159
    :goto_51
    return-void

    :sswitch_data_52
    .sparse-switch
        0x0 -> :sswitch_3b
        0x9 -> :sswitch_3a
        0xa -> :sswitch_3a
        0xc -> :sswitch_3a
        0xd -> :sswitch_3a
        0x20 -> :sswitch_3a
        0xffff -> :sswitch_26
    .end sparse-switch
.end method
