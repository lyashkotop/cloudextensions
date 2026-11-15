.class final enum Lcom/streambundlehtml/parser/TokeniserState$44;
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

    .line 920
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 922
    const-string v0, "--"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 923
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createCommentPending()V

    .line 924
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$44;->CommentStart:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3b

    .line 925
    :cond_11
    const-string v0, "DOCTYPE"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsumeIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 926
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$44;->Doctype:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3b

    .line 927
    :cond_1f
    const-string v0, "[CDATA["

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 931
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createTempBuffer()V

    .line 932
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$44;->CdataSection:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3b

    .line 934
    :cond_30
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 935
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createBogusCommentPending()V

    .line 936
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$44;->BogusComment:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 938
    :goto_3b
    return-void
.end method
