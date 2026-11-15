.class public Lcom/streambundlehtml/helper/HttpConnection;
.super Ljava/lang/Object;
.source "HttpConnection.java"

# interfaces
.implements Lcom/streambundlehtml/Connection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/helper/HttpConnection$Request;,
        Lcom/streambundlehtml/helper/HttpConnection$Response;,
        Lcom/streambundlehtml/helper/HttpConnection$KeyVal;,
        Lcom/streambundlehtml/helper/HttpConnection$Base;
    }
.end annotation


# static fields
.field public static final CONTENT_ENCODING:Ljava/lang/String; = "Content-Encoding"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "Content-Type"

.field public static final DEFAULT_UA:Ljava/lang/String; = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36"

.field private static final DefaultUploadType:Ljava/lang/String; = "application/octet-stream"

.field public static final FORM_URL_ENCODED:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field private static final HTTP_TEMP_REDIR:I = 0x133

.field private static final ISO_8859_1:Ljava/nio/charset/Charset;

.field public static final MULTIPART_FORM_DATA:Ljava/lang/String; = "multipart/form-data"

.field private static final USER_AGENT:Ljava/lang/String; = "User-Agent"

.field private static final UTF_8:Ljava/nio/charset/Charset;


# instance fields
.field private req:Lcom/streambundlehtml/helper/HttpConnection$Request;

.field private res:Lcom/streambundlehtml/Connection$Response;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 71
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/helper/HttpConnection;->UTF_8:Ljava/nio/charset/Charset;

    .line 72
    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/helper/HttpConnection;->ISO_8859_1:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-direct {v0}, Lcom/streambundlehtml/helper/HttpConnection$Request;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 101
    return-void
.end method

.method constructor <init>(Lcom/streambundlehtml/helper/HttpConnection$Request;)V
    .registers 3
    .param p1, "copy"    # Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    new-instance v0, Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;-><init>(Lcom/streambundlehtml/helper/HttpConnection$Request;)V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 110
    return-void
.end method

.method private constructor <init>(Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;)V
    .registers 3
    .param p1, "req"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .param p2, "res"    # Lcom/streambundlehtml/helper/HttpConnection$Response;

    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 172
    iput-object p2, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    .line 173
    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;Lcom/streambundlehtml/helper/HttpConnection$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .param p2, "x1"    # Lcom/streambundlehtml/helper/HttpConnection$Response;
    .param p3, "x2"    # Lcom/streambundlehtml/helper/HttpConnection$1;

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection;-><init>(Lcom/streambundlehtml/helper/HttpConnection$Request;Lcom/streambundlehtml/helper/HttpConnection$Response;)V

    return-void
.end method

.method static synthetic access$100(Ljava/net/URL;)Ljava/net/URL;
    .registers 2
    .param p0, "x0"    # Ljava/net/URL;

    .line 57
    invoke-static {p0}, Lcom/streambundlehtml/helper/HttpConnection;->punyUrl(Ljava/net/URL;)Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .line 57
    invoke-static {p0}, Lcom/streambundlehtml/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200()Ljava/nio/charset/Charset;
    .registers 1

    .line 57
    sget-object v0, Lcom/streambundlehtml/helper/HttpConnection;->ISO_8859_1:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method static synthetic access$300()Ljava/nio/charset/Charset;
    .registers 1

    .line 57
    sget-object v0, Lcom/streambundlehtml/helper/HttpConnection;->UTF_8:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method static synthetic access$900(Lcom/streambundlehtml/Connection$Request;)Z
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/Connection$Request;

    .line 57
    invoke-static {p0}, Lcom/streambundlehtml/helper/HttpConnection;->needsMultipart(Lcom/streambundlehtml/Connection$Request;)Z

    move-result v0

    return v0
.end method

