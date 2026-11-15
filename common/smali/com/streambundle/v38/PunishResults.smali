.class public final Lcom/streambundle/v38/PunishResults;
.super Ljava/lang/Object;
.source "PunishResults.java"


# static fields
.field private static final CARDS:Ljava/lang/String; = "a[href^=/videos/], a[href^=/video/], a[href*=punishbang.com/videos/], a[href*=punishbang.com/video/]"

.field private static final RESULTS:Ljava/lang/String; = "#list_videos_videos_list_search_result_items, [id*=search_result][id$=_items], #list_videos_common_videos_list_items, #search-results, .search-results, [data-block-id*=search_result]"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static select(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;
    .registers 6

    .line 18
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    .line 20
    :try_start_4
    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1
    :try_end_8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_8} :catch_8d

    .line 21
    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 22
    if-eqz v1, :cond_8c

    const-string v2, "punishbang.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1f

    const-string v2, ".punishbang.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1f

    goto :goto_8c

    .line 23
    :cond_1f
    const-string v1, "#list_videos_videos_list_search_result_items, [id*=search_result][id$=_items], #list_videos_common_videos_list_items, #search-results, .search-results, [data-block-id*=search_result]"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_29
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "a[href^=/videos/], a[href^=/video/], a[href*=punishbang.com/videos/], a[href*=punishbang.com/video/]"

    if-nez v2, :cond_77

    .line 29
    const-string v1, ""

    invoke-static {v1, v0}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v2

    .line 30
    const-string v0, "main, #content, .main-content, .content"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 31
    if-nez v0, :cond_43

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 32
    :cond_43
    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Element;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_52

    .line 37
    return-object v2

    .line 32
    :cond_52
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/streambundlehtml/nodes/Element;

    .line 33
    const-string v0, "nav, header, footer, aside, .sidebar, .related, .related-videos, .recommended-videos"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->closest(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_61

    goto :goto_4b

    .line 34
    :cond_61
    const-string v0, "article, .item, .thumb, .video-item, .video-block"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->closest(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 35
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    if-nez v0, :cond_6e

    goto :goto_6f

    :cond_6e
    move-object p0, v0

    :goto_6f
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/streambundlehtml/nodes/Element;->append(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_4b

    .line 23
    :cond_77
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 24
    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_29

    .line 25
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    return-object p0

    .line 22
    :cond_8c
    :goto_8c
    return-object p0

    .line 20
    :catch_8d
    move-exception v0

    return-object p0
.end method
