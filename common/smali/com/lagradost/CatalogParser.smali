.class public final Lcom/lagradost/CatalogParser;
.super Ljava/lang/Object;
.source "CatalogParser.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCatalogParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CatalogParser.kt\ncom/lagradost/CatalogParser\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Sequences.kt\nkotlin/sequences/SequencesKt___SequencesKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,133:1\n1#2:134\n1#2:150\n184#3,2:135\n1795#4,10:137\n2068#4:147\n296#4,2:148\n2069#4:151\n1805#4:152\n1849#4,8:153\n296#4,2:161\n296#4,2:163\n777#4:165\n873#4,2:166\n1739#4:168\n1814#4,3:169\n777#4:172\n873#4,2:173\n1739#4:175\n1814#4,3:176\n1739#4:179\n1814#4,3:180\n777#4:183\n873#4,2:184\n777#4:186\n873#4,2:187\n777#4:189\n873#4,2:190\n296#4,2:192\n*S KotlinDebug\n*F\n+ 1 CatalogParser.kt\ncom/lagradost/CatalogParser\n*L\n56#1:150\n51#1:135,2\n56#1:137,10\n56#1:147\n64#1:148,2\n56#1:151\n56#1:152\n73#1:153,8\n75#1:161,2\n93#1:163,2\n95#1:165\n95#1:166,2\n98#1:168\n98#1:169,3\n98#1:172\n98#1:173,2\n99#1:175\n99#1:176,3\n100#1:179\n100#1:180,3\n100#1:183\n100#1:184,2\n102#1:186\n102#1:187,2\n104#1:189\n104#1:190,2\n108#1:192,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001a\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0005J\u001a\u0010\u0008\u001a\u0004\u0018\u00010\u00052\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u0005H\u0002J$\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c2\u0006\u0010\u000e\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0006\u001a\u00020\u0005J\u0018\u0010\u0011\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0005J\u001e\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0017\u001a\u00020\u0005J \u0010\u0018\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0019\u001a\u00020\u00052\u0006\u0010\u001a\u001a\u00020\u001b"
    }
    d2 = {
        "Lcom/lagradost/CatalogParser;",
        "",
        "<init>",
        "()V",
        "absolute",
        "",
        "base",
        "value",
        "image",
        "el",
        "Lorg/jsoup/nodes/Element;",
        "cards",
        "",
        "Lcom/lagradost/VideoCard;",
        "root",
        "site",
        "Lcom/lagradost/CatalogSite;",
        "meta",
        "doc",
        "Lorg/jsoup/nodes/Document;",
        "key",
        "details",
        "Lcom/lagradost/VideoDetails;",
        "url",
        "nextPage",
        "current",
        "page",
        ""
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
.field public static final INSTANCE:Lcom/lagradost/CatalogParser;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/CatalogParser;

    invoke-direct {v0}, Lcom/lagradost/CatalogParser;-><init>()V

    sput-object v0, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final image(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p1, "el"    # Lorg/jsoup/nodes/Element;
    .param p2, "base"    # Ljava/lang/String;

    .line 45
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "img"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    move-object v0, p1

    goto :goto_12

    :cond_e
    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 46
    .local v0, "img":Lorg/jsoup/nodes/Element;
    :goto_12
    const/4 v1, 0x1

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-nez v0, :cond_59

    .line 47
    const-string v5, "style"

    invoke-virtual {p1, v5}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_22

    move-object v6, p1

    goto :goto_28

    :cond_22
    const-string v6, "[style*=background-image]"

    invoke-virtual {p1, v6}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    .line 48
    .local v6, "styled":Lorg/jsoup/nodes/Element;
    :goto_28
    new-instance v7, Lkotlin/text/Regex;

    const-string v8, "url\\([\'\"]?([^)\'\"]+)"

    invoke-direct {v7, v8}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    if-eqz v6, :cond_36

    invoke-virtual {v6, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_37

    :cond_36
    move-object v5, v4

    :goto_37
    if-nez v5, :cond_3b

    const-string v5, ""

    :cond_3b
    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v7, v5, v3, v2, v4}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v2

    if-eqz v2, :cond_58

    invoke-interface {v2}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_58

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_58

    .line 134
    .local v1, "it":Ljava/lang/String;
    const/4 v2, 0x0

    .line 48
    .local v2, "$i$a$-let-CatalogParser$image$1":I
    sget-object v3, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-virtual {v3, p2, v1}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .end local v1    # "it":Ljava/lang/String;
    .end local v2    # "$i$a$-let-CatalogParser$image$1":I
    :cond_58
    return-object v4

    .line 50
    .end local v6    # "styled":Lorg/jsoup/nodes/Element;
    :cond_59
    const-string v5, "data-src"

    const-string v6, "data-original"

    const-string v7, "data-lazy-src"

    const-string v8, "src"

    filled-new-array {v5, v6, v7, v8}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lkotlin/sequences/Sequence;

    move-result-object v5

    .line 51
    new-instance v6, Lcom/lagradost/-$$Lambda$CatalogParser$jAFyx8o6qaFaYQNLq2daHhQocVo;

    invoke-direct {v6, p2, v0}, Lcom/lagradost/-$$Lambda$CatalogParser$jAFyx8o6qaFaYQNLq2daHhQocVo;-><init>(Ljava/lang/String;Lorg/jsoup/nodes/Element;)V

    invoke-static {v5, v6}, Lkotlin/sequences/SequencesKt;->mapNotNull(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v5

    .local v5, "$this$firstOrNull$iv":Lkotlin/sequences/Sequence;
    const/4 v6, 0x0

    .line 135
    .local v6, "$i$f$firstOrNull":I
    invoke-interface {v5}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_7d
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_ab

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Ljava/lang/String;

    .local v9, "it":Ljava/lang/String;
    const/4 v10, 0x0

    .line 51
    .local v10, "$i$a$-firstOrNull-CatalogParser$image$3":I
    move-object v11, v9

    check-cast v11, Ljava/lang/CharSequence;

    const-string v12, ".svg"

    check-cast v12, Ljava/lang/CharSequence;

    invoke-static {v11, v12, v3, v2, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a7

    move-object v11, v9

    check-cast v11, Ljava/lang/CharSequence;

    const-string v12, "/blank"

    check-cast v12, Ljava/lang/CharSequence;

    invoke-static {v11, v12, v3, v2, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a7

    move v9, v1

    goto :goto_a8

    :cond_a7
    move v9, v3

    .line 135
    .end local v9    # "it":Ljava/lang/String;
    .end local v10    # "$i$a$-firstOrNull-CatalogParser$image$3":I
    :goto_a8
    if-eqz v9, :cond_7d

    goto :goto_ac

    .line 136
    .end local v8    # "element$iv":Ljava/lang/Object;
    :cond_ab
    move-object v8, v4

    .line 51
    .end local v5    # "$this$firstOrNull$iv":Lkotlin/sequences/Sequence;
    .end local v6    # "$i$f$firstOrNull":I
    :goto_ac
    check-cast v8, Ljava/lang/String;

    .line 50
    if-nez v8, :cond_103

    .line 53
    nop

    .line 52
    const-string v5, "data-srcset"

    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v5}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_c6

    .line 134
    const/4 v5, 0x0

    .line 52
    .local v5, "$i$a$-ifBlank-CatalogParser$image$4":I
    const-string v6, "srcset"

    invoke-virtual {v0, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .end local v5    # "$i$a$-ifBlank-CatalogParser$image$4":I
    :cond_c6
    const-string v6, "ifBlank(...)"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v7, v5

    check-cast v7, Ljava/lang/CharSequence;

    new-array v8, v1, [C

    const/16 v1, 0x2c

    aput-char v1, v8, v3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x6

    const/4 v12, 0x0

    invoke-static/range {v7 .. v12}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->lastOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 53
    if-eqz v1, :cond_104

    .line 52
    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 53
    if-eqz v1, :cond_104

    .line 52
    nop

    .line 53
    const/16 v3, 0x20

    invoke-static {v1, v3, v4, v2, v4}, Lkotlin/text/StringsKt;->substringBefore$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_104

    .line 52
    nop

    .line 53
    nop

    .line 134
    .restart local v1    # "it":Ljava/lang/String;
    const/4 v2, 0x0

    .line 53
    .local v2, "$i$a$-let-CatalogParser$image$5":I
    sget-object v3, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-virtual {v3, p2, v1}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .end local v1    # "it":Ljava/lang/String;
    .end local v2    # "$i$a$-let-CatalogParser$image$5":I
    goto :goto_104

    .line 50
    :cond_103
    move-object v4, v8

    :cond_104
    :goto_104
    return-object v4
.end method

.method private static final image$lambda$1(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "$base"    # Ljava/lang/String;
    .param p1, "$img"    # Lorg/jsoup/nodes/Element;
    .param p2, "it"    # Ljava/lang/String;

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    sget-object v0, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-virtual {p1, p2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic lambda$jAFyx8o6qaFaYQNLq2daHhQocVo(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/lagradost/CatalogParser;->image$lambda$1(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "base"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    const-string v0, "base"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    if-nez p2, :cond_b

    const-string v0, ""

    move-object v1, v0

    goto :goto_c

    :cond_b
    move-object v1, p2

    :goto_c
    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    const-string v2, "\\/"

    const-string v3, "/"

    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/jsoup/parser/Parser;->unescapeEntities(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v2, "unescapeEntities(...)"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "raw":Ljava/lang/String;
    move-object v2, v0

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_8f

    const-string v2, "data:"

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {v0, v2, v4, v5, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8f

    const-string v2, "javascript:"

    invoke-static {v0, v2, v4, v5, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_48

    goto :goto_8f

    .line 41
    :cond_48
    :try_start_48
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v2, p0

    check-cast v2, Lcom/lagradost/CatalogParser;

    .line 134
    .local v2, "$this$absolute_u24lambda_u240":Lcom/lagradost/CatalogParser;
    const/4 v6, 0x0

    .line 41
    .local v6, "$i$a$-runCatching-CatalogParser$absolute$url$1":I
    new-instance v7, Ljava/net/URI;

    invoke-direct {v7, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v7

    .end local v2    # "$this$absolute_u24lambda_u240":Lcom/lagradost/CatalogParser;
    .end local v6    # "$i$a$-runCatching-CatalogParser$absolute$url$1":I
    invoke-static {v7}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_5f
    .catchall {:try_start_48 .. :try_end_5f} :catchall_60

    goto :goto_6b

    :catchall_60
    move-exception v2

    sget-object v6, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v2}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    :goto_6b
    invoke-static {v2}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_72

    move-object v2, v3

    :cond_72
    check-cast v2, Ljava/lang/String;

    if-nez v2, :cond_77

    return-object v3

    .line 42
    .local v2, "url":Ljava/lang/String;
    :cond_77
    move-object v6, v2

    .line 134
    .local v6, "it":Ljava/lang/String;
    const/4 v7, 0x0

    .line 42
    .local v7, "$i$a$-takeIf-CatalogParser$absolute$1":I
    const-string v8, "https://"

    invoke-static {v6, v8, v4, v5, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8b

    const-string v8, "http://"

    invoke-static {v6, v8, v4, v5, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8a

    goto :goto_8b

    :cond_8a
    move v1, v4

    .end local v6    # "it":Ljava/lang/String;
    .end local v7    # "$i$a$-takeIf-CatalogParser$absolute$1":I
    :cond_8b
    :goto_8b
    if-eqz v1, :cond_8e

    move-object v3, v2

    :cond_8e
    return-object v3

    .line 40
    .end local v2    # "url":Ljava/lang/String;
    :cond_8f
    :goto_8f
    return-object v3
.end method

.method public final cards(Lorg/jsoup/nodes/Element;Lcom/lagradost/CatalogSite;Ljava/lang/String;)Ljava/util/List;
    .registers 32
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "site"    # Lcom/lagradost/CatalogSite;
    .param p3, "base"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Element;",
            "Lcom/lagradost/CatalogSite;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/VideoCard;",
            ">;"
        }
    .end annotation

    invoke-static/range {p1 .. p1}, Lcom/streambundle/SearchGuard;->clean(Ljava/lang/Object;)V

    invoke-static/range {p1 .. p3}, Lcom/videobundle/fixes/SiteFix;->cards(Lorg/jsoup/nodes/Element;Lcom/lagradost/CatalogSite;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_a

    return-object v0

    :cond_a
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    const-string v4, "www."

    const-string v0, "root"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "site"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "base"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    const-string v0, "a[href]"

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    const-string v5, "select(...)"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v5, v0

    check-cast v5, Ljava/lang/Iterable;

    .local v5, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 137
    .local v6, "$i$f$mapNotNull":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/Collection;

    .local v0, "destination$iv$iv":Ljava/util/Collection;
    move-object v7, v5

    .local v7, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    move-object v8, v0

    .end local v0    # "destination$iv$iv":Ljava/util/Collection;
    .local v8, "destination$iv$iv":Ljava/util/Collection;
    const/4 v9, 0x0

    .line 146
    .local v9, "$i$f$mapNotNullTo":I
    move-object v10, v7

    .local v10, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v11, 0x0

    .line 147
    .local v11, "$i$f$forEach":I
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_40
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_23c

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .local v15, "element$iv$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v15

    .local v16, "element$iv$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 146
    .local v17, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object/from16 v13, v16

    check-cast v13, Lorg/jsoup/nodes/Element;

    .local v13, "a":Lorg/jsoup/nodes/Element;
    const/16 v19, 0x0

    .line 57
    .local v19, "$i$a$-mapNotNull-CatalogParser$cards$1":I
    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v0

    const/4 v14, 0x4

    const/16 v21, 0x0

    if-ne v0, v14, :cond_69

    const-string v0, "nav, header, footer, [role=navigation]"

    invoke-virtual {v13, v0}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_69

    move-object/from16 v23, v5

    goto/16 :goto_22c

    .line 58
    :cond_69
    sget-object v0, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    const-string v14, "href"

    invoke-virtual {v13, v14}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v3, v14}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7b

    move-object/from16 v23, v5

    goto/16 :goto_22c

    :cond_7b
    move-object v14, v0

    .line 59
    .local v14, "url":Ljava/lang/String;
    sget-object v0, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    :try_start_7e
    sget-object v23, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 134
    .local v0, "$this$cards_u24lambda_u240_u240":Lcom/lagradost/CatalogParser;
    const/16 v23, 0x0

    .line 59
    .local v23, "$i$a$-runCatching-CatalogParser$cards$1$host$1":I
    move-object/from16 v24, v0

    .end local v0    # "$this$cards_u24lambda_u240_u240":Lcom/lagradost/CatalogParser;
    .local v24, "$this$cards_u24lambda_u240_u240":Lcom/lagradost/CatalogParser;
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, v14}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_97

    move-object v1, v4

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v0, v1}, Lkotlin/text/StringsKt;->removePrefix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_99

    :cond_97
    move-object/from16 v0, v21

    .end local v23    # "$i$a$-runCatching-CatalogParser$cards$1$host$1":I
    .end local v24    # "$this$cards_u24lambda_u240_u240":Lcom/lagradost/CatalogParser;
    :goto_99
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_9d
    .catchall {:try_start_7e .. :try_end_9d} :catchall_9e

    goto :goto_a9

    :catchall_9e
    move-exception v0

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_a9
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b1

    move-object/from16 v0, v21

    :cond_b1
    check-cast v0, Ljava/lang/String;

    .line 60
    .local v0, "host":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v1

    move-object/from16 v23, v5

    const/4 v5, 0x4

    .end local v5    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v23, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    if-ne v1, v5, :cond_d1

    const-string v1, "missav.live"

    const-string v5, "missav.ws"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1, v0}, Lkotlin/collections/CollectionsKt;->contains(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f2

    goto :goto_f0

    :cond_d1
    new-instance v1, Ljava/net/URI;

    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getBase()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v5, "getHost(...)"

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v5, v4

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v1, v5}, Lkotlin/text/StringsKt;->removePrefix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f2

    :goto_f0
    const/4 v1, 0x1

    goto :goto_f3

    :cond_f2
    const/4 v1, 0x0

    :goto_f3
    if-nez v1, :cond_22a

    invoke-virtual {v2, v14}, Lcom/lagradost/CatalogSite;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_ff

    move-object/from16 v25, v0

    goto/16 :goto_22c

    .line 61
    :cond_ff
    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v1

    const-string v5, "img"

    const/4 v2, 0x1

    if-eq v1, v2, :cond_18f

    const/4 v2, 0x3

    if-eq v1, v2, :cond_184

    const/4 v2, 0x4

    if-eq v1, v2, :cond_11a

    .line 65
    const-string v1, ".tile"

    invoke-virtual {v13, v1}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    move-object/from16 v25, v0

    if-nez v1, :cond_192

    goto/16 :goto_191

    .line 64
    :cond_11a
    invoke-virtual {v13}, Lorg/jsoup/nodes/Element;->parents()Lorg/jsoup/select/Elements;

    move-result-object v1

    const-string v2, "parents(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 148
    .local v2, "$i$f$firstOrNull":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_12a
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_15f

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v25, v0

    .end local v0    # "host":Ljava/lang/String;
    .local v24, "element$iv":Ljava/lang/Object;
    .local v25, "host":Ljava/lang/String;
    move-object/from16 v0, v24

    check-cast v0, Lorg/jsoup/nodes/Element;

    .local v0, "it":Lorg/jsoup/nodes/Element;
    const/16 v26, 0x0

    .line 64
    .local v26, "$i$a$-firstOrNull-CatalogParser$cards$1$box$1":I
    move-object/from16 v27, v1

    .end local v1    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .local v27, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const-string v1, "group"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_156

    const-string v1, "thumbnail"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_156

    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_156

    const/4 v0, 0x1

    goto :goto_157

    :cond_156
    const/4 v0, 0x0

    .line 148
    .end local v0    # "it":Lorg/jsoup/nodes/Element;
    .end local v26    # "$i$a$-firstOrNull-CatalogParser$cards$1$box$1":I
    :goto_157
    if-eqz v0, :cond_15a

    goto :goto_165

    :cond_15a
    move-object/from16 v0, v25

    move-object/from16 v1, v27

    goto :goto_12a

    .line 149
    .end local v24    # "element$iv":Ljava/lang/Object;
    .end local v25    # "host":Ljava/lang/String;
    .end local v27    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .local v0, "host":Ljava/lang/String;
    .restart local v1    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    :cond_15f
    move-object/from16 v25, v0

    move-object/from16 v27, v1

    .end local v0    # "host":Ljava/lang/String;
    .end local v1    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .restart local v25    # "host":Ljava/lang/String;
    .restart local v27    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    move-object/from16 v24, v21

    .line 64
    .end local v2    # "$i$f$firstOrNull":I
    .end local v27    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    :goto_165
    move-object/from16 v1, v24

    check-cast v1, Lorg/jsoup/nodes/Element;

    if-nez v1, :cond_192

    const-string v0, ".thumbnail"

    invoke-virtual {v13, v0}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_179

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    move-object v1, v0

    goto :goto_17b

    :cond_179
    move-object/from16 v1, v21

    :goto_17b
    if-nez v1, :cond_192

    invoke-virtual {v13}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-nez v1, :cond_192

    goto :goto_191

    .line 63
    .end local v25    # "host":Ljava/lang/String;
    .restart local v0    # "host":Ljava/lang/String;
    :cond_184
    move-object/from16 v25, v0

    .end local v0    # "host":Ljava/lang/String;
    .restart local v25    # "host":Ljava/lang/String;
    const-string v0, ".item"

    invoke-virtual {v13, v0}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-nez v1, :cond_192

    goto :goto_191

    .line 62
    .end local v25    # "host":Ljava/lang/String;
    .restart local v0    # "host":Ljava/lang/String;
    :cond_18f
    move-object/from16 v25, v0

    .line 61
    .end local v0    # "host":Ljava/lang/String;
    .restart local v25    # "host":Ljava/lang/String;
    :goto_191
    move-object v1, v13

    :cond_192
    move-object v0, v1

    .line 67
    .local v0, "box":Lorg/jsoup/nodes/Element;
    sget-object v1, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {v1, v0, v3}, Lcom/lagradost/CatalogParser;->image(Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1a0

    goto/16 :goto_22c

    .line 68
    .local v1, "poster":Ljava/lang/String;
    :cond_1a0
    const-string v2, "title"

    invoke-virtual {v13, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v18

    const-string v20, ""

    if-eqz v18, :cond_1c6

    .line 134
    const/4 v2, 0x0

    .line 68
    .local v2, "$i$a$-ifBlank-CatalogParser$cards$1$title$1":I
    move/from16 v18, v2

    .end local v2    # "$i$a$-ifBlank-CatalogParser$cards$1$title$1":I
    .local v18, "$i$a$-ifBlank-CatalogParser$cards$1$title$1":I
    const-string v2, ".wp-ctitle, .titlebox, .item_title, .title, .my-2 a"

    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    if-eqz v2, :cond_1c0

    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v2

    goto :goto_1c2

    :cond_1c0
    move-object/from16 v2, v21

    :goto_1c2
    if-nez v2, :cond_1c6

    move-object/from16 v2, v20

    .end local v18    # "$i$a$-ifBlank-CatalogParser$cards$1$title$1":I
    :cond_1c6
    check-cast v2, Ljava/lang/CharSequence;

    .line 69
    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_1ea

    .line 134
    const/4 v2, 0x0

    .line 69
    .local v2, "$i$a$-ifBlank-CatalogParser$cards$1$title$2":I
    invoke-virtual {v0, v5}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v5

    if-eqz v5, :cond_1de

    move-object/from16 v18, v0

    .end local v0    # "box":Lorg/jsoup/nodes/Element;
    .local v18, "box":Lorg/jsoup/nodes/Element;
    const-string v0, "alt"

    invoke-virtual {v5, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1e2

    .end local v18    # "box":Lorg/jsoup/nodes/Element;
    .restart local v0    # "box":Lorg/jsoup/nodes/Element;
    :cond_1de
    move-object/from16 v18, v0

    .end local v0    # "box":Lorg/jsoup/nodes/Element;
    .restart local v18    # "box":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, v21

    :goto_1e2
    if-nez v0, :cond_1e5

    goto :goto_1e7

    :cond_1e5
    move-object/from16 v20, v0

    :goto_1e7
    move-object/from16 v2, v20

    .end local v2    # "$i$a$-ifBlank-CatalogParser$cards$1$title$2":I
    goto :goto_1ec

    .end local v18    # "box":Lorg/jsoup/nodes/Element;
    .restart local v0    # "box":Lorg/jsoup/nodes/Element;
    :cond_1ea
    move-object/from16 v18, v0

    .end local v0    # "box":Lorg/jsoup/nodes/Element;
    .restart local v18    # "box":Lorg/jsoup/nodes/Element;
    :goto_1ec
    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1f9

    .line 134
    const/4 v0, 0x0

    .line 69
    .local v0, "$i$a$-ifBlank-CatalogParser$cards$1$title$3":I
    invoke-virtual {v13}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v2

    .end local v0    # "$i$a$-ifBlank-CatalogParser$cards$1$title$3":I
    :cond_1f9
    const-string v0, "ifBlank(...)"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/lang/String;

    .line 70
    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    new-instance v2, Lkotlin/text/Regex;

    const-string v5, "\\s+"

    invoke-direct {v2, v5}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v2, v0, v5}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    nop

    .line 71
    .local v0, "title":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v5, 0x2

    if-ge v2, v5, :cond_222

    goto :goto_22c

    .line 72
    :cond_222
    new-instance v2, Lcom/lagradost/VideoCard;

    invoke-direct {v2, v0, v14, v1}, Lcom/lagradost/VideoCard;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v21, v2

    goto :goto_22c

    .line 60
    .end local v1    # "poster":Ljava/lang/String;
    .end local v18    # "box":Lorg/jsoup/nodes/Element;
    .end local v25    # "host":Ljava/lang/String;
    .local v0, "host":Ljava/lang/String;
    :cond_22a
    move-object/from16 v25, v0

    .line 146
    .end local v0    # "host":Ljava/lang/String;
    .end local v13    # "a":Lorg/jsoup/nodes/Element;
    .end local v14    # "url":Ljava/lang/String;
    .end local v19    # "$i$a$-mapNotNull-CatalogParser$cards$1":I
    :goto_22c
    if-eqz v21, :cond_234

    move-object/from16 v0, v21

    .line 150
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 146
    .local v1, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v8, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 147
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v1    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v16    # "element$iv$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_234
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v5, v23

    .end local v15    # "element$iv$iv$iv":Ljava/lang/Object;
    goto/16 :goto_40

    .line 151
    .end local v23    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v5    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    :cond_23c
    move-object/from16 v23, v5

    .line 152
    .end local v5    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v10    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$forEach":I
    .restart local v23    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    nop

    .end local v7    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v8    # "destination$iv$iv":Ljava/util/Collection;
    .end local v9    # "$i$f$mapNotNullTo":I
    move-object v0, v8

    check-cast v0, Ljava/util/List;

    .line 137
    nop

    .end local v6    # "$i$f$mapNotNull":I
    .end local v23    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    check-cast v0, Ljava/lang/Iterable;

    .line 73
    nop

    .local v0, "$this$distinctBy$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 153
    .local v1, "$i$f$distinctBy":I
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 154
    .local v2, "set$iv":Ljava/util/HashSet;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .local v4, "list$iv":Ljava/util/ArrayList;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_255
    :goto_255
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_27e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 156
    .local v6, "e$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Lcom/lagradost/VideoCard;

    .local v7, "it":Lcom/lagradost/VideoCard;
    const/4 v8, 0x0

    .line 73
    .local v8, "$i$a$-distinctBy-CatalogParser$cards$2":I
    invoke-virtual {v7}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    new-array v11, v10, [C

    const/16 v12, 0x2f

    const/4 v13, 0x0

    aput-char v12, v11, v13

    invoke-static {v9, v11}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v7

    .line 156
    .end local v7    # "it":Lcom/lagradost/VideoCard;
    .end local v8    # "$i$a$-distinctBy-CatalogParser$cards$2":I
    nop

    .line 157
    .local v7, "key$iv":Ljava/lang/Object;
    invoke-virtual {v2, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_255

    .line 158
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_255

    .line 160
    .end local v6    # "e$iv":Ljava/lang/Object;
    .end local v7    # "key$iv":Ljava/lang/Object;
    :cond_27e
    move-object v0, v4

    check-cast v0, Ljava/util/List;

    .end local v0    # "$this$distinctBy$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$distinctBy":I
    .end local v2    # "set$iv":Ljava/util/HashSet;
    .end local v4    # "list$iv":Ljava/util/ArrayList;
    check-cast v0, Ljava/lang/Iterable;

    .line 73
    const/16 v1, 0x50

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v0

    .line 56
    return-object v0
.end method

.method public final details(Lorg/jsoup/nodes/Document;Lcom/lagradost/CatalogSite;Ljava/lang/String;)Lcom/lagradost/VideoDetails;
    .registers 31
    .param p1, "doc"    # Lorg/jsoup/nodes/Document;
    .param p2, "site"    # Lcom/lagradost/CatalogSite;
    .param p3, "url"    # Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    const-string v4, "doc"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "site"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "url"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    const-string v4, "h1"

    invoke-virtual {v1, v4}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    const/4 v6, 0x1

    if-eqz v4, :cond_36

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_36

    move-object v7, v4

    .line 134
    .local v7, "it":Ljava/lang/String;
    const/4 v8, 0x0

    .line 80
    .local v8, "$i$a$-takeIf-CatalogParser$details$title$1":I
    move-object v9, v7

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v9}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v9

    xor-int/2addr v9, v6

    .end local v7    # "it":Ljava/lang/String;
    .end local v8    # "$i$a$-takeIf-CatalogParser$details$title$1":I
    if-eqz v9, :cond_33

    goto :goto_34

    :cond_33
    const/4 v4, 0x0

    :goto_34
    if-nez v4, :cond_42

    :cond_36
    const-string v4, "og:title"

    invoke-virtual {v0, v1, v4}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_42

    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object v4

    :cond_42
    move-object v8, v4

    .line 81
    .local v8, "title":Ljava/lang/String;
    const-string v4, "og:image"

    invoke-virtual {v0, v1, v4}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5b

    const-string v4, "video[poster]"

    invoke-virtual {v1, v4}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v4

    if-eqz v4, :cond_5a

    const-string v7, "poster"

    invoke-virtual {v4, v7}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_5b

    :cond_5a
    const/4 v4, 0x0

    :cond_5b
    :goto_5b
    invoke-virtual {v0, v3, v4}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 82
    .local v4, "poster":Ljava/lang/String;
    nop

    .line 86
    nop

    .line 82
    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v7

    const/4 v9, 0x4

    if-eq v7, v9, :cond_71

    const/4 v10, 0x5

    if-eq v7, v10, :cond_6e

    .line 85
    const-string v7, ".video-description, .description"

    goto :goto_73

    .line 84
    :cond_6e
    const-string v7, ".videobox h2.desc"

    goto :goto_73

    .line 83
    :cond_71
    const-string v7, ".video-description, .text-secondary .mb-3"

    .line 82
    :goto_73
    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v7

    .line 86
    if-eqz v7, :cond_92

    .line 82
    nop

    .line 86
    invoke-virtual {v7}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_92

    .line 82
    nop

    .line 86
    move-object v10, v7

    .line 134
    .local v10, "it":Ljava/lang/String;
    const/4 v11, 0x0

    .line 86
    .local v11, "$i$a$-takeIf-CatalogParser$details$description$1":I
    move-object v12, v10

    check-cast v12, Ljava/lang/CharSequence;

    invoke-static {v12}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v12

    xor-int/2addr v12, v6

    .end local v10    # "it":Ljava/lang/String;
    .end local v11    # "$i$a$-takeIf-CatalogParser$details$description$1":I
    if-eqz v12, :cond_8e

    goto :goto_8f

    :cond_8e
    const/4 v7, 0x0

    .line 82
    :goto_8f
    if-eqz v7, :cond_92

    goto :goto_a2

    .line 86
    :cond_92
    const-string v7, "og:description"

    invoke-virtual {v0, v1, v7}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 82
    if-nez v7, :cond_a2

    .line 86
    const-string v7, "description"

    invoke-virtual {v0, v1, v7}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object v10, v7

    goto :goto_a3

    .line 82
    :cond_a2
    :goto_a2
    move-object v10, v7

    :goto_a3
    nop

    .line 87
    .local v10, "description":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v7

    const/4 v11, 0x3

    if-eq v7, v6, :cond_b8

    if-eq v7, v11, :cond_b5

    if-eq v7, v9, :cond_b2

    .line 91
    const-string v7, ".videobox a[href*=\'/category/\'], .videobox a[href*=\'/search/\']"

    goto :goto_ba

    .line 90
    :cond_b2
    const-string v7, "a[href*=\'/genres/\'], a[href*=\'/actresses/\'], a[href*=\'/makers/\']"

    goto :goto_ba

    .line 89
    :cond_b5
    const-string v7, "#tags a, .play-meta a[href*=\'?s=\']"

    goto :goto_ba

    .line 88
    :cond_b8
    const-string v7, ".tagsbox a"

    .line 87
    :goto_ba
    move-object v15, v7

    .line 93
    .local v15, "tagSelector":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v7

    const-string v12, "select(...)"

    if-ne v7, v9, :cond_101

    const-string v7, ".space-y-2"

    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v7

    invoke-static {v7, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v14, 0x0

    .line 163
    .local v14, "$i$f$firstOrNull":I
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_d3
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_f4

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    .local v17, "element$iv":Ljava/lang/Object;
    move-object/from16 v11, v17

    check-cast v11, Lorg/jsoup/nodes/Element;

    .local v11, "it":Lorg/jsoup/nodes/Element;
    const/16 v19, 0x0

    .line 93
    .local v19, "$i$a$-firstOrNull-CatalogParser$details$tagRoot$1":I
    const-string v6, "time[datetime]"

    invoke-virtual {v11, v6}, Lorg/jsoup/nodes/Element;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    if-eqz v6, :cond_ed

    const/4 v6, 0x1

    goto :goto_ee

    :cond_ed
    const/4 v6, 0x0

    .line 163
    .end local v11    # "it":Lorg/jsoup/nodes/Element;
    .end local v19    # "$i$a$-firstOrNull-CatalogParser$details$tagRoot$1":I
    :goto_ee
    if-eqz v6, :cond_f1

    goto :goto_f6

    :cond_f1
    const/4 v6, 0x1

    const/4 v11, 0x3

    goto :goto_d3

    .line 164
    .end local v17    # "element$iv":Ljava/lang/Object;
    :cond_f4
    const/16 v17, 0x0

    .line 93
    .end local v7    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v14    # "$i$f$firstOrNull":I
    :goto_f6
    check-cast v17, Lorg/jsoup/nodes/Element;

    if-nez v17, :cond_103

    .line 94
    const-string v6, ".video-info, .movie-info, #video-info"

    invoke-virtual {v1, v6}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v17

    goto :goto_103

    :cond_101
    const/16 v17, 0x0

    .line 93
    :cond_103
    :goto_103
    move-object/from16 v6, v17

    .line 95
    .local v6, "tagRoot":Lorg/jsoup/nodes/Element;
    if-nez v6, :cond_10b

    move-object v7, v1

    check-cast v7, Lorg/jsoup/nodes/Element;

    goto :goto_10c

    :cond_10b
    move-object v7, v6

    :goto_10c
    invoke-virtual {v7, v15}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v7

    invoke-static {v7, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v11, 0x0

    .line 165
    .local v11, "$i$f$filter":I
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    check-cast v14, Ljava/util/Collection;

    .local v14, "destination$iv$iv":Ljava/util/Collection;
    move-object/from16 v16, v7

    .local v16, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/16 v17, 0x0

    .line 166
    .local v17, "$i$f$filterTo":I
    invoke-interface/range {v16 .. v16}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_125
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_18f

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv$iv":Ljava/lang/Object;
    move-object v13, v5

    check-cast v13, Lorg/jsoup/nodes/Element;

    .local v13, "a":Lorg/jsoup/nodes/Element;
    const/16 v22, 0x0

    .line 96
    .local v22, "$i$a$-filter-CatalogParser$details$tags$1":I
    move-object/from16 v23, v6

    .end local v6    # "tagRoot":Lorg/jsoup/nodes/Element;
    .local v23, "tagRoot":Lorg/jsoup/nodes/Element;
    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v6

    if-ne v6, v9, :cond_179

    const-string v6, "nav, header, footer, [role=navigation]"

    invoke-virtual {v13, v6}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    if-nez v6, :cond_171

    .line 97
    const-string v6, "href"

    invoke-virtual {v13, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v9, "attr(...)"

    invoke-static {v6, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v6, Ljava/lang/CharSequence;

    const-string v9, "ranking"

    check-cast v9, Ljava/lang/CharSequence;

    move-object/from16 v24, v7

    move/from16 v25, v11

    move-object/from16 v26, v15

    const/4 v7, 0x2

    const/4 v11, 0x0

    const/4 v15, 0x0

    .end local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$filter":I
    .end local v15    # "tagSelector":Ljava/lang/String;
    .local v24, "$this$filter$iv":Ljava/lang/Iterable;
    .local v25, "$i$f$filter":I
    .local v26, "tagSelector":Ljava/lang/String;
    invoke-static {v6, v9, v15, v7, v11}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_177

    invoke-virtual {v13}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x50

    if-ge v6, v7, :cond_177

    goto :goto_17f

    .line 96
    .end local v24    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v25    # "$i$f$filter":I
    .end local v26    # "tagSelector":Ljava/lang/String;
    .restart local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v11    # "$i$f$filter":I
    .restart local v15    # "tagSelector":Ljava/lang/String;
    :cond_171
    move-object/from16 v24, v7

    move/from16 v25, v11

    move-object/from16 v26, v15

    .line 97
    .end local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$filter":I
    .end local v15    # "tagSelector":Ljava/lang/String;
    .restart local v24    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v25    # "$i$f$filter":I
    .restart local v26    # "tagSelector":Ljava/lang/String;
    :cond_177
    const/4 v6, 0x0

    goto :goto_180

    .line 96
    .end local v24    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v25    # "$i$f$filter":I
    .end local v26    # "tagSelector":Ljava/lang/String;
    .restart local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v11    # "$i$f$filter":I
    .restart local v15    # "tagSelector":Ljava/lang/String;
    :cond_179
    move-object/from16 v24, v7

    move/from16 v25, v11

    move-object/from16 v26, v15

    .line 97
    .end local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$filter":I
    .end local v15    # "tagSelector":Ljava/lang/String;
    .restart local v24    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v25    # "$i$f$filter":I
    .restart local v26    # "tagSelector":Ljava/lang/String;
    :goto_17f
    const/4 v6, 0x1

    .line 166
    .end local v13    # "a":Lorg/jsoup/nodes/Element;
    .end local v22    # "$i$a$-filter-CatalogParser$details$tags$1":I
    :goto_180
    if-eqz v6, :cond_185

    invoke-interface {v14, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_185
    move-object/from16 v6, v23

    move-object/from16 v7, v24

    move/from16 v11, v25

    move-object/from16 v15, v26

    const/4 v9, 0x4

    goto :goto_125

    .line 167
    .end local v5    # "element$iv$iv":Ljava/lang/Object;
    .end local v23    # "tagRoot":Lorg/jsoup/nodes/Element;
    .end local v24    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v25    # "$i$f$filter":I
    .end local v26    # "tagSelector":Ljava/lang/String;
    .restart local v6    # "tagRoot":Lorg/jsoup/nodes/Element;
    .restart local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v11    # "$i$f$filter":I
    .restart local v15    # "tagSelector":Ljava/lang/String;
    :cond_18f
    move-object/from16 v23, v6

    move-object/from16 v24, v7

    move/from16 v25, v11

    move-object/from16 v26, v15

    .end local v6    # "tagRoot":Lorg/jsoup/nodes/Element;
    .end local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$filter":I
    .end local v14    # "destination$iv$iv":Ljava/util/Collection;
    .end local v15    # "tagSelector":Ljava/lang/String;
    .end local v16    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v17    # "$i$f$filterTo":I
    .restart local v23    # "tagRoot":Lorg/jsoup/nodes/Element;
    .restart local v24    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v25    # "$i$f$filter":I
    .restart local v26    # "tagSelector":Ljava/lang/String;
    move-object v5, v14

    check-cast v5, Ljava/util/List;

    .line 165
    nop

    .end local v24    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v25    # "$i$f$filter":I
    check-cast v5, Ljava/lang/Iterable;

    .line 98
    nop

    .local v5, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 168
    .local v6, "$i$f$map":I
    new-instance v7, Ljava/util/ArrayList;

    const/16 v9, 0xa

    invoke-static {v5, v9}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v11

    invoke-direct {v7, v11}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v7, Ljava/util/Collection;

    .local v7, "destination$iv$iv":Ljava/util/Collection;
    move-object v11, v5

    .local v11, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 169
    .local v13, "$i$f$mapTo":I
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1b2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1df

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 170
    .local v15, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v15

    check-cast v16, Lorg/jsoup/nodes/Element;

    .local v16, "it":Lorg/jsoup/nodes/Element;
    const/16 v17, 0x0

    .line 98
    .local v17, "$i$a$-map-CatalogParser$details$tags$2":I
    invoke-virtual/range {v16 .. v16}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v22, v5

    .end local v5    # "$this$map$iv":Ljava/lang/Iterable;
    .local v22, "$this$map$iv":Ljava/lang/Iterable;
    const-string v5, "text(...)"

    invoke-static {v9, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v9}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 170
    .end local v16    # "it":Lorg/jsoup/nodes/Element;
    .end local v17    # "$i$a$-map-CatalogParser$details$tags$2":I
    invoke-interface {v7, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v5, v22

    const/16 v9, 0xa

    goto :goto_1b2

    .line 171
    .end local v15    # "item$iv$iv":Ljava/lang/Object;
    .end local v22    # "$this$map$iv":Ljava/lang/Iterable;
    .restart local v5    # "$this$map$iv":Ljava/lang/Iterable;
    :cond_1df
    move-object/from16 v22, v5

    .end local v5    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v7    # "destination$iv$iv":Ljava/util/Collection;
    .end local v11    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v13    # "$i$f$mapTo":I
    .restart local v22    # "$this$map$iv":Ljava/lang/Iterable;
    move-object v5, v7

    check-cast v5, Ljava/util/List;

    .line 168
    nop

    .end local v6    # "$i$f$map":I
    .end local v22    # "$this$map$iv":Ljava/lang/Iterable;
    check-cast v5, Ljava/lang/Iterable;

    .line 98
    nop

    .local v5, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 172
    .local v6, "$i$f$filter":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    check-cast v7, Ljava/util/Collection;

    .restart local v7    # "destination$iv$iv":Ljava/util/Collection;
    move-object v9, v5

    .local v9, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v11, 0x0

    .line 173
    .local v11, "$i$f$filterTo":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_1f6
    :goto_1f6
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_217

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .local v14, "element$iv$iv":Ljava/lang/Object;
    move-object v15, v14

    check-cast v15, Ljava/lang/String;

    .local v15, "it":Ljava/lang/String;
    const/16 v16, 0x0

    .line 98
    .local v16, "$i$a$-filter-CatalogParser$details$tags$3":I
    move-object/from16 v17, v15

    check-cast v17, Ljava/lang/CharSequence;

    invoke-static/range {v17 .. v17}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v17

    const/16 v20, 0x1

    xor-int/lit8 v17, v17, 0x1

    .line 173
    .end local v15    # "it":Ljava/lang/String;
    .end local v16    # "$i$a$-filter-CatalogParser$details$tags$3":I
    if-eqz v17, :cond_1f6

    invoke-interface {v7, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1f6

    .line 174
    .end local v14    # "element$iv$iv":Ljava/lang/Object;
    :cond_217
    nop

    .end local v7    # "destination$iv$iv":Ljava/util/Collection;
    .end local v9    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$filterTo":I
    check-cast v7, Ljava/util/List;

    .line 172
    nop

    .end local v5    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$filter":I
    check-cast v7, Ljava/util/Collection;

    .line 98
    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v5

    .line 95
    nop

    .line 99
    .local v5, "tags":Ljava/util/List;
    move-object v6, v5

    check-cast v6, Ljava/util/Collection;

    const-string v7, "meta[property=video:tag]"

    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v7

    invoke-static {v7, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 175
    .local v9, "$i$f$map":I
    new-instance v11, Ljava/util/ArrayList;

    const/16 v12, 0xa

    invoke-static {v7, v12}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v11, v13}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v11, Ljava/util/Collection;

    .local v11, "destination$iv$iv":Ljava/util/Collection;
    move-object v12, v7

    .local v12, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 176
    .restart local v13    # "$i$f$mapTo":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_244
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_265

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 177
    .local v15, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v7

    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .local v16, "$this$map$iv":Ljava/lang/Iterable;
    move-object v7, v15

    check-cast v7, Lorg/jsoup/nodes/Element;

    .local v7, "it":Lorg/jsoup/nodes/Element;
    const/16 v17, 0x0

    .line 99
    .local v17, "$i$a$-map-CatalogParser$details$1":I
    move/from16 v22, v9

    .end local v9    # "$i$f$map":I
    .local v22, "$i$f$map":I
    const-string v9, "content"

    invoke-virtual {v7, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 177
    .end local v7    # "it":Lorg/jsoup/nodes/Element;
    .end local v17    # "$i$a$-map-CatalogParser$details$1":I
    invoke-interface {v11, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v7, v16

    move/from16 v9, v22

    goto :goto_244

    .line 178
    .end local v15    # "item$iv$iv":Ljava/lang/Object;
    .end local v16    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v22    # "$i$f$map":I
    .local v7, "$this$map$iv":Ljava/lang/Iterable;
    .restart local v9    # "$i$f$map":I
    :cond_265
    move-object/from16 v16, v7

    move/from16 v22, v9

    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$map":I
    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v12    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v13    # "$i$f$mapTo":I
    .restart local v16    # "$this$map$iv":Ljava/lang/Iterable;
    .restart local v22    # "$i$f$map":I
    move-object v7, v11

    check-cast v7, Ljava/util/List;

    .line 175
    nop

    .end local v16    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v22    # "$i$f$map":I
    check-cast v7, Ljava/lang/Iterable;

    .line 99
    invoke-static {v6, v7}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 100
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_315

    move-object v6, v5

    check-cast v6, Ljava/util/Collection;

    const-string v7, "keywords"

    invoke-virtual {v0, v1, v7}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_285

    const-string v7, ""

    :cond_285
    move-object v11, v7

    check-cast v11, Ljava/lang/CharSequence;

    const/4 v7, 0x1

    new-array v12, v7, [C

    const/16 v7, 0x2c

    const/4 v9, 0x0

    aput-char v7, v12, v9

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x6

    const/16 v16, 0x0

    invoke-static/range {v11 .. v16}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    .restart local v7    # "$this$map$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 179
    .restart local v9    # "$i$f$map":I
    new-instance v11, Ljava/util/ArrayList;

    const/16 v12, 0xa

    invoke-static {v7, v12}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v11, Ljava/util/Collection;

    .restart local v11    # "destination$iv$iv":Ljava/util/Collection;
    move-object v12, v7

    .restart local v12    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 180
    .restart local v13    # "$i$f$mapTo":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_2af
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2d3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 181
    .restart local v15    # "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v15

    check-cast v16, Ljava/lang/String;

    .local v16, "it":Ljava/lang/String;
    const/16 v17, 0x0

    .line 100
    .local v17, "$i$a$-map-CatalogParser$details$2":I
    move-object/from16 v19, v16

    check-cast v19, Ljava/lang/CharSequence;

    invoke-static/range {v19 .. v19}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v19

    move-object/from16 v22, v7

    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .local v22, "$this$map$iv":Ljava/lang/Iterable;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 181
    .end local v16    # "it":Ljava/lang/String;
    .end local v17    # "$i$a$-map-CatalogParser$details$2":I
    invoke-interface {v11, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v7, v22

    goto :goto_2af

    .line 182
    .end local v15    # "item$iv$iv":Ljava/lang/Object;
    .end local v22    # "$this$map$iv":Ljava/lang/Iterable;
    .restart local v7    # "$this$map$iv":Ljava/lang/Iterable;
    :cond_2d3
    move-object/from16 v22, v7

    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v12    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v13    # "$i$f$mapTo":I
    .restart local v22    # "$this$map$iv":Ljava/lang/Iterable;
    move-object v7, v11

    check-cast v7, Ljava/util/List;

    .line 179
    nop

    .end local v9    # "$i$f$map":I
    .end local v22    # "$this$map$iv":Ljava/lang/Iterable;
    check-cast v7, Ljava/lang/Iterable;

    .line 100
    nop

    .local v7, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 183
    .local v9, "$i$f$filter":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    check-cast v11, Ljava/util/Collection;

    .restart local v11    # "destination$iv$iv":Ljava/util/Collection;
    move-object v12, v7

    .local v12, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 184
    .local v13, "$i$f$filterTo":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_2ea
    :goto_2ea
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_30c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .local v15, "element$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v15

    check-cast v16, Ljava/lang/String;

    .restart local v16    # "it":Ljava/lang/String;
    const/16 v17, 0x0

    .line 100
    .local v17, "$i$a$-filter-CatalogParser$details$3":I
    move-object/from16 v19, v16

    check-cast v19, Ljava/lang/CharSequence;

    invoke-static/range {v19 .. v19}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v19

    const/16 v20, 0x1

    xor-int/lit8 v19, v19, 0x1

    .line 184
    .end local v16    # "it":Ljava/lang/String;
    .end local v17    # "$i$a$-filter-CatalogParser$details$3":I
    if-eqz v19, :cond_2ea

    invoke-interface {v11, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2ea

    .line 185
    .end local v15    # "element$iv$iv":Ljava/lang/Object;
    :cond_30c
    nop

    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v12    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v13    # "$i$f$filterTo":I
    check-cast v11, Ljava/util/List;

    .line 183
    nop

    .end local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$filter":I
    check-cast v11, Ljava/lang/Iterable;

    .line 100
    invoke-static {v6, v11}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 101
    :cond_315
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_3a3

    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v6

    const/4 v7, 0x3

    if-ne v6, v7, :cond_3a3

    .line 102
    nop

    .line 101
    new-instance v6, Lkotlin/text/Regex;

    const-string v7, "current_tag\\s*=\\s*[\'\"]([^\'\"]+)"

    invoke-direct {v6, v7}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/nodes/Document;->html()Ljava/lang/String;

    move-result-object v7

    const-string v9, "html(...)"

    invoke-static {v7, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/lang/CharSequence;

    const/4 v9, 0x2

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v6, v7, v12, v9, v11}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_3a3

    invoke-interface {v6}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_3a3

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 102
    if-eqz v6, :cond_3a3

    .line 101
    move-object v11, v6

    check-cast v11, Ljava/lang/CharSequence;

    .line 102
    new-array v12, v7, [C

    const/16 v6, 0x2d

    const/4 v7, 0x0

    aput-char v6, v12, v7

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x6

    const/16 v16, 0x0

    invoke-static/range {v11 .. v16}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_3a3

    .line 101
    check-cast v6, Ljava/lang/Iterable;

    .line 102
    nop

    .local v6, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 186
    .local v7, "$i$f$filter":I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    check-cast v9, Ljava/util/Collection;

    .local v9, "destination$iv$iv":Ljava/util/Collection;
    move-object v11, v6

    .local v11, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 187
    .local v12, "$i$f$filterTo":I
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_373
    :goto_373
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_394

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .restart local v14    # "element$iv$iv":Ljava/lang/Object;
    move-object v15, v14

    check-cast v15, Ljava/lang/String;

    .local v15, "it":Ljava/lang/String;
    const/16 v16, 0x0

    .line 102
    .local v16, "$i$a$-filter-CatalogParser$details$4":I
    move-object/from16 v17, v15

    check-cast v17, Ljava/lang/CharSequence;

    invoke-static/range {v17 .. v17}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v17

    const/16 v18, 0x1

    xor-int/lit8 v17, v17, 0x1

    .line 187
    .end local v15    # "it":Ljava/lang/String;
    .end local v16    # "$i$a$-filter-CatalogParser$details$4":I
    if-eqz v17, :cond_373

    invoke-interface {v9, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_373

    .line 188
    .end local v14    # "element$iv$iv":Ljava/lang/Object;
    :cond_394
    nop

    .end local v9    # "destination$iv$iv":Ljava/util/Collection;
    .end local v11    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v12    # "$i$f$filterTo":I
    check-cast v9, Ljava/util/List;

    .line 186
    nop

    .line 102
    .end local v6    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$filter":I
    nop

    .line 101
    nop

    .line 102
    move-object v6, v9

    .line 134
    .local v6, "it":Ljava/util/List;
    const/4 v7, 0x0

    .line 102
    .local v7, "$i$a$-let-CatalogParser$details$5":I
    move-object v9, v6

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v5, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .end local v6    # "it":Ljava/util/List;
    .end local v7    # "$i$a$-let-CatalogParser$details$5":I
    goto :goto_3a4

    .line 101
    :cond_3a3
    nop

    .line 103
    :goto_3a4
    const-string v6, "#related-videos, .related-videos, .related_videos, .video-related, #related"

    invoke-virtual {v1, v6}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    if-nez v6, :cond_3af

    move-object v6, v1

    check-cast v6, Lorg/jsoup/nodes/Element;

    .line 104
    .local v6, "relatedRoot":Lorg/jsoup/nodes/Element;
    :cond_3af
    invoke-static {v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v7, v5

    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    const/16 v9, 0x28

    invoke-static {v7, v9}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v11

    invoke-virtual {v0, v6, v2, v3}, Lcom/lagradost/CatalogParser;->cards(Lorg/jsoup/nodes/Element;Lcom/lagradost/CatalogSite;Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 189
    .local v9, "$i$f$filter":I
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    check-cast v12, Ljava/util/Collection;

    .local v12, "destination$iv$iv":Ljava/util/Collection;
    move-object v13, v7

    .local v13, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v14, 0x0

    .line 190
    .local v14, "$i$f$filterTo":I
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_3d5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_413

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .local v0, "element$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v0

    check-cast v16, Lcom/lagradost/VideoCard;

    .local v16, "it":Lcom/lagradost/VideoCard;
    const/16 v17, 0x0

    .line 104
    .local v17, "$i$a$-filter-CatalogParser$details$6":I
    invoke-virtual/range {v16 .. v16}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v18, v5

    const/4 v2, 0x1

    .end local v5    # "tags":Ljava/util/List;
    .local v18, "tags":Ljava/util/List;
    new-array v5, v2, [C

    const/16 v19, 0x2f

    const/16 v20, 0x0

    aput-char v19, v5, v20

    invoke-static {v1, v5}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v1

    new-array v5, v2, [C

    aput-char v19, v5, v20

    invoke-static {v3, v5}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    .line 190
    .end local v16    # "it":Lcom/lagradost/VideoCard;
    .end local v17    # "$i$a$-filter-CatalogParser$details$6":I
    xor-int/2addr v1, v2

    if-eqz v1, :cond_40a

    invoke-interface {v12, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_40a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v5, v18

    goto :goto_3d5

    .line 191
    .end local v0    # "element$iv$iv":Ljava/lang/Object;
    .end local v18    # "tags":Ljava/util/List;
    .restart local v5    # "tags":Ljava/util/List;
    :cond_413
    nop

    .end local v12    # "destination$iv$iv":Ljava/util/Collection;
    .end local v13    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v14    # "$i$f$filterTo":I
    move-object v0, v12

    check-cast v0, Ljava/util/List;

    .line 189
    nop

    .end local v7    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$filter":I
    check-cast v0, Ljava/lang/Iterable;

    .line 104
    const/16 v1, 0x1e

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v12

    const/4 v13, 0x0

    const/16 v14, 0x20

    const/4 v15, 0x0

    new-instance v0, Lcom/lagradost/VideoDetails;

    move-object v7, v0

    move-object v9, v4

    move-object/from16 v1, v26

    .end local v26    # "tagSelector":Ljava/lang/String;
    .local v1, "tagSelector":Ljava/lang/String;
    invoke-direct/range {v7 .. v15}, Lcom/lagradost/VideoDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "doc"    # Lorg/jsoup/nodes/Document;
    .param p2, "key"    # Ljava/lang/String;

    const-string v0, "doc"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "key"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    nop

    .line 75
    const-string v0, "meta"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    const-string v1, "select(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 161
    .local v1, "$i$f$firstOrNull":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_4c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v6, v3

    check-cast v6, Lorg/jsoup/nodes/Element;

    .local v6, "it":Lorg/jsoup/nodes/Element;
    const/4 v7, 0x0

    .line 76
    .local v7, "$i$a$-firstOrNull-CatalogParser$meta$1":I
    const-string v8, "property"

    invoke-virtual {v6, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, p2, v5}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_48

    const-string v8, "name"

    invoke-virtual {v6, v8}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, p2, v5}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_46

    goto :goto_48

    :cond_46
    const/4 v8, 0x0

    goto :goto_49

    :cond_48
    :goto_48
    move v8, v5

    .line 161
    .end local v6    # "it":Lorg/jsoup/nodes/Element;
    .end local v7    # "$i$a$-firstOrNull-CatalogParser$meta$1":I
    :goto_49
    if-eqz v8, :cond_1d

    goto :goto_4d

    .line 162
    .end local v3    # "element$iv":Ljava/lang/Object;
    :cond_4c
    move-object v3, v4

    .line 75
    .end local v0    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$firstOrNull":I
    :goto_4d
    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 77
    if-eqz v3, :cond_74

    .line 75
    nop

    .line 77
    const-string v0, "content"

    invoke-virtual {v3, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_74

    .line 75
    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 77
    if-eqz v0, :cond_74

    .line 75
    nop

    .line 77
    move-object v1, v0

    .line 134
    .local v1, "it":Ljava/lang/String;
    const/4 v2, 0x0

    .line 77
    .local v2, "$i$a$-takeIf-CatalogParser$meta$2":I
    move-object v3, v1

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    xor-int/2addr v3, v5

    .end local v1    # "it":Ljava/lang/String;
    .end local v2    # "$i$a$-takeIf-CatalogParser$meta$2":I
    if-eqz v3, :cond_74

    move-object v4, v0

    :cond_74
    return-object v4
.end method

.method public final nextPage(Lorg/jsoup/nodes/Document;Ljava/lang/String;I)Ljava/lang/String;
    .registers 13
    .param p1, "doc"    # Lorg/jsoup/nodes/Document;
    .param p2, "current"    # Ljava/lang/String;
    .param p3, "page"    # I

    const-string v0, "doc"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "current"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 107
    const-string v0, "a[rel=next], .pagination a.next, .pagination-next a, a.next.page-numbers, .pagination .next a"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_57

    .line 108
    const-string v0, ".pagination a, .pages a, .pager a, .paging a"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    const-string v2, "select(...)"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 192
    .local v2, "$i$f$firstOrNull":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_25
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_53

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .local v4, "element$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Lorg/jsoup/nodes/Element;

    .local v5, "it":Lorg/jsoup/nodes/Element;
    const/4 v6, 0x0

    .line 108
    .local v6, "$i$a$-firstOrNull-CatalogParser$nextPage$link$1":I
    invoke-virtual {v5}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v7

    const-string v8, "text(...)"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {v7}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v8, p3, 0x1

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    .line 192
    .end local v5    # "it":Lorg/jsoup/nodes/Element;
    .end local v6    # "$i$a$-firstOrNull-CatalogParser$nextPage$link$1":I
    if-eqz v5, :cond_25

    goto :goto_54

    .line 193
    .end local v4    # "element$iv":Ljava/lang/Object;
    :cond_53
    move-object v4, v1

    .end local v0    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$firstOrNull":I
    :goto_54
    move-object v0, v4

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 107
    :cond_57
    nop

    .line 109
    .local v0, "link":Lorg/jsoup/nodes/Element;
    if-eqz v0, :cond_61

    const-string v2, "href"

    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_62

    :cond_61
    move-object v2, v1

    :goto_62
    invoke-virtual {p0, p2, v2}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_73

    move-object v3, v2

    .line 134
    .local v3, "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 109
    .local v4, "$i$a$-takeIf-CatalogParser$nextPage$1":I
    invoke-static {v3, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    .end local v3    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-takeIf-CatalogParser$nextPage$1":I
    xor-int/lit8 v3, v5, 0x1

    if-eqz v3, :cond_73

    move-object v1, v2

    :cond_73
    return-object v1
.end method
