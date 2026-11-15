.class public final Lcom/streambundle/v38/SearchAndPosters;
.super Ljava/lang/Object;
.source "SearchAndPosters.java"


# static fields
.field private static final CYRILLIC:Ljava/util/regex/Pattern;

.field private static final LATIN:Ljava/util/regex/Pattern;

.field private static final SHOWN:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/PosterSupport$Poster;",
            ">;"
        }
    .end annotation
.end field

.field private static final WORDS:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 16
    const-string v0, "\\p{IsCyrillic}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/SearchAndPosters;->CYRILLIC:Ljava/util/regex/Pattern;

    .line 17
    const-string v0, "\\p{IsLatin}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/SearchAndPosters;->LATIN:Ljava/util/regex/Pattern;

    .line 18
    const-string v0, "[\\p{L}\\p{N}]+(?:[ .\u2019\'_\\-]+[\\p{L}\\p{N}]+)*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/SearchAndPosters;->WORDS:Ljava/util/regex/Pattern;

    .line 21
    new-instance v0, Lcom/streambundle/v38/SearchAndPosters$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/v38/SearchAndPosters$1;-><init>(IFZ)V

    .line 20
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/SearchAndPosters;->SHOWN:Ljava/util/Map;

    .line 25
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static local(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 37
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\s+"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 38
    invoke-static {p0, p1}, Lcom/streambundle/v43/QueryWords;->local(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2d

    const-string v1, "en"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1f

    goto :goto_2d

    .line 40
    :cond_1f
    const-string p1, "(?iu)\u043f\u043e\u0440\u043a[\u0430\u0443\u0435\u0438\u043e\u0439]+|\u0448\u043b\u044c\u043e\u043f\u043a\u0438"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2a

    const-string p0, "spanking"

    goto :goto_2c

    :cond_2a
    const-string p0, ""

    :goto_2c
    return-object p0

    .line 39
    :cond_2d
    :goto_2d
    return-object v0
.end method

.method public static reusePoster(Ljava/lang/Object;)V
    .registers 9

    .line 83
    if-nez p0, :cond_3

    return-void

    .line 84
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 85
    const-string v1, "LoadResponse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "SearchResponse"

    if-nez v1, :cond_1c

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1c

    return-void

    .line 86
    :cond_1c
    const-string v1, "Url"

    invoke-static {p0, v1}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2d

    return-void

    .line 88
    :cond_2d
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ApiName"

    invoke-static {p0, v4}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 89
    const-string v4, "PosterUrl"

    invoke-static {p0, v4}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 90
    const-string v6, "PosterHeaders"

    invoke-static {p0, v6}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lcom/streambundle/v38/BundleMetadata;->headers(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v7

    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7d

    .line 92
    invoke-static {v5}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_7c

    sget-object p0, Lcom/streambundle/v38/SearchAndPosters;->SHOWN:Ljava/util/Map;

    new-instance v0, Lcom/streambundle/v38/PosterSupport$Poster;

    invoke-direct {v0, v5, v1, v7}, Lcom/streambundle/v38/PosterSupport$Poster;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p0, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    :cond_7c
    return-void

    .line 95
    :cond_7d
    sget-object v0, Lcom/streambundle/v38/SearchAndPosters;->SHOWN:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundle/v38/PosterSupport$Poster;

    .line 96
    const-string v2, "BackgroundPosterUrl"

    if-eqz v0, :cond_a4

    .line 97
    const-class v1, Ljava/lang/String;

    iget-object v3, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {p0, v4, v1, v3}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 98
    const-class v1, Ljava/lang/String;

    iget-object v3, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {p0, v2, v1, v3}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 99
    const-class v1, Ljava/util/Map;

    new-instance v2, Ljava/util/LinkedHashMap;

    iget-object v0, v0, Lcom/streambundle/v38/PosterSupport$Poster;->headers:Ljava/util/Map;

    invoke-direct {v2, v0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-static {p0, v6, v1, v2}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 100
    return-void

    .line 102
    :cond_a4
    invoke-static {v1}, Lcom/streambundle/v38/PosterSupport;->listing(Ljava/lang/String;)Lcom/streambundle/v38/PosterSupport$Poster;

    move-result-object v0

    .line 103
    if-eqz v0, :cond_106

    iget-object v1, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {v1}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b3

    goto :goto_106

    .line 104
    :cond_b3
    invoke-static {v5}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ca

    iget-object v1, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_ca

    .line 105
    iget-object v1, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {v5, v1}, Lcom/streambundle/v38/PosterSupport;->sameHost(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_ca

    return-void

    .line 106
    :cond_ca
    iget-object v1, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {v5, v1}, Lcom/streambundle/v38/PosterSupport;->sameHost(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_dc

    .line 107
    const-string v1, "Cookie"

    invoke-static {v7, v1}, Lcom/streambundle/v38/PosterSupport;->removeHeader(Ljava/util/Map;Ljava/lang/String;)V

    .line 108
    const-string v1, "Authorization"

    invoke-static {v7, v1}, Lcom/streambundle/v38/PosterSupport;->removeHeader(Ljava/util/Map;Ljava/lang/String;)V

    .line 110
    :cond_dc
    const-string v1, "Referer"

    invoke-static {v7, v1}, Lcom/streambundle/v38/PosterSupport;->removeHeader(Ljava/util/Map;Ljava/lang/String;)V

    .line 111
    iget-object v3, v0, Lcom/streambundle/v38/PosterSupport$Poster;->page:Ljava/lang/String;

    iget-object v5, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {v3, v5}, Lcom/streambundle/v38/PosterSupport;->referer(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 112
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_f2

    invoke-interface {v7, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    :cond_f2
    const-class v1, Ljava/lang/String;

    iget-object v3, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {p0, v4, v1, v3}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 114
    const-class v1, Ljava/lang/String;

    iget-object v0, v0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {p0, v2, v1, v0}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 115
    const-class v0, Ljava/util/Map;

    invoke-static {p0, v6, v0, v7}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 116
    return-void

    .line 103
    :cond_106
    :goto_106
    return-void
.end method

.method public static target(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 31
    sget-object v0, Lcom/streambundle/v38/SearchAndPosters;->WORDS:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_3f

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x78

    if-le v0, v2, :cond_1b

    goto :goto_3f

    .line 32
    :cond_1b
    sget-object v0, Lcom/streambundle/v38/SearchAndPosters;->CYRILLIC:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_2a

    const-string p0, "en"

    return-object p0

    .line 33
    :cond_2a
    sget-object v0, Lcom/streambundle/v38/SearchAndPosters;->LATIN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_3e

    invoke-static {p0}, Lcom/streambundle/v38/BundleSettings;->isRussianSource(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3e

    const-string v1, "ru"

    :cond_3e
    return-object v1

    .line 31
    :cond_3f
    :goto_3f
    return-object v1
.end method

.method public static ukCards(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            ")",
            "Ljava/util/List<",
            "Lcom/example/websites/WebVideoParser$Card;",
            ">;"
        }
    .end annotation

    .line 46
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_d} :catch_130

    .line 47
    nop

    .line 50
    const-string v2, "ukdevilz.com"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1f

    const-string v3, "www.ukdevilz.com"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1f

    return-object v0

    .line 51
    :cond_1f
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 52
    const-string v3, "a[href*=/watch/]"

    invoke-virtual {p0, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2e
    :goto_2e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_35

    goto :goto_43

    :cond_35
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 53
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v5

    const/16 v6, 0x64

    if-lt v5, v6, :cond_54

    .line 79
    :goto_43
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_4a

    goto :goto_53

    :cond_4a
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_53
    return-object v0

    .line 54
    :cond_54
    const-string v5, "nav,header,footer,.related,.recommendations"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v5

    if-eqz v5, :cond_5d

    goto :goto_2e

    .line 55
    :cond_5d
    const-string v5, "href"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 56
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_6a

    goto :goto_2e

    .line 59
    :cond_6a
    :try_start_6a
    invoke-static {v5}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v6
    :try_end_6e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6a .. :try_end_6e} :catch_12d

    .line 60
    nop

    .line 63
    invoke-virtual {v6}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2e

    invoke-virtual {v6}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v7

    const-string v8, "(?i)^www\\."

    const-string v9, ""

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2e

    .line 64
    invoke-virtual {v6}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v6

    const-string v7, "/watch/"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_94

    goto :goto_2e

    .line 65
    :cond_94
    const-string v6, "img"

    invoke-virtual {v4, v6}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    .line 66
    if-nez v7, :cond_aa

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v8

    if-eqz v8, :cond_aa

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v7

    invoke-virtual {v7, v6}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    .line 67
    :cond_aa
    const-string v6, "title"

    invoke-virtual {v4, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 68
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_c4

    const-string v6, "aria-label"

    invoke-virtual {v4, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 69
    :cond_c4
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_d6

    if-eqz v7, :cond_d6

    const-string v6, "alt"

    invoke-virtual {v7, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 70
    :cond_d6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_e4

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 71
    :cond_e4
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_ec

    goto/16 :goto_2e

    .line 72
    :cond_ec
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/streambundle/v38/PosterSupport;->picture(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 73
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_104

    if-eqz v7, :cond_104

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/streambundle/v38/PosterSupport;->picture(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 74
    :cond_104
    invoke-static {v5}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 75
    invoke-interface {v1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/example/websites/WebVideoParser$Card;

    .line 76
    if-eqz v8, :cond_11c

    invoke-virtual {v8}, Lcom/example/websites/WebVideoParser$Card;->getPoster()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_2e

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_2e

    .line 77
    :cond_11c
    new-instance v8, Lcom/example/websites/WebVideoParser$Card;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_125

    move-object v4, v0

    :cond_125
    invoke-direct {v8, v6, v5, v4}, Lcom/example/websites/WebVideoParser$Card;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2e

    .line 60
    :catch_12d
    move-exception v4

    .line 61
    goto/16 :goto_2e

    .line 47
    :catch_130
    move-exception p0

    .line 48
    return-object v0
.end method
