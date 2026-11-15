.class public final Lcom/streambundle/Unified;
.super Ljava/lang/Object;
.source "Unified.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/Unified$Links;
    }
.end annotation


# static fields
.field static final UA:Ljava/lang/String; = "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

.field static final pages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/jsoup/nodes/Document;",
            ">;"
        }
    .end annotation
.end field

.field static final posters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 18
    new-instance v0, Lcom/streambundle/Unified$1;

    const/16 v1, 0x40

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/streambundle/Unified$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/Unified;->pages:Ljava/util/Map;

    .line 19
    new-instance v0, Lcom/streambundle/Unified$2;

    const/16 v1, 0x80

    invoke-direct {v0, v1, v2, v3}, Lcom/streambundle/Unified$2;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/Unified;->posters:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static abs(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 24
    const-string v0, ""

    if-eqz p1, :cond_49

    :try_start_4
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    goto :goto_49

    :cond_f
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v1, "&amp;"

    const-string v2, "&"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v1, " "

    const-string v2, "%20"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    const-string p1, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_43

    const-string p1, "http"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_47

    :cond_43
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_47} :catch_48

    :cond_47
    return-object v0

    :catch_48
    move-exception p0

    :cond_49
    :goto_49
    return-object v0
.end method

.method static copy(Ljava/lang/Object;Ljava/lang/String;IZLjava/lang/String;)Ljava/lang/Object;
    .registers 18

    .line 122
    move-object v1, p0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/16 v2, 0x8

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-class v4, Ljava/lang/String;

    const/4 v7, 0x2

    aput-object v4, v3, v7

    const-class v4, Ljava/lang/String;

    const/4 v8, 0x3

    aput-object v4, v3, v8

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v9, 0x4

    aput-object v4, v3, v9

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x5

    aput-object v4, v3, v10

    const-class v4, Ljava/util/Map;

    const/4 v11, 0x6

    aput-object v4, v3, v11

    const-class v4, Ljava/lang/String;

    const/4 v12, 0x7

    aput-object v4, v3, v12

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 123
    const-string v3, "Headers"

    invoke-static {p0, v3}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/util/Map;

    if-nez v4, :cond_43

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v3

    .line 124
    :cond_43
    new-array v2, v2, [Ljava/lang/Object;

    const-string v4, "Source"

    invoke-static {p0, v4}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v5

    aput-object p4, v2, v6

    aput-object p1, v2, v7

    const-string v4, "Referer"

    invoke-static {p0, v4}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v8

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v9

    invoke-static/range {p3 .. p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v10

    aput-object v3, v2, v11

    const-string v3, "ExtractorData"

    invoke-static {p0, v3}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v12

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_7b} :catch_7c

    return-object v0

    .line 125
    :catch_7c
    move-exception v0

    return-object v1
.end method

.method public static document(Ljava/lang/Object;)V
    .registers 8

    .line 33
    :try_start_0
    instance-of v0, p0, Lorg/jsoup/nodes/Document;

    if-eqz v0, :cond_7

    check-cast p0, Lorg/jsoup/nodes/Document;

    goto :goto_47

    .line 34
    :cond_7
    if-eqz p0, :cond_bb

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.streambundlehtml.nodes.Document"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_bb

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "baseUri"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "outerHtml"

    new-array v4, v2, [Ljava/lang/Class;

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0, v0}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p0

    .line 37
    nop

    .line 38
    :goto_47
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_54

    return-void

    .line 39
    :cond_54
    invoke-static {p0}, Lcom/videobundle/fixes/MetadataSupport;->normalize(Lorg/jsoup/nodes/Document;)V

    invoke-static {p0}, Lcom/videobundle/fixes/MetadataSupport;->remember(Ljava/lang/Object;)V

    .line 40
    sget-object v1, Lcom/streambundle/Unified;->pages:Ljava/util/Map;

    invoke-static {v0}, Lcom/streambundle/Unified;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->html()Ljava/lang/String;

    move-result-object v1

    .line 43
    const-string v2, "(?:setVideoUrlLow|setVideoUrlHigh|setVideoHLS)\\s*\\(\\s*[\'\"]([^\'\"]+)"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 44
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 45
    :cond_76
    :goto_76
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-nez v3, :cond_7d

    .line 46
    goto :goto_bd

    .line 45
    :cond_7d
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/streambundle/Unified;->abs(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_76

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_76

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v4

    const-string v5, "video"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    const-string v5, "source"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    const-string v5, "src"

    invoke-virtual {v4, v5, v3}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    const-string v5, "type"

    const-string v6, ".m3u8"

    invoke-virtual {v3, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_b5

    const-string v3, "application/x-mpegURL"

    goto :goto_b7

    :cond_b5
    const-string v3, "video/mp4"

    :goto_b7
    invoke-virtual {v4, v5, v3}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    :try_end_ba
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_ba} :catch_bc

    goto :goto_76

    .line 37
    :cond_bb
    return-void

    .line 46
    :catch_bc
    move-exception p0

    .line 47
    :goto_bd
    return-void
.end method

.method static fetch(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "**>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 128
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    const/16 v0, 0x1770

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v0, "User-Agent"

    const-string v1, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-virtual {p0, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_25

    const-string v0, "Referer"

    invoke-virtual {p0, v0, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_25
    if-eqz p1, :cond_50

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-nez p2, :cond_36

    goto :goto_50

    :cond_36
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v0, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2f

    .line 130
    :cond_50
    :goto_50
    const/4 p1, 0x0

    :try_start_51
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2
    :try_end_55
    .catchall {:try_start_51 .. :try_end_55} :catchall_a6

    :try_start_55
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_5a
    .catchall {:try_start_55 .. :try_end_5a} :catchall_96

    const/16 v1, 0x2000

    :try_start_5c
    new-array v1, v1, [B

    :goto_5e
    invoke-virtual {p2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_7c

    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_70
    .catchall {:try_start_5c .. :try_end_70} :catchall_91

    :try_start_70
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_73
    .catchall {:try_start_70 .. :try_end_73} :catchall_96

    if-eqz p2, :cond_78

    :try_start_75
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_78
    .catchall {:try_start_75 .. :try_end_78} :catchall_a6

    :cond_78
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v1

    :cond_7c
    const/4 v3, 0x0

    :try_start_7d
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    const/high16 v3, 0x100000

    if-gt v2, v3, :cond_89

    goto :goto_5e

    :cond_89
    new-instance p1, Ljava/io/IOException;

    const-string v1, "Manifest too large"

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_91
    .catchall {:try_start_7d .. :try_end_91} :catchall_91

    :catchall_91
    move-exception p1

    :try_start_92
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    throw p1
    :try_end_96
    .catchall {:try_start_92 .. :try_end_96} :catchall_96

    :catchall_96
    move-exception v0

    if-nez p1, :cond_9b

    move-object p1, v0

    goto :goto_a0

    :cond_9b
    if-eq p1, v0, :cond_a0

    :try_start_9d
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a0
    :goto_a0
    if-eqz p2, :cond_a5

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_a5
    throw p1
    :try_end_a6
    .catchall {:try_start_9d .. :try_end_a6} :catchall_a6

    :catchall_a6
    move-exception p2

    if-eqz p1, :cond_af

    if-eq p1, p2, :cond_b0

    :try_start_ab
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_b0

    :cond_af
    move-object p1, p2

    :cond_b0
    :goto_b0
    throw p1
    :try_end_b1
    .catchall {:try_start_ab .. :try_end_b1} :catchall_b1

    :catchall_b1
    move-exception p1

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p1
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5

    .line 20
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "get"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_20} :catch_21

    return-object p0

    :catch_21
    move-exception p0

    const/4 p0, 0x0

    return-object p0
.end method

.method static image(Ljava/lang/String;)Z
    .registers 3

    .line 25
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_26

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".*(?:placeholder|/blank|no[-_]thumb|/logo[._/]|/flags/|\\.svg(?:\\?.*)?).*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_26

    const-string v0, "https://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_24

    const-string v0, "http://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_26

    :cond_24
    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 23
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "^www\\."

    invoke-virtual {v4, v5, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v1

    const-string v4, "/+$"

    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez v2, :cond_34

    :goto_33
    goto :goto_50

    :cond_34
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "?"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "(?:^|&)(?:utm_[^=]+|ref|from)=[^&]*"

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "^&"

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_33

    :goto_50
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_58} :catch_59

    return-object p0

    :catch_59
    move-exception v0

    return-object p0
.end method

.method public static links(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;
    .registers 1

    return-object p0
.end method

.method static list(Ljava/util/List;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 86
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_76

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Url"

    invoke-static {v0, v1}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_14

    goto :goto_76

    .line 87
    :cond_14
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 88
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1d
    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_31

    .line 90
    new-instance p0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->cards(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 88
    :cond_31
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/Unified;->response(Ljava/lang/Object;)V

    invoke-static {p0, v1}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/Unified;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 89
    if-nez v4, :cond_4e

    invoke-virtual {v0, v3, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1d

    :cond_4e
    const-string v3, "PosterUrl"

    invoke-static {v4, v3}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/Unified;->image(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1d

    invoke-static {p0, v3}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/Unified;->image(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1d

    const-class v5, Ljava/lang/String;

    invoke-static {p0, v3}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {v4, v3, v5, p0}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    goto :goto_1d

    .line 86
    :cond_76
    :goto_76
    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->cards(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static output(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    .line 93
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_b

    check-cast p0, Ljava/util/List;

    invoke-static {p0}, Lcom/streambundle/Unified;->list(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 94
    :cond_b
    if-nez p0, :cond_f

    const/4 p0, 0x0

    return-object p0

    .line 95
    :cond_f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 96
    const-string v1, "LoadResponse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_27

    const-string v1, "SearchResponse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2a

    :cond_27
    invoke-static {p0}, Lcom/streambundle/Unified;->response(Ljava/lang/Object;)V

    .line 97
    :cond_2a
    const-string v1, "HomePageResponse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    .line 98
    const-string v0, "Items"

    invoke-static {p0, v0}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/Iterable;

    if-eqz v1, :cond_76

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_42
    :goto_42
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_49

    goto :goto_76

    :cond_49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "List"

    invoke-static {v1, v2}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/util/List;

    if-eqz v4, :cond_42

    move-object v4, v3

    check-cast v4, Ljava/util/List;

    invoke-static {v4}, Lcom/streambundle/Unified;->list(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    const-class v5, Ljava/util/List;

    invoke-static {v1, v2, v5, v4}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-static {v1, v2}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v3, :cond_42

    if-eq v4, v3, :cond_42

    :try_start_6b
    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_73
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_6b .. :try_end_73} :catch_74

    goto :goto_42

    :catch_74
    move-exception v1

    goto :goto_42

    .line 99
    :cond_76
    :goto_76
    return-object p0
.end method

.method public static playbackUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 103
    :try_start_0
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 104
    const-string v2, "beeg.porn"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1c

    const-string v2, ".beeg.porn"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_28

    :cond_1c
    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/xid/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_29

    :cond_28
    return-object p0

    .line 105
    :cond_29
    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6b

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_37
    if-lt v2, v1, :cond_3a

    .line 108
    goto :goto_6b

    .line 105
    :cond_3a
    aget-object v3, v0, v2

    const-string v4, "e="

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_67

    .line 106
    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-static {v3, v4}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "[A-Za-z0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_67

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.xvideos.com/embedframe/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_66} :catch_6a

    return-object p0

    .line 105
    :cond_67
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .line 108
    :catch_6a
    move-exception v0

    :cond_6b
    :goto_6b
    return-object p0
.end method

.method static quality(Ljava/lang/String;)I
    .registers 2

    .line 111
    const-string v0, "(?i)(?:^|[^0-9])(2160|1440|1080|720|540|480|360|240|144)p?(?:[^0-9]|$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    return p0
.end method

.method public static response(Ljava/lang/Object;)V
    .registers 7

    .line 62
    if-nez p0, :cond_9

    invoke-static/range {p0 .. p0}, Lcom/streambundle/JavSupport;->response(Ljava/lang/Object;)V

    invoke-static/range {p0 .. p0}, Lcom/streambundle/v38/BundleMetadata;->response(Ljava/lang/Object;)V

    return-void

    .line 63
    :cond_9
    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-static/range {p0 .. p0}, Lcom/streambundle/JavSupport;->response(Ljava/lang/Object;)V

    invoke-static/range {p0 .. p0}, Lcom/streambundle/v38/BundleMetadata;->response(Ljava/lang/Object;)V

    return-void

    .line 64
    :cond_20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LoadResponse"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    .line 65
    if-eqz v1, :cond_b7

    .line 66
    sget-object v1, Lcom/streambundle/Unified;->pages:Ljava/util/Map;

    invoke-static {v0}, Lcom/streambundle/Unified;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Document;

    .line 67
    const-string v2, "Plot"

    if-eqz v1, :cond_8b

    .line 68
    invoke-static {p0, v1}, Lcom/videobundle/fixes/MetadataSupport;->enrichDocument(Ljava/lang/Object;Lorg/jsoup/nodes/Document;)V

    .line 69
    const-string v3, "[itemprop=description]:not(meta), .video-description, #video-description, .video_description, .video-info .description, .entry-content .description"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    .line 70
    if-eqz v3, :cond_60

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->html()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/Unified;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xf

    if-le v4, v5, :cond_60

    const-class v4, Ljava/lang/String;

    invoke-static {p0, v2, v4, v3}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 71
    :cond_60
    const-string v3, "script[type=application/ld+json]"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_71

    goto :goto_8b

    :cond_71
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    :try_start_77
    new-instance v4, Lorg/json/JSONTokener;

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Lcom/streambundle/Unified;->structured(Ljava/lang/Object;Ljava/lang/Object;I)V
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_88} :catch_89

    goto :goto_6a

    :catch_89
    move-exception v3

    goto :goto_6a

    .line 73
    :cond_8b
    :goto_8b
    invoke-static {p0, v2}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_a2

    const-class v3, Ljava/lang/String;

    invoke-static {v1}, Lcom/streambundle/Unified;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v2, v3, v1}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 74
    :cond_a2
    const-string v1, "Recommendations"

    invoke-static {p0, v1}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Ljava/util/List;

    if-eqz v3, :cond_b7

    const-class v3, Ljava/util/List;

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Lcom/streambundle/Unified;->list(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-static {p0, v1, v3, v2}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 76
    :cond_b7
    const-string v1, "PosterUrl"

    invoke-static {p0, v1}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/streambundle/Unified;->abs(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 77
    invoke-static {v2}, Lcom/streambundle/Unified;->image(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_d7

    sget-object v2, Lcom/streambundle/Unified;->posters:Ljava/util/Map;

    invoke-static {v0}, Lcom/streambundle/Unified;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 78
    :cond_d7
    if-eqz v2, :cond_11e

    invoke-static {v2}, Lcom/streambundle/Unified;->image(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11e

    .line 79
    const-class v3, Ljava/lang/String;

    invoke-static {p0, v1, v3, v2}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    sget-object v1, Lcom/streambundle/Unified;->posters:Ljava/util/Map;

    invoke-static {v0}, Lcom/streambundle/Unified;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v2, "PosterHeaders"

    invoke-static {p0, v2}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/util/Map;

    if-eqz v4, :cond_101

    check-cast v3, Ljava/util/Map;

    invoke-interface {v1, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 81
    :cond_101
    const-string v3, "Referer"

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10c

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10c
    const-string v0, "User-Agent"

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_119

    const-string v3, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_119
    const-class v0, Ljava/util/Map;

    invoke-static {p0, v2, v0, v1}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 84
    :cond_11e
    invoke-static/range {p0 .. p0}, Lcom/streambundle/JavSupport;->response(Ljava/lang/Object;)V

    invoke-static/range {p0 .. p0}, Lcom/streambundle/v38/BundleMetadata;->response(Ljava/lang/Object;)V

    return-void
.end method

.method public static searchQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 27
    const-string v0, "inhumanity.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_13

    const-string p0, "bdsm"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_13

    const-string p0, "bondage"

    return-object p0

    .line 28
    :cond_13
    return-object p1
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 22
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "set"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    aput-object p3, p2, v3

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_24} :catch_25

    goto :goto_26

    :catch_25
    move-exception p0

    :goto_26
    return-void
.end method

.method static str(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 21
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_9
    return-object p0
.end method

.method static structured(Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 8

    .line 50
    if-eqz p1, :cond_92

    const/4 v0, 0x7

    if-le p2, v0, :cond_7

    goto/16 :goto_92

    .line 51
    :cond_7
    instance-of v0, p1, Lorg/json/JSONArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_23

    move-object v0, p1

    check-cast v0, Lorg/json/JSONArray;

    const/4 v2, 0x0

    :goto_10
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_17

    goto :goto_23

    :cond_17
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, p2, 0x1

    invoke-static {p0, v3, v4}, Lcom/streambundle/Unified;->structured(Ljava/lang/Object;Ljava/lang/Object;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 52
    :cond_23
    :goto_23
    instance-of v0, p1, Lorg/json/JSONObject;

    if-nez v0, :cond_28

    return-void

    .line 53
    :cond_28
    check-cast p1, Lorg/json/JSONObject;

    const-string v0, "@type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    const-string v2, "VideoObject"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_40

    const-string v2, "Movie"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_86

    .line 55
    :cond_40
    const-string v0, "description"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/Unified;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_57

    const-string v2, "Plot"

    const-class v3, Ljava/lang/String;

    invoke-static {p0, v2, v3, v0}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 56
    :cond_57
    const-string v0, "thumbnailUrl"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Lorg/json/JSONArray;

    if-eqz v2, :cond_67

    check-cast v0, Lorg/json/JSONArray;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v0

    .line 57
    :cond_67
    const-string v1, "Url"

    invoke-static {p0, v1}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/streambundle/Unified;->abs(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/Unified;->image(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_86

    const-string v1, "PosterUrl"

    const-class v2, Ljava/lang/String;

    invoke-static {p0, v1, v2, v0}, Lcom/streambundle/Unified;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 59
    :cond_86
    const-string v0, "@graph"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    add-int/lit8 p2, p2, 0x1

    invoke-static {p0, p1, p2}, Lcom/streambundle/Unified;->structured(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 60
    return-void

    .line 50
    :cond_92
    :goto_92
    return-void
.end method

.method static text(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 48
    invoke-static {p0}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->text()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\s+"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static variants(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 113
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 114
    const-string v1, "\\r?\\n"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v4, v2

    :goto_f
    if-lt v3, v1, :cond_12

    .line 118
    return-object v0

    .line 114
    :cond_12
    aget-object v5, p1, v3

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, "#EXT-X-STREAM-INF:"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_22

    move-object v4, v5

    goto :goto_6e

    :cond_22
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6e

    const-string v6, "#"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_6e

    if-eqz v4, :cond_6e

    .line 115
    const-string v6, "RESOLUTION=\\d+x(\\d+)"

    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-eqz v7, :cond_4c

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    goto :goto_50

    :cond_4c
    invoke-static {v5}, Lcom/streambundle/Unified;->quality(Ljava/lang/String;)I

    move-result v6

    .line 117
    :goto_50
    const-string v7, "AUDIO="

    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6d

    invoke-static {p0, v5}, Lcom/streambundle/Unified;->abs(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_6d

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6d
    move-object v4, v2

    .line 114
    :cond_6e
    :goto_6e
    add-int/lit8 v3, v3, 0x1

    goto :goto_f
.end method
