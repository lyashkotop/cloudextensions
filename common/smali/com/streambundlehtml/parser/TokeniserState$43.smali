.class final enum Lcom/streambundlehtml/parser/TokeniserState$43;
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

    .line 907
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 910
    iget-object v0, p1, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    const/16 v1, 0x3e

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/CharacterReader;->consumeTo(C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/Token$Comment;->append(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Comment;

    .line 912
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v0

    .line 913
    .local v0, "next":C
    if-eq v0, v1, :cond_17

    const v1, 0xffff

    if-eq v0, v1, :cond_17

    goto :goto_22

    .line 914
    :cond_17
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    .line 915
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitCommentPending()V

    .line 916
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$43;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 918
    :goto_22
    return-void
.end method