.method public static connect(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 2
    .param p0, "url"    # Ljava/lang/String;

    .line 80
    new-instance v0, Lcom/streambundlehtml/helper/HttpConnection;

    invoke-direct {v0}, Lcom/streambundlehtml/helper/HttpConnection;-><init>()V

    .line 81
    .local v0, "con":Lcom/streambundlehtml/Connection;
    invoke-interface {v0, p0}, Lcom/streambundlehtml/Connection;->url(Ljava/lang/String;)Lcom/streambundlehtml/Connection;

    .line 82
    return-object v0
.end method

.method public static connect(Ljava/net/URL;)Lcom/streambundlehtml/Connection;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;

    .line 91
    new-instance v0, Lcom/streambundlehtml/helper/HttpConnection;

    invoke-direct {v0}, Lcom/streambundlehtml/helper/HttpConnection;-><init>()V

    .line 92
    .local v0, "con":Lcom/streambundlehtml/Connection;
    invoke-interface {v0, p0}, Lcom/streambundlehtml/Connection;->url(Ljava/net/URL;)Lcom/streambundlehtml/Connection;

    .line 93
    return-object v0
.end method

.method private static encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "val"    # Ljava/lang/String;

    .line 157
    const-string v0, "\""

    const-string v1, "%22"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "url"    # Ljava/lang/String;

    .line 119
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 120
    .local v0, "u":Ljava/net/URL;
    invoke-static {v0}, Lcom/streambundlehtml/helper/HttpConnection;->encodeUrl(Ljava/net/URL;)Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v1
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    return-object v1

    .line 121
    .end local v0    # "u":Ljava/net/URL;
    :catch_e
    move-exception v0

    .line 122
    .local v0, "e":Ljava/lang/Exception;
    return-object p0
.end method

.method static encodeUrl(Ljava/net/URL;)Ljava/net/URL;
    .registers 9
    .param p0, "u"    # Ljava/net/URL;

    .line 127
    invoke-static {p0}, Lcom/streambundlehtml/helper/HttpConnection;->punyUrl(Ljava/net/URL;)Ljava/net/URL;

    move-result-object p0

    .line 130
    :try_start_4
    new-instance v0, Ljava/net/URI;

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v4

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Ljava/net/URL;->getRef()Ljava/lang/String;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .local v0, "uri":Ljava/net/URI;
    invoke-virtual {v0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v1
    :try_end_29
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_29} :catch_2c
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_29} :catch_2a

    return-object v1

    .line 132
    .end local v0    # "uri":Ljava/net/URI;
    :catch_2a
    move-exception v0

    goto :goto_2d

    :catch_2c
    move-exception v0

    .line 134
    .local v0, "e":Ljava/lang/Exception;
    :goto_2d
    return-object p0
.end method

.method private static needsMultipart(Lcom/streambundlehtml/Connection$Request;)Z
    .registers 4
    .param p0, "req"    # Lcom/streambundlehtml/Connection$Request;

    .line 1254
    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/Connection$KeyVal;

    .line 1255
    .local v1, "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    invoke-interface {v1}, Lcom/streambundlehtml/Connection$KeyVal;->hasInputStream()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 1256
    const/4 v0, 0x1

    return v0

    .line 1257
    .end local v1    # "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    :cond_1c
    goto :goto_8

    .line 1258
    :cond_1d
    const/4 v0, 0x0

    return v0
.end method

