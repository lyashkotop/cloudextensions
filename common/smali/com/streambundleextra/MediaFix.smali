.class public final Lcom/streambundleextra/MediaFix;
.super Ljava/lang/Object;
.source "MediaFix.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundleextra/MediaFix$SearchCard;
    }
.end annotation


# static fields
.field private static final MEDIA:Ljava/util/regex/Pattern;

.field private static final POSTERS:Ljava/util/Map;
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

    .line 12
    new-instance v0, Lcom/streambundleextra/MediaFix$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x80

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundleextra/MediaFix$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundleextra/MediaFix;->POSTERS:Ljava/util/Map;

    .line 27
    const-string v0, "(?i)(?:\\.(?:mp4|m3u8|webm|m4v|mov)(?:[?#].*)?$|/get_file/)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundleextra/MediaFix;->MEDIA:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 29
    const-string v0, ""

    if-nez p1, :cond_5

    return-object v0

    .line 30
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\/"

    const-string v2, "/"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\u0026"

    const-string v3, "&"

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\u002F"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "&amp;"

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_70

    const-string v1, "data:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_70

    const-string v1, "javascript:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_70

    .line 32
    const-string v1, " "

    const-string v2, "%20"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 34
    :try_start_43
    new-instance v3, Ljava/net/URI;

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    .line 35
    const-string p1, "http"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_69

    const-string p1, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_69

    goto :goto_6d

    :cond_69
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_6d} :catch_6e

    :goto_6d
    return-object v0

    .line 36
    :catch_6e
    move-exception p0

    return-object v0

    .line 31
    :cond_70
    return-object v0
.end method

