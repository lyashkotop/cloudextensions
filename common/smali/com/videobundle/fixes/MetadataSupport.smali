.class public final Lcom/videobundle/fixes/MetadataSupport;
.super Ljava/lang/Object;
.source "MetadataSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/videobundle/fixes/MetadataSupport$Entry;
    }
.end annotation


# static fields
.field private static final LIMIT:I = 0x18

.field private static final PAGES:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/videobundle/fixes/MetadataSupport$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private static final POSTERS:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TTL:J = 0x4e20L


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 14
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0x20

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    sput-object v0, Lcom/videobundle/fixes/MetadataSupport;->PAGES:Ljava/util/LinkedHashMap;

    .line 19
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0x200

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    sput-object v0, Lcom/videobundle/fixes/MetadataSupport;->POSTERS:Ljava/util/LinkedHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static absolute(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 67
    const-string v0, ""

    if-eqz p1, :cond_3f

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    goto :goto_3f

    .line 69
    :cond_f
    :try_start_f
    new-instance v1, Ljava/net/URI;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    .line 70
    const-string p1, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_38

    const-string p1, "http"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3c

    :cond_38
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_3c} :catch_3d

    :cond_3c
    return-object v0

    .line 71
    :catch_3d
    move-exception p0

    return-object v0

    .line 67
    :cond_3f
    :goto_3f
    return-object v0
.end method

.method private static badImage(Ljava/lang/Object;)Z
    .registers 3

    .line 125
    instance-of v0, p0, Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_6

    return v1

    .line 126
    :cond_6
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 127
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3a

    const-string v0, "data:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3a

    const-string v0, "/blank"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3a

    const-string v0, "placeholder"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3a

    const-string v0, ".svg"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_3a

    const/4 p0, 0x0

    return p0

    :cond_3a
    return v1
.end method