.method private static punyUrl(Ljava/net/URL;)Ljava/net/URL;
    .registers 6
    .param p0, "url"    # Ljava/net/URL;

    .line 144
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->isAscii(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2c

    .line 146
    :try_start_a
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "puny":Ljava/lang/String;
    new-instance v1, Ljava/net/URL;

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v3

    invoke-virtual {p0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v0, v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_23
    .catch Ljava/net/MalformedURLException; {:try_start_a .. :try_end_23} :catch_25

    move-object p0, v1

    .line 151
    .end local v0    # "puny":Ljava/lang/String;
    goto :goto_2c

    .line 148
    :catch_25
    move-exception v0

    .line 150
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 153
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :cond_2c
    :goto_2c
    return-object p0
.end method


# virtual methods
.method public cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 321
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 322
    return-object p0
.end method

.method public cookieStore(Ljava/net/CookieStore;)Lcom/streambundlehtml/Connection;
    .registers 5
    .param p1, "cookieStore"    # Ljava/net/CookieStore;

    .line 336
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    new-instance v1, Ljava/net/CookieManager;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Ljava/net/CookieManager;-><init>(Ljava/net/CookieStore;Ljava/net/CookiePolicy;)V

    # setter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager:Ljava/net/CookieManager;
    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$002(Lcom/streambundlehtml/helper/HttpConnection$Request;Ljava/net/CookieManager;)Ljava/net/CookieManager;

    .line 337
    return-object p0
.end method

.method public cookieStore()Ljava/net/CookieStore;
    .registers 2

    .line 342
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    # getter for: Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager:Ljava/net/CookieManager;
    invoke-static {v0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->access$000(Lcom/streambundlehtml/helper/HttpConnection$Request;)Ljava/net/CookieManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/CookieManager;->getCookieStore()Ljava/net/CookieStore;

    move-result-object v0

    return-object v0
.end method

.method public cookies(Ljava/util/Map;)Lcom/streambundlehtml/Connection;
    .registers 7
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

    .line 326
    .local p1, "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "cookies"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 327
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 328
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 329
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_d

    .line 330
    :cond_2b
    return-object p0
.end method

.method public data(Ljava/lang/String;)Lcom/streambundlehtml/Connection$KeyVal;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .line 294
    const-string v0, "key"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection;->request()Lcom/streambundlehtml/Connection$Request;

    move-result-object v0

    invoke-interface {v0}, Lcom/streambundlehtml/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/Connection$KeyVal;

    .line 296
    .local v1, "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    invoke-interface {v1}, Lcom/streambundlehtml/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 297
    return-object v1

    .line 298
    .end local v1    # "keyVal":Lcom/streambundlehtml/Connection$KeyVal;
    :cond_28
    goto :goto_11

    .line 299
    :cond_29
    const/4 v0, 0x0

    return-object v0
.end method

.method public data(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 244
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-static {p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 245
    return-object p0
.end method

.method public data(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/streambundlehtml/Connection;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "inputStream"    # Ljava/io/InputStream;

    .line 254
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-static {p1, p2, p3}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 255
    return-object p0
.end method

.method public data(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "inputStream"    # Ljava/io/InputStream;
    .param p4, "contentType"    # Ljava/lang/String;

    .line 260
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-static {p1, p2, p3}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v1

    invoke-virtual {v1, p4}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->contentType(Ljava/lang/String;)Lcom/streambundlehtml/Connection$KeyVal;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 261
    return-object p0
.end method

.method public data(Ljava/util/Collection;)Lcom/streambundlehtml/Connection;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/Connection$KeyVal;",
            ">;)",
            "Lcom/streambundlehtml/Connection;"
        }
    .end annotation

    .line 286
    .local p1, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/streambundlehtml/Connection$KeyVal;>;"
    const-string v0, "data"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 287
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/Connection$KeyVal;

    .line 288
    .local v1, "entry":Lcom/streambundlehtml/Connection$KeyVal;
    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 289
    .end local v1    # "entry":Lcom/streambundlehtml/Connection$KeyVal;
    goto :goto_9

    .line 290
    :cond_1b
    return-object p0
.end method

.method public data(Ljava/util/Map;)Lcom/streambundlehtml/Connection;
    .registers 7
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

    .line 265
    .local p1, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "data"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 266
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 267
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 268
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_d

    .line 269
    :cond_2f
    return-object p0
.end method

.method public varargs data([Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 7
    .param p1, "keyvals"    # [Ljava/lang/String;

    .line 273
    const-string v0, "keyvals"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 274
    array-length v0, p1

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    const-string v1, "Must supply an even number of key value pairs"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 275
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    array-length v1, p1

    if-ge v0, v1, :cond_32

    .line 276
    aget-object v1, p1, v0

    .line 277
    .local v1, "key":Ljava/lang/String;
    add-int/lit8 v2, v0, 0x1

    aget-object v2, p1, v2

    .line 278
    .local v2, "value":Ljava/lang/String;
    const-string v3, "Data key must not be empty"

    invoke-static {v1, v3}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const-string v3, "Data value must not be null"

    invoke-static {v2, v3}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 280
    iget-object v3, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/helper/HttpConnection$Request;->data(Lcom/streambundlehtml/Connection$KeyVal;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 275
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x2

    goto :goto_13

    .line 282
    .end local v0    # "i":I
    :cond_32
    return-object p0
.end method

.method public execute()Lcom/streambundlehtml/Connection$Response;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 365
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-static {v0}, Lcom/streambundlehtml/helper/HttpConnection$Response;->execute(Lcom/streambundlehtml/helper/HttpConnection$Request;)Lcom/streambundlehtml/helper/HttpConnection$Response;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    .line 366
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    return-object v0
.end method

.method public followRedirects(Z)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "followRedirects"    # Z

    .line 217
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->followRedirects(Z)Lcom/streambundlehtml/Connection$Request;

    .line 218
    return-object p0
.end method

.method public get()Lcom/streambundlehtml/nodes/Document;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 351
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->GET:Lcom/streambundlehtml/Connection$Method;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;

    .line 352
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection;->execute()Lcom/streambundlehtml/Connection$Response;

    .line 353
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 354
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    invoke-interface {v0}, Lcom/streambundlehtml/Connection$Response;->parse()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 308
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 309
    return-object p0
.end method

.method public headers(Ljava/util/Map;)Lcom/streambundlehtml/Connection;
    .registers 7
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

    .line 313
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "headers"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 314
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 315
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/streambundlehtml/helper/HttpConnection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 316
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_d

    .line 317
    :cond_2b
    return-object p0
.end method

.method public ignoreContentType(Z)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "ignoreContentType"    # Z

    .line 238
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreContentType(Z)Lcom/streambundlehtml/Connection$Request;

    .line 239
    return-object p0
.end method

.method public ignoreHttpErrors(Z)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "ignoreHttpErrors"    # Z

    .line 233
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->ignoreHttpErrors(Z)Lcom/streambundlehtml/Connection$Request;

    .line 234
    return-object p0
.end method

.method public maxBodySize(I)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "bytes"    # I

    .line 212
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->maxBodySize(I)Lcom/streambundlehtml/Connection$Request;

    .line 213
    return-object p0
.end method

.method public method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "method"    # Lcom/streambundlehtml/Connection$Method;

    .line 228
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;

    .line 229
    return-object p0
.end method

.method public newRequest()Lcom/streambundlehtml/Connection;
    .registers 3

    .line 166
    new-instance v0, Lcom/streambundlehtml/helper/HttpConnection;

    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/HttpConnection;-><init>(Lcom/streambundlehtml/helper/HttpConnection$Request;)V

    return-object v0
.end method

.method public parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "parser"    # Lcom/streambundlehtml/parser/Parser;

    .line 346
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->parser(Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 347
    return-object p0
.end method

.method public post()Lcom/streambundlehtml/nodes/Document;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 358
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->POST:Lcom/streambundlehtml/Connection$Method;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;

    .line 359
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection;->execute()Lcom/streambundlehtml/Connection$Response;

    .line 360
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 361
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    invoke-interface {v0}, Lcom/streambundlehtml/Connection$Response;->parse()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public postDataCharset(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;

    .line 391
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->postDataCharset(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Request;

    .line 392
    return-object p0
.end method

.method public proxy(Ljava/lang/String;I)Lcom/streambundlehtml/Connection;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .line 196
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy(Ljava/lang/String;I)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 197
    return-object p0
.end method

.method public proxy(Ljava/net/Proxy;)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "proxy"    # Ljava/net/Proxy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 191
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->proxy(Ljava/net/Proxy;)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 192
    return-object p0
.end method

.method public referrer(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 4
    .param p1, "referrer"    # Ljava/lang/String;

    .line 222
    const-string v0, "referrer"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 223
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    const-string v1, "Referer"

    invoke-virtual {v0, v1, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 224
    return-object p0
.end method

.method public request()Lcom/streambundlehtml/Connection$Request;
    .registers 2

    .line 370
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    return-object v0
.end method

.method public request(Lcom/streambundlehtml/Connection$Request;)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "request"    # Lcom/streambundlehtml/Connection$Request;

    .line 374
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/helper/HttpConnection$Request;

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 375
    return-object p0
.end method

.method public requestBody(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "body"    # Ljava/lang/String;

    .line 303
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->requestBody(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Request;

    .line 304
    return-object p0
.end method

.method public response()Lcom/streambundlehtml/Connection$Response;
    .registers 3

    .line 379
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    if-eqz v0, :cond_7

    .line 382
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    return-object v0

    .line 380
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must execute the request before getting a response."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public response(Lcom/streambundlehtml/Connection$Response;)Lcom/streambundlehtml/Connection;
    .registers 2
    .param p1, "response"    # Lcom/streambundlehtml/Connection$Response;

    .line 386
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection;->res:Lcom/streambundlehtml/Connection$Response;

    .line 387
    return-object p0
.end method

.method public sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;

    .line 249
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 250
    return-object p0
.end method

.method public timeout(I)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "millis"    # I

    .line 207
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->timeout(I)Lcom/streambundlehtml/helper/HttpConnection$Request;

    .line 208
    return-object p0
.end method

.method public url(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 6
    .param p1, "url"    # Ljava/lang/String;

    .line 181
    const-string v0, "url"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    :try_start_5
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    new-instance v1, Ljava/net/URL;

    invoke-static {p1}, Lcom/streambundlehtml/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;
    :try_end_13
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_13} :catch_15

    .line 186
    nop

    .line 187
    return-object p0

    .line 184
    :catch_15
    move-exception v0

    .line 185
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v3, "The supplied URL, \'%s\', is malformed. Make sure it is an absolute URL, and starts with \'http://\' or \'https://\'. See https://jsoup.org/cookbook/extracting-data/working-with-urls"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public url(Ljava/net/URL;)Lcom/streambundlehtml/Connection;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;

    .line 176
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;

    .line 177
    return-object p0
.end method

.method public userAgent(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 4
    .param p1, "userAgent"    # Ljava/lang/String;

    .line 201
    const-string v0, "userAgent"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 202
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection;->req:Lcom/streambundlehtml/helper/HttpConnection$Request;

    const-string v1, "User-Agent"

    invoke-virtual {v0, v1, p1}, Lcom/streambundlehtml/helper/HttpConnection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 203
    return-object p0
.end method
