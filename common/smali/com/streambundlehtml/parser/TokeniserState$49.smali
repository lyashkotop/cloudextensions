.class final enum Lcom/streambundlehtml/parser/TokeniserState$49;
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

    .line 1041
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1043
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1044
    .local v0, "c":C
    const-string v1, "--"

    sparse-switch v0, :sswitch_data_52

    .line 1066
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Comment;->append(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1067
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$49;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_50

    .line 1061
    :sswitch_18
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1062
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 1063
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$49;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1064
    goto :goto_50

    .line 1046
    :sswitch_24
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 1047
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$49;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1048
    goto :goto_50

    .line 1058
    :sswitch_2d
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    const/16 v2, 0x2d

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1059
    goto :goto_50

    .line 1055
    :sswitch_35
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$49;->CommentEndBang:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1056
    goto :goto_50

    .line 1050
    :sswitch_3b
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1051
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Comment;->append(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v1

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1052
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$49;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1053
    nop

    .line 1069
    :goto_50
    return-void

    nop

    :sswitch_data_52
    .sparse-switch
        0x0 -> :sswitch_3b
        0x21 -> :sswitch_35
        0x2d -> :sswitch_2d
        0x3e -> :sswitch_24
        0xffff -> :sswitch_18
    .end sparse-switch
.end method
