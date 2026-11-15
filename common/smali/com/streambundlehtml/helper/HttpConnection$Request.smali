.class public Lcom/streambundlehtml/helper/HttpConnection$Request;
.super Lcom/streambundlehtml/helper/HttpConnection$Base;
.source "HttpConnection.java"

# interfaces
.implements Lcom/streambundlehtml/Connection$Request;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/helper/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Request"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/streambundlehtml/helper/HttpConnection$Base<",
        "Lcom/streambundlehtml/Connection$Request;",
        ">;",
        "Lcom/streambundlehtml/Connection$Request;"
    }
.end annotation


# instance fields
.field private body:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private cookieManager:Ljava/net/CookieManager;

.field private final data:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/Connection$KeyVal;",
            ">;"
        }
    .end annotation
.end field

.field private volatile executing:Z

.field private followRedirects:Z

.field private ignoreContentType:Z

.field private ignoreHttpErrors:Z

.field private maxBodySizeBytes:I

.field private parser:Lcom/streambundlehtml/parser/Parser;

.field private parserDefined:Z

.field private postDataCharset:Ljava/lang/String;

.field private proxy:Ljava/net/Proxy;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private timeoutMilliseconds:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 631
    const-string v0, "sun.net.http.allowRestrictedHeaders"

    const-string v1, "true"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 633
    return-void
.end method

.method constructor <init>()V
    .registers 3

    .line 651
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/helper/HttpConnection$Base;-><init>(Lcom/streambundlehtml/helper/HttpConnection$1;)V

    .line 640
    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->body:Ljava/lang/String;

    .line 641
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 642
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 644
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parserDefined:Z

    .line 645
    sget-object v1, Lcom/streambundlehtml/helper/DataUtil;->defaultCharsetName:Ljava/lang/String;

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    .line 648
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z

    .line 652
    const/16 v0, 0x7530

    iput v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 653
    const/high16 v0, 0x200000

    iput v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 654
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->followRedirects:Z

    .line 655
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    .line 656
    sget-object v0, Lcom/streambundlehtml/Connection$Method;->GET:Lcom/streambundlehtml/Connection$Method;

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->method:Lcom/streambundlehtml/Connection$Method;

    .line 657
    const-string v0, "Accept-Encoding"

    const-string v1, "gzip"

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 658
    const-string v0, "User-Agent"

    const-string v1, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36"

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 659
    invoke-static {}, Lcom/streambundlehtml/parser/Parser;->htmlParser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser:Lcom/streambundlehtml/parser/Parser;

    .line 660
    new-instance v0, Ljava/net/CookieManager;

    invoke-direct {v0}, Ljava/net/CookieManager;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager:Ljava/net/CookieManager;

    .line 661
    return-void
.end method

.method constructor <init>(Lcom/streambundlehtml/helper/HttpConnection$Request;)V
    .registers 4
    .param p1, "copy"    # Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 664
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/streambundlehtml/helper/HttpConnection$Base;-><init>(Lcom/streambundlehtml/helper/HttpConnection$Base;Lcom/streambundlehtml/helper/HttpConnection$1;)V

    .line 640
    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->body:Ljava/lang/String;

    .line 641
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 642
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 644
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parserDefined:Z

    .line 645
    sget-object v1, Lcom/streambundlehtml/helper/DataUtil;->defaultCharsetName:Ljava/lang/String;

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    .line 648
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z

    .line 665
    iget-object v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy:Ljava/net/Proxy;

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy:Ljava/net/Proxy;

    .line 666
    iget-object v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    .line 667
    iget v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeoutMilliseconds:I

    iput v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 668
    iget v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySizeBytes:I

    iput v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 669
    iget-boolean v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->followRedirects:Z

    iput-boolean v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->followRedirects:Z

    .line 670
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    .line 672
    iget-boolean v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    iput-boolean v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 673
    iget-boolean v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreContentType:Z

    iput-boolean v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 674
    iget-object v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser:Lcom/streambundlehtml/parser/Parser;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Parser;->newInstance()Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser:Lcom/streambundlehtml/parser/Parser;

    .line 675
    iget-boolean v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->parserDefined:Z

    iput-boolean v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parserDefined:Z

    .line 676
    iget-object v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 677
    iget-object v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager:Ljava/net/CookieManager;

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager:Ljava/net/CookieManager;

    .line 678
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z

    .line 679
    return-void
.end method

.method static synthetic access$000(Lcom/streambundlehtml/helper/HttpConnection$Request;)Ljava/net/CookieManager;
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 629
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager:Ljava/net/CookieManager;

    return-object v0
.end method

.method static synthetic access$002(Lcom/streambundlehtml/helper/HttpConnection$Request;Ljava/net/CookieManager;)Ljava/net/CookieManager;
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .param p1, "x1"    # Ljava/net/CookieManager;

    .line 629
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager:Ljava/net/CookieManager;

    return-object p1
.end method

.method static synthetic access$600(Lcom/streambundlehtml/helper/HttpConnection$Request;)Z
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 629
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z

    return v0
.end method

.method static synthetic access$602(Lcom/streambundlehtml/helper/HttpConnection$Request;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .param p1, "x1"    # Z

    .line 629
    iput-boolean p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z

    return p1
.end method

.method static synthetic access$700(Lcom/streambundlehtml/helper/HttpConnection$Request;)Z
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 629
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parserDefined:Z

    return v0
.end method


# virtual methods
.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 3

    .line 629
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 3

    .line 629
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method cookieManager()Ljava/net/CookieManager;
    .registers 2

    .line 791
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager:Ljava/net/CookieManager;

    return-object v0
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .line 629
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/Connection$Request;
    .registers 2

    .line 629
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    move-result-object p1

    return-object p1
.end method

.method public data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/helper/HttpConnection$Request;
    .registers 3
    .param p1, "keyval"    # Lcom/streambundlehtml/Connection$KeyVal;

    .line 751
    const-string v0, "keyval"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 752
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 753
    return-object p0
.end method

.method public data()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/Connection$KeyVal;",
            ">;"
        }
    .end annotation

    .line 757
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    return-object v0
.end method

