.class final enum Lcom/streambundlehtml/parser/TokeniserState$2;
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

    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 36
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$2;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    # invokes: Lcom/streambundlehtml/parser/TokeniserState;->readCharRef(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/TokeniserState;)V
    invoke-static {p1, v0}, Lcom/streambundlehtml/parser/TokeniserState;->access$100(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 37
    return-void
.end method
