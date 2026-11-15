.class final enum Lcom/streambundlehtml/parser/TokeniserState$55;
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

    .line 1224
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1226
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1227
    .local v0, "c":C
    const/4 v1, 0x1

    sparse-switch v0, :sswitch_data_4e

    .line 1258
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1259
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1260
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$55;->BogusDoctype:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_4d

    .line 1252
    :sswitch_15
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1253
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1254
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1255
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$55;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1256
    goto :goto_4d

    .line 1246
    :sswitch_25
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1247
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1248
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1249
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$55;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1250
    goto :goto_4d

    .line 1241
    :sswitch_35
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1243
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$55;->DoctypePublicIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1244
    goto :goto_4d

    .line 1236
    :sswitch_3e
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1238
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$55;->DoctypePublicIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1239
    goto :goto_4d

    .line 1233
    :sswitch_47
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$55;->BeforeDoctypePublicIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1234
    nop

    .line 1262
    :goto_4d
    return-void

    :sswitch_data_4e
    .sparse-switch
        0x9 -> :sswitch_47
        0xa -> :sswitch_47
        0xc -> :sswitch_47
        0xd -> :sswitch_47
        0x20 -> :sswitch_47
        0x22 -> :sswitch_3e
        0x27 -> :sswitch_35
        0x3e -> :sswitch_25
        0xffff -> :sswitch_15
    .end sparse-switch
.end method
