.class public final Lcom/streambundle/v38/TubeSources;
.super Ljava/lang/Object;
.source "TubeSources.java"


# static fields
.field private static final ADS:Ljava/util/regex/Pattern;

.field private static final FIELDS:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 14
    const-string v0, "(?is)(?:[\"\']?)(license_code|video_(?:alt_)?url\\d*|(?:file|src|contentUrl|hls|hlsUrl|videoUrl|video_url))[\'\"]?\\s*[:=]\\s*([\'\"])((?:\\\\.|(?!\\2).)*?)\\2"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/TubeSources;->FIELDS:Ljava/util/regex/Pattern;

    .line 15
    const-string v0, "(?i)(?:doubleclick|exoclick|trafficjunky|tsyndicate|googletagmanager|(?:^|[./_-])ads?[./_-]|preroll|trailer|preview)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/TubeSources;->ADS:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 22
    const-string v0, ""

    :try_start_2
    invoke-static {p1}, Lcom/streambundle/v38/TubeSources;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p1

    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->text()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4e

    const-string v1, "function/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    goto :goto_4e

    .line 24
    :cond_21
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    const-string v1, " "

    const-string v2, "%20"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    .line 25
    const-string p1, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_49

    const-string p1, "http"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4d

    :cond_49
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4d} :catch_4f

    :cond_4d
    return-object v0

    .line 23
    :cond_4e
    :goto_4e
    return-object v0

    .line 26
    :catch_4f
    move-exception p0

    return-object v0
.end method

