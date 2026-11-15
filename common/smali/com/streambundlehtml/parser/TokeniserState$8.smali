.class final enum Lcom/streambundlehtml/parser/TokeniserState$8;
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

    .line 97
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 100
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v0

    sparse-switch v0, :sswitch_data_3a

    .line 112
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAsciiAlpha()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 113
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->createTagPending(Z)Lcom/streambundlehtml/parser/Token$Tag;

    .line 114
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$8;->TagName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_39

    .line 108
    :sswitch_17
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createBogusCommentPending()V

    .line 109
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$8;->BogusComment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 110
    goto :goto_39

    .line 105
    :sswitch_20
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$8;->EndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 106
    goto :goto_39

    .line 102
    :sswitch_26
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$8;->MarkupDeclarationOpen:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 103
    goto :goto_39

    .line 116
    :cond_2c
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 117
    const/16 v0, 0x3c

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 118
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$8;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 122
    :goto_39
    return-void

    :sswitch_data_3a
    .sparse-switch
        0x21 -> :sswitch_26
        0x2f -> :sswitch_20
        0x3f -> :sswitch_17
    .end sparse-switch
.end method
