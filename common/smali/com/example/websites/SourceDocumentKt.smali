.class public final Lcom/example/websites/SourceDocumentKt;
.super Ljava/lang/Object;
.source "SourceDocument.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSourceDocument.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SourceDocument.kt\ncom/example/websites/SourceDocumentKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,50:1\n777#2:51\n873#2,2:52\n1696#2,8:54\n296#2,2:62\n*S KotlinDebug\n*F\n+ 1 SourceDocument.kt\ncom/example/websites/SourceDocumentKt\n*L\n22#1:51\n22#1:52,2\n23#1:54,8\n18#1:62,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u000c\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000\u001a>\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0004\"\u0004\u0008\u0000\u0010\u00052\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u00042\u0006\u0010\u0007\u001a\u00020\u00082\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u0002H\u0005\u0012\u0004\u0012\u00020\u00080\nH\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "sourceDocument",
        "Lorg/jsoup/nodes/Document;",
        "Lcom/lagradost/nicehttp/NiceResponse;",
        "relatedResults",
        "",
        "T",
        "items",
        "currentUrl",
        "",
        "urlOf",
        "Lkotlin/Function1;",
        "VideoSources_debug"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
    value = {
        "SMAP\nSourceDocument.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SourceDocument.kt\ncom/example/websites/SourceDocumentKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,50:1\n777#2:51\n873#2,2:52\n1696#2,8:54\n296#2,2:62\n*S KotlinDebug\n*F\n+ 1 SourceDocument.kt\ncom/example/websites/SourceDocumentKt\n*L\n22#1:51\n22#1:52,2\n23#1:54,8\n18#1:62,2\n*E\n"
    }
.end annotation


