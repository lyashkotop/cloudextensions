.class final enum Lcom/streambundlehtml/parser/TokeniserState$15;
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

    .line 272
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 274
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$15;->RawtextEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$15;->Rawtext:Lcom/streambundlehtml/parser/TokeniserState;

    # invokes: Lcom/streambundlehtml/parser/TokeniserState;->readEndTag(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V
    invoke-static {p1, p2, v0, v1}, Lcom/streambundlehtml/parser/TokeniserState;->access$400(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 275
    return-void
.end method
