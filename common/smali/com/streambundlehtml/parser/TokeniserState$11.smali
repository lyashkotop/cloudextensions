.class final enum Lcom/streambundlehtml/parser/TokeniserState$11;
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

    .line 183
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 186
    const/16 v0, 0x2f

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 187
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createTempBuffer()V

    .line 188
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$11;->RCDATAEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_49

    .line 189
    :cond_11
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAsciiAlpha()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->appropriateEndTagName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3f

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->appropriateEndTagSeq()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->containsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3f

    .line 192
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->createTagPending(Z)Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->appropriateEndTagName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Token$Tag;->name(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    iput-object v0, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    .line 193
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 194
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$11;->TagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_49

    .line 196
    :cond_3f
    const-string v0, "<"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 197
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$11;->Rcdata:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 199
    :goto_49
    return-void
.end method
