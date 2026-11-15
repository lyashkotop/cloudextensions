.class final enum Lcom/streambundlehtml/parser/TokeniserState$56;
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

    .line 1264
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1266
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1267
    .local v0, "c":C
    const/4 v1, 0x1

    sparse-switch v0, :sswitch_data_44

    .line 1295
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1296
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1297
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$56;->BogusDoctype:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_42

    .line 1289
    :sswitch_15
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1290
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1291
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1292
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$56;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1293
    goto :goto_42

    .line 1283
    :sswitch_25
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1284
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1285
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1286
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$56;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1287
    goto :goto_42

    .line 1280
    :sswitch_35
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$56;->DoctypePublicIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1281
    goto :goto_42

    .line 1276
    :sswitch_3b
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$56;->DoctypePublicIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1277
    goto :goto_42

    .line 1273
    :sswitch_41
    nop

    .line 1299
    :goto_42
    return-void

    nop

    :sswitch_data_44
    .sparse-switch
        0x9 -> :sswitch_41
        0xa -> :sswitch_41
        0xc -> :sswitch_41
        0xd -> :sswitch_41
        0x20 -> :sswitch_41
        0x22 -> :sswitch_3b
        0x27 -> :sswitch_35
        0x3e -> :sswitch_25
        0xffff -> :sswitch_15
    .end sparse-switch
.end method
