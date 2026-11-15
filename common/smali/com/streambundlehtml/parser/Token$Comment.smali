.class final Lcom/streambundlehtml/parser/Token$Comment;
.super Lcom/streambundlehtml/parser/Token;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Comment"
.end annotation


# instance fields
.field bogus:Z

.field private final data:Ljava/lang/StringBuilder;

.field private dataS:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 347
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/Token;-><init>(Lcom/streambundlehtml/parser/Token$1;)V

    .line 334
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    .line 336
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->bogus:Z

    .line 348
    sget-object v0, Lcom/streambundlehtml/parser/Token$TokenType;->Comment:Lcom/streambundlehtml/parser/Token$TokenType;

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    .line 349
    return-void
.end method

.method private ensureData()V
    .registers 3

    .line 373
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->dataS:Ljava/lang/String;

    if-eqz v0, :cond_e

    .line 374
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Token$Comment;->dataS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->dataS:Ljava/lang/String;

    .line 377
    :cond_e
    return-void
.end method


# virtual methods
.method final append(C)Lcom/streambundlehtml/parser/Token$Comment;
    .registers 3
    .param p1, "append"    # C

    .line 366
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Comment;->ensureData()V

    .line 367
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 368
    return-object p0
.end method

.method final append(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Comment;
    .registers 3
    .param p1, "append"    # Ljava/lang/String;

    .line 356
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Comment;->ensureData()V

    .line 357
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_e

    .line 358
    iput-object p1, p0, Lcom/streambundlehtml/parser/Token$Comment;->dataS:Ljava/lang/String;

    goto :goto_13

    .line 360
    :cond_e
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    :goto_13
    return-object p0
.end method

.method getData()Ljava/lang/String;
    .registers 2

    .line 352
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->dataS:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->dataS:Ljava/lang/String;

    goto :goto_d

    :cond_7
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_d
    return-object v0
.end method

.method reset()Lcom/streambundlehtml/parser/Token;
    .registers 2

    .line 340
    invoke-super {p0}, Lcom/streambundlehtml/parser/Token;->reset()Lcom/streambundlehtml/parser/Token;

    .line 341
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/streambundlehtml/parser/Token$Comment;->reset(Ljava/lang/StringBuilder;)V

    .line 342
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->dataS:Ljava/lang/String;

    .line 343
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Comment;->bogus:Z

    .line 344
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 381
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<!--"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$Comment;->getData()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
