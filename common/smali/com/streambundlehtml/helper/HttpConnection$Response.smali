.class public Lcom/streambundlehtml/helper/HttpConnection$Response;
.super Lcom/streambundlehtml/helper/HttpConnection$Base;
.source "HttpConnection.java"

# interfaces
.implements Lcom/streambundlehtml/Connection$Response;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/helper/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/streambundlehtml/helper/HttpConnection$Base<",
        "Lcom/streambundlehtml/Connection$Response;",
        ">;",
        "Lcom/streambundlehtml/Connection$Response;"
    }
.end annotation


# static fields
.field private static final LOCATION:Ljava/lang/String; = "Location"

.field private static final MAX_REDIRECTS:I = 0x14

.field private static final xmlContentTypeRxp:Ljava/util/regex/Pattern;


# instance fields
.field private bodyStream:Ljava/io/InputStream;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private byteData:Ljava/nio/ByteBuffer;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private charset:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private conn:Ljava/net/HttpURLConnection;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final contentType:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private executed:Z

.field private inputStreamRead:Z

.field private numRedirects:I

.field private final req:Lcom/streambundlehtml/helper/HttpConnection$Request;

.field private final statusCode:I

.field private final statusMessage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 813
    const-string v0, "(application|text)/\\w*\\+?xml.*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .line 820
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/helper/HttpConnection$Base;-><init>(Lcom/streambundlehtml/helper/HttpConnection$1;)V

    .line 805
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->executed:Z

    .line 806
    iput-boolean v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    .line 807
    iput v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->numRedirects:I

    .line 821
    const/16 v1, 0x190

    iput v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->statusCode:I

    .line 822
    const-string v1, "Request not made"

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    .line 823
    new-instance v1, Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-direct {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;-><init>()V

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 824
    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    .line 825
    return-void
.end method

.method private constructor <init>(Ljava/net/HttpURLConnection;Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;)V
    .registers 10
    .param p1, "conn"    # Ljava/net/HttpURLConnection;
    .param p2, "request"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .param p3, "previousResponse"    # Lcom/streambundlehtml/helper/HttpConnection$Response;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1062
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/helper/HttpConnection$Base;-><init>(Lcom/streambundlehtml/helper/HttpConnection$1;)V

    .line 805
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->executed:Z

    .line 806
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    .line 807
    iput v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->numRedirects:I

    .line 1063
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->conn:Ljava/net/HttpURLConnection;

    .line 1064
    iput-object p2, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 1065
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundlehtml/Connection$Method;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Method;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->method:Lcom/streambundlehtml/Connection$Method;

    .line 1066
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->url:Ljava/net/URL;

    .line 1067
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    iput v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->statusCode:I

    .line 1068
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    .line 1069
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    .line 1071
    invoke-static {p1}, Lcom/streambundlehtml/helper/HttpConnection$Response;->createHeaderMap(Ljava/net/HttpURLConnection;)Ljava/util/LinkedHashMap;

    move-result-object v1

    .line 1072
    .local v1, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Response;->processResponseHeaders(Ljava/util/Map;)V

    .line 1073
    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    iget-object v3, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->url:Ljava/net/URL;

    invoke-static {v2, v3, v1}, Lcom/streambundlehtml/helper/CookieUtil;->storeCookies(Lcom/streambundlehtml/helper/HttpConnection$Request;Ljava/net/URL;Ljava/util/Map;)V

    .line 1075
    if-eqz p3, :cond_99

    .line 1077
    invoke-virtual {p3}, Lcom/streambundlehtml/helper/HttpConnection$Response;->cookies()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_75

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 1078
    .local v3, "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/streambundlehtml/helper/HttpConnection$Response;->hasCookie(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_74

    .line 1079
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p0, v4, v5}, Lcom/streambundlehtml/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 1080
    .end local v3    # "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_74
    goto :goto_4d

    .line 1081
    :cond_75
    invoke-direct {p3}, Lcom/streambundlehtml/helper/HttpConnection$Response;->safeClose()V

    .line 1084
    iget v2, p3, Lcom/streambundlehtml/helper/HttpConnection$Response;->numRedirects:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->numRedirects:I

    .line 1085
    iget v2, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->numRedirects:I

    const/16 v4, 0x14

    if-ge v2, v4, :cond_85

    goto :goto_99

    .line 1086
    :cond_85
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {p3}, Lcom/streambundlehtml/helper/HttpConnection$Response;->url()Ljava/net/URL;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v4, v3, v0

    const-string v0, "Too many redirects occurred trying to load URL %s"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1088
    :cond_99
    :goto_99
    return-void
.end method

.method private static createConnection(Lcom/streambundlehtml/helper/HttpConnection$Request;)Ljava/net/HttpURLConnection;
    .registers 8
    .param p0, "req"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1016
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy()Ljava/net/Proxy;

    move-result-object v0

    .line 1018
    .local v0, "proxy":Ljava/net/Proxy;
    if-nez v0, :cond_f

    .line 1019
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    goto :goto_17

    .line 1020
    :cond_f
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v1

    :goto_17
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 1023
    .local v1, "conn":Ljava/net/HttpURLConnection;
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method()Lcom/streambundlehtml/Connection$Method;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/Connection$Method;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1024
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 1025
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeout()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 1026
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeout()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 1028
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    if-eqz v2, :cond_4c

    instance-of v2, v1, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_4c

    .line 1029
    move-object v2, v1

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 1030
    :cond_4c
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method()Lcom/streambundlehtml/Connection$Method;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/Connection$Method;->hasBody()Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 1031
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 1032
    :cond_5a
    invoke-static {p0, v1}, Lcom/streambundlehtml/helper/CookieUtil;->applyCookiesToRequest(Lcom/streambundlehtml/helper/HttpConnection$Request;Ljava/net/HttpURLConnection;)V

    .line 1033
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->multiHeaders()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_69
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_96

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 1034
    .local v3, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_7f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_95

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1035
    .local v5, "value":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v1, v6, v5}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1036
    .end local v5    # "value":Ljava/lang/String;
    goto :goto_7f

    .line 1037
    .end local v3    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_95
    goto :goto_69

    .line 1038
    :cond_96
    return-object v1
.end method