.method public static embeds(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 82
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    .line 83
    const-string v2, "iframe#video2"

    const-string v3, "#player iframe, .player iframe, .video-player iframe, iframe[id^=video], iframe[src*=embed], iframe[data-src*=embed]"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    :goto_12
    const/4 v4, 0x2

    if-lt v3, v4, :cond_eb

    .line 88
    const-string v2, "meta[itemprop=embedUrl], meta[property=og:video], meta[property=og:video:url], meta[property=og:video:secure_url]"

    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1f
    :goto_1f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_c4

    .line 91
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "script"

    invoke-virtual {p0, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_34
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_af

    .line 92
    const-string p0, "(?is)\\b(?:iframe_src|embedUrl|embed_url|player_url)\\s*[:=]\\s*([\'\"])((?:\\\\.|(?!\\1).)*?)\\1"

    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 93
    :cond_44
    nop

    :goto_45
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-nez v3, :cond_91

    .line 94
    const-string p0, "(?is)(?:\\.src|\\b(?:iframe_src|embedUrl|embed_url))\\s*[:=]\\s*atob\\(\\s*([\'\"])([A-Za-z0-9+/=]+)\\1\\s*\\)"

    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 95
    :cond_55
    nop

    :goto_56
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    if-nez p0, :cond_6f

    .line 96
    invoke-static {v1}, Lcom/streambundle/v38/TubeSources;->external(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_69

    invoke-virtual {v0, p0}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_69
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p0

    .line 95
    :cond_6f
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v38/TubeSources;->fromBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_55

    sget-object v2, Lcom/streambundle/v38/TubeSources;->ADS:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_55

    invoke-virtual {v0, p0}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_56

    .line 93
    :cond_91
    invoke-virtual {p0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_44

    sget-object v5, Lcom/streambundle/v38/TubeSources;->ADS:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-nez v5, :cond_44

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_45

    .line 91
    :cond_af
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/jsoup/nodes/Element;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const/16 v5, 0xa

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_34

    .line 88
    :cond_c4
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 89
    const-string v3, "content"

    invoke-virtual {v2, v3}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1f

    sget-object v3, Lcom/streambundle/v38/TubeSources;->ADS:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-nez v3, :cond_1f

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1f

    .line 83
    :cond_eb
    aget-object v4, v2, v3

    invoke-virtual {p0, v4}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_f5
    :goto_f5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_ff

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_12

    :cond_ff
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Element;

    .line 84
    const-string v6, "data-src"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    const-string v8, "src"

    if-eqz v7, :cond_117

    invoke-virtual {v5, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_117
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_123

    const-string v6, "data-lazy-src"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 85
    :cond_123
    invoke-static {v1, v6}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_142

    sget-object v7, Lcom/streambundle/v38/TubeSources;->ADS:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-nez v7, :cond_142

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_142

    invoke-virtual {v0, v6}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 86
    :cond_142
    const-string v6, "srcdoc"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f5

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v1}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/v38/TubeSources;->sources(Lorg/jsoup/nodes/Document;)Ljava/util/LinkedHashMap;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_15e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_165

    goto :goto_f5

    :cond_165
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v7

    const-string v9, "video"

    invoke-virtual {v7, v9}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    const-string v9, "source"

    invoke-virtual {v7, v9}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v9, "label"

    invoke-virtual {v7, v9, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_15e
.end method

.method public static excluded(Ljava/lang/String;)Z
    .registers 5

    .line 110
    const/4 v0, 0x1

    :try_start_1
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_31

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string v3, "https"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    :cond_23
    sget-object v1, Lcom/streambundle/v38/TubeSources;->ADS:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2d} :catch_32

    if-nez p0, :cond_31

    const/4 p0, 0x0

    return p0

    :cond_31
    return v0

    :catch_32
    move-exception p0

    return v0
.end method

.method public static external(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 101
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_a5

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v2, "tubesafari.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_26

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v2, "www.tubesafari.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_26

    goto/16 :goto_a5

    .line 102
    :cond_26
    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_2d

    return-object v0

    :cond_2d
    const-string v1, "&"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_35
    if-lt v2, v1, :cond_38

    .line 108
    goto :goto_a7

    .line 102
    :cond_38
    aget-object v3, p0, v2

    const-string v4, "id="

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a2

    .line 103
    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-static {v3, v4}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 104
    const-string v4, "xv\\d+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x2

    if-eqz v4, :cond_6a

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.xvideos.com/embedframe/"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 105
    :cond_6a
    const-string v4, "xn[a-zA-Z0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_86

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.xnxx.com/embedframe/"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 106
    :cond_86
    const-string v4, "ph[a-zA-Z0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a2

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.pornhub.com/embed/"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_a1} :catch_a6

    return-object p0

    .line 102
    :cond_a2
    add-int/lit8 v2, v2, 0x1

    goto :goto_35

    .line 101
    :cond_a5
    :goto_a5
    return-object v0

    .line 108
    :catch_a6
    move-exception p0

    :goto_a7
    return-object v0
.end method

.method private static fromBase64(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_d
    if-lt v2, v1, :cond_14

    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 78
    :cond_14
    aget-char v5, p0, v2

    const-string v6, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    invoke-virtual {v6, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-gez v5, :cond_1f

    goto :goto_32

    :cond_1f
    shl-int/lit8 v3, v3, 0x6

    or-int/2addr v3, v5

    add-int/lit8 v4, v4, 0x6

    const/16 v5, 0x8

    if-lt v4, v5, :cond_32

    add-int/lit8 v4, v4, -0x8

    shr-int v5, v3, v4

    and-int/lit16 v5, v5, 0xff

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_32
    :goto_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_d
.end method

.method private static jsonSources(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;I)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 72
    const/16 v0, 0x8

    if-le p3, v0, :cond_5

    return-void

    .line 73
    :cond_5
    instance-of v0, p0, Lorg/json/JSONArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    move-object v0, p0

    check-cast v0, Lorg/json/JSONArray;

    move v2, v1

    :goto_e
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_15

    goto :goto_21

    :cond_15
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, p3, 0x1

    invoke-static {v3, p1, p2, v4}, Lcom/streambundle/v38/TubeSources;->jsonSources(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 74
    :cond_21
    :goto_21
    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_72

    check-cast p0, Lorg/json/JSONObject;

    const-string v0, "src"

    const-string v2, "file"

    const-string v3, "contentUrl"

    const-string v4, "url"

    filled-new-array {v3, v4, v0, v2}, [Ljava/lang/String;

    move-result-object v0

    move v2, v1

    :goto_34
    const/4 v3, 0x4

    if-lt v2, v3, :cond_54

    const-string v0, "video"

    const-string v2, "sources"

    const-string v4, "@graph"

    const-string v5, "mainEntity"

    filled-new-array {v4, v5, v0, v2}, [Ljava/lang/String;

    move-result-object v4

    :goto_43
    if-lt v1, v3, :cond_46

    goto :goto_72

    :cond_46
    aget-object v0, v4, v1

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v2, p3, 0x1

    invoke-static {v0, p1, p2, v2}, Lcom/streambundle/v38/TubeSources;->jsonSources(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_43

    :cond_54
    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_6f

    check-cast v3, Ljava/lang/String;

    invoke-static {p1, v3}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/v38/TubeSources;->playable(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6f

    const-string v4, ""

    invoke-interface {p2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6f
    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    .line 75
    :cond_72
    :goto_72
    return-void
.end method

.method public static kvs(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 16

    .line 32
    const-string v0, "function/0/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v2, ""

    if-nez v1, :cond_14

    const-string p1, "function/"

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_13

    move-object p0, v2

    :cond_13
    return-object p0

    .line 34
    :cond_14
    :try_start_14
    const-string v1, "$"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\d{8,}"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_23

    return-object v2

    .line 35
    :cond_23
    const/16 v1, 0x31

    const/16 v3, 0x30

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    .line 36
    new-instance v5, Ljava/math/BigInteger;

    add-int/lit8 v6, v4, 0x1

    const/4 v7, 0x0

    invoke-virtual {v1, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljava/math/BigInteger;

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->abs()Ljava/math/BigInteger;

    move-result-object v1

    const-wide/16 v4, 0x4

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x4

    mul-int/2addr v4, v5

    new-array v6, v4, [I

    .line 39
    move v8, v7

    move v9, v8

    :goto_72
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    if-lt v8, v10, :cond_164

    .line 40
    const/16 p1, 0x20

    if-ge v4, p1, :cond_7d

    return-object v2

    .line 41
    :cond_7d
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v1

    const-string v3, "/"

    const/4 v4, -0x1

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 42
    array-length v3, v1

    if-lt v3, v5, :cond_163

    const/4 v3, 0x3

    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v4, p1, :cond_a2

    goto/16 :goto_163

    .line 43
    :cond_a2
    aget-object v4, v1, v3

    new-array v5, p1, [I

    move v8, v7

    :goto_a7
    if-lt v8, p1, :cond_15d

    .line 44
    const/16 v8, 0x1f

    move v9, v7

    :goto_ac
    if-gez v8, :cond_14b

    .line 45
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move v8, v7

    :goto_b4
    if-lt v8, p1, :cond_13e

    invoke-virtual {v4, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v3

    .line 46
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    move v4, v7

    :goto_c9
    array-length v5, v1

    if-lt v4, v5, :cond_12f

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v4

    const-string v5, "://"

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {p0, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_f4

    move-object p1, v2

    goto :goto_107

    :cond_f4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "?"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_107
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_113

    move-object p1, v2

    goto :goto_126

    :cond_113
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "#"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_126
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 46
    :cond_12f
    if-lez v4, :cond_136

    const/16 v5, 0x2f

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_136
    aget-object v5, v1, v4

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_c9

    .line 45
    :cond_13e
    aget v9, v5, v8

    invoke-virtual {v4, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_b4

    .line 44
    :cond_14b
    aget v10, v6, v8

    add-int/2addr v9, v10

    add-int v10, v8, v9

    rem-int/2addr v10, p1

    aget v11, v5, v8

    aget v12, v5, v10

    aput v12, v5, v8

    aput v11, v5, v10

    add-int/lit8 v8, v8, -0x1

    goto/16 :goto_ac

    .line 43
    :cond_15d
    aput v8, v5, v8

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_a7

    .line 42
    :cond_163
    :goto_163
    return-object v2

    .line 39
    :cond_164
    move v10, v7

    :goto_165
    if-lt v10, v5, :cond_16b

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_72

    :cond_16b
    add-int/lit8 v11, v9, 0x1

    add-int v12, v8, v10

    invoke-virtual {p1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    sub-int/2addr v12, v3

    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v13

    add-int/2addr v12, v13

    sub-int/2addr v12, v3

    rem-int/lit8 v12, v12, 0xa

    aput v12, v6, v9
    :try_end_17e
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_17e} :catch_182

    add-int/lit8 v10, v10, 0x1

    move v9, v11

    goto :goto_165

    .line 49
    :catch_182
    move-exception p0

    return-object v2
.end method

.method public static playable(Ljava/lang/String;)Z
    .registers 2

    .line 28
    if-eqz p0, :cond_20

    sget-object v0, Lcom/streambundle/v38/TubeSources;->ADS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "(?is)https?://.*\\.(?:mp4|m3u8|webm|m4v|mov)(?:[/?#].*)?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1e

    const-string v0, "(?is)https?://.*/get_file/.*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_20

    :cond_1e
    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public static sources(Lorg/jsoup/nodes/Document;)Ljava/util/LinkedHashMap;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 52
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    .line 53
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "script"

    invoke-virtual {p0, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_18
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_145

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 54
    sget-object v2, Lcom/streambundle/v38/TubeSources;->FIELDS:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    :cond_28
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    const/4 v3, 0x3

    const-string v6, "license_code"

    const/4 v7, 0x1

    const-string v8, ""

    if-nez v2, :cond_36

    move-object v2, v8

    goto :goto_48

    :cond_36
    invoke-virtual {v5, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-virtual {v5, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundle/v38/TubeSources;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 55
    :goto_48
    sget-object v5, Lcom/streambundle/v38/TubeSources;->FIELDS:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    :cond_4e
    :goto_4e
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    const/4 v10, 0x2

    if-nez v5, :cond_eb

    .line 63
    const-string v2, "(?is)(?:setVideoHLS|setVideoUrlHigh|setVideoUrlLow)\\s*\\(\\s*([\'\"])((?:\\\\.|(?!\\1).)*?)\\1"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 64
    nop

    :cond_60
    :goto_60
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_d8

    .line 65
    const-string v2, "source[src], video[src], source[data-src], video[data-src], meta[itemprop=contentUrl]"

    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_70
    :goto_70
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_a1

    .line 68
    const-string v2, "script[type=application/ld+json]"

    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_80
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_87

    .line 69
    return-object v0

    .line 68
    :cond_87
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/jsoup/nodes/Element;

    :try_start_8d
    new-instance v2, Lorg/json/JSONTokener;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p0

    const/4 v2, 0x0

    invoke-static {p0, v1, v0, v2}, Lcom/streambundle/v38/TubeSources;->jsonSources(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;I)V
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_8d .. :try_end_9e} :catch_9f

    goto :goto_80

    :catch_9f
    move-exception p0

    goto :goto_80

    .line 65
    :cond_a1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 66
    const-string v4, "content"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b4

    :goto_af
    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_c4

    :cond_b4
    const-string v4, "src"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_c1

    goto :goto_af

    :cond_c1
    const-string v4, "data-src"

    goto :goto_af

    :goto_c4
    invoke-static {v1, v4}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundle/v38/TubeSources;->playable(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_70

    const-string v5, "label"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_70

    .line 64
    :cond_d8
    invoke-virtual {v5, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundle/v38/TubeSources;->playable(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_60

    invoke-virtual {v0, v2, v8}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_60

    .line 55
    :cond_eb
    invoke-virtual {v9, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4e

    .line 56
    invoke-virtual {v9, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/v38/TubeSources;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v2}, Lcom/streambundle/v38/TubeSources;->kvs(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/streambundle/v38/TubeSources;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 57
    invoke-static {v5}, Lcom/streambundle/v38/TubeSources;->playable(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_4e

    .line 58
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "(?is)\\b"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "_text\\s*:\\s*([\'\"])(.*?)\\1"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v12

    if-eqz v12, :cond_13f

    invoke-virtual {v11, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/streambundle/v38/TubeSources;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_140

    :cond_13f
    move-object v10, v8

    .line 59
    :goto_140
    invoke-virtual {v0, v5, v10}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4e

    .line 53
    :cond_145
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_18
.end method

.method public static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 18
    const-string v0, "\""

    :try_start_2
    new-instance v1, Lorg/json/JSONTokener;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\\\'"

    const-string v4, "\'"

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\\""

    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2e} :catch_2f

    return-object p0

    :catch_2f
    move-exception v0

    const-string v0, "\\/"

    const-string v1, "/"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\u0026"

    const-string v1, "&"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\u003d"

    const-string v1, "="

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
