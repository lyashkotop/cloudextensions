.class final enum Lcom/streambundlehtml/parser/TokeniserState$14;
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

    .line 261
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 263
    const/16 v0, 0x2f

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 264
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->createTempBuffer()V

    .line 265
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$14;->RawtextEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_1b

    .line 267
    :cond_11
    const/16 v0, 0x3c

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 268
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$14;->Rawtext:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 270
    :goto_1b
    return-void
.end method
