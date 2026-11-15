.class public final Lcom/streambundle/v38/BundleMetadata;
.super Ljava/lang/Object;
.source "BundleMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/BundleMetadata$Card;,
        Lcom/streambundle/v38/BundleMetadata$Page;
    }
.end annotation


# static fields
.field private static final ALLOWED:Ljava/util/regex/Pattern;

.field private static final BEEG_DETAILS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final CARDS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/BundleMetadata$Card;",
            ">;"
        }
    .end annotation
.end field

.field private static final CARD_TAGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final EXCLUDED:Ljava/util/regex/Pattern;

.field private static final PAGES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/BundleMetadata$Page;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 16
    const/16 v0, 0x400

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->bounded(I)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/BundleMetadata;->CARDS:Ljava/util/Map;

    .line 17
    const/16 v0, 0xc0

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->bounded(I)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/BundleMetadata;->PAGES:Ljava/util/Map;

    .line 18
    const/16 v0, 0x800

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->bounded(I)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/streambundle/v38/BundleMetadata;->CARD_TAGS:Ljava/util/Map;

    .line 19
    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->bounded(I)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/BundleMetadata;->BEEG_DETAILS:Ljava/util/Map;

    .line 20
    invoke-static {}, Lcom/streambundle/v38/BundleMetadata;->buildPattern()Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/BundleMetadata;->EXCLUDED:Ljava/util/regex/Pattern;

    .line 22
    nop

    .line 21
    const-string v0, "(?iu)(?<![\\p{L}\\p{N}])(?:lesbians?|lesbianism|\u043b\u0435\u0441\u0431\u0438|\u043b\u0435\u0441\u0431\u0438\u044f\u043d(?:\u043a\u0430|\u043a\u0438|\u043e\u043a|\u043a\u0430\u043c\u0438|\u043a\u0430\u043c|\u043a\u0430\u0445)|\u043b\u0435\u0441\u0431\u0438\u0439\u0441\u043a[\u0430-\u044f\u0451]*)(?![\\p{L}\\p{N}])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/BundleMetadata;->ALLOWED:Ljava/util/regex/Pattern;

    .line 22
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 82
    const-string v0, ""

    if-eqz p1, :cond_52

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    goto :goto_52

    .line 84
    :cond_f
    :try_start_f
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\/"

    const-string v2, "/"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

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

    .line 85
    const-string p1, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4b

    const-string p1, "http"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4f

    :cond_4b
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f .. :try_end_4f} :catch_50

    :cond_4f
    return-object v0

    .line 86
    :catch_50
    move-exception p0

    return-object v0

    .line 82
    :cond_52
    :goto_52
    return-object v0
.end method

