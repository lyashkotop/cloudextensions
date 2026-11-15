.class public final Lcom/streambundleextra/VideoMetadata;
.super Ljava/lang/Object;
.source "VideoMetadata.java"


# static fields
.field private static final DURATIONS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 9
    new-instance v0, Lcom/streambundleextra/VideoMetadata$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x80

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundleextra/VideoMetadata$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundleextra/VideoMetadata;->DURATIONS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cached(Ljava/lang/String;)J
    .registers 3

    .line 13
    sget-object v0, Lcom/streambundleextra/VideoMetadata;->DURATIONS:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundleextra/MediaFix;->identity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    if-nez p0, :cond_11

    const-wide/16 v0, -0x1

    goto :goto_15

    :cond_11
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    :goto_15
    return-wide v0
.end method

.method public static cardDuration(Lcom/streambundlehtml/nodes/Element;)J
    .registers 6

    .line 36
    const-string v0, ".duration, .video-duration, [data-duration], [itemprop=duration]"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object p0

    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 37
    const-string v1, "data-duration"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_26

    const-string v1, "content"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2b

    :cond_26
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2f

    :cond_2b
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v0

    :goto_2f
    invoke-static {v0}, Lcom/streambundleextra/VideoMetadata;->seconds(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_3a

    return-wide v0

    .line 38
    :cond_3a
    goto :goto_a

    .line 39
    :cond_3b
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static duration(Lcom/streambundlehtml/nodes/Document;)J
    .registers 7

    .line 50
    const-string v0, "meta[property=\'vb:duration\'], meta[property=\'video:duration\'], meta[property=\'og:video:duration\'], meta[itemprop=duration], [itemprop=duration]"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_3b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 51
    const-string v4, "content"

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_28

    const-string v4, "datetime"

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2d

    :cond_28
    invoke-virtual {v1, v4}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_31

    :cond_2d
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v1

    :goto_31
    invoke-static {v1}, Lcom/streambundleextra/VideoMetadata;->seconds(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v1, v4, v2

    if-lez v1, :cond_3a

    return-wide v4

    .line 52
    :cond_3a
    goto :goto_a

    .line 53
    :cond_3b
    const-string v0, "#tab_video_info .item, .video-info .info .item, .block-details .info .item, .info li"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_45
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 54
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v4

    const-string v5, "(?is).*(?:duration|running time|length|\u0434\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c|\u0442\u0440\u0438\u0432\u0430\u043b\u0456\u0441\u0442\u044c)\\s*:.*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5e

    goto :goto_45

    .line 55
    :cond_5e
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundleextra/VideoMetadata;->seconds(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v1, v4, v2

    if-lez v1, :cond_6b

    return-wide v4

    .line 56
    :cond_6b
    goto :goto_45

    .line 57
    :cond_6c
    const-string v0, "script[type=application/ld+json]"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_76
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 58
    :try_start_82
    new-instance v4, Lorg/json/JSONTokener;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->data()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    const/4 v4, 0x0

    invoke-static {v1, v4}, Lcom/streambundleextra/VideoMetadata;->jsonDuration(Ljava/lang/Object;I)J

    move-result-wide v4
    :try_end_94
    .catch Lorg/json/JSONException; {:try_start_82 .. :try_end_94} :catch_99

    cmp-long v1, v4, v2

    if-lez v1, :cond_9a

    return-wide v4

    :catch_99
    move-exception v1

    .line 59
    :cond_9a
    goto :goto_76

    .line 60
    :cond_9b
    const-string v0, "script"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 61
    const-string v4, "(?:video_duration|duration)\\s*:\\s*[\'\"]?([0-9]+(?:\\.[0-9]+)?)[\'\"]?\\s*[,}]"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->data()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 62
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_d3

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundleextra/VideoMetadata;->seconds(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v1, v4, v2

    if-lez v1, :cond_d3

    return-wide v4

    .line 63
    :cond_d3
    goto :goto_a5

    .line 64
    :cond_d4
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundleextra/VideoMetadata;->cached(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static format(J)Ljava/lang/String;
    .registers 12

    .line 34
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gez v2, :cond_9

    const-string p0, ""

    goto :goto_51

    :cond_9
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    const-wide/16 v3, 0xe10

    const-wide/16 v5, 0x3c

    cmp-long v7, p0, v3

    if-ltz v7, :cond_38

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-long v3, p0, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    div-long v8, p0, v5

    rem-long/2addr v8, v5

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    rem-long/2addr p0, v5

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    aput-object v3, p1, v1

    aput-object v4, p1, v0

    aput-object p0, p1, v2

    const-string p0, "%d:%02d:%02d"

    invoke-static {v7, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_51

    :cond_38
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-long v7, p0, v5

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    rem-long/2addr p0, v5

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    aput-object v4, p1, v1

    aput-object p0, p1, v0

    const-string p0, "%d:%02d"

    invoke-static {v3, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_51
    return-object p0
.end method

.method private static jsonDuration(Ljava/lang/Object;I)J
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 42
    const/16 v0, 0x8

    const-wide/16 v1, -0x1

    if-le p1, v0, :cond_7

    return-wide v1

    .line 43
    :cond_7
    instance-of v0, p0, Lorg/json/JSONObject;

    const-wide/16 v3, 0x0

    if-eqz v0, :cond_55

    check-cast p0, Lorg/json/JSONObject;

    .line 44
    const-string v0, "@type"

    const-string v5, ""

    invoke-virtual {p0, v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "VideoObject"

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2e

    const-string v0, "duration"

    invoke-virtual {p0, v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/VideoMetadata;->seconds(Ljava/lang/String;)J

    move-result-wide v5

    cmp-long v0, v5, v3

    if-lez v0, :cond_2e

    return-wide v5

    .line 45
    :cond_2e
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :cond_32
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_74

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Lorg/json/JSONObject;

    if-nez v6, :cond_4a

    instance-of v6, v5, Lorg/json/JSONArray;

    if-eqz v6, :cond_32

    :cond_4a
    add-int/lit8 v6, p1, 0x1

    invoke-static {v5, v6}, Lcom/streambundleextra/VideoMetadata;->jsonDuration(Ljava/lang/Object;I)J

    move-result-wide v5

    cmp-long v7, v5, v3

    if-lez v7, :cond_32

    return-wide v5

    .line 46
    :cond_55
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_74

    check-cast p0, Lorg/json/JSONArray;

    const/4 v0, 0x0

    :goto_5c
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_74

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v6, p1, 0x1

    invoke-static {v5, v6}, Lcom/streambundleextra/VideoMetadata;->jsonDuration(Ljava/lang/Object;I)J

    move-result-wide v5

    cmp-long v7, v5, v3

    if-lez v7, :cond_71

    return-wide v5

    :cond_71
    add-int/lit8 v0, v0, 0x1

    goto :goto_5c

    :cond_74
    nop

    .line 47
    return-wide v1
.end method

.method private static number(Ljava/lang/String;)J
    .registers 3

    .line 32
    if-nez p0, :cond_5

    const-wide/16 v0, 0x0

    goto :goto_a

    :cond_5
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    double-to-long v0, v0

    :goto_a
    return-wide v0
.end method

.method private static positive(J)J
    .registers 5

    .line 33
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-lez v2, :cond_e

    const-wide/32 v0, 0x93a80

    cmp-long v2, p0, v0

    if-gez v2, :cond_e

    goto :goto_10

    :cond_e
    const-wide/16 p0, -0x1

    :goto_10
    return-wide p0
.end method

.method public static remember(Ljava/lang/String;J)V
    .registers 6

    .line 12
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_13

    sget-object v0, Lcom/streambundleextra/VideoMetadata;->DURATIONS:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundleextra/MediaFix;->identity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_13
    return-void
.end method

.method public static seconds(Ljava/lang/String;)J
    .registers 18

    .line 15
    const-wide/16 v1, -0x1

    if-nez p0, :cond_5

    return-wide v1

    .line 16
    :cond_5
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_10

    return-wide v1

    .line 19
    :cond_10
    :try_start_10
    const-string v3, "[0-9]+(?:\\.[0-9]+)?"

    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-long v3, v3

    invoke-static {v3, v4}, Lcom/streambundleextra/VideoMetadata;->positive(J)J

    move-result-wide v0

    return-wide v0

    .line 20
    :cond_22
    const-string v3, "(?i)^PT(?:(\\d+)H)?(?:(\\d+)M)?(?:(\\d+(?:\\.\\d+)?)S)?$"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 21
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    const/4 v5, 0x3

    const-wide/16 v6, 0xe10

    const/4 v8, 0x2

    const-wide/16 v9, 0x3c

    const/4 v11, 0x1

    if-eqz v4, :cond_5f

    invoke-virtual {v3, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/VideoMetadata;->number(Ljava/lang/String;)J

    move-result-wide v11

    mul-long v11, v11, v6

    invoke-virtual {v3, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/VideoMetadata;->number(Ljava/lang/String;)J

    move-result-wide v6
    :try_end_4b
    .catch Ljava/lang/NumberFormatException; {:try_start_10 .. :try_end_4b} :catch_ed

    invoke-static {v6, v7}, Ljava/lang/Long;->signum(J)I

    mul-long v6, v6, v9

    add-long/2addr v11, v6

    :try_start_51
    invoke-virtual {v3, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/VideoMetadata;->number(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v11, v3

    invoke-static {v11, v12}, Lcom/streambundleextra/VideoMetadata;->positive(J)J

    move-result-wide v0

    return-wide v0

    .line 22
    :cond_5f
    const-string v3, "(?<![0-9:])(?:(\\d+):)?(\\d{1,2}):(\\d{2})(?![0-9:])"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 23
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_a0

    .line 24
    invoke-virtual {v3, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundleextra/VideoMetadata;->number(Ljava/lang/String;)J

    move-result-wide v12

    invoke-virtual {v3, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundleextra/VideoMetadata;->number(Ljava/lang/String;)J

    move-result-wide v14

    invoke-virtual {v3, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundleextra/VideoMetadata;->number(Ljava/lang/String;)J

    move-result-wide v4

    .line 25
    cmp-long v16, v4, v9

    if-gez v16, :cond_a0

    invoke-virtual {v3, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_95

    cmp-long v3, v14, v9

    if-gez v3, :cond_a0

    :cond_95
    mul-long v12, v12, v6

    mul-long v14, v14, v9

    add-long/2addr v12, v14

    add-long/2addr v12, v4

    invoke-static {v12, v13}, Lcom/streambundleextra/VideoMetadata;->positive(J)J

    move-result-wide v0

    return-wide v0

    .line 27
    :cond_a0
    const-string v3, "(?i)(\\d+(?:\\.\\d+)?)\\s*(hours?|hrs?|h|\u043c\u0438\u043d(?:\u0443\u0442[\u0430\u044b]?)?|minutes?|mins?|m|\u0441\u0435\u043a(?:\u0443\u043d\u0434[\u0430\u044b]?)?|seconds?|secs?|s)(?![a-z\u0430-\u044f])"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 28
    const-wide/16 v3, 0x0

    :goto_ac
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_e8

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundleextra/VideoMetadata;->number(Ljava/lang/String;)J

    move-result-wide v6

    const-string v9, "h"

    invoke-virtual {v5, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_cf

    const/16 v5, 0xe10

    goto :goto_e3

    :cond_cf
    const-string v9, "m"

    invoke-virtual {v5, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_e1

    const-string v9, "\u043c\u0438\u043d"

    invoke-virtual {v5, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_e1

    const/4 v5, 0x1

    goto :goto_e3

    :cond_e1
    const/16 v5, 0x3c

    :goto_e3
    int-to-long v9, v5

    mul-long v6, v6, v9

    add-long/2addr v3, v6

    goto :goto_ac

    .line 29
    :cond_e8
    invoke-static {v3, v4}, Lcom/streambundleextra/VideoMetadata;->positive(J)J

    move-result-wide v0
    :try_end_ec
    .catch Ljava/lang/NumberFormatException; {:try_start_51 .. :try_end_ec} :catch_ed

    return-wide v0

    .line 30
    :catch_ed
    move-exception v0

    return-wide v1
.end method
