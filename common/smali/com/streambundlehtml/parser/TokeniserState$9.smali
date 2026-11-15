.class final enum Lcom/streambundlehtml/parser/TokeniserState$9;
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

    .line 124
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 126
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 127
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 128
    const-string v0, "</"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 129
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$9;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_47

    .line 130
    :cond_14
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAsciiAlpha()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 131
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->createTagPending(Z)Lcom/streambundlehtml/parser/Token$Tag;

    .line 132
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$9;->TagName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_47

    .line 133
    :cond_24
    const/16 v0, 0x3e

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 134
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 135
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$9;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_47

    .line 137
    :cond_35
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 138
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createBogusCommentPending()V

    .line 139
    iget-object v0, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Token$Comment;->append(C)Lcom/streambundlehtml/parser/Token$Comment;

    .line 140
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$9;->BogusComment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 142
    :goto_47
    return-void
.end method
