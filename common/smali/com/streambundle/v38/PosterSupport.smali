.class final Lcom/streambundle/v38/PosterSupport;
.super Ljava/lang/Object;
.source "PosterSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/PosterSupport$Poster;
    }
.end annotation


# static fields
.field private static final ATTRIBUTES:[Ljava/lang/String;

.field private static final BACKGROUND:Ljava/util/regex/Pattern;

.field private static final CARD:Ljava/lang/String; = "article, .video-item, .video-card, .video-block, .card, .cards__item, .item, .thumb, .thumbnail, .vid_li, figure, [data-video-id]"

.field private static final DETAILS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/PosterSupport$Poster;",
            ">;"
        }
    .end annotation
.end field

.field private static final INVALID_PATH:Ljava/util/regex/Pattern;

.field private static final LIMIT:I = 0x600

.field private static final LISTING:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/PosterSupport$Poster;",
            ">;"
        }
    .end annotation
.end field

.field private static final PICTURES:Ljava/lang/String; = "img, picture source, [data-poster], [data-thumb], [data-thumbnail], [data-preview], [data-image], [data-background-image], [style*=background]"


# direct methods
.method static constructor <clinit>()V
    .registers 13

    .line 15
    nop

    .line 16
    nop

    .line 17
    const-string v11, "src"

    const-string v12, "poster"

    const-string v0, "data-original"

    const-string v1, "data-src"

    const-string v2, "data-lazy-src"

    const-string v3, "data-lazy"

    const-string v4, "data-webp"

    const-string v5, "data-thumb"

    const-string v6, "data-thumbnail"

    const-string v7, "data-poster"

    const-string v8, "data-image"

    const-string v9, "data-preview"

    const-string v10, "data-background-image"

    filled-new-array/range {v0 .. v12}, [Ljava/lang/String;

    move-result-object v0

    .line 15
    sput-object v0, Lcom/streambundle/v38/PosterSupport;->ATTRIBUTES:[Ljava/lang/String;

    .line 18
    const-string v0, "(?i)url\\(\\s*[\'\"]?([^\'\")]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/PosterSupport;->BACKGROUND:Ljava/util/regex/Pattern;

    .line 19
    const-string v0, "(?i)(?:^|/)(?:blank|pixel|spacer|placeholder|no[-_]?(?:image|thumb|poster|preview)|default[-_]?(?:image|thumb|poster|preview)|loading|transparent|logo|avatar|flag|icons?)(?:[._/-]|$)|/(?:avatars?|flags?|icons?)/|\\.(?:svg|mp4|m3u8|webm|mpd)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/PosterSupport;->INVALID_PATH:Ljava/util/regex/Pattern;

    .line 24
    invoke-static {}, Lcom/streambundle/v38/PosterSupport;->cache()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/PosterSupport;->LISTING:Ljava/util/Map;

    .line 25
    invoke-static {}, Lcom/streambundle/v38/PosterSupport;->cache()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/PosterSupport;->DETAILS:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attributes(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 122
    const-string v0, "data-srcset"

    const-string v1, "srcset"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_a
    const/4 v3, 0x2

    if-lt v2, v3, :cond_45

    .line 126
    sget-object v3, Lcom/streambundle/v38/PosterSupport;->ATTRIBUTES:[Ljava/lang/String;

    array-length v4, v3

    :goto_10
    if-lt v1, v4, :cond_31

    .line 130
    sget-object v0, Lcom/streambundle/v38/PosterSupport;->BACKGROUND:Ljava/util/regex/Pattern;

    const-string v1, "style"

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 131
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_2e

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/streambundle/v38/PosterSupport;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_30

    :cond_2e
    const-string p0, ""

    :goto_30
    return-object p0

    .line 126
    :cond_31
    aget-object v0, v3, v1

    .line 127
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/streambundle/v38/PosterSupport;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 128
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_42

    return-object v0

    .line 126
    :cond_42
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 122
    :cond_45
    aget-object v3, v0, v2

    .line 123
    invoke-virtual {p0, v3}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/streambundle/v38/PosterSupport;->srcset(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 124
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_56

    return-object v3

    .line 122
    :cond_56
    add-int/lit8 v2, v2, 0x1

    goto :goto_a
.end method

.method private static cache()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/PosterSupport$Poster;",
            ">;"
        }
    .end annotation

    .line 41
    new-instance v0, Lcom/streambundle/v38/PosterSupport$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x80

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/v38/PosterSupport$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method static document(Lorg/jsoup/nodes/Document;)V
    .registers 10

    .line 77
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    .line 78
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v1

    .line 79
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_f

    move-object v1, v0

    .line 80
    :cond_f
    nop

    .line 81
    const-string v2, "a[href]"

    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v2, 0x0

    move v3, v2

    :goto_1c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_24

    goto/16 :goto_98

    :cond_24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 82
    const/16 v5, 0xb4

    if-ge v2, v5, :cond_98

    add-int/lit8 v5, v3, 0x1

    const/16 v6, 0x258

    if-lt v3, v6, :cond_35

    goto :goto_98

    .line 83
    :cond_35
    const-string v3, "nav, header, footer, .navigation"

    invoke-virtual {v4, v3}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_3e

    goto :goto_96

    .line 84
    :cond_3e
    const-string v3, "href"

    invoke-virtual {v4, v3}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 85
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_96

    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5d

    goto :goto_96

    .line 86
    :cond_5d
    invoke-static {v4, v0}, Lcom/streambundle/v38/PosterSupport;->picture(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 87
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_79

    .line 88
    const-string v7, "article, .video-item, .video-card, .video-block, .card, .cards__item, .item, .thumb, .thumbnail, .vid_li, figure, [data-video-id]"

    invoke-virtual {v4, v7}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    .line 89
    if-eqz v4, :cond_79

    invoke-static {v4, v0, v3}, Lcom/streambundle/v38/PosterSupport;->singleTarget(Lorg/jsoup/nodes/Element;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_79

    invoke-static {v4, v0}, Lcom/streambundle/v38/PosterSupport;->picture(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 91
    :cond_79
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_80

    goto :goto_96

    .line 92
    :cond_80
    sget-object v4, Lcom/streambundle/v38/PosterSupport;->LISTING:Ljava/util/Map;

    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/streambundle/v38/PosterSupport$Poster;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v8

    invoke-direct {v7, v6, v1, v8}, Lcom/streambundle/v38/PosterSupport$Poster;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    add-int/lit8 v2, v2, 0x1

    move v3, v5

    goto :goto_1c

    .line 81
    :cond_96
    :goto_96
    move v3, v5

    goto :goto_1c

    .line 95
    :cond_98
    :goto_98
    return-void
.end method

.method static listing(Ljava/lang/String;)Lcom/streambundle/v38/PosterSupport$Poster;
    .registers 2

    .line 61
    sget-object v0, Lcom/streambundle/v38/PosterSupport;->LISTING:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/streambundle/v38/PosterSupport$Poster;

    return-object p0
.end method

.method static loaded(Ljava/lang/String;)Lcom/streambundle/v38/PosterSupport$Poster;
    .registers 2

    .line 62
    sget-object v0, Lcom/streambundle/v38/PosterSupport;->DETAILS:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/streambundle/v38/PosterSupport$Poster;

    return-object p0
.end method

.method static picture(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 110
    invoke-static {p0, p1}, Lcom/streambundle/v38/PosterSupport;->attributes(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 111
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_b

    return-object v0

    .line 112
    :cond_b
    const-string v0, "img, picture source, [data-poster], [data-thumb], [data-thumbnail], [data-preview], [data-image], [data-background-image], [style*=background]"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_15
    :goto_15
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 118
    const-string p0, ""

    return-object p0

    .line 112
    :cond_1e
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 113
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->className()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 114
    const-string v2, ".*(?:avatar|emoji|flag|icon|logo).*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_37

    goto :goto_15

    .line 115
    :cond_37
    invoke-static {v0, p1}, Lcom/streambundle/v38/PosterSupport;->attributes(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_15

    return-object v0
.end method

.method static referer(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 158
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    .line 159
    invoke-static {p1}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p1

    .line 160
    const-string v0, ""

    if-eqz p0, :cond_6a

    if-nez p1, :cond_f

    goto :goto_6a

    .line 161
    :cond_f
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-nez v1, :cond_1c

    return-object v0

    .line 162
    :cond_1c
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 163
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->port()I

    move-result v1

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->port()I

    move-result p1

    if-ne v1, p1, :cond_44

    .line 162
    const/4 p1, 0x1

    goto :goto_45

    :cond_44
    const/4 p1, 0x0

    .line 164
    :goto_45
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Lokhttp3/HttpUrl$Builder;->username(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Lokhttp3/HttpUrl$Builder;->password(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lokhttp3/HttpUrl$Builder;->fragment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p0

    .line 165
    if-nez p1, :cond_61

    const-string p1, "/"

    invoke-virtual {p0, p1}, Lokhttp3/HttpUrl$Builder;->encodedPath(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lokhttp3/HttpUrl$Builder;->query(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    .line 166
    :cond_61
    invoke-virtual {p0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 160
    :cond_6a
    :goto_6a
    return-object v0
.end method

.method static rememberLoaded(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 8

    .line 65
    if-eqz p0, :cond_48

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_48

    .line 66
    :cond_9
    const-string v0, "PosterUrl"

    invoke-static {p1, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 67
    invoke-static {p0, v0}, Lcom/streambundle/v38/PosterSupport;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_47

    .line 69
    const-string v1, "Url"

    invoke-static {p1, v1}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 70
    sget-object v2, Lcom/streambundle/v38/PosterSupport;->DETAILS:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/streambundle/v38/PosterSupport$Poster;

    .line 71
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_36

    goto :goto_37

    :cond_36
    move-object p0, v1

    .line 72
    :goto_37
    const-string v1, "PosterHeaders"

    invoke-static {p1, v1}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->headers(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {v4, v0, p0, p1}, Lcom/streambundle/v38/PosterSupport$Poster;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 70
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    :cond_47
    return-void

    .line 65
    :cond_48
    :goto_48
    return-void
.end method

.method static removeHeader(Ljava/util/Map;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 176
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 177
    nop

    :cond_9
    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_10

    .line 178
    return-void

    .line 177
    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    goto :goto_9
.end method

.method static resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 56
    const-string v0, ""

    if-nez p1, :cond_6

    move-object p1, v0

    goto :goto_1e

    .line 57
    :cond_6
    const-string v1, "\\u0026"

    const-string v2, "&"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\u002f"

    const-string v2, "/"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\u003d"

    const-string v2, "="

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 56
    :goto_1e
    invoke-static {p0, p1}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 58
    invoke-static {p0}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_29

    move-object v0, p0

    :cond_29
    return-object v0
.end method

.method static sameHost(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    .line 170
    const/4 v0, 0x0

    if-eqz p0, :cond_23

    if-nez p1, :cond_6

    goto :goto_23

    .line 171
    :cond_6
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    invoke-static {p1}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p1

    .line 172
    if-eqz p0, :cond_22

    if-eqz p1, :cond_22

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_22

    const/4 p0, 0x1

    return p0

    :cond_22
    return v0

    .line 170
    :cond_23
    :goto_23
    return v0
.end method

.method private static singleTarget(Lorg/jsoup/nodes/Element;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5

    .line 98
    invoke-static {p2}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 99
    const-string v0, "a[href]"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_e
    :goto_e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_16

    .line 106
    const/4 p0, 0x1

    return p0

    .line 99
    :cond_16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 100
    const-string v1, "href"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_e

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_37

    goto :goto_e

    .line 102
    :cond_37
    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    .line 103
    if-eqz v0, :cond_4a

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "(?i)^/(?:tags?|categor(?:y|ies)|models?|channels?|users?)(?:/.*)?"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4a

    goto :goto_e

    .line 104
    :cond_4a
    const/4 p0, 0x0

    return p0
.end method

.method private static srcset(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    invoke-static {p0, p1}, Lcom/streambundle/v38/ThumbnailSize;->choose(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static valid(Ljava/lang/String;)Z
    .registers 4

    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->videoEndpoint(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    return v0

    .line 49
    :cond_8
    const/4 v0, 0x0

    if-eqz p0, :cond_37

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_12

    goto :goto_37

    .line 50
    :cond_12
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    .line 51
    if-eqz p0, :cond_36

    sget-object v1, Lcom/streambundle/v38/PosterSupport;->INVALID_PATH:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_36

    .line 52
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    const-string v1, "(?i).*(?:flagcdn|flagpedia|countryflags|gtranslate).*"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_36

    .line 51
    const/4 p0, 0x1

    return p0

    :cond_36
    return v0

    .line 49
    :cond_37
    :goto_37
    return v0
.end method