.method public static beegCard(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 7

    invoke-static {p0, p1}, Lcom/streambundle/v43/Repair43;->rememberBeeg(Lorg/json/JSONObject;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lcom/streambundle/v38/DetailMetadata;->rememberBeeg(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 365
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 366
    const-string v1, "keywords"

    const-string v2, "categories"

    const-string v3, "description"

    const-string v4, "tags"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_15
    const/4 v3, 0x4

    if-lt v2, v3, :cond_34

    .line 368
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_33

    sget-object p0, Lcom/streambundle/v38/BundleMetadata;->CARD_TAGS:Ljava/util/Map;

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    :cond_33
    return-void

    .line 366
    :cond_34
    aget-object v3, v1, v2

    .line 367
    const/16 v4, 0x20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    add-int/lit8 v2, v2, 0x1

    goto :goto_15
.end method

.method public static beegInspected(Ljava/lang/String;)V
    .registers 4

    .line 349
    sget-object v0, Lcom/streambundle/v38/BundleMetadata;->BEEG_DETAILS:Ljava/util/Map;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    return-void
.end method

.method public static blocked(Ljava/lang/Object;)Z
    .registers 2

    .line 376
    sget-boolean v0, Lcom/streambundle/v38/BundleSettings;->HIDE_BLOCKED_CATEGORIES:Z

    if-eqz v0, :cond_12

    if-eqz p0, :cond_12

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->explicitlyAllowed(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->categoryEvidence(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method private static bounded(I)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TV;>;"
        }
    .end annotation

    .line 43
    new-instance v0, Lcom/streambundle/v38/BundleMetadata$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x20

    invoke-direct {v0, v3, v1, v2, p0}, Lcom/streambundle/v38/BundleMetadata$1;-><init>(IFZI)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method private static buildPattern()Ljava/util/regex/Pattern;
    .registers 6

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    sget-object v1, Lcom/streambundle/v38/BundleSettings;->BLOCKED_CATEGORIES:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_9
    if-lt v3, v2, :cond_49

    .line 66
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_14
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_34

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "(?iu)(?<![\\p{L}\\p{N}])(?:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")(?![\\p{L}\\p{N}])"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    return-object v0

    .line 67
    :cond_34
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 68
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_45

    const/16 v1, 0x7c

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    :cond_45
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_14

    .line 65
    :cond_49
    aget-object v4, v1, v3

    invoke-static {v4}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_9
.end method

.method public static cards(Ljava/util/List;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 409
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-object p0

    .line 410
    :cond_7
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 411
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 412
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_20

    .line 423
    return-object v1

    .line 412
    :cond_20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 413
    if-eqz v2, :cond_5d

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "SearchResponse"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_37

    goto :goto_5d

    .line 417
    :cond_37
    const-string v3, "Url"

    invoke-static {v2, v3}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 418
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4b

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 419
    :cond_4b
    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_56

    goto :goto_19

    .line 420
    :cond_56
    invoke-static {v2}, Lcom/streambundle/v38/BundleMetadata;->response(Ljava/lang/Object;)V

    .line 421
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 414
    :cond_5d
    :goto_5d
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    goto :goto_19
.end method

.method private static categoryEvidence(Ljava/lang/Object;)Ljava/lang/String;
    .registers 9

    .line 380
    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 381
    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 382
    sget-object v2, Lcom/streambundle/v38/BundleMetadata;->PAGES:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundle/v38/BundleMetadata$Page;

    .line 383
    sget-object v3, Lcom/streambundle/v38/BundleMetadata;->CARDS:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundle/v38/BundleMetadata$Card;

    .line 384
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Name"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 385
    const/16 v5, 0x20

    if-eqz v3, :cond_3a

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v3, v3, Lcom/streambundle/v38/BundleMetadata$Card;->title:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    :cond_3a
    sget-object v3, Lcom/streambundle/v38/BundleMetadata;->CARD_TAGS:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 387
    if-eqz v1, :cond_4b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    :cond_4b
    if-eqz v2, :cond_60

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v2, Lcom/streambundle/v38/BundleMetadata$Page;->ownCategories:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v2, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    :cond_60
    const-string v1, "(?i)https?://(?:www\\.)?beeg\\.porn/xid/.*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    .line 390
    const-string v1, "Tags"

    invoke-static {p0, v1}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 391
    instance-of v3, v1, Ljava/lang/Iterable;

    if-eqz v3, :cond_a1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_76
    :goto_76
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_7d

    goto :goto_a1

    :cond_7d
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 392
    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 393
    if-nez v0, :cond_99

    if-eqz v2, :cond_99

    iget-object v6, v2, Lcom/streambundle/v38/BundleMetadata$Page;->siteKeywords:Ljava/util/Set;

    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_76

    .line 394
    :cond_99
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_76

    .line 396
    :cond_a1
    :goto_a1
    const-string v1, "Plot"

    invoke-static {p0, v1}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 397
    if-nez v0, :cond_cc

    if-nez v2, :cond_b0

    goto :goto_cc

    .line 398
    :cond_b0
    iget-boolean v0, v2, Lcom/streambundle/v38/BundleMetadata$Page;->videoPage:Z

    if-eqz v0, :cond_d3

    iget-object v0, v2, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d3

    iget-object v0, v2, Lcom/streambundle/v38/BundleMetadata$Page;->siteDescription:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->sitePlot(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d3

    .line 399
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_d3

    .line 397
    :cond_cc
    :goto_cc
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    :cond_d3
    :goto_d3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static checkDetail(Ljava/lang/Object;)V
    .registers 3

    .line 426
    if-eqz p0, :cond_2f

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LoadResponse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2f

    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v48/ResolveMedia;->hurt(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2f

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->blocked(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    goto :goto_2f

    .line 427
    :cond_29
    new-instance p0, Lcom/streambundle/v38/Screening$FilteredVideo;

    invoke-direct {p0}, Lcom/streambundle/v38/Screening$FilteredVideo;-><init>()V

    throw p0

    .line 428
    :cond_2f
    :goto_2f
    return-void
.end method

.method private static content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 121
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    :goto_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_11

    .line 126
    const-string p0, ""

    return-object p0

    .line 121
    :cond_11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/jsoup/nodes/Element;

    .line 122
    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->videoScope(Lorg/jsoup/nodes/Element;)Z

    move-result v0

    if-nez v0, :cond_1e

    goto :goto_8

    .line 123
    :cond_1e
    const-string v0, "content"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2f

    :cond_2b
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object p1

    :goto_2f
    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 124
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    return-object p1
.end method

.method public static document(Ljava/lang/Object;)V
    .registers 13

    .line 172
    const-string v0, "poster"

    const-string v1, ""

    if-nez p0, :cond_7

    return-void

    .line 175
    :cond_7
    :try_start_7
    instance-of v2, p0, Lorg/jsoup/nodes/Document;

    const/4 v3, 0x0

    if-eqz v2, :cond_f

    check-cast p0, Lorg/jsoup/nodes/Document;

    goto :goto_4c

    .line 176
    :cond_f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "com.streambundlehtml.nodes.Document"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2cd

    .line 177
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "outerHtml"

    new-array v5, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 178
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "baseUri"

    new-array v6, v3, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v4, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 177
    invoke-static {v2, p0}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p0

    .line 178
    nop

    .line 180
    :goto_4c
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v2

    .line 181
    invoke-static {v2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5b

    return-void

    .line 182
    :cond_5b
    new-instance v4, Lcom/streambundle/v38/BundleMetadata$Page;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/streambundle/v38/BundleMetadata$Page;-><init>(Lcom/streambundle/v38/BundleMetadata$Page;)V

    .line 183
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object v5

    const-string v6, "(?is).*(?:site unavailable|access denied|just a moment|error [45][0-9][0-9]).*"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_70

    move v5, v3

    goto :goto_71

    :cond_70
    move v5, v6

    :goto_71
    iput-boolean v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->available:Z

    .line 184
    const-string v5, "meta[property=og:site_name]"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->site:Ljava/lang/String;

    .line 185
    const-string v5, "meta[name=description]"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->siteDescription:Ljava/lang/String;

    .line 186
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    iput-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->siteKeywords:Ljava/util/Set;

    .line 187
    const-string v5, "meta[name=keywords]"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "[,;]"

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v7, v5

    move v8, v3

    :goto_98
    if-lt v8, v7, :cond_2ba

    .line 189
    const-string v5, "h1"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v7, v4, Lcom/streambundle/v38/BundleMetadata$Page;->site:Ljava/lang/String;

    invoke-static {v5, v2, v7}, Lcom/streambundle/v38/BundleMetadata;->title(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->title:Ljava/lang/String;

    .line 190
    const-string v5, "#tab_video_info .description, #tab_video_info .item-description, .video-info .description, .video-description, #video-description, [itemprop=description]:not(meta), meta[itemprop=description]"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    .line 193
    const-string v5, "meta[property=og:type]"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    .line 194
    const-string v7, "video"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d6

    const-string v7, "video."

    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_d6

    .line 195
    const-string v5, "video, iframe#video2, #player, .video-player"

    invoke-virtual {p0, v5}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v5

    if-nez v5, :cond_d6

    move v5, v3

    goto :goto_d7

    :cond_d6
    move v5, v6

    .line 194
    :goto_d7
    iput-boolean v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->videoPage:Z

    .line 196
    iget-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_fd

    iget-boolean v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->videoPage:Z

    if-eqz v5, :cond_fd

    .line 197
    const-string v5, "meta[property=og:description]"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 198
    invoke-static {v5}, Lcom/streambundle/v38/BundleMetadata;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v4, Lcom/streambundle/v38/BundleMetadata$Page;->siteDescription:Ljava/lang/String;

    invoke-static {v8}, Lcom/streambundle/v38/BundleMetadata;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_fd

    .line 199
    iput-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    .line 201
    :cond_fd
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    const-string v7, "#tab_video_info a[href*=/tags/], #tab_video_info a[href*=/categories/], #tab_video_info a[rel=tag], #tab_video_info .tags, .video-info .tags, .video-tags, .video-categories, .video-details .tags, .video_tags, [itemprop=keywords]:not(meta), meta[property=video:tag], meta[property=og:video:tag]"

    invoke-virtual {p0, v7}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_10c
    :goto_10c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8
    :try_end_110
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_110} :catch_2ce

    const-string v9, "content"

    if-nez v8, :cond_294

    .line 206
    :try_start_114
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->ownCategories:Ljava/lang/String;

    .line 207
    const-string v5, "script[type=application/ld+json]"

    invoke-virtual {p0, v5}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_124
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7
    :try_end_128
    .catch Ljava/lang/Exception; {:try_start_114 .. :try_end_128} :catch_2ce

    const-string v8, " "

    if-nez v7, :cond_12e

    goto/16 :goto_1be

    :cond_12e
    :try_start_12e
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jsoup/nodes/Element;
    :try_end_134
    .catch Ljava/lang/Exception; {:try_start_12e .. :try_end_134} :catch_2ce

    .line 209
    :try_start_134
    new-instance v10, Lorg/json/JSONTokener;

    invoke-virtual {v7}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v10, v7}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7, v2, v3, v6}, Lcom/streambundle/v38/BundleMetadata;->ownVideo(Ljava/lang/Object;Ljava/lang/String;IZ)Lorg/json/JSONObject;

    move-result-object v7

    .line 210
    if-nez v7, :cond_148

    goto :goto_124

    .line 211
    :cond_148
    const-string v10, "name"

    invoke-virtual {v7, v10, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v4, Lcom/streambundle/v38/BundleMetadata$Page;->site:Ljava/lang/String;

    invoke-static {v10, v2, v11}, Lcom/streambundle/v38/BundleMetadata;->title(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 212
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_15c

    iput-object v10, v4, Lcom/streambundle/v38/BundleMetadata$Page;->title:Ljava/lang/String;

    .line 213
    :cond_15c
    const-string v10, "description"

    invoke-virtual {v7, v10, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/streambundle/v38/BundleMetadata;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 214
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_16e

    iput-object v10, v4, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    .line 215
    :cond_16e
    iget-object v10, v4, Lcom/streambundle/v38/BundleMetadata$Page;->ownCategories:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v11, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "keywords"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "genre"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v4, Lcom/streambundle/v38/BundleMetadata$Page;->ownCategories:Ljava/lang/String;

    .line 216
    const-string v10, "thumbnailUrl"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 217
    instance-of v10, v7, Lorg/json/JSONArray;

    if-eqz v10, :cond_1b3

    check-cast v7, Lorg/json/JSONArray;

    invoke-virtual {v7, v3}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v7

    .line 218
    :cond_1b3
    invoke-static {v7}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v4, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;
    :try_end_1bd
    .catch Ljava/lang/Exception; {:try_start_134 .. :try_end_1bd} :catch_291

    .line 219
    nop

    .line 222
    :goto_1be
    :try_start_1be
    iget-object v1, v4, Lcom/streambundle/v38/BundleMetadata$Page;->title:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1d4

    const-string v1, "meta[property=og:title], meta[name=twitter:title]"

    invoke-static {p0, v1}, Lcom/streambundle/v38/BundleMetadata;->content(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->site:Ljava/lang/String;

    invoke-static {v1, v2, v5}, Lcom/streambundle/v38/BundleMetadata;->title(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v4, Lcom/streambundle/v38/BundleMetadata$Page;->title:Ljava/lang/String;

    .line 223
    :cond_1d4
    iget-object v1, v4, Lcom/streambundle/v38/BundleMetadata$Page;->title:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1e8

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object v1

    iget-object v5, v4, Lcom/streambundle/v38/BundleMetadata$Page;->site:Ljava/lang/String;

    invoke-static {v1, v2, v5}, Lcom/streambundle/v38/BundleMetadata;->title(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v4, Lcom/streambundle/v38/BundleMetadata$Page;->title:Ljava/lang/String;

    .line 224
    :cond_1e8
    iget-object v1, v4, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->image(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_22b

    const/4 v1, 0x3

    new-array v5, v1, [Ljava/lang/String;

    const-string v7, "video[poster]"

    aput-object v7, v5, v3

    const-string v7, "meta[property=og:image]"

    aput-object v7, v5, v6

    const-string v6, "meta[name=twitter:image]"

    const/4 v7, 0x2

    aput-object v6, v5, v7

    :goto_200
    if-lt v3, v1, :cond_203

    goto :goto_22b

    :cond_203
    aget-object v6, v5, v3

    .line 225
    invoke-virtual {p0, v6}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    .line 226
    if-nez v6, :cond_20c

    goto :goto_228

    .line 227
    :cond_20c
    invoke-virtual {v6, v0}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_217

    invoke-virtual {v6, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_21b

    :cond_217
    invoke-virtual {v6, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_21b
    invoke-static {v2, v6}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 228
    invoke-static {v6}, Lcom/streambundle/v38/BundleMetadata;->image(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_228

    iput-object v6, v4, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;

    goto :goto_22b

    .line 224
    :cond_228
    :goto_228
    add-int/lit8 v3, v3, 0x1

    goto :goto_200

    .line 230
    :cond_22b
    :goto_22b
    sget-object v0, Lcom/streambundle/v38/BundleMetadata;->PAGES:Ljava/util/Map;

    invoke-static {v2}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    invoke-static {p0}, Lcom/streambundle/v38/PosterSupport;->document(Lorg/jsoup/nodes/Document;)V

    invoke-static {p0}, Lcom/streambundle/v38/DetailMetadata;->collect(Lorg/jsoup/nodes/Document;)V

    invoke-static {v4, v2}, Lcom/streambundle/v38/DetailMetadata;->reconcile(Ljava/lang/Object;Ljava/lang/String;)V

    .line 232
    const-string v0, "a[href][data-tags], a[href][data-description]"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_241
    :goto_241
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_249

    .line 238
    goto/16 :goto_2cf

    .line 232
    :cond_249
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 233
    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->videoScope(Lorg/jsoup/nodes/Element;)Z

    move-result v1

    if-nez v1, :cond_256

    goto :goto_241

    .line 234
    :cond_256
    const-string v1, "href"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 235
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_241

    .line 236
    sget-object v3, Lcom/streambundle/v38/BundleMetadata;->CARD_TAGS:Ljava/util/Map;

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "data-tags"

    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "data-description"

    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_241

    .line 220
    :catch_291
    move-exception v7

    goto/16 :goto_124

    .line 202
    :cond_294
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/jsoup/nodes/Element;

    .line 205
    invoke-static {v8}, Lcom/streambundle/v38/BundleMetadata;->videoScope(Lorg/jsoup/nodes/Element;)Z

    move-result v10

    if-eqz v10, :cond_10c

    const/16 v10, 0x20

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8, v9}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2b1

    invoke-virtual {v8, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_2b5

    :cond_2b1
    invoke-virtual {v8}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v8

    :goto_2b5
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_10c

    .line 187
    :cond_2ba
    aget-object v9, v5, v8

    .line 188
    iget-object v10, v4, Lcom/streambundle/v38/BundleMetadata$Page;->siteKeywords:Ljava/util/Set;

    invoke-static {v9}, Lcom/streambundle/v38/BundleMetadata;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v10, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_2c9
    .catch Ljava/lang/Exception; {:try_start_1be .. :try_end_2c9} :catch_2ce

    .line 187
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_98

    .line 179
    :cond_2cd
    return-void

    .line 238
    :catch_2ce
    move-exception p0

    .line 239
    :goto_2cf
    return-void
.end method

.method static explicitlyAllowed(Ljava/lang/Object;)Z
    .registers 2

    .line 372
    sget-object v0, Lcom/streambundle/v38/BundleMetadata;->ALLOWED:Ljava/util/regex/Pattern;

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->categoryEvidence(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    return p0
.end method

.method private static generic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5

    .line 129
    const-string v0, ""

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 131
    :try_start_c
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "^www\\."

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_1e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_1e} :catch_1f

    goto :goto_21

    .line 132
    :catch_1f
    move-exception p1

    move-object p1, v0

    .line 133
    :goto_21
    const-string v1, "\\.[^.]+$"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 134
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_49

    invoke-virtual {p0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_49

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_49

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_49

    .line 135
    const-string p1, "(?iu)(?:home|search|videos?|\u0433\u043b\u0430\u0432\u043d\u0430\u044f|\u043f\u043e\u0438\u0441\u043a|\u0432\u0438\u0434\u0435\u043e|#?\\d+)"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_49

    .line 134
    const/4 p0, 0x0

    return p0

    :cond_49
    const/4 p0, 0x1

    return p0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6

    .line 48
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 49
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
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_4 .. :try_end_24} :catch_25

    return-object p0

    .line 50
    :catch_25
    move-exception p0

    return-object v0
.end method

.method private static hasHeader(Ljava/util/Map;Ljava/lang/String;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 324
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_10

    .line 325
    const/4 p0, 0x0

    return p0

    .line 324
    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x1

    return p0
.end method

.method static headers(Ljava/lang/Object;)Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 241
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 242
    instance-of v1, p0, Ljava/util/Map;

    if-eqz v1, :cond_40

    check-cast p0, Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_13
    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1a

    goto :goto_40

    :cond_1a
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 243
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_13

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_13

    .line 244
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13

    .line 245
    :cond_40
    :goto_40
    return-object v0
.end method

.method private static image(Ljava/lang/String;)Z
    .registers 2

    .line 109
    const-string v0, "https://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "http://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 p0, 0x0

    return p0

    .line 110
    :cond_12
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, ".*(?:placeholder|no[-_]thumb|/blank[./]|/logos?[._/]|/flags?/|flagcdn|flagpedia|gtranslate|/icons?/|/avatars?/|\\.svg(?:[?#].*)?).*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method static inspected(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z
    .registers 7

    .line 353
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.lagradost.VideoHubProvider"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_46

    .line 354
    const-string p0, "(?i)https?://(?:www\\.)?beeg\\.porn/xid/.*"

    invoke-virtual {p1, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_46

    .line 355
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string p1, "^/xid/([0-9]+).*$"

    const-string p2, "$1"

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 356
    sget-object p1, Lcom/streambundle/v38/BundleMetadata;->BEEG_DETAILS:Ljava/util/Map;

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    .line 357
    if-eqz p0, :cond_45

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    sub-long/2addr p1, v2

    const-wide/32 v2, 0x493e0

    cmp-long p0, p1, v2

    if-gez p0, :cond_45

    return v1

    :cond_45
    return v0

    .line 359
    :cond_46
    sget-object p0, Lcom/streambundle/v38/BundleMetadata;->PAGES:Ljava/util/Map;

    const-string v2, "Url"

    invoke-static {p2, v2}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/streambundle/v38/BundleMetadata$Page;

    .line 360
    if-nez p0, :cond_6a

    sget-object p0, Lcom/streambundle/v38/BundleMetadata;->PAGES:Ljava/util/Map;

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/streambundle/v38/BundleMetadata$Page;

    .line 361
    :cond_6a
    if-eqz p0, :cond_71

    iget-boolean p0, p0, Lcom/streambundle/v38/BundleMetadata$Page;->available:Z

    if-nez p0, :cond_71

    return v0

    :cond_71
    return v1
.end method

.method public static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    .line 90
    const-string v0, ""

    const-string v1, "&"

    :try_start_4
    const-string v2, "&amp;"

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    .line 91
    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 92
    if-nez v3, :cond_15

    return-object p0

    .line 93
    :cond_15
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "^www\\."

    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 94
    invoke-virtual {v2}, Ljava/net/URI;->normalize()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "/+$"

    invoke-virtual {v4, v5, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 95
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 96
    invoke-virtual {v2}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    if-eqz v5, :cond_72

    invoke-virtual {v2}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    move v5, v6

    :goto_49
    if-lt v5, v2, :cond_4c

    goto :goto_72

    :cond_4c
    aget-object v7, v1, v5

    .line 97
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_55

    goto :goto_6f

    .line 98
    :cond_55
    const-string v8, "="

    const/4 v9, 0x2

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v6

    sget-object v9, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    .line 99
    const-string v9, "utm_.*|ref|referrer|referer|from|fbclid|gclid|yclid"

    invoke-virtual {v8, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_6f

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    :cond_6f
    :goto_6f
    add-int/lit8 v5, v5, 0x1

    goto :goto_49

    .line 101
    :cond_72
    :goto_72
    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 103
    nop

    :goto_7f
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    if-lt v6, v1, :cond_8a

    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 104
    :cond_8a
    if-nez v6, :cond_8f

    const/16 v1, 0x3f

    goto :goto_91

    :cond_8f
    const/16 v1, 0x26

    :goto_91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_9e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_9e} :catch_a1

    .line 103
    add-int/lit8 v6, v6, 0x1

    goto :goto_7f

    .line 106
    :catch_a1
    move-exception v0

    return-object p0
.end method

.method public static matches(Ljava/lang/String;)Z
    .registers 2

    .line 78
    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 79
    sget-object v0, Lcom/streambundle/v38/BundleMetadata;->ALLOWED:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_1e

    sget-object v0, Lcom/streambundle/v38/BundleMetadata;->EXCLUDED:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    if-eqz p0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method private static normalized(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 74
    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-static {p0, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p0

    .line 75
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "[-_\\p{Z}]+"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\s+"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 74
    return-object p0
.end method

.method static ownVideo(Ljava/lang/Object;Ljava/lang/String;IZ)Lorg/json/JSONObject;
    .registers 10

    .line 149
    const/4 v0, 0x7

    const/4 v1, 0x0

    if-le p2, v0, :cond_5

    return-object v1

    .line 150
    :cond_5
    instance-of v0, p0, Lorg/json/JSONArray;

    const/4 v2, 0x0

    if-eqz v0, :cond_25

    .line 151
    move-object v0, p0

    check-cast v0, Lorg/json/JSONArray;

    .line 152
    move v3, v2

    :goto_e
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v3, v4, :cond_15

    goto :goto_25

    .line 153
    :cond_15
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v5, p2, 0x1

    invoke-static {v4, p1, v5, v2}, Lcom/streambundle/v38/BundleMetadata;->ownVideo(Ljava/lang/Object;Ljava/lang/String;IZ)Lorg/json/JSONObject;

    move-result-object v4

    .line 154
    if-eqz v4, :cond_22

    return-object v4

    .line 152
    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 157
    :cond_25
    :goto_25
    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_8d

    .line 158
    check-cast p0, Lorg/json/JSONObject;

    .line 159
    const-string v0, "@type"

    const-string v3, ""

    invoke-virtual {p0, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 160
    const-string v4, "VideoObject"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_43

    const-string v4, "Movie"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 161
    :cond_43
    const-string v0, "@id"

    invoke-virtual {p0, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "url"

    invoke-virtual {p0, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_58

    if-eqz p3, :cond_6b

    goto :goto_6a

    :cond_58
    invoke-static {p1, v0}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_6b

    :goto_6a
    return-object p0

    .line 164
    :cond_6b
    const-string p3, "@graph"

    const-string v0, "mainEntity"

    filled-new-array {v0, p3}, [Ljava/lang/String;

    move-result-object p3

    :goto_73
    const/4 v3, 0x2

    if-lt v2, v3, :cond_77

    goto :goto_8d

    :cond_77
    aget-object v3, p3, v2

    .line 165
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v5, p2, 0x1

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-static {v4, p1, v5, v3}, Lcom/streambundle/v38/BundleMetadata;->ownVideo(Ljava/lang/Object;Ljava/lang/String;IZ)Lorg/json/JSONObject;

    move-result-object v3

    .line 166
    if-eqz v3, :cond_8a

    return-object v3

    .line 164
    :cond_8a
    add-int/lit8 v2, v2, 0x1

    goto :goto_73

    .line 169
    :cond_8d
    :goto_8d
    return-object v1
.end method

.method public static response(Ljava/lang/Object;)V
    .registers 2

    :try_start_0
    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->updateResponse(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_3} :catch_4

    goto :goto_5

    :catch_4
    move-exception v0

    :goto_5
    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->response(Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/streambundle/v38/SearchAndPosters;->reusePoster(Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/streambundle/v38/DetailMetadata;->enrich(Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/streambundle/v38/FastDetails;->remember(Ljava/lang/Object;)V

    return-void
.end method

.method static restoreSearchPoster(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 8

    .line 329
    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->response(Ljava/lang/Object;)V

    .line 330
    const-string v0, "PosterUrl"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    return-void

    .line 331
    :cond_14
    invoke-static {p1}, Lcom/streambundle/v38/PosterSupport;->loaded(Ljava/lang/String;)Lcom/streambundle/v38/PosterSupport$Poster;

    move-result-object v1

    .line 332
    const-string v2, "PosterHeaders"

    const-string v3, "Referer"

    if-eqz v1, :cond_43

    .line 333
    const-class p1, Ljava/lang/String;

    iget-object v4, v1, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {p0, v0, p1, v4}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 334
    new-instance p1, Ljava/util/LinkedHashMap;

    iget-object v0, v1, Lcom/streambundle/v38/PosterSupport$Poster;->headers:Ljava/util/Map;

    invoke-direct {p1, v0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 335
    invoke-static {p1, v3}, Lcom/streambundle/v38/BundleMetadata;->hasHeader(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3d

    iget-object v0, v1, Lcom/streambundle/v38/PosterSupport$Poster;->page:Ljava/lang/String;

    iget-object v1, v1, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/streambundle/v38/PosterSupport;->referer(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    :cond_3d
    const-class v0, Ljava/util/Map;

    invoke-static {p0, v2, v0, p1}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 337
    return-void

    .line 339
    :cond_43
    sget-object v1, Lcom/streambundle/v38/BundleMetadata;->PAGES:Ljava/util/Map;

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundle/v38/BundleMetadata$Page;

    .line 340
    if-eqz v1, :cond_73

    iget-object v4, v1, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;

    invoke-static {v4}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_73

    .line 341
    const-class v4, Ljava/lang/String;

    iget-object v5, v1, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;

    invoke-static {p0, v0, v4, v5}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 342
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 343
    iget-object v1, v1, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/streambundle/v38/PosterSupport;->referer(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    const-class p1, Ljava/util/Map;

    invoke-static {p0, v2, p1, v0}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 346
    :cond_73
    return-void
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

    .line 53
    if-nez p0, :cond_3

    return-void

    .line 54
    :cond_3
    :try_start_3
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
    :try_end_27
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_3 .. :try_end_27} :catch_28

    goto :goto_29

    .line 55
    :catch_28
    move-exception p0

    .line 56
    :goto_29
    return-void
.end method

.method private static sitePlot(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .line 404
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return p0

    .line 405
    :cond_8
    const-string v0, "(?isu)^\u0434\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c:[^\\n]*\\n+"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 406
    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static string(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 57
    if-eqz p0, :cond_c

    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne p0, v0, :cond_7

    goto :goto_c

    :cond_7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_e

    :cond_c
    :goto_c
    const-string p0, ""

    :goto_e
    return-object p0
.end method

.method static text(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 59
    if-eqz p0, :cond_36

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_36

    .line 60
    :cond_9
    const/16 v0, 0x3c

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_19

    const/16 v0, 0x26

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_21

    :cond_19
    invoke-static {p0}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->text()Ljava/lang/String;

    move-result-object p0

    .line 61
    :cond_21
    const/16 v0, 0xa0

    const/16 v1, 0x20

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\s+"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 59
    :cond_36
    :goto_36
    const-string p0, ""

    return-object p0
.end method

.method static title(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 138
    const-string v0, ""

    invoke-static {p0}, Lcom/streambundle/v38/BundleMetadata;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 140
    :try_start_6
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "^www\\."

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_18
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_18} :catch_19

    goto :goto_1b

    .line 141
    :catch_19
    move-exception v1

    move-object v1, v0

    .line 142
    :goto_1b
    const-string v2, "\\.[^.]+$"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {p2, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_26
    const/4 v3, 0x3

    if-lt v2, v3, :cond_32

    .line 146
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/BundleMetadata;->generic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_30

    goto :goto_31

    :cond_30
    move-object v0, p0

    :goto_31
    return-object v0

    .line 142
    :cond_32
    aget-object v3, v1, v2

    .line 143
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3b

    goto :goto_58

    .line 144
    :cond_3b
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "(?iu)\\s*(?:\\||[-\u2013\u2014])\\s*"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\\s*$"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 142
    :goto_58
    add-int/lit8 v2, v2, 0x1

    goto :goto_26
.end method

.method private static updateResponse(Ljava/lang/Object;)V
    .registers 14

    .line 252
    if-nez p0, :cond_3

    return-void

    .line 253
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 254
    const-string v1, "LoadResponse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    .line 255
    if-nez v1, :cond_1c

    const-string v2, "SearchResponse"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1c

    return-void

    .line 256
    :cond_1c
    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 257
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2d

    return-void

    .line 258
    :cond_2d
    invoke-static {v0}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 259
    sget-object v3, Lcom/streambundle/v38/BundleMetadata;->PAGES:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundle/v38/BundleMetadata$Page;

    .line 260
    if-nez v3, :cond_3e

    const-string v4, ""

    goto :goto_40

    :cond_3e
    iget-object v4, v3, Lcom/streambundle/v38/BundleMetadata$Page;->site:Ljava/lang/String;

    .line 261
    :goto_40
    const-string v5, "Name"

    invoke-static {p0, v5}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v0, v4}, Lcom/streambundle/v38/BundleMetadata;->title(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 262
    const-string v6, "PosterUrl"

    invoke-static {p0, v6}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 263
    nop

    .line 264
    invoke-static {v0}, Lcom/streambundle/v38/PosterSupport;->listing(Ljava/lang/String;)Lcom/streambundle/v38/PosterSupport$Poster;

    move-result-object v8

    .line 265
    const-string v9, "PosterHeaders"

    invoke-static {p0, v9}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Lcom/streambundle/v38/BundleMetadata;->headers(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v10

    .line 266
    if-eqz v1, :cond_cc

    .line 267
    sget-object v11, Lcom/streambundle/v38/BundleMetadata;->CARDS:Ljava/util/Map;

    invoke-interface {v11, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundle/v38/BundleMetadata$Card;

    const-string v11, ""
    if-eqz v2, :listing_title_ready
    iget-object v11, v2, Lcom/streambundle/v38/BundleMetadata$Card;->title:Ljava/lang/String;

    :listing_title_ready
    const-string v12, ""
    if-eqz v3, :page_title_ready
    iget-object v12, v3, Lcom/streambundle/v38/BundleMetadata$Page;->title:Ljava/lang/String;

    :page_title_ready
    invoke-static {v4, v12, v11}, Lcom/streambundle/v38/DetailMetadata;->preferredTitle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4

    .line 270
    if-eqz v8, :cond_98

    .line 271
    iget-object v2, v8, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    .line 272
    invoke-static {v10, v7, v8}, Lcom/streambundle/v38/BundleMetadata;->withListingHeaders(Ljava/util/Map;Ljava/lang/String;Lcom/streambundle/v38/PosterSupport$Poster;)Ljava/util/Map;

    move-result-object v10

    .line 273
    move-object v7, v2

    goto :goto_b8

    :cond_98
    if-eqz v2, :cond_ac

    iget-object v8, v2, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    invoke-static {v8}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_ac

    .line 274
    iget-object v7, v2, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    .line 275
    new-instance v10, Ljava/util/LinkedHashMap;

    iget-object v2, v2, Lcom/streambundle/v38/BundleMetadata$Card;->headers:Ljava/util/Map;

    invoke-direct {v10, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 276
    :cond_ab
    goto :goto_b8

    :cond_ac
    if-eqz v3, :cond_ab

    iget-object v2, v3, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;

    invoke-static {v2}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_ab

    iget-object v7, v3, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;

    .line 277
    :goto_b8
    if-eqz v3, :cond_11e

    iget-object v2, v3, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_11e

    const-class v2, Ljava/lang/String;

    iget-object v3, v3, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    const-string v8, "Plot"

    invoke-static {p0, v8, v2, v3}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 278
    goto :goto_11e

    .line 279
    :cond_cc
    if-eqz v8, :cond_d5

    .line 280
    iget-object v3, v8, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    .line 281
    invoke-static {v10, v7, v8}, Lcom/streambundle/v38/BundleMetadata;->withListingHeaders(Ljava/util/Map;Ljava/lang/String;Lcom/streambundle/v38/PosterSupport$Poster;)Ljava/util/Map;

    move-result-object v10

    move-object v7, v3

    .line 283
    :cond_d5
    new-instance v3, Lcom/streambundle/v38/BundleMetadata$Card;

    const/4 v8, 0x0

    invoke-direct {v3, v8}, Lcom/streambundle/v38/BundleMetadata$Card;-><init>(Lcom/streambundle/v38/BundleMetadata$Card;)V

    .line 284
    iput-object v4, v3, Lcom/streambundle/v38/BundleMetadata$Card;->title:Ljava/lang/String;

    .line 285
    iput-object v7, v3, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    .line 286
    iput-object v10, v3, Lcom/streambundle/v38/BundleMetadata$Card;->headers:Ljava/util/Map;

    .line 287
    sget-object v8, Lcom/streambundle/v38/BundleMetadata;->CARDS:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/streambundle/v38/BundleMetadata$Card;

    .line 288
    if-eqz v8, :cond_119

    .line 289
    iget-object v11, v3, Lcom/streambundle/v38/BundleMetadata$Card;->title:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_f7

    iget-object v11, v8, Lcom/streambundle/v38/BundleMetadata$Card;->title:Ljava/lang/String;

    iput-object v11, v3, Lcom/streambundle/v38/BundleMetadata$Card;->title:Ljava/lang/String;

    .line 290
    :cond_f7
    iget-object v11, v3, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    invoke-static {v11}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_119

    iget-object v11, v8, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    invoke-static {v11}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_119

    .line 291
    iget-object v7, v8, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    iput-object v7, v3, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    .line 292
    new-instance v7, Ljava/util/LinkedHashMap;

    iget-object v8, v8, Lcom/streambundle/v38/BundleMetadata$Card;->headers:Ljava/util/Map;

    invoke-direct {v7, v8}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    iput-object v7, v3, Lcom/streambundle/v38/BundleMetadata$Card;->headers:Ljava/util/Map;

    .line 293
    iget-object v7, v3, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    .line 294
    iget-object v8, v3, Lcom/streambundle/v38/BundleMetadata$Card;->headers:Ljava/util/Map;

    move-object v10, v8

    .line 297
    :cond_119
    sget-object v8, Lcom/streambundle/v38/BundleMetadata;->CARDS:Ljava/util/Map;

    invoke-interface {v8, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    :cond_11e
    :goto_11e
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_129

    const-class v2, Ljava/lang/String;

    invoke-static {p0, v5, v2, v4}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 300
    :cond_129
    invoke-static {v7}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_15f

    .line 301
    const-class v2, Ljava/lang/String;

    invoke-static {p0, v6, v2, v7}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 302
    if-eqz v1, :cond_13d

    const-string v2, "BackgroundPosterUrl"

    const-class v3, Ljava/lang/String;

    invoke-static {p0, v2, v3, v7}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 303
    :cond_13d
    const-string v2, "Referer"

    invoke-static {v10, v2}, Lcom/streambundle/v38/BundleMetadata;->hasHeader(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_148

    invoke-interface {v10, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    :cond_148
    const-string v2, "User-Agent"

    invoke-static {v10, v2}, Lcom/streambundle/v38/BundleMetadata;->hasHeader(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_155

    .line 305
    const-string v3, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-interface {v10, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    :cond_155
    const-class v2, Ljava/util/Map;

    invoke-static {p0, v9, v2, v10}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 307
    if-eqz v1, :cond_15f

    invoke-static {v0, p0}, Lcom/streambundle/v38/PosterSupport;->rememberLoaded(Ljava/lang/String;Ljava/lang/Object;)V

    .line 309
    :cond_15f
    return-void
.end method

.method private static videoScope(Lorg/jsoup/nodes/Element;)Z
    .registers 4

    .line 113
    nop

    :goto_1
    if-nez p0, :cond_5

    .line 118
    const/4 p0, 0x1

    return p0

    .line 114
    :cond_5
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->className()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 115
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "nav|aside|footer|header"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_29

    .line 116
    const-string v1, ".*(?:sidebar|related|recommend|navigation|footer).*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    goto :goto_29

    .line 113
    :cond_24
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object p0

    goto :goto_1

    .line 116
    :cond_29
    :goto_29
    const/4 p0, 0x0

    return p0
.end method

.method private static withListingHeaders(Ljava/util/Map;Ljava/lang/String;Lcom/streambundle/v38/PosterSupport$Poster;)Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/PosterSupport$Poster;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 313
    iget-object v0, p2, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/streambundle/v38/PosterSupport;->sameHost(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_12

    .line 314
    const-string p1, "Cookie"

    invoke-static {p0, p1}, Lcom/streambundle/v38/PosterSupport;->removeHeader(Ljava/util/Map;Ljava/lang/String;)V

    .line 315
    const-string p1, "Authorization"

    invoke-static {p0, p1}, Lcom/streambundle/v38/PosterSupport;->removeHeader(Ljava/util/Map;Ljava/lang/String;)V

    .line 317
    :cond_12
    const-string p1, "Referer"

    invoke-static {p0, p1}, Lcom/streambundle/v38/PosterSupport;->removeHeader(Ljava/util/Map;Ljava/lang/String;)V

    .line 318
    iget-object v0, p2, Lcom/streambundle/v38/PosterSupport$Poster;->page:Ljava/lang/String;

    iget-object p2, p2, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    invoke-static {v0, p2}, Lcom/streambundle/v38/PosterSupport;->referer(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 319
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    :cond_28
    return-object p0
.end method
