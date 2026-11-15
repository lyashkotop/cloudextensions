.class final enum Lcom/streambundlehtml/parser/TokeniserState$59;
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

    .line 1357
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1359
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1360
    .local v0, "c":C
    const/4 v1, 0x1

    sparse-switch v0, :sswitch_data_48

    .line 1389
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1390
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1391
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$59;->BogusDoctype:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_46

    .line 1383
    :sswitch_15
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1384
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1385
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1386
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$59;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1387
    goto :goto_46

    .line 1369
    :sswitch_25
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1370
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$59;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1371
    goto :goto_46

    .line 1378
    :sswitch_2e
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1380
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$59;->DoctypeSystemIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1381
    goto :goto_46

    .line 1373
    :sswitch_37
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1375
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$59;->DoctypeSystemIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1376
    goto :goto_46

    .line 1366
    :sswitch_40
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$59;->BetweenDoctypePublicAndSystemIdentifiers:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1367
    nop

    .line 1393
    :goto_46
    return-void

    nop

    :sswitch_data_48
    .sparse-switch
        0x9 -> :sswitch_40
        0xa -> :sswitch_40
        0xc -> :sswitch_40
        0xd -> :sswitch_40
        0x20 -> :sswitch_40
        0x22 -> :sswitch_37
        0x27 -> :sswitch_2e
        0x3e -> :sswitch_25
        0xffff -> :sswitch_15
    .end sparse-switch
.end method
