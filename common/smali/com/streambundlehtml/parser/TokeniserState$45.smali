.class final enum Lcom/streambundlehtml/parser/TokeniserState$45;
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

    .line 940
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 942
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 943
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_40

    .line 963
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 964
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$45;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3f

    .line 958
    :sswitch_10
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 959
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 960
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$45;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 961
    goto :goto_3f

    .line 953
    :sswitch_1c
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 954
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 955
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$45;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 956
    goto :goto_3f

    .line 945
    :sswitch_28
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$45;->CommentStartDash:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 946
    goto :goto_3f

    .line 948
    :sswitch_2e
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 949
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 950
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$45;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 951
    nop

    .line 966
    :goto_3f
    return-void

    :sswitch_data_40
    .sparse-switch
        0x0 -> :sswitch_2e
        0x2d -> :sswitch_28
        0x3e -> :sswitch_1c
        0xffff -> :sswitch_10
    .end sparse-switch
.end method
