.class final enum Lcom/streambundlehtml/parser/TokeniserState$48;
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

    .line 1018
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1020
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1021
    .local v0, "c":C
    const/16 v1, 0x2d

    sparse-switch v0, :sswitch_data_40

    .line 1036
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1037
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$48;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3f

    .line 1031
    :sswitch_18
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1032
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 1033
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$48;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1034
    goto :goto_3f

    .line 1023
    :sswitch_24
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$48;->CommentEnd:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1024
    goto :goto_3f

    .line 1026
    :sswitch_2a
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1027
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v1

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1028
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$48;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1029
    nop

    .line 1039
    :goto_3f
    return-void

    :sswitch_data_40
    .sparse-switch
        0x0 -> :sswitch_2a
        0x2d -> :sswitch_24
        0xffff -> :sswitch_18
    .end sparse-switch
.end method
