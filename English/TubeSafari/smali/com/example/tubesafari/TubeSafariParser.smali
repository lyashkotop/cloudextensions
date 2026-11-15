.class public final Lcom/example/tubesafari/TubeSafariParser;
.super Ljava/lang/Object;
.source "TubeSafariParser.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tubesafari/TubeSafariParser$Card;,
        Lcom/example/tubesafari/TubeSafariParser$Page;,
        Lcom/example/tubesafari/TubeSafariParser$Stream;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTubeSafariParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TubeSafariParser.kt\ncom/example/tubesafari/TubeSafariParser\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 _Sequences.kt\nkotlin/sequences/SequencesKt___SequencesKt\n*L\n1#1,157:1\n1642#2,10:158\n1915#2:168\n1916#2:171\n1652#2:172\n1696#2,8:173\n1915#2,2:185\n1915#2,2:187\n832#2:189\n862#2,2:190\n1696#2,8:192\n1080#2:200\n1391#2:201\n1480#2,5:202\n1642#2,10:207\n1915#2:217\n1916#2:219\n1652#2:220\n1696#2,8:221\n1#3:169\n1#3:170\n1#3:218\n1342#4,2:181\n1342#4,2:183\n*S KotlinDebug\n*F\n+ 1 TubeSafariParser.kt\ncom/example/tubesafari/TubeSafariParser\n*L\n15#1:158,10\n15#1:168\n15#1:171\n15#1:172\n28#1:173,8\n68#1:185,2\n74#1:187,2\n85#1:189\n85#1:190,2\n85#1:192,8\n85#1:200\n104#1:201\n104#1:202,5\n114#1:207,10\n114#1:217\n114#1:219\n114#1:220\n121#1:221,8\n15#1:170\n114#1:218\n55#1:181,2\n63#1:183,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u00c0\u0002\u0018\u00002\u00020\u0001:\u0003\'()B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00072\u0006\u0010\t\u001a\u00020\nJ\u0016\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eJ\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\t\u001a\u00020\nJ\u000e\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\nJ\u0014\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u00072\u0006\u0010\t\u001a\u00020\nJ\u0014\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u00072\u0006\u0010\r\u001a\u00020\u000eJ\u001a\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u00072\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u0007J\u000e\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u000eJ*\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u00072\u0006\u0010\u001b\u001a\u00020\u001c2\u0008\u0008\u0002\u0010\u001d\u001a\u00020\u000e2\u0008\u0008\u0002\u0010\u001e\u001a\u00020\u001fH\u0002J\u0016\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u00130\u00072\u0006\u0010!\u001a\u00020\u001cH\u0002J\u001a\u0010\"\u001a\u0004\u0018\u00010\u001c2\u0006\u0010#\u001a\u00020\u000e2\u0006\u0010$\u001a\u00020%H\u0002J\u0010\u0010&\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u000eH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006*"
    }
    d2 = {
        "Lcom/example/tubesafari/TubeSafariParser;",
        "",
        "<init>",
        "()V",
        "mapper",
        "Lcom/fasterxml/jackson/databind/ObjectMapper;",
        "cards",
        "",
        "Lcom/example/tubesafari/TubeSafariParser$Card;",
        "document",
        "Lorg/jsoup/nodes/Document;",
        "page",
        "Lcom/example/tubesafari/TubeSafariParser$Page;",
        "json",
        "",
        "baseUrl",
        "embed",
        "title",
        "playerSources",
        "Lcom/example/tubesafari/TubeSafariParser$Stream;",
        "remoteSources",
        "playable",
        "streams",
        "isExcluded",
        "",
        "url",
        "sourceTree",
        "node",
        "Lcom/fasterxml/jackson/databind/JsonNode;",
        "label",
        "depth",
        "",
        "definitions",
        "input",
        "jsonAssignment",
        "script",
        "assignment",
        "Lkotlin/text/Regex;",
        "httpUrl",
        "Card",
        "Page",
        "Stream",
        "VideoSources_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
    value = {
        "SMAP\nTubeSafariParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TubeSafariParser.kt\ncom/example/tubesafari/TubeSafariParser\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 _Sequences.kt\nkotlin/sequences/SequencesKt___SequencesKt\n*L\n1#1,157:1\n1642#2,10:158\n1915#2:168\n1916#2:171\n1652#2:172\n1696#2,8:173\n1915#2,2:185\n1915#2,2:187\n832#2:189\n862#2,2:190\n1696#2,8:192\n1080#2:200\n1391#2:201\n1480#2,5:202\n1642#2,10:207\n1915#2:217\n1916#2:219\n1652#2:220\n1696#2,8:221\n1#3:169\n1#3:170\n1#3:218\n1342#4,2:181\n1342#4,2:183\n*S KotlinDebug\n*F\n+ 1 TubeSafariParser.kt\ncom/example/tubesafari/TubeSafariParser\n*L\n15#1:158,10\n15#1:168\n15#1:171\n15#1:172\n28#1:173,8\n68#1:185,2\n74#1:187,2\n85#1:189\n85#1:190,2\n85#1:192,8\n85#1:200\n104#1:201\n104#1:202,5\n114#1:207,10\n114#1:217\n114#1:219\n114#1:220\n121#1:221,8\n15#1:170\n114#1:218\n55#1:181,2\n63#1:183,2\n*E\n"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/example/tubesafari/TubeSafariParser;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$KHiUNvpBzWl55M3XJzLHoaKlsvw(Ljava/util/Map$Entry;)Z
    .registers 1

    invoke-static {p0}, Lcom/example/tubesafari/TubeSafariParser;->sourceTree$lambda$4(Ljava/util/Map$Entry;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$t8aoDLCS62UdIc7kiq3vug8z3-w(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 1

    invoke-static {p0}, Lcom/example/tubesafari/TubeSafariParser;->playerSources$lambda$0(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ytZMAAfNOS9Docx3aNRUG4Hd3Fw(Ljava/lang/String;ILjava/util/Map$Entry;)Lkotlin/sequences/Sequence;
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/example/tubesafari/TubeSafariParser;->sourceTree$lambda$5(Ljava/lang/String;ILjava/util/Map$Entry;)Lkotlin/sequences/Sequence;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/example/tubesafari/TubeSafariParser;

    invoke-direct {v0}, Lcom/example/tubesafari/TubeSafariParser;-><init>()V

    sput-object v0, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    .line 13
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    sput-object v0, Lcom/example/tubesafari/TubeSafariParser;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final definitions(Lcom/fasterxml/jackson/databind/JsonNode;)Ljava/util/List;
    .registers 26
    .param p1, "input"    # Lcom/fasterxml/jackson/databind/JsonNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonNode;",
            ")",
            "Ljava/util/List<",
            "Lcom/example/tubesafari/TubeSafariParser$Stream;",
            ">;"
        }
    .end annotation

    .line 112
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/JsonNode;->isTextual()Z

    move-result v0

    if-eqz v0, :cond_37

    :try_start_6
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object/from16 v0, p0

    check-cast v0, Lcom/example/tubesafari/TubeSafariParser;

    .line 169
    .local v0, "$this$definitions_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    const/4 v2, 0x0

    .line 112
    .local v2, "$i$a$-runCatching-TubeSafariParser$definitions$data$1":I
    sget-object v3, Lcom/example/tubesafari/TubeSafariParser;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readTree(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v3

    .end local v0    # "$this$definitions_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    .end local v2    # "$i$a$-runCatching-TubeSafariParser$definitions$data$1":I
    invoke-static {v3}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1b
    .catchall {:try_start_6 .. :try_end_1b} :catchall_1c

    goto :goto_27

    :catchall_1c
    move-exception v0

    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_27
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2e

    const/4 v0, 0x0

    :cond_2e
    check-cast v0, Lcom/fasterxml/jackson/databind/JsonNode;

    if-nez v0, :cond_39

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_37
    move-object/from16 v0, p1

    :cond_39
    move-object v2, v0

    .line 113
    .local v2, "data":Lcom/fasterxml/jackson/databind/JsonNode;
    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/JsonNode;->isArray()Z

    move-result v0

    if-nez v0, :cond_45

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 114
    :cond_45
    move-object v3, v2

    check-cast v3, Ljava/lang/Iterable;

    .local v3, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 207
    .local v4, "$i$f$mapNotNull":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v0

    check-cast v5, Ljava/util/Collection;

    .local v5, "destination$iv$iv":Ljava/util/Collection;
    move-object v6, v3

    .local v6, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 216
    .local v7, "$i$f$mapNotNullTo":I
    move-object v8, v6

    .local v8, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 217
    .local v9, "$i$f$forEach":I
    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_59
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .local v11, "element$iv$iv$iv":Ljava/lang/Object;
    move-object v12, v11

    .local v12, "element$iv$iv":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 216
    .local v13, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object v14, v12

    check-cast v14, Lcom/fasterxml/jackson/databind/JsonNode;

    .local v14, "item":Lcom/fasterxml/jackson/databind/JsonNode;
    const/4 v15, 0x0

    .line 115
    .local v15, "$i$a$-mapNotNull-TubeSafariParser$definitions$1":I
    const-string v0, "videoUrl"

    invoke-virtual {v14, v0}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    const-string v1, ""

    move-object/from16 v17, v2

    .end local v2    # "data":Lcom/fasterxml/jackson/databind/JsonNode;
    .local v17, "data":Lcom/fasterxml/jackson/databind/JsonNode;
    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 116
    .local v2, "url":Ljava/lang/String;
    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-direct {v0, v2}, Lcom/example/tubesafari/TubeSafariParser;->httpUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8b

    move-object/from16 v18, v3

    move/from16 v21, v4

    move-object/from16 v23, v6

    move/from16 v16, v7

    const/4 v6, 0x0

    const/4 v7, 0x0

    goto/16 :goto_157

    .line 117
    :cond_8b
    const-string v0, "quality"

    invoke-virtual {v14, v0}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    move-object/from16 v18, v3

    .end local v3    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v18, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    if-eqz v0, :cond_a3

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_a4

    :cond_a3
    const/4 v0, 0x0

    :goto_a4
    move/from16 v19, v0

    .line 118
    .local v19, "quality":I
    const-string v0, "format"

    invoke-virtual {v14, v0}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 119
    .local v1, "format":Ljava/lang/String;
    const-string v0, "remote"

    invoke-virtual {v14, v0}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/databind/JsonNode;->asBoolean(Z)Z

    move-result v0

    if-nez v0, :cond_114

    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    :try_start_be
    sget-object v20, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 169
    .local v0, "$this$definitions_u24lambda_u241_u240":Lcom/example/tubesafari/TubeSafariParser;
    const/16 v20, 0x0

    .line 119
    .local v20, "$i$a$-runCatching-TubeSafariParser$definitions$1$remote$1":I
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    const-string v21, "/get_media"

    move-object/from16 v22, v0

    .end local v0    # "$this$definitions_u24lambda_u241_u240":Lcom/example/tubesafari/TubeSafariParser;
    .local v22, "$this$definitions_u24lambda_u241_u240":Lcom/example/tubesafari/TubeSafariParser;
    move-object/from16 v0, v21

    check-cast v0, Ljava/lang/CharSequence;
    :try_end_d5
    .catchall {:try_start_be .. :try_end_d5} :catchall_ed

    move/from16 v21, v4

    .end local v4    # "$i$f$mapNotNull":I
    .local v21, "$i$f$mapNotNull":I
    const/4 v4, 0x2

    move-object/from16 v23, v6

    move/from16 v16, v7

    const/4 v6, 0x0

    const/4 v7, 0x0

    .end local v6    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapNotNullTo":I
    .local v16, "$i$f$mapNotNullTo":I
    .local v23, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    :try_start_de
    invoke-static {v3, v0, v7, v4, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    .end local v20    # "$i$a$-runCatching-TubeSafariParser$definitions$1$remote$1":I
    .end local v22    # "$this$definitions_u24lambda_u241_u240":Lcom/example/tubesafari/TubeSafariParser;
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_ea
    .catchall {:try_start_de .. :try_end_ea} :catchall_eb

    goto :goto_ff

    :catchall_eb
    move-exception v0

    goto :goto_f5

    .end local v16    # "$i$f$mapNotNullTo":I
    .end local v21    # "$i$f$mapNotNull":I
    .end local v23    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v4    # "$i$f$mapNotNull":I
    .restart local v6    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v7    # "$i$f$mapNotNullTo":I
    :catchall_ed
    move-exception v0

    move/from16 v21, v4

    move-object/from16 v23, v6

    move/from16 v16, v7

    const/4 v6, 0x0

    .end local v4    # "$i$f$mapNotNull":I
    .end local v6    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapNotNullTo":I
    .restart local v16    # "$i$f$mapNotNullTo":I
    .restart local v21    # "$i$f$mapNotNull":I
    .restart local v23    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    :goto_f5
    sget-object v3, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_ff
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10b

    move-object v0, v4

    :cond_10b
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_11c

    goto :goto_11b

    .end local v16    # "$i$f$mapNotNullTo":I
    .end local v21    # "$i$f$mapNotNull":I
    .end local v23    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v4    # "$i$f$mapNotNull":I
    .restart local v6    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v7    # "$i$f$mapNotNullTo":I
    :cond_114
    move/from16 v21, v4

    move-object/from16 v23, v6

    move/from16 v16, v7

    const/4 v6, 0x0

    .end local v4    # "$i$f$mapNotNull":I
    .end local v6    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapNotNullTo":I
    .restart local v16    # "$i$f$mapNotNullTo":I
    .restart local v21    # "$i$f$mapNotNull":I
    .restart local v23    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    :goto_11b
    const/4 v3, 0x1

    :cond_11c
    move v0, v3

    .line 120
    .local v0, "remote":Z
    move/from16 v3, v19

    .end local v19    # "quality":I
    .local v3, "quality":I
    if-lez v3, :cond_143

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, "p "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_152

    :cond_143
    move-object v4, v1

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_150

    .line 169
    const/4 v4, 0x0

    .line 120
    .local v4, "$i$a$-ifBlank-TubeSafariParser$definitions$1$1":I
    nop

    .end local v4    # "$i$a$-ifBlank-TubeSafariParser$definitions$1$1":I
    const-string v4, "Auto"

    :cond_150
    check-cast v4, Ljava/lang/String;

    :goto_152
    new-instance v7, Lcom/example/tubesafari/TubeSafariParser$Stream;

    invoke-direct {v7, v2, v3, v4, v0}, Lcom/example/tubesafari/TubeSafariParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    .line 216
    .end local v0    # "remote":Z
    .end local v1    # "format":Ljava/lang/String;
    .end local v2    # "url":Ljava/lang/String;
    .end local v3    # "quality":I
    .end local v14    # "item":Lcom/fasterxml/jackson/databind/JsonNode;
    .end local v15    # "$i$a$-mapNotNull-TubeSafariParser$definitions$1":I
    :goto_157
    if-eqz v7, :cond_15e

    move-object v0, v7

    .line 218
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 216
    .local v1, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v5, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 217
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v1    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v12    # "element$iv$iv":Ljava/lang/Object;
    .end local v13    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_15e
    move/from16 v7, v16

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move/from16 v4, v21

    move-object/from16 v6, v23

    .end local v11    # "element$iv$iv$iv":Ljava/lang/Object;
    goto/16 :goto_59

    .line 219
    .end local v16    # "$i$f$mapNotNullTo":I
    .end local v17    # "data":Lcom/fasterxml/jackson/databind/JsonNode;
    .end local v18    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$mapNotNull":I
    .end local v23    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .local v2, "data":Lcom/fasterxml/jackson/databind/JsonNode;
    .local v3, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v4, "$i$f$mapNotNull":I
    .restart local v6    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v7    # "$i$f$mapNotNullTo":I
    :cond_16a
    move-object/from16 v17, v2

    move-object/from16 v18, v3

    move/from16 v21, v4

    move-object/from16 v23, v6

    move/from16 v16, v7

    .line 220
    .end local v2    # "data":Lcom/fasterxml/jackson/databind/JsonNode;
    .end local v3    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$mapNotNull":I
    .end local v6    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapNotNullTo":I
    .end local v8    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$forEach":I
    .restart local v16    # "$i$f$mapNotNullTo":I
    .restart local v17    # "data":Lcom/fasterxml/jackson/databind/JsonNode;
    .restart local v18    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v21    # "$i$f$mapNotNull":I
    .restart local v23    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    nop

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v16    # "$i$f$mapNotNullTo":I
    .end local v23    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    move-object v0, v5

    check-cast v0, Ljava/util/List;

    .line 207
    nop

    .end local v18    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$mapNotNull":I
    check-cast v0, Ljava/lang/Iterable;

    .line 121
    nop

    .local v0, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 221
    .local v1, "$i$f$distinctBy":I
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 222
    .local v2, "set$iv":Ljava/util/HashSet;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 223
    .local v3, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_18b
    :goto_18b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1a8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 224
    .local v5, "e$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Lcom/example/tubesafari/TubeSafariParser$Stream;

    .local v6, "it":Lcom/example/tubesafari/TubeSafariParser$Stream;
    const/4 v7, 0x0

    .line 121
    .local v7, "$i$a$-distinctBy-TubeSafariParser$definitions$2":I
    invoke-virtual {v6}, Lcom/example/tubesafari/TubeSafariParser$Stream;->getUrl()Ljava/lang/String;

    move-result-object v6

    .line 224
    .end local v6    # "it":Lcom/example/tubesafari/TubeSafariParser$Stream;
    .end local v7    # "$i$a$-distinctBy-TubeSafariParser$definitions$2":I
    nop

    .line 225
    .local v6, "key$iv":Ljava/lang/Object;
    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_18b

    .line 226
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18b

    .line 228
    .end local v5    # "e$iv":Ljava/lang/Object;
    .end local v6    # "key$iv":Ljava/lang/Object;
    :cond_1a8
    move-object v0, v3

    check-cast v0, Ljava/util/List;

    .line 114
    .end local v0    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$distinctBy":I
    .end local v2    # "set$iv":Ljava/util/HashSet;
    .end local v3    # "list$iv":Ljava/util/ArrayList;
    return-object v0
.end method

.method private final httpUrl(Ljava/lang/String;)Z
    .registers 8
    .param p1, "url"    # Ljava/lang/String;

    .line 152
    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v1, p0

    check-cast v1, Lcom/example/tubesafari/TubeSafariParser;

    .local v1, "$this$httpUrl_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    const/4 v2, 0x0

    .line 153
    .local v2, "$i$a$-runCatching-TubeSafariParser$httpUrl$1":I
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 154
    .local v3, "uri":Ljava/net/URI;
    const-string v4, "https"

    const-string v5, "http"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v3}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    invoke-virtual {v3}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    const/4 v5, 0x1

    if-eqz v4, :cond_34

    invoke-static {v4}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_32

    goto :goto_34

    :cond_32
    const/4 v4, 0x0

    goto :goto_35

    :cond_34
    :goto_34
    const/4 v4, 0x1

    :goto_35
    if-nez v4, :cond_38

    goto :goto_39

    :cond_38
    const/4 v5, 0x0

    .end local v1    # "$this$httpUrl_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    .end local v2    # "$i$a$-runCatching-TubeSafariParser$httpUrl$1":I
    .end local v3    # "uri":Ljava/net/URI;
    :goto_39
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 152
    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_41
    .catchall {:try_start_1 .. :try_end_41} :catchall_42

    goto :goto_4d

    :catchall_42
    move-exception v1

    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 155
    :goto_4d
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    move-object v1, v0

    :cond_58
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private final jsonAssignment(Ljava/lang/String;Lkotlin/text/Regex;)Lcom/fasterxml/jackson/databind/JsonNode;
    .registers 16
    .param p1, "script"    # Ljava/lang/String;
    .param p2, "assignment"    # Lkotlin/text/Regex;

    .line 126
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p2, v0, v1, v2, v3}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v0

    if-nez v0, :cond_d

    return-object v3

    .line 127
    .local v0, "match":Lkotlin/text/MatchResult;
    :cond_d
    invoke-interface {v0}, Lkotlin/text/MatchResult;->getRange()Lkotlin/ranges/IntRange;

    move-result-object v1

    invoke-virtual {v1}, Lkotlin/ranges/IntRange;->getLast()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 128
    .local v1, "start":I
    move-object v2, p1

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2, v1}, Lkotlin/text/StringsKt;->getOrNull(Ljava/lang/CharSequence;I)Ljava/lang/Character;

    move-result-object v2

    if-nez v2, :cond_21

    goto :goto_29

    :cond_21
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    const/16 v4, 0x7b

    if-eq v2, v4, :cond_2a

    :goto_29
    return-object v3

    .line 129
    :cond_2a
    const/4 v2, 0x0

    .line 130
    .local v2, "depth":I
    const/4 v4, 0x0

    .line 131
    .local v4, "quoted":Z
    const/4 v5, 0x0

    .line 132
    .local v5, "escaped":Z
    move v6, v1

    .local v6, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    :goto_32
    if-ge v6, v7, :cond_8b

    .line 133
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 134
    .local v8, "char":C
    if-eqz v4, :cond_4a

    .line 135
    if-eqz v5, :cond_3e

    const/4 v5, 0x0

    goto :goto_88

    .line 136
    :cond_3e
    const/16 v9, 0x5c

    if-ne v8, v9, :cond_44

    const/4 v5, 0x1

    goto :goto_88

    .line 137
    :cond_44
    const/16 v9, 0x22

    if-ne v8, v9, :cond_88

    const/4 v4, 0x0

    goto :goto_88

    .line 139
    :cond_4a
    sparse-switch v8, :sswitch_data_8c

    goto :goto_88

    .line 143
    :sswitch_4e
    add-int/lit8 v2, v2, -0x1

    .line 144
    if-nez v2, :cond_88

    :try_start_52
    sget-object v7, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v7, p0

    check-cast v7, Lcom/example/tubesafari/TubeSafariParser;

    .line 169
    .local v7, "$this$jsonAssignment_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    const/4 v9, 0x0

    .line 144
    .local v9, "$i$a$-runCatching-TubeSafariParser$jsonAssignment$1":I
    sget-object v10, Lcom/example/tubesafari/TubeSafariParser;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    add-int/lit8 v11, v6, 0x1

    invoke-virtual {p1, v1, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    const-string v12, "substring(...)"

    invoke-static {v11, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readTree(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v10

    .end local v7    # "$this$jsonAssignment_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    .end local v9    # "$i$a$-runCatching-TubeSafariParser$jsonAssignment$1":I
    invoke-static {v10}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7
    :try_end_6d
    .catchall {:try_start_52 .. :try_end_6d} :catchall_6e

    goto :goto_79

    :catchall_6e
    move-exception v7

    sget-object v9, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v7}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    :goto_79
    invoke-static {v7}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_80

    goto :goto_81

    :cond_80
    move-object v3, v7

    :goto_81
    check-cast v3, Lcom/fasterxml/jackson/databind/JsonNode;

    return-object v3

    .line 141
    :sswitch_84
    add-int/lit8 v2, v2, 0x1

    goto :goto_88

    .line 140
    :sswitch_87
    const/4 v4, 0x1

    .line 132
    .end local v8    # "char":C
    :cond_88
    :goto_88
    add-int/lit8 v6, v6, 0x1

    goto :goto_32

    .line 149
    .end local v6    # "i":I
    :cond_8b
    return-object v3

    :sswitch_data_8c
    .sparse-switch
        0x22 -> :sswitch_87
        0x7b -> :sswitch_84
        0x7d -> :sswitch_4e
    .end sparse-switch
.end method

.method private static final playerSources$lambda$0(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "it"    # Lorg/jsoup/nodes/Element;

    .line 44
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method

.method private final sourceTree(Lcom/fasterxml/jackson/databind/JsonNode;Ljava/lang/String;I)Ljava/util/List;
    .registers 15
    .param p1, "node"    # Lcom/fasterxml/jackson/databind/JsonNode;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "depth"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonNode;",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Lcom/example/tubesafari/TubeSafariParser$Stream;",
            ">;"
        }
    .end annotation

    .line 96
    const/16 v0, 0x8

    if-le p3, v0, :cond_9

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 97
    :cond_9
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JsonNode;->isTextual()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_be

    .line 98
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "url":Ljava/lang/String;
    :try_start_15
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v2, p0

    check-cast v2, Lcom/example/tubesafari/TubeSafariParser;

    .line 169
    .local v2, "$this$sourceTree_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    const/4 v3, 0x0

    .line 99
    .local v3, "$i$a$-runCatching-TubeSafariParser$sourceTree$path$1":I
    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_27

    move-object v4, v1

    .end local v2    # "$this$sourceTree_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    .end local v3    # "$i$a$-runCatching-TubeSafariParser$sourceTree$path$1":I
    :cond_27
    invoke-static {v4}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_2b
    .catchall {:try_start_15 .. :try_end_2b} :catchall_2c

    goto :goto_37

    :catchall_2c
    move-exception v2

    sget-object v3, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v2}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    :goto_37
    invoke-static {v2}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3e

    goto :goto_3f

    :cond_3e
    move-object v1, v2

    :goto_3f
    check-cast v1, Ljava/lang/String;

    .line 100
    .local v1, "path":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/example/tubesafari/TubeSafariParser;->httpUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b9

    move-object v2, v1

    check-cast v2, Ljava/lang/CharSequence;

    const-string v3, ".mp4"

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    invoke-static {v2, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_65

    move-object v2, v1

    check-cast v2, Ljava/lang/CharSequence;

    const-string v3, ".m3u8"

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v2, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_65

    goto :goto_b9

    .line 101
    :cond_65
    new-instance v2, Lkotlin/text/Regex;

    const-string v3, "(\\d{3,4})p?"

    invoke-direct {v2, v3}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v3, p2

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v2, v3, v4, v5, v6}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v2

    if-eqz v2, :cond_8e

    invoke-interface {v2}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_8e

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_8e

    invoke-static {v2}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_8e

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :cond_8e
    move v9, v4

    .line 102
    .local v9, "quality":I
    new-instance v10, Lcom/example/tubesafari/TubeSafariParser$Stream;

    if-lez v9, :cond_a7

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x70

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_a9

    :cond_a7
    const-string v2, "Auto"

    :goto_a9
    move-object v5, v2

    const/16 v7, 0x8

    const/4 v8, 0x0

    const/4 v6, 0x0

    move-object v2, v10

    move-object v3, v0

    move v4, v9

    invoke-direct/range {v2 .. v8}, Lcom/example/tubesafari/TubeSafariParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {v10}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 100
    .end local v9    # "quality":I
    :cond_b9
    :goto_b9
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 104
    .end local v0    # "url":Ljava/lang/String;
    .end local v1    # "path":Ljava/lang/String;
    :cond_be
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JsonNode;->isArray()Z

    move-result v0

    if-eqz v0, :cond_f7

    move-object v0, p1

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$flatMap$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 201
    .local v1, "$i$f$flatMap":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/Collection;

    .local v2, "destination$iv$iv":Ljava/util/Collection;
    move-object v3, v0

    .local v3, "$this$flatMapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 202
    .local v4, "$i$f$flatMapTo":I
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_d5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_f2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 203
    .local v6, "element$iv$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Lcom/fasterxml/jackson/databind/JsonNode;

    .local v7, "it":Lcom/fasterxml/jackson/databind/JsonNode;
    const/4 v8, 0x0

    .line 104
    .local v8, "$i$a$-flatMap-TubeSafariParser$sourceTree$1":I
    sget-object v9, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    add-int/lit8 v10, p3, 0x1

    invoke-direct {v9, v7, p2, v10}, Lcom/example/tubesafari/TubeSafariParser;->sourceTree(Lcom/fasterxml/jackson/databind/JsonNode;Ljava/lang/String;I)Ljava/util/List;

    move-result-object v9

    check-cast v9, Ljava/lang/Iterable;

    .line 203
    .end local v7    # "it":Lcom/fasterxml/jackson/databind/JsonNode;
    .end local v8    # "$i$a$-flatMap-TubeSafariParser$sourceTree$1":I
    move-object v7, v9

    .line 204
    .local v7, "list$iv$iv":Ljava/lang/Iterable;
    invoke-static {v2, v7}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_d5

    .line 206
    .end local v6    # "element$iv$iv":Ljava/lang/Object;
    .end local v7    # "list$iv$iv":Ljava/lang/Iterable;
    :cond_f2
    nop

    .end local v2    # "destination$iv$iv":Ljava/util/Collection;
    .end local v3    # "$this$flatMapTo$iv$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$flatMapTo":I
    check-cast v2, Ljava/util/List;

    .line 201
    nop

    .line 104
    .end local v0    # "$this$flatMap$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$flatMap":I
    return-object v2

    .line 105
    :cond_f7
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JsonNode;->isObject()Z

    move-result v0

    if-nez v0, :cond_102

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 106
    :cond_102
    const-string v0, "quality"

    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_11f

    .line 169
    const/4 v0, 0x0

    .line 106
    .local v0, "$i$a$-ifBlank-TubeSafariParser$sourceTree$local$1":I
    const-string v2, "label"

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "$i$a$-ifBlank-TubeSafariParser$sourceTree$local$1":I
    :cond_11f
    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_129

    .line 169
    const/4 v0, 0x0

    .line 106
    .local v0, "$i$a$-ifBlank-TubeSafariParser$sourceTree$local$2":I
    move-object v0, p2

    .end local v0    # "$i$a$-ifBlank-TubeSafariParser$sourceTree$local$2":I
    :cond_129
    check-cast v0, Ljava/lang/String;

    .line 107
    .local v0, "local":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JsonNode;->fields()Ljava/util/Iterator;

    move-result-object v1

    invoke-static {v1}, Lkotlin/sequences/SequencesKt;->asSequence(Ljava/util/Iterator;)Lkotlin/sequences/Sequence;

    move-result-object v1

    new-instance v2, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v1, v2}, Lkotlin/sequences/SequencesKt;->filterNot(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v1

    .line 108
    new-instance v2, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0, p3}, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;I)V

    invoke-static {v1, v2}, Lkotlin/sequences/SequencesKt;->flatMap(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v1

    invoke-static {v1}, Lkotlin/sequences/SequencesKt;->toList(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v1

    .line 107
    return-object v1
.end method

.method static synthetic sourceTree$default(Lcom/example/tubesafari/TubeSafariParser;Lcom/fasterxml/jackson/databind/JsonNode;Ljava/lang/String;IILjava/lang/Object;)Ljava/util/List;
    .registers 6

    .line 95
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_6

    const-string p2, ""

    :cond_6
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_b

    const/4 p3, 0x0

    :cond_b
    invoke-direct {p0, p1, p2, p3}, Lcom/example/tubesafari/TubeSafariParser;->sourceTree(Lcom/fasterxml/jackson/databind/JsonNode;Ljava/lang/String;I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static final sourceTree$lambda$4(Ljava/util/Map$Entry;)Z
    .registers 3
    .param p0, "it"    # Ljava/util/Map$Entry;

    .line 107
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "download"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static final sourceTree$lambda$5(Ljava/lang/String;ILjava/util/Map$Entry;)Lkotlin/sequences/Sequence;
    .registers 8
    .param p0, "$local"    # Ljava/lang/String;
    .param p1, "$depth"    # I
    .param p2, "it"    # Ljava/util/Map$Entry;

    .line 108
    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/databind/JsonNode;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    new-instance v3, Lkotlin/text/Regex;

    const-string v4, "\\d{3,4}p?"

    invoke-direct {v3, v4}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_23

    :cond_22
    move-object v2, p0

    :goto_23
    add-int/lit8 v3, p1, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/example/tubesafari/TubeSafariParser;->sourceTree(Lcom/fasterxml/jackson/databind/JsonNode;Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lkotlin/sequences/Sequence;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final cards(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 2

    invoke-static {p1}, Lcom/streambundle/v43/Repair43;->tubeCards(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public final embed(Lorg/jsoup/nodes/Document;)Ljava/lang/String;
    .registers 6
    .param p1, "document"    # Lorg/jsoup/nodes/Document;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 37
    nop

    .line 36
    const-string v0, "iframe#video2[src]"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 37
    const/4 v1, 0x0

    if-eqz v0, :cond_1d

    .line 36
    nop

    .line 37
    const-string v2, "src"

    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 36
    nop

    .line 37
    move-object v2, v0

    .line 169
    .local v2, "p0":Ljava/lang/String;
    const/4 v3, 0x0

    .line 37
    .local v3, "$i$a$-takeIf-TubeSafariParser$embed$1":I
    invoke-direct {p0, v2}, Lcom/example/tubesafari/TubeSafariParser;->httpUrl(Ljava/lang/String;)Z

    move-result v2

    .end local v2    # "p0":Ljava/lang/String;
    .end local v3    # "$i$a$-takeIf-TubeSafariParser$embed$1":I
    if-eqz v2, :cond_1d

    move-object v1, v0

    :cond_1d
    return-object v1
.end method

.method public final isExcluded(Ljava/lang/String;)Z
    .registers 12
    .param p1, "url"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 87
    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v1, p0

    check-cast v1, Lcom/example/tubesafari/TubeSafariParser;

    .local v1, "$this$isExcluded_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    const/4 v2, 0x0

    .line 88
    .local v2, "$i$a$-runCatching-TubeSafariParser$isExcluded$1":I
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 89
    .local v3, "uri":Ljava/net/URI;
    invoke-virtual {v3}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_77

    const-string v5, ""

    if-nez v4, :cond_15

    move-object v4, v5

    :cond_15
    :try_start_15
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "toLowerCase(...)"

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    .local v4, "host":Ljava/lang/String;
    move-object v6, v4

    check-cast v6, Ljava/lang/CharSequence;

    const-string v7, "pornhub"

    check-cast v7, Ljava/lang/CharSequence;

    const/4 v8, 0x0

    const/4 v9, 0x2

    invoke-static {v6, v7, v0, v9, v8}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6d

    const-string v6, "phncdn.com"

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6d

    const-string v6, ".phncdn.com"

    invoke-static {v4, v6, v0, v9, v8}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6d

    .line 91
    const-string v6, "tubesafari.com"

    const-string v7, "www.tubesafari.com"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6b

    .line 92
    new-instance v6, Lkotlin/text/Regex;

    const-string v7, "(?:^|&)id=ph[^&]*"

    sget-object v8, Lkotlin/text/RegexOption;->IGNORE_CASE:Lkotlin/text/RegexOption;

    invoke-direct {v6, v7, v8}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V

    invoke-virtual {v3}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_61

    goto :goto_62

    :cond_61
    move-object v5, v7

    :goto_62
    check-cast v5, Ljava/lang/CharSequence;

    invoke-virtual {v6, v5}, Lkotlin/text/Regex;->containsMatchIn(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_6b

    goto :goto_6d

    :cond_6b
    const/4 v5, 0x0

    goto :goto_6e

    :cond_6d
    :goto_6d
    const/4 v5, 0x1

    .end local v1    # "$this$isExcluded_u24lambda_u240":Lcom/example/tubesafari/TubeSafariParser;
    .end local v2    # "$i$a$-runCatching-TubeSafariParser$isExcluded$1":I
    .end local v3    # "uri":Ljava/net/URI;
    .end local v4    # "host":Ljava/lang/String;
    :goto_6e
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 87
    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_76
    .catchall {:try_start_15 .. :try_end_76} :catchall_77

    goto :goto_82

    :catchall_77
    move-exception v1

    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 93
    :goto_82
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8d

    move-object v1, v0

    :cond_8d
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public final page(Ljava/lang/String;Ljava/lang/String;)Lcom/example/tubesafari/TubeSafariParser$Page;
    .registers 8
    .param p1, "json"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "baseUrl"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 31
    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readTree(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    .line 32
    .local v0, "data":Lcom/fasterxml/jackson/databind/JsonNode;
    const-string v1, "html"

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/databind/JsonNode;->asText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Lcom/streambundle/Unified;->document(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lcom/example/tubesafari/TubeSafariParser;->cards(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v1

    .line 33
    .local v1, "cards":Ljava/util/List;
    new-instance v2, Lcom/example/tubesafari/TubeSafariParser$Page;

    move-object v3, v1

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_36

    const-string v3, "results_remaining"

    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/fasterxml/jackson/databind/JsonNode;->asInt(I)I

    move-result v3

    if-lez v3, :cond_36

    const/4 v4, 0x1

    :cond_36
    invoke-direct {v2, v1, v4}, Lcom/example/tubesafari/TubeSafariParser$Page;-><init>(Ljava/util/List;Z)V

    return-object v2
.end method

.method public final playable(Ljava/util/List;)Ljava/util/List;
    .registers 13
    .param p1, "streams"    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/example/tubesafari/TubeSafariParser$Stream;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/example/tubesafari/TubeSafariParser$Stream;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 84
    move-object v0, p1

    check-cast v0, Ljava/lang/Iterable;

    .line 85
    nop

    .local v0, "$this$filterNot$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 189
    .local v1, "$i$f$filterNot":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/Collection;

    .local v2, "destination$iv$iv":Ljava/util/Collection;
    move-object v3, v0

    .local v3, "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 190
    .local v4, "$i$f$filterNotTo":I
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_12
    :goto_12
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_30

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Lcom/example/tubesafari/TubeSafariParser$Stream;

    .local v7, "it":Lcom/example/tubesafari/TubeSafariParser$Stream;
    const/4 v8, 0x0

    .line 85
    .local v8, "$i$a$-filterNot-TubeSafariParser$playable$1":I
    sget-object v9, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-virtual {v7}, Lcom/example/tubesafari/TubeSafariParser$Stream;->getUrl()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result v7

    .line 190
    .end local v7    # "it":Lcom/example/tubesafari/TubeSafariParser$Stream;
    .end local v8    # "$i$a$-filterNot-TubeSafariParser$playable$1":I
    if-nez v7, :cond_12

    invoke-interface {v2, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 191
    .end local v6    # "element$iv$iv":Ljava/lang/Object;
    :cond_30
    nop

    .end local v2    # "destination$iv$iv":Ljava/util/Collection;
    .end local v3    # "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$filterNotTo":I
    check-cast v2, Ljava/util/List;

    .line 189
    nop

    .end local v0    # "$this$filterNot$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$filterNot":I
    check-cast v2, Ljava/lang/Iterable;

    .line 85
    move-object v0, v2

    .local v0, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 192
    .local v1, "$i$f$distinctBy":I
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 193
    .local v2, "set$iv":Ljava/util/HashSet;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 194
    .local v3, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_46
    :goto_46
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_63

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 195
    .local v5, "e$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Lcom/example/tubesafari/TubeSafariParser$Stream;

    .local v6, "it":Lcom/example/tubesafari/TubeSafariParser$Stream;
    const/4 v7, 0x0

    .line 85
    .local v7, "$i$a$-distinctBy-TubeSafariParser$playable$2":I
    invoke-virtual {v6}, Lcom/example/tubesafari/TubeSafariParser$Stream;->getUrl()Ljava/lang/String;

    move-result-object v6

    .line 195
    .end local v6    # "it":Lcom/example/tubesafari/TubeSafariParser$Stream;
    .end local v7    # "$i$a$-distinctBy-TubeSafariParser$playable$2":I
    nop

    .line 196
    .local v6, "key$iv":Ljava/lang/Object;
    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_46

    .line 197
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_46

    .line 199
    .end local v5    # "e$iv":Ljava/lang/Object;
    .end local v6    # "key$iv":Ljava/lang/Object;
    :cond_63
    move-object v0, v3

    check-cast v0, Ljava/util/List;

    .end local v0    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$distinctBy":I
    .end local v2    # "set$iv":Ljava/util/HashSet;
    .end local v3    # "list$iv":Ljava/util/ArrayList;
    check-cast v0, Ljava/lang/Iterable;

    .line 85
    nop

    .local v0, "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 200
    .local v1, "$i$f$sortedByDescending":I
    new-instance v2, Lcom/example/tubesafari/TubeSafariParser$playable$$inlined$sortedByDescending$1;

    invoke-direct {v2}, Lcom/example/tubesafari/TubeSafariParser$playable$$inlined$sortedByDescending$1;-><init>()V

    check-cast v2, Ljava/util/Comparator;

    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v0

    .line 85
    .end local v0    # "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$sortedByDescending":I
    return-object v0
.end method

.method public final playerSources(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 43
    .param p1, "document"    # Lorg/jsoup/nodes/Document;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            ")",
            "Ljava/util/List<",
            "Lcom/example/tubesafari/TubeSafariParser$Stream;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 44
    invoke-static/range {p1 .. p1}, Lcom/videobundle/fixes/SiteFix;->playerDocument(Lorg/jsoup/nodes/Document;)Lorg/jsoup/nodes/Document;

    move-result-object p1

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    const-string v0, "script"

    invoke-virtual {v8, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Ljava/lang/Iterable;

    const-string v0, "\n"

    move-object v10, v0

    check-cast v10, Ljava/lang/CharSequence;

    new-instance v15, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda0;

    invoke-direct {v15}, Lcom/example/tubesafari/TubeSafariParser$$ExternalSyntheticLambda0;-><init>()V

    const/16 v16, 0x1e

    const/16 v17, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static/range {v9 .. v17}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 45
    .local v9, "script":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v10, v0

    check-cast v10, Ljava/util/List;

    .line 46
    .local v10, "streams":Ljava/util/List;
    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "\\b(?:var\\s+)?flashvars(?:_\\d+)?\\s*=\\s*"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v9, v0}, Lcom/example/tubesafari/TubeSafariParser;->jsonAssignment(Ljava/lang/String;Lkotlin/text/Regex;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v11

    .line 47
    .local v11, "flash":Lcom/fasterxml/jackson/databind/JsonNode;
    if-eqz v11, :cond_4e

    move-object v0, v10

    check-cast v0, Ljava/util/Collection;

    const-string v1, "mediaDefinitions"

    invoke-virtual {v11, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v1

    invoke-direct {v7, v1}, Lcom/example/tubesafari/TubeSafariParser;->definitions(Lcom/fasterxml/jackson/databind/JsonNode;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 48
    :cond_4e
    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "\\b(?:window\\.)?playlist\\s*=\\s*"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v9, v0}, Lcom/example/tubesafari/TubeSafariParser;->jsonAssignment(Ljava/lang/String;Lkotlin/text/Regex;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v12

    .line 49
    .local v12, "playlist":Lcom/fasterxml/jackson/databind/JsonNode;
    const-string v0, "sources"

    if-eqz v12, :cond_73

    move-object v13, v10

    check-cast v13, Ljava/util/Collection;

    invoke-virtual {v12, v0}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v2

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcom/example/tubesafari/TubeSafariParser;->sourceTree$default(Lcom/example/tubesafari/TubeSafariParser;Lcom/fasterxml/jackson/databind/JsonNode;Ljava/lang/String;IILjava/lang/Object;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v13, v1}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 50
    :cond_73
    new-instance v1, Lkotlin/text/Regex;

    const-string v2, "\\bwindow\\.initials\\s*=\\s*"

    invoke-direct {v1, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v9, v1}, Lcom/example/tubesafari/TubeSafariParser;->jsonAssignment(Ljava/lang/String;Lkotlin/text/Regex;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v13

    .line 51
    .local v13, "initials":Lcom/fasterxml/jackson/databind/JsonNode;
    if-eqz v13, :cond_b4

    .line 52
    move-object v14, v10

    check-cast v14, Ljava/util/Collection;

    const-string v1, "videoModel"

    invoke-virtual {v13, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v2

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcom/example/tubesafari/TubeSafariParser;->sourceTree$default(Lcom/example/tubesafari/TubeSafariParser;Lcom/fasterxml/jackson/databind/JsonNode;Ljava/lang/String;IILjava/lang/Object;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v14, v1}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 53
    move-object v14, v10

    check-cast v14, Ljava/util/Collection;

    const-string v1, "xplayerSettings"

    invoke-virtual {v13, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/databind/JsonNode;->path(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v2

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcom/example/tubesafari/TubeSafariParser;->sourceTree$default(Lcom/example/tubesafari/TubeSafariParser;Lcom/fasterxml/jackson/databind/JsonNode;Ljava/lang/String;IILjava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v14, v0}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 55
    :cond_b4
    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "\\b(video_(?:alt_)?url\\d*)\\s*:\\s*([\'\"])(.*?)\\2"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v1, v9

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/Regex;->findAll$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .local v0, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    const/4 v1, 0x0

    .line 181
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_ca
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const-string v14, "Auto"

    const-string v15, "(\\d{3,4})p"

    const/4 v2, 0x3

    const-string v17, ""

    const/4 v3, 0x1

    if-eqz v6, :cond_1c4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv":Ljava/lang/Object;
    move-object/from16 v19, v6

    check-cast v19, Lkotlin/text/MatchResult;

    .local v19, "match":Lkotlin/text/MatchResult;
    const/16 v20, 0x0

    .line 56
    .local v20, "$i$a$-forEach-TubeSafariParser$playerSources$1":I
    invoke-interface/range {v19 .. v19}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 57
    .local v4, "key":Ljava/lang/String;
    invoke-interface/range {v19 .. v19}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v22, v2

    check-cast v22, Ljava/lang/String;

    const/16 v26, 0x4

    const/16 v27, 0x0

    const-string v23, "\\/"

    const-string v24, "/"

    const/16 v25, 0x0

    invoke-static/range {v22 .. v27}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    const/16 v32, 0x4

    const/16 v33, 0x0

    const-string v29, "\\u0026"

    const-string v30, "&"

    const/16 v31, 0x0

    invoke-static/range {v28 .. v33}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 58
    .local v2, "url":Ljava/lang/String;
    new-instance v3, Lkotlin/text/Regex;

    move-object/from16 v22, v0

    .end local v0    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .local v22, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v23, v1

    .end local v1    # "$i$f$forEach":I
    .local v23, "$i$f$forEach":I
    const-string v1, "\\b"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_text\\s*:\\s*([\'\"])(.*?)\\1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v0, v9

    check-cast v0, Ljava/lang/CharSequence;

    move-object/from16 v24, v4

    move-object/from16 v25, v5

    const/4 v1, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    .end local v4    # "key":Ljava/lang/String;
    .local v24, "key":Ljava/lang/String;
    invoke-static {v3, v0, v5, v4, v1}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v0

    if-eqz v0, :cond_153

    invoke-interface {v0}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_153

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_154

    :cond_153
    const/4 v0, 0x0

    :goto_154
    if-nez v0, :cond_157

    goto :goto_159

    :cond_157
    move-object/from16 v17, v0

    :goto_159
    move-object/from16 v0, v17

    .line 59
    .local v0, "label":Ljava/lang/String;
    new-instance v1, Lkotlin/text/Regex;

    invoke-direct {v1, v15}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v3, v0

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v15, 0x0

    invoke-static {v1, v3, v15, v5, v4}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v1

    if-eqz v1, :cond_188

    invoke-interface {v1}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_188

    const/4 v3, 0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_188

    invoke-static {v1}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_188

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move/from16 v36, v1

    goto :goto_18a

    :cond_188
    const/16 v36, 0x0

    .line 60
    .local v36, "quality":I
    :goto_18a
    sget-object v1, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-direct {v1, v2}, Lcom/example/tubesafari/TubeSafariParser;->httpUrl(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b8

    move-object v1, v10

    check-cast v1, Ljava/util/Collection;

    move-object v3, v0

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1a1

    .line 169
    const/4 v3, 0x0

    .line 60
    .local v3, "$i$a$-ifBlank-TubeSafariParser$playerSources$1$1":I
    nop

    .end local v3    # "$i$a$-ifBlank-TubeSafariParser$playerSources$1$1":I
    goto :goto_1a2

    :cond_1a1
    move-object v14, v3

    :goto_1a2
    move-object/from16 v37, v14

    check-cast v37, Ljava/lang/String;

    new-instance v3, Lcom/example/tubesafari/TubeSafariParser$Stream;

    const/16 v38, 0x0

    const/16 v39, 0x8

    const/16 v40, 0x0

    move-object/from16 v34, v3

    move-object/from16 v35, v2

    invoke-direct/range {v34 .. v40}, Lcom/example/tubesafari/TubeSafariParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 61
    :cond_1b8
    nop

    .line 181
    .end local v0    # "label":Ljava/lang/String;
    .end local v2    # "url":Ljava/lang/String;
    .end local v19    # "match":Lkotlin/text/MatchResult;
    .end local v20    # "$i$a$-forEach-TubeSafariParser$playerSources$1":I
    .end local v24    # "key":Ljava/lang/String;
    .end local v36    # "quality":I
    move-object/from16 v0, v22

    move/from16 v1, v23

    move-object/from16 v5, v25

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    .end local v6    # "element$iv":Ljava/lang/Object;
    goto/16 :goto_ca

    .line 182
    .end local v22    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .end local v23    # "$i$f$forEach":I
    .local v0, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .restart local v1    # "$i$f$forEach":I
    :cond_1c4
    move-object/from16 v22, v0

    move/from16 v23, v1

    .line 62
    .end local v0    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .end local v1    # "$i$f$forEach":I
    new-array v0, v2, [Lkotlin/Pair;

    const-string v1, "setVideoHLS"

    const-string v2, "HLS Auto"

    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "setVideoUrlHigh"

    const-string v2, "MP4 High"

    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "setVideoUrlLow"

    const-string v2, "MP4 Low"

    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1f3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/Pair;

    invoke-virtual {v1}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .local v2, "method":Ljava/lang/String;
    invoke-virtual {v1}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 63
    .local v1, "label":Ljava/lang/String;
    new-instance v3, Lkotlin/text/Regex;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\\."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\\(\\s*([\'\"])(.*?)\\1\\s*\\)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v4, v9

    check-cast v4, Ljava/lang/CharSequence;

    move-object/from16 v19, v2

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x2

    .end local v2    # "method":Ljava/lang/String;
    .local v19, "method":Ljava/lang/String;
    invoke-static {v3, v4, v2, v6, v5}, Lkotlin/text/Regex;->findAll$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v3

    .local v3, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    const/4 v2, 0x0

    .line 183
    .local v2, "$i$f$forEach":I
    invoke-interface {v3}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_23a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_296

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Lkotlin/text/MatchResult;

    .local v6, "match":Lkotlin/text/MatchResult;
    const/16 v20, 0x0

    .line 64
    .local v20, "$i$a$-forEach-TubeSafariParser$playerSources$2":I
    move-object/from16 v29, v0

    invoke-interface {v6}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v0

    move/from16 v30, v2

    const/4 v2, 0x2

    .end local v2    # "$i$f$forEach":I
    .local v30, "$i$f$forEach":I
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v22, v0

    check-cast v22, Ljava/lang/String;

    const/16 v26, 0x4

    const/16 v27, 0x0

    const-string v23, "\\/"

    const-string v24, "/"

    const/16 v25, 0x0

    invoke-static/range {v22 .. v27}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "url":Ljava/lang/String;
    sget-object v2, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-direct {v2, v0}, Lcom/example/tubesafari/TubeSafariParser;->httpUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_28c

    move-object v2, v10

    check-cast v2, Ljava/util/Collection;

    move-object/from16 v31, v3

    .end local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .local v31, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    new-instance v3, Lcom/example/tubesafari/TubeSafariParser$Stream;

    const/16 v27, 0xa

    const/16 v28, 0x0

    const/16 v24, 0x0

    const/16 v26, 0x0

    move-object/from16 v22, v3

    move-object/from16 v23, v0

    move-object/from16 v25, v1

    invoke-direct/range {v22 .. v28}, Lcom/example/tubesafari/TubeSafariParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_28e

    .end local v31    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .restart local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    :cond_28c
    move-object/from16 v31, v3

    .line 66
    .end local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .restart local v31    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    :goto_28e
    nop

    .line 183
    .end local v0    # "url":Ljava/lang/String;
    .end local v6    # "match":Lkotlin/text/MatchResult;
    .end local v20    # "$i$a$-forEach-TubeSafariParser$playerSources$2":I
    move-object/from16 v0, v29

    move/from16 v2, v30

    move-object/from16 v3, v31

    .end local v5    # "element$iv":Ljava/lang/Object;
    goto :goto_23a

    .line 184
    .end local v30    # "$i$f$forEach":I
    .end local v31    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .restart local v2    # "$i$f$forEach":I
    .restart local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    :cond_296
    move-object/from16 v29, v0

    move/from16 v30, v2

    move-object/from16 v31, v3

    .end local v1    # "label":Ljava/lang/String;
    .end local v2    # "$i$f$forEach":I
    .end local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .end local v19    # "method":Ljava/lang/String;
    goto/16 :goto_1f3

    .line 68
    :cond_29e
    const-string v0, "video[src], video source[src]"

    invoke-virtual {v8, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 185
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2ab
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_353

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Lorg/jsoup/nodes/Element;

    .local v4, "element":Lorg/jsoup/nodes/Element;
    const/4 v5, 0x0

    .line 69
    .local v5, "$i$a$-forEach-TubeSafariParser$playerSources$3":I
    const-string v6, "src"

    invoke-virtual {v4, v6}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 70
    .local v6, "url":Ljava/lang/String;
    move-object/from16 v19, v0

    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .local v19, "$this$forEach$iv":Ljava/lang/Iterable;
    const-string v0, "res"

    invoke-virtual {v4, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_2da

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move/from16 v20, v1

    move-object/from16 v29, v2

    move-object/from16 v30, v3

    move-object/from16 v31, v4

    goto :goto_310

    .line 71
    :cond_2da
    new-instance v0, Lkotlin/text/Regex;

    invoke-direct {v0, v15}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move/from16 v20, v1

    .end local v1    # "$i$f$forEach":I
    .local v20, "$i$f$forEach":I
    move-object v1, v6

    check-cast v1, Ljava/lang/CharSequence;

    move-object/from16 v29, v2

    move-object/from16 v30, v3

    move-object/from16 v31, v4

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    .end local v3    # "element$iv":Ljava/lang/Object;
    .end local v4    # "element":Lorg/jsoup/nodes/Element;
    .local v30, "element$iv":Ljava/lang/Object;
    .local v31, "element":Lorg/jsoup/nodes/Element;
    invoke-static {v0, v1, v4, v3, v2}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v0

    if-eqz v0, :cond_307

    invoke-interface {v0}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_307

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_307

    invoke-static {v0}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_308

    :cond_307
    const/4 v1, 0x0

    .line 70
    :goto_308
    if-eqz v1, :cond_30f

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_310

    .line 71
    :cond_30f
    const/4 v0, 0x0

    .line 70
    :goto_310
    nop

    .line 72
    .local v0, "quality":I
    sget-object v1, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-direct {v1, v6}, Lcom/example/tubesafari/TubeSafariParser;->httpUrl(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_34a

    move-object v1, v10

    check-cast v1, Ljava/util/Collection;

    new-instance v2, Lcom/example/tubesafari/TubeSafariParser$Stream;

    if-lez v0, :cond_336

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x70

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v25, v3

    goto :goto_338

    :cond_336
    move-object/from16 v25, v14

    :goto_338
    const/16 v27, 0x8

    const/16 v28, 0x0

    const/16 v26, 0x0

    move-object/from16 v22, v2

    move-object/from16 v23, v6

    move/from16 v24, v0

    invoke-direct/range {v22 .. v28}, Lcom/example/tubesafari/TubeSafariParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 73
    :cond_34a
    nop

    .line 185
    .end local v0    # "quality":I
    .end local v5    # "$i$a$-forEach-TubeSafariParser$playerSources$3":I
    .end local v6    # "url":Ljava/lang/String;
    .end local v31    # "element":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, v19

    move/from16 v1, v20

    move-object/from16 v2, v29

    .end local v30    # "element$iv":Ljava/lang/Object;
    goto/16 :goto_2ab

    .line 186
    .end local v19    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v20    # "$i$f$forEach":I
    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    .restart local v1    # "$i$f$forEach":I
    :cond_353
    move-object/from16 v19, v0

    move/from16 v20, v1

    .line 74
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$forEach":I
    const-string v0, "a[href]"

    invoke-virtual {v8, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 187
    .restart local v2    # "$i$f$forEach":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_365
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_403

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .local v4, "element$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Lorg/jsoup/nodes/Element;

    .local v5, "anchor":Lorg/jsoup/nodes/Element;
    const/4 v6, 0x0

    .line 75
    .local v6, "$i$a$-forEach-TubeSafariParser$playerSources$4":I
    const-string v0, "href"

    invoke-virtual {v5, v0}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 76
    .local v14, "url":Ljava/lang/String;
    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    :try_start_37b
    sget-object v15, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 169
    .local v0, "$this$playerSources_u24lambda_u244_u240":Lcom/example/tubesafari/TubeSafariParser;
    const/4 v15, 0x0

    .line 76
    .local v15, "$i$a$-runCatching-TubeSafariParser$playerSources$4$path$1":I
    move-object/from16 v19, v0

    .end local v0    # "$this$playerSources_u24lambda_u244_u240":Lcom/example/tubesafari/TubeSafariParser;
    .local v19, "$this$playerSources_u24lambda_u244_u240":Lcom/example/tubesafari/TubeSafariParser;
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, v14}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0
    :try_end_389
    .catchall {:try_start_37b .. :try_end_389} :catchall_3a5

    if-nez v0, :cond_38d

    move-object/from16 v0, v17

    :cond_38d
    move-object/from16 v20, v1

    move/from16 v21, v2

    const/4 v1, 0x1

    .end local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEach":I
    .local v20, "$this$forEach$iv":Ljava/lang/Iterable;
    .local v21, "$i$f$forEach":I
    :try_start_392
    new-array v2, v1, [C

    const/16 v22, 0x2f

    const/16 v16, 0x0

    aput-char v22, v2, v16

    invoke-static {v0, v2}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    .end local v15    # "$i$a$-runCatching-TubeSafariParser$playerSources$4$path$1":I
    .end local v19    # "$this$playerSources_u24lambda_u244_u240":Lcom/example/tubesafari/TubeSafariParser;
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_3a2
    .catchall {:try_start_392 .. :try_end_3a2} :catchall_3a3

    goto :goto_3b5

    :catchall_3a3
    move-exception v0

    goto :goto_3ab

    .end local v20    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$forEach":I
    .restart local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .restart local v2    # "$i$f$forEach":I
    :catchall_3a5
    move-exception v0

    move-object/from16 v20, v1

    move/from16 v21, v2

    const/4 v1, 0x1

    .end local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEach":I
    .restart local v20    # "$this$forEach$iv":Ljava/lang/Iterable;
    .restart local v21    # "$i$f$forEach":I
    :goto_3ab
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_3b5
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3bd

    move-object/from16 v0, v17

    :cond_3bd
    check-cast v0, Ljava/lang/String;

    .line 77
    .local v0, "path":Ljava/lang/String;
    sget-object v2, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-direct {v2, v14}, Lcom/example/tubesafari/TubeSafariParser;->httpUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3f6

    const-string v2, ".mp4"

    move-object/from16 v18, v3

    const/4 v1, 0x2

    const/4 v3, 0x0

    const/4 v15, 0x0

    invoke-static {v0, v2, v3, v1, v15}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3dc

    const-string v2, ".m3u8"

    invoke-static {v0, v2, v3, v1, v15}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3fa

    :cond_3dc
    move-object v2, v10

    check-cast v2, Ljava/util/Collection;

    new-instance v1, Lcom/example/tubesafari/TubeSafariParser$Stream;

    const/16 v27, 0xe

    const/16 v28, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object/from16 v22, v1

    move-object/from16 v23, v14

    invoke-direct/range {v22 .. v28}, Lcom/example/tubesafari/TubeSafariParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3fa

    :cond_3f6
    move-object/from16 v18, v3

    const/4 v3, 0x0

    const/4 v15, 0x0

    .line 78
    :cond_3fa
    :goto_3fa
    nop

    .line 187
    .end local v0    # "path":Ljava/lang/String;
    .end local v5    # "anchor":Lorg/jsoup/nodes/Element;
    .end local v6    # "$i$a$-forEach-TubeSafariParser$playerSources$4":I
    .end local v14    # "url":Ljava/lang/String;
    move-object/from16 v3, v18

    move-object/from16 v1, v20

    move/from16 v2, v21

    .end local v4    # "element$iv":Ljava/lang/Object;
    goto/16 :goto_365

    .line 188
    .end local v20    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$forEach":I
    .restart local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .restart local v2    # "$i$f$forEach":I
    :cond_403
    nop

    .line 79
    .end local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEach":I
    invoke-virtual {v7, v10}, Lcom/example/tubesafari/TubeSafariParser;->playable(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final remoteSources(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "json"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/example/tubesafari/TubeSafariParser$Stream;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 82
    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readTree(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/example/tubesafari/TubeSafariParser;->definitions(Lcom/fasterxml/jackson/databind/JsonNode;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final title(Lorg/jsoup/nodes/Document;)Ljava/lang/String;
    .registers 6
    .param p1, "document"    # Lorg/jsoup/nodes/Document;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 39
    nop

    .line 40
    nop

    .line 39
    const-string v0, "h1"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_2d

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2d

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 40
    if-eqz v0, :cond_2d

    .line 39
    nop

    .line 40
    move-object v1, v0

    .line 169
    .local v1, "p0":Ljava/lang/String;
    const/4 v2, 0x0

    .line 40
    .local v2, "$i$a$-takeIf-TubeSafariParser$title$1":I
    move-object v3, v1

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    .end local v1    # "p0":Ljava/lang/String;
    .end local v2    # "$i$a$-takeIf-TubeSafariParser$title$1":I
    if-nez v3, :cond_29

    goto :goto_2a

    :cond_29
    const/4 v0, 0x0

    .line 39
    :goto_2a
    if-eqz v0, :cond_2d

    goto :goto_4c

    .line 40
    :cond_2d
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 41
    new-instance v1, Lkotlin/text/Regex;

    const-string v2, "\\s*[-|]\\s*tubesafari(?:\\.com)?\\s*$"

    sget-object v3, Lkotlin/text/RegexOption;->IGNORE_CASE:Lkotlin/text/RegexOption;

    invoke-direct {v1, v2, v3}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V

    const-string v2, ""

    invoke-virtual {v1, v0, v2}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_4c
    return-object v0
.end method
