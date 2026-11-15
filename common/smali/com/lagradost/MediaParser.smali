.class public final Lcom/lagradost/MediaParser;
.super Ljava/lang/Object;
.source "CatalogParser.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCatalogParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CatalogParser.kt\ncom/lagradost/MediaParser\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,133:1\n1795#2,10:134\n2068#2:144\n2069#2:146\n1805#2:147\n832#2:148\n862#2,2:149\n777#2:151\n873#2:152\n1960#2,3:153\n874#2:156\n1795#2,10:157\n2068#2:167\n2069#2:169\n1805#2:170\n832#2:172\n862#2,2:173\n1#3:145\n1#3:168\n1#3:171\n*S KotlinDebug\n*F\n+ 1 CatalogParser.kt\ncom/lagradost/MediaParser\n*L\n117#1:134,10\n117#1:144\n117#1:146\n117#1:147\n122#1:148\n122#1:149,2\n125#1:151\n125#1:152\n125#1:153,3\n125#1:156\n127#1:157,10\n127#1:167\n127#1:169\n127#1:170\n130#1:172\n130#1:173,2\n117#1:145\n127#1:168\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J&\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u00062\u0008\u0008\u0002\u0010\n\u001a\u00020\u0006J\u001c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0006"
    }
    d2 = {
        "Lcom/lagradost/MediaParser;",
        "",
        "<init>",
        "()V",
        "media",
        "",
        "",
        "doc",
        "Lorg/jsoup/nodes/Document;",
        "base",
        "unpacked",
        "embeds"
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
.field public static final INSTANCE:Lcom/lagradost/MediaParser;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/MediaParser;

    invoke-direct {v0}, Lcom/lagradost/MediaParser;-><init>()V

    sput-object v0, Lcom/lagradost/MediaParser;->INSTANCE:Lcom/lagradost/MediaParser;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$5UkvAMpJGMr4AeHOwaKufsKrkWE(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 1

    invoke-static {p0}, Lcom/lagradost/MediaParser;->media$lambda$1(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic lambda$ZsVvWX-vuJTtdE16OJuhlndux4w(Ljava/lang/String;Lkotlin/text/MatchResult;)Ljava/lang/String;
    .registers 2

    invoke-static {p0, p1}, Lcom/lagradost/MediaParser;->media$lambda$2(Ljava/lang/String;Lkotlin/text/MatchResult;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic lambda$vSlULeI2YRh9iNfU5Apmmnx1cb8(Ljava/lang/String;)Z
    .registers 1

    invoke-static {p0}, Lcom/lagradost/MediaParser;->media$lambda$3(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic media$default(Lcom/lagradost/MediaParser;Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/util/List;
    .registers 6

    .line 115
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_6

    const-string p3, ""

    :cond_6
    invoke-virtual {p0, p1, p2, p3}, Lcom/lagradost/MediaParser;->media(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static final media$lambda$1(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 3
    .param p0, "it"    # Lorg/jsoup/nodes/Element;

    .line 118
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v0

    const-string v1, "data(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method

.method private static final media$lambda$2(Ljava/lang/String;Lkotlin/text/MatchResult;)Ljava/lang/String;
    .registers 5
    .param p0, "$base"    # Ljava/lang/String;
    .param p1, "it"    # Lkotlin/text/MatchResult;

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    sget-object v0, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-interface {p1}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final media$lambda$3(Ljava/lang/String;)Z
    .registers 4
    .param p0, "it"    # Ljava/lang/String;

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 121
    new-instance v0, Lkotlin/text/Regex;

    sget-object v1, Lkotlin/text/RegexOption;->IGNORE_CASE:Lkotlin/text/RegexOption;

    const-string v2, "\\.(m3u8|mp4|webm)([/?#]|$)"

    invoke-direct {v0, v2, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V

    move-object v1, p0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lkotlin/text/Regex;->containsMatchIn(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public final embeds(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/util/List;
    .registers 24
    .param p1, "doc"    # Lorg/jsoup/nodes/Document;
    .param p2, "base"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const-string v2, "doc"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "base"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    const-string v2, "iframe[src]"

    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    const-string v3, "select(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 151
    .local v3, "$i$f$filter":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v2

    .local v5, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 152
    .local v6, "$i$f$filterTo":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_29
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv$iv":Ljava/lang/Object;
    move-object v11, v8

    check-cast v11, Lorg/jsoup/nodes/Element;

    .local v11, "it":Lorg/jsoup/nodes/Element;
    const/4 v12, 0x0

    .line 125
    .local v12, "$i$a$-filter-MediaParser$embeds$urls$1":I
    invoke-virtual {v11}, Lorg/jsoup/nodes/Element;->id()Ljava/lang/String;

    move-result-object v13

    const-string v14, "video_embed_player"

    invoke-static {v13, v14}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_b8

    invoke-virtual {v11}, Lorg/jsoup/nodes/Element;->parents()Lorg/jsoup/select/Elements;

    move-result-object v13

    const-string v14, "parents(...)"

    invoke-static {v13, v14}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v13, Ljava/lang/Iterable;

    .local v13, "$this$any$iv":Ljava/lang/Iterable;
    const/4 v14, 0x0

    .line 153
    .local v14, "$i$f$any":I
    instance-of v15, v13, Ljava/util/Collection;

    if-eqz v15, :cond_62

    move-object v15, v13

    check-cast v15, Ljava/util/Collection;

    invoke-interface {v15}, Ljava/util/Collection;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_62

    move-object/from16 v19, v2

    move/from16 v20, v3

    const/4 v10, 0x0

    goto :goto_b3

    .line 154
    :cond_62
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_66
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_ae

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    .local v16, "element$iv":Ljava/lang/Object;
    move-object/from16 v17, v16

    check-cast v17, Lorg/jsoup/nodes/Element;

    .local v17, "p":Lorg/jsoup/nodes/Element;
    const/16 v18, 0x0

    .line 126
    .local v18, "$i$a$-any-MediaParser$embeds$urls$1$1":I
    new-instance v9, Lkotlin/text/Regex;

    sget-object v10, Lkotlin/text/RegexOption;->IGNORE_CASE:Lkotlin/text/RegexOption;

    move-object/from16 v19, v2

    .end local v2    # "$this$filter$iv":Ljava/lang/Iterable;
    .local v19, "$this$filter$iv":Ljava/lang/Iterable;
    const-string v2, "player|video|embed"

    invoke-direct {v9, v2, v10}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V

    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->id()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->className()Ljava/lang/String;

    move-result-object v10

    move/from16 v20, v3

    .end local v3    # "$i$f$filter":I
    .local v20, "$i$f$filter":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v9, v2}, Lkotlin/text/Regex;->containsMatchIn(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 154
    .end local v17    # "p":Lorg/jsoup/nodes/Element;
    .end local v18    # "$i$a$-any-MediaParser$embeds$urls$1$1":I
    if-eqz v2, :cond_a9

    const/4 v10, 0x1

    goto :goto_b3

    :cond_a9
    move-object/from16 v2, v19

    move/from16 v3, v20

    goto :goto_66

    .line 155
    .end local v16    # "element$iv":Ljava/lang/Object;
    .end local v19    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v20    # "$i$f$filter":I
    .restart local v2    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v3    # "$i$f$filter":I
    :cond_ae
    move-object/from16 v19, v2

    move/from16 v20, v3

    .end local v2    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$filter":I
    .restart local v19    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v20    # "$i$f$filter":I
    const/4 v10, 0x0

    .line 125
    .end local v13    # "$this$any$iv":Ljava/lang/Iterable;
    .end local v14    # "$i$f$any":I
    :goto_b3
    if-eqz v10, :cond_b6

    goto :goto_bc

    :cond_b6
    const/4 v9, 0x0

    goto :goto_bd

    .end local v19    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v20    # "$i$f$filter":I
    .restart local v2    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v3    # "$i$f$filter":I
    :cond_b8
    move-object/from16 v19, v2

    move/from16 v20, v3

    .end local v2    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$filter":I
    .restart local v19    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v20    # "$i$f$filter":I
    :goto_bc
    const/4 v9, 0x1

    .line 127
    :goto_bd
    nop

    .line 152
    .end local v11    # "it":Lorg/jsoup/nodes/Element;
    .end local v12    # "$i$a$-filter-MediaParser$embeds$urls$1":I
    if-eqz v9, :cond_c3

    invoke-interface {v4, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_c3
    move-object/from16 v2, v19

    move/from16 v3, v20

    goto/16 :goto_29

    .line 156
    .end local v8    # "element$iv$iv":Ljava/lang/Object;
    .end local v19    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v20    # "$i$f$filter":I
    .restart local v2    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v3    # "$i$f$filter":I
    :cond_c9
    move-object/from16 v19, v2

    move/from16 v20, v3

    .end local v2    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$filter":I
    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v5    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$filterTo":I
    .restart local v19    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v20    # "$i$f$filter":I
    move-object v2, v4

    check-cast v2, Ljava/util/List;

    .line 151
    nop

    .end local v19    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v20    # "$i$f$filter":I
    check-cast v2, Ljava/lang/Iterable;

    .line 127
    nop

    .local v2, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 157
    .local v3, "$i$f$mapNotNull":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/Collection;

    .restart local v4    # "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v2

    .local v5, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 166
    .local v6, "$i$f$mapNotNullTo":I
    move-object v7, v5

    .local v7, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 167
    .local v8, "$i$f$forEach":I
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_e4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_10b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .local v10, "element$iv$iv$iv":Ljava/lang/Object;
    move-object v11, v10

    .local v11, "element$iv$iv":Ljava/lang/Object;
    const/4 v12, 0x0

    .line 166
    .local v12, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object v13, v11

    check-cast v13, Lorg/jsoup/nodes/Element;

    .local v13, "it":Lorg/jsoup/nodes/Element;
    const/4 v14, 0x0

    .line 127
    .local v14, "$i$a$-mapNotNull-MediaParser$embeds$urls$2":I
    sget-object v15, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    move-object/from16 v16, v2

    .end local v2    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v16, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const-string v2, "src"

    invoke-virtual {v13, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v1, v2}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 166
    .end local v13    # "it":Lorg/jsoup/nodes/Element;
    .end local v14    # "$i$a$-mapNotNull-MediaParser$embeds$urls$2":I
    if-eqz v2, :cond_108

    .line 168
    .local v2, "it$iv$iv":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 166
    .local v13, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v4, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 167
    .end local v2    # "it$iv$iv":Ljava/lang/Object;
    .end local v11    # "element$iv$iv":Ljava/lang/Object;
    .end local v12    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    .end local v13    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    :cond_108
    move-object/from16 v2, v16

    .end local v10    # "element$iv$iv$iv":Ljava/lang/Object;
    goto :goto_e4

    .line 169
    .end local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v2, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    :cond_10b
    move-object/from16 v16, v2

    .line 170
    .end local v2    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v7    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$forEach":I
    .restart local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    nop

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v5    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$mapNotNullTo":I
    move-object v2, v4

    check-cast v2, Ljava/util/List;

    .line 157
    nop

    .end local v3    # "$i$f$mapNotNull":I
    .end local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    check-cast v2, Ljava/util/Collection;

    .line 127
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v2

    .line 125
    nop

    .line 128
    .local v2, "urls":Ljava/util/List;
    const-string v3, "meta[property=og:video:url], meta[property=og:video]"

    invoke-virtual {v0, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_136

    const-string v4, "content"

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_136

    .line 171
    .local v3, "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 128
    .local v4, "$i$a$-let-MediaParser$embeds$1":I
    sget-object v5, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-virtual {v5, v1, v3}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_136

    .line 171
    .local v5, "p0":Ljava/lang/String;
    const/4 v6, 0x0

    .line 128
    .local v6, "$i$a$-let-MediaParser$embeds$1$1":I
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .end local v3    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-let-MediaParser$embeds$1":I
    .end local v5    # "p0":Ljava/lang/String;
    .end local v6    # "$i$a$-let-MediaParser$embeds$1$1":I
    :cond_136
    new-instance v3, Lkotlin/text/Regex;

    const-string v4, "video_embed\\s*=\\s*[\"\']([^\"\']+)[\"\']"

    invoke-direct {v3, v4}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/nodes/Document;->html()Ljava/lang/String;

    move-result-object v4

    const-string v5, "html(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v4, Ljava/lang/CharSequence;

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static {v3, v4, v7, v5, v6}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v3

    if-eqz v3, :cond_16e

    invoke-interface {v3}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_16e

    const/4 v7, 0x1

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_16f

    .line 171
    .restart local v3    # "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 129
    .local v4, "$i$a$-let-MediaParser$embeds$2":I
    sget-object v8, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-virtual {v8, v1, v3}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_16f

    .line 171
    .local v8, "p0":Ljava/lang/String;
    const/4 v9, 0x0

    .line 129
    .local v9, "$i$a$-let-MediaParser$embeds$2$1":I
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v8    # "p0":Ljava/lang/String;
    .end local v9    # "$i$a$-let-MediaParser$embeds$2$1":I
    goto :goto_16f

    .end local v3    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-let-MediaParser$embeds$2":I
    :cond_16e
    const/4 v7, 0x1

    .line 130
    :cond_16f
    :goto_16f
    move-object v3, v2

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    .local v3, "$this$filterNot$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 172
    .local v4, "$i$f$filterNot":I
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    check-cast v8, Ljava/util/Collection;

    .local v8, "destination$iv$iv":Ljava/util/Collection;
    move-object v9, v3

    .local v9, "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 173
    .local v10, "$i$f$filterNotTo":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_186
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1cf

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .local v12, "element$iv$iv":Ljava/lang/Object;
    move-object v13, v12

    check-cast v13, Ljava/lang/String;

    .local v13, "it":Ljava/lang/String;
    const/4 v14, 0x0

    .line 130
    .local v14, "$i$a$-filterNot-MediaParser$embeds$3":I
    move-object v15, v13

    check-cast v15, Ljava/lang/CharSequence;

    const-string v16, "/toplist"

    move-object/from16 v7, v16

    check-cast v7, Ljava/lang/CharSequence;

    const/4 v0, 0x0

    invoke-static {v15, v7, v0, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1c5

    new-instance v7, Lkotlin/text/Regex;

    sget-object v15, Lkotlin/text/RegexOption;->IGNORE_CASE:Lkotlin/text/RegexOption;

    const-string v0, "ads|traffic|chaturbate|doubleclick"

    invoke-direct {v7, v0, v15}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V

    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, v13}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1ba

    const-string v0, ""

    :cond_1ba
    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v7, v0}, Lkotlin/text/Regex;->containsMatchIn(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1c3

    goto :goto_1c5

    :cond_1c3
    const/4 v7, 0x0

    goto :goto_1c6

    :cond_1c5
    :goto_1c5
    const/4 v7, 0x1

    .line 173
    .end local v13    # "it":Ljava/lang/String;
    .end local v14    # "$i$a$-filterNot-MediaParser$embeds$3":I
    :goto_1c6
    if-nez v7, :cond_1cb

    invoke-interface {v8, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_1cb
    move-object/from16 v0, p1

    const/4 v7, 0x1

    goto :goto_186

    .line 174
    .end local v12    # "element$iv$iv":Ljava/lang/Object;
    :cond_1cf
    nop

    .end local v8    # "destination$iv$iv":Ljava/util/Collection;
    .end local v9    # "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$filterNotTo":I
    move-object v0, v8

    check-cast v0, Ljava/util/List;

    .line 172
    nop

    .line 130
    .end local v3    # "$this$filterNot$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$filterNot":I
    return-object v0
.end method

.method public final media(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 23
    .param p1, "doc"    # Lorg/jsoup/nodes/Document;
    .param p2, "base"    # Ljava/lang/String;
    .param p3, "unpacked"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    const-string v3, "doc"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "base"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "unpacked"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    const-string v3, "video[src], video source[src], source[type*=video], source[type*=mpegurl]"

    invoke-virtual {v0, v3}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v3

    const-string v4, "select(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/lang/Iterable;

    .line 117
    nop

    .local v3, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 134
    .local v5, "$i$f$mapNotNull":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    check-cast v6, Ljava/util/Collection;

    .local v6, "destination$iv$iv":Ljava/util/Collection;
    move-object v7, v3

    .local v7, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 143
    .local v8, "$i$f$mapNotNullTo":I
    move-object v9, v7

    .local v9, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 144
    .local v10, "$i$f$forEach":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_33
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5f

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .local v12, "element$iv$iv$iv":Ljava/lang/Object;
    move-object v13, v12

    .local v13, "element$iv$iv":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 143
    .local v14, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object v15, v13

    check-cast v15, Lorg/jsoup/nodes/Element;

    .local v15, "it":Lorg/jsoup/nodes/Element;
    const/16 v16, 0x0

    .line 117
    .local v16, "$i$a$-mapNotNull-MediaParser$media$out$1":I
    move-object/from16 v17, v3

    .end local v3    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v17, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    sget-object v3, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    move/from16 v18, v5

    .end local v5    # "$i$f$mapNotNull":I
    .local v18, "$i$f$mapNotNull":I
    const-string v5, "src"

    invoke-virtual {v15, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v1, v5}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 143
    .end local v15    # "it":Lorg/jsoup/nodes/Element;
    .end local v16    # "$i$a$-mapNotNull-MediaParser$media$out$1":I
    if-eqz v3, :cond_5a

    .line 145
    .local v3, "it$iv$iv":Ljava/lang/Object;
    const/4 v5, 0x0

    .line 143
    .local v5, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v6, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 144
    .end local v3    # "it$iv$iv":Ljava/lang/Object;
    .end local v5    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v13    # "element$iv$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_5a
    move-object/from16 v3, v17

    move/from16 v5, v18

    .end local v12    # "element$iv$iv$iv":Ljava/lang/Object;
    goto :goto_33

    .line 146
    .end local v17    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v18    # "$i$f$mapNotNull":I
    .local v3, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v5, "$i$f$mapNotNull":I
    :cond_5f
    move-object/from16 v17, v3

    move/from16 v18, v5

    .line 147
    .end local v3    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$mapNotNull":I
    .end local v9    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$forEach":I
    .restart local v17    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v18    # "$i$f$mapNotNull":I
    nop

    .end local v6    # "destination$iv$iv":Ljava/util/Collection;
    .end local v7    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$mapNotNullTo":I
    move-object v3, v6

    check-cast v3, Ljava/util/List;

    .line 134
    nop

    .end local v17    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v18    # "$i$f$mapNotNull":I
    check-cast v3, Ljava/util/Collection;

    .line 117
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v3

    .line 116
    nop

    .line 118
    .local v3, "out":Ljava/util/List;
    const-string v5, "script:not([src])"

    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v5

    invoke-static {v5, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v6, v5

    check-cast v6, Ljava/lang/Iterable;

    const-string v4, "\n"

    move-object v7, v4

    check-cast v7, Ljava/lang/CharSequence;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    sget-object v12, Lcom/lagradost/-$$Lambda$MediaParser$5UkvAMpJGMr4AeHOwaKufsKrkWE;->INSTANCE:Lcom/lagradost/-$$Lambda$MediaParser$5UkvAMpJGMr4AeHOwaKufsKrkWE;

    const/16 v13, 0x1e

    const/4 v14, 0x0

    invoke-static/range {v6 .. v14}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 119
    .local v4, "scripts":Ljava/lang/String;
    new-instance v5, Lkotlin/text/Regex;

    const-string v6, "(?:video_url|video_alt_url\\d*|file|source(?:\\d+)?|hls|hls_url|videoHLS|videoHQ|videoURL|src)\\s*[:=]\\s*[\"\']([^\"\']+)[\"\']"

    invoke-direct {v5, v6}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 120
    .local v5, "field":Lkotlin/text/Regex;
    move-object v6, v3

    check-cast v6, Ljava/util/Collection;

    move-object v7, v4

    check-cast v7, Ljava/lang/CharSequence;

    const/4 v8, 0x0

    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-static {v5, v7, v8, v9, v10}, Lkotlin/text/Regex;->findAll$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v7

    new-instance v8, Lcom/lagradost/-$$Lambda$MediaParser$ZsVvWX-vuJTtdE16OJuhlndux4w;

    invoke-direct {v8, v1}, Lcom/lagradost/-$$Lambda$MediaParser$ZsVvWX-vuJTtdE16OJuhlndux4w;-><init>(Ljava/lang/String;)V

    invoke-static {v7, v8}, Lkotlin/sequences/SequencesKt;->mapNotNull(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v7

    .line 121
    sget-object v8, Lcom/lagradost/-$$Lambda$MediaParser$vSlULeI2YRh9iNfU5Apmmnx1cb8;->INSTANCE:Lcom/lagradost/-$$Lambda$MediaParser$vSlULeI2YRh9iNfU5Apmmnx1cb8;

    invoke-static {v7, v8}, Lkotlin/sequences/SequencesKt;->filter(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v7

    invoke-static {v7}, Lkotlin/sequences/SequencesKt;->toList(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v6, v7}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 122
    move-object v6, v3

    check-cast v6, Ljava/lang/Iterable;

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$filterNot$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 148
    .local v7, "$i$f$filterNot":I
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    check-cast v8, Ljava/util/Collection;

    .local v8, "destination$iv$iv":Ljava/util/Collection;
    move-object v9, v6

    .local v9, "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 149
    .local v10, "$i$f$filterNotTo":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_e2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_10a

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .local v12, "element$iv$iv":Ljava/lang/Object;
    move-object v13, v12

    check-cast v13, Ljava/lang/String;

    .local v13, "it":Ljava/lang/String;
    const/4 v14, 0x0

    .line 122
    .local v14, "$i$a$-filterNot-MediaParser$media$3":I
    new-instance v15, Lkotlin/text/Regex;

    sget-object v0, Lkotlin/text/RegexOption;->IGNORE_CASE:Lkotlin/text/RegexOption;

    const-string v1, "preview|trailer|preroll|vast|doubleclick|traffic"

    invoke-direct {v15, v1, v0}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V

    move-object v0, v13

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v15, v0}, Lkotlin/text/Regex;->containsMatchIn(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 149
    .end local v13    # "it":Ljava/lang/String;
    .end local v14    # "$i$a$-filterNot-MediaParser$media$3":I
    if-nez v0, :cond_105

    invoke-interface {v8, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_105
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    goto :goto_e2

    .line 150
    .end local v12    # "element$iv$iv":Ljava/lang/Object;
    :cond_10a
    nop

    .end local v8    # "destination$iv$iv":Ljava/util/Collection;
    .end local v9    # "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$filterNotTo":I
    move-object v0, v8

    check-cast v0, Ljava/util/List;

    .line 148
    nop

    .line 122
    .end local v6    # "$this$filterNot$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$filterNot":I
    return-object v0
.end method
