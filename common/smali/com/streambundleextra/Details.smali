.class public final Lcom/streambundleextra/Details;
.super Ljava/lang/Object;
.source "Details.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundleextra/Details$RelatedState;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/streambundleextra/VideoBundleSite;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/util/List;
    .registers 3

    .line 16
    invoke-static {p0, p1, p2}, Lcom/streambundleextra/Details;->cards(Lcom/streambundleextra/VideoBundleSite;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 2

    .line 16
    invoke-static {p0, p1}, Lcom/streambundleextra/Details;->samePage(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static apply(Lcom/streambundleextra/VideoBundleSite;Lcom/lagradost/cloudstream3/MovieLoadResponse;Lcom/streambundlehtml/nodes/Document;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 14

    .line 123
    invoke-static {p2}, Lcom/streambundleextra/Details;->prepare(Lcom/streambundlehtml/nodes/Document;)V

    .line 124
    invoke-static {p2}, Lcom/streambundleextra/Details;->tags(Lcom/streambundlehtml/nodes/Document;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setTags(Ljava/util/List;)V

    .line 125
    invoke-static {p2}, Lcom/streambundleextra/Details;->description(Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;

    move-result-object v1

    .line 126
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 127
    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getName()Ljava/lang/String;

    move-result-object v1

    .line 128
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3b

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-static {v0, v2}, Lcom/streambundleextra/Details;->join(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 130
    :cond_3b
    invoke-static {p2}, Lcom/streambundleextra/VideoMetadata;->duration(Lcom/streambundlehtml/nodes/Document;)J

    move-result-wide v2

    .line 131
    const-wide/16 v4, 0x0

    const/4 v6, 0x1

    cmp-long v7, v2, v4

    if-lez v7, :cond_61

    .line 132
    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2, v3}, Lcom/streambundleextra/VideoMetadata;->remember(Ljava/lang/String;J)V

    .line 133
    long-to-double v4, v2

    const-wide/high16 v8, 0x404e000000000000L    # 60.0

    div-double/2addr v4, v8

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    long-to-int v5, v4

    invoke-static {v6, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setDuration(Ljava/lang/Integer;)V

    .line 135
    :cond_61
    if-lez v7, :cond_7b

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2, v3}, Lcom/streambundleextra/VideoMetadata;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_7d

    :cond_7b
    const-string v2, "\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c: \u043d\u0435 \u0443\u043a\u0430\u0437\u0430\u043d\u0430 \u043d\u0430 \u0441\u0430\u0439\u0442\u0435"

    .line 136
    :goto_7d
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPlot(Ljava/lang/String;)V

    .line 137
    invoke-static {p2}, Lcom/streambundleextra/Details;->poster(Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;

    move-result-object v1

    .line 138
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b2

    invoke-virtual {p1, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterUrl(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setBackgroundPosterUrl(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setPosterHeaders(Ljava/util/Map;)V

    .line 139
    :cond_b2
    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p2, v1}, Lcom/streambundleextra/Details;->cards(Lcom/streambundleextra/VideoBundleSite;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 140
    invoke-virtual {p1, v1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->setRecommendations(Ljava/util/List;)V

    .line 141
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_c6

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    .line 142
    :cond_c6
    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, p1}, Lcom/streambundle/v38/QuickSearch;->recommendations(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getRecommendations()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :search_for_related

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :search_for_related

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :search_for_related
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 143
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v7, 0x0

    if-nez v1, :cond_db

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    :cond_db
    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "(?i)\\s*[-|]\\s*(?:thisvid|boundhub|hcbdsm|punishworld|bdsmx).*"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 145
    const-string v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x2

    if-le v2, v3, :cond_110

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v2, v1, v7

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-object v1, v1, v6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 146
    :cond_110
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_11f

    invoke-interface {v4, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11f

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    :cond_11f
    invoke-static {p3}, Lcom/streambundle/v38/Screening;->isProbe(Lkotlin/coroutines/Continuation;)Z

    move-result v0

    if-eqz v0, :cond_128

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :cond_128
    new-instance v0, Lcom/streambundleextra/Details$RelatedState;

    invoke-virtual {p1}, Lcom/lagradost/cloudstream3/MovieLoadResponse;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/streambundleextra/Details;->relatedUrl(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v1, p0

    move-object v2, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/streambundleextra/Details$RelatedState;-><init>(Lcom/streambundleextra/VideoBundleSite;Lcom/lagradost/cloudstream3/MovieLoadResponse;Ljava/lang/String;Ljava/util/List;Lkotlin/coroutines/Continuation;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v7}, Lcom/streambundleextra/Details$RelatedState;->step(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static cards(Lcom/streambundleextra/VideoBundleSite;Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/util/List;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundleextra/VideoBundleSite;",
            "Lcom/streambundlehtml/nodes/Document;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;"
        }
    .end annotation

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 97
    invoke-static {p1}, Lcom/streambundleextra/MediaFix;->searchDocument(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v1

    .line 98
    const-string v2, "article > a"

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 99
    const-string v3, "href"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p2}, Lcom/streambundleextra/Details;->samePage(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2c

    goto :goto_13

    .line 100
    :cond_2c
    const-string v3, "title"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v3, "img"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/streambundleextra/MediaFix;->image(Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 101
    nop

    .line 102
    sget-object v7, Lcom/lagradost/cloudstream3/TvType;->Movie:Lcom/lagradost/cloudstream3/TvType;

    new-instance v9, Lcom/streambundleextra/Details$1;

    invoke-direct {v9, v2, v6}, Lcom/streambundleextra/Details$1;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v10, 0x8

    const/4 v11, 0x0

    const/4 v8, 0x0

    move-object v4, p0

    invoke-static/range {v4 .. v11}, Lcom/streambundle/v38/DetailMetadata;->searchCard(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;

    move-result-object p0

    .line 105
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p0

    const/16 v2, 0x28

    if-lt p0, v2, :cond_5d

    goto :goto_5f

    .line 106
    :cond_5d
    move-object p0, v4

    goto :goto_13

    .line 107
    :cond_5f
    :goto_5f
    return-object v0
.end method

.method private static content(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 18
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/streambundlehtml/nodes/Element;

    const-string v0, "content"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_25

    :cond_21
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object p1

    :goto_25
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    invoke-static {p1}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->text()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 19
    :cond_3c
    const-string p0, ""

    return-object p0
.end method

.method public static description(Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;
    .registers 6

    .line 62
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hcbdsm.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    const/4 v0, 0x1

    goto :goto_25

    :cond_24
    const/4 v0, 0x0

    .line 63
    :goto_25
    if-eqz v0, :cond_ca

    .line 64
    const-string v0, "meta[property=\'vb:description\'], #tab_video_info .description, #tab_video_info .item-description, #tab_video_info [itemprop=description], .video-info .video-description"

    invoke-static {p0, v0}, Lcom/streambundleextra/Details;->content(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 65
    const-string v1, "#tab_video_info .info .item, .video-info .info .item"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_37
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_62

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    .line 66
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_61

    const-string v4, "(?is)^(?:description|\u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435|\u043e\u043f\u0438\u0441)\\s*:.*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_61

    const-string v0, "^[^:]+:\\s*"

    const-string v4, ""

    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    :cond_61
    goto :goto_37

    .line 70
    :cond_62
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_6f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v3, "\n"

    if-eqz v1, :cond_99

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 72
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_8c

    goto :goto_6f

    .line 73
    :cond_8c
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_95

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_95
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    goto :goto_6f

    .line 75
    :cond_99
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_a4

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 76
    :cond_a4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_c9

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_c9

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_c9
    return-object v0

    .line 78
    :cond_ca
    const-string v0, "meta[property=\'vb:description\'], .video-description, .item-description, .entry-content, [itemprop=description], .description"

    invoke-static {p0, v0}, Lcom/streambundleextra/Details;->content(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_dc

    const-string v0, "meta[property=og:description], meta[name=description]"

    invoke-static {p0, v0}, Lcom/streambundleextra/Details;->content(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 80
    :cond_dc
    return-object v0
.end method

.method private static join(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_1e

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1e
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    :cond_22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static poster(Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Lcom/streambundle/PosterPatch;->detail(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static prepare(Lcom/streambundlehtml/nodes/Document;)V
    .registers 5

    .line 83
    const-string v0, "script[type=application/ld+json]"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 84
    :try_start_16
    new-instance v2, Lorg/json/JSONTokener;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->data()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v2, p0, v3}, Lcom/streambundleextra/Details;->structured(Ljava/lang/Object;Ljava/util/Set;Lcom/streambundlehtml/nodes/Document;I)V
    :try_end_28
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_28} :catch_29

    goto :goto_2a

    :catch_29
    move-exception v1

    .line 85
    :goto_2a
    goto :goto_a

    .line 86
    :cond_2b
    return-void
.end method

.method public static relatedUrl(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 113
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_82

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v3, "bdsmx.tube"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 115
    const-string v1, "^/video/(\\d+)/"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 116
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_82

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/api/json/videos_related2/432000/100/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/32 v1, 0xf4240

    div-long v3, p0, v1

    mul-long v3, v3, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    div-long v4, p0, v2

    mul-long v4, v4, v2

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ".all.1.json"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 118
    :cond_82
    const-string v1, "related_src\\s*:\\s*[\'\"]([^\'\"]+)[\'\"]"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->html()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_b7

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_b7

    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b7

    return-object p0

    .line 120
    :cond_b7
    const-string p0, ""

    return-object p0
.end method

.method private static samePage(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 2

    .line 110
    invoke-static {p0}, Lcom/streambundleextra/MediaFix;->identity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Lcom/streambundleextra/MediaFix;->identity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static structured(Ljava/lang/Object;Ljava/util/Set;Lcom/streambundlehtml/nodes/Document;I)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/streambundlehtml/nodes/Document;",
            "I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 41
    const/16 v0, 0x8

    if-le p3, v0, :cond_5

    return-void

    .line 42
    :cond_5
    instance-of v0, p0, Lorg/json/JSONArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_1f

    check-cast p0, Lorg/json/JSONArray;

    :goto_c
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v1, v0, :cond_1e

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v2, p3, 0x1

    invoke-static {v0, p1, p2, v2}, Lcom/streambundleextra/Details;->structured(Ljava/lang/Object;Ljava/util/Set;Lcom/streambundlehtml/nodes/Document;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_1e
    return-void

    .line 43
    :cond_1f
    instance-of v0, p0, Lorg/json/JSONObject;

    if-nez v0, :cond_24

    return-void

    .line 44
    :cond_24
    check-cast p0, Lorg/json/JSONObject;

    .line 45
    const-string v0, "@type"

    const-string v2, ""

    invoke-virtual {p0, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 46
    const-string v3, "VideoObject"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e1

    .line 47
    const-string v0, "keywords"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 48
    if-eqz p1, :cond_85

    .line 49
    instance-of v3, v0, Lorg/json/JSONArray;

    if-eqz v3, :cond_5f

    check-cast v0, Lorg/json/JSONArray;

    const/4 v3, 0x0

    :goto_45
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_85

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5c

    invoke-interface {p1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_5c
    add-int/lit8 v3, v3, 0x1

    goto :goto_45

    .line 50
    :cond_5f
    instance-of v3, v0, Ljava/lang/String;

    if-eqz v3, :cond_85

    check-cast v0, Ljava/lang/String;

    const-string v3, "[,;]"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v3, v0

    const/4 v4, 0x0

    :goto_6d
    if-ge v4, v3, :cond_85

    aget-object v5, v0, v4

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_82

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_82
    add-int/lit8 v4, v4, 0x1

    goto :goto_6d

    .line 52
    :cond_85
    if-eqz p2, :cond_e1

    .line 53
    const-string v0, "description"

    invoke-virtual {p0, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const-string v4, "content"

    const-string v5, "property"

    const-string v6, "meta"

    if-nez v3, :cond_aa

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    invoke-virtual {v3, v6}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    const-string v7, "vb:description"

    invoke-virtual {v3, v5, v7}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    invoke-virtual {v3, v4, v0}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 55
    :cond_aa
    const-string v0, "thumbnailUrl"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v3, v0, Lorg/json/JSONArray;

    if-eqz v3, :cond_bb

    check-cast v0, Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_c2

    :cond_bb
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_c2

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    .line 56
    :cond_c2
    :goto_c2
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_e1

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document;->head()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    const-string v1, "vb:image"

    invoke-virtual {v0, v5, v1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 59
    :cond_e1
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_e5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_104

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lorg/json/JSONArray;

    if-nez v2, :cond_fe

    instance-of v2, v1, Lorg/json/JSONObject;

    if-nez v2, :cond_fe

    goto :goto_e5

    :cond_fe
    add-int/lit8 v2, p3, 0x1

    invoke-static {v1, p1, p2, v2}, Lcom/streambundleextra/Details;->structured(Ljava/lang/Object;Ljava/util/Set;Lcom/streambundlehtml/nodes/Document;I)V

    goto :goto_e5

    .line 60
    :cond_104
    return-void
.end method

.method public static tags(Lcom/streambundlehtml/nodes/Document;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundlehtml/nodes/Document;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 22
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 23
    const-string v1, "meta[name=keywords], meta[property=\'video:tag\']"

    invoke-static {p0, v1}, Lcom/streambundleextra/Details;->content(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 24
    const-string v2, "[,;]"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_14
    if-ge v4, v2, :cond_2c

    aget-object v5, v1, v4

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_29

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_29
    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    .line 25
    :cond_2c
    const-string v1, "a[rel=tag], .tags a, .video-tags a, .categories a, .video-categories a, .info .item a[href*=/tags/], .info .item a[href*=/categories/], [itemprop=keywords]"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_36
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/16 v4, 0x64

    if-eqz v2, :cond_5c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 26
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5b

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v5, v4, :cond_5b

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 27
    :cond_5b
    goto :goto_36

    .line 28
    :cond_5c
    const-string v1, "#tab_video_info .info .item, .video-info .info .item, .block-details .info .item"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_66
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_ae

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 29
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v5

    const-string v6, "(?is)^(?:categories?|tags?|\u043a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438|\u0442\u0435\u0433\u0438)\\s*:.*"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_7f

    goto :goto_66

    .line 30
    :cond_7f
    const-string v5, "a"

    invoke-virtual {v2, v5}, Lcom/streambundlehtml/nodes/Element;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_89
    :goto_89
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_ad

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_89

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v6, v4, :cond_89

    invoke-virtual {v0, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_89

    .line 31
    :cond_ad
    goto :goto_66

    .line 32
    :cond_ae
    const-string v1, "script[type=application/ld+json]"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_b8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d8

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 33
    :try_start_c4
    new-instance v2, Lorg/json/JSONTokener;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->data()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2, v3}, Lcom/streambundleextra/Details;->structured(Ljava/lang/Object;Ljava/util/Set;Lcom/streambundlehtml/nodes/Document;I)V
    :try_end_d5
    .catch Lorg/json/JSONException; {:try_start_c4 .. :try_end_d5} :catch_d6

    goto :goto_d7

    :catch_d6
    move-exception v1

    .line 34
    :goto_d7
    goto :goto_b8

    .line 35
    :cond_d8
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 36
    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_e1
    :goto_e1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_109

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "\\s+"

    const-string v5, " "

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_e1

    invoke-interface {p0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e1

    .line 37
    :cond_109
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 38
    new-instance p0, Ljava/util/ArrayList;

    const/16 v1, 0x28

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-interface {v0, v3, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p0
.end method
