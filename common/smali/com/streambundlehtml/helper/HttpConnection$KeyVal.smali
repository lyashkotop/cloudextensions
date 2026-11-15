.class public Lcom/streambundlehtml/helper/HttpConnection$KeyVal;
.super Ljava/lang/Object;
.source "HttpConnection.java"

# interfaces
.implements Lcom/streambundlehtml/Connection$KeyVal;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/helper/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "KeyVal"
.end annotation


# instance fields
.field private contentType:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private key:Ljava/lang/String;

.field private stream:Ljava/io/InputStream;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private value:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 1276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1277
    const-string v0, "key"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 1278
    const-string v0, "value"

    invoke-static {p2, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1279
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    .line 1280
    iput-object p2, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    .line 1281
    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .line 1268
    new-instance v0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    invoke-direct {v0, p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;
    .registers 4
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;

    .line 1272
    new-instance v0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    invoke-direct {v0, p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1273
    invoke-virtual {v0, p2}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->inputStream(Ljava/io/InputStream;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v0

    .line 1272
    return-object v0
.end method


# virtual methods
.method public contentType(Ljava/lang/String;)Lcom/streambundlehtml/Connection$KeyVal;
    .registers 2
    .param p1, "contentType"    # Ljava/lang/String;

    .line 1319
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 1320
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->contentType:Ljava/lang/String;

    .line 1321
    return-object p0
.end method

.method public contentType()Ljava/lang/String;
    .registers 2

    .line 1326
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public hasInputStream()Z
    .registers 2

    .line 1314
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->stream:Ljava/io/InputStream;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public bridge synthetic inputStream(Ljava/io/InputStream;)Lcom/streambundlehtml/Connection$KeyVal;
    .registers 2

    .line 1261
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->inputStream(Ljava/io/InputStream;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object p1

    return-object p1
.end method

.method public inputStream(Ljava/io/InputStream;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;
    .registers 4
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .line 1304
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    const-string v1, "inputStream"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1305
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->stream:Ljava/io/InputStream;

    .line 1306
    return-object p0
.end method

.method public inputStream()Ljava/io/InputStream;
    .registers 2

    .line 1310
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->stream:Ljava/io/InputStream;

    return-object v0
.end method

.method public bridge synthetic key(Ljava/lang/String;)Lcom/streambundlehtml/Connection$KeyVal;
    .registers 2

    .line 1261
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->key(Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object p1

    return-object p1
.end method

.method public key(Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .line 1284
    const-string v0, "key"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 1285
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    .line 1286
    return-object p0
.end method

.method public key()Ljava/lang/String;
    .registers 2

    .line 1290
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1331
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic value(Ljava/lang/String;)Lcom/streambundlehtml/Connection$KeyVal;
    .registers 2

    .line 1261
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->value(Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object p1

    return-object p1
.end method

.method public value(Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .line 1294
    const-string v0, "value"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1295
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    .line 1296
    return-object p0
.end method

.method public value()Ljava/lang/String;
    .registers 2

    .line 1300
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    return-object v0
.end method