.method public followRedirects(Z)Lcom/streambundlehtml/Connection$Request;
    .registers 2
    .param p1, "followRedirects"    # Z

    .line 720
    iput-boolean p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->followRedirects:Z

    .line 721
    return-object p0
.end method

.method public followRedirects()Z
    .registers 2

    .line 716
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->followRedirects:Z

    return v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    .line 629
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 3

    .line 629
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic headers(Ljava/lang/String;)Ljava/util/List;
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .line 629
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public ignoreContentType(Z)Lcom/streambundlehtml/Connection$Request;
    .registers 2
    .param p1, "ignoreContentType"    # Z

    .line 746
    iput-boolean p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 747
    return-object p0
.end method

.method public ignoreContentType()Z
    .registers 2

    .line 742
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreContentType:Z

    return v0
.end method

.method public ignoreHttpErrors(Z)Lcom/streambundlehtml/Connection$Request;
    .registers 2
    .param p1, "ignoreHttpErrors"    # Z

    .line 737
    iput-boolean p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 738
    return-object p0
.end method

.method public ignoreHttpErrors()Z
    .registers 2

    .line 725
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    return v0
.end method

.method public maxBodySize()I
    .registers 2

    .line 706
    iget v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySizeBytes:I

    return v0
.end method

.method public maxBodySize(I)Lcom/streambundlehtml/Connection$Request;
    .registers 4
    .param p1, "bytes"    # I

    .line 710
    if-ltz p1, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    :goto_5
    const-string v1, "maxSize must be 0 (unlimited) or larger"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 711
    iput p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 712
    return-object p0
.end method

.method public bridge synthetic method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic method()Lcom/streambundlehtml/Connection$Method;
    .registers 2

    .line 629
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->method()Lcom/streambundlehtml/Connection$Method;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic multiHeaders()Ljava/util/Map;
    .registers 2

    .line 629
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->multiHeaders()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/Connection$Request;
    .registers 2

    .line 629
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    move-result-object p1

    return-object p1
.end method

.method public parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/helper/HttpConnection$Request;
    .registers 3
    .param p1, "parser"    # Lcom/streambundlehtml/parser/Parser;

    .line 770
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser:Lcom/streambundlehtml/parser/Parser;

    .line 771
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parserDefined:Z

    .line 772
    return-object p0
.end method

.method public parser()Lcom/streambundlehtml/parser/Parser;
    .registers 2

    .line 776
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser:Lcom/streambundlehtml/parser/Parser;

    return-object v0
.end method

.method public postDataCharset(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Request;
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;

    .line 780
    const-string v0, "charset"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 781
    invoke-static {p1}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 782
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    .line 783
    return-object p0

    .line 781
    :cond_e
    new-instance v0, Ljava/nio/charset/IllegalCharsetNameException;

    invoke-direct {v0, p1}, Ljava/nio/charset/IllegalCharsetNameException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public postDataCharset()Ljava/lang/String;
    .registers 2

    .line 787
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic proxy(Ljava/lang/String;I)Lcom/streambundlehtml/Connection$Request;
    .registers 3

    .line 629
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy(Ljava/lang/String;I)Lcom/streambundlehtml/helper/HttpConnection$Request;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic proxy(Ljava/net/Proxy;)Lcom/streambundlehtml/Connection$Request;
    .registers 2
    .param p1    # Ljava/net/Proxy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 629
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy(Ljava/net/Proxy;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    move-result-object p1

    return-object p1
.end method

.method public proxy(Ljava/lang/String;I)Lcom/streambundlehtml/helper/HttpConnection$Request;
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .line 691
    new-instance v0, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-static {p1, p2}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy:Ljava/net/Proxy;

    .line 692
    return-object p0
.end method

.method public proxy(Ljava/net/Proxy;)Lcom/streambundlehtml/helper/HttpConnection$Request;
    .registers 2
    .param p1, "proxy"    # Ljava/net/Proxy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 686
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy:Ljava/net/Proxy;

    .line 687
    return-object p0
.end method

.method public proxy()Ljava/net/Proxy;
    .registers 2

    .line 682
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public bridge synthetic removeCookie(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->removeCookie(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic removeHeader(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->removeHeader(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public requestBody(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Request;
    .registers 2
    .param p1, "body"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 761
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->body:Ljava/lang/String;

    .line 762
    return-object p0
.end method

.method public requestBody()Ljava/lang/String;
    .registers 2

    .line 766
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->body:Ljava/lang/String;

    return-object v0
.end method

.method public sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .registers 2

    .line 729
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method public sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
    .registers 2
    .param p1, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;

    .line 733
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 734
    return-void
.end method

.method public timeout()I
    .registers 2

    .line 696
    iget v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeoutMilliseconds:I

    return v0
.end method

.method public bridge synthetic timeout(I)Lcom/streambundlehtml/Connection$Request;
    .registers 2

    .line 629
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeout(I)Lcom/streambundlehtml/helper/HttpConnection$Request;

    move-result-object p1

    return-object p1
.end method

.method public timeout(I)Lcom/streambundlehtml/helper/HttpConnection$Request;
    .registers 4
    .param p1, "millis"    # I

    .line 700
    if-ltz p1, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    :goto_5
    const-string v1, "Timeout milliseconds must be 0 (infinite) or greater"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 701
    iput p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 702
    return-object p0
.end method

.method public bridge synthetic url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;
    .registers 2

    .line 629
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .line 629
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
