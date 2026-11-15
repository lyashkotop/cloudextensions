.class public final Lcom/example/epawg/EpawgParser;
.super Ljava/lang/Object;
.source "EpawgParser.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/epawg/EpawgParser$Card;,
        Lcom/example/epawg/EpawgParser$Stream;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEpawgParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EpawgParser.kt\ncom/example/epawg/EpawgParser\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 _Sequences.kt\nkotlin/sequences/SequencesKt___SequencesKt\n*L\n1#1,66:1\n1642#2,10:67\n1915#2:77\n1916#2:80\n1652#2:81\n1696#2,8:82\n1915#2,2:92\n1696#2,8:94\n1080#2:102\n1#3:78\n1#3:79\n1342#4,2:90\n*S KotlinDebug\n*F\n+ 1 EpawgParser.kt\ncom/example/epawg/EpawgParser\n*L\n12#1:67,10\n12#1:77\n12#1:80\n12#1:81\n24#1:82,8\n43#1:92,2\n50#1:94,8\n50#1:102\n12#1:79\n32#1:90,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c0\u0002\u0018\u00002\u00020\u0001:\u0002\u0015\u0016B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\u0008J\u000e\u0010\t\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u0008J\u0014\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u00052\u0006\u0010\u0007\u001a\u00020\u0008J\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eH\u0002J\u0010\u0010\u0010\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\u000eH\u0002R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/example/epawg/EpawgParser;",
        "",
        "<init>",
        "()V",
        "cards",
        "",
        "Lcom/example/epawg/EpawgParser$Card;",
        "document",
        "Lorg/jsoup/nodes/Document;",
        "hasNext",
        "",
        "streams",
        "Lcom/example/epawg/EpawgParser$Stream;",
        "clean",
        "",
        "value",
        "isPlayable",
        "url",
        "VARIABLE",
        "Lkotlin/text/Regex;",
        "QUALITY",
        "Card",
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
        "SMAP\nEpawgParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EpawgParser.kt\ncom/example/epawg/EpawgParser\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 _Sequences.kt\nkotlin/sequences/SequencesKt___SequencesKt\n*L\n1#1,66:1\n1642#2,10:67\n1915#2:77\n1916#2:80\n1652#2:81\n1696#2,8:82\n1915#2,2:92\n1696#2,8:94\n1080#2:102\n1#3:78\n1#3:79\n1342#4,2:90\n*S KotlinDebug\n*F\n+ 1 EpawgParser.kt\ncom/example/epawg/EpawgParser\n*L\n12#1:67,10\n12#1:77\n12#1:80\n12#1:81\n24#1:82,8\n43#1:92,2\n50#1:94,8\n50#1:102\n12#1:79\n32#1:90,2\n*E\n"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/example/epawg/EpawgParser;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final QUALITY:Lkotlin/text/Regex;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final VARIABLE:Lkotlin/text/Regex;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$5wvhh0y56D1kNZKLlwnrZXy5FAI(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 1

    invoke-static {p0}, Lcom/example/epawg/EpawgParser;->streams$lambda$0(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcom/example/epawg/EpawgParser;

    invoke-direct {v0}, Lcom/example/epawg/EpawgParser;-><init>()V

    sput-object v0, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    .line 63
    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "\\b(video_(?:alt_)?url\\d*)\\s*:\\s*([\'\"])(.*?)\\2"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/example/epawg/EpawgParser;->VARIABLE:Lkotlin/text/Regex;

    .line 64
    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "(\\d{3,4})p"

    sget-object v2, Lkotlin/text/RegexOption;->IGNORE_CASE:Lkotlin/text/RegexOption;

    invoke-direct {v0, v1, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V

    sput-object v0, Lcom/example/epawg/EpawgParser;->QUALITY:Lkotlin/text/Regex;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final clean(Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p1, "value"    # Ljava/lang/String;

    .line 54
    const/4 v4, 0x4

    const/4 v5, 0x0

    const-string v1, "\\/"

    const-string v2, "/"

    const/4 v3, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v10, 0x4

    const/4 v11, 0x0

    const-string v7, "\\u0026"

    const-string v8, "&"

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 53
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/jsoup/parser/Parser;->unescapeEntities(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 55
    return-object v0
.end method

.method private final isPlayable(Ljava/lang/String;)Z
    .registers 11
    .param p1, "url"    # Ljava/lang/String;

    .line 57
    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v1, p0

    check-cast v1, Lcom/example/epawg/EpawgParser;

    .local v1, "$this$isPlayable_u24lambda_u240":Lcom/example/epawg/EpawgParser;
    const/4 v2, 0x0

    .line 58
    .local v2, "$i$a$-runCatching-EpawgParser$isPlayable$1":I
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 59
    .local v3, "uri":Ljava/net/URI;
    const-string v4, "https"

    const-string v5, "http"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_62

    invoke-virtual {v3}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    const/4 v5, 0x1

    if-eqz v4, :cond_34

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-nez v4, :cond_32

    goto :goto_34

    :cond_32
    const/4 v4, 0x0

    goto :goto_35

    :cond_34
    :goto_34
    const/4 v4, 0x1

    :goto_35
    if-nez v4, :cond_62

    .line 60
    invoke-virtual {v3}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    const-string v6, "/get_file/"

    check-cast v6, Ljava/lang/CharSequence;

    const/4 v7, 0x0

    const/4 v8, 0x2

    invoke-static {v4, v6, v0, v8, v7}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_63

    invoke-virtual {v3}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    const-string v6, ".mp4"

    invoke-static {v4, v6, v0, v8, v7}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_63

    invoke-virtual {v3}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    const-string v6, ".m3u8"

    invoke-static {v4, v6, v0, v8, v7}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_62

    goto :goto_63

    :cond_62
    const/4 v5, 0x0

    .end local v1    # "$this$isPlayable_u24lambda_u240":Lcom/example/epawg/EpawgParser;
    .end local v2    # "$i$a$-runCatching-EpawgParser$isPlayable$1":I
    .end local v3    # "uri":Ljava/net/URI;
    :cond_63
    :goto_63
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 57
    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_6b
    .catchall {:try_start_1 .. :try_end_6b} :catchall_6c

    goto :goto_77

    :catchall_6c
    move-exception v1

    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 61
    :goto_77
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_82

    move-object v1, v0

    :cond_82
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private static final streams$lambda$0(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "it"    # Lorg/jsoup/nodes/Element;

    .line 30
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method


# virtual methods
.method public final cards(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 28
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
            "Lcom/example/epawg/EpawgParser$Card;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-static/range {p1 .. p1}, Lcom/streambundle/SearchGuard;->clean(Ljava/lang/Object;)V

    .line 12
    const-string v0, ".list-videos .item"

    move-object/from16 v1, p1

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 67
    .local v3, "$i$f$mapNotNull":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/Collection;

    .local v0, "destination$iv$iv":Ljava/util/Collection;
    move-object v4, v2

    .local v4, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    move-object v5, v0

    .end local v0    # "destination$iv$iv":Ljava/util/Collection;
    .local v5, "destination$iv$iv":Ljava/util/Collection;
    const/4 v6, 0x0

    .line 76
    .local v6, "$i$f$mapNotNullTo":I
    move-object v7, v4

    .local v7, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 77
    .local v8, "$i$f$forEach":I
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1f
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_128

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .local v10, "element$iv$iv$iv":Ljava/lang/Object;
    move-object v11, v10

    .local v11, "element$iv$iv":Ljava/lang/Object;
    const/4 v12, 0x0

    .line 76
    .local v12, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object v13, v11

    check-cast v13, Lorg/jsoup/nodes/Element;

    .local v13, "card":Lorg/jsoup/nodes/Element;
    const/4 v14, 0x0

    .line 13
    .local v14, "$i$a$-mapNotNull-EpawgParser$cards$1":I
    const-string v0, "a[href]"

    invoke-virtual {v13, v0}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-nez v0, :cond_42

    move-object/from16 v16, v2

    move/from16 v18, v3

    move-object/from16 v19, v4

    move/from16 v20, v6

    const/4 v15, 0x0

    goto/16 :goto_115

    :cond_42
    move-object/from16 v16, v0

    .line 14
    .local v16, "anchor":Lorg/jsoup/nodes/Element;
    const-string v0, "href"

    move-object/from16 v15, v16

    .end local v16    # "anchor":Lorg/jsoup/nodes/Element;
    .local v15, "anchor":Lorg/jsoup/nodes/Element;
    invoke-virtual {v15, v0}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 16
    .local v1, "url":Ljava/lang/String;
    sget-object v0, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    :try_start_4e
    sget-object v16, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 78
    .local v0, "$this$cards_u24lambda_u240_u240":Lcom/example/epawg/EpawgParser;
    const/16 v16, 0x0

    .line 16
    .local v16, "$i$a$-runCatching-EpawgParser$cards$1$path$1":I
    move-object/from16 v18, v0

    .end local v0    # "$this$cards_u24lambda_u240_u240":Lcom/example/epawg/EpawgParser;
    .local v18, "$this$cards_u24lambda_u240_u240":Lcom/example/epawg/EpawgParser;
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    .end local v16    # "$i$a$-runCatching-EpawgParser$cards$1$path$1":I
    .end local v18    # "$this$cards_u24lambda_u240_u240":Lcom/example/epawg/EpawgParser;
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_61
    .catchall {:try_start_4e .. :try_end_61} :catchall_62

    goto :goto_6d

    :catchall_62
    move-exception v0

    sget-object v16, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_6d
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_74

    const/4 v0, 0x0

    :cond_74
    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_7a

    const-string v0, ""

    .line 17
    .local v0, "path":Ljava/lang/String;
    :cond_7a
    move-object/from16 v16, v2

    .end local v2    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v16, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    move/from16 v18, v3

    .end local v3    # "$i$f$mapNotNull":I
    .local v18, "$i$f$mapNotNull":I
    const/4 v3, 0x2

    move-object/from16 v19, v4

    .end local v4    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .local v19, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const-string v4, "/videos/"

    move/from16 v20, v6

    const/4 v6, 0x0

    .end local v6    # "$i$f$mapNotNullTo":I
    .local v20, "$i$f$mapNotNullTo":I
    invoke-static {v0, v4, v2, v3, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_90

    move-object v15, v6

    goto/16 :goto_115

    .line 18
    :cond_90
    nop

    .line 19
    nop

    .line 18
    const-string v2, ".title"

    invoke-virtual {v13, v2}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    if-eqz v2, :cond_112

    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_112

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 19
    if-eqz v2, :cond_10f

    .line 18
    nop

    .line 19
    move-object v3, v2

    .line 78
    .local v3, "p0":Ljava/lang/String;
    const/4 v4, 0x0

    .line 19
    .local v4, "$i$a$-takeIf-EpawgParser$cards$1$title$1":I
    move-object/from16 v17, v3

    check-cast v17, Ljava/lang/CharSequence;

    invoke-static/range {v17 .. v17}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v17

    .end local v3    # "p0":Ljava/lang/String;
    .end local v4    # "$i$a$-takeIf-EpawgParser$cards$1$title$1":I
    if-nez v17, :cond_ba

    goto :goto_bb

    :cond_ba
    move-object v2, v6

    .line 18
    :goto_bb
    if-eqz v2, :cond_112

    .line 20
    .local v2, "title":Ljava/lang/String;
    const-string v3, "img"

    invoke-virtual {v13, v3}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    .line 21
    .local v3, "img":Lorg/jsoup/nodes/Element;
    const-string v4, "data-original"

    const-string v6, "src"

    move-object/from16 v21, v0

    .end local v0    # "path":Ljava/lang/String;
    .local v21, "path":Ljava/lang/String;
    const-string v0, "data-src"

    filled-new-array {v0, v4, v6}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 22
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_104

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 78
    .local v4, "attr":Ljava/lang/String;
    const/4 v6, 0x0

    .line 22
    .local v6, "$i$a$-firstNotNullOfOrNull-EpawgParser$cards$1$poster$1":I
    if-eqz v3, :cond_fd

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    if-eqz v22, :cond_fd

    move-object/from16 v23, v22

    .line 78
    .local v23, "p0":Ljava/lang/String;
    const/16 v24, 0x0

    .line 22
    .local v24, "$i$a$-takeIf-EpawgParser$cards$1$poster$1$1":I
    move-object/from16 v25, v23

    check-cast v25, Ljava/lang/CharSequence;

    invoke-static/range {v25 .. v25}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v25

    .end local v23    # "p0":Ljava/lang/String;
    .end local v24    # "$i$a$-takeIf-EpawgParser$cards$1$poster$1$1":I
    if-nez v25, :cond_fd

    goto :goto_ff

    :cond_fd
    const/16 v22, 0x0

    .end local v4    # "attr":Ljava/lang/String;
    .end local v6    # "$i$a$-firstNotNullOfOrNull-EpawgParser$cards$1$poster$1":I
    :goto_ff
    if-eqz v22, :cond_d9

    move-object/from16 v17, v22

    goto :goto_106

    :cond_104
    const/16 v17, 0x0

    .line 21
    :goto_106
    move-object/from16 v0, v17

    .line 23
    .local v0, "poster":Ljava/lang/String;
    new-instance v4, Lcom/example/epawg/EpawgParser$Card;

    invoke-direct {v4, v2, v1, v0}, Lcom/example/epawg/EpawgParser$Card;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v15, v4

    goto :goto_115

    .line 19
    .end local v2    # "title":Ljava/lang/String;
    .end local v3    # "img":Lorg/jsoup/nodes/Element;
    .end local v21    # "path":Ljava/lang/String;
    .local v0, "path":Ljava/lang/String;
    :cond_10f
    move-object/from16 v21, v0

    .end local v0    # "path":Ljava/lang/String;
    .restart local v21    # "path":Ljava/lang/String;
    goto :goto_114

    .line 18
    .end local v21    # "path":Ljava/lang/String;
    .restart local v0    # "path":Ljava/lang/String;
    :cond_112
    move-object/from16 v21, v0

    .line 19
    .end local v0    # "path":Ljava/lang/String;
    .restart local v21    # "path":Ljava/lang/String;
    :goto_114
    const/4 v15, 0x0

    .line 76
    .end local v1    # "url":Ljava/lang/String;
    .end local v13    # "card":Lorg/jsoup/nodes/Element;
    .end local v14    # "$i$a$-mapNotNull-EpawgParser$cards$1":I
    .end local v15    # "anchor":Lorg/jsoup/nodes/Element;
    .end local v21    # "path":Ljava/lang/String;
    :goto_115
    if-eqz v15, :cond_11c

    move-object v0, v15

    .line 79
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 76
    .local v1, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v5, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 77
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v1    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v11    # "element$iv$iv":Ljava/lang/Object;
    .end local v12    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_11c
    move-object/from16 v1, p1

    move-object/from16 v2, v16

    move/from16 v3, v18

    move-object/from16 v4, v19

    move/from16 v6, v20

    .end local v10    # "element$iv$iv$iv":Ljava/lang/Object;
    goto/16 :goto_1f

    .line 80
    .end local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v18    # "$i$f$mapNotNull":I
    .end local v19    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v20    # "$i$f$mapNotNullTo":I
    .local v2, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v3, "$i$f$mapNotNull":I
    .local v4, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .local v6, "$i$f$mapNotNullTo":I
    :cond_128
    move-object/from16 v16, v2

    move/from16 v18, v3

    move-object/from16 v19, v4

    move/from16 v20, v6

    .line 81
    .end local v2    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$mapNotNull":I
    .end local v4    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$mapNotNullTo":I
    .end local v7    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$forEach":I
    .restart local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v18    # "$i$f$mapNotNull":I
    .restart local v19    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v20    # "$i$f$mapNotNullTo":I
    nop

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v19    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v20    # "$i$f$mapNotNullTo":I
    move-object v0, v5

    check-cast v0, Ljava/util/List;

    .line 67
    nop

    .end local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v18    # "$i$f$mapNotNull":I
    check-cast v0, Ljava/lang/Iterable;

    .line 24
    nop

    .local v0, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 82
    .local v1, "$i$f$distinctBy":I
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 83
    .local v2, "set$iv":Ljava/util/HashSet;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v3, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_147
    :goto_147
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_164

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 85
    .local v5, "e$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Lcom/example/epawg/EpawgParser$Card;

    .local v6, "it":Lcom/example/epawg/EpawgParser$Card;
    const/4 v7, 0x0

    .line 24
    .local v7, "$i$a$-distinctBy-EpawgParser$cards$2":I
    invoke-virtual {v6}, Lcom/example/epawg/EpawgParser$Card;->getUrl()Ljava/lang/String;

    move-result-object v6

    .line 85
    .end local v6    # "it":Lcom/example/epawg/EpawgParser$Card;
    .end local v7    # "$i$a$-distinctBy-EpawgParser$cards$2":I
    nop

    .line 86
    .local v6, "key$iv":Ljava/lang/Object;
    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_147

    .line 87
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_147

    .line 89
    .end local v5    # "e$iv":Ljava/lang/Object;
    .end local v6    # "key$iv":Ljava/lang/Object;
    :cond_164
    move-object v0, v3

    check-cast v0, Ljava/util/List;

    .line 24
    .end local v0    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$distinctBy":I
    .end local v2    # "set$iv":Ljava/util/HashSet;
    .end local v3    # "list$iv":Ljava/util/ArrayList;
    return-object v0
.end method

.method public final hasNext(Lorg/jsoup/nodes/Document;)Z
    .registers 3
    .param p1, "document"    # Lorg/jsoup/nodes/Document;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 27
    const-string v0, ".pagination .next a[href]"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public final streams(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 20
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
            "Lcom/example/epawg/EpawgParser$Stream;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 30
    move-object/from16 v0, p1

    const-string v1, "script"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/lang/Iterable;

    const-string v1, "\n"

    move-object v3, v1

    check-cast v3, Ljava/lang/CharSequence;

    new-instance v8, Lcom/example/epawg/EpawgParser$$ExternalSyntheticLambda0;

    invoke-direct {v8}, Lcom/example/epawg/EpawgParser$$ExternalSyntheticLambda0;-><init>()V

    const/16 v9, 0x1e

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v2 .. v10}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 31
    .local v1, "scripts":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/List;

    .line 32
    .local v2, "result":Ljava/util/List;
    sget-object v3, Lcom/example/epawg/EpawgParser;->VARIABLE:Lkotlin/text/Regex;

    move-object v4, v1

    check-cast v4, Ljava/lang/CharSequence;

    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-static {v3, v4, v5, v6, v7}, Lkotlin/text/Regex;->findAll$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v3

    .local v3, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    const/4 v4, 0x0

    .line 90
    .local v4, "$i$f$forEach":I
    invoke-interface {v3}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_37
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    const-string v11, "Auto"

    const/4 v12, 0x1

    if-eqz v9, :cond_13a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .local v9, "element$iv":Ljava/lang/Object;
    move-object v13, v9

    check-cast v13, Lkotlin/text/MatchResult;

    .local v13, "match":Lkotlin/text/MatchResult;
    const/4 v14, 0x0

    .line 33
    .local v14, "$i$a$-forEach-EpawgParser$streams$1":I
    invoke-interface {v13}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 34
    .local v15, "key":Ljava/lang/String;
    sget-object v10, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    invoke-interface {v13}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v12

    const/4 v5, 0x3

    invoke-interface {v12, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v10, v5}, Lcom/example/epawg/EpawgParser;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 36
    .local v5, "url":Ljava/lang/String;
    nop

    .line 35
    new-instance v10, Lkotlin/text/Regex;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\\b"

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v12, "_text\\s*:\\s*([\'\"])(.*?)\\1"

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v10, v6}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 36
    move-object v6, v1

    check-cast v6, Ljava/lang/CharSequence;

    move-object/from16 v16, v1

    const/4 v1, 0x2

    const/4 v12, 0x0

    .end local v1    # "scripts":Ljava/lang/String;
    .local v16, "scripts":Ljava/lang/String;
    invoke-static {v10, v6, v12, v1, v7}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_9e

    .line 35
    nop

    .line 36
    invoke-interface {v6}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_9e

    .line 35
    nop

    .line 36
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    goto :goto_9f

    :cond_9e
    move-object v6, v7

    :goto_9f
    if-nez v6, :cond_a3

    const-string v6, ""

    .line 35
    :cond_a3
    move-object v1, v6

    .line 37
    .local v1, "text":Ljava/lang/String;
    sget-object v6, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    invoke-direct {v6, v5}, Lcom/example/epawg/EpawgParser;->isPlayable(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_12f

    .line 38
    sget-object v6, Lcom/example/epawg/EpawgParser;->QUALITY:Lkotlin/text/Regex;

    move-object v10, v1

    check-cast v10, Ljava/lang/CharSequence;

    move-object/from16 v17, v3

    const/4 v3, 0x2

    const/4 v12, 0x0

    .end local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .local v17, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    invoke-static {v6, v10, v12, v3, v7}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_d6

    invoke-interface {v6}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_d6

    const/4 v6, 0x1

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_d6

    invoke-static {v3}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_d6

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move v12, v3

    goto :goto_100

    .line 39
    :cond_d6
    sget-object v3, Lcom/example/epawg/EpawgParser;->QUALITY:Lkotlin/text/Regex;

    move-object v6, v5

    check-cast v6, Ljava/lang/CharSequence;

    const/4 v10, 0x0

    const/4 v12, 0x2

    invoke-static {v3, v6, v10, v12, v7}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v3

    if-eqz v3, :cond_f7

    invoke-interface {v3}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_f7

    const/4 v6, 0x1

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_f7

    invoke-static {v3}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_f8

    :cond_f7
    move-object v3, v7

    .line 38
    :goto_f8
    if-eqz v3, :cond_ff

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v12

    goto :goto_100

    .line 39
    :cond_ff
    const/4 v12, 0x0

    .line 38
    :goto_100
    move v3, v12

    .line 40
    .local v3, "quality":I
    move-object v6, v2

    check-cast v6, Ljava/util/Collection;

    move-object v10, v1

    check-cast v10, Ljava/lang/CharSequence;

    invoke-static {v10}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_124

    .line 78
    const/4 v10, 0x0

    .line 40
    .local v10, "$i$a$-ifBlank-EpawgParser$streams$1$1":I
    if-lez v3, :cond_123

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x70

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .end local v10    # "$i$a$-ifBlank-EpawgParser$streams$1$1":I
    :cond_123
    move-object v10, v11

    :cond_124
    check-cast v10, Ljava/lang/String;

    new-instance v11, Lcom/example/epawg/EpawgParser$Stream;

    invoke-direct {v11, v5, v3, v10}, Lcom/example/epawg/EpawgParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {v6, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_131

    .line 37
    .end local v17    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .local v3, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    :cond_12f
    move-object/from16 v17, v3

    .line 42
    .end local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .restart local v17    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    :goto_131
    nop

    .line 90
    .end local v1    # "text":Ljava/lang/String;
    .end local v5    # "url":Ljava/lang/String;
    .end local v13    # "match":Lkotlin/text/MatchResult;
    .end local v14    # "$i$a$-forEach-EpawgParser$streams$1":I
    .end local v15    # "key":Ljava/lang/String;
    move-object/from16 v1, v16

    move-object/from16 v3, v17

    const/4 v5, 0x0

    const/4 v6, 0x2

    .end local v9    # "element$iv":Ljava/lang/Object;
    goto/16 :goto_37

    .line 91
    .end local v16    # "scripts":Ljava/lang/String;
    .end local v17    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .local v1, "scripts":Ljava/lang/String;
    .restart local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    :cond_13a
    move-object/from16 v16, v1

    move-object/from16 v17, v3

    .line 43
    .end local v1    # "scripts":Ljava/lang/String;
    .end local v3    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .end local v4    # "$i$f$forEach":I
    .restart local v16    # "scripts":Ljava/lang/String;
    const-string v1, "video[src], video source[src]"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 92
    .local v3, "$i$f$forEach":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_14b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1c1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Lorg/jsoup/nodes/Element;

    .local v6, "source":Lorg/jsoup/nodes/Element;
    const/4 v8, 0x0

    .line 44
    .local v8, "$i$a$-forEach-EpawgParser$streams$2":I
    sget-object v9, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    const-string v10, "src"

    invoke-virtual {v6, v10}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/example/epawg/EpawgParser;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 45
    .local v9, "url":Ljava/lang/String;
    sget-object v10, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    invoke-direct {v10, v9}, Lcom/example/epawg/EpawgParser;->isPlayable(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1bb

    .line 46
    sget-object v10, Lcom/example/epawg/EpawgParser;->QUALITY:Lkotlin/text/Regex;

    move-object v12, v9

    check-cast v12, Ljava/lang/CharSequence;

    const/4 v13, 0x0

    const/4 v14, 0x2

    invoke-static {v10, v12, v13, v14, v7}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v10

    if-eqz v10, :cond_194

    invoke-interface {v10}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v10

    if-eqz v10, :cond_194

    const/4 v12, 0x1

    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    if-eqz v10, :cond_195

    invoke-static {v10}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    if-eqz v10, :cond_195

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    goto :goto_196

    :cond_194
    const/4 v12, 0x1

    :cond_195
    const/4 v10, 0x0

    .line 47
    .local v10, "quality":I
    :goto_196
    move-object v15, v2

    check-cast v15, Ljava/util/Collection;

    new-instance v7, Lcom/example/epawg/EpawgParser$Stream;

    if-lez v10, :cond_1b1

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x70

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_1b4

    :cond_1b1
    const/16 v13, 0x70

    move-object v12, v11

    :goto_1b4
    invoke-direct {v7, v9, v10, v12}, Lcom/example/epawg/EpawgParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {v15, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1be

    .line 45
    .end local v10    # "quality":I
    :cond_1bb
    const/16 v13, 0x70

    const/4 v14, 0x2

    .line 49
    :goto_1be
    nop

    .line 92
    .end local v6    # "source":Lorg/jsoup/nodes/Element;
    .end local v8    # "$i$a$-forEach-EpawgParser$streams$2":I
    .end local v9    # "url":Ljava/lang/String;
    const/4 v7, 0x0

    .end local v5    # "element$iv":Ljava/lang/Object;
    goto :goto_14b

    .line 93
    :cond_1c1
    nop

    .line 50
    .end local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$forEach":I
    move-object v1, v2

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 94
    .local v3, "$i$f$distinctBy":I
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 95
    .local v4, "set$iv":Ljava/util/HashSet;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v5, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1d4
    :goto_1d4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1f1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 97
    .local v7, "e$iv":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Lcom/example/epawg/EpawgParser$Stream;

    .local v8, "it":Lcom/example/epawg/EpawgParser$Stream;
    const/4 v9, 0x0

    .line 50
    .local v9, "$i$a$-distinctBy-EpawgParser$streams$3":I
    invoke-virtual {v8}, Lcom/example/epawg/EpawgParser$Stream;->getUrl()Ljava/lang/String;

    move-result-object v8

    .line 97
    .end local v8    # "it":Lcom/example/epawg/EpawgParser$Stream;
    .end local v9    # "$i$a$-distinctBy-EpawgParser$streams$3":I
    nop

    .line 98
    .local v8, "key$iv":Ljava/lang/Object;
    invoke-virtual {v4, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1d4

    .line 99
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d4

    .line 101
    .end local v7    # "e$iv":Ljava/lang/Object;
    .end local v8    # "key$iv":Ljava/lang/Object;
    :cond_1f1
    move-object v1, v5

    check-cast v1, Ljava/util/List;

    .end local v1    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$distinctBy":I
    .end local v4    # "set$iv":Ljava/util/HashSet;
    .end local v5    # "list$iv":Ljava/util/ArrayList;
    check-cast v1, Ljava/lang/Iterable;

    .line 50
    nop

    .local v1, "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 102
    .local v3, "$i$f$sortedByDescending":I
    new-instance v4, Lcom/example/epawg/EpawgParser$streams$$inlined$sortedByDescending$1;

    invoke-direct {v4}, Lcom/example/epawg/EpawgParser$streams$$inlined$sortedByDescending$1;-><init>()V

    check-cast v4, Ljava/util/Comparator;

    invoke-static {v1, v4}, Lkotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    .line 50
    .end local v1    # "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$sortedByDescending":I
    return-object v1
.end method
