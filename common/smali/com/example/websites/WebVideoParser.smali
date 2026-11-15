.class public final Lcom/example/websites/WebVideoParser;
.super Ljava/lang/Object;
.source "WebVideoParser.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/websites/WebVideoParser$Card;,
        Lcom/example/websites/WebVideoParser$Clip;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nWebVideoParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 WebVideoParser.kt\ncom/example/websites/WebVideoParser\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,39:1\n1642#2,10:40\n1915#2:50\n1916#2:53\n1652#2:54\n1696#2,8:55\n1642#2,10:63\n1915#2:73\n1916#2:75\n1652#2:76\n1696#2,8:77\n1#3:51\n1#3:52\n1#3:74\n*S KotlinDebug\n*F\n+ 1 WebVideoParser.kt\ncom/example/websites/WebVideoParser\n*L\n13#1:40,10\n13#1:50\n13#1:53\n13#1:54\n28#1:55,8\n33#1:63,10\n33#1:73\n33#1:75\n33#1:76\n37#1:77,8\n13#1:52\n33#1:74\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001:\u0002\u0010\u0011B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J,\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\nJ\u0010\u0010\r\u001a\u0004\u0018\u00010\n2\u0006\u0010\u0007\u001a\u00020\u0008J\u0014\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u00052\u0006\u0010\u0007\u001a\u00020\u0008\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/example/websites/WebVideoParser;",
        "",
        "<init>",
        "()V",
        "cards",
        "",
        "Lcom/example/websites/WebVideoParser$Card;",
        "document",
        "Lorg/jsoup/nodes/Document;",
        "root",
        "",
        "link",
        "titleSelector",
        "next",
        "albumClips",
        "Lcom/example/websites/WebVideoParser$Clip;",
        "Card",
        "Clip",
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
        "SMAP\nWebVideoParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 WebVideoParser.kt\ncom/example/websites/WebVideoParser\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,39:1\n1642#2,10:40\n1915#2:50\n1916#2:53\n1652#2:54\n1696#2,8:55\n1642#2,10:63\n1915#2:73\n1916#2:75\n1652#2:76\n1696#2,8:77\n1#3:51\n1#3:52\n1#3:74\n*S KotlinDebug\n*F\n+ 1 WebVideoParser.kt\ncom/example/websites/WebVideoParser\n*L\n13#1:40,10\n13#1:50\n13#1:53\n13#1:54\n28#1:55,8\n33#1:63,10\n33#1:73\n33#1:75\n33#1:76\n37#1:77,8\n13#1:52\n33#1:74\n*E\n"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/example/websites/WebVideoParser;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/example/websites/WebVideoParser;

    invoke-direct {v0}, Lcom/example/websites/WebVideoParser;-><init>()V

    sput-object v0, Lcom/example/websites/WebVideoParser;->INSTANCE:Lcom/example/websites/WebVideoParser;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final albumClips(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 21
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
            "Lcom/example/websites/WebVideoParser$Clip;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 33
    const-string v0, ".media-group"

    move-object/from16 v1, p1

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 63
    .local v2, "$i$f$mapNotNull":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    check-cast v3, Ljava/util/Collection;

    .local v3, "destination$iv$iv":Ljava/util/Collection;
    move-object v4, v0

    .local v4, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 72
    .local v5, "$i$f$mapNotNullTo":I
    move-object v6, v4

    .local v6, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 73
    .local v7, "$i$f$forEach":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_79

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .local v9, "element$iv$iv$iv":Ljava/lang/Object;
    move-object v10, v9

    .local v10, "element$iv$iv":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 72
    .local v11, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object v12, v10

    check-cast v12, Lorg/jsoup/nodes/Element;

    .local v12, "group":Lorg/jsoup/nodes/Element;
    const/4 v13, 0x0

    .line 34
    .local v13, "$i$a$-mapNotNull-WebVideoParser$albumClips$1":I
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v14

    invoke-static/range {v14 .. v14}, Lcom/streambundle/Unified;->document(Ljava/lang/Object;)V

    .line 35
    .local v14, "part":Lorg/jsoup/nodes/Document;
    sget-object v15, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-virtual {v15, v14}, Lcom/example/tubesafari/TubeSafariParser;->playerSources(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v15

    .line 36
    .local v15, "sources":Ljava/util/List;
    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v16

    const/16 v17, 0x0

    if-eqz v16, :cond_4c

    move-object/from16 v16, v0

    move/from16 v18, v2

    goto :goto_6a

    :cond_4c
    move-object/from16 v16, v0

    .end local v0    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v16, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    new-instance v0, Lcom/example/websites/WebVideoParser$Clip;

    const-string v1, "video[poster]"

    invoke-virtual {v12, v1}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_61

    move/from16 v18, v2

    .end local v2    # "$i$f$mapNotNull":I
    .local v18, "$i$f$mapNotNull":I
    const-string v2, "poster"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    goto :goto_63

    .end local v18    # "$i$f$mapNotNull":I
    .restart local v2    # "$i$f$mapNotNull":I
    :cond_61
    move/from16 v18, v2

    .end local v2    # "$i$f$mapNotNull":I
    .restart local v18    # "$i$f$mapNotNull":I
    :goto_63
    move-object/from16 v1, v17

    invoke-direct {v0, v1, v15}, Lcom/example/websites/WebVideoParser$Clip;-><init>(Ljava/lang/String;Ljava/util/List;)V

    move-object/from16 v17, v0

    .line 72
    .end local v12    # "group":Lorg/jsoup/nodes/Element;
    .end local v13    # "$i$a$-mapNotNull-WebVideoParser$albumClips$1":I
    .end local v14    # "part":Lorg/jsoup/nodes/Document;
    .end local v15    # "sources":Ljava/util/List;
    :goto_6a
    if-eqz v17, :cond_72

    move-object/from16 v0, v17

    .line 74
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 72
    .local v1, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 73
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v1    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v10    # "element$iv$iv":Ljava/lang/Object;
    .end local v11    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_72
    move-object/from16 v1, p1

    move-object/from16 v0, v16

    move/from16 v2, v18

    .end local v9    # "element$iv$iv$iv":Ljava/lang/Object;
    goto :goto_1a

    .line 75
    .end local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v18    # "$i$f$mapNotNull":I
    .local v0, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v2    # "$i$f$mapNotNull":I
    :cond_79
    move-object/from16 v16, v0

    move/from16 v18, v2

    .line 76
    .end local v0    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$mapNotNull":I
    .end local v6    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$forEach":I
    .restart local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v18    # "$i$f$mapNotNull":I
    nop

    .end local v3    # "destination$iv$iv":Ljava/util/Collection;
    .end local v4    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$mapNotNullTo":I
    move-object v0, v3

    check-cast v0, Ljava/util/List;

    .line 63
    nop

    .end local v16    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v18    # "$i$f$mapNotNull":I
    check-cast v0, Ljava/lang/Iterable;

    .line 37
    nop

    .local v0, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 77
    .local v1, "$i$f$distinctBy":I
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 78
    .local v2, "set$iv":Ljava/util/HashSet;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v3, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_94
    :goto_94
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_bb

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 80
    .local v5, "e$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Lcom/example/websites/WebVideoParser$Clip;

    .local v6, "it":Lcom/example/websites/WebVideoParser$Clip;
    const/4 v7, 0x0

    .line 37
    .local v7, "$i$a$-distinctBy-WebVideoParser$albumClips$2":I
    invoke-virtual {v6}, Lcom/example/websites/WebVideoParser$Clip;->getSources()Ljava/util/List;

    move-result-object v8

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/example/tubesafari/TubeSafariParser$Stream;

    invoke-virtual {v8}, Lcom/example/tubesafari/TubeSafariParser$Stream;->getUrl()Ljava/lang/String;

    move-result-object v6

    .line 80
    .end local v6    # "it":Lcom/example/websites/WebVideoParser$Clip;
    .end local v7    # "$i$a$-distinctBy-WebVideoParser$albumClips$2":I
    nop

    .line 81
    .local v6, "key$iv":Ljava/lang/Object;
    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_94

    .line 82
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_94

    .line 84
    .end local v5    # "e$iv":Ljava/lang/Object;
    .end local v6    # "key$iv":Ljava/lang/Object;
    :cond_bb
    move-object v0, v3

    check-cast v0, Ljava/util/List;

    .line 37
    .end local v0    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$distinctBy":I
    .end local v2    # "set$iv":Ljava/util/HashSet;
    .end local v3    # "list$iv":Ljava/util/ArrayList;
    return-object v0
.end method

.method public final cards(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 37
    .param p1, "document"    # Lorg/jsoup/nodes/Document;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "root"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "link"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4, "titleSelector"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/example/websites/WebVideoParser$Card;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-static/range {p1 .. p1}, Lcom/streambundle/SearchGuard;->clean(Ljava/lang/Object;)V

    invoke-static/range {p1 .. p1}, Lcom/streambundle/v38/SearchAndPosters;->ukCards(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    move-result-object v0
    if-eqz v0, :existing_card_parser
    return-object v0

    :existing_card_parser
    invoke-static/range {p1 .. p1}, Lcom/streambundle/JavSupport;->cards(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_a

    return-object v0

    .line 13
    :cond_a
    invoke-static/range {p1 .. p1}, Lcom/videobundle/fixes/MetadataSupport;->normalize(Lorg/jsoup/nodes/Document;)V

    const-string v1, ""

    invoke-virtual/range {p1 .. p2}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 40
    .local v3, "$i$f$mapNotNull":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v0

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v2

    .local v5, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 49
    .local v6, "$i$f$mapNotNullTo":I
    move-object v7, v5

    .local v7, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 50
    .local v8, "$i$f$forEach":I
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_27
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .local v10, "element$iv$iv$iv":Ljava/lang/Object;
    move-object v11, v10

    .local v11, "element$iv$iv":Ljava/lang/Object;
    const/4 v12, 0x0

    .line 49
    .local v12, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object v13, v11

    check-cast v13, Lorg/jsoup/nodes/Element;

    .local v13, "element":Lorg/jsoup/nodes/Element;
    const/4 v14, 0x0

    .line 14
    .local v14, "$i$a$-mapNotNull-WebVideoParser$cards$1":I
    move-object/from16 v15, p3

    invoke-virtual {v13, v15}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    move-object/from16 v16, v1

    if-nez v0, :cond_4e

    move-object/from16 v17, v2

    move/from16 v19, v3

    move-object/from16 v20, v5

    move/from16 v22, v6

    move-object/from16 v23, v7

    const/4 v1, 0x0

    goto/16 :goto_1c1

    :cond_4e
    move-object/from16 v17, v0

    .line 15
    .local v17, "anchor":Lorg/jsoup/nodes/Element;
    const-string v0, "href"

    move-object/from16 v1, v17

    move-object/from16 v17, v2

    .end local v2    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v1, "anchor":Lorg/jsoup/nodes/Element;
    .local v17, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 16
    .local v2, "url":Ljava/lang/String;
    sget-object v0, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-virtual {v0, v2}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6d

    move/from16 v19, v3

    move-object/from16 v20, v5

    move/from16 v22, v6

    move-object/from16 v23, v7

    const/4 v1, 0x0

    goto/16 :goto_1c1

    .line 17
    :cond_6d
    sget-object v0, Lcom/example/websites/WebVideoParser;->INSTANCE:Lcom/example/websites/WebVideoParser;

    :try_start_6f
    sget-object v19, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 51
    .local v0, "$this$cards_u24lambda_u240_u240":Lcom/example/websites/WebVideoParser;
    const/16 v19, 0x0

    .line 17
    .local v19, "$i$a$-runCatching-WebVideoParser$cards$1$path$1":I
    move-object/from16 v20, v0

    .end local v0    # "$this$cards_u24lambda_u240_u240":Lcom/example/websites/WebVideoParser;
    .local v20, "$this$cards_u24lambda_u240_u240":Lcom/example/websites/WebVideoParser;
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_82

    move-object/from16 v0, v16

    .end local v19    # "$i$a$-runCatching-WebVideoParser$cards$1$path$1":I
    .end local v20    # "$this$cards_u24lambda_u240_u240":Lcom/example/websites/WebVideoParser;
    :cond_82
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_86
    .catchall {:try_start_6f .. :try_end_86} :catchall_87

    goto :goto_92

    :catchall_87
    move-exception v0

    sget-object v19, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_92
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_9a

    move-object/from16 v0, v16

    :cond_9a
    check-cast v0, Ljava/lang/String;

    .line 18
    .local v0, "path":Ljava/lang/String;
    move-object/from16 v19, v0

    check-cast v19, Ljava/lang/CharSequence;

    invoke-static/range {v19 .. v19}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_1b4

    move/from16 v19, v3

    .end local v3    # "$i$f$mapNotNull":I
    .local v19, "$i$f$mapNotNull":I
    move-object v3, v0

    check-cast v3, Ljava/lang/CharSequence;

    const-string v20, "/upload/"

    move-object/from16 v21, v0

    .end local v0    # "path":Ljava/lang/String;
    .local v21, "path":Ljava/lang/String;
    move-object/from16 v0, v20

    check-cast v0, Ljava/lang/CharSequence;

    move-object/from16 v20, v5

    .end local v5    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .local v20, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    move/from16 v22, v6

    .end local v6    # "$i$f$mapNotNullTo":I
    .local v22, "$i$f$mapNotNullTo":I
    const/4 v6, 0x2

    move-object/from16 v23, v7

    const/4 v7, 0x0

    .end local v7    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .local v23, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    invoke-static {v3, v0, v5, v6, v7}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c7

    move-object/from16 v26, v1

    const/4 v1, 0x0

    goto/16 :goto_1c1

    .line 19
    :cond_c7
    const-string v0, "img"

    invoke-virtual {v13, v0}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 20
    .local v0, "image":Lorg/jsoup/nodes/Element;
    move-object/from16 v3, p4

    invoke-virtual {v13, v3}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    if-eqz v7, :cond_f9

    invoke-virtual {v7}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_f9

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {v7}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_f9

    move-object/from16 v24, v7

    .line 51
    .local v24, "p0":Ljava/lang/String;
    const/16 v25, 0x0

    .line 20
    .local v25, "$i$a$-takeIf-WebVideoParser$cards$1$title$1":I
    move-object/from16 v26, v24

    check-cast v26, Ljava/lang/CharSequence;

    invoke-static/range {v26 .. v26}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v26

    .end local v24    # "p0":Ljava/lang/String;
    .end local v25    # "$i$a$-takeIf-WebVideoParser$cards$1$title$1":I
    if-nez v26, :cond_f6

    goto :goto_f7

    :cond_f6
    const/4 v7, 0x0

    :goto_f7
    if-nez v7, :cond_132

    .line 21
    :cond_f9
    const-string v7, "title"

    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v24, v7

    .line 51
    .restart local v24    # "p0":Ljava/lang/String;
    const/16 v25, 0x0

    .line 21
    .local v25, "$i$a$-takeIf-WebVideoParser$cards$1$title$2":I
    move-object/from16 v26, v24

    check-cast v26, Ljava/lang/CharSequence;

    invoke-static/range {v26 .. v26}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v26

    .end local v24    # "p0":Ljava/lang/String;
    .end local v25    # "$i$a$-takeIf-WebVideoParser$cards$1$title$2":I
    if-nez v26, :cond_10e

    goto :goto_10f

    :cond_10e
    const/4 v7, 0x0

    .line 20
    :goto_10f
    if-nez v7, :cond_132

    .line 22
    if-eqz v0, :cond_12c

    const-string v7, "alt"

    invoke-virtual {v0, v7}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_12c

    move-object/from16 v24, v7

    .line 51
    .restart local v24    # "p0":Ljava/lang/String;
    const/16 v25, 0x0

    .line 22
    .local v25, "$i$a$-takeIf-WebVideoParser$cards$1$title$3":I
    move-object/from16 v26, v24

    check-cast v26, Ljava/lang/CharSequence;

    invoke-static/range {v26 .. v26}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v26

    .end local v24    # "p0":Ljava/lang/String;
    .end local v25    # "$i$a$-takeIf-WebVideoParser$cards$1$title$3":I
    if-nez v26, :cond_12a

    goto :goto_12d

    :cond_12a
    const/4 v7, 0x0

    goto :goto_12d

    :cond_12c
    const/4 v7, 0x0

    .line 20
    :goto_12d
    if-nez v7, :cond_132

    .line 22
    const/4 v1, 0x0

    goto/16 :goto_1c1

    .line 23
    .local v7, "title":Ljava/lang/String;
    :cond_132
    const-string v5, "data-original"

    const-string v6, "src"

    move-object/from16 v26, v1

    .end local v1    # "anchor":Lorg/jsoup/nodes/Element;
    .local v26, "anchor":Lorg/jsoup/nodes/Element;
    const-string v1, "data-src"

    filled-new-array {v1, v5, v6}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_148
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_19c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .local v5, "key":Ljava/lang/String;
    const/4 v6, 0x0

    .line 24
    .local v6, "$i$a$-firstNotNullOfOrNull-WebVideoParser$cards$1$poster$1":I
    if-eqz v0, :cond_185

    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    if-eqz v27, :cond_185

    move-object/from16 v28, v27

    .line 51
    .local v28, "it":Ljava/lang/String;
    const/16 v29, 0x0

    .line 24
    .local v29, "$i$a$-takeIf-WebVideoParser$cards$1$poster$1$1":I
    move-object/from16 v30, v0

    .end local v0    # "image":Lorg/jsoup/nodes/Element;
    .local v30, "image":Lorg/jsoup/nodes/Element;
    const-string v0, "https://"

    move-object/from16 v31, v1

    move-object/from16 v18, v5

    move/from16 v24, v6

    move-object/from16 v3, v28

    const/4 v1, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "$i$a$-firstNotNullOfOrNull-WebVideoParser$cards$1$poster$1":I
    .end local v28    # "it":Ljava/lang/String;
    .local v3, "it":Ljava/lang/String;
    .local v18, "key":Ljava/lang/String;
    .local v24, "$i$a$-firstNotNullOfOrNull-WebVideoParser$cards$1$poster$1":I
    invoke-static {v3, v0, v6, v5, v1}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_181

    const-string v0, "http://"

    invoke-static {v3, v0, v6, v5, v1}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17f

    goto :goto_181

    :cond_17f
    const/4 v0, 0x0

    goto :goto_182

    :cond_181
    :goto_181
    const/4 v0, 0x1

    .end local v3    # "it":Ljava/lang/String;
    .end local v29    # "$i$a$-takeIf-WebVideoParser$cards$1$poster$1$1":I
    :goto_182
    if-eqz v0, :cond_190

    goto :goto_192

    .end local v18    # "key":Ljava/lang/String;
    .end local v24    # "$i$a$-firstNotNullOfOrNull-WebVideoParser$cards$1$poster$1":I
    .end local v30    # "image":Lorg/jsoup/nodes/Element;
    .restart local v0    # "image":Lorg/jsoup/nodes/Element;
    .restart local v5    # "key":Ljava/lang/String;
    .restart local v6    # "$i$a$-firstNotNullOfOrNull-WebVideoParser$cards$1$poster$1":I
    :cond_185
    move-object/from16 v30, v0

    move-object/from16 v31, v1

    move-object/from16 v18, v5

    move/from16 v24, v6

    const/4 v1, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    .end local v0    # "image":Lorg/jsoup/nodes/Element;
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "$i$a$-firstNotNullOfOrNull-WebVideoParser$cards$1$poster$1":I
    .restart local v18    # "key":Ljava/lang/String;
    .restart local v24    # "$i$a$-firstNotNullOfOrNull-WebVideoParser$cards$1$poster$1":I
    .restart local v30    # "image":Lorg/jsoup/nodes/Element;
    :cond_190
    move-object/from16 v27, v1

    .line 23
    .end local v18    # "key":Ljava/lang/String;
    .end local v24    # "$i$a$-firstNotNullOfOrNull-WebVideoParser$cards$1$poster$1":I
    :goto_192
    if-eqz v27, :cond_195

    goto :goto_1a1

    :cond_195
    move-object/from16 v3, p4

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    goto :goto_148

    .end local v30    # "image":Lorg/jsoup/nodes/Element;
    .restart local v0    # "image":Lorg/jsoup/nodes/Element;
    :cond_19c
    move-object/from16 v30, v0

    const/4 v1, 0x0

    .end local v0    # "image":Lorg/jsoup/nodes/Element;
    .restart local v30    # "image":Lorg/jsoup/nodes/Element;
    move-object/from16 v27, v1

    :goto_1a1
    move-object/from16 v0, v27

    .line 26
    .local v0, "poster":Ljava/lang/String;
    if-eqz v0, :cond_1ae

    sget-object v3, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-virtual {v3, v0}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1ae

    goto :goto_1c1

    .line 27
    :cond_1ae
    new-instance v1, Lcom/example/websites/WebVideoParser$Card;

    invoke-direct {v1, v7, v2, v0}, Lcom/example/websites/WebVideoParser$Card;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c1

    .line 18
    .end local v19    # "$i$f$mapNotNull":I
    .end local v20    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v21    # "path":Ljava/lang/String;
    .end local v22    # "$i$f$mapNotNullTo":I
    .end local v23    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v26    # "anchor":Lorg/jsoup/nodes/Element;
    .end local v30    # "image":Lorg/jsoup/nodes/Element;
    .local v0, "path":Ljava/lang/String;
    .restart local v1    # "anchor":Lorg/jsoup/nodes/Element;
    .local v3, "$i$f$mapNotNull":I
    .local v5, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .local v6, "$i$f$mapNotNullTo":I
    .local v7, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    :cond_1b4
    move-object/from16 v21, v0

    move-object/from16 v26, v1

    move/from16 v19, v3

    move-object/from16 v20, v5

    move/from16 v22, v6

    move-object/from16 v23, v7

    const/4 v1, 0x0

    .line 49
    .end local v0    # "path":Ljava/lang/String;
    .end local v1    # "anchor":Lorg/jsoup/nodes/Element;
    .end local v2    # "url":Ljava/lang/String;
    .end local v3    # "$i$f$mapNotNull":I
    .end local v5    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$mapNotNullTo":I
    .end local v7    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v13    # "element":Lorg/jsoup/nodes/Element;
    .end local v14    # "$i$a$-mapNotNull-WebVideoParser$cards$1":I
    .restart local v19    # "$i$f$mapNotNull":I
    .restart local v20    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v22    # "$i$f$mapNotNullTo":I
    .restart local v23    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    :goto_1c1
    if-eqz v1, :cond_1c8

    move-object v0, v1

    .line 52
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 49
    .local v1, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v4, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 50
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v1    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v11    # "element$iv$iv":Ljava/lang/Object;
    .end local v12    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_1c8
    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move/from16 v3, v19

    move-object/from16 v5, v20

    move/from16 v6, v22

    move-object/from16 v7, v23

    .end local v10    # "element$iv$iv$iv":Ljava/lang/Object;
    goto/16 :goto_27

    .line 53
    .end local v17    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v19    # "$i$f$mapNotNull":I
    .end local v20    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v22    # "$i$f$mapNotNullTo":I
    .end local v23    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .local v2, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v3    # "$i$f$mapNotNull":I
    .restart local v5    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v6    # "$i$f$mapNotNullTo":I
    .restart local v7    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    :cond_1d6
    move-object/from16 v15, p3

    move-object/from16 v17, v2

    move/from16 v19, v3

    move-object/from16 v20, v5

    move/from16 v22, v6

    move-object/from16 v23, v7

    .line 54
    .end local v2    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$mapNotNull":I
    .end local v5    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$mapNotNullTo":I
    .end local v7    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$forEach":I
    .restart local v17    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v19    # "$i$f$mapNotNull":I
    .restart local v20    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v22    # "$i$f$mapNotNullTo":I
    nop

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v20    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v22    # "$i$f$mapNotNullTo":I
    move-object v0, v4

    check-cast v0, Ljava/util/List;

    .line 40
    nop

    .end local v17    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v19    # "$i$f$mapNotNull":I
    check-cast v0, Ljava/lang/Iterable;

    .line 28
    nop

    .local v0, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 55
    .local v1, "$i$f$distinctBy":I
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 56
    .local v2, "set$iv":Ljava/util/HashSet;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .local v3, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1f9
    :goto_1f9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_216

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 58
    .local v5, "e$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Lcom/example/websites/WebVideoParser$Card;

    .local v6, "it":Lcom/example/websites/WebVideoParser$Card;
    const/4 v7, 0x0

    .line 28
    .local v7, "$i$a$-distinctBy-WebVideoParser$cards$2":I
    invoke-virtual {v6}, Lcom/example/websites/WebVideoParser$Card;->getUrl()Ljava/lang/String;

    move-result-object v6

    .line 58
    .end local v6    # "it":Lcom/example/websites/WebVideoParser$Card;
    .end local v7    # "$i$a$-distinctBy-WebVideoParser$cards$2":I
    nop

    .line 59
    .local v6, "key$iv":Ljava/lang/Object;
    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1f9

    .line 60
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f9

    .line 62
    .end local v5    # "e$iv":Ljava/lang/Object;
    .end local v6    # "key$iv":Ljava/lang/Object;
    :cond_216
    move-object v0, v3

    check-cast v0, Ljava/util/List;

    .line 28
    .end local v0    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$distinctBy":I
    .end local v2    # "set$iv":Ljava/util/HashSet;
    .end local v3    # "list$iv":Ljava/util/ArrayList;
    return-object v0
.end method

.method public final next(Lorg/jsoup/nodes/Document;)Ljava/lang/String;
    .registers 7
    .param p1, "document"    # Lorg/jsoup/nodes/Document;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 31
    nop

    .line 30
    const-string v0, "a[rel=next][href], .pagination .next a[href], a.next[href]"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 31
    const/4 v1, 0x0

    if-eqz v0, :cond_20

    .line 30
    nop

    .line 31
    const-string v2, "href"

    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_20

    .line 30
    nop

    .line 31
    move-object v2, v0

    .line 51
    .local v2, "p0":Ljava/lang/String;
    const/4 v3, 0x0

    .line 31
    .local v3, "$i$a$-takeIf-WebVideoParser$next$1":I
    move-object v4, v2

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v4

    .end local v2    # "p0":Ljava/lang/String;
    .end local v3    # "$i$a$-takeIf-WebVideoParser$next$1":I
    if-nez v4, :cond_20

    move-object v1, v0

    :cond_20
    return-object v1
.end method