.method private static createHeaderMap(Ljava/net/HttpURLConnection;)Ljava/util/LinkedHashMap;
    .registers 6
    .param p0, "conn"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1092
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1093
    .local v0, "headers":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v1, 0x0

    .line 1095
    .local v1, "i":I
    :cond_6
    :goto_6
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->getHeaderFieldKey(I)Ljava/lang/String;

    move-result-object v2

    .line 1096
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->getHeaderField(I)Ljava/lang/String;

    move-result-object v3

    .line 1097
    .local v3, "val":Ljava/lang/String;
    if-nez v2, :cond_14

    if-nez v3, :cond_14

    .line 1098
    nop

    .line 1111
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "val":Ljava/lang/String;
    return-object v0

    .line 1099
    .restart local v2    # "key":Ljava/lang/String;
    .restart local v3    # "val":Ljava/lang/String;
    :cond_14
    add-int/lit8 v1, v1, 0x1

    .line 1100
    if-eqz v2, :cond_6

    if-nez v3, :cond_1b

    .line 1101
    goto :goto_6

    .line 1103
    :cond_1b
    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 1104
    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_36

    .line 1106
    :cond_2b
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1107
    .local v4, "vals":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1108
    invoke-virtual {v0, v2, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1110
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "val":Ljava/lang/String;
    .end local v4    # "vals":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_36
    goto :goto_6
.end method

.method static execute(Lcom/streambundlehtml/helper/HttpConnection$Request;)Lcom/streambundlehtml/helper/HttpConnection$Response;
    .registers 2
    .param p0, "req"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 828
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->execute(Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;)Lcom/streambundlehtml/helper/HttpConnection$Response;

    move-result-object v0

    return-object v0
.end method

.method static execute(Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;)Lcom/streambundlehtml/helper/HttpConnection$Response;
    .registers 19
    .param p0, "req"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .param p1, "previousResponse"    # Lcom/streambundlehtml/helper/HttpConnection$Response;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 832
    move-object/from16 v1, p0

    monitor-enter p0

    .line 833
    :try_start_3
    # getter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z
    invoke-static {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$600(Lcom/streambundlehtml/helper/HttpConnection$Request;)Z

    move-result v0

    const-string v2, "Multiple threads were detected trying to execute the same request concurrently. Make sure to use Connection#newRequest() and do not share an executing request between threads."

    invoke-static {v0, v2}, Lcom/streambundlehtml/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 834
    const/4 v0, 0x1

    # setter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z
    invoke-static {v1, v0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$602(Lcom/streambundlehtml/helper/HttpConnection$Request;Z)Z

    .line 835
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_264

    .line 836
    const-string v2, "req"

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 837
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url()Ljava/net/URL;

    move-result-object v2

    .line 838
    .local v2, "url":Ljava/net/URL;
    const-string v3, "URL must be specified to connect"

    invoke-static {v2, v3}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 839
    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    .line 840
    .local v3, "protocol":Ljava/lang/String;
    const-string v4, "http"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3b

    const-string v4, "https"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3b

    .line 841
    new-instance v0, Ljava/net/MalformedURLException;

    const-string v4, "Only http & https protocols supported"

    invoke-direct {v0, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 842
    :cond_3b
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method()Lcom/streambundlehtml/Connection$Method;

    move-result-object v4

    invoke-virtual {v4}, Lcom/streambundlehtml/Connection$Method;->hasBody()Z

    move-result v4

    .line 843
    .local v4, "methodHasBody":Z
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->requestBody()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4b

    const/4 v5, 0x1

    goto :goto_4c

    :cond_4b
    const/4 v5, 0x0

    .line 844
    .local v5, "hasRequestBody":Z
    :goto_4c
    if-nez v4, :cond_68

    .line 845
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cannot set a request body for HTTP method "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method()Lcom/streambundlehtml/Connection$Method;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/streambundlehtml/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 848
    :cond_68
    const/4 v7, 0x0

    .line 849
    .local v7, "mimeBoundary":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    if-lez v8, :cond_7b

    if-eqz v4, :cond_77

    if-eqz v5, :cond_7b

    .line 850
    :cond_77
    invoke-static {v1}, Lcom/streambundlehtml/helper/HttpConnection$Response;->serialiseRequestUrl(Lcom/streambundlehtml/Connection$Request;)V

    goto :goto_81

    .line 851
    :cond_7b
    if-eqz v4, :cond_81

    .line 852
    invoke-static {v1}, Lcom/streambundlehtml/helper/HttpConnection$Response;->setOutputContentType(Lcom/streambundlehtml/Connection$Request;)Ljava/lang/String;

    move-result-object v7

    .line 854
    :cond_81
    :goto_81
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 855
    .local v8, "startTime":J
    invoke-static {v1}, Lcom/streambundlehtml/helper/HttpConnection$Response;->createConnection(Lcom/streambundlehtml/helper/HttpConnection$Request;)Ljava/net/HttpURLConnection;

    move-result-object v10

    .line 856
    .local v10, "conn":Ljava/net/HttpURLConnection;
    const/4 v11, 0x0

    .line 858
    .local v11, "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    :try_start_8a
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->connect()V

    .line 859
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getDoOutput()Z

    move-result v12
    :try_end_91
    .catch Ljava/io/IOException; {:try_start_8a .. :try_end_91} :catch_251
    .catchall {:try_start_8a .. :try_end_91} :catchall_24a

    if-eqz v12, :cond_b8

    .line 860
    :try_start_93
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12
    :try_end_97
    .catch Ljava/io/IOException; {:try_start_93 .. :try_end_97} :catch_b0
    .catchall {:try_start_93 .. :try_end_97} :catchall_a8

    .line 861
    .local v12, "out":Ljava/io/OutputStream;
    :try_start_97
    invoke-static {v1, v12, v7}, Lcom/streambundlehtml/helper/HttpConnection$Response;->writePost(Lcom/streambundlehtml/Connection$Request;Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_9a
    .catch Ljava/io/IOException; {:try_start_97 .. :try_end_9a} :catch_9e
    .catchall {:try_start_97 .. :try_end_9a} :catchall_a3

    .line 863
    :try_start_9a
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_9a .. :try_end_9d} :catch_b0
    .catchall {:try_start_9a .. :try_end_9d} :catchall_a8

    goto :goto_b8

    .line 862
    :catch_9e
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    :try_start_9f
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "protocol":Ljava/lang/String;
    .end local v4    # "methodHasBody":Z
    .end local v5    # "hasRequestBody":Z
    .end local v7    # "mimeBoundary":Ljava/lang/String;
    .end local v8    # "startTime":J
    .end local v10    # "conn":Ljava/net/HttpURLConnection;
    .end local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .end local v12    # "out":Ljava/io/OutputStream;
    .end local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .end local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    throw v0
    :try_end_a3
    .catchall {:try_start_9f .. :try_end_a3} :catchall_a3

    .line 863
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v3    # "protocol":Ljava/lang/String;
    .restart local v4    # "methodHasBody":Z
    .restart local v5    # "hasRequestBody":Z
    .restart local v7    # "mimeBoundary":Ljava/lang/String;
    .restart local v8    # "startTime":J
    .restart local v10    # "conn":Ljava/net/HttpURLConnection;
    .restart local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .restart local v12    # "out":Ljava/io/OutputStream;
    .restart local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .restart local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    :catchall_a3
    move-exception v0

    :try_start_a4
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V

    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "protocol":Ljava/lang/String;
    .end local v4    # "methodHasBody":Z
    .end local v5    # "hasRequestBody":Z
    .end local v7    # "mimeBoundary":Ljava/lang/String;
    .end local v8    # "startTime":J
    .end local v10    # "conn":Ljava/net/HttpURLConnection;
    .end local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .end local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .end local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    throw v0
    :try_end_a8
    .catch Ljava/io/IOException; {:try_start_a4 .. :try_end_a8} :catch_b0
    .catchall {:try_start_a4 .. :try_end_a8} :catchall_a8

    .line 926
    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v3    # "protocol":Ljava/lang/String;
    .restart local v4    # "methodHasBody":Z
    .restart local v5    # "hasRequestBody":Z
    .restart local v7    # "mimeBoundary":Ljava/lang/String;
    .restart local v8    # "startTime":J
    .restart local v10    # "conn":Ljava/net/HttpURLConnection;
    .restart local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .restart local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .restart local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    :catchall_a8
    move-exception v0

    move-object/from16 v14, p1

    move-object/from16 v16, v2

    move-object v13, v3

    goto/16 :goto_25f

    .line 922
    :catch_b0
    move-exception v0

    move-object/from16 v14, p1

    move-object/from16 v16, v2

    move-object v13, v3

    goto/16 :goto_257

    .line 866
    :cond_b8
    :goto_b8
    :try_start_b8
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    .line 867
    .local v12, "status":I
    new-instance v13, Lcom/streambundlehtml/helper/HttpConnection$Response;
    :try_end_be
    .catch Ljava/io/IOException; {:try_start_b8 .. :try_end_be} :catch_251
    .catchall {:try_start_b8 .. :try_end_be} :catchall_24a

    move-object/from16 v14, p1

    :try_start_c0
    invoke-direct {v13, v10, v1, v14}, Lcom/streambundlehtml/helper/HttpConnection$Response;-><init>(Ljava/net/HttpURLConnection;Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;)V

    move-object v11, v13

    .line 870
    const-string v13, "Location"

    invoke-virtual {v11, v13}, Lcom/streambundlehtml/helper/HttpConnection$Response;->hasHeader(Ljava/lang/String;)Z

    move-result v13
    :try_end_ca
    .catch Ljava/io/IOException; {:try_start_c0 .. :try_end_ca} :catch_248
    .catchall {:try_start_c0 .. :try_end_ca} :catchall_246

    if-eqz v13, :cond_125

    :try_start_cc
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->followRedirects()Z

    move-result v13

    if-eqz v13, :cond_125

    .line 871
    const/16 v0, 0x133

    if-eq v12, v0, :cond_eb

    .line 872
    sget-object v0, Lcom/streambundlehtml/Connection$Method;->GET:Lcom/streambundlehtml/Connection$Method;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;

    .line 873
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 874
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->requestBody(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Request;

    .line 875
    const-string v0, "Content-Type"

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->removeHeader(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 878
    :cond_eb
    const-string v0, "Location"

    invoke-virtual {v11, v0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 879
    .local v0, "location":Ljava/lang/String;
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 880
    const-string v13, "http:/"

    invoke-virtual {v0, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_10a

    const/4 v13, 0x6

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v6, 0x2f

    if-eq v15, v6, :cond_10a

    .line 881
    invoke-virtual {v0, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    move-object v0, v6

    .line 882
    :cond_10a
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url()Ljava/net/URL;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/streambundlehtml/internal/StringUtil;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v6

    .line 883
    .local v6, "redir":Ljava/net/URL;
    invoke-static {v6}, Lcom/streambundlehtml/helper/HttpConnection;->encodeUrl(Ljava/net/URL;)Ljava/net/URL;

    move-result-object v13

    invoke-virtual {v1, v13}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;

    .line 885
    const/4 v13, 0x0

    # setter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z
    invoke-static {v1, v13}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$602(Lcom/streambundlehtml/helper/HttpConnection$Request;Z)Z

    .line 886
    invoke-static {v1, v11}, Lcom/streambundlehtml/helper/HttpConnection$Response;->execute(Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;)Lcom/streambundlehtml/helper/HttpConnection$Response;

    move-result-object v15
    :try_end_121
    .catch Ljava/io/IOException; {:try_start_cc .. :try_end_121} :catch_1c7
    .catchall {:try_start_cc .. :try_end_121} :catchall_1c1

    .line 926
    # setter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z
    invoke-static {v1, v13}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$602(Lcom/streambundlehtml/helper/HttpConnection$Request;Z)Z

    .line 886
    return-object v15

    .line 888
    .end local v0    # "location":Ljava/lang/String;
    .end local v6    # "redir":Ljava/net/URL;
    :cond_125
    const/16 v6, 0xc8

    if-lt v12, v6, :cond_12d

    const/16 v6, 0x190

    if-lt v12, v6, :cond_133

    :cond_12d
    :try_start_12d
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreHttpErrors()Z

    move-result v6

    if-eqz v6, :cond_231

    .line 892
    :cond_133
    invoke-virtual {v11}, Lcom/streambundlehtml/helper/HttpConnection$Response;->contentType()Ljava/lang/String;

    move-result-object v6
    :try_end_137
    .catch Ljava/io/IOException; {:try_start_12d .. :try_end_137} :catch_248
    .catchall {:try_start_12d .. :try_end_137} :catchall_246

    .line 893
    .local v6, "contentType":Ljava/lang/String;
    if-eqz v6, :cond_164

    .line 894
    :try_start_139
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreContentType()Z

    move-result v13

    if-nez v13, :cond_164

    const-string v13, "text/"

    .line 895
    invoke-virtual {v6, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_164

    sget-object v13, Lcom/streambundlehtml/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    .line 896
    invoke-virtual {v13, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    if-eqz v13, :cond_154

    goto :goto_164

    .line 898
    :cond_154
    new-instance v0, Lcom/streambundlehtml/UnsupportedMimeTypeException;

    const-string v13, "Unhandled content type. Must be text/*, application/xml, or application/*+xml"

    .line 899
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url()Ljava/net/URL;

    move-result-object v15

    invoke-virtual {v15}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v0, v13, v6, v15}, Lcom/streambundlehtml/UnsupportedMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "protocol":Ljava/lang/String;
    .end local v4    # "methodHasBody":Z
    .end local v5    # "hasRequestBody":Z
    .end local v7    # "mimeBoundary":Ljava/lang/String;
    .end local v8    # "startTime":J
    .end local v10    # "conn":Ljava/net/HttpURLConnection;
    .end local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .end local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .end local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    throw v0

    .line 902
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v3    # "protocol":Ljava/lang/String;
    .restart local v4    # "methodHasBody":Z
    .restart local v5    # "hasRequestBody":Z
    .restart local v7    # "mimeBoundary":Ljava/lang/String;
    .restart local v8    # "startTime":J
    .restart local v10    # "conn":Ljava/net/HttpURLConnection;
    .restart local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .restart local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .restart local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    :cond_164
    :goto_164
    if-eqz v6, :cond_17f

    sget-object v13, Lcom/streambundlehtml/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    invoke-virtual {v13, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    if-eqz v13, :cond_17f

    .line 903
    # getter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->parserDefined:Z
    invoke-static {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$700(Lcom/streambundlehtml/helper/HttpConnection$Request;)Z

    move-result v13

    if-nez v13, :cond_17f

    invoke-static {}, Lcom/streambundlehtml/parser/Parser;->xmlParser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v13

    invoke-virtual {v1, v13}, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/helper/HttpConnection$Request;
    :try_end_17f
    .catch Ljava/io/IOException; {:try_start_139 .. :try_end_17f} :catch_1c7
    .catchall {:try_start_139 .. :try_end_17f} :catchall_1c1

    .line 906
    :cond_17f
    :try_start_17f
    iget-object v13, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    invoke-static {v13}, Lcom/streambundlehtml/helper/DataUtil;->getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 907
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v13

    if-eqz v13, :cond_21f

    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method()Lcom/streambundlehtml/Connection$Method;

    move-result-object v13

    sget-object v15, Lcom/streambundlehtml/Connection$Method;->HEAD:Lcom/streambundlehtml/Connection$Method;

    if-eq v13, v15, :cond_21f

    .line 908
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v13
    :try_end_199
    .catch Ljava/io/IOException; {:try_start_17f .. :try_end_199} :catch_248
    .catchall {:try_start_17f .. :try_end_199} :catchall_246

    if-eqz v13, :cond_1a0

    :try_start_19b
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v13
    :try_end_19f
    .catch Ljava/io/IOException; {:try_start_19b .. :try_end_19f} :catch_1c7
    .catchall {:try_start_19b .. :try_end_19f} :catchall_1c1

    goto :goto_1a4

    :cond_1a0
    :try_start_1a0
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    :goto_1a4
    iput-object v13, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    .line 909
    iget-object v13, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    invoke-static {v13}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 910
    const-string v13, "Content-Encoding"

    const-string v15, "gzip"

    invoke-virtual {v11, v13, v15}, Lcom/streambundlehtml/helper/HttpConnection$Response;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13
    :try_end_1b3
    .catch Ljava/io/IOException; {:try_start_1a0 .. :try_end_1b3} :catch_248
    .catchall {:try_start_1a0 .. :try_end_1b3} :catchall_246

    if-eqz v13, :cond_1cd

    .line 911
    :try_start_1b5
    new-instance v13, Ljava/util/zip/GZIPInputStream;

    iget-object v15, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    invoke-direct {v13, v15}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v13, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;
    :try_end_1be
    .catch Ljava/io/IOException; {:try_start_1b5 .. :try_end_1be} :catch_1c7
    .catchall {:try_start_1b5 .. :try_end_1be} :catchall_1c1

    move-object/from16 v16, v2

    goto :goto_1ff

    .line 926
    .end local v6    # "contentType":Ljava/lang/String;
    .end local v12    # "status":I
    :catchall_1c1
    move-exception v0

    move-object/from16 v16, v2

    move-object v13, v3

    goto/16 :goto_25f

    .line 922
    :catch_1c7
    move-exception v0

    move-object/from16 v16, v2

    move-object v13, v3

    goto/16 :goto_257

    .line 912
    .restart local v6    # "contentType":Ljava/lang/String;
    .restart local v12    # "status":I
    :cond_1cd
    :try_start_1cd
    const-string v13, "Content-Encoding"

    const-string v15, "deflate"

    invoke-virtual {v11, v13, v15}, Lcom/streambundlehtml/helper/HttpConnection$Response;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13
    :try_end_1d5
    .catch Ljava/io/IOException; {:try_start_1cd .. :try_end_1d5} :catch_248
    .catchall {:try_start_1cd .. :try_end_1d5} :catchall_246

    if-eqz v13, :cond_1fd

    .line 913
    :try_start_1d7
    new-instance v13, Ljava/util/zip/InflaterInputStream;

    iget-object v15, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    new-instance v0, Ljava/util/zip/Inflater;
    :try_end_1dd
    .catch Ljava/io/IOException; {:try_start_1d7 .. :try_end_1dd} :catch_1f7
    .catchall {:try_start_1d7 .. :try_end_1dd} :catchall_1f1

    move-object/from16 v16, v2

    const/4 v2, 0x1

    .end local v2    # "url":Ljava/net/URL;
    .local v16, "url":Ljava/net/URL;
    :try_start_1e0
    invoke-direct {v0, v2}, Ljava/util/zip/Inflater;-><init>(Z)V

    invoke-direct {v13, v15, v0}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    iput-object v13, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;
    :try_end_1e8
    .catch Ljava/io/IOException; {:try_start_1e0 .. :try_end_1e8} :catch_1ed
    .catchall {:try_start_1e0 .. :try_end_1e8} :catchall_1e9

    goto :goto_1ff

    .line 926
    .end local v6    # "contentType":Ljava/lang/String;
    .end local v12    # "status":I
    :catchall_1e9
    move-exception v0

    move-object v13, v3

    goto/16 :goto_25f

    .line 922
    :catch_1ed
    move-exception v0

    move-object v13, v3

    goto/16 :goto_257

    .line 926
    .end local v16    # "url":Ljava/net/URL;
    .restart local v2    # "url":Ljava/net/URL;
    :catchall_1f1
    move-exception v0

    move-object/from16 v16, v2

    move-object v13, v3

    .end local v2    # "url":Ljava/net/URL;
    .restart local v16    # "url":Ljava/net/URL;
    goto/16 :goto_25f

    .line 922
    .end local v16    # "url":Ljava/net/URL;
    .restart local v2    # "url":Ljava/net/URL;
    :catch_1f7
    move-exception v0

    move-object/from16 v16, v2

    move-object v13, v3

    .end local v2    # "url":Ljava/net/URL;
    .restart local v16    # "url":Ljava/net/URL;
    goto/16 :goto_257

    .line 912
    .end local v16    # "url":Ljava/net/URL;
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v6    # "contentType":Ljava/lang/String;
    .restart local v12    # "status":I
    :cond_1fd
    move-object/from16 v16, v2

    .line 915
    .end local v2    # "url":Ljava/net/URL;
    .restart local v16    # "url":Ljava/net/URL;
    :goto_1ff
    :try_start_1ff
    iget-object v0, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    .line 916
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySize()I

    move-result v2

    const v13, 0x8000

    invoke-static {v0, v13, v2}, Lcom/streambundlehtml/internal/ConstrainableInputStream;->wrap(Ljava/io/InputStream;II)Lcom/streambundlehtml/internal/ConstrainableInputStream;

    move-result-object v0

    .line 917
    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeout()I

    move-result v2
    :try_end_210
    .catch Ljava/io/IOException; {:try_start_1ff .. :try_end_210} :catch_21c
    .catchall {:try_start_1ff .. :try_end_210} :catchall_219

    move-object v13, v3

    .end local v3    # "protocol":Ljava/lang/String;
    .local v13, "protocol":Ljava/lang/String;
    int-to-long v2, v2

    :try_start_212
    invoke-virtual {v0, v8, v9, v2, v3}, Lcom/streambundlehtml/internal/ConstrainableInputStream;->timeout(JJ)Lcom/streambundlehtml/internal/ConstrainableInputStream;

    move-result-object v0

    iput-object v0, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    goto :goto_228

    .line 926
    .end local v6    # "contentType":Ljava/lang/String;
    .end local v12    # "status":I
    .end local v13    # "protocol":Ljava/lang/String;
    .restart local v3    # "protocol":Ljava/lang/String;
    :catchall_219
    move-exception v0

    move-object v13, v3

    .end local v3    # "protocol":Ljava/lang/String;
    .restart local v13    # "protocol":Ljava/lang/String;
    goto :goto_25f

    .line 922
    .end local v13    # "protocol":Ljava/lang/String;
    .restart local v3    # "protocol":Ljava/lang/String;
    :catch_21c
    move-exception v0

    move-object v13, v3

    .end local v3    # "protocol":Ljava/lang/String;
    .restart local v13    # "protocol":Ljava/lang/String;
    goto :goto_257

    .line 907
    .end local v13    # "protocol":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v3    # "protocol":Ljava/lang/String;
    .restart local v6    # "contentType":Ljava/lang/String;
    .restart local v12    # "status":I
    :cond_21f
    move-object/from16 v16, v2

    move-object v13, v3

    .line 920
    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "protocol":Ljava/lang/String;
    .restart local v13    # "protocol":Ljava/lang/String;
    .restart local v16    # "url":Ljava/net/URL;
    invoke-static {}, Lcom/streambundlehtml/helper/DataUtil;->emptyByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;
    :try_end_228
    .catch Ljava/io/IOException; {:try_start_212 .. :try_end_228} :catch_244
    .catchall {:try_start_212 .. :try_end_228} :catchall_25e

    .line 926
    .end local v6    # "contentType":Ljava/lang/String;
    .end local v12    # "status":I
    :goto_228
    const/4 v2, 0x0

    # setter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z
    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$602(Lcom/streambundlehtml/helper/HttpConnection$Request;Z)Z

    .line 927
    nop

    .line 929
    const/4 v2, 0x1

    iput-boolean v2, v11, Lcom/streambundlehtml/helper/HttpConnection$Response;->executed:Z

    .line 930
    return-object v11

    .line 889
    .end local v13    # "protocol":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v3    # "protocol":Ljava/lang/String;
    .restart local v12    # "status":I
    :cond_231
    move-object/from16 v16, v2

    move-object v13, v3

    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "protocol":Ljava/lang/String;
    .restart local v13    # "protocol":Ljava/lang/String;
    .restart local v16    # "url":Ljava/net/URL;
    :try_start_234
    new-instance v0, Lcom/streambundlehtml/HttpStatusException;

    const-string v2, "HTTP error fetching URL"

    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v12, v3}, Lcom/streambundlehtml/HttpStatusException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v4    # "methodHasBody":Z
    .end local v5    # "hasRequestBody":Z
    .end local v7    # "mimeBoundary":Ljava/lang/String;
    .end local v8    # "startTime":J
    .end local v10    # "conn":Ljava/net/HttpURLConnection;
    .end local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .end local v13    # "protocol":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    .end local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .end local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    throw v0
    :try_end_244
    .catch Ljava/io/IOException; {:try_start_234 .. :try_end_244} :catch_244
    .catchall {:try_start_234 .. :try_end_244} :catchall_25e

    .line 922
    .end local v12    # "status":I
    .restart local v4    # "methodHasBody":Z
    .restart local v5    # "hasRequestBody":Z
    .restart local v7    # "mimeBoundary":Ljava/lang/String;
    .restart local v8    # "startTime":J
    .restart local v10    # "conn":Ljava/net/HttpURLConnection;
    .restart local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .restart local v13    # "protocol":Ljava/lang/String;
    .restart local v16    # "url":Ljava/net/URL;
    .restart local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .restart local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    :catch_244
    move-exception v0

    goto :goto_257

    .line 926
    .end local v13    # "protocol":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v3    # "protocol":Ljava/lang/String;
    :catchall_246
    move-exception v0

    goto :goto_24d

    .line 922
    :catch_248
    move-exception v0

    goto :goto_254

    .line 926
    :catchall_24a
    move-exception v0

    move-object/from16 v14, p1

    :goto_24d
    move-object/from16 v16, v2

    move-object v13, v3

    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "protocol":Ljava/lang/String;
    .restart local v13    # "protocol":Ljava/lang/String;
    .restart local v16    # "url":Ljava/net/URL;
    goto :goto_25f

    .line 922
    .end local v13    # "protocol":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v3    # "protocol":Ljava/lang/String;
    :catch_251
    move-exception v0

    move-object/from16 v14, p1

    :goto_254
    move-object/from16 v16, v2

    move-object v13, v3

    .line 923
    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "protocol":Ljava/lang/String;
    .local v0, "e":Ljava/io/IOException;
    .restart local v13    # "protocol":Ljava/lang/String;
    .restart local v16    # "url":Ljava/net/URL;
    :goto_257
    if-eqz v11, :cond_25c

    :try_start_259
    invoke-direct {v11}, Lcom/streambundlehtml/helper/HttpConnection$Response;->safeClose()V

    .line 924
    :cond_25c
    nop

    .end local v4    # "methodHasBody":Z
    .end local v5    # "hasRequestBody":Z
    .end local v7    # "mimeBoundary":Ljava/lang/String;
    .end local v8    # "startTime":J
    .end local v10    # "conn":Ljava/net/HttpURLConnection;
    .end local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .end local v13    # "protocol":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    .end local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .end local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    throw v0
    :try_end_25e
    .catchall {:try_start_259 .. :try_end_25e} :catchall_25e

    .line 926
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v4    # "methodHasBody":Z
    .restart local v5    # "hasRequestBody":Z
    .restart local v7    # "mimeBoundary":Ljava/lang/String;
    .restart local v8    # "startTime":J
    .restart local v10    # "conn":Ljava/net/HttpURLConnection;
    .restart local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .restart local v13    # "protocol":Ljava/lang/String;
    .restart local v16    # "url":Ljava/net/URL;
    .restart local p0    # "req":Lcom/streambundlehtml/helper/HttpConnection$Request;
    .restart local p1    # "previousResponse":Lcom/streambundlehtml/helper/HttpConnection$Response;
    :catchall_25e
    move-exception v0

    :goto_25f
    const/4 v2, 0x0

    # setter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->executing:Z
    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$602(Lcom/streambundlehtml/helper/HttpConnection$Request;Z)Z

    .line 927
    throw v0

    .line 835
    .end local v4    # "methodHasBody":Z
    .end local v5    # "hasRequestBody":Z
    .end local v7    # "mimeBoundary":Ljava/lang/String;
    .end local v8    # "startTime":J
    .end local v10    # "conn":Ljava/net/HttpURLConnection;
    .end local v11    # "res":Lcom/streambundlehtml/helper/HttpConnection$Response;
    .end local v13    # "protocol":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    :catchall_264
    move-exception v0

    move-object/from16 v14, p1

    :goto_267
    :try_start_267
    monitor-exit p0
    :try_end_268
    .catchall {:try_start_267 .. :try_end_268} :catchall_269

    throw v0

    :catchall_269
    move-exception v0

    goto :goto_267
.end method

.method private prepareByteData()V
    .registers 4

    .line 970
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->executed:Z

    const-string v1, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 971
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    if-eqz v0, :cond_39

    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_39

    .line 972
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    const-string v1, "Request has already been read (with .parse())"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 974
    const/4 v0, 0x1

    :try_start_17
    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v2}, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySize()I

    move-result v2

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_25} :catch_2b
    .catchall {:try_start_17 .. :try_end_25} :catchall_32

    .line 978
    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    .line 979
    invoke-direct {p0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->safeClose()V

    .line 980
    goto :goto_39

    .line 975
    :catch_2b
    move-exception v1

    .line 976
    .local v1, "e":Ljava/io/IOException;
    :try_start_2c
    new-instance v2, Lcom/streambundlehtml/UncheckedIOException;

    invoke-direct {v2, v1}, Lcom/streambundlehtml/UncheckedIOException;-><init>(Ljava/io/IOException;)V

    throw v2
    :try_end_32
    .catchall {:try_start_2c .. :try_end_32} :catchall_32

    .line 978
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_32
    move-exception v1

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    .line 979
    invoke-direct {p0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->safeClose()V

    .line 980
    throw v1

    .line 982
    :cond_39
    :goto_39
    return-void
.end method

.method private safeClose()V
    .registers 3

    .line 1046
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    const/4 v1, 0x0

    if-eqz v0, :cond_13

    .line 1048
    :try_start_5
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_a} :catch_f
    .catchall {:try_start_5 .. :try_end_a} :catchall_b

    goto :goto_10

    .line 1052
    :catchall_b
    move-exception v0

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    .line 1053
    throw v0

    .line 1049
    :catch_f
    move-exception v0

    .line 1052
    :goto_10
    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    .line 1053
    nop

    .line 1055
    :cond_13
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->conn:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_1e

    .line 1056
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->conn:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1057
    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->conn:Ljava/net/HttpURLConnection;

    .line 1059
    :cond_1e
    return-void
.end method

.method private static serialiseRequestUrl(Lcom/streambundlehtml/Connection$Request;)V
    .registers 9
    .param p0, "req"    # Lcom/streambundlehtml/Connection$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1222
    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->url()Ljava/net/URL;

    move-result-object v0

    .line 1223
    .local v0, "in":Ljava/net/URL;
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1224
    .local v1, "url":Ljava/lang/StringBuilder;
    const/4 v2, 0x1

    .line 1226
    .local v2, "first":Z
    nop

    .line 1227
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1228
    const-string v4, "://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1229
    invoke-virtual {v0}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1230
    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1231
    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1232
    invoke-virtual {v0}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3b

    .line 1233
    invoke-virtual {v0}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1234
    const/4 v2, 0x0

    .line 1236
    :cond_3b
    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_43
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_84

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/Connection$KeyVal;

    .line 1237
    .local v4, "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    invoke-interface {v4}, Lcom/streambundlehtml/Connection$KeyVal;->hasInputStream()Z

    move-result v5

    const-string v6, "InputStream data not supported in URL query string."

    invoke-static {v5, v6}, Lcom/streambundlehtml/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 1238
    if-nez v2, :cond_60

    .line 1239
    const/16 v5, 0x26

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_61

    .line 1241
    :cond_60
    const/4 v2, 0x0

    .line 1242
    :goto_61
    nop

    .line 1243
    invoke-interface {v4}, Lcom/streambundlehtml/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/streambundlehtml/helper/DataUtil;->defaultCharsetName:Ljava/lang/String;

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1244
    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1245
    invoke-interface {v4}, Lcom/streambundlehtml/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/streambundlehtml/helper/DataUtil;->defaultCharsetName:Ljava/lang/String;

    invoke-static {v6, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1246
    .end local v4    # "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    goto :goto_43

    .line 1247
    :cond_84
    new-instance v3, Ljava/net/URL;

    invoke-static {v1}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v3}, Lcom/streambundlehtml/Connection$Request;->url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;

    .line 1248
    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->clear()V

    .line 1249
    return-void
.end method

.method private static setOutputContentType(Lcom/streambundlehtml/Connection$Request;)Ljava/lang/String;
    .registers 6
    .param p0, "req"    # Lcom/streambundlehtml/Connection$Request;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1141
    const-string v0, "Content-Type"

    invoke-interface {p0, v0}, Lcom/streambundlehtml/Connection$Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1142
    .local v1, "contentType":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1143
    .local v2, "bound":Ljava/lang/String;
    const-string v3, "multipart/form-data; boundary="

    if-eqz v1, :cond_34

    .line 1148
    const-string v4, "multipart/form-data"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_6d

    const-string v4, "boundary"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6d

    .line 1149
    invoke-static {}, Lcom/streambundlehtml/helper/DataUtil;->mimeBoundary()Ljava/lang/String;

    move-result-object v2

    .line 1150
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v0, v3}, Lcom/streambundlehtml/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    goto :goto_6d

    .line 1154
    :cond_34
    # invokes: Lcom/streambundlehtml/helper/HttpConnection;->needsMultipart(Lcom/streambundlehtml/Connection$Request;)Z
    invoke-static {p0}, Lcom/streambundlehtml/helper/HttpConnection;->access$900(Lcom/streambundlehtml/Connection$Request;)Z

    move-result v4

    if-eqz v4, :cond_53

    .line 1155
    invoke-static {}, Lcom/streambundlehtml/helper/DataUtil;->mimeBoundary()Ljava/lang/String;

    move-result-object v2

    .line 1156
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v0, v3}, Lcom/streambundlehtml/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    goto :goto_6d

    .line 1158
    :cond_53
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "application/x-www-form-urlencoded; charset="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v0, v3}, Lcom/streambundlehtml/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 1160
    :cond_6d
    :goto_6d
    return-object v2
.end method

.method private static writePost(Lcom/streambundlehtml/Connection$Request;Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 12
    .param p0, "req"    # Lcom/streambundlehtml/Connection$Request;
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "boundary"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1164
    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v0

    .line 1165
    .local v0, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/streambundlehtml/Connection$KeyVal;>;"
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/OutputStreamWriter;

    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 1167
    .local v1, "w":Ljava/io/BufferedWriter;
    if-eqz p2, :cond_99

    .line 1169
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v4, "--"

    if-eqz v3, :cond_8f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/Connection$KeyVal;

    .line 1170
    .local v3, "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    invoke-virtual {v1, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1171
    invoke-virtual {v1, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1172
    const-string v4, "\r\n"

    invoke-virtual {v1, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1173
    const-string v5, "Content-Disposition: form-data; name=\""

    invoke-virtual {v1, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1174
    invoke-interface {v3}, Lcom/streambundlehtml/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/streambundlehtml/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5}, Lcom/streambundlehtml/helper/HttpConnection;->access$1000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1175
    const-string v5, "\""

    invoke-virtual {v1, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1176
    invoke-interface {v3}, Lcom/streambundlehtml/Connection$KeyVal;->inputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 1177
    .local v5, "input":Ljava/io/InputStream;
    const-string v6, "\r\n\r\n"

    if-eqz v5, :cond_81

    .line 1178
    const-string v7, "; filename=\""

    invoke-virtual {v1, v7}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1179
    invoke-interface {v3}, Lcom/streambundlehtml/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v7

    # invokes: Lcom/streambundlehtml/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v7}, Lcom/streambundlehtml/helper/HttpConnection;->access$1000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1180
    const-string v7, "\"\r\nContent-Type: "

    invoke-virtual {v1, v7}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1181
    invoke-interface {v3}, Lcom/streambundlehtml/Connection$KeyVal;->contentType()Ljava/lang/String;

    move-result-object v7

    .line 1182
    .local v7, "contentType":Ljava/lang/String;
    if-eqz v7, :cond_6f

    move-object v8, v7

    goto :goto_71

    :cond_6f
    const-string v8, "application/octet-stream"

    :goto_71
    invoke-virtual {v1, v8}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1183
    invoke-virtual {v1, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1184
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->flush()V

    .line 1185
    invoke-static {v5, p1}, Lcom/streambundlehtml/helper/DataUtil;->crossStreams(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 1186
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 1187
    .end local v7    # "contentType":Ljava/lang/String;
    goto :goto_8b

    .line 1188
    :cond_81
    invoke-virtual {v1, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1189
    invoke-interface {v3}, Lcom/streambundlehtml/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1191
    :goto_8b
    invoke-virtual {v1, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1192
    .end local v3    # "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    .end local v5    # "input":Ljava/io/InputStream;
    goto :goto_1c

    .line 1193
    :cond_8f
    invoke-virtual {v1, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1194
    invoke-virtual {v1, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1195
    invoke-virtual {v1, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_e1

    .line 1197
    :cond_99
    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->requestBody()Ljava/lang/String;

    move-result-object v2

    .line 1198
    .local v2, "body":Ljava/lang/String;
    if-eqz v2, :cond_a3

    .line 1200
    invoke-virtual {v1, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_e1

    .line 1204
    :cond_a3
    const/4 v3, 0x1

    .line 1205
    .local v3, "first":Z
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_a8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_e1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/Connection$KeyVal;

    .line 1206
    .local v5, "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    if-nez v3, :cond_bc

    .line 1207
    const/16 v6, 0x26

    invoke-virtual {v1, v6}, Ljava/io/BufferedWriter;->append(C)Ljava/io/Writer;

    goto :goto_bd

    .line 1209
    :cond_bc
    const/4 v3, 0x0

    .line 1211
    :goto_bd
    invoke-interface {v5}, Lcom/streambundlehtml/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1212
    const/16 v6, 0x3d

    invoke-virtual {v1, v6}, Ljava/io/BufferedWriter;->write(I)V

    .line 1213
    invoke-interface {v5}, Lcom/streambundlehtml/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1214
    .end local v5    # "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    goto :goto_a8

    .line 1217
    .end local v2    # "body":Ljava/lang/String;
    .end local v3    # "first":Z
    :cond_e1
    :goto_e1
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V

    .line 1218
    return-void
.end method


# virtual methods
.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 3

    .line 795
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public body()Ljava/lang/String;
    .registers 3

    .line 985
    invoke-direct {p0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->prepareByteData()V

    .line 986
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 988
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    if-nez v0, :cond_f

    sget-object v0, Lcom/streambundlehtml/helper/DataUtil;->UTF_8:Ljava/nio/charset/Charset;

    goto :goto_15

    :cond_f
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_15
    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    .line 989
    invoke-virtual {v0, v1}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 990
    .local v0, "body":Ljava/lang/String;
    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/Buffer;->rewind()Ljava/nio/Buffer;

    .line 991
    return-object v0
.end method

.method public bodyAsBytes()[B
    .registers 2

    .line 995
    invoke-direct {p0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->prepareByteData()V

    .line 996
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 997
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public bodyStream()Ljava/io/BufferedInputStream;
    .registers 4

    .line 1008
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->executed:Z

    const-string v1, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 1009
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    const-string v1, "Request has already been read"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 1010
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    .line 1011
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySize()I

    move-result v1

    const v2, 0x8000

    invoke-static {v0, v2, v1}, Lcom/streambundlehtml/internal/ConstrainableInputStream;->wrap(Ljava/io/InputStream;II)Lcom/streambundlehtml/internal/ConstrainableInputStream;

    move-result-object v0

    return-object v0
.end method

.method public bufferUp()Lcom/streambundlehtml/Connection$Response;
    .registers 1

    .line 1002
    invoke-direct {p0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->prepareByteData()V

    .line 1003
    return-object p0
.end method

.method public bridge synthetic charset(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Response;
    .registers 2

    .line 795
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Response;->charset(Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$Response;

    move-result-object p1

    return-object p1
.end method

.method public charset(Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$Response;
    .registers 2
    .param p1, "charset"    # Ljava/lang/String;

    .line 946
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 947
    return-object p0
.end method

.method public charset()Ljava/lang/String;
    .registers 2

    .line 942
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public contentType()Ljava/lang/String;
    .registers 2

    .line 951
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 3

    .line 795
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .line 795
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    .line 795
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 3

    .line 795
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic headers(Ljava/lang/String;)Ljava/util/List;
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .line 795
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic method()Lcom/streambundlehtml/Connection$Method;
    .registers 2

    .line 795
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->method()Lcom/streambundlehtml/Connection$Method;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic multiHeaders()Ljava/util/Map;
    .registers 2

    .line 795
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->multiHeaders()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public parse()Lcom/streambundlehtml/nodes/Document;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 955
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->executed:Z

    const-string v1, "Request must be executed (with .execute(), .get(), or .post() before parsing response"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 956
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_1b

    .line 957
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    .line 958
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    .line 960
    :cond_1b
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    const-string v1, "Input stream already read and parsed, cannot re-read."

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 961
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->bodyStream:Ljava/io/InputStream;

    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v3}, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/streambundlehtml/helper/DataUtil;->parseInputStream(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 962
    .local v0, "doc":Lcom/streambundlehtml/nodes/Document;
    new-instance v1, Lcom/streambundlehtml/helper/HttpConnection;

    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, v3}, Lcom/streambundlehtml/helper/HttpConnection;-><init>(Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;Lcom/streambundlehtml/helper/HttpConnection$1;)V

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Document;->connection(Lcom/streambundlehtml/Connection;)Lcom/streambundlehtml/nodes/Document;

    .line 963
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 964
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->inputStreamRead:Z

    .line 965
    invoke-direct {p0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->safeClose()V

    .line 966
    return-object v0
.end method

.method processResponseHeaders(Ljava/util/Map;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1115
    .local p1, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1116
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1117
    .local v2, "name":Ljava/lang/String;
    if-nez v2, :cond_1d

    .line 1118
    goto :goto_8

    .line 1120
    :cond_1d
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 1121
    .local v3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v4, "Set-Cookie"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_69

    .line 1122
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_69

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1123
    .local v5, "value":Ljava/lang/String;
    if-nez v5, :cond_3e

    .line 1124
    goto :goto_2f

    .line 1125
    :cond_3e
    new-instance v6, Lcom/streambundlehtml/parser/TokenQueue;

    invoke-direct {v6, v5}, Lcom/streambundlehtml/parser/TokenQueue;-><init>(Ljava/lang/String;)V

    .line 1126
    .local v6, "cd":Lcom/streambundlehtml/parser/TokenQueue;
    const-string v7, "="

    invoke-virtual {v6, v7}, Lcom/streambundlehtml/parser/TokenQueue;->chompTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 1127
    .local v7, "cookieName":Ljava/lang/String;
    const-string v8, ";"

    invoke-virtual {v6, v8}, Lcom/streambundlehtml/parser/TokenQueue;->consumeTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 1130
    .local v8, "cookieVal":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_68

    iget-object v9, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->cookies:Ljava/util/Map;

    invoke-interface {v9, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_68

    .line 1131
    invoke-virtual {p0, v7, v8}, Lcom/streambundlehtml/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 1132
    .end local v5    # "value":Ljava/lang/String;
    .end local v6    # "cd":Lcom/streambundlehtml/parser/TokenQueue;
    .end local v7    # "cookieName":Ljava/lang/String;
    .end local v8    # "cookieVal":Ljava/lang/String;
    :cond_68
    goto :goto_2f

    .line 1134
    :cond_69
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_6d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1135
    .restart local v5    # "value":Ljava/lang/String;
    invoke-virtual {p0, v2, v5}, Lcom/streambundlehtml/helper/HttpConnection$Response;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 1136
    .end local v5    # "value":Ljava/lang/String;
    goto :goto_6d

    .line 1137
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_7d
    goto :goto_8

    .line 1138
    :cond_7e
    return-void
.end method

.method public bridge synthetic removeCookie(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->removeCookie(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic removeHeader(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->removeHeader(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public statusCode()I
    .registers 2

    .line 934
    iget v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->statusCode:I

    return v0
.end method

.method public statusMessage()Ljava/lang/String;
    .registers 2

    .line 938
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;
    .registers 2

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .line 795
    invoke-super {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
