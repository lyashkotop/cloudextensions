.class Lcom/streambundlehtml/parser/Token$Character;
.super Lcom/streambundlehtml/parser/Token;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Character"
.end annotation


# instance fields
.field private data:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 389
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/Token;-><init>(Lcom/streambundlehtml/parser/Token$1;)V

    .line 390
    sget-object v0, Lcom/streambundlehtml/parser/Token$TokenType;->Character:Lcom/streambundlehtml/parser/Token$TokenType;

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Character;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    .line 391
    return-void
.end method


# virtual methods
.method data(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Character;
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .line 401
    iput-object p1, p0, Lcom/streambundlehtml/parser/Token$Character;->data:Ljava/lang/String;

    .line 402
    return-object p0
.end method

.method getData()Ljava/lang/String;
    .registers 2

    .line 406
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Character;->data:Ljava/lang/String;

    return-object v0
.end method

.method reset()Lcom/streambundlehtml/parser/Token;
    .registers 2

    .line 395
    invoke-super {p0}, Lcom/streambundlehtml/parser/Token;->reset()Lcom/streambundlehtml/parser/Token;

    .line 396
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Character;->data:Ljava/lang/String;

    .line 397
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 411
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
