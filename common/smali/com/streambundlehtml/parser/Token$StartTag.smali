.class final Lcom/streambundlehtml/parser/Token$StartTag;
.super Lcom/streambundlehtml/parser/Token$Tag;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "StartTag"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .line 294
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Tag;-><init>()V

    .line 295
    sget-object v0, Lcom/streambundlehtml/parser/Token$TokenType;->StartTag:Lcom/streambundlehtml/parser/Token$TokenType;

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$StartTag;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    .line 296
    return-void
.end method


# virtual methods
.method nameAttr(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Lcom/streambundlehtml/parser/Token$StartTag;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attributes"    # Lcom/streambundlehtml/nodes/Attributes;

    .line 306
    iput-object p1, p0, Lcom/streambundlehtml/parser/Token$StartTag;->tagName:Ljava/lang/String;

    .line 307
    iput-object p2, p0, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 308
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$StartTag;->tagName:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundlehtml/parser/ParseSettings;->normalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$StartTag;->normalName:Ljava/lang/String;

    .line 309
    return-object p0
.end method

.method reset()Lcom/streambundlehtml/parser/Token$Tag;
    .registers 2

    .line 300
    invoke-super {p0}, Lcom/streambundlehtml/parser/Token$Tag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    .line 301
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 302
    return-object p0
.end method

.method bridge synthetic reset()Lcom/streambundlehtml/parser/Token;
    .registers 2

    .line 292
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$StartTag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 314
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttributes()Z

    move-result v0

    const-string v1, ">"

    const-string v2, "<"

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->size()I

    move-result v0

    if-lez v0, :cond_3c

    .line 315
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$StartTag;->toStringName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Attributes;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 317
    :cond_3c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$StartTag;->toStringName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
