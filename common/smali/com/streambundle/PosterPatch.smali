.class public final Lcom/streambundle/PosterPatch;
.super Ljava/lang/Object;
.source "PosterPatch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/PosterPatch$Choice;
    }
.end annotation


# static fields
.field private static final CACHE:Ljava/util/Map;
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

    .line 5
    new-instance v0, Lcom/streambundle/PosterPatch$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x80

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/PosterPatch$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/PosterPatch;->CACHE:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 11
    const-string v0, ""

    if-eqz p1, :cond_54

    :try_start_4
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

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_54

    const-string v1, "data:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_54

    const-string v1, "javascript:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_54

    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    const-string p1, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4e

    const-string p1, "http"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_54

    :cond_4e
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_52} :catch_53

    goto :goto_54

    :catch_53
    move-exception p0

    :cond_54
    :goto_54
    return-object v0
.end method

.method static attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 8
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string p1, "attr"

    invoke-static {p0, p1, v1, v0}, Lcom/streambundle/PosterPatch;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/PosterPatch;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static base(Ljava/lang/Object;)Ljava/lang/String;
    .registers 4

    .line 10
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Class;

    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "baseUri"

    invoke-static {p0, v2, v1, v0}, Lcom/streambundle/PosterPatch;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/PosterPatch;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bestCard(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 16
    new-instance v0, Lcom/streambundle/PosterPatch$Choice;

    invoke-direct {v0}, Lcom/streambundle/PosterPatch$Choice;-><init>()V

    invoke-static {v0, p0, p2}, Lcom/streambundle/PosterPatch;->candidates(Lcom/streambundle/PosterPatch$Choice;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "img, picture source"

    invoke-static {p0, v1}, Lcom/streambundle/PosterPatch;->select(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lcom/streambundle/PosterPatch;->candidates(Lcom/streambundle/PosterPatch$Choice;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_12

    :cond_20
    iget-object p0, v0, Lcom/streambundle/PosterPatch$Choice;->url:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_40

    const-string p0, "img, picture source, [style*=background]"

    invoke-static {p1, p0}, Lcom/streambundle/PosterPatch;->select(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_32
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_40

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1, p2}, Lcom/streambundle/PosterPatch;->candidates(Lcom/streambundle/PosterPatch$Choice;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_32

    :cond_40
    iget-object p0, v0, Lcom/streambundle/PosterPatch$Choice;->url:Ljava/lang/String;

    return-object p0
.end method

.method static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_d

    return-object p0

    :catch_d
    move-exception p0

    const/4 p0, 0x0

    return-object p0
.end method

.method static candidates(Lcom/streambundle/PosterPatch$Choice;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 12

    .line 15
    const-string v7, "poster"

    const-string v8, "content"

    const-string v0, "data-original"

    const-string v1, "data-src"

    const-string v2, "data-lazy-src"

    const-string v3, "data-webp"

    const-string v4, "data-thumb"

    const-string v5, "data-poster"

    const-string v6, "src"

    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_19
    const/16 v4, 0x9

    if-ge v2, v4, :cond_2e

    aget-object v4, v0, v2

    invoke-static {p1, v4}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v5, v3, 0x1

    rsub-int/lit8 v3, v3, 0x19

    invoke-virtual {p0, p1, p2, v4, v3}, Lcom/streambundle/PosterPatch$Choice;->add(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;I)V

    add-int/lit8 v2, v2, 0x1

    move v3, v5

    goto :goto_19

    :cond_2e
    const-string v0, "data-srcset"

    const-string v2, "srcset"

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    :goto_37
    const/4 v3, 0x1

    const/4 v4, 0x2

    if-ge v2, v4, :cond_64

    aget-object v4, v0, v2

    invoke-static {p1, v4}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    sub-int/2addr v5, v3

    :goto_49
    if-ltz v5, :cond_61

    aget-object v3, v4, v5

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v6, "\\s+"

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    const/16 v6, 0x1e

    invoke-virtual {p0, p1, p2, v3, v6}, Lcom/streambundle/PosterPatch$Choice;->add(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;I)V

    add-int/lit8 v5, v5, -0x1

    goto :goto_49

    :cond_61
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    :cond_64
    const-string v0, "url\\(\\s*[\'\"]?([^)\'\"]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const-string v1, "style"

    invoke-static {p1, v1}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_83

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/streambundle/PosterPatch$Choice;->add(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;I)V

    :cond_83
    return-void
.end method

.method public static detail(Ljava/lang/Object;)Ljava/lang/String;
    .registers 7

    .line 17
    invoke-static {p0}, Lcom/streambundle/PosterPatch;->base(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/streambundle/PosterPatch$Choice;

    invoke-direct {v1}, Lcom/streambundle/PosterPatch$Choice;-><init>()V

    const-string v2, "meta[property=og:image], meta[name=twitter:image], video[poster], .large-screenshot img, .large-screenimg img, .video-player img, .player img"

    invoke-static {p0, v2}, Lcom/streambundle/PosterPatch;->select(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/streambundle/PosterPatch;->candidates(Lcom/streambundle/PosterPatch$Choice;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_13

    :cond_21
    iget-object p0, v1, Lcom/streambundle/PosterPatch$Choice;->url:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2c

    iget-object p0, v1, Lcom/streambundle/PosterPatch$Choice;->url:Ljava/lang/String;

    return-object p0

    :cond_2c
    :try_start_2c
    const-string p0, "com.streambundleextra.MediaFix"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v1, "cachedPoster"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {p0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object v0, v1, v5

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/PosterPatch;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/PosterPatch;->valid(Ljava/lang/String;)Z

    move-result v0
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_51} :catch_54

    if-eqz v0, :cond_55

    return-object p0

    :catch_54
    move-exception p0

    :cond_55
    const-string p0, ""

    return-object p0
.end method

.method public static detailResponse(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 24
    if-eqz p1, :cond_38

    invoke-static {p1}, Lcom/streambundle/PosterPatch;->base(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/PosterPatch;->jav(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-static {p1}, Lcom/streambundle/PosterPatch;->detail(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_35

    sget-object v0, Lcom/streambundle/PosterPatch;->CACHE:Ljava/util/Map;

    const-string v1, "Url"

    invoke-static {p0, v1}, Lcom/streambundle/PosterPatch;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/PosterPatch;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/PosterPatch;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "PosterUrl"

    const-class v1, Ljava/lang/String;

    invoke-static {p0, v0, v1, p1}, Lcom/streambundle/PosterPatch;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    const-string v0, "BackgroundPosterUrl"

    invoke-static {p0, v0, v1, p1}, Lcom/streambundle/PosterPatch;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    :cond_35
    invoke-static {p0}, Lcom/streambundle/PosterPatch;->response(Ljava/lang/Object;)V

    :cond_38
    return-void
.end method

.method static jav(Ljava/lang/String;)Z
    .registers 3

    .line 18
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1e

    const-string v1, "jav.guru"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    const-string v1, ".jav.guru"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_19} :catch_1d

    if-eqz p0, :cond_1e

    :cond_1b
    const/4 v0, 0x1

    goto :goto_1e

    :catch_1d
    move-exception p0

    :cond_1e
    :goto_1e
    return v0
.end method

.method public static javCards(Ljava/lang/Object;)Ljava/util/List;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 20
    const-class v0, Ljava/lang/String;

    invoke-static {p0}, Lcom/streambundle/PosterPatch;->base(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/PosterPatch;->jav(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    :try_start_18
    const-string v4, "com.example.websites.WebVideoParser$Card"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x3

    new-array v6, v5, [Ljava/lang/Class;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v8, 0x1

    aput-object v0, v6, v8

    const/4 v9, 0x2

    aput-object v0, v6, v9

    invoke-virtual {v4, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    const-string v4, ".column, .thumbnail, article"

    invoke-static {p0, v4}, Lcom/streambundle/PosterPatch;->select(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_38
    :goto_38
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b5

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    const-string v6, ".grid1 h2 a[href], .related-title a[href], h2 a[href], .imgg a[href]"

    invoke-static {v4, v6}, Lcom/streambundle/PosterPatch;->select(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_38

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    const-string v10, "href"

    invoke-static {v6, v10}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v1, v10}, Lcom/streambundle/PosterPatch;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/streambundle/PosterPatch;->jav(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_38

    invoke-static {v10}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v11

    invoke-virtual {v11}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v11

    const-string v12, "/\\d+/.*"

    invoke-virtual {v11, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_38

    invoke-interface {v3, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_38

    const-string v11, "text"

    new-array v12, v7, [Ljava/lang/Class;

    new-array v13, v7, [Ljava/lang/Object;

    invoke-static {v6, v11, v12, v13}, Lcom/streambundle/PosterPatch;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Lcom/streambundle/PosterPatch;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_92

    const-string v11, "title"

    invoke-static {v6, v11}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    :cond_92
    invoke-static {v6, v4, v1}, Lcom/streambundle/PosterPatch;->bestCard(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_a5

    sget-object v6, Lcom/streambundle/PosterPatch;->CACHE:Ljava/util/Map;

    invoke-static {v10}, Lcom/streambundle/PosterPatch;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v6, v12, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a5
    new-array v6, v5, [Ljava/lang/Object;

    aput-object v11, v6, v7

    aput-object v10, v6, v8

    aput-object v4, v6, v9

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_b4
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_18 .. :try_end_b4} :catch_b6

    goto :goto_38

    :cond_b5
    return-object v2

    :catch_b6
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "JAVGuru: \u043e\u0448\u0438\u0431\u043a\u0430 \u043e\u0431\u0440\u0430\u0431\u043e\u0442\u043a\u0438 \u043e\u0431\u043b\u043e\u0436\u0435\u043a"

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 19
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    const-string v4, "^www\\."

    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v3, "/+$"

    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    move-exception v0

    :goto_2d
    return-object p0
.end method

.method static number(Ljava/lang/String;)I
    .registers 3

    .line 13
    :try_start_0
    const-string v0, "[^0-9]"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_d

    return p0

    :catch_d
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method static read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "get"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Class;

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, p1, v1, v0}, Lcom/streambundle/PosterPatch;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static response(Ljava/lang/Object;)V
    .registers 4

    .line 23
    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/streambundle/PosterPatch;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/PosterPatch;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/PosterPatch;->jav(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_11

    return-void

    :cond_11
    sget-object v1, Lcom/streambundle/PosterPatch;->CACHE:Ljava/util/Map;

    invoke-static {v0}, Lcom/streambundle/PosterPatch;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_26

    const-string v1, "PosterUrl"

    const-class v2, Ljava/lang/String;

    invoke-static {p0, v1, v2, v0}, Lcom/streambundle/PosterPatch;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    :cond_26
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v1, "Referer"

    const-string v2, "https://jav.guru/"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "User-Agent"

    const-string v2, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "PosterHeaders"

    const-class v2, Ljava/util/Map;

    invoke-static {p0, v1, v2, v0}, Lcom/streambundle/PosterPatch;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    return-void
.end method

.method static select(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v4

    const-string p1, "select"

    invoke-static {p0, p1, v2, v1}, Lcom/streambundle/PosterPatch;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/lang/Iterable;

    if-eqz p1, :cond_2f

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_21
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_21

    :cond_2f
    return-object v0
.end method

.method static string(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 7
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_9
    return-object p0
.end method

.method static valid(Ljava/lang/String;)Z
    .registers 3

    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2a

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, ".*(?:flagcdn|flagpedia|countryflags|gtranslate|flagscdn|/flag[-_/]|/flags?/|flag-icons|/emoji/|/emoticons/|/icons?/|/avatars?/|placeholder|blank\\.|no-thumb|bg_private_video|/logo[.-]|logofinal).* "

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2a

    const-string v0, ".svg"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2a

    const-string v0, "data:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_2a

    const/4 v1, 0x1

    :cond_2a
    return v1
.end method

.method static write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 7
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
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "set"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    new-array p2, v0, [Ljava/lang/Object;

    aput-object p3, p2, v2

    invoke-static {p0, p1, v1, p2}, Lcom/streambundle/PosterPatch;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
