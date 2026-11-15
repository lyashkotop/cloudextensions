.class public interface abstract Lcom/streambundlehtml/Connection$Request;
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
    name = "Request"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/streambundlehtml/Connection$Base<",
        "Lcom/streambundlehtml/Connection$Request;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract data()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/Connection$KeyVal;",
            ">;"
        }
    .end annotation
.end method

.method public abstract followRedirects(Z)Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract followRedirects()Z
.end method

.method public abstract ignoreContentType(Z)Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract ignoreContentType()Z
.end method

.method public abstract ignoreHttpErrors(Z)Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract ignoreHttpErrors()Z
.end method

.method public abstract maxBodySize()I
.end method

.method public abstract maxBodySize(I)Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract parser()Lcom/streambundlehtml/parser/Parser;
.end method

.method public abstract postDataCharset(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract postDataCharset()Ljava/lang/String;
.end method

.method public abstract proxy(Ljava/lang/String;I)Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract proxy(Ljava/net/Proxy;)Lcom/streambundlehtml/Connection$Request;
    .param p1    # Ljava/net/Proxy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract proxy()Ljava/net/Proxy;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract requestBody(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Request;
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract requestBody()Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
.end method

.method public abstract timeout()I
.end method

.method public abstract timeout(I)Lcom/streambundlehtml/Connection$Request;
.end method
