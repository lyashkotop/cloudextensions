.class public interface abstract Lcom/streambundlehtml/Connection;
.super Ljava/lang/Object;
.source "Connection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/Connection$KeyVal;,
        Lcom/streambundlehtml/Connection$Response;,
        Lcom/streambundlehtml/Connection$Request;,
        Lcom/streambundlehtml/Connection$Base;,
        Lcom/streambundlehtml/Connection$Method;
    }
.end annotation


# virtual methods
.method public abstract cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract cookieStore(Ljava/net/CookieStore;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract cookieStore()Ljava/net/CookieStore;
.end method

.method public abstract cookies(Ljava/util/Map;)Lcom/streambundlehtml/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/streambundlehtml/Connection;"
        }
    .end annotation
.end method

.method public abstract data(Ljava/lang/String;)Lcom/streambundlehtml/Connection$KeyVal;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract data(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract data(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract data(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract data(Ljava/util/Collection;)Lcom/streambundlehtml/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/Connection$KeyVal;",
            ">;)",
            "Lcom/streambundlehtml/Connection;"
        }
    .end annotation
.end method

.method public abstract data(Ljava/util/Map;)Lcom/streambundlehtml/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/streambundlehtml/Connection;"
        }
    .end annotation
.end method

.method public varargs abstract data([Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract execute()Lcom/streambundlehtml/Connection$Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract followRedirects(Z)Lcom/streambundlehtml/Connection;
.end method

.method public abstract get()Lcom/streambundlehtml/nodes/Document;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract headers(Ljava/util/Map;)Lcom/streambundlehtml/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/streambundlehtml/Connection;"
        }
    .end annotation
.end method

.method public abstract ignoreContentType(Z)Lcom/streambundlehtml/Connection;
.end method

.method public abstract ignoreHttpErrors(Z)Lcom/streambundlehtml/Connection;
.end method

.method public abstract maxBodySize(I)Lcom/streambundlehtml/Connection;
.end method

.method public abstract method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract newRequest()Lcom/streambundlehtml/Connection;
.end method

.method public abstract parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract post()Lcom/streambundlehtml/nodes/Document;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract postDataCharset(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract proxy(Ljava/lang/String;I)Lcom/streambundlehtml/Connection;
.end method

.method public abstract proxy(Ljava/net/Proxy;)Lcom/streambundlehtml/Connection;
    .param p1    # Ljava/net/Proxy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract referrer(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract request()Lcom/streambundlehtml/Connection$Request;
.end method

.method public abstract request(Lcom/streambundlehtml/Connection$Request;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract requestBody(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract response()Lcom/streambundlehtml/Connection$Response;
.end method

.method public abstract response(Lcom/streambundlehtml/Connection$Response;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract timeout(I)Lcom/streambundlehtml/Connection;
.end method

.method public abstract url(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract url(Ljava/net/URL;)Lcom/streambundlehtml/Connection;
.end method

.method public abstract userAgent(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
.end method
