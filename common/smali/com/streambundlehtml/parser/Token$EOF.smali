.class final Lcom/streambundlehtml/parser/Token$EOF;
.super Lcom/streambundlehtml/parser/Token;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EOF"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .line 429
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/Token;-><init>(Lcom/streambundlehtml/parser/Token$1;)V

    .line 430
    sget-object v0, Lcom/streambundlehtml/parser/Token$TokenType;->EOF:Lcom/streambundlehtml/parser/Token$TokenType;

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$EOF;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    .line 431
    return-void
.end method


# virtual methods
.method reset()Lcom/streambundlehtml/parser/Token;
    .registers 1

    .line 435
    invoke-super {p0}, Lcom/streambundlehtml/parser/Token;->reset()Lcom/streambundlehtml/parser/Token;

    .line 436
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 441
    const-string v0, ""

    return-object v0
.end method
