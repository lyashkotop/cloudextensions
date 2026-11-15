.class final enum Lcom/streambundlehtml/parser/TokeniserState$61;
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

    .line 1432
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1434
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1435
    .local v0, "c":C
    const/4 v1, 0x1

    sparse-switch v0, :sswitch_data_4c

    .line 1466
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1467
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1468
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    goto :goto_4b

    .line 1460
    :sswitch_13
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1461
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1462
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1463
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$61;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1464
    goto :goto_4b

    .line 1444
    :sswitch_23
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1445
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v2, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1446
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1447
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$61;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1448
    goto :goto_4b

    .line 1455
    :sswitch_33
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1457
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$61;->DoctypeSystemIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1458
    goto :goto_4b

    .line 1450
    :sswitch_3c
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1452
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$61;->DoctypeSystemIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1453
    goto :goto_4b

    .line 1441
    :sswitch_45
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$61;->BeforeDoctypeSystemIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1442
    nop

    .line 1470
    :goto_4b
    return-void

    :sswitch_data_4c
    .sparse-switch
        0x9 -> :sswitch_45
        0xa -> :sswitch_45
        0xc -> :sswitch_45
        0xd -> :sswitch_45
        0x20 -> :sswitch_45
        0x22 -> :sswitch_3c
        0x27 -> :sswitch_33
        0x3e -> :sswitch_23
        0xffff -> :sswitch_13
    .end sparse-switch
.end method
