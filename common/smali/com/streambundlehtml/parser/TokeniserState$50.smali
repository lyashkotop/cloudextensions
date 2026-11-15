.class final enum Lcom/streambundlehtml/parser/TokeniserState$50;
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

    .line 1071
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1073
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1074
    .local v0, "c":C
    const-string v1, "--!"

    sparse-switch v0, :sswitch_data_4e

    .line 1094
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Comment;->append(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1095
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$50;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_4d

    .line 1089
    :sswitch_18
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1090
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 1091
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$50;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1092
    goto :goto_4d

    .line 1080
    :sswitch_24
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 1081
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$50;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1082
    goto :goto_4d

    .line 1076
    :sswitch_2d
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Comment;->append(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1077
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$50;->CommentEndDash:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1078
    goto :goto_4d

    .line 1084
    :sswitch_38
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1085
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/parser/Token$Comment;->append(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v1

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 1086
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$50;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1087
    nop

    .line 1097
    :goto_4d
    return-void

    :sswitch_data_4e
    .sparse-switch
        0x0 -> :sswitch_38
        0x2d -> :sswitch_2d
        0x3e -> :sswitch_24
        0xffff -> :sswitch_18
    .end sparse-switch
.end method
