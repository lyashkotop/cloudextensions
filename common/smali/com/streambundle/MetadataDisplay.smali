.class public final Lcom/streambundle/MetadataDisplay;
.super Ljava/lang/Object;
.source "MetadataDisplay.java"


# static fields
.field private static final HEIGHT:Ljava/util/regex/Pattern;

.field private static final QUALITY:Ljava/util/Map;
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

    .line 11
    new-instance v0, Lcom/streambundle/MetadataDisplay$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/MetadataDisplay$1;-><init>(IFZ)V

    .line 10
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/MetadataDisplay;->QUALITY:Ljava/util/Map;

    .line 14
    const-string v0, "(?i)^(?:[0-9]{2,5}x)?(144|240|288|360|480|540|576|720|1080|1440|2160|4320)p?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/MetadataDisplay;->HEIGHT:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static body(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 51
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 52
    :cond_5
    const-string v1, "\\A(?:\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c: [^\\r\\n]*(?:\\r?\\n|$))?(?:\u041a\u0430\u0447\u0435\u0441\u0442\u0432\u043e: [^\\r\\n]*(?:\\r?\\n|$))?\\s*"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8

    .line 23
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array p1, v1, [Ljava/lang/Object;

    aput-object p2, p1, v4

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_19
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_19} :catch_1e
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_19} :catch_1c
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_19} :catch_1a

    return-object p0

    .line 24
    :catch_1a
    move-exception p0

    goto :goto_1f

    :catch_1c
    move-exception p0

    goto :goto_1f

    :catch_1e
    move-exception p0

    :goto_1f
    return-object v0
.end method

