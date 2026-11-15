.class final enum Lcom/streambundlehtml/parser/TokeniserState$3;
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

    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 42
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v0

    sparse-switch v0, :sswitch_data_32

    .line 58
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consumeData()Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    goto :goto_31

    .line 55
    .end local v0    # "data":Ljava/lang/String;
    :sswitch_f
    new-instance v0, Lcom/streambundlehtml/parser/Token$EOF;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$EOF;-><init>()V

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Lcom/streambundlehtml/parser/Token;)V

    .line 56
    goto :goto_31

    .line 47
    :sswitch_18
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$3;->RcdataLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 48
    goto :goto_31

    .line 44
    :sswitch_1e
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$3;->CharacterReferenceInRcdata:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 45
    goto :goto_31

    .line 50
    :sswitch_24
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 51
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 52
    const v0, 0xfffd

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 53
    nop

    .line 62
    :goto_31
    return-void

    :sswitch_data_32
    .sparse-switch
        0x0 -> :sswitch_24
        0x26 -> :sswitch_1e
        0x3c -> :sswitch_18
        0xffff -> :sswitch_f
    .end sparse-switch
.end method
