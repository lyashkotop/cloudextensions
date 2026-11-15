.class final enum Lcom/streambundlehtml/parser/TokeniserState$67;
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

    .line 1610
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1612
    const-string v0, "]]>"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1613
    .local v1, "data":Ljava/lang/String;
    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1614
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_18

    goto :goto_2b

    .line 1615
    :cond_18
    new-instance v0, Lcom/streambundlehtml/parser/Token$CData;

    iget-object v2, p1, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/streambundlehtml/parser/Token$CData;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Lcom/streambundlehtml/parser/Token;)V

    .line 1616
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$67;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1618
    :goto_2b
    return-void
.end method
