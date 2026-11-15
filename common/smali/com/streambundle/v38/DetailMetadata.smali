.class public final Lcom/streambundle/v38/DetailMetadata;
.super Ljava/lang/Object;
.source "DetailMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/DetailMetadata$Info;
    }
.end annotation


# static fields
.field private static final BEEG:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/DetailMetadata$Info;",
            ">;"
        }
    .end annotation
.end field

.field private static final BEEG_ID:Ljava/util/regex/Pattern;

.field private static final GENERIC_TAG:Ljava/util/regex/Pattern;

.field private static final LISTING:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/DetailMetadata$Info;",
            ">;"
        }
    .end annotation
.end field

.field private static final NON_VIDEO_SCOPE:Ljava/util/regex/Pattern;

.field private static final PROMO:Ljava/util/regex/Pattern;

.field private static final VIDEO:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/DetailMetadata$Info;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 19
    const/16 v0, 0x100

    invoke-static {v0}, Lcom/streambundle/v38/DetailMetadata;->cache(I)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/DetailMetadata;->VIDEO:Ljava/util/Map;

    .line 20
    const/16 v0, 0x600

    invoke-static {v0}, Lcom/streambundle/v38/DetailMetadata;->cache(I)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    .line 22
    const/16 v0, 0x400

    invoke-static {v0}, Lcom/streambundle/v38/DetailMetadata;->cache(I)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/DetailMetadata;->BEEG:Ljava/util/Map;

    .line 23
    const-string v0, "(?i)^https?://(?:www\\.)?beeg\\.porn/xid/(\\d+)(?:[/?#]|$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/DetailMetadata;->BEEG_ID:Ljava/util/regex/Pattern;

    .line 24
    const-string v0, "(?iu)(?:^|[.!?]\\s+)(?:\u0441\u043e\u0432\u0435\u0442\u0443\u0435\u043c \u043f\u043e\u0441\u043c\u043e\u0442\u0440\u0435\u0442\u044c|\u0440\u0435\u043a\u043e\u043c\u0435\u043d\u0434\u0443\u0435\u043c \u043f\u043e\u0441\u043c\u043e\u0442\u0440\u0435\u0442\u044c|\u0441\u043c\u043e\u0442\u0440\u0438\u0442\u0435 (?:\u0443 \u043d\u0430\u0441|\u043e\u043d\u043b\u0430\u0439\u043d|\u0431\u0435\u0441\u043f\u043b\u0430\u0442\u043d\u043e|\u043d\u0430 \u043d\u0430\u0448\u0435\u043c \u0441\u0430\u0439\u0442\u0435)|\u0441\u043c\u043e\u0442\u0440\u0438 (?:\u0443 \u043d\u0430\u0441|\u043e\u043d\u043b\u0430\u0439\u043d|\u0431\u0435\u0441\u043f\u043b\u0430\u0442\u043d\u043e)|\u0441\u043c\u043e\u0442\u0440\u0435\u0442\u044c (?:\u043e\u043d\u043b\u0430\u0439\u043d|\u0431\u0435\u0441\u043f\u043b\u0430\u0442\u043d\u043e)|watch (?:this video|online|for free|free)|(?:most best porn|forget about other porn|beeg porn this is all|free porn tubes))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/DetailMetadata;->PROMO:Ljava/util/regex/Pattern;

    .line 25
    const-string v0, "(?iu)^(?:\u043f\u043e\u0440\u043d\u043e(?: \u0432\u0438\u0434\u0435\u043e| \u0440\u043e\u043b\u0438\u043a\u0438)?|\u043f\u043e\u0440\u043d\u0443\u0445\u0430|(?:full[ -]?)?(?:hd|sd|[48]k)(?: \u043f\u043e\u0440\u043d\u043e)?|[0-9]{3,4}p|(?:free |hd )?porn(?: videos?)?|xxx|all videos|\u0432\u0441\u0435 \u0432\u0438\u0434\u0435\u043e|\u0432\u0441\u0435 \u043a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438|categories|\u043a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438|tags|\u0442\u0435\u0433\u0438|\u0433\u043b\u0430\u0432\u043d\u0430\u044f|home)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/DetailMetadata;->GENERIC_TAG:Ljava/util/regex/Pattern;

    .line 26
    const-string v0, "(?i)(?:^|[-_\\s])(?:related|recommend(?:ed|ations)?|footer|menu|nav(?:igation)?|sidebar|browse|sitewide|popular|trending)(?:$|[-_\\s])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/DetailMetadata;->NON_VIDEO_SCOPE:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addTags(Ljava/util/Set;Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 306
    instance-of v0, p1, Lorg/json/JSONArray;

    const/16 v1, 0x80

    const/4 v2, 0x0

    if-eqz v0, :cond_22

    .line 307
    check-cast p1, Lorg/json/JSONArray;

    .line 308
    nop

    :goto_a
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v2, v0, :cond_8f

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v0

    if-lt v0, v1, :cond_18

    .line 309
    goto/16 :goto_8f

    .line 308
    :cond_18
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 309
    :cond_22
    instance-of v0, p1, Lorg/json/JSONObject;

    if-eqz v0, :cond_40

    .line 310
    check-cast p1, Lorg/json/JSONObject;

    .line 311
    const-string v0, "label"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    goto :goto_8e

    .line 312
    :cond_40
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_8e

    .line 313
    check-cast p1, Ljava/lang/String;

    const-string v0, "[,;]"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    :goto_4d
    if-lt v2, v0, :cond_50

    goto :goto_8f

    :cond_50
    aget-object v3, p1, v2

    .line 314
    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 315
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v4

    if-ge v4, v1, :cond_8b

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_8b

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x46

    if-gt v4, v5, :cond_8b

    const-string v4, "(?i)^(?:null|none|n/a|#?\\d+)$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8b

    .line 316
    sget-object v4, Lcom/streambundle/v38/DetailMetadata;->GENERIC_TAG:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-nez v4, :cond_8b

    invoke-static {p0, v3}, Lcom/streambundle/v38/DetailMetadata;->containsTag(Ljava/util/Set;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8b

    invoke-interface {p0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 313
    :cond_8b
    add-int/lit8 v2, v2, 0x1

    goto :goto_4d

    .line 312
    :cond_8e
    :goto_8e
    nop

    .line 319
    :cond_8f
    :goto_8f
    return-void
.end method

.method private static beegId(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 241
    sget-object v0, Lcom/streambundle/v38/DetailMetadata;->BEEG_ID:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 242
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_14

    :cond_12
    const-string p0, ""

    :goto_14
    return-object p0
.end method

.method private static better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 3

    .line 62
    invoke-static {p0, p1, p2}, Lcom/streambundle/MetadataDisplay;->preferTitle(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static cache(I)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/DetailMetadata$Info;",
            ">;"
        }
    .end annotation

    .line 31
    new-instance v0, Lcom/streambundle/v38/DetailMetadata$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2, p0}, Lcom/streambundle/v38/DetailMetadata$1;-><init>(IFZI)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method private static clean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 302
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/BundleMetadata;->title(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static collect(Lorg/jsoup/nodes/Document;)V
    .registers 13

    .line 80
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    .line 81
    const-string v1, "meta[property=og:site_name]"

    invoke-static {p0, v1}, Lcom/streambundle/v38/DetailMetadata;->value(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 82
    nop

    .line 83
    const-string v2, "a[href]"

    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :cond_17
    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1e

    goto :goto_2a

    :cond_1e
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Element;

    .line 84
    const/4 v6, 0x1

    add-int/2addr v4, v6

    const/16 v7, 0x2bc

    if-le v4, v7, :cond_2e

    .line 110
    :goto_2a
    invoke-static {p0, v3}, Lcom/streambundle/v38/DetailMetadata;->collectVideo(Lorg/jsoup/nodes/Document;Z)V

    .line 111
    return-void

    .line 85
    :cond_2e
    const-string v7, "nav, header, footer, .navigation"

    invoke-virtual {v5, v7}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    if-eqz v7, :cond_37

    goto :goto_17

    .line 86
    :cond_37
    const-string v7, "img"

    invoke-virtual {v5, v7}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    .line 87
    const-string v8, "title"

    invoke-virtual {v5, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v0, v1}, Lcom/streambundle/v38/DetailMetadata;->clean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 88
    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/String;

    const-string v10, "aria-label"

    invoke-virtual {v5, v10}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v3

    const-string v10, "data-title"

    invoke-virtual {v5, v10}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v6

    .line 89
    if-nez v7, :cond_5f

    const-string v6, ""

    goto :goto_65

    :cond_5f
    const-string v6, "title"

    invoke-virtual {v7, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_65
    const/4 v10, 0x2

    aput-object v6, v9, v10

    if-nez v7, :cond_6d

    const-string v6, ""

    goto :goto_73

    :cond_6d
    const-string v6, "alt"

    invoke-virtual {v7, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_73
    const/4 v7, 0x3

    aput-object v6, v9, v7

    .line 88
    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_7e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_104

    .line 92
    const-string v6, "data-description"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v8}, Lcom/streambundle/v38/DetailMetadata;->description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 93
    new-instance v7, Ljava/util/LinkedHashSet;

    invoke-direct {v7}, Ljava/util/LinkedHashSet;-><init>()V

    .line 94
    const-string v9, "data-tags"

    invoke-virtual {v5, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    .line 95
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_b0

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_b0

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_b0

    goto/16 :goto_17

    .line 96
    :cond_b0
    const-string v9, "href"

    invoke-virtual {v5, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 97
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_17

    invoke-static {v5}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d0

    goto/16 :goto_17

    .line 98
    :cond_d0
    sget-object v9, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    monitor-enter v9

    .line 99
    :try_start_d3
    invoke-static {v5}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 100
    sget-object v10, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    invoke-interface {v10, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 101
    if-eqz v10, :cond_f4

    .line 102
    iget-object v11, v10, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    invoke-static {v11, v8, v3}, Lcom/streambundle/v38/DetailMetadata;->better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    .line 103
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_ef

    iget-object v6, v10, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    .line 104
    :cond_ef
    iget-object v10, v10, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    invoke-interface {v7, v10}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 106
    :cond_f4
    sget-object v10, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    new-instance v11, Lcom/streambundle/v38/DetailMetadata$Info;

    invoke-direct {v11, v8, v6, v7}, Lcom/streambundle/v38/DetailMetadata$Info;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    invoke-interface {v10, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    monitor-exit v9

    goto/16 :goto_17

    :catchall_101
    move-exception p0

    monitor-exit v9
    :try_end_103
    .catchall {:try_start_d3 .. :try_end_103} :catchall_101

    throw p0

    .line 88
    :cond_104
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 90
    invoke-static {v7, v0, v1}, Lcom/streambundle/v38/DetailMetadata;->clean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7, v3}, Lcom/streambundle/v38/DetailMetadata;->better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_7e
.end method

.method static collectVideo(Lorg/jsoup/nodes/Document;Z)V
    .registers 19

    .line 114
    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v2

    .line 115
    const-string v0, "meta[property=og:site_name]"

    invoke-static {v1, v0}, Lcom/streambundle/v38/DetailMetadata;->value(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 116
    invoke-virtual/range {p0 .. p0}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object v0

    const-string v4, "(?is).*(?:site unavailable|access denied|just a moment|error [45][0-9][0-9]).*"

    invoke-virtual {v0, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_19

    return-void

    .line 117
    :cond_19
    nop

    .line 118
    const-string v0, "script[type=application/ld+json]"

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v5, 0x0

    move-object v6, v5

    :cond_26
    :goto_26
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v0, :cond_30

    move-object v0, v6

    goto :goto_4a

    :cond_30
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 120
    :try_start_36
    new-instance v9, Lorg/json/JSONTokener;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v2, v8, v7}, Lcom/streambundle/v38/BundleMetadata;->ownVideo(Ljava/lang/Object;Ljava/lang/String;IZ)Lorg/json/JSONObject;

    move-result-object v6
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_47} :catch_23a

    .line 121
    if-eqz v6, :cond_26

    move-object v0, v6

    .line 124
    :goto_4a
    nop

    .line 125
    const-string v4, "[itemscope][itemtype*=VideoObject]"

    invoke-virtual {v1, v4}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_55
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_5d

    move-object v4, v5

    goto :goto_69

    :cond_5d
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 126
    invoke-static {v4}, Lcom/streambundle/v38/DetailMetadata;->videoScope(Lorg/jsoup/nodes/Element;)Z

    move-result v6

    if-eqz v6, :cond_55

    .line 128
    :goto_69
    if-nez p1, :cond_87

    if-nez v4, :cond_87

    if-nez v0, :cond_87

    .line 129
    const-string v6, "meta[property=og:type]"

    invoke-static {v1, v6}, Lcom/streambundle/v38/DetailMetadata;->value(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v9, "video"

    invoke-virtual {v6, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_87

    .line 130
    const-string v6, "video, #player, .video-player, iframe#video2"

    invoke-virtual {v1, v6}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    if-nez v6, :cond_87

    .line 128
    const/4 v6, 0x0

    goto :goto_88

    :cond_87
    const/4 v6, 0x1

    .line 131
    :goto_88
    if-nez v6, :cond_8b

    return-void

    .line 132
    :cond_8b
    invoke-static/range {p0 .. p0}, Lcom/streambundle/MetadataDisplay;->record(Lorg/jsoup/nodes/Document;)V

    .line 133
    invoke-static {v1, v0}, Lcom/streambundle/SourceTiming;->record(Lorg/jsoup/nodes/Document;Lorg/json/JSONObject;)V

    .line 135
    const-string v6, ""

    if-nez v4, :cond_97

    move-object v9, v6

    goto :goto_a1

    :cond_97
    const-string v9, "[itemprop=name]"

    invoke-static {v4, v9}, Lcom/streambundle/v38/DetailMetadata;->value(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v2, v3}, Lcom/streambundle/v38/DetailMetadata;->clean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 136
    :goto_a1
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_b3

    if-eqz v0, :cond_b3

    const-string v9, "name"

    invoke-virtual {v0, v9, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v2, v3}, Lcom/streambundle/v38/DetailMetadata;->clean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 137
    :cond_b3
    const-string v10, "meta[name=twitter:title]"

    const-string v11, "title"

    const-string v12, "h1.video-page-title, h1[itemprop=name], main h1"

    const-string v13, "h1"

    const-string v14, "meta[property=og:title]"

    filled-new-array {v12, v13, v14, v10, v11}, [Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move-object v12, v9

    :goto_ca
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_d1

    goto :goto_e3

    :cond_d1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 138
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_22c

    invoke-static {v12}, Lcom/streambundle/v38/DetailMetadata;->truncated(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_22c

    .line 143
    :goto_e3
    new-instance v14, Ljava/util/LinkedHashSet;

    invoke-direct {v14}, Ljava/util/LinkedHashSet;-><init>()V

    .line 144
    nop

    .line 151
    const-string v3, ".video-taxonomy, .video-tags, .video_tags, #video-tags, .video-info .tags"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_f3

    const/4 v11, 0x1

    goto :goto_f4

    :cond_f3
    const/4 v11, 0x0

    .line 152
    :goto_f4
    const-string v3, ".video-taxonomy .tax-tags a, .video-taxonomy .tax-feature-tags a, main a[rel=tag], article a[rel=tag], a[rel=tag], .video-tags a, .video_tags a, .video-categories a, #tab_video_info a[href*=/tag], #tab_video_info a[href*=/categor], .item_info a[href*=/tag/], .item_info a[href*=/category/], .video-info a[href*=/tag/], .video-info .tags a, .video-details .tags a, .movie-info .tags a, .infometa a[href*=/tag/], .infometa a[href*=/category/], .video-info a[href*=/genres/], .movie-info a[href*=/genres/], #video-info a[href*=/genres/], #video-tags a, #tags a, .tagsbox a, .video-info .categories a, [itemscope][itemtype*=VideoObject] .categories a, .info .item a[href*=/tags/], .info .item a[href*=/categories/], [itemprop=keywords]:not(meta)"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_fe
    :goto_fe
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_217

    .line 153
    invoke-interface {v14}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_132

    if-nez v11, :cond_132

    if-eqz v0, :cond_132

    .line 154
    const-string v3, "keywords"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v14, v9}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    const-string v9, "genre"

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-static {v14, v10}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    .line 155
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_12e

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_12e

    const/4 v3, 0x0

    goto :goto_12f

    :cond_12e
    const/4 v3, 0x1

    :goto_12f
    move/from16 v16, v3

    goto :goto_134

    .line 157
    :cond_132
    move/from16 v16, v11

    :goto_134
    invoke-interface {v14}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    const-string v9, "content"

    if-eqz v3, :cond_171

    if-nez v16, :cond_171

    .line 158
    const-string v3, "meta[property=video:tag],meta[property=og:video:tag]"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_148
    :goto_148
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_14f

    goto :goto_171

    :cond_14f
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/jsoup/nodes/Element;

    .line 159
    invoke-virtual {v10, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 160
    const-string v11, "[\u0410-\u042f\u0430-\u044f\u0401\u0451]{1,2}"

    invoke-virtual {v10, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_148

    const-string v11, "(?iu)(?:\u0438|\u0430|\u043d\u043e|\u0434\u043b\u044f|\u0447\u0442\u043e|\u044d\u0442\u043e|\u043a\u0430\u043a|\u043f\u0440\u0438|the|and|for|with|from|of|to|in|on|a|an)"

    invoke-virtual {v10, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_148

    invoke-static {v14, v10}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    goto :goto_148

    .line 164
    :cond_171
    :goto_171
    if-nez v4, :cond_174

    goto :goto_17a

    :cond_174
    const-string v3, "[itemprop=description]"

    invoke-virtual {v4, v3}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v5

    .line 165
    :goto_17a
    const-string v3, "description"

    if-nez v5, :cond_188

    if-eqz v0, :cond_186

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_188

    :cond_186
    const/4 v15, 0x0

    goto :goto_189

    :cond_188
    const/4 v15, 0x1

    .line 166
    :goto_189
    if-nez v5, :cond_18d

    move-object v4, v6

    goto :goto_195

    :cond_18d
    invoke-static {v5}, Lcom/streambundle/v38/DetailMetadata;->elementValue(Lorg/jsoup/nodes/Element;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v12}, Lcom/streambundle/v38/DetailMetadata;->description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 167
    :goto_195
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1a5

    if-eqz v0, :cond_1a5

    invoke-virtual {v0, v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v12}, Lcom/streambundle/v38/DetailMetadata;->description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 168
    :cond_1a5
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1d6

    .line 169
    const-string v0, "[itemprop=description]:not(meta), #tab_video_info .description, .video-description, #video-description, .video_description, .video-info .description, .video-details .description, #video_description, .item_info .description"

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1b5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1bc

    goto :goto_1d6

    :cond_1bc
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 170
    invoke-static {v3}, Lcom/streambundle/v38/DetailMetadata;->videoScope(Lorg/jsoup/nodes/Element;)Z

    move-result v5

    if-eqz v5, :cond_1b5

    invoke-static {v3}, Lcom/streambundle/v38/DetailMetadata;->elementValue(Lorg/jsoup/nodes/Element;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v12}, Lcom/streambundle/v38/DetailMetadata;->description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1b5

    .line 173
    :cond_1d6
    :goto_1d6
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_206

    if-nez v15, :cond_206

    .line 174
    const-string v0, "meta[property=og:description],meta[name=twitter:description],meta[itemprop=description]"

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1e8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1f0

    move-object v13, v4

    goto :goto_207

    :cond_1f0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 175
    invoke-virtual {v1, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v12}, Lcom/streambundle/v38/DetailMetadata;->description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e8

    move-object v13, v4

    goto :goto_207

    .line 178
    :cond_206
    move-object v13, v4

    :goto_207
    sget-object v0, Lcom/streambundle/v38/DetailMetadata;->VIDEO:Ljava/util/Map;

    invoke-static {v2}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/streambundle/v38/DetailMetadata$Info;

    move-object v11, v2

    invoke-direct/range {v11 .. v16}, Lcom/streambundle/v38/DetailMetadata$Info;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;ZZ)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    return-void

    .line 152
    :cond_217
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    invoke-static {v3}, Lcom/streambundle/v38/DetailMetadata;->videoScope(Lorg/jsoup/nodes/Element;)Z

    move-result v9

    if-eqz v9, :cond_fe

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v3

    invoke-static {v14, v3}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    goto/16 :goto_fe

    .line 139
    :cond_22c
    invoke-static {v1, v9}, Lcom/streambundle/v38/DetailMetadata;->value(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v2, v3}, Lcom/streambundle/v38/DetailMetadata;->clean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v9, v8}, Lcom/streambundle/v38/DetailMetadata;->better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_ca

    .line 122
    :catch_23a
    move-exception v0

    goto/16 :goto_26
.end method

.method private static complete(Lcom/streambundle/v38/DetailMetadata$Info;)Z
    .registers 2

    .line 76
    if-eqz p0, :cond_14

    iget-object v0, p0, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_14

    iget-object p0, p0, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method private static containsTag(Ljava/util/Set;Ljava/lang/String;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 322
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_c

    .line 323
    const/4 p0, 0x0

    return p0

    .line 322
    :cond_c
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 p0, 0x1

    return p0
.end method

.method private static description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 280
    invoke-static {p0}, Lcom/streambundle/MetadataDisplay;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 281
    const-string v0, ""

    if-eqz p0, :cond_7e

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "{"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7e

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    goto :goto_7e

    .line 282
    :cond_21
    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 283
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xa

    if-lt v1, v2, :cond_7d

    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7d

    sget-object v1, Lcom/streambundle/v38/DetailMetadata;->PROMO:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_7d

    .line 284
    const-string v1, "(?iu)^(?:\u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 (?:\u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442|\u043d\u0435 \u043e\u043f\u0443\u0431\u043b\u0438\u043a\u043e\u0432\u0430\u043d\u043e)|no description|duration|quality|tags|\u0434\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c|\u043a\u0430\u0447\u0435\u0441\u0442\u0432\u043e|\u043a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438|\u0442\u0435\u0433\u0438)(?:\\b|:).*"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4c

    goto :goto_7d

    .line 285
    :cond_4c
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7c

    const/4 v5, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v2, 0x1

    const/4 v3, 0x0

    move-object v1, p0

    move-object v4, p1

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-eqz v1, :cond_7c

    .line 286
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 287
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7b

    const-string v1, "(?isu)^[.\u00b7\u2014-]*\\s*(?:\u043a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438|\u0442\u0435\u0433\u0438|categories|tags)(?:\\s|:|[-\u2014]).*"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_7c

    :cond_7b
    return-object v0

    .line 289
    :cond_7c
    return-object p0

    .line 284
    :cond_7d
    :goto_7d
    return-object v0

    .line 281
    :cond_7e
    :goto_7e
    return-object v0
.end method

.method private static elementValue(Lorg/jsoup/nodes/Element;)Ljava/lang/String;
    .registers 3

    .line 182
    const-string v0, "content"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_11

    :cond_d
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object p0

    :goto_11
    return-object p0
.end method

.method public static enrich(Ljava/lang/Object;)V
    .registers 11

    .line 250
    const-string v0, "Plot"

    if-eqz p0, :cond_118

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LoadResponse"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    goto/16 :goto_118

    .line 251
    :cond_16
    const-string v1, "Url"

    invoke-static {p0, v1}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 252
    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 253
    sget-object v3, Lcom/streambundle/v38/DetailMetadata;->VIDEO:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 254
    sget-object v4, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 255
    const-string v4, "Name"

    invoke-static {p0, v4}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 257
    :try_start_3e
    const-class v6, Ljava/lang/String;

    invoke-static {v5, v1}, Lcom/streambundle/v38/DetailMetadata;->listingTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p0, v4, v6, v7}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 258
    sget-object v4, Lcom/streambundle/v38/DetailMetadata;->BEEG:Ljava/util/Map;

    invoke-static {v1}, Lcom/streambundle/v38/DetailMetadata;->beegId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 259
    new-instance v6, Ljava/util/LinkedHashSet;

    invoke-direct {v6}, Ljava/util/LinkedHashSet;-><init>()V

    .line 260
    if-eqz v4, :cond_5f

    iget-object v7, v4, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    invoke-interface {v6, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 261
    :cond_5f
    if-eqz v3, :cond_78

    iget-object v7, v3, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_67
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_6e

    goto :goto_78

    :cond_6e
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v6, v8}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    goto :goto_67

    .line 262
    :cond_78
    :goto_78
    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_9d

    if-eqz v2, :cond_9d

    if-eqz v3, :cond_86

    iget-boolean v7, v3, Lcom/streambundle/v38/DetailMetadata$Info;->tagsDeclared:Z

    if-nez v7, :cond_9d

    :cond_86
    iget-object v7, v2, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_8c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_93

    goto :goto_9d

    :cond_93
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v6, v8}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    goto :goto_8c

    .line 263
    :cond_9d
    :goto_9d
    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v7
    :try_end_a1
    .catch Ljava/lang/RuntimeException; {:try_start_3e .. :try_end_a1} :catch_115

    const-string v8, "Tags"

    if-eqz v7, :cond_c4

    if-nez v3, :cond_c4

    .line 264
    :try_start_a7
    invoke-static {p0, v8}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 265
    instance-of v9, v7, Ljava/lang/Iterable;

    if-eqz v9, :cond_c4

    check-cast v7, Ljava/lang/Iterable;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_b5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_bc

    goto :goto_c4

    :cond_bc
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    goto :goto_b5

    .line 267
    :cond_c4
    :goto_c4
    const-class v7, Ljava/util/List;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0, v8, v7, v9}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 269
    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 270
    if-nez v3, :cond_db

    const-string v7, ""

    goto :goto_dd

    :cond_db
    iget-object v7, v3, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    .line 271
    :goto_dd
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_e7

    if-eqz v4, :cond_e7

    iget-object v7, v4, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    .line 272
    :cond_e7
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_fb

    if-eqz v2, :cond_fb

    if-eqz v3, :cond_f5

    iget-boolean v4, v3, Lcom/streambundle/v38/DetailMetadata$Info;->descriptionDeclared:Z

    if-nez v4, :cond_fb

    :cond_f5
    iget-object v2, v2, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    invoke-static {v2, v5}, Lcom/streambundle/v38/DetailMetadata;->description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 273
    :cond_fb
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_10b

    if-eqz v3, :cond_107

    iget-boolean v2, v3, Lcom/streambundle/v38/DetailMetadata$Info;->descriptionDeclared:Z

    if-nez v2, :cond_10b

    :cond_107
    invoke-static {v6, v5}, Lcom/streambundle/v38/DetailMetadata;->description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 274
    :cond_10b
    invoke-static {p0, v1, v7}, Lcom/streambundle/MetadataDisplay;->decorate(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 275
    const-class v2, Ljava/lang/String;

    invoke-static {p0, v0, v2, v1}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    :try_end_114
    .catch Ljava/lang/RuntimeException; {:try_start_a7 .. :try_end_114} :catch_115

    goto :goto_116

    .line 276
    :catch_115
    move-exception p0

    :goto_116
    nop

    .line 277
    return-void

    .line 250
    :cond_118
    :goto_118
    return-void
.end method

.method public static listingTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 39
    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 40
    sget-object v0, Lcom/streambundle/v38/DetailMetadata;->VIDEO:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 41
    sget-object v1, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 42
    if-eqz p1, :cond_29

    iget-object v1, p1, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_29

    iget-object v1, p1, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    invoke-static {v1}, Lcom/streambundle/v38/DetailMetadata;->truncated(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_29

    iget-object p0, p1, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    return-object p0

    .line 43
    :cond_29
    if-eqz v0, :cond_3b

    iget-object v1, v0, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3b

    iget-object p1, v0, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/streambundle/v38/DetailMetadata;->better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 44
    :cond_3b
    if-nez p1, :cond_3e

    goto :goto_45

    :cond_3e
    iget-object p1, p1, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/streambundle/v38/DetailMetadata;->better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    :goto_45
    return-object p0
.end method

.method static preferredTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 246
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/DetailMetadata;->better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    goto :goto_11

    :cond_c
    const/4 p1, 0x0

    invoke-static {p0, p2, p1}, Lcom/streambundle/v38/DetailMetadata;->better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    :goto_11
    return-object p0
.end method

.method static readyForOpen(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .line 70
    invoke-static {p1, p0}, Lcom/streambundle/v38/DetailMetadata;->listingTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/streambundle/v38/DetailMetadata;->truncated(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_c

    return v0

    .line 71
    :cond_c
    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 72
    sget-object v1, Lcom/streambundle/v38/DetailMetadata;->VIDEO:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundle/v38/DetailMetadata$Info;

    invoke-static {v1}, Lcom/streambundle/v38/DetailMetadata;->complete(Lcom/streambundle/v38/DetailMetadata$Info;)Z

    move-result v1

    if-nez v1, :cond_3f

    sget-object v1, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/streambundle/v38/DetailMetadata$Info;

    invoke-static {p1}, Lcom/streambundle/v38/DetailMetadata;->complete(Lcom/streambundle/v38/DetailMetadata$Info;)Z

    move-result p1

    if-nez p1, :cond_3f

    sget-object p1, Lcom/streambundle/v38/DetailMetadata;->BEEG:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundle/v38/DetailMetadata;->beegId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/streambundle/v38/DetailMetadata$Info;

    invoke-static {p0}, Lcom/streambundle/v38/DetailMetadata;->complete(Lcom/streambundle/v38/DetailMetadata$Info;)Z

    move-result p0

    if-nez p0, :cond_3f

    return v0

    :cond_3f
    const/4 p0, 0x1

    return p0
.end method

.method public static reconcile(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 6

    .line 187
    sget-object v0, Lcom/streambundle/v38/DetailMetadata;->VIDEO:Ljava/util/Map;

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 188
    if-eqz p0, :cond_8b

    if-nez p1, :cond_12

    goto/16 :goto_8b

    .line 190
    :cond_12
    :try_start_12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    iget-object v1, p1, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_71

    .line 192
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "ownCategories"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 193
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 194
    iget-boolean v0, p1, Lcom/streambundle/v38/DetailMetadata$Info;->descriptionDeclared:Z

    if-nez v0, :cond_44

    iget-object v0, p1, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_56

    .line 195
    :cond_44
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "description"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 196
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    iget-object v1, p1, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 198
    :cond_56
    iget-object v0, p1, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8a

    .line 199
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 200
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    iget-object p1, p1, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_89

    .line 191
    :cond_71
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_82

    const/16 v3, 0x20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_82
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_85
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_12 .. :try_end_85} :catch_88
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_85} :catch_86

    goto :goto_1d

    .line 202
    :catch_86
    move-exception p0

    goto :goto_89

    :catch_88
    move-exception p0

    :goto_89
    nop

    .line 203
    :cond_8a
    return-void

    .line 188
    :cond_8b
    :goto_8b
    return-void
.end method

.method public static rememberBeeg(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 11

    .line 214
    invoke-static {p1}, Lcom/streambundle/v38/DetailMetadata;->beegId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 215
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    return-void

    .line 216
    :cond_b
    const-string v1, "title"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-static {v1, p1, v2}, Lcom/streambundle/v38/DetailMetadata;->clean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 217
    const-string v2, ""

    .line 218
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 219
    const-string v4, "description"

    const-string v5, "video_description"

    const-string v6, "synopsis"

    const-string v7, "summary"

    const-string v8, "desc"

    filled-new-array {v4, v5, v6, v7, v8}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_36
    :goto_36
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3e

    move-object v5, v2

    goto :goto_5a

    :cond_3e
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 220
    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 221
    instance-of v6, v5, Ljava/lang/String;

    if-nez v6, :cond_4d

    goto :goto_36

    .line 222
    :cond_4d
    check-cast v5, Ljava/lang/String;

    invoke-static {v5, v1}, Lcom/streambundle/v38/DetailMetadata;->description(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 223
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_36

    move-object v5, v2

    .line 225
    :goto_5a
    const-string v2, "cats"

    const-string v4, "categories"

    const-string v6, "tags"

    const-string v7, "keywords"

    const-string v8, "genre"

    filled-new-array {v2, v4, v6, v7, v8}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_70
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_c8

    .line 226
    sget-object v2, Lcom/streambundle/v38/DetailMetadata;->BEEG:Ljava/util/Map;

    monitor-enter v2

    .line 227
    :try_start_79
    sget-object v4, Lcom/streambundle/v38/DetailMetadata;->BEEG:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 228
    if-eqz v4, :cond_9d

    .line 229
    iget-object v6, v4, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v6, v1, v7}, Lcom/streambundle/v38/DetailMetadata;->better(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 230
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_92

    iget-object v5, v4, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    .line 231
    :cond_92
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_9d

    iget-object v4, v4, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 233
    :cond_9d
    sget-object v4, Lcom/streambundle/v38/DetailMetadata;->BEEG:Ljava/util/Map;

    new-instance v6, Lcom/streambundle/v38/DetailMetadata$Info;

    invoke-direct {v6, v1, v5, v3}, Lcom/streambundle/v38/DetailMetadata$Info;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    invoke-interface {v4, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    monitor-exit v2
    :try_end_a8
    .catchall {:try_start_79 .. :try_end_a8} :catchall_c5

    .line 235
    const-string v0, "dur"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/streambundle/SourceTiming;->remember(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    const-string v0, "dur"

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 237
    cmp-long p0, v3, v1

    if-lez p0, :cond_c4

    invoke-static {p1, v3, v4}, Lcom/streambundleextra/VideoMetadata;->remember(Ljava/lang/String;J)V

    .line 238
    :cond_c4
    return-void

    .line 226
    :catchall_c5
    move-exception p0

    :try_start_c6
    monitor-exit v2
    :try_end_c7
    .catchall {:try_start_c6 .. :try_end_c7} :catchall_c5

    throw p0

    .line 225
    :cond_c8
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/streambundle/v38/DetailMetadata;->addTags(Ljava/util/Set;Ljava/lang/Object;)V

    goto :goto_70
.end method

.method public static searchCard(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;
    .registers 17

    .line 49
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/MainAPI;->getMainUrl()Ljava/lang/String;

    move-result-object v0

    move-object v3, p2

    invoke-static {v0, p2}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 50
    move-object v1, p1

    invoke-static {p1, v0}, Lcom/streambundle/v38/DetailMetadata;->listingTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 51
    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 52
    sget-object v1, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    monitor-enter v1

    .line 53
    :try_start_15
    sget-object v4, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundle/v38/DetailMetadata$Info;

    .line 54
    sget-object v5, Lcom/streambundle/v38/DetailMetadata;->LISTING:Ljava/util/Map;

    new-instance v6, Lcom/streambundle/v38/DetailMetadata$Info;

    if-nez v4, :cond_26

    const-string v7, ""

    goto :goto_28

    :cond_26
    iget-object v7, v4, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    .line 55
    :goto_28
    if-nez v4, :cond_2f

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v4

    goto :goto_31

    :cond_2f
    iget-object v4, v4, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    :goto_31
    invoke-direct {v6, v2, v7, v4}, Lcom/streambundle/v38/DetailMetadata$Info;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    .line 54
    invoke-interface {v5, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    monitor-exit v1
    :try_end_38
    .catchall {:try_start_15 .. :try_end_38} :catchall_47

    .line 57
    nop

    .line 58
    nop

    .line 57
    move-object v1, p0

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    move v7, p6

    move-object/from16 v8, p7

    invoke-static/range {v1 .. v8}, Lcom/lagradost/cloudstream3/MainAPIKt;->newMovieSearchResponse$default(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;

    move-result-object v0

    return-object v0

    .line 52
    :catchall_47
    move-exception v0

    :try_start_48
    monitor-exit v1
    :try_end_49
    .catchall {:try_start_48 .. :try_end_49} :catchall_47

    throw v0
.end method

.method private static truncated(Ljava/lang/String;)Z
    .registers 2

    .line 66
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "(?s).*(?:\u2026|\\.\\.\\.)$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static value(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 297
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object p0

    .line 298
    if-nez p0, :cond_9

    const-string p0, ""

    goto :goto_1e

    :cond_9
    const-string p1, "content"

    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1a

    :cond_16
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object p0

    :goto_1a
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_1e
    return-object p0
.end method

.method private static videoScope(Lorg/jsoup/nodes/Element;)Z
    .registers 4

    .line 206
    nop

    :goto_1
    if-eqz p0, :cond_4f

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "body"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_4f

    .line 207
    :cond_10
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nav|header|footer|aside"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4d

    .line 208
    sget-object v0, Lcom/streambundle/v38/DetailMetadata;->NON_VIDEO_SCOPE:Ljava/util/regex/Pattern;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->id()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->className()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_48

    goto :goto_4d

    .line 206
    :cond_48
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object p0

    goto :goto_1

    .line 208
    :cond_4d
    :goto_4d
    const/4 p0, 0x0

    return p0

    .line 210
    :cond_4f
    :goto_4f
    const/4 p0, 0x1

    return p0
.end method
