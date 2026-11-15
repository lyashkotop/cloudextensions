.class final enum Lcom/streambundlehtml/parser/TokeniserState$46;
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

    .line 968
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 970
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 971
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_42

    .line 991
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 992
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$46;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_41

    .line 986
    :sswitch_12
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 987
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 988
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$46;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 989
    goto :goto_41

    .line 981
    :sswitch_1e
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 982
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 983
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$46;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 984
    goto :goto_41

    .line 973
    :sswitch_2a
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$46;->CommentEnd:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 974
    goto :goto_41

    .line 976
    :sswitch_30
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 977
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 978
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$46;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 979
    nop

    .line 994
    :goto_41
    return-void

    :sswitch_data_42
    .sparse-switch
        0x0 -> :sswitch_30
        0x2d -> :sswitch_2a
        0x3e -> :sswitch_1e
        0xffff -> :sswitch_12
    .end sparse-switch
.end method
