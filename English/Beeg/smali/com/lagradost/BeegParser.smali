.class public final Lcom/lagradost/BeegParser;
.super Ljava/lang/Object;
.source "BeegParser.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBeegParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 BeegParser.kt\ncom/lagradost/BeegParser\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,32:1\n1#2:33\n1#2:58\n1739#3:34\n1814#3,3:35\n296#3,2:38\n1739#3:40\n1814#3,3:41\n777#3:44\n873#3,2:45\n1795#3,10:47\n2068#3:57\n2069#3:59\n1805#3:60\n1849#3,8:61\n*S KotlinDebug\n*F\n+ 1 BeegParser.kt\ncom/lagradost/BeegParser\n*L\n28#1:58\n12#1:34\n12#1:35,3\n12#1:38,2\n20#1:40\n20#1:41,3\n20#1:44\n20#1:45,2\n28#1:47,10\n28#1:57\n28#1:59\n28#1:60\n29#1:61,8\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0005H\u0002J\u0018\u0010\t\u001a\u0004\u0018\u00010\n2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u0005J\u0018\u0010\u000c\u001a\u0004\u0018\u00010\r2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u0005"
    }
    d2 = {
        "Lcom/lagradost/BeegParser;",
        "",
        "<init>",
        "()V",
        "text",
        "",
        "item",
        "Lorg/json/JSONObject;",
        "key",
        "card",
        "Lcom/lagradost/VideoCard;",
        "base",
        "details",
        "Lcom/lagradost/VideoDetails;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/lagradost/BeegParser;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/BeegParser;

    invoke-direct {v0}, Lcom/lagradost/BeegParser;-><init>()V

    sput-object v0, Lcom/lagradost/BeegParser;->INSTANCE:Lcom/lagradost/BeegParser;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final card$encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .line 13
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p1, p2}, Lcom/streambundle/v43/Repair43;->beegText(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public final card(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/lagradost/VideoCard;
    .registers 16
    .param p1, "item"    # Lorg/json/JSONObject;
    .param p2, "base"    # Ljava/lang/String;

    const-string v0, "item"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "base"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    const-string v0, "video_id"

    invoke-direct {p0, p1, v0}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 10
    .local v0, "id":Ljava/lang/String;
    const-string v1, "title"

    invoke-direct {p0, p1, v1}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 11
    .local v1, "title":Ljava/lang/String;
    move-object v2, v0

    check-cast v2, Ljava/lang/CharSequence;

    new-instance v3, Lkotlin/text/Regex;

    const-string v4, "\\d+"

    invoke-direct {v3, v4}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_f0

    move-object v2, v1

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_f0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_49

    goto/16 :goto_f0

    .line 12
    :cond_49
    const-string v2, "thumb_hosted_url_hz_ws"

    const-string v4, "thumb_hosted_url_hz"

    const-string v5, "thumb"

    filled-new-array {v2, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 34
    .local v4, "$i$f$map":I
    new-instance v5, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v2, v6}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v5, Ljava/util/Collection;

    .local v5, "destination$iv$iv":Ljava/util/Collection;
    move-object v6, v2

    .local v6, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 35
    .local v7, "$i$f$mapTo":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_6d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_85

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 36
    .local v9, "item$iv$iv":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Ljava/lang/String;

    .local v10, "it":Ljava/lang/String;
    const/4 v11, 0x0

    .line 12
    .local v11, "$i$a$-map-BeegParser$card$poster$1":I
    sget-object v12, Lcom/lagradost/BeegParser;->INSTANCE:Lcom/lagradost/BeegParser;

    invoke-direct {v12, p1, v10}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 36
    .end local v10    # "it":Ljava/lang/String;
    .end local v11    # "$i$a$-map-BeegParser$card$poster$1":I
    invoke-interface {v5, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_6d

    .line 37
    .end local v9    # "item$iv$iv":Ljava/lang/Object;
    :cond_85
    nop

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v6    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapTo":I
    check-cast v5, Ljava/util/List;

    .line 34
    nop

    .end local v2    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$map":I
    check-cast v5, Ljava/lang/Iterable;

    .line 12
    move-object v2, v5

    .local v2, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 38
    .local v4, "$i$f$firstOrNull":I
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_91
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_ab

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Ljava/lang/String;

    .local v7, "it":Ljava/lang/String;
    const/4 v8, 0x0

    .line 12
    .local v8, "$i$a$-firstOrNull-BeegParser$card$poster$2":I
    const/4 v9, 0x0

    const/4 v10, 0x2

    const-string v11, "http"

    invoke-static {v7, v11, v9, v10, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v7

    .line 38
    .end local v7    # "it":Ljava/lang/String;
    .end local v8    # "$i$a$-firstOrNull-BeegParser$card$poster$2":I
    if-eqz v7, :cond_91

    move-object v3, v6

    goto :goto_ac

    .line 39
    .end local v6    # "element$iv":Ljava/lang/Object;
    :cond_ab
    nop

    .line 12
    .end local v2    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$firstOrNull":I
    :goto_ac
    move-object v2, v3

    check-cast v2, Ljava/lang/String;

    .line 14
    .local v2, "poster":Ljava/lang/String;
    const-string v3, "video_id_encode"

    invoke-direct {p0, p1, v3}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lagradost/BeegParser;->card$encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "video_id_xnxx"

    invoke-direct {p0, p1, v4}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/lagradost/BeegParser;->card$encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/xid/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/?e="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "&xn="

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 15
    .local v3, "url":Ljava/lang/String;
    invoke-static {p1, v3}, Lcom/streambundle/v38/BundleMetadata;->beegCard(Lorg/json/JSONObject;Ljava/lang/String;)V

    new-instance v4, Lcom/lagradost/VideoCard;

    invoke-direct {v4, v1, v3, v2}, Lcom/lagradost/VideoCard;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v4

    .line 11
    .end local v2    # "poster":Ljava/lang/String;
    .end local v3    # "url":Ljava/lang/String;
    :cond_f0
    :goto_f0
    return-object v3
.end method

.method public final details(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/lagradost/VideoDetails;
    .registers 31
    .param p1, "item"    # Lorg/json/JSONObject;
    .param p2, "base"    # Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const-string v3, "item"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "base"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    const-string v3, "is_deleted"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eq v3, v5, :cond_278

    const-string v3, "is_ok"

    invoke-virtual {v1, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-nez v3, :cond_25

    goto/16 :goto_278

    .line 19
    :cond_25
    invoke-virtual/range {p0 .. p2}, Lcom/lagradost/BeegParser;->card(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/lagradost/VideoCard;

    move-result-object v3

    if-nez v3, :cond_2c

    return-object v6

    .line 20
    .local v3, "card":Lcom/lagradost/VideoCard;
    :cond_2c
    const-string v7, "cats"

    invoke-direct {v0, v1, v7}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Ljava/lang/CharSequence;

    new-array v9, v5, [C

    const/16 v7, 0x2c

    aput-char v7, v9, v4

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x6

    const/4 v13, 0x0

    invoke-static/range {v8 .. v13}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 40
    .local v8, "$i$f$map":I
    new-instance v9, Ljava/util/ArrayList;

    const/16 v10, 0xa

    invoke-static {v7, v10}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v9, Ljava/util/Collection;

    .local v9, "destination$iv$iv":Ljava/util/Collection;
    move-object v10, v7

    .local v10, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v11, 0x0

    .line 41
    .local v11, "$i$f$mapTo":I
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_59
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_95

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .line 42
    .local v13, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v20, v13

    check-cast v20, Ljava/lang/String;

    .local v20, "it":Ljava/lang/String;
    const/16 v21, 0x0

    .line 20
    .local v21, "$i$a$-map-BeegParser$details$tags$1":I
    const/16 v17, 0x0

    const/16 v18, 0x4

    const/16 v19, 0x0

    const-string v15, "*"

    const-string v16, ""

    move-object/from16 v14, v20

    invoke-static/range {v14 .. v19}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    check-cast v14, Ljava/lang/CharSequence;

    invoke-static {v14}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x2d

    const/16 v24, 0x20

    const/16 v25, 0x0

    const/16 v26, 0x4

    const/16 v27, 0x0

    invoke-static/range {v22 .. v27}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;CCZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 42
    .end local v20    # "it":Ljava/lang/String;
    .end local v21    # "$i$a$-map-BeegParser$details$tags$1":I
    invoke-interface {v9, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_59

    .line 43
    .end local v13    # "item$iv$iv":Ljava/lang/Object;
    :cond_95
    nop

    .end local v9    # "destination$iv$iv":Ljava/util/Collection;
    .end local v10    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$mapTo":I
    check-cast v9, Ljava/util/List;

    .line 40
    nop

    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$map":I
    check-cast v9, Ljava/lang/Iterable;

    .line 20
    move-object v7, v9

    .local v7, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 44
    .local v8, "$i$f$filter":I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    check-cast v9, Ljava/util/Collection;

    .restart local v9    # "destination$iv$iv":Ljava/util/Collection;
    move-object v10, v7

    .local v10, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v11, 0x0

    .line 45
    .local v11, "$i$f$filterTo":I
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_aa
    :goto_aa
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_c8

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .local v13, "element$iv$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Ljava/lang/String;

    .local v14, "it":Ljava/lang/String;
    const/4 v15, 0x0

    .line 20
    .local v15, "$i$a$-filter-BeegParser$details$tags$2":I
    move-object/from16 v16, v14

    check-cast v16, Ljava/lang/CharSequence;

    invoke-static/range {v16 .. v16}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v16

    xor-int/lit8 v16, v16, 0x1

    .line 45
    .end local v14    # "it":Ljava/lang/String;
    .end local v15    # "$i$a$-filter-BeegParser$details$tags$2":I
    if-eqz v16, :cond_aa

    invoke-interface {v9, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_aa

    .line 46
    .end local v13    # "element$iv$iv":Ljava/lang/Object;
    :cond_c8
    nop

    .end local v9    # "destination$iv$iv":Ljava/util/Collection;
    .end local v10    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$filterTo":I
    check-cast v9, Ljava/util/List;

    .line 44
    nop

    .end local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$filter":I
    check-cast v9, Ljava/lang/Iterable;

    .line 20
    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v7

    .line 21
    .local v7, "tags":Ljava/util/List;
    const-string v8, "dur"

    invoke-direct {v0, v1, v8}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    .line 22
    .local v8, "seconds":Ljava/lang/Integer;
    const-string v9, "quality"

    invoke-direct {v0, v1, v9}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 23
    .local v9, "quality":Ljava/lang/String;
    const-string v10, "description"

    invoke-direct {v0, v1, v10}, Lcom/lagradost/BeegParser;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    check-cast v10, Ljava/lang/CharSequence;

    invoke-static {v10}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_18a

    const/4 v10, 0x0

    .line 24
    .local v10, "$i$a$-ifBlank-BeegParser$details$description$1":I
    const/4 v11, 0x2

    new-array v12, v11, [Ljava/lang/String;

    if-eqz v8, :cond_13b

    move-object v13, v8

    check-cast v13, Ljava/lang/Number;

    invoke-virtual {v13}, Ljava/lang/Number;->intValue()I

    move-result v13

    .line 33
    nop

    .local v13, "it":I
    const/4 v14, 0x0

    .line 24
    .local v14, "$i$a$-takeIf-BeegParser$details$description$1$1":I
    if-lez v13, :cond_103

    move v13, v5

    goto :goto_104

    :cond_103
    move v13, v4

    .end local v13    # "it":I
    .end local v14    # "$i$a$-takeIf-BeegParser$details$description$1$1":I
    :goto_104
    if-eqz v13, :cond_108

    move-object v13, v8

    goto :goto_109

    :cond_108
    move-object v13, v6

    :goto_109
    if-eqz v13, :cond_13b

    check-cast v13, Ljava/lang/Number;

    invoke-virtual {v13}, Ljava/lang/Number;->intValue()I

    move-result v13

    .line 33
    nop

    .restart local v13    # "it":I
    const/4 v14, 0x0

    .line 24
    .local v14, "$i$a$-let-BeegParser$details$description$1$2":I
    div-int/lit8 v15, v13, 0x3c

    rem-int/lit8 v16, v13, 0x3c

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    const/16 v5, 0x30

    invoke-static {v6, v11, v5}, Lkotlin/text/StringsKt;->padStart(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c: "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, ":"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .end local v13    # "it":I
    .end local v14    # "$i$a$-let-BeegParser$details$description$1$2":I
    goto :goto_13c

    :cond_13b
    const/4 v5, 0x0

    :goto_13c
    aput-object v5, v12, v4

    .line 25
    nop

    .line 33
    move-object v5, v9

    .local v5, "it":Ljava/lang/String;
    const/4 v6, 0x0

    .line 25
    .local v6, "$i$a$-takeIf-BeegParser$details$description$1$3":I
    move-object v11, v5

    check-cast v11, Ljava/lang/CharSequence;

    invoke-static {v11}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    const/4 v13, 0x1

    xor-int/2addr v11, v13

    .end local v5    # "it":Ljava/lang/String;
    .end local v6    # "$i$a$-takeIf-BeegParser$details$description$1$3":I
    if-eqz v11, :cond_14e

    move-object v5, v9

    goto :goto_14f

    :cond_14e
    const/4 v5, 0x0

    :goto_14f
    if-eqz v5, :cond_165

    .line 33
    nop

    .restart local v5    # "it":Ljava/lang/String;
    const/4 v6, 0x0

    .line 25
    .local v6, "$i$a$-let-BeegParser$details$description$1$4":I
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u041a\u0430\u0447\u0435\u0441\u0442\u0432\u043e: "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .end local v5    # "it":Ljava/lang/String;
    .end local v6    # "$i$a$-let-BeegParser$details$description$1$4":I
    goto :goto_166

    :cond_165
    const/4 v5, 0x0

    :goto_166
    const/4 v6, 0x1

    aput-object v5, v12, v6

    .line 24
    invoke-static {v12}, Lkotlin/collections/CollectionsKt;->listOfNotNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    move-object/from16 v18, v5

    check-cast v18, Ljava/lang/Iterable;

    .line 25
    const-string v5, "\n"

    move-object/from16 v19, v5

    check-cast v19, Ljava/lang/CharSequence;

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x3e

    const/16 v26, 0x0

    invoke-static/range {v18 .. v26}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 23
    .end local v10    # "$i$a$-ifBlank-BeegParser$details$description$1":I
    nop

    .line 26
    :cond_18a
    move-object v5, v10

    check-cast v5, Ljava/lang/String;

    .line 33
    .restart local v5    # "it":Ljava/lang/String;
    const/4 v6, 0x0

    .line 26
    .local v6, "$i$a$-takeIf-BeegParser$details$description$2":I
    move-object v11, v5

    check-cast v11, Ljava/lang/CharSequence;

    invoke-static {v11}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    const/4 v12, 0x1

    xor-int/2addr v11, v12

    .end local v5    # "it":Ljava/lang/String;
    .end local v6    # "$i$a$-takeIf-BeegParser$details$description$2":I
    if-eqz v11, :cond_19a

    goto :goto_19b

    :cond_19a
    const/4 v10, 0x0

    :goto_19b
    move-object v13, v10

    check-cast v13, Ljava/lang/String;

    .line 23
    nop

    .line 27
    .local v13, "description":Ljava/lang/String;
    const-string v5, "related"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 28
    .local v5, "related":Lorg/json/JSONArray;
    if-nez v5, :cond_1ac

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v4

    goto :goto_207

    :cond_1ac
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    invoke-static {v4, v6}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .local v4, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 47
    .local v6, "$i$f$mapNotNull":I
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    check-cast v10, Ljava/util/Collection;

    .local v10, "destination$iv$iv":Ljava/util/Collection;
    move-object v11, v4

    .local v11, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 56
    .local v12, "$i$f$mapNotNullTo":I
    move-object v14, v11

    .local v14, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v15, 0x0

    .line 57
    .local v15, "$i$f$forEach":I
    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_1c6
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_201

    move-object/from16 v18, v16

    check-cast v18, Lkotlin/collections/IntIterator;

    invoke-virtual/range {v18 .. v18}, Lkotlin/collections/IntIterator;->nextInt()I

    move-result v18

    .local v18, "element$iv$iv$iv":I
    move/from16 v19, v18

    .local v19, "element$iv$iv":I
    const/16 v20, 0x0

    .line 56
    .local v20, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move/from16 v21, v19

    .local v21, "it":I
    const/16 v22, 0x0

    .line 28
    .local v22, "$i$a$-mapNotNull-BeegParser$details$cards$1":I
    move/from16 v0, v21

    .end local v21    # "it":I
    .local v0, "it":I
    invoke-virtual {v5, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v21

    if-eqz v21, :cond_1f3

    move-object/from16 v23, v21

    .line 33
    .local v23, "obj":Lorg/json/JSONObject;
    const/16 v21, 0x0

    .line 28
    .local v21, "$i$a$-let-BeegParser$details$cards$1$1":I
    move/from16 v24, v0

    .end local v0    # "it":I
    .local v24, "it":I
    sget-object v0, Lcom/lagradost/BeegParser;->INSTANCE:Lcom/lagradost/BeegParser;

    move-object/from16 v1, v23

    .end local v23    # "obj":Lorg/json/JSONObject;
    .local v1, "obj":Lorg/json/JSONObject;
    invoke-virtual {v0, v1, v2}, Lcom/lagradost/BeegParser;->card(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/lagradost/VideoCard;

    move-result-object v0

    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v21    # "$i$a$-let-BeegParser$details$cards$1$1":I
    goto :goto_1f6

    .end local v24    # "it":I
    .restart local v0    # "it":I
    :cond_1f3
    move/from16 v24, v0

    .end local v0    # "it":I
    .restart local v24    # "it":I
    const/4 v0, 0x0

    .line 56
    .end local v22    # "$i$a$-mapNotNull-BeegParser$details$cards$1":I
    .end local v24    # "it":I
    :goto_1f6
    if-eqz v0, :cond_1fc

    .line 58
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 56
    .local v1, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v10, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 57
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v1    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v19    # "element$iv$iv":I
    .end local v20    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_1fc
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .end local v18    # "element$iv$iv$iv":I
    goto :goto_1c6

    .line 59
    :cond_201
    nop

    .line 60
    .end local v14    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v15    # "$i$f$forEach":I
    nop

    .end local v10    # "destination$iv$iv":Ljava/util/Collection;
    .end local v11    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v12    # "$i$f$mapNotNullTo":I
    move-object v0, v10

    check-cast v0, Ljava/util/List;

    .line 47
    move-object v4, v0

    .line 28
    .end local v4    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$mapNotNull":I
    :goto_207
    move-object v0, v4

    .line 29
    .local v0, "cards":Ljava/util/List;
    invoke-virtual {v3}, Lcom/lagradost/VideoCard;->getTitle()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3}, Lcom/lagradost/VideoCard;->getPoster()Ljava/lang/String;

    move-result-object v12

    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 61
    .local v4, "$i$f$distinctBy":I
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 62
    .local v6, "set$iv":Ljava/util/HashSet;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v10, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_222
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_24b

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 64
    .local v15, "e$iv":Ljava/lang/Object;
    move-object/from16 v16, v15

    check-cast v16, Lcom/lagradost/VideoCard;

    .local v16, "it":Lcom/lagradost/VideoCard;
    const/16 v18, 0x0

    .line 29
    .local v18, "$i$a$-distinctBy-BeegParser$details$1":I
    invoke-virtual/range {v16 .. v16}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v16

    .line 64
    .end local v16    # "it":Lcom/lagradost/VideoCard;
    .end local v18    # "$i$a$-distinctBy-BeegParser$details$1":I
    move-object/from16 v18, v16

    .line 65
    .local v18, "key$iv":Ljava/lang/Object;
    move-object/from16 v19, v0

    move-object/from16 v0, v18

    .end local v18    # "key$iv":Ljava/lang/Object;
    .local v0, "key$iv":Ljava/lang/Object;
    .local v19, "cards":Ljava/util/List;
    invoke-virtual {v6, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_248

    .line 66
    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v19

    goto :goto_222

    .line 65
    :cond_248
    move-object/from16 v0, v19

    goto :goto_222

    .line 68
    .end local v15    # "e$iv":Ljava/lang/Object;
    .end local v19    # "cards":Ljava/util/List;
    .local v0, "cards":Ljava/util/List;
    :cond_24b
    move-object/from16 v19, v0

    .end local v0    # "cards":Ljava/util/List;
    .restart local v19    # "cards":Ljava/util/List;
    move-object v0, v10

    check-cast v0, Ljava/util/List;

    .end local v1    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$distinctBy":I
    .end local v6    # "set$iv":Ljava/util/HashSet;
    .end local v10    # "list$iv":Ljava/util/ArrayList;
    check-cast v0, Ljava/lang/Iterable;

    .line 29
    const/16 v1, 0x28

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v15

    if-eqz v8, :cond_26e

    move-object v0, v8

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 33
    nop

    .local v0, "it":I
    const/4 v1, 0x0

    .line 29
    .local v1, "$i$a$-let-BeegParser$details$2":I
    add-int/lit8 v4, v0, 0x3b

    div-int/lit8 v4, v4, 0x3c

    .end local v0    # "it":I
    .end local v1    # "$i$a$-let-BeegParser$details$2":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v16, v6

    goto :goto_270

    :cond_26e
    const/16 v16, 0x0

    :goto_270
    new-instance v0, Lcom/lagradost/VideoDetails;

    move-object v10, v0

    move-object v14, v7

    invoke-direct/range {v10 .. v16}, Lcom/lagradost/VideoDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;)V

    return-object v0

    .line 18
    .end local v3    # "card":Lcom/lagradost/VideoCard;
    .end local v5    # "related":Lorg/json/JSONArray;
    .end local v7    # "tags":Ljava/util/List;
    .end local v8    # "seconds":Ljava/lang/Integer;
    .end local v9    # "quality":Ljava/lang/String;
    .end local v13    # "description":Ljava/lang/String;
    .end local v19    # "cards":Ljava/util/List;
    :cond_278
    :goto_278
    const/4 v0, 0x0

    return-object v0
.end method