.method public static decorate(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 55
    invoke-static {p1}, Lcom/streambundle/SourceTiming;->label(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 56
    sget-object v0, Lcom/streambundle/MetadataDisplay;->QUALITY:Ljava/util/Map;

    invoke-static {p1}, Lcom/streambundle/MetadataDisplay;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/16 v2, 0xa

    if-nez v1, :cond_2a

    const-string v1, "\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    :cond_2a
    if-eqz p1, :cond_3f

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_3f

    const-string p0, "\u041a\u0430\u0447\u0435\u0441\u0442\u0432\u043e: "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 60
    :cond_3f
    invoke-static {p2}, Lcom/streambundle/MetadataDisplay;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_56

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_56

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    :cond_56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 27
    const-string v0, "com.streambundle.v38.BundleMetadata"

    const-string v1, "key"

    invoke-static {v0, v1, p0}, Lcom/streambundle/MetadataDisplay;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 28
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_f

    check-cast v0, Ljava/lang/String;

    goto :goto_1a

    :cond_f
    const-string v0, ""

    if-nez p0, :cond_14

    goto :goto_1a

    :cond_14
    const-string v1, "#.*$"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1a
    return-object v0
.end method

.method public static preferTitle(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 5

    .line 66
    if-eqz p1, :cond_56

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_56

    .line 67
    :cond_d
    if-eqz p0, :cond_55

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_55

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    goto :goto_55

    .line 68
    :cond_20
    invoke-static {p1}, Lcom/streambundle/MetadataDisplay;->truncated(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-static {p0}, Lcom/streambundle/MetadataDisplay;->truncated(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    return-object p0

    .line 69
    :cond_2d
    invoke-static {p0}, Lcom/streambundle/MetadataDisplay;->truncated(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-static {p1}, Lcom/streambundle/MetadataDisplay;->truncated(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3a

    return-object p1

    .line 70
    :cond_3a
    invoke-static {p0}, Lcom/streambundle/MetadataDisplay;->truncated(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_51

    invoke-static {p1}, Lcom/streambundle/MetadataDisplay;->truncated(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_51

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_51

    return-object p0

    .line 71
    :cond_51
    if-eqz p2, :cond_54

    move-object p0, p1

    :cond_54
    return-object p0

    .line 67
    :cond_55
    :goto_55
    return-object p1

    .line 66
    :cond_56
    :goto_56
    return-object p0
.end method

.method public static quality(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 31
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 32
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 33
    sget-object v1, Lcom/streambundle/MetadataDisplay;->HEIGHT:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_2e

    new-instance p0, Ljava/lang/StringBuilder;

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "p"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 35
    :cond_2e
    const-string v1, "(?i)HD|SD|FHD|UHD|4K|8K"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3c

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    :cond_3c
    return-object v0
.end method

.method private static read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6

    .line 18
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 19
    :cond_4
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "get"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v1, p1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_24
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_4 .. :try_end_24} :catch_27
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_24} :catch_25

    return-object p0

    .line 20
    :catch_25
    move-exception p0

    goto :goto_28

    :catch_27
    move-exception p0

    :goto_28
    return-object v0
.end method

.method public static recommendations(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 84
    const-string v0, "Recommendations"

    invoke-static {p1, v0}, Lcom/streambundle/MetadataDisplay;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-ne p0, v0, :cond_9

    return-object p0

    .line 85
    :cond_9
    const-string v0, "Tags"

    invoke-static {p1, v0}, Lcom/streambundle/MetadataDisplay;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/MetadataDisplay;->tokens(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    .line 86
    const-string v2, "Name"

    invoke-static {p1, v2}, Lcom/streambundle/MetadataDisplay;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/streambundle/MetadataDisplay;->tokens(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    .line 87
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 88
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_26
    :goto_26
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2d

    .line 95
    return-object v3

    .line 88
    :cond_2d
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 89
    invoke-static {v4, v0}, Lcom/streambundle/MetadataDisplay;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/MetadataDisplay;->tokens(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    .line 90
    invoke-interface {v5, v1}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 91
    invoke-static {v4, v2}, Lcom/streambundle/MetadataDisplay;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundle/MetadataDisplay;->tokens(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    .line 92
    invoke-interface {v6, p1}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 93
    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_53

    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_26

    :cond_53
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_26
.end method

.method public static record(Lorg/jsoup/nodes/Document;)V
    .registers 5

    .line 38
    if-nez p0, :cond_3

    return-void

    .line 39
    :cond_3
    const-string v0, "meta[property=video:quality],meta[property=og:video:quality],meta[property=video:height],meta[property=og:video:height],[itemprop=videoQuality],[itemprop=height]"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_14

    .line 49
    return-void

    .line 39
    :cond_14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 40
    const-string v2, "aside,nav,header,footer,.related,.recommendations"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    if-eqz v2, :cond_23

    goto :goto_d

    .line 41
    :cond_23
    const-string v2, "itemprop"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "height"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_48

    .line 42
    const-string v2, "[itemscope]"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    .line 43
    if-eqz v2, :cond_d

    const-string v3, "itemtype"

    invoke-virtual {v2, v3}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "VideoObject"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_48

    goto :goto_d

    .line 45
    :cond_48
    const-string v2, "content"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_55

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_59

    :cond_55
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v1

    .line 46
    :goto_59
    invoke-static {v1}, Lcom/streambundle/MetadataDisplay;->quality(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_d

    sget-object v0, Lcom/streambundle/MetadataDisplay;->QUALITY:Ljava/util/Map;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/MetadataDisplay;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static sanitizeSearch(Ljava/lang/Object;)V
    .registers 3

    .line 98
    instance-of v0, p0, Lorg/jsoup/nodes/Document;

    if-nez v0, :cond_5

    return-void

    .line 99
    :cond_5
    check-cast p0, Lorg/jsoup/nodes/Document;

    .line 100
    const-string v0, "(?i)(/search|[?&](s|q|k|query|search)=)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_1c

    return-void

    .line 101
    :cond_1c
    const-string v0, ":matchesOwn((?iu)(nothing found|no (?:matching )?(?:results|videos)(?: were)? found|no results|\u043d\u0438\u0447\u0435\u0433\u043e \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u043e|\u043d\u0438\u0447\u0435\u0433\u043e \u043d\u0435 \u043d\u0430\u0448\u043b\u043e\u0441\u044c|\u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u043e\u0432 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u043e|\u0432\u0438\u0434\u0435\u043e \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u043e))"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c

    .line 102
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->empty()Lorg/jsoup/nodes/Element;

    return-void

    .line 104
    :cond_2c
    const-string v0, ".trending,#trending,[id*=trending],[class*=trending],.popular-videos,.recommended,.recommendations,.recommended-videos,#recommended-videos,.related,.related-videos"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->remove()Lorg/jsoup/select/Elements;

    .line 105
    return-void
.end method

.method private static tokens(Ljava/lang/Object;)Ljava/util/Set;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 74
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 75
    instance-of v1, p0, Ljava/lang/Iterable;

    if-eqz v1, :cond_22

    .line 76
    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_16

    .line 77
    goto :goto_50

    .line 76
    :cond_16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/MetadataDisplay;->tokens(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_f

    .line 77
    :cond_22
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_50

    .line 78
    check-cast p0, Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "[^\\p{L}\\p{N}]+"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_36
    if-lt v2, v1, :cond_39

    goto :goto_50

    :cond_39
    aget-object v3, p0, v2

    .line 79
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x3

    if-lt v4, v5, :cond_4d

    const-string v4, "video|videos|\u0432\u0438\u0434\u0435\u043e|full|online|watch|free|the|and|with|com"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4d

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 78
    :cond_4d
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    .line 81
    :cond_50
    :goto_50
    return-object v0
.end method

.method private static truncated(Ljava/lang/String;)Z
    .registers 2

    .line 64
    if-eqz p0, :cond_10

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "(?s).*(?:\u2026|\\.\\.\\.)$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method
