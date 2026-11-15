.class Lcom/streambundlehtml/helper/CookieUtil;
.super Ljava/lang/Object;
.source "CookieUtil.java"


# static fields
.field private static final Cookie2Name:Ljava/lang/String; = "Cookie2"

.field private static final CookieName:Ljava/lang/String; = "Cookie"

.field private static final EmptyRequestHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final Sep:Ljava/lang/String; = "; "


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/helper/CookieUtil;->EmptyRequestHeaders:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static applyCookiesToRequest(Lcom/streambundlehtml/helper/HttpConnection$Request;Ljava/net/HttpURLConnection;)V
    .registers 11
    .param p0, "req"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .param p1, "con"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    invoke-static {p0}, Lcom/streambundlehtml/helper/CookieUtil;->requestCookieSet(Lcom/streambundlehtml/Connection$Request;)Ljava/util/LinkedHashSet;

    move-result-object v0

    .line 38
    .local v0, "cookieSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 41
    .local v1, "cookies2":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager()Ljava/net/CookieManager;

    move-result-object v2

    iget-object v3, p0, Lcom/streambundlehtml/helper/HttpConnection$Request;->url:Ljava/net/URL;

    invoke-static {v3}, Lcom/streambundlehtml/helper/CookieUtil;->asUri(Ljava/net/URL;)Ljava/net/URI;

    move-result-object v3

    sget-object v4, Lcom/streambundlehtml/helper/CookieUtil;->EmptyRequestHeaders:Ljava/util/Map;

    invoke-virtual {v2, v3, v4}, Ljava/net/CookieManager;->get(Ljava/net/URI;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    .line 42
    .local v2, "storedCookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1d
    :goto_1d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const-string v5, "Cookie2"

    const-string v6, "Cookie"

    if-eqz v4, :cond_5a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 44
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 45
    .local v7, "cookies":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v7, :cond_1d

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_3c

    .line 46
    goto :goto_1d

    .line 48
    :cond_3c
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 50
    .local v8, "key":Ljava/lang/String;
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4a

    .line 51
    move-object v5, v0

    .local v5, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    goto :goto_56

    .line 52
    .end local v5    # "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4a
    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 53
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 54
    .restart local v5    # "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object v1, v5

    .line 58
    :goto_56
    invoke-interface {v5, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 59
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v5    # "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v7    # "cookies":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "key":Ljava/lang/String;
    goto :goto_1d

    .line 61
    :cond_5a
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v3

    const-string v4, "; "

    if-lez v3, :cond_69

    .line 62
    invoke-static {v0, v4}, Lcom/streambundlehtml/internal/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v6, v3}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    :cond_69
    if-eqz v1, :cond_78

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v3

    if-lez v3, :cond_78

    .line 64
    invoke-static {v1, v4}, Lcom/streambundlehtml/internal/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v5, v3}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    :cond_78
    return-void
.end method

.method static asUri(Ljava/net/URL;)Ljava/net/URI;
    .registers 4
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v0
    :try_end_4
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 79
    :catch_5
    move-exception v0

    .line 80
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v1, Ljava/net/MalformedURLException;

    invoke-virtual {v0}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 81
    .local v1, "ue":Ljava/net/MalformedURLException;
    invoke-virtual {v1, v0}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 82
    throw v1
.end method

.method private static requestCookieSet(Lcom/streambundlehtml/Connection$Request;)Ljava/util/LinkedHashSet;
    .registers 6
    .param p0, "req"    # Lcom/streambundlehtml/Connection$Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundlehtml/Connection$Request;",
            ")",
            "Ljava/util/LinkedHashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 68
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 70
    .local v0, "set":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    invoke-interface {p0}, Lcom/streambundlehtml/Connection$Request;->cookies()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_44

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 71
    .local v2, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 72
    .end local v2    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_11

    .line 73
    :cond_44
    return-object v0
.end method

.method static storeCookies(Lcom/streambundlehtml/helper/HttpConnection$Request;Ljava/net/URL;Ljava/util/Map;)V
    .registers 5
    .param p0, "req"    # Lcom/streambundlehtml/helper/HttpConnection$Request;
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundlehtml/helper/HttpConnection$Request;",
            "Ljava/net/URL;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 87
    .local p2, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p0}, Lcom/streambundlehtml/helper/HttpConnection$Request;->cookieManager()Ljava/net/CookieManager;

    move-result-object v0

    invoke-static {p1}, Lcom/streambundlehtml/helper/CookieUtil;->asUri(Ljava/net/URL;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/net/CookieManager;->put(Ljava/net/URI;Ljava/util/Map;)V

    .line 89
    return-void
.end method
