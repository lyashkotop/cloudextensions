.class public interface abstract Lcom/streambundlehtml/Connection$Response;
.super Ljava/lang/Object;
.source "Connection.java"

# interfaces
.implements Lcom/streambundlehtml/Connection$Base;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Response"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/streambundlehtml/Connection$Base<",
        "Lcom/streambundlehtml/Connection$Response;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract body()Ljava/lang/String;
.end method

.method public abstract bodyAsBytes()[B
.end method

.method public abstract bodyStream()Ljava/io/BufferedInputStream;
.end method

.method public abstract bufferUp()Lcom/streambundlehtml/Connection$Response;
.end method

.method public abstract charset(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Response;
.end method

.method public abstract charset()Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract contentType()Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract parse()Lcom/streambundlehtml/nodes/Document;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract statusCode()I
.end method

.method public abstract statusMessage()Ljava/lang/String;
.end method
