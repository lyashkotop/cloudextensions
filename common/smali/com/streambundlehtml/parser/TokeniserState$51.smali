.class final enum Lcom/streambundlehtml/parser/TokeniserState$51;
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

    .line 1099
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1101
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1102
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_2e

    .line 1121
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1122
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$51;->BeforeDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_2d

    .line 1111
    :sswitch_10
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1114
    :sswitch_13
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1115
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createDoctypePending()V

    .line 1116
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1117
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1118
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$51;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1119
    goto :goto_2d

    .line 1108
    :sswitch_27
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$51;->BeforeDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1109
    nop

    .line 1124
    :goto_2d
    return-void

    :sswitch_data_2e
    .sparse-switch
        0x9 -> :sswitch_27
        0xa -> :sswitch_27
        0xc -> :sswitch_27
        0xd -> :sswitch_27
        0x20 -> :sswitch_27
        0x3e -> :sswitch_13
        0xffff -> :sswitch_10
    .end sparse-switch
.end method
