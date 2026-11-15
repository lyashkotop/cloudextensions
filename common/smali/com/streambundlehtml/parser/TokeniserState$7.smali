.class final enum Lcom/streambundlehtml/parser/TokeniserState$7;
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

    .line 79
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 81
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v0

    sparse-switch v0, :sswitch_data_28

    .line 91
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeTo(C)Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    goto :goto_26

    .line 88
    .end local v0    # "data":Ljava/lang/String;
    :sswitch_10
    new-instance v0, Lcom/streambundlehtml/parser/Token$EOF;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$EOF;-><init>()V

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Lcom/streambundlehtml/parser/Token;)V

    .line 89
    goto :goto_26

    .line 83
    :sswitch_19
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 84
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 85
    const v0, 0xfffd

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 86
    nop

    .line 95
    :goto_26
    return-void

    nop

    :sswitch_data_28
    .sparse-switch
        0x0 -> :sswitch_19
        0xffff -> :sswitch_10
    .end sparse-switch
.end method