.method private static addSource(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5

    .line 293
    const-string v0, "function/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_39

    const-string v0, "/embed/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_39

    .line 294
    invoke-static {p1, p2}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 295
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_38

    sget-object p2, Lcom/streambundleextra/MediaFix;->MEDIA:Ljava/util/regex/Pattern;

    invoke-virtual {p2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/regex/Matcher;->find()Z

    move-result p2

    if-eqz p2, :cond_38

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    const-string p2, "source"

    invoke-virtual {p0, p2}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    const-string p2, "src"

    invoke-virtual {p0, p2, p1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    return-object p0

    .line 296
    :cond_38
    return-object v1

    .line 293
    :cond_39
    return-object v1
.end method

.method public static cachedPoster(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 25
    sget-object v0, Lcom/streambundleextra/MediaFix;->POSTERS:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundleextra/MediaFix;->pageKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_10

    const-string p0, ""

    :cond_10
    return-object p0
.end method

.method private static card(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 123
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_56

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_56

    .line 124
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    const-string v0, "article"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    const-string v0, "a"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    const-string v0, "href"

    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    const-string v0, "title"

    invoke-virtual {p0, v0, p2}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    .line 125
    const-string v1, "span"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/nodes/Element;->addClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/streambundlehtml/nodes/Element;->text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 126
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_55

    .line 127
    const-string p2, "img"

    invoke-virtual {p0, p2}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    const-string p2, "src"

    invoke-virtual {p0, p2, p3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p0

    const-string p2, "data-src"

    invoke-virtual {p0, p2, p3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 128
    sget-object p0, Lcom/streambundleextra/MediaFix;->POSTERS:Ljava/util/Map;

    invoke-static {p1}, Lcom/streambundleextra/MediaFix;->pageKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    :cond_55
    return-void

    .line 123
    :cond_56
    return-void
.end method

.method private static cardPoster(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-static {p0, p1, p2}, Lcom/streambundle/PosterPatch;->bestCard(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static container(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;
    .registers 4

    .line 105
    move-object v0, p0

    :goto_1
    if-eqz v0, :cond_69

    .line 106
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "article"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_68

    const-string v1, "item"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_68

    const-string v1, "thumb"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_68

    const-string v1, "video-block"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_68

    const-string v1, "video-item"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_68

    const-string v1, "post"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_68

    const-string v1, "genaral-post-item"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_68

    const-string v1, "thumbnail"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_68

    .line 107
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "body"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_69

    const-string v1, "list-videos"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_69

    const-string v1, "thumbs-items"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_69

    .line 105
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    goto :goto_1

    .line 106
    :cond_68
    return-object v0

    .line 109
    :cond_69
    return-object p0
.end method

.method private static decodeFile(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 215
    nop

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 217
    nop

    .line 218
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_38

    .line 219
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const-string v5, "\u0410\u0412\u0421D\u0415FGHIJKL\u041cNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,~"

    invoke-virtual {v5, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 220
    if-gez v4, :cond_1d

    goto :goto_35

    .line 221
    :cond_1d
    const/16 v5, 0x40

    if-ne v4, v5, :cond_22

    goto :goto_38

    .line 222
    :cond_22
    shl-int/lit8 v2, v2, 0x6

    or-int/2addr v2, v4

    add-int/lit8 v3, v3, 0x6

    .line 223
    const/16 v4, 0x8

    if-lt v3, v4, :cond_35

    add-int/lit8 v3, v3, -0x8

    shr-int v4, v2, v3

    and-int/lit16 v4, v4, 0xff

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 218
    :cond_35
    :goto_35
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 225
    :cond_38
    :goto_38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 226
    const-string v0, "%([0-9a-fA-F]{2})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 227
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 228
    :goto_4b
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_69

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    int-to-char v1, v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_4b

    .line 229
    :cond_69
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static varargs first(Lcom/streambundlehtml/nodes/Element;[Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 77
    if-eqz p0, :cond_2a

    array-length v0, p1

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v0, :cond_2a

    aget-object v2, p1, v1

    .line 78
    invoke-virtual {p0, v2}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 79
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_27

    const-string v3, "data:"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_27

    const-string v3, "javascript:"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_27

    return-object v2

    .line 77
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 81
    :cond_2a
    const-string p0, ""

    return-object p0
.end method

.method public static headers(Ljava/lang/String;)Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 72
    const-string v1, "User-Agent"

    const-string v2, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    const-string v1, "/"

    invoke-static {p0, v1}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "Referer"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    return-object v0
.end method

.method public static identity(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 17
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "^www\\."

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 18
    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v3, "/{2,}"

    const-string v4, "/"

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "/+$"

    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 19
    const-string v1, "^/videos?/(\\d+)(?:/|$)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_55

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/video/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 21
    :cond_55
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_66} :catch_67

    return-object p0

    .line 22
    :catch_67
    move-exception v0

    return-object p0
.end method

.method public static image(Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 14

    .line 89
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 90
    :cond_5
    const-string v10, "poster"

    const-string v11, "content"

    const-string v1, "data-original"

    const-string v2, "data-src"

    const-string v3, "data-lazy-src"

    const-string v4, "data-webp"

    const-string v5, "data-thumb"

    const-string v6, "data-poster"

    const-string v7, "data-srcset"

    const-string v8, "srcset"

    const-string v9, "src"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_21
    const/4 v4, 0x1

    const/16 v5, 0xb

    if-ge v3, v5, :cond_6d

    aget-object v5, v1, v3

    .line 91
    invoke-virtual {p0, v5}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 92
    const-string v7, "srcset"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5e

    .line 93
    const-string v5, ","

    invoke-virtual {v6, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 94
    array-length v6, v5

    sub-int/2addr v6, v4

    :goto_40
    if-ltz v6, :cond_69

    .line 95
    aget-object v4, v5, v6

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v7, "\\s+"

    invoke-virtual {v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    aget-object v4, v4, v2

    invoke-static {p1, v4}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 96
    invoke-static {v4}, Lcom/streambundleextra/MediaFix;->usableImage(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5b

    return-object v4

    .line 94
    :cond_5b
    add-int/lit8 v6, v6, -0x1

    goto :goto_40

    .line 98
    :cond_5e
    invoke-static {p1, v6}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundleextra/MediaFix;->usableImage(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_69

    return-object v4

    :cond_69
    nop

    .line 90
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    .line 100
    :cond_6d
    const-string v1, "url\\(\\s*[\'\"]?([^\'\"\\)]+)[\'\"]?\\s*\\)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    const-string v2, "style"

    invoke-virtual {p0, v2}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 101
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_96

    invoke-virtual {p0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundleextra/MediaFix;->usableImage(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_96

    return-object p0

    .line 102
    :cond_96
    return-object v0
.end method

.method public static isDirect(Ljava/lang/String;)Z
    .registers 2

    .line 291
    if-eqz p0, :cond_18

    const-string v0, "/embed/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_18

    sget-object v0, Lcom/streambundleextra/MediaFix;->MEDIA:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    goto :goto_19

    :cond_18
    const/4 p0, 0x0

    :goto_19
    return p0
.end method

.method private static jsonDocument(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 232
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, ""

    invoke-static {v2, v1}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v3

    .line 233
    const-string v4, "videos"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 234
    const/4 v7, 0x0

    const-string v8, "dir"

    const-string v9, "duration"

    const-string v10, "title"

    const-string v11, "/"

    if-eqz v4, :cond_c7

    .line 235
    nop

    :goto_1c
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v7, v0, :cond_1ac

    .line 236
    invoke-virtual {v4, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 237
    if-nez v0, :cond_2c

    const-wide/16 v16, 0x0

    goto/16 :goto_c3

    .line 238
    :cond_2c
    const-string v12, "video_id"

    invoke-virtual {v0, v12, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 239
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_3c

    const-wide/16 v16, 0x0

    goto/16 :goto_c3

    .line 240
    :cond_3c
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "/video/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v0, v8, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v10, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-wide/16 v16, 0x0

    invoke-static {v0, v1}, Lcom/streambundleextra/MediaFix;->jsonImage(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v13, v15, v5}, Lcom/streambundleextra/MediaFix;->card(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    invoke-virtual {v0, v9, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundleextra/VideoMetadata;->seconds(Ljava/lang/String;)J

    move-result-wide v5

    .line 242
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v0, v8, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 243
    invoke-static {v0, v5, v6}, Lcom/streambundleextra/VideoMetadata;->remember(Ljava/lang/String;J)V

    .line 244
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->children()Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->last()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 245
    if-eqz v0, :cond_c3

    cmp-long v12, v5, v16

    if-lez v12, :cond_c3

    const-string v12, "span"

    invoke-virtual {v0, v12}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/streambundlehtml/nodes/Element;->addClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-static {v5, v6}, Lcom/streambundleextra/VideoMetadata;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/streambundlehtml/nodes/Element;->text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 235
    :cond_c3
    :goto_c3
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1c

    .line 248
    :cond_c7
    const-wide/16 v16, 0x0

    const-string v4, "video"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 249
    if-eqz v4, :cond_d2

    move-object v0, v4

    .line 250
    :cond_d2
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    const-string v5, "meta"

    invoke-virtual {v4, v5}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    const-string v6, "og:title"

    const-string v12, "property"

    invoke-virtual {v4, v12, v6}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-virtual {v0, v10, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v13, "content"

    invoke-virtual {v4, v13, v6}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 251
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    const-string v6, "og:image"

    invoke-virtual {v4, v12, v6}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-static {v0, v1}, Lcom/streambundleextra/MediaFix;->jsonImage(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v13, v6}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 252
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    const-string v6, "name"

    const-string v14, "description"

    invoke-virtual {v4, v6, v14}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-virtual {v0, v14, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v6

    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Document;->text()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v13, v6}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 253
    invoke-virtual {v0, v9, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundleextra/VideoMetadata;->seconds(Ljava/lang/String;)J

    move-result-wide v14

    .line 254
    cmp-long v4, v14, v16

    if-lez v4, :cond_142

    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    const-string v5, "vb:duration"

    invoke-virtual {v4, v12, v5}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v13, v5}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 255
    :cond_142
    const-string v4, "categories"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 256
    if-eqz v4, :cond_1a9

    .line 257
    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 258
    :goto_14e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1a9

    .line 259
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 260
    if-eqz v6, :cond_1a8

    invoke-virtual {v6, v10, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_1a8

    .line 261
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v9

    const-string v12, "a"

    invoke-virtual {v9, v12}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v9

    const-string v12, "rel"

    const-string v13, "tag"

    invoke-virtual {v9, v12, v13}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v9

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "/categories/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6, v8, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v1, v12}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "href"

    invoke-virtual {v9, v13, v12}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v9

    invoke-virtual {v6, v10, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Lcom/streambundlehtml/nodes/Element;->text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 262
    :cond_1a8
    goto :goto_14e

    .line 264
    :cond_1a9
    invoke-static {v0, v3, v1, v7}, Lcom/streambundleextra/MediaFix;->jsonSources(Ljava/lang/Object;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;I)V

    .line 266
    :cond_1ac
    return-object v3
.end method

.method private static jsonImage(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 269
    const-string v5, "screen_url"

    const-string v6, "thumb_url"

    const-string v0, "thumb"

    const-string v1, "scr"

    const-string v2, "poster"

    const-string v3, "image"

    const-string v4, "screenshot"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_13
    const-string v2, ""

    const/4 v3, 0x7

    if-ge v1, v3, :cond_34

    aget-object v3, v0, v1

    .line 270
    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 271
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_31

    const-string v3, "null"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_31

    invoke-static {p1, v2}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 269
    :cond_31
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 273
    :cond_34
    return-object v2
.end method

.method private static jsonSources(Ljava/lang/Object;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 276
    const/16 v0, 0x8

    if-le p3, v0, :cond_5

    return-void

    .line 277
    :cond_5
    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_36

    .line 278
    check-cast p0, Lorg/json/JSONObject;

    .line 279
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 280
    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_35

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "pv"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    const-string v2, "thumbsrc"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, p3, 0x1

    invoke-static {v1, p1, p2, v2}, Lcom/streambundleextra/MediaFix;->jsonSources(Ljava/lang/Object;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;I)V

    goto :goto_f

    .line 281
    :cond_35
    goto :goto_5a

    :cond_36
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_4f

    .line 282
    check-cast p0, Lorg/json/JSONArray;

    const/4 v0, 0x0

    :goto_3d
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_59

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, p3, 0x1

    invoke-static {v1, p1, p2, v2}, Lcom/streambundleextra/MediaFix;->jsonSources(Ljava/lang/Object;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3d

    .line 283
    :cond_4f
    instance-of p3, p0, Ljava/lang/String;

    if-eqz p3, :cond_59

    check-cast p0, Ljava/lang/String;

    invoke-static {p1, p2, p0}, Lcom/streambundleextra/MediaFix;->addSource(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_5a

    :cond_59
    nop

    .line 284
    :goto_5a
    return-void
.end method

.method public static media(Lcom/streambundlehtml/nodes/Document;)V
    .registers 12

    invoke-static/range {p0 .. p0}, Lcom/streambundleextra/YouJizzSupport;->media(Lcom/streambundlehtml/nodes/Document;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 324
    :cond_7
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    const-string v1, "forcedcinema.net"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_49

    const-string v1, "[data-item]"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_49

    const-string v2, "data-item"

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :try_start_21
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "sources"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-eqz v4, :cond_47

    const/4 v5, 0x0

    :goto_2f
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_47

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-eqz v6, :cond_44

    const-string v7, "src"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p0, v0, v7}, Lcom/streambundleextra/MediaFix;->addSource(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    :cond_44
    add-int/lit8 v5, v5, 0x1

    goto :goto_2f
    :try_end_47
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_47} :catch_48

    :cond_47
    goto :goto_49

    :catch_48
    move-exception v2

    .line 325
    :cond_49
    :goto_49
    const-string v1, "video[src], source[src], a[href], iframe[src], video[data-src], source[data-src]"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_53
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "href"

    if-eqz v2, :cond_8d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 326
    const-string v4, "data-src"

    const-string v5, "src"

    filled-new-array {v4, v5, v3}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    :goto_6a
    const/4 v7, 0x3

    if-ge v6, v7, :cond_8c

    aget-object v7, v4, v6

    .line 327
    invoke-virtual {v2, v7}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 328
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_89

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_81

    move-object v7, v3

    goto :goto_82

    :cond_81
    move-object v7, v5

    :goto_82
    invoke-static {v0, v8}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 326
    :cond_89
    add-int/lit8 v6, v6, 0x1

    goto :goto_6a

    .line 330
    :cond_8c
    goto :goto_53

    .line 332
    :cond_8d
    const-string v1, "[\"\']([^\"\'\\s<>]+)[\"\']"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 333
    const-string v2, "video(?:_alt)?_url[0-9]*[\'\"]?\\s*:"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->html()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    .line 334
    const-string v4, "script"

    invoke-virtual {p0, v4}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v4

    invoke-virtual {v4}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_af
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_17c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    .line 335
    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->data()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 336
    const/4 v7, 0x1

    if-nez v2, :cond_d4

    :goto_c6
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_d4

    invoke-virtual {v6, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v0, v8}, Lcom/streambundleextra/MediaFix;->addSource(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_c6

    .line 337
    :cond_d4
    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    .line 338
    const-string v8, "[\"\']?([a-zA-Z0-9_]+)[\"\']?\\s*:\\s*[\'\"]([^\'\"]*)[\'\"]"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->data()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 339
    :goto_e7
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_fa

    invoke-virtual {v5, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x2

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e7

    .line 340
    :cond_fa
    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_102
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_17a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 341
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 342
    const-string v9, "(?:video(?:_alt)?_url[0-9]*|file|src)"

    invoke-virtual {v8, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_11d

    goto :goto_102

    .line 343
    :cond_11d
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "_text"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 344
    if-nez v9, :cond_151

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "_label"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 345
    :cond_151
    if-nez v9, :cond_15b

    const-string v9, "label"

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 346
    :cond_15b
    if-eqz v2, :cond_166

    const-string v10, "video"

    invoke-virtual {v8, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_166

    goto :goto_102

    .line 347
    :cond_166
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {p0, v0, v7}, Lcom/streambundleextra/MediaFix;->addSource(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v7

    if-eqz v7, :cond_179

    if-eqz v9, :cond_179

    const-string v8, "data-quality"

    invoke-virtual {v7, v8, v9}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 348
    :cond_179
    goto :goto_102

    .line 349
    :cond_17a
    goto/16 :goto_af

    .line 350
    :cond_17c
    const-string v1, "meta[property=og:video], meta[property=og:video:url], meta[property=og:video:secure_url], link[itemprop=contentUrl]"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_186
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 351
    const-string v4, "content"

    filled-new-array {v4, v3}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/streambundleextra/MediaFix;->first(Lcom/streambundlehtml/nodes/Element;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v2}, Lcom/streambundleextra/MediaFix;->addSource(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_186

    .line 352
    :cond_1a0
    return-void
.end method

.method public static mediaRequestUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-static {p0}, Lcom/streambundle/DetailFix;->mediaUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 63
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_63

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v2, "bdsmx.tube"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_63

    .line 65
    const-string v1, "^/video/(\\d+)(?:/|$)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 66
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_63

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, "://"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/api/videofile.php?video_id="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "&lifetime=8640000"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 68
    :cond_63
    return-object p0
.end method

.method private static pageKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 24
    invoke-static {p0}, Lcom/streambundleextra/MediaFix;->identity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 9

    .line 180
    const-string v0, ""

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_55

    .line 182
    :try_start_e
    invoke-static {v0, p1}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v1

    .line 183
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 184
    const/4 p0, 0x0

    :goto_18
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge p0, v3, :cond_4b

    .line 185
    invoke-virtual {v2, p0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 186
    if-nez v3, :cond_25

    goto :goto_48

    .line 187
    :cond_25
    const-string v4, "video_url"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 188
    const-string v5, "http"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_37

    invoke-static {v4}, Lcom/streambundleextra/MediaFix;->decodeFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 189
    :cond_37
    invoke-static {v1, p1, v4}, Lcom/streambundleextra/MediaFix;->addSource(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    .line 190
    if-eqz v4, :cond_48

    const-string v5, "data-quality"

    const-string v6, "format"

    invoke-virtual {v3, v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    :try_end_48
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_48} :catch_4c

    .line 184
    :cond_48
    :goto_48
    add-int/lit8 p0, p0, 0x1

    goto :goto_18

    .line 192
    :cond_4b
    return-object v1

    .line 193
    :catch_4c
    move-exception p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid video response"

    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 195
    :cond_55
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_74

    .line 196
    :try_start_61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/streambundleextra/MediaFix;->jsonDocument(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0
    :try_end_6a
    .catch Lorg/json/JSONException; {:try_start_61 .. :try_end_6a} :catch_6b

    return-object p0

    .line 197
    :catch_6b
    move-exception p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid media response"

    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 199
    :cond_74
    invoke-static {p0, p1}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    .line 200
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 201
    if-eqz v0, :cond_b3

    const-string v1, "#cf-error-details, .cf-error-details, #challenge-running, #challenge-form"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9a

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->title()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Just a moment..."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b3

    .line 202
    :cond_9a
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ": \u0441\u0430\u0439\u0442 \u0431\u043b\u043e\u043a\u0438\u0440\u0443\u0435\u0442 \u043f\u043e\u0434\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u0435 (Cloudflare). \u041e\u0431\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Cloudstream \u043d\u0435 \u0441\u043c\u043e\u0433 \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0443."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 203
    :cond_b3
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->title()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Loading..."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e4

    const-string v1, "form, video, iframe"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e4

    .line 204
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ": \u0441\u0430\u0439\u0442 \u0432\u0435\u0440\u043d\u0443\u043b \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0443 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0438 \u0432\u043c\u0435\u0441\u0442\u043e \u0432\u0438\u0434\u0435\u043e. \u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u0441\u0435\u0439\u0447\u0430\u0441 \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 205
    :cond_e4
    const-string v0, "meta[property=og:image]"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 206
    const-string v1, "content"

    if-eqz v0, :cond_f9

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 207
    :cond_f9
    if-eqz v0, :cond_106

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_106

    goto :goto_12b

    .line 208
    :cond_106
    const-string v0, "video[poster], meta[name=twitter:image], .video-player img, .player img"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 209
    invoke-static {v0, p1}, Lcom/streambundleextra/MediaFix;->image(Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 210
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_12b

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    const-string v2, "meta"

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    const-string v2, "property"

    const-string v3, "og:image"

    invoke-virtual {v0, v2, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, v1, p1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 212
    :cond_12b
    :goto_12b
    return-object p0
.end method

.method public static playbackReferer(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;
    .registers 7

    .line 286
    const-string v0, "meta[property=og:url], link[rel=canonical]"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 287
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v2

    const-string v3, "content"

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_24

    const-string v3, "href"

    :cond_24
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_33

    return-object v1

    .line 288
    :cond_33
    goto :goto_a

    .line 289
    :cond_34
    return-object p0
.end method

.method public static quality(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)I
    .registers 3

    .line 309
    const-string v0, "(?<![0-9])(2160|1440|1080|720|576|480|360|240)(?:p)?(?![0-9])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-static {p0, p1}, Lcom/streambundleextra/MediaFix;->qualityLabel(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 310
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_1e

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    return p0
.end method

.method private static qualityLabel(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;
    .registers 12

    .line 299
    const-string v0, "source[src], video[src], a[href]"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_51

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 300
    const-string v2, "href"

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_20

    const-string v2, "src"

    :cond_20
    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 301
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_33

    goto :goto_a

    .line 302
    :cond_33
    const-string v8, "data-height"

    const-string v9, "title"

    const-string v3, "data-quality"

    const-string v4, "label"

    const-string v5, "res"

    const-string v6, "size"

    const-string v7, "data-res"

    filled-new-array/range {v3 .. v9}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/streambundleextra/MediaFix;->first(Lcom/streambundlehtml/nodes/Element;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 303
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_50

    return-object v1

    .line 304
    :cond_50
    goto :goto_a

    .line 305
    :cond_51
    const-string p1, "(?i)(?:^|[/_?.=&-])(2160|1440|1080|720|576|480|360|240)(?:p|[/_?.=&-]|$)"

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 306
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_7a

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "p"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_7c

    :cond_7a
    const-string p0, ""

    :goto_7c
    return-object p0
.end method

.method public static qualityName(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;
    .registers 5

    .line 313
    invoke-static {p1, p2}, Lcom/streambundleextra/MediaFix;->quality(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)I

    move-result v0

    .line 314
    invoke-static {p1, p2}, Lcom/streambundleextra/MediaFix;->qualityLabel(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;

    move-result-object p2

    .line 315
    if-lez v0, :cond_1e

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "p"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_49

    .line 316
    :cond_1e
    const-string v0, "(?i).*fhd.*"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_29

    const-string p2, "Full HD"

    goto :goto_49

    .line 317
    :cond_29
    const-string v0, "(?i).*hd.*"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_34

    const-string p2, "HD"

    goto :goto_49

    .line 318
    :cond_34
    const-string v0, "(?i).*sd.*"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3f

    const-string p2, "SD"

    goto :goto_49

    .line 319
    :cond_3f
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x20

    if-le v0, v1, :cond_49

    const-string p2, ""

    .line 320
    :cond_49
    :goto_49
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_63

    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    const-string p2, ".m3u8"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_60

    const-string p1, "\u0410\u0432\u0442\u043e (HLS)"

    goto :goto_62

    :cond_60
    const-string p1, "\u041e\u0440\u0438\u0433\u0438\u043d\u0430\u043b"

    :goto_62
    move-object p2, p1

    .line 321
    :cond_63
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " \u00b7 "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static requestUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 52
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_82

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v2, "bdsmx.tube"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 54
    const-string v1, "^/video/(\\d+)(?:/|$)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_82

    .line 56
    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 57
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, "://"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/api/json/video/86400/"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-wide/32 v3, 0xf4240

    div-long v5, v1, v3

    mul-long v5, v5, v3

    invoke-virtual {p0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-wide/16 v3, 0x3e8

    div-long v5, v1, v3

    mul-long v5, v5, v3

    invoke-virtual {p0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, ".json"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 60
    :cond_82
    return-object p0
.end method

.method public static searchDocument(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;
    .registers 26

    invoke-static/range {p0 .. p0}, Lcom/streambundle/SearchGuard;->clean(Ljava/lang/Object;)V

    invoke-static/range {p0 .. p0}, Lcom/streambundleextra/PunishSupport;->results(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Lcom/streambundleextra/PerdolSupport;->results(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Lcom/streambundleextra/ProstoSupport;->results(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Lcom/streambundleextra/YouJizzSupport;->results(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Lcom/streambundleextra/HuyambaSupport;->results(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    .line 132
    invoke-virtual/range {p0 .. p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-static {v1, v0}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 133
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 134
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 135
    invoke-virtual/range {p0 .. p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    .line 136
    if-eqz v4, :cond_43

    const-string v7, "thisvid.com"

    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_43

    const/4 v7, 0x1

    goto :goto_44

    :cond_43
    const/4 v7, 0x0

    .line 137
    :goto_44
    if-eqz v4, :cond_50

    const-string v8, "hcbdsm.com"

    invoke-virtual {v4, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_50

    const/4 v8, 0x1

    goto :goto_51

    :cond_50
    const/4 v8, 0x0

    .line 138
    :goto_51
    const-string v9, "inhumanity.com"

    if-eqz v4, :cond_66

    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_66

    const-string v10, ".primary .updates"

    move-object/from16 v11, p0

    invoke-virtual {v11, v10}, Lcom/streambundlehtml/nodes/Document;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v10

    if-nez v10, :cond_69

    return-object v0

    :cond_66
    move-object/from16 v11, p0

    const/4 v10, 0x0

    .line 139
    :cond_69
    if-nez v10, :cond_6c

    move-object v10, v11

    :cond_6c
    const-string v12, "a[href]"

    invoke-virtual {v10, v12}, Lcom/streambundlehtml/nodes/Element;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v10

    invoke-virtual {v10}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_76
    :goto_76
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_263

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/streambundlehtml/nodes/Element;

    .line 140
    invoke-virtual {v11}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v15

    const-string v5, "href"

    invoke-virtual {v12, v5}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v15, v5}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_97

    goto :goto_76

    .line 141
    :cond_97
    invoke-static/range {v17 .. v17}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v5

    invoke-virtual {v11}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v15

    .line 142
    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_25b

    invoke-virtual {v15}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_25b

    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v6

    const-wide/16 v18, 0x0

    const-string v13, "^www\\."

    invoke-virtual {v6, v13, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v15}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v13, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_76

    .line 143
    invoke-virtual {v5}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 144
    if-eqz v5, :cond_253

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_253

    const-string v6, "(?i)^/(?:categories|category|tags|tag|members|models|search|login|signup|albums|photos)(?:/.*)?"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_76

    .line 145
    invoke-static {v12}, Lcom/streambundleextra/MediaFix;->container(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v6

    .line 146
    const-string v13, "(?i)^/videos?/[^/]+.*"

    invoke-virtual {v5, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_10b

    const-string v13, "twistedporn.com"

    invoke-virtual {v4, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_fb

    const-string v13, "/site/article/"

    invoke-virtual {v5, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_10b

    :cond_fb
    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_109

    const-string v13, "/plug/"

    invoke-virtual {v5, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_10b

    :cond_109
    const/4 v5, 0x0

    goto :goto_10c

    :cond_10b
    const/4 v5, 0x1

    .line 147
    :goto_10c
    invoke-virtual {v6}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v13

    const-string v14, "article"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_13a

    const-string v13, "video-block"

    invoke-virtual {v6, v13}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_13a

    const-string v13, "video-item"

    invoke-virtual {v6, v13}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_13a

    const-string v13, "post"

    invoke-virtual {v6, v13}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_13a

    const-string v13, "genaral-post-item"

    invoke-virtual {v6, v13}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_13a

    const/4 v13, 0x0

    goto :goto_13b

    :cond_13a
    const/4 v13, 0x1

    .line 148
    :goto_13b
    if-nez v5, :cond_141

    if-nez v13, :cond_141

    goto/16 :goto_76

    .line 149
    :cond_141
    const-string v5, "img"

    invoke-virtual {v12, v5}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v13

    if-nez v13, :cond_14f

    if-eq v6, v12, :cond_14f

    invoke-virtual {v6, v5}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v13

    .line 150
    :cond_14f
    const-string v5, "title"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v14}, Lcom/streambundleextra/MediaFix;->first(Lcom/streambundlehtml/nodes/Element;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_169

    const-string v14, "alt"

    filled-new-array {v14, v5}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v13, v5}, Lcom/streambundleextra/MediaFix;->first(Lcom/streambundlehtml/nodes/Element;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 151
    :cond_169
    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_17f

    const-string v5, ".title, .video-title, h2, h3"

    invoke-virtual {v6, v5}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    if-eqz v5, :cond_17f

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 152
    :cond_17f
    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_18d

    invoke-virtual {v12}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    :cond_18d
    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_195

    goto/16 :goto_76

    .line 153
    :cond_195
    invoke-virtual {v11}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v5

    invoke-static {v12, v6, v5}, Lcom/streambundleextra/MediaFix;->cardPoster(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 155
    if-eqz v7, :cond_1a7

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_1a7

    goto/16 :goto_76

    .line 156
    :cond_1a7
    invoke-static {v6}, Lcom/streambundleextra/VideoMetadata;->cardDuration(Lcom/streambundlehtml/nodes/Element;)J

    move-result-wide v12

    .line 157
    cmp-long v6, v12, v18

    if-gez v6, :cond_1b3

    invoke-static/range {v17 .. v17}, Lcom/streambundleextra/VideoMetadata;->cached(Ljava/lang/String;)J

    move-result-wide v12

    .line 158
    :cond_1b3
    invoke-static/range {v17 .. v17}, Lcom/streambundleextra/MediaFix;->identity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 159
    if-eqz v8, :cond_1ed

    cmp-long v15, v12, v18

    if-lez v15, :cond_1ed

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v22, v1

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v14, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v23, v4

    const-string v4, "\\s+"

    move/from16 v24, v7

    const-string v7, " "

    invoke-virtual {v1, v4, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "|"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1f5

    :cond_1ed
    move-object/from16 v22, v1

    move-object/from16 v23, v4

    move/from16 v24, v7

    move-object/from16 v1, v22

    .line 160
    :goto_1f5
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundleextra/MediaFix$SearchCard;

    .line 161
    if-nez v4, :cond_209

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_209

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundleextra/MediaFix$SearchCard;

    .line 162
    :cond_209
    if-eqz v4, :cond_232

    .line 163
    iget-object v1, v4, Lcom/streambundleextra/MediaFix$SearchCard;->poster:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_21b

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_21b

    iput-object v5, v4, Lcom/streambundleextra/MediaFix$SearchCard;->poster:Ljava/lang/String;

    .line 164
    :cond_21b
    iget-wide v14, v4, Lcom/streambundleextra/MediaFix$SearchCard;->duration:J

    cmp-long v1, v14, v18

    if-gez v1, :cond_227

    cmp-long v1, v12, v18

    if-lez v1, :cond_227

    iput-wide v12, v4, Lcom/streambundleextra/MediaFix$SearchCard;->duration:J

    .line 165
    :cond_227
    invoke-interface {v2, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v1, v22

    move-object/from16 v4, v23

    move/from16 v7, v24

    goto/16 :goto_76

    .line 167
    :cond_232
    new-instance v16, Lcom/streambundleextra/MediaFix$SearchCard;

    move-object/from16 v19, v5

    move-wide/from16 v20, v12

    move-object/from16 v18, v14

    invoke-direct/range {v16 .. v21}, Lcom/streambundleextra/MediaFix$SearchCard;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object/from16 v4, v16

    invoke-interface {v2, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_24b

    invoke-interface {v3, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    :cond_24b
    move-object/from16 v1, v22

    move-object/from16 v4, v23

    move/from16 v7, v24

    goto/16 :goto_76

    .line 144
    :cond_253
    move-object/from16 v22, v1

    move-object/from16 v23, v4

    move/from16 v24, v7

    goto/16 :goto_76

    .line 142
    :cond_25b
    move-object/from16 v22, v1

    move-object/from16 v23, v4

    move/from16 v24, v7

    goto/16 :goto_76

    .line 170
    :cond_263
    const-wide/16 v18, 0x0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 171
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_272
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2be

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundleextra/MediaFix$SearchCard;

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2bd

    .line 172
    iget-object v4, v3, Lcom/streambundleextra/MediaFix$SearchCard;->url:Ljava/lang/String;

    iget-object v5, v3, Lcom/streambundleextra/MediaFix$SearchCard;->title:Ljava/lang/String;

    iget-object v6, v3, Lcom/streambundleextra/MediaFix$SearchCard;->poster:Ljava/lang/String;

    invoke-static {v0, v4, v5, v6}, Lcom/streambundleextra/MediaFix;->card(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    iget-object v4, v3, Lcom/streambundleextra/MediaFix$SearchCard;->url:Ljava/lang/String;

    iget-wide v5, v3, Lcom/streambundleextra/MediaFix$SearchCard;->duration:J

    invoke-static {v4, v5, v6}, Lcom/streambundleextra/VideoMetadata;->remember(Ljava/lang/String;J)V

    .line 174
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Element;->children()Lcom/streambundlehtml/select/Elements;

    move-result-object v4

    invoke-virtual {v4}, Lcom/streambundlehtml/select/Elements;->last()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    .line 175
    if-eqz v4, :cond_2bd

    iget-wide v5, v3, Lcom/streambundleextra/MediaFix$SearchCard;->duration:J

    cmp-long v7, v5, v18

    if-lez v7, :cond_2bd

    const-string v5, "span"

    invoke-virtual {v4, v5}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    const-string v5, "duration"

    invoke-virtual {v4, v5}, Lcom/streambundlehtml/nodes/Element;->addClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    iget-wide v5, v3, Lcom/streambundleextra/MediaFix$SearchCard;->duration:J

    invoke-static {v5, v6}, Lcom/streambundleextra/VideoMetadata;->format(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/streambundlehtml/nodes/Element;->text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 171
    :cond_2bd
    goto :goto_272

    .line 177
    :cond_2be
    return-object v0
.end method

.method public static searchUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    invoke-static/range {p0 .. p1}, Lcom/streambundle/Unified;->searchQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 39
    const-string v0, "/+$"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 40
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, "huyamba.mobi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    const-string v1, "https://retro.huyamba.mobi/search/?q="

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_23
    const-string v1, "youjizz.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_32

    const-string v1, "https://www.youjizz.com/search?q="

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_32
    const-string v1, "prostoporno.dev"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4f

    const-string v2, "+"

    const-string v3, "%20"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "https://prostoporno.dev/search/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_4f
    const-string v1, "perdol.net"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6c

    const-string v2, "+"

    const-string v3, "%20"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "https://b.perdol.net/search/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_6c
    const-string v1, "punishbang.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7b

    const-string v1, "https://www.punishbang.com/search/?q="

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 41
    :cond_7b
    const-string v1, "twistedporn.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_97

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "https://www.twistedporn.com/site/search/"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 42
    :cond_97
    const-string v1, "inhumanity.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "/search/?q="

    if-eqz v2, :cond_bd

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "&cat="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 43
    :cond_bd
    const-string v2, "sick-r.com"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_15d

    const-string v2, "pervertium.com"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_15d

    const-string v2, "heavyfetish.com"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_15d

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_15d

    .line 44
    const-string v1, "hurtsex.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f7

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "https://www.hurtsex.com/search?q="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 45
    :cond_f7
    const-string v1, "bdsmx.tube"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_117

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/api/videos2.php?params=86400/str/relevance/60/search..1.all..&s="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 47
    :cond_117
    const-string v1, "boundhub.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_147

    const-string v1, "hcbdsm.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_147

    const-string v1, "thisvid.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_147

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/?s="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 48
    :cond_147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 43
    :cond_15d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static usableImage(Ljava/lang/String;)Z
    .registers 3

    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->videoEndpoint(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    return v0

    .line 84
    :cond_8
    const/4 v0, 0x0

    if-eqz p0, :cond_49

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_49

    .line 85
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 86
    const-string v1, "data:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_48

    const-string v1, "bg_private_video"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_48

    const-string v1, "no-thumb"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_48

    const-string v1, "no_thumb"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_48

    const-string v1, "placeholder"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_48

    const-string v1, "/blank.gif"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_48

    const/4 v0, 0x1

    :cond_48
    return v0

    .line 84
    :cond_49
    return v0
.end method
