.class final enum Lcom/streambundlehtml/parser/TokeniserState$47;
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

    .line 996
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 998
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v0

    .line 999
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3a

    .line 1014
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    const/4 v2, 0x2

    new-array v2, v2, [C

    fill-array-data v2, :array_48

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Comment;

    goto :goto_38

    .line 1009
    :sswitch_17
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1010
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 1011
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$47;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1012
    goto :goto_38

    .line 1001
    :sswitch_23
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$47;->CommentEndDash:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1002
    goto :goto_38

    .line 1004
    :sswitch_29
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1005
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 1006
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1007
    nop

    .line 1016
    :goto_38
    return-void

    nop

    :sswitch_data_3a
    .sparse-switch
        0x0 -> :sswitch_29
        0x2d -> :sswitch_23
        0xffff -> :sswitch_17
    .end sparse-switch

    :array_48
    .array-data 2
        0x2ds
        0x0s
    .end array-data
.end method
