.class public final Lcom/streambundle/v38/QuickSearch;
.super Ljava/lang/Object;
.source "QuickSearch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v38/QuickSearch$State;
    }
.end annotation


# static fields
.field private static final RECENT:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final TIMER:Ljava/util/concurrent/ScheduledExecutorService;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 21
    new-instance v0, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda1;-><init>()V

    const/16 v1, 0x8

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/QuickSearch;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 22
    new-instance v0, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/QuickSearch;->TIMER:Ljava/util/concurrent/ScheduledExecutorService;

    .line 23
    new-instance v0, Lcom/streambundle/v38/QuickSearch$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x20

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/v38/QuickSearch$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/v38/QuickSearch;->RECENT:Ljava/util/Map;

    .line 25
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/lagradost/cloudstream3/MainAPI;Lokhttp3/HttpUrl;Ljava/lang/String;)Ljava/util/List;
    .registers 3

    .line 177
    invoke-static {p0, p1, p2}, Lcom/streambundle/v38/QuickSearch;->parse(Lcom/lagradost/cloudstream3/MainAPI;Lokhttp3/HttpUrl;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;
    .registers 3

    .line 29
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 30
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 31
    return-object v0
.end method

.method static host(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 35
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p0

    .line 36
    const-string v0, ""

    if-nez p0, :cond_9

    goto :goto_13

    :cond_9
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    const-string v1, "^www\\."

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_13
    return-object v0
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 21
    const-string v0, "streambundle-search"

    invoke-static {p0, v0}, Lcom/streambundle/v38/QuickSearch;->daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$1(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 2

    .line 22
    const-string v0, "streambundle-search-timer"

    invoke-static {p0, v0}, Lcom/streambundle/v38/QuickSearch;->daemon(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$3(Lcom/streambundle/v38/QuickSearch$State;Ljava/lang/String;)V
    .registers 2

    .line 52
    invoke-virtual {p0, p1}, Lcom/streambundle/v38/QuickSearch$State;->begin(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$4(Ljava/lang/String;Lokhttp3/HttpUrl;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 207
    check-cast p2, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    .line 208
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 209
    invoke-virtual {p2, p0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 210
    invoke-virtual {p1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/streambundle/v38/PosterSupport;->referer(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 211
    const-string p1, "Referer"

    invoke-static {p1, p0}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterHeaders(Ljava/util/Map;)V

    .line 213
    :cond_1c
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static parse(Lcom/lagradost/cloudstream3/MainAPI;Lokhttp3/HttpUrl;Ljava/lang/String;)Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MainAPI;",
            "Lokhttp3/HttpUrl;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 178
    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/MainAPI;->getMainUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 179
    invoke-virtual {p1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_140

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_140

    .line 180
    invoke-virtual {p1}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "search"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_30

    goto/16 :goto_140

    .line 181
    :cond_30
    invoke-virtual {p1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object p2

    invoke-static/range {p2 .. p2}, Lcom/streambundle/SearchGuard;->clean(Ljava/lang/Object;)V

    .line 182
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 183
    const-string v2, "a[href]"

    invoke-virtual {p2, v2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_47
    :goto_47
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4e

    goto :goto_5c

    :cond_4e
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 184
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v4

    const/16 v5, 0x3c

    if-lt v4, v5, :cond_6f

    .line 217
    :goto_5c
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_65

    invoke-static {p2}, Lcom/streambundle/v38/BundleMetadata;->document(Ljava/lang/Object;)V

    .line 218
    :cond_65
    new-instance p0, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p0

    .line 185
    :cond_6f
    const-string v4, "header,footer,nav,aside,.related,.recommendations,.advertisement"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    if-eqz v4, :cond_78

    goto :goto_47

    .line 186
    :cond_78
    const-string v4, "href"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 187
    invoke-static {v7}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v4

    .line 188
    if-eqz v4, :cond_47

    invoke-static {v7}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 189
    invoke-virtual {v4}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v4

    const-string v5, "(?i)^/(?:videos?|watch|view|play)/[^/]+.*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_9b

    goto :goto_47

    .line 190
    :cond_9b
    invoke-static {v7}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 191
    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a6

    goto :goto_47

    .line 192
    :cond_a6
    const-string v5, "img"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    .line 193
    const-string v8, "article,.item,.video-item,.video-card,.video,.thumb,.video-thumb"

    invoke-virtual {v3, v8}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v8

    .line 194
    if-nez v6, :cond_ba

    if-eqz v8, :cond_ba

    invoke-virtual {v8, v5}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    .line 195
    :cond_ba
    const-string v5, "title"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 196
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_d6

    if-eqz v6, :cond_d6

    const-string v5, "alt"

    invoke-virtual {v6, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 197
    :cond_d6
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_e4

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 198
    :cond_e4
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_fe

    if-eqz v8, :cond_fe

    .line 199
    const-string v9, ".title,.video-title,h2,h3"

    invoke-virtual {v8, v9}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v8

    .line 200
    if-eqz v8, :cond_fe

    invoke-virtual {v8}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    move-object v8, v5

    goto :goto_ff

    .line 202
    :cond_fe
    move-object v8, v5

    :goto_ff
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_47

    const-string v5, "[0-9: ]+"

    invoke-virtual {v8, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_10f

    goto/16 :goto_47

    .line 203
    :cond_10f
    invoke-virtual {p1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/streambundle/v38/PosterSupport;->picture(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 204
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_127

    if-eqz v6, :cond_127

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Lcom/streambundle/v38/PosterSupport;->picture(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 205
    :cond_127
    nop

    .line 206
    sget-object v9, Lcom/lagradost/cloudstream3/TvType;->Movie:Lcom/lagradost/cloudstream3/TvType;

    new-instance v10, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda0;

    invoke-direct {v10, v3, p1}, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Lokhttp3/HttpUrl;)V

    .line 214
    nop

    .line 206
    const/4 v3, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v5, p0

    move-object v6, v8

    move-object v8, v9

    move v9, v3

    invoke-static/range {v5 .. v12}, Lcom/streambundle/v38/DetailMetadata;->searchCard(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;

    move-result-object v3

    .line 215
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_47

    .line 180
    :cond_140
    :goto_140
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static recommendations(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 8

    .line 234
    instance-of v0, p0, Lcom/lagradost/cloudstream3/MainAPI;

    if-eqz v0, :cond_92

    if-nez p2, :cond_8

    goto/16 :goto_92

    .line 235
    :cond_8
    const-string v0, "Recommendations"

    invoke-static {p2, v0}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 236
    instance-of v2, v1, Ljava/util/List;

    if-eqz v2, :cond_1b

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1b

    .line 237
    goto :goto_45

    :cond_1b
    sget-object v1, Lcom/streambundle/v38/QuickSearch;->RECENT:Ljava/util/Map;

    new-instance v2, Ljava/lang/StringBuilder;

    check-cast p0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/MainAPI;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "\n"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Ljava/util/List;

    .line 236
    :goto_45
    nop

    .line 238
    if-nez v1, :cond_49

    return-void

    .line 239
    :cond_49
    invoke-static {v1, p2}, Lcom/streambundle/MetadataDisplay;->recommendations(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 240
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_52
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_59

    goto :goto_8c

    :cond_59
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 241
    const-string v3, "Url"

    invoke-static {v2, v3}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 242
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_84

    invoke-static {v3}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_84

    .line 243
    invoke-static {v2}, Lcom/streambundle/v38/BundleMetadata;->blocked(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_84

    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    :cond_84
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    const/16 v3, 0x14

    if-ne v2, v3, :cond_52

    .line 246
    :goto_8c
    const-class p1, Ljava/util/List;

    invoke-static {p2, v0, p1, p0}, Lcom/streambundle/v38/BundleMetadata;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 247
    return-void

    .line 234
    :cond_92
    :goto_92
    return-void
.end method

.method public static remember(Ljava/lang/Object;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "*>;)V"
        }
    .end annotation

    .line 222
    invoke-static {p0, p1}, Lcom/streambundle/v38/FastDetails;->warm(Ljava/lang/Object;Ljava/util/List;)V

    instance-of v0, p0, Lcom/lagradost/cloudstream3/MainAPI;

    if-eqz v0, :cond_6d

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_c

    goto :goto_6d

    .line 223
    :cond_c
    check-cast p0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/MainAPI;->getName()Ljava/lang/String;

    move-result-object p0

    .line 224
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0x30

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-interface {p1, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 225
    sget-object p1, Lcom/streambundle/v38/QuickSearch;->RECENT:Ljava/util/Map;

    monitor-enter p1

    .line 226
    :try_start_29
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2d
    :goto_2d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_35

    .line 225
    monitor-exit p1

    .line 231
    return-void

    .line 226
    :cond_35
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 227
    const-string v3, "Url"

    invoke-static {v2, v3}, Lcom/streambundle/v38/BundleMetadata;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundle/v38/BundleMetadata;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 228
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2d

    sget-object v3, Lcom/streambundle/v38/QuickSearch;->RECENT:Ljava/util/Map;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lcom/streambundle/v38/BundleMetadata;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2d

    .line 225
    :catchall_6a
    move-exception p0

    monitor-exit p1
    :try_end_6c
    .catchall {:try_start_29 .. :try_end_6c} :catchall_6a

    throw p0

    .line 222
    :cond_6d
    :goto_6d
    return-void
.end method

.method private static request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;
    .registers 4

    .line 174
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object p0

    const-string v0, "User-Agent"

    const-string v1, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-virtual {p0, v0, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    const-string v0, "Referer"

    invoke-virtual {p0, v0, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    return-object p0
.end method

.method static routes(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lokhttp3/Request;",
            ">;"
        }
    .end annotation

    .line 146
    invoke-static {p0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    .line 147
    if-nez v0, :cond_b

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 148
    :cond_b
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    const-string v2, "/search"

    invoke-virtual {v1, v2}, Lokhttp3/HttpUrl$Builder;->encodedPath(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lokhttp3/HttpUrl$Builder;->query(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    .line 149
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    const-string v3, "/search/"

    invoke-virtual {v0, v3}, Lokhttp3/HttpUrl$Builder;->encodedPath(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lokhttp3/HttpUrl$Builder;->query(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v0

    .line 150
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 151
    invoke-static {p0}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    const-string v5, ""

    const/16 v6, 0x2d

    const/16 v7, 0x20

    const-string v8, "q"

    sparse-switch v4, :sswitch_data_15c

    :goto_48
    goto/16 :goto_15a

    :sswitch_4a
    const-string v1, "pornvideos.rs"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    goto :goto_48

    .line 161
    :cond_53
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-virtual {v1, v8, p1}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/streambundle/v38/QuickSearch;->request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {p1, v7, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lokhttp3/HttpUrl$Builder;->addPathSegment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    invoke-virtual {p1, v5}, Lokhttp3/HttpUrl$Builder;->addPathSegment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/streambundle/v38/QuickSearch;->request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p0

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    goto/16 :goto_15a

    .line 151
    :sswitch_8b
    const-string v1, "sickjunk.com"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_94

    goto :goto_48

    .line 153
    :cond_94
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-virtual {v1, v8, p1}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/streambundle/v38/QuickSearch;->request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {p1, v7, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lokhttp3/HttpUrl$Builder;->addPathSegment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    invoke-virtual {p1, v5}, Lokhttp3/HttpUrl$Builder;->addPathSegment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/streambundle/v38/QuickSearch;->request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p0

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    goto/16 :goto_15a

    .line 151
    :sswitch_cc
    const-string v0, "hurtsex.com"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d6

    goto/16 :goto_48

    .line 157
    :cond_d6
    invoke-static {v1, p0}, Lcom/streambundle/v38/QuickSearch;->request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    new-instance v3, Lokhttp3/FormBody$Builder;

    invoke-direct {v3}, Lokhttp3/FormBody$Builder;-><init>()V

    invoke-virtual {v3, v8, p1}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/FormBody$Builder;->build()Lokhttp3/FormBody;

    move-result-object v3

    invoke-virtual {v0, v3}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    invoke-virtual {v1}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    invoke-virtual {v0, v8, p1}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/streambundle/v38/QuickSearch;->request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p0

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    goto :goto_15a

    .line 151
    :sswitch_10a
    const-string v4, "youjizz.com"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_114

    goto/16 :goto_48

    .line 165
    :cond_114
    invoke-virtual {v1}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-virtual {v1, v8, p1}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/streambundle/v38/QuickSearch;->request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, "-1.html"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lokhttp3/HttpUrl$Builder;->addPathSegment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/streambundle/v38/QuickSearch;->request(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p0

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    nop

    .line 170
    :goto_15a
    return-object v2

    nop

    :sswitch_data_15c
    .sparse-switch
        -0x6420ff0f -> :sswitch_10a
        -0x4e8d66f6 -> :sswitch_cc
        -0x163f45e7 -> :sswitch_8b
        0x4440227c -> :sswitch_4a
    .end sparse-switch
.end method

.method public static run(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/cloudstream3/MainAPI;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 48
    if-nez p1, :cond_5

    const-string p1, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 49
    :goto_9
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 50
    :cond_14
    new-instance v0, Lcom/streambundle/v38/QuickSearch$State;

    invoke-direct {v0, p0, p2}, Lcom/streambundle/v38/QuickSearch$State;-><init>(Lcom/lagradost/cloudstream3/MainAPI;Lkotlin/coroutines/Continuation;)V

    .line 51
    sget-object p0, Lcom/streambundle/v38/QuickSearch;->TIMER:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda3;

    invoke-direct {p2, v0}, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda3;-><init>(Lcom/streambundle/v38/QuickSearch$State;)V

    const-wide/16 v1, 0x12c0

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p0, p2, v1, v2, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    iput-object p0, v0, Lcom/streambundle/v38/QuickSearch$State;->deadline:Ljava/util/concurrent/ScheduledFuture;

    .line 52
    sget-object p0, Lcom/streambundle/v38/QuickSearch;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance p2, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda4;

    invoke-direct {p2, v0, p1}, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda4;-><init>(Lcom/streambundle/v38/QuickSearch$State;Ljava/lang/String;)V

    invoke-interface {p0, p2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 53
    iget-object p0, v0, Lcom/streambundle/v38/QuickSearch$State;->result:Lkotlin/coroutines/SafeContinuation;

    invoke-virtual {p0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static supports(Ljava/lang/Object;)Z
    .registers 3

    .line 40
    instance-of v0, p0, Lcom/lagradost/cloudstream3/MainAPI;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 41
    :cond_6
    check-cast p0, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p0}, Lcom/lagradost/cloudstream3/MainAPI;->getMainUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/v38/QuickSearch;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_40

    :goto_17
    goto :goto_3e

    :sswitch_18
    const-string v0, "pornvideos.rs"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    goto :goto_17

    :sswitch_21
    const-string v0, "sickjunk.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    goto :goto_17

    :sswitch_2a
    const-string v0, "hurtsex.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    goto :goto_17

    :sswitch_33
    const-string v0, "youjizz.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    goto :goto_17

    .line 42
    :cond_3c
    const/4 p0, 0x1

    return p0

    .line 43
    :goto_3e
    return v1

    nop

    :sswitch_data_40
    .sparse-switch
        -0x6420ff0f -> :sswitch_33
        -0x4e8d66f6 -> :sswitch_2a
        -0x163f45e7 -> :sswitch_21
        0x4440227c -> :sswitch_18
    .end sparse-switch
.end method
