.class abstract Lcom/streambundlehtml/parser/Token;
.super Ljava/lang/Object;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/parser/Token$TokenType;,
        Lcom/streambundlehtml/parser/Token$Doctype;,
        Lcom/streambundlehtml/parser/Token$StartTag;,
        Lcom/streambundlehtml/parser/Token$EndTag;,
        Lcom/streambundlehtml/parser/Token$Comment;,
        Lcom/streambundlehtml/parser/Token$CData;,
        Lcom/streambundlehtml/parser/Token$Character;,
        Lcom/streambundlehtml/parser/Token$EOF;,
        Lcom/streambundlehtml/parser/Token$Tag;
    }
.end annotation


# static fields
.field static final Unset:I = -0x1


# instance fields
.field private endPos:I

.field private startPos:I

.field type:Lcom/streambundlehtml/parser/Token$TokenType;


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, -0x1

    iput v0, p0, Lcom/streambundlehtml/parser/Token;->endPos:I

    .line 17
    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundlehtml/parser/Token$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/streambundlehtml/parser/Token$1;

    .line 11
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token;-><init>()V

    return-void
.end method

.method static reset(Ljava/lang/StringBuilder;)V
    .registers 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;

    .line 50
    if-eqz p0, :cond_a

    .line 51
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 53
    :cond_a
    return-void
.end method


# virtual methods
.method final asCharacter()Lcom/streambundlehtml/parser/Token$Character;
    .registers 2

    .line 486
    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/parser/Token$Character;

    return-object v0
.end method

.method final asComment()Lcom/streambundlehtml/parser/Token$Comment;
    .registers 2

    .line 474
    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/parser/Token$Comment;

    return-object v0
.end method

.method final asDoctype()Lcom/streambundlehtml/parser/Token$Doctype;
    .registers 2

    .line 450
    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/parser/Token$Doctype;

    return-object v0
.end method

.method final asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;
    .registers 2

    .line 466
    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/parser/Token$EndTag;

    return-object v0
.end method

.method final asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;
    .registers 2

    .line 458
    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/parser/Token$StartTag;

    return-object v0
.end method

.method endPos()I
    .registers 2

    .line 42
    iget v0, p0, Lcom/streambundlehtml/parser/Token;->endPos:I

    return v0
.end method

.method endPos(I)V
    .registers 2
    .param p1, "pos"    # I

    .line 46
    iput p1, p0, Lcom/streambundlehtml/parser/Token;->endPos:I

    .line 47
    return-void
.end method

.method final isCData()Z
    .registers 2

    .line 482
    instance-of v0, p0, Lcom/streambundlehtml/parser/Token$CData;

    return v0
.end method

.method final isCharacter()Z
    .registers 3

    .line 478
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v1, Lcom/streambundlehtml/parser/Token$TokenType;->Character:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method final isComment()Z
    .registers 3

    .line 470
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v1, Lcom/streambundlehtml/parser/Token$TokenType;->Comment:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method final isDoctype()Z
    .registers 3

    .line 446
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v1, Lcom/streambundlehtml/parser/Token$TokenType;->Doctype:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method final isEOF()Z
    .registers 3

    .line 490
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v1, Lcom/streambundlehtml/parser/Token$TokenType;->EOF:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method final isEndTag()Z
    .registers 3

    .line 462
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v1, Lcom/streambundlehtml/parser/Token$TokenType;->EndTag:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method final isStartTag()Z
    .registers 3

    .line 454
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v1, Lcom/streambundlehtml/parser/Token$TokenType;->StartTag:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method reset()Lcom/streambundlehtml/parser/Token;
    .registers 2

    .line 28
    const/4 v0, -0x1

    iput v0, p0, Lcom/streambundlehtml/parser/Token;->startPos:I

    .line 29
    iput v0, p0, Lcom/streambundlehtml/parser/Token;->endPos:I

    .line 30
    return-object p0
.end method

.method startPos()I
    .registers 2

    .line 34
    iget v0, p0, Lcom/streambundlehtml/parser/Token;->startPos:I

    return v0
.end method

.method startPos(I)V
    .registers 2
    .param p1, "pos"    # I

    .line 38
    iput p1, p0, Lcom/streambundlehtml/parser/Token;->startPos:I

    .line 39
    return-void
.end method

.method tokenType()Ljava/lang/String;
    .registers 2

    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
