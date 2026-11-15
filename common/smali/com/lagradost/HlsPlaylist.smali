.class public final Lcom/lagradost/HlsPlaylist;
.super Ljava/lang/Object;
.source "HlsPlaylist.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nHlsPlaylist.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HlsPlaylist.kt\ncom/lagradost/HlsPlaylist\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,23:1\n1795#2,10:24\n2068#2:34\n296#2,2:35\n2069#2:39\n1805#2:40\n1849#2,8:41\n1#3:37\n1#3:38\n*S KotlinDebug\n*F\n+ 1 HlsPlaylist.kt\ncom/lagradost/HlsPlaylist\n*L\n11#1:24,10\n11#1:34\n16#1:35,2\n11#1:39\n11#1:40\n20#1:41,8\n11#1:38\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0008"
    }
    d2 = {
        "Lcom/lagradost/HlsPlaylist;",
        "",
        "<init>",
        "()V",
        "variants",
        "",
        "Lcom/lagradost/HlsVariant;",
        "text",
        "",
        "master"
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
.field public static final INSTANCE:Lcom/lagradost/HlsPlaylist;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/HlsPlaylist;

    invoke-direct {v0}, Lcom/lagradost/HlsPlaylist;-><init>()V

    sput-object v0, Lcom/lagradost/HlsPlaylist;->INSTANCE:Lcom/lagradost/HlsPlaylist;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$YiBV4U5PFB5bLaHkgMbMaDzHcsA(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Lcom/lagradost/HlsPlaylist;->variants$lambda$0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final variants$lambda$0(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "it"    # Ljava/lang/String;

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    move-object v0, p0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final variants(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 32
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "master"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/HlsVariant;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const-string v0, "text"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "master"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    move-object v0, v1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trimStart(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "#EXTM3U"

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    invoke-static {v0, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 10
    :cond_29
    move-object v0, v1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->lineSequence(Ljava/lang/CharSequence;)Lkotlin/sequences/Sequence;

    move-result-object v0

    sget-object v3, Lcom/lagradost/-$$Lambda$HlsPlaylist$YiBV4U5PFB5bLaHkgMbMaDzHcsA;->INSTANCE:Lcom/lagradost/-$$Lambda$HlsPlaylist$YiBV4U5PFB5bLaHkgMbMaDzHcsA;

    invoke-static {v0, v3}, Lkotlin/sequences/SequencesKt;->map(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v0

    invoke-static {v0}, Lkotlin/sequences/SequencesKt;->toList(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v3

    .line 11
    .local v3, "lines":Ljava/util/List;
    move-object v0, v3

    check-cast v0, Ljava/util/Collection;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->getIndices(Ljava/util/Collection;)Lkotlin/ranges/IntRange;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 24
    .local v8, "$i$f$mapNotNull":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/Collection;

    .local v0, "destination$iv$iv":Ljava/util/Collection;
    move-object v9, v7

    .local v9, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    move-object v10, v0

    .end local v0    # "destination$iv$iv":Ljava/util/Collection;
    .local v10, "destination$iv$iv":Ljava/util/Collection;
    const/4 v11, 0x0

    .line 33
    .local v11, "$i$f$mapNotNullTo":I
    move-object v12, v9

    .local v12, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 34
    .local v13, "$i$f$forEach":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_55
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a5

    move-object v0, v14

    check-cast v0, Lkotlin/collections/IntIterator;

    invoke-virtual {v0}, Lkotlin/collections/IntIterator;->nextInt()I

    move-result v15

    .local v15, "element$iv$iv$iv":I
    move/from16 v16, v15

    .local v16, "element$iv$iv":I
    const/16 v17, 0x0

    .line 33
    .local v17, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move/from16 v18, v16

    .local v18, "index":I
    const/16 v19, 0x0

    .line 12
    .local v19, "$i$a$-mapNotNull-HlsPlaylist$variants$1":I
    move/from16 v4, v18

    .end local v18    # "index":I
    .local v4, "index":I
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .line 13
    .local v5, "info":Ljava/lang/String;
    const-string v0, "#EXT-X-STREAM-INF:"

    move-object/from16 v20, v7

    const/4 v1, 0x2

    const/4 v7, 0x0

    .end local v7    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v20, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    invoke-static {v5, v0, v7, v1, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_87

    move-object/from16 v27, v3

    move-object v3, v6

    move/from16 v21, v8

    move v8, v7

    goto/16 :goto_191

    .line 14
    :cond_87
    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "RESOLUTION=\\d+[xX](\\d+)"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v1, v5

    check-cast v1, Ljava/lang/CharSequence;

    move/from16 v21, v8

    const/4 v8, 0x2

    .end local v8    # "$i$f$mapNotNull":I
    .local v21, "$i$f$mapNotNull":I
    invoke-static {v0, v1, v7, v8, v6}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v0

    if-eqz v0, :cond_18b

    invoke-interface {v0}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_18b

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_18b

    invoke-static {v0}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_18b

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move v7, v0

    .line 15
    .local v7, "height":I
    new-instance v0, Lkotlin/text/Regex;

    const-string v8, "(?:^|[:,])BANDWIDTH=(\\d+)"

    invoke-direct {v0, v8}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v8, v5

    check-cast v8, Ljava/lang/CharSequence;

    move-object/from16 v23, v5

    const/4 v1, 0x2

    const/4 v5, 0x0

    .end local v5    # "info":Ljava/lang/String;
    .local v23, "info":Ljava/lang/String;
    invoke-static {v0, v8, v5, v1, v6}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v0

    if-eqz v0, :cond_e2

    invoke-interface {v0}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_e2

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_e2

    invoke-static {v0}, Lkotlin/text/StringsKt;->toLongOrNull(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_e2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_e4

    :cond_e2
    const-wide/16 v0, 0x0

    :goto_e4
    move-wide/from16 v24, v0

    .line 16
    .local v24, "bandwidth":J
    move-object v0, v3

    check-cast v0, Ljava/lang/Iterable;

    add-int/lit8 v1, v4, 0x1

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->drop(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 35
    .local v1, "$i$f$firstOrNull":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_f6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_115

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv":Ljava/lang/Object;
    move-object/from16 v26, v8

    check-cast v26, Ljava/lang/String;

    .local v26, "it":Ljava/lang/String;
    const/16 v27, 0x0

    .line 16
    .local v27, "$i$a$-firstOrNull-HlsPlaylist$variants$1$path$1":I
    move-object/from16 v28, v26

    check-cast v28, Ljava/lang/CharSequence;

    invoke-static/range {v28 .. v28}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v28

    const/16 v22, 0x1

    xor-int/lit8 v28, v28, 0x1

    .line 35
    .end local v26    # "it":Ljava/lang/String;
    .end local v27    # "$i$a$-firstOrNull-HlsPlaylist$variants$1$path$1":I
    if-eqz v28, :cond_f6

    goto :goto_116

    .line 36
    .end local v8    # "element$iv":Ljava/lang/Object;
    :cond_115
    move-object v8, v6

    .line 16
    .end local v0    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$firstOrNull":I
    :goto_116
    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_184

    move-object v0, v8

    .line 37
    .local v0, "it":Ljava/lang/String;
    const/4 v1, 0x0

    .line 16
    .local v1, "$i$a$-takeUnless-HlsPlaylist$variants$1$path$2":I
    move-object v5, v0

    check-cast v5, Ljava/lang/CharSequence;

    move-object/from16 v22, v0

    .end local v0    # "it":Ljava/lang/String;
    .local v22, "it":Ljava/lang/String;
    const/16 v0, 0x23

    move/from16 v26, v1

    move-object/from16 v27, v3

    const/4 v1, 0x2

    const/4 v3, 0x0

    .end local v1    # "$i$a$-takeUnless-HlsPlaylist$variants$1$path$2":I
    .end local v3    # "lines":Ljava/util/List;
    .local v26, "$i$a$-takeUnless-HlsPlaylist$variants$1$path$2":I
    .local v27, "lines":Ljava/util/List;
    invoke-static {v5, v0, v3, v1, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v0

    .end local v22    # "it":Ljava/lang/String;
    .end local v26    # "$i$a$-takeUnless-HlsPlaylist$variants$1$path$2":I
    if-nez v0, :cond_130

    goto :goto_131

    :cond_130
    move-object v8, v6

    :goto_131
    if-nez v8, :cond_137

    move-wide/from16 v5, v24

    const/4 v8, 0x0

    goto :goto_189

    :cond_137
    move-object v1, v8

    .line 17
    .local v1, "path":Ljava/lang/String;
    sget-object v0, Lcom/lagradost/HlsPlaylist;->INSTANCE:Lcom/lagradost/HlsPlaylist;

    :try_start_13a
    sget-object v3, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 37
    .local v0, "$this$variants_u24lambda_u241_u242":Lcom/lagradost/HlsPlaylist;
    const/4 v3, 0x0

    .line 17
    .local v3, "$i$a$-runCatching-HlsPlaylist$variants$1$url$1":I
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v5

    .end local v0    # "$this$variants_u24lambda_u241_u242":Lcom/lagradost/HlsPlaylist;
    .end local v3    # "$i$a$-runCatching-HlsPlaylist$variants$1$url$1":I
    invoke-static {v5}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_14e
    .catchall {:try_start_13a .. :try_end_14e} :catchall_14f

    goto :goto_15a

    :catchall_14f
    move-exception v0

    sget-object v3, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_15a
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_161

    move-object v0, v6

    :cond_161
    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_168

    move-object v3, v6

    const/4 v8, 0x0

    goto :goto_191

    .line 18
    .local v0, "url":Ljava/lang/String;
    :cond_168
    const-string v3, "https://"

    const/4 v5, 0x2

    const/4 v8, 0x0

    invoke-static {v0, v3, v8, v5, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17c

    const-string v3, "http://"

    invoke-static {v0, v3, v8, v5, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17c

    move-object v3, v6

    goto :goto_191

    .line 19
    :cond_17c
    new-instance v3, Lcom/lagradost/HlsVariant;

    move-wide/from16 v5, v24

    .end local v24    # "bandwidth":J
    .local v5, "bandwidth":J
    invoke-direct {v3, v0, v7, v5, v6}, Lcom/lagradost/HlsVariant;-><init>(Ljava/lang/String;IJ)V

    goto :goto_191

    .line 16
    .end local v0    # "url":Ljava/lang/String;
    .end local v1    # "path":Ljava/lang/String;
    .end local v5    # "bandwidth":J
    .end local v27    # "lines":Ljava/util/List;
    .local v3, "lines":Ljava/util/List;
    .restart local v24    # "bandwidth":J
    :cond_184
    move-object/from16 v27, v3

    move-wide/from16 v5, v24

    const/4 v8, 0x0

    .end local v3    # "lines":Ljava/util/List;
    .end local v24    # "bandwidth":J
    .restart local v5    # "bandwidth":J
    .restart local v27    # "lines":Ljava/util/List;
    :goto_189
    const/4 v3, 0x0

    goto :goto_191

    .line 14
    .end local v7    # "height":I
    .end local v23    # "info":Ljava/lang/String;
    .end local v27    # "lines":Ljava/util/List;
    .restart local v3    # "lines":Ljava/util/List;
    .local v5, "info":Ljava/lang/String;
    :cond_18b
    move-object/from16 v27, v3

    move-object/from16 v23, v5

    const/4 v8, 0x0

    .end local v3    # "lines":Ljava/util/List;
    .end local v5    # "info":Ljava/lang/String;
    .restart local v23    # "info":Ljava/lang/String;
    .restart local v27    # "lines":Ljava/util/List;
    const/4 v3, 0x0

    .line 33
    .end local v4    # "index":I
    .end local v19    # "$i$a$-mapNotNull-HlsPlaylist$variants$1":I
    .end local v23    # "info":Ljava/lang/String;
    :goto_191
    if-eqz v3, :cond_198

    move-object v0, v3

    .line 38
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 33
    .local v1, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v10, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 34
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v1    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v16    # "element$iv$iv":I
    .end local v17    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_198
    move-object/from16 v1, p1

    move v4, v8

    move-object/from16 v7, v20

    move/from16 v8, v21

    move-object/from16 v3, v27

    const/4 v5, 0x2

    const/4 v6, 0x0

    .end local v15    # "element$iv$iv$iv":I
    goto/16 :goto_55

    .line 39
    .end local v20    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$mapNotNull":I
    .end local v27    # "lines":Ljava/util/List;
    .restart local v3    # "lines":Ljava/util/List;
    .local v7, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v8, "$i$f$mapNotNull":I
    :cond_1a5
    move-object/from16 v27, v3

    move-object/from16 v20, v7

    move/from16 v21, v8

    .line 40
    .end local v3    # "lines":Ljava/util/List;
    .end local v7    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$mapNotNull":I
    .end local v12    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v13    # "$i$f$forEach":I
    .restart local v20    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v21    # "$i$f$mapNotNull":I
    .restart local v27    # "lines":Ljava/util/List;
    nop

    .end local v9    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v10    # "destination$iv$iv":Ljava/util/Collection;
    .end local v11    # "$i$f$mapNotNullTo":I
    move-object v0, v10

    check-cast v0, Ljava/util/List;

    .line 24
    nop

    .end local v20    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$mapNotNull":I
    check-cast v0, Ljava/lang/Iterable;

    .line 20
    nop

    .local v0, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 41
    .local v1, "$i$f$distinctBy":I
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 42
    .local v3, "set$iv":Ljava/util/HashSet;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .local v4, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1c2
    :goto_1c2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1df

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 44
    .local v6, "e$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Lcom/lagradost/HlsVariant;

    .local v7, "it":Lcom/lagradost/HlsVariant;
    const/4 v8, 0x0

    .line 20
    .local v8, "$i$a$-distinctBy-HlsPlaylist$variants$2":I
    invoke-virtual {v7}, Lcom/lagradost/HlsVariant;->getUrl()Ljava/lang/String;

    move-result-object v7

    .line 44
    .end local v7    # "it":Lcom/lagradost/HlsVariant;
    .end local v8    # "$i$a$-distinctBy-HlsPlaylist$variants$2":I
    nop

    .line 45
    .local v7, "key$iv":Ljava/lang/Object;
    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1c2

    .line 46
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c2

    .line 48
    .end local v6    # "e$iv":Ljava/lang/Object;
    .end local v7    # "key$iv":Ljava/lang/Object;
    :cond_1df
    move-object v0, v4

    check-cast v0, Ljava/util/List;

    .end local v0    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$distinctBy":I
    .end local v3    # "set$iv":Ljava/util/HashSet;
    .end local v4    # "list$iv":Ljava/util/ArrayList;
    check-cast v0, Ljava/lang/Iterable;

    .line 20
    new-instance v1, Lcom/lagradost/HlsPlaylist$variants$$inlined$compareByDescending$1;

    invoke-direct {v1}, Lcom/lagradost/HlsPlaylist$variants$$inlined$compareByDescending$1;-><init>()V

    check-cast v1, Ljava/util/Comparator;

    new-instance v3, Lcom/lagradost/HlsPlaylist$variants$$inlined$thenByDescending$1;

    invoke-direct {v3, v1}, Lcom/lagradost/HlsPlaylist$variants$$inlined$thenByDescending$1;-><init>(Ljava/util/Comparator;)V

    check-cast v3, Ljava/util/Comparator;

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v0

    .line 11
    return-object v0
.end method