.method public static declared-synchronized cached(Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 9

    const-class v0, Lcom/videobundle/fixes/MetadataSupport;

    monitor-enter v0

    .line 31
    :try_start_3
    sget-object v1, Lcom/videobundle/fixes/MetadataSupport;->PAGES:Ljava/util/LinkedHashMap;

    invoke-static {p0}, Lcom/videobundle/fixes/MetadataSupport;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/videobundle/fixes/MetadataSupport$Entry;
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_31

    .line 32
    const/4 v2, 0x0

    if-nez v1, :cond_14

    monitor-exit v0

    return-object v2

    .line 33
    :cond_14
    :try_start_14
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    iget-wide v5, v1, Lcom/videobundle/fixes/MetadataSupport$Entry;->expires:J

    cmp-long v7, v3, v5

    if-ltz v7, :cond_29

    sget-object v1, Lcom/videobundle/fixes/MetadataSupport;->PAGES:Ljava/util/LinkedHashMap;

    invoke-static {p0}, Lcom/videobundle/fixes/MetadataSupport;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_27
    .catchall {:try_start_14 .. :try_end_27} :catchall_31

    monitor-exit v0

    return-object v2

    .line 34
    :cond_29
    :try_start_29
    iget-object p0, v1, Lcom/videobundle/fixes/MetadataSupport$Entry;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->clone()Lorg/jsoup/nodes/Document;

    move-result-object p0
    :try_end_2f
    .catchall {:try_start_29 .. :try_end_2f} :catchall_31

    monitor-exit v0

    return-object p0

    .line 30
    :catchall_31
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static empty(Ljava/lang/Object;)Z
    .registers 2

    .line 58
    if-eqz p0, :cond_21

    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_13

    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_21

    :cond_13
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_1f

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_21

    :cond_1f
    const/4 p0, 0x0

    return p0

    :cond_21
    const/4 p0, 0x1

    return p0
.end method

.method public static enrich(Ljava/lang/Object;)V
    .registers 3

    .line 74
    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 75
    instance-of v1, v0, Ljava/lang/String;

    if-nez v1, :cond_b

    return-void

    .line 76
    :cond_b
    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->cached(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 77
    if-eqz v0, :cond_16

    invoke-static {p0, v0}, Lcom/videobundle/fixes/MetadataSupport;->enrichDocument(Ljava/lang/Object;Lorg/jsoup/nodes/Document;)V

    .line 78
    :cond_16
    invoke-static {p0}, Lcom/videobundle/fixes/MetadataSupport;->restorePoster(Ljava/lang/Object;)V

    .line 79
    return-void
.end method

.method public static enrichDocument(Ljava/lang/Object;Lorg/jsoup/nodes/Document;)V
    .registers 13

    .line 81
    if-eqz p0, :cond_1cb

    if-nez p1, :cond_6

    goto/16 :goto_1cb

    .line 82
    :cond_6
    invoke-static {p1}, Lcom/videobundle/fixes/MetadataSupport;->normalize(Lorg/jsoup/nodes/Document;)V

    .line 83
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https://jav.guru/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/16 v1, 0x28

    const-string v2, "Tags"

    const-string v3, "PosterUrl"

    if-eqz v0, :cond_90

    .line 84
    invoke-static {p0, v3}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 85
    const-string v0, ".large-screenimg img, .large-screenshot img"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 86
    if-eqz v0, :cond_42

    const-string v4, "src"

    invoke-virtual {v0, v4}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/videobundle/fixes/MetadataSupport;->absolute(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_42

    const-class v4, Ljava/lang/String;

    invoke-static {p0, v3, v4, v0}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 88
    :cond_42
    invoke-static {p0, v2}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->empty(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    .line 89
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 90
    const-string v4, "article .infometa a[href*=/tag/], article .infometa a[href*=/category/]"

    invoke-virtual {p1, v4}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_5b
    :goto_5b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_72

    .line 91
    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_90

    const-class v4, Ljava/util/List;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0, v2, v4, v5}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    goto :goto_90

    .line 90
    :cond_72
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Element;

    invoke-virtual {v5}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_5b

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result v6

    if-ge v6, v1, :cond_5b

    invoke-virtual {v0, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_5b

    .line 94
    :cond_90
    :goto_90
    const-string v0, "Plot"

    invoke-static {p0, v0}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/videobundle/fixes/MetadataSupport;->empty(Ljava/lang/Object;)Z

    move-result v4

    const-string v5, "content"

    if-eqz v4, :cond_c9

    .line 95
    const-string v4, "meta[property=og:description]"

    invoke-static {p1, v4, v5}, Lcom/videobundle/fixes/MetadataSupport;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 96
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_b0

    const-string v4, "meta[name=twitter:description], meta[name=description], meta[itemprop=description]"

    invoke-static {p1, v4, v5}, Lcom/videobundle/fixes/MetadataSupport;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 97
    :cond_b0
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_be

    const-string v4, "[itemprop=description]:not(meta), .video-description, #video-description, .video-info .description"

    const-string v6, ""

    invoke-static {p1, v4, v6}, Lcom/videobundle/fixes/MetadataSupport;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 98
    :cond_be
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_c9

    const-class v6, Ljava/lang/String;

    invoke-static {p0, v0, v6, v4}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 100
    :cond_c9
    invoke-static {p0, v2}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->empty(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18a

    .line 101
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 102
    const-string v4, "meta[property=video:tag], meta[property=og:video:tag]"

    invoke-virtual {p1, v4}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_e2
    :goto_e2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/16 v7, 0x64

    if-nez v6, :cond_165

    .line 103
    const-string v4, "a[rel=tag], .tags a, .video-tags a, .video_tags a, a[itemprop=keywords], .categories a"

    invoke-virtual {p1, v4}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_f4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_fb

    goto :goto_11e

    :cond_fb
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 104
    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 105
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_118

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    if-gt v8, v7, :cond_118

    invoke-virtual {v0, v4}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 106
    :cond_118
    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result v4

    if-lt v4, v1, :cond_f4

    .line 108
    :goto_11e
    const-string v4, "meta[name=keywords], meta[itemprop=keywords]"

    invoke-static {p1, v4, v5}, Lcom/videobundle/fixes/MetadataSupport;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 109
    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v8, v4

    const/4 v6, 0x0

    :goto_12c
    if-lt v6, v8, :cond_13f

    .line 110
    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_18a

    const-class v1, Ljava/util/List;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0, v2, v1, v4}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    goto :goto_18a

    .line 109
    :cond_13f
    aget-object v9, v4, v6

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result v10

    if-ge v10, v1, :cond_162

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_162

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-gt v10, v7, :cond_162

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_162
    add-int/lit8 v6, v6, 0x1

    goto :goto_12c

    .line 102
    :cond_165
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/nodes/Element;

    invoke-virtual {v6, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_e2

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-gt v8, v7, :cond_e2

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result v7

    if-ge v7, v1, :cond_e2

    invoke-virtual {v0, v6}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto/16 :goto_e2

    .line 112
    :cond_18a
    :goto_18a
    invoke-static {p0, v3}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b7

    .line 113
    const-string v0, "meta[property=og:image], meta[name=twitter:image], meta[itemprop=thumbnailUrl]"

    invoke-static {p1, v0, v5}, Lcom/videobundle/fixes/MetadataSupport;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1a8

    const-string v0, "video[poster]"

    const-string v1, "poster"

    invoke-static {p1, v0, v1}, Lcom/videobundle/fixes/MetadataSupport;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 115
    :cond_1a8
    invoke-static {p1, v0}, Lcom/videobundle/fixes/MetadataSupport;->absolute(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1b7

    const-class v1, Ljava/lang/String;

    invoke-static {p0, v3, v1, v0}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 118
    :cond_1b7
    invoke-static {p0, p1}, Lcom/videobundle/fixes/MetadataSupport;->structured(Ljava/lang/Object;Lorg/jsoup/nodes/Document;)V

    .line 119
    invoke-static {p0}, Lcom/videobundle/fixes/MetadataSupport;->restorePoster(Ljava/lang/Object;)V

    .line 120
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/videobundle/fixes/MetadataSupport;->posterHeaders(Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    invoke-static {p0, p1}, Lcom/streambundle/PosterPatch;->detailResponse(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p0, p1}, Lcom/streambundle/JavSupport;->details(Ljava/lang/Object;Lorg/jsoup/nodes/Document;)V

    return-void

    .line 81
    :cond_1cb
    :goto_1cb
    invoke-static {p0, p1}, Lcom/streambundle/PosterPatch;->detailResponse(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p0, p1}, Lcom/streambundle/JavSupport;->details(Ljava/lang/Object;Lorg/jsoup/nodes/Document;)V

    return-void
.end method

.method private static jsonText(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5

    .line 179
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_37

    .line 180
    move-object v0, p0

    check-cast v0, Lorg/json/JSONArray;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    const/4 p0, 0x0

    :goto_d
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt p0, v2, :cond_18

    .line 182
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 181
    :cond_18
    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/videobundle/fixes/MetadataSupport;->jsonText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_34

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_31

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_34
    add-int/lit8 p0, p0, 0x1

    goto :goto_d

    .line 184
    :cond_37
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_42

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    goto :goto_44

    :cond_42
    const-string p0, ""

    :goto_44
    return-object p0
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 21
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 23
    :cond_5
    :try_start_5
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 24
    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 25
    if-eqz v2, :cond_57

    const-string v3, ".strip2.co"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_20

    const-string v3, "strip2.co"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_57

    :cond_20
    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/video/\\d+/?"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_57

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v3, "/$"

    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_55} :catch_56

    return-object p0

    .line 26
    :catch_56
    move-exception v0

    .line 27
    :cond_57
    const/16 v0, 0x23

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 28
    if-gez v0, :cond_60

    goto :goto_65

    :cond_60
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :goto_65
    return-object p0
.end method

.method private static meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 60
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_11

    .line 64
    const-string p0, ""

    return-object p0

    .line 60
    :cond_11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/jsoup/nodes/Element;

    .line 61
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object p1

    goto :goto_26

    :cond_22
    invoke-virtual {p1, p2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_26
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    return-object p1
.end method

.method public static normalize(Lorg/jsoup/nodes/Document;)V
    .registers 11

    .line 130
    const-string v0, "img"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_11

    .line 144
    return-void

    .line 130
    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 131
    const-string v7, "data-url"

    const-string v8, "src"

    const-string v2, "data-s"

    const-string v3, "data-src"

    const-string v4, "data-original"

    const-string v5, "data-lazy-src"

    const-string v6, "data-lazy"

    filled-new-array/range {v2 .. v8}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_2b
    const-string v5, "data-original"

    const-string v6, "data-src"

    const-string v7, "src"

    const/4 v8, 0x7

    if-lt v4, v8, :cond_35

    goto :goto_4e

    :cond_35
    aget-object v8, v2, v4

    .line 132
    invoke-virtual {v1, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v8}, Lcom/videobundle/fixes/MetadataSupport;->absolute(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 133
    invoke-static {v8}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_96

    invoke-virtual {v1, v6, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    invoke-virtual {v1, v5, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    invoke-virtual {v1, v7, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 135
    :goto_4e
    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 136
    const-string v2, "data-srcset"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_61

    goto :goto_63

    :cond_61
    const-string v2, "srcset"

    :goto_63
    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 137
    const-string v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 138
    array-length v4, v2

    if-lez v4, :cond_a

    .line 139
    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    aget-object v2, v2, v4

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v4, "\\s+"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v3

    invoke-static {p0, v2}, Lcom/videobundle/fixes/MetadataSupport;->absolute(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 140
    invoke-static {v2}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    invoke-virtual {v1, v7, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    invoke-virtual {v1, v6, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    invoke-virtual {v1, v5, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_a

    .line 131
    :cond_96
    add-int/lit8 v4, v4, 0x1

    goto :goto_2b
.end method

.method private static posterHeaders(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    .line 162
    const-string v0, "PosterHeaders"

    invoke-static {p0, v0}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/videobundle/fixes/MetadataSupport;->empty(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 163
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 164
    const-string v2, "Referer"

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    const-string p1, "User-Agent"

    const-string v2, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    const-class p1, Ljava/util/Map;

    invoke-static {p0, v0, p1, v1}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 168
    :cond_22
    return-void
.end method

.method private static read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5

    .line 51
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "get"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_20
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_20} :catch_21

    return-object p0

    .line 52
    :catch_21
    move-exception p0

    const/4 p0, 0x0

    return-object p0
.end method

.method public static remember(Ljava/lang/Object;)V
    .registers 7

    invoke-static/range {p0 .. p0}, Lcom/streambundle/v38/BundleMetadata;->document(Ljava/lang/Object;)V

    const-class v0, Lcom/videobundle/fixes/MetadataSupport;

    monitor-enter v0

    .line 37
    :try_start_6
    instance-of v1, p0, Lorg/jsoup/nodes/Document;
    :try_end_8
    .catchall {:try_start_6 .. :try_end_8} :catchall_a1

    if-nez v1, :cond_c

    monitor-exit v0

    return-void

    .line 38
    :cond_c
    :try_start_c
    check-cast p0, Lorg/jsoup/nodes/Document;

    .line 39
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 40
    const-string v2, "just a moment"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9f

    const-string v2, "access denied"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9f

    const-string v1, "#challenge-form"

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_31

    goto :goto_9f

    .line 41
    :cond_31
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/videobundle/fixes/MetadataSupport;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 42
    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4b

    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2
    :try_end_47
    .catchall {:try_start_c .. :try_end_47} :catchall_a1

    if-nez v2, :cond_4b

    monitor-exit v0

    return-void

    .line 44
    :cond_4b
    :try_start_4b
    sget-object v2, Lcom/videobundle/fixes/MetadataSupport;->PAGES:Ljava/util/LinkedHashMap;

    new-instance v3, Lcom/videobundle/fixes/MetadataSupport$Entry;

    invoke-direct {v3, p0}, Lcom/videobundle/fixes/MetadataSupport$Entry;-><init>(Lorg/jsoup/nodes/Document;)V

    invoke-virtual {v2, v1, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object p0, Lcom/videobundle/fixes/MetadataSupport;->PAGES:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 46
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 47
    :cond_63
    :goto_63
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_89

    .line 48
    :goto_69
    sget-object p0, Lcom/videobundle/fixes/MetadataSupport;->PAGES:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->size()I

    move-result p0
    :try_end_6f
    .catchall {:try_start_4b .. :try_end_6f} :catchall_a1

    const/16 v1, 0x18

    if-gt p0, v1, :cond_75

    .line 49
    monitor-exit v0

    return-void

    .line 48
    :cond_75
    :try_start_75
    sget-object p0, Lcom/videobundle/fixes/MetadataSupport;->PAGES:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/videobundle/fixes/MetadataSupport;->PAGES:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_69

    .line 47
    :cond_89
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/videobundle/fixes/MetadataSupport$Entry;

    iget-wide v3, v3, Lcom/videobundle/fixes/MetadataSupport$Entry;->expires:J

    cmp-long v5, v3, v1

    if-gtz v5, :cond_63

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V
    :try_end_9e
    .catchall {:try_start_75 .. :try_end_9e} :catchall_a1

    goto :goto_63

    .line 40
    :cond_9f
    :goto_9f
    monitor-exit v0

    return-void

    .line 36
    :catchall_a1
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized rememberResponse(Ljava/lang/Object;)V
    .registers 6

    const-class v0, Lcom/videobundle/fixes/MetadataSupport;

    monitor-enter v0

    .line 146
    :try_start_3
    const-string v1, "Url"

    invoke-static {p0, v1}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "PosterUrl"

    invoke-static {p0, v2}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 147
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_46

    invoke-static {v2}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_46

    .line 148
    sget-object v3, Lcom/videobundle/fixes/MetadataSupport;->POSTERS:Ljava/util/LinkedHashMap;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/videobundle/fixes/MetadataSupport;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    :goto_27
    sget-object v2, Lcom/videobundle/fixes/MetadataSupport;->POSTERS:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    const/16 v3, 0x200

    if-gt v2, v3, :cond_32

    goto :goto_46

    :cond_32
    sget-object v2, Lcom/videobundle/fixes/MetadataSupport;->POSTERS:Ljava/util/LinkedHashMap;

    sget-object v3, Lcom/videobundle/fixes/MetadataSupport;->POSTERS:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_27

    .line 151
    :cond_46
    :goto_46
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_4f

    check-cast v1, Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/videobundle/fixes/MetadataSupport;->posterHeaders(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_4f
    .catchall {:try_start_3 .. :try_end_4f} :catchall_57

    .line 152
    :cond_4f
    monitor-exit v0

    invoke-static {p0}, Lcom/streambundle/PosterPatch;->response(Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/streambundle/JavSupport;->response(Ljava/lang/Object;)V

    return-void

    .line 145
    :catchall_57
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static declared-synchronized restorePoster(Ljava/lang/Object;)V
    .registers 6

    const-class v0, Lcom/videobundle/fixes/MetadataSupport;

    monitor-enter v0

    .line 154
    :try_start_3
    const-string v1, "Url"

    invoke-static {p0, v1}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 155
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_31

    const-string v2, "PosterUrl"

    invoke-static {p0, v2}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 156
    sget-object v2, Lcom/videobundle/fixes/MetadataSupport;->POSTERS:Ljava/util/LinkedHashMap;

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/videobundle/fixes/MetadataSupport;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 157
    if-eqz v2, :cond_31

    const-string v3, "PosterUrl"

    const-class v4, Ljava/lang/String;

    invoke-static {p0, v3, v4, v2}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 159
    :cond_31
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_3a

    check-cast v1, Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/videobundle/fixes/MetadataSupport;->posterHeaders(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_3a
    .catchall {:try_start_3 .. :try_end_3a} :catchall_3c

    .line 160
    :cond_3a
    monitor-exit v0

    return-void

    .line 153
    :catchall_3c
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static structured(Ljava/lang/Object;Lorg/jsoup/nodes/Document;)V
    .registers 5

    .line 170
    const-string v0, "script[type=application/ld+json]"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_11

    .line 177
    return-void

    .line 170
    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 172
    :try_start_17
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 173
    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2d

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    goto :goto_32

    :cond_2d
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 174
    :goto_32
    const/4 v1, 0x0

    invoke-static {p0, p1, v2, v1}, Lcom/videobundle/fixes/MetadataSupport;->structuredObject(Ljava/lang/Object;Lorg/jsoup/nodes/Document;Ljava/lang/Object;I)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_36} :catch_37

    goto :goto_38

    .line 175
    :catch_37
    move-exception v1

    :goto_38
    goto :goto_a
.end method

.method private static structuredObject(Ljava/lang/Object;Lorg/jsoup/nodes/Document;Ljava/lang/Object;I)V
    .registers 12

    .line 187
    const/16 v0, 0x8

    if-le p3, v0, :cond_5

    return-void

    .line 188
    :cond_5
    instance-of v0, p2, Lorg/json/JSONArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    move-object v0, p2

    check-cast v0, Lorg/json/JSONArray;

    :goto_d
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-lt v1, p2, :cond_14

    return-void

    :cond_14
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 v2, p3, 0x1

    invoke-static {p0, p1, p2, v2}, Lcom/videobundle/fixes/MetadataSupport;->structuredObject(Ljava/lang/Object;Lorg/jsoup/nodes/Document;Ljava/lang/Object;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 189
    :cond_20
    instance-of v0, p2, Lorg/json/JSONObject;

    if-nez v0, :cond_25

    return-void

    .line 190
    :cond_25
    check-cast p2, Lorg/json/JSONObject;

    .line 191
    const-string v0, "@type"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->jsonText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 192
    const-string v2, "VideoObject"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_41

    const-string v2, "Movie"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_106

    .line 193
    :cond_41
    const-string v0, "description"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->jsonText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 194
    const-string v2, "Plot"

    invoke-static {p0, v2}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/videobundle/fixes/MetadataSupport;->empty(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_62

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_62

    const-class v3, Ljava/lang/String;

    invoke-static {p0, v2, v3, v0}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 195
    :cond_62
    const-string v0, "thumbnailUrl"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->jsonText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 196
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7c

    const-string v0, "image"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->jsonText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 197
    :cond_7c
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8a

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v1

    .line 198
    :cond_8a
    invoke-static {p1, v0}, Lcom/videobundle/fixes/MetadataSupport;->absolute(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 199
    const-string v2, "PosterUrl"

    invoke-static {p0, v2}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a5

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->badImage(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a5

    const-class v3, Ljava/lang/String;

    invoke-static {p0, v2, v3, v0}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 200
    :cond_a5
    const-string v0, "keywords"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/videobundle/fixes/MetadataSupport;->jsonText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 201
    const-string v2, "Tags"

    invoke-static {p0, v2}, Lcom/videobundle/fixes/MetadataSupport;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/videobundle/fixes/MetadataSupport;->empty(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_106

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_106

    .line 202
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 203
    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v4, v0

    :goto_cd
    if-lt v1, v4, :cond_e0

    .line 204
    invoke-virtual {v3}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_106

    const-class v0, Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0, v2, v0, v1}, Lcom/videobundle/fixes/MetadataSupport;->write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    goto :goto_106

    .line 203
    :cond_e0
    aget-object v5, v0, v1

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_103

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x64

    if-gt v6, v7, :cond_103

    invoke-virtual {v3}, Ljava/util/LinkedHashSet;->size()I

    move-result v6

    const/16 v7, 0x28

    if-ge v6, v7, :cond_103

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_103
    add-int/lit8 v1, v1, 0x1

    goto :goto_cd

    .line 207
    :cond_106
    :goto_106
    const-string v0, "@graph"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 p3, p3, 0x1

    invoke-static {p0, p1, p2, p3}, Lcom/videobundle/fixes/MetadataSupport;->structuredObject(Ljava/lang/Object;Lorg/jsoup/nodes/Document;Ljava/lang/Object;I)V

    .line 208
    return-void
.end method

.method private static write(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
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

    .line 55
    :try_start_0
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
    :try_end_24
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_24} :catch_25

    goto :goto_26

    .line 56
    :catch_25
    move-exception p0

    .line 57
    :goto_26
    return-void
.end method