# direct methods
.method public static final relatedResults(Ljava/util/List;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ljava/util/List;
    .registers 15
    .param p0, "items"    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "currentUrl"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "urlOf"    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 21
    invoke-static {p1}, Lcom/example/websites/SourceDocumentKt;->relatedResults$key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 22
    .local v0, "current":Ljava/lang/String;
    move-object v1, p0

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 51
    .local v2, "$i$f$filter":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    check-cast v3, Ljava/util/Collection;

    .local v3, "destination$iv$iv":Ljava/util/Collection;
    move-object v4, v1

    .local v4, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 52
    .local v5, "$i$f$filterTo":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_15
    :goto_15
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_48

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .local v7, "element$iv$iv":Ljava/lang/Object;
    move-object v8, v7

    .local v8, "it":Ljava/lang/Object;
    const/4 v9, 0x0

    .line 22
    .local v9, "$i$a$-filter-SourceDocumentKt$relatedResults$1":I
    sget-object v10, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-interface {p2, v8}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v10, v11}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_41

    invoke-interface {p2, v8}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Lcom/example/websites/SourceDocumentKt;->relatedResults$key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_41

    const/4 v10, 0x1

    goto :goto_42

    :cond_41
    const/4 v10, 0x0

    .line 52
    .end local v8    # "it":Ljava/lang/Object;
    .end local v9    # "$i$a$-filter-SourceDocumentKt$relatedResults$1":I
    :goto_42
    if-eqz v10, :cond_15

    invoke-interface {v3, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 53
    .end local v7    # "element$iv$iv":Ljava/lang/Object;
    :cond_48
    nop

    .end local v3    # "destination$iv$iv":Ljava/util/Collection;
    .end local v4    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$filterTo":I
    check-cast v3, Ljava/util/List;

    .line 51
    nop

    .end local v1    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$filter":I
    check-cast v3, Ljava/lang/Iterable;

    .line 23
    move-object v1, v3

    .local v1, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 54
    .local v2, "$i$f$distinctBy":I
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 55
    .local v3, "set$iv":Ljava/util/HashSet;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .local v4, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5e
    :goto_5e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7f

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 57
    .local v6, "e$iv":Ljava/lang/Object;
    move-object v7, v6

    .local v7, "it":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 23
    .local v8, "$i$a$-distinctBy-SourceDocumentKt$relatedResults$2":I
    invoke-interface {p2, v7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Lcom/example/websites/SourceDocumentKt;->relatedResults$key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 57
    .end local v7    # "it":Ljava/lang/Object;
    .end local v8    # "$i$a$-distinctBy-SourceDocumentKt$relatedResults$2":I
    nop

    .line 58
    .local v7, "key$iv":Ljava/lang/Object;
    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5e

    .line 59
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5e

    .line 61
    .end local v6    # "e$iv":Ljava/lang/Object;
    .end local v7    # "key$iv":Ljava/lang/Object;
    :cond_7f
    move-object v1, v4

    check-cast v1, Ljava/util/List;

    .end local v1    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$distinctBy":I
    .end local v3    # "set$iv":Ljava/util/HashSet;
    .end local v4    # "list$iv":Ljava/util/ArrayList;
    check-cast v1, Ljava/lang/Iterable;

    .line 23
    const/16 v2, 0x24

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v1

    .line 22
    return-object v1
.end method

.method private static final relatedResults$key(Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p0, "url"    # Ljava/lang/String;

    .line 15
    const/4 v0, 0x2

    const/4 v1, 0x0

    :try_start_2
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    const/4 v2, 0x0

    .line 16
    .local v2, "$i$a$-runCatching-SourceDocumentKt$relatedResults$key$1":I
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 17
    .local v3, "uri":Ljava/net/URI;
    invoke-virtual {v3}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4
    :try_end_e
    .catchall {:try_start_2 .. :try_end_e} :catchall_80

    const-string v5, ""

    if-nez v4, :cond_13

    move-object v4, v5

    :cond_13
    const/4 v6, 0x1

    :try_start_14
    new-array v7, v6, [C

    const/4 v8, 0x0

    const/16 v9, 0x2f

    aput-char v9, v7, v8

    invoke-static {v4, v7}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v4

    .line 18
    .local v4, "path":Ljava/lang/String;
    const-string v7, "/video"

    invoke-static {v4, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_64

    invoke-virtual {v3}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_2e

    move-object v7, v5

    :cond_2e
    move-object v9, v7

    check-cast v9, Ljava/lang/CharSequence;

    new-array v10, v6, [C

    const/16 v6, 0x26

    aput-char v6, v10, v8

    const/4 v13, 0x6

    const/4 v14, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v9 .. v14}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 62
    .local v7, "$i$f$firstOrNull":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_46
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5d

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .local v10, "element$iv":Ljava/lang/Object;
    move-object v11, v10

    check-cast v11, Ljava/lang/String;

    .local v11, "it":Ljava/lang/String;
    const/4 v12, 0x0

    .line 18
    .local v12, "$i$a$-firstOrNull-SourceDocumentKt$relatedResults$key$1$id$1":I
    const-string v13, "id="

    invoke-static {v11, v13, v8, v0, v1}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v13

    .line 62
    .end local v11    # "it":Ljava/lang/String;
    .end local v12    # "$i$a$-firstOrNull-SourceDocumentKt$relatedResults$key$1$id$1":I
    if-eqz v13, :cond_46

    goto :goto_5e

    .line 63
    .end local v10    # "element$iv":Ljava/lang/Object;
    :cond_5d
    move-object v10, v1

    .end local v6    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$firstOrNull":I
    :goto_5e
    check-cast v10, Ljava/lang/String;

    .line 18
    if-nez v10, :cond_63

    goto :goto_64

    :cond_63
    move-object v5, v10

    .line 19
    .local v5, "id":Ljava/lang/String;
    :cond_64
    :goto_64
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x3f

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 15
    .end local v2    # "$i$a$-runCatching-SourceDocumentKt$relatedResults$key$1":I
    .end local v3    # "uri":Ljava/net/URI;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "id":Ljava/lang/String;
    invoke-static {v6}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_7f
    .catchall {:try_start_14 .. :try_end_7f} :catchall_80

    goto :goto_8b

    :catchall_80
    move-exception v2

    sget-object v3, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v2}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 20
    :goto_8b
    const/16 v3, 0x23

    invoke-static {p0, v3, v1, v0, v1}, Lkotlin/text/StringsKt;->substringBefore$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_98

    move-object v2, v0

    :cond_98
    check-cast v2, Ljava/lang/String;

    return-object v2
.end method

.method public static final sourceDocument(Lcom/lagradost/nicehttp/NiceResponse;)Lorg/jsoup/nodes/Document;
    .registers 3
    .param p0, "$this$sourceDocument"    # Lcom/lagradost/nicehttp/NiceResponse;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 12
    invoke-virtual {p0}, Lcom/lagradost/nicehttp/NiceResponse;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lagradost/nicehttp/NiceResponse;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->document(Ljava/lang/Object;)V

    return-object v0
.end method
