.class public final Lcom/example/websites/SearchQuery;
.super Ljava/lang/Object;
.source "SourceDocument.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSourceDocument.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SourceDocument.kt\ncom/example/websites/SearchQuery\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,50:1\n777#2:51\n873#2,2:52\n777#2:54\n873#2,2:55\n*S KotlinDebug\n*F\n+ 1 SourceDocument.kt\ncom/example/websites/SearchQuery\n*L\n32#1:51\n32#1:52,2\n35#1:54\n35#1:55,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005J\u000e\u0010\u0007\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005J\u0014\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00050\t2\u0006\u0010\u0006\u001a\u00020\u0005JL\u0010\n\u001a\u0008\u0012\u0004\u0012\u0002H\u000b0\t\"\u0004\u0008\u0000\u0010\u000b2\u0006\u0010\u0006\u001a\u00020\u00052(\u0010\u000c\u001a$\u0008\u0001\u0012\u0004\u0012\u00020\u0005\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u000b0\t0\u000e\u0012\u0006\u0012\u0004\u0018\u00010\u00010\rH\u0086@\u00a2\u0006\u0002\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/example/websites/SearchQuery;",
        "",
        "<init>",
        "()V",
        "normalize",
        "",
        "query",
        "encode",
        "alternatives",
        "",
        "withFallback",
        "T",
        "execute",
        "Lkotlin/Function2;",
        "Lkotlin/coroutines/Continuation;",
        "(Ljava/lang/String;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
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
        "SMAP\nSourceDocument.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SourceDocument.kt\ncom/example/websites/SearchQuery\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,50:1\n777#2:51\n873#2,2:52\n777#2:54\n873#2,2:55\n*S KotlinDebug\n*F\n+ 1 SourceDocument.kt\ncom/example/websites/SearchQuery\n*L\n32#1:51\n32#1:52,2\n35#1:54\n35#1:55,2\n*E\n"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/example/websites/SearchQuery;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/example/websites/SearchQuery;

    invoke-direct {v0}, Lcom/example/websites/SearchQuery;-><init>()V

    sput-object v0, Lcom/example/websites/SearchQuery;->INSTANCE:Lcom/example/websites/SearchQuery;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final alternatives(Ljava/lang/String;)Ljava/util/List;
    .registers 19
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 31
    invoke-virtual/range {p0 .. p1}, Lcom/example/websites/SearchQuery;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "original":Ljava/lang/String;
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    new-instance v2, Lkotlin/text/Regex;

    const-string v3, "[\\s\\p{Z}]+"

    invoke-direct {v2, v3}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Lkotlin/text/Regex;->split(Ljava/lang/CharSequence;I)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 51
    .local v2, "$i$f$filter":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v1

    .local v5, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 52
    .local v6, "$i$f$filterTo":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_23
    :goto_23
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3e

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Ljava/lang/String;

    .local v9, "p0":Ljava/lang/String;
    const/4 v10, 0x0

    .line 32
    .local v10, "$i$a$-filter-SearchQuery$alternatives$words$1":I
    move-object v11, v9

    check-cast v11, Ljava/lang/CharSequence;

    invoke-static {v11}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    .line 52
    .end local v9    # "p0":Ljava/lang/String;
    .end local v10    # "$i$a$-filter-SearchQuery$alternatives$words$1":I
    if-nez v11, :cond_23

    invoke-interface {v4, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_23

    .line 53
    .end local v8    # "element$iv$iv":Ljava/lang/Object;
    :cond_3e
    nop

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v5    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$filterTo":I
    check-cast v4, Ljava/util/List;

    .line 51
    nop

    .line 32
    .end local v1    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$filter":I
    move-object v1, v4

    .line 33
    .local v1, "words":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v4, 0x2

    if-ge v2, v4, :cond_4f

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 34
    :cond_4f
    const/4 v2, 0x1

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->dropLast(Ljava/util/List;I)Ljava/util/List;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/Iterable;

    const-string v5, " "

    move-object v7, v5

    check-cast v7, Ljava/lang/CharSequence;

    const/16 v13, 0x3e

    const/4 v14, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v6 .. v14}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    move-object v7, v1

    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v2}, Lkotlin/collections/CollectionsKt;->drop(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Ljava/lang/Iterable;

    move-object v9, v5

    check-cast v9, Ljava/lang/CharSequence;

    const/16 v15, 0x3e

    const/16 v16, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v8 .. v16}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v6, v5}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    .line 35
    nop

    .local v5, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 54
    .local v6, "$i$f$filter":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    check-cast v7, Ljava/util/Collection;

    .local v7, "destination$iv$iv":Ljava/util/Collection;
    move-object v8, v5

    .local v8, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 55
    .local v9, "$i$f$filterTo":I
    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_99
    :goto_99
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_bf

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .local v11, "element$iv$iv":Ljava/lang/Object;
    move-object v12, v11

    check-cast v12, Ljava/lang/String;

    .local v12, "it":Ljava/lang/String;
    const/4 v13, 0x0

    .line 35
    .local v13, "$i$a$-filter-SearchQuery$alternatives$1":I
    move-object v14, v12

    check-cast v14, Ljava/lang/CharSequence;

    invoke-static {v14}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_b8

    invoke-static {v12, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_b8

    const/4 v12, 0x1

    goto :goto_b9

    :cond_b8
    const/4 v12, 0x0

    .line 55
    .end local v12    # "it":Ljava/lang/String;
    .end local v13    # "$i$a$-filter-SearchQuery$alternatives$1":I
    :goto_b9
    if-eqz v12, :cond_99

    invoke-interface {v7, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_99

    .line 56
    .end local v11    # "element$iv$iv":Ljava/lang/Object;
    :cond_bf
    nop

    .end local v7    # "destination$iv$iv":Ljava/util/Collection;
    .end local v8    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$filterTo":I
    move-object v2, v7

    check-cast v2, Ljava/util/List;

    .line 54
    nop

    .end local v5    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$filter":I
    check-cast v2, Ljava/lang/Iterable;

    .line 35
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2, v4}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v2

    .line 34
    return-object v2
.end method

.method public final encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 28
    invoke-virtual {p0, p1}, Lcom/example/websites/SearchQuery;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final normalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 27
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    sget-object v1, Ljava/text/Normalizer$Form;->NFC:Ljava/text/Normalizer$Form;

    invoke-static {v0, v1}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final withFallback(Ljava/lang/String;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 11
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Ljava/lang/String;",
            "-",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "+TT;>;>;+",
            "Ljava/lang/Object;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "+TT;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    instance-of v0, p3, Lcom/example/websites/SearchQuery$withFallback$1;

    if-eqz v0, :cond_14

    move-object v0, p3

    check-cast v0, Lcom/example/websites/SearchQuery$withFallback$1;

    iget v1, v0, Lcom/example/websites/SearchQuery$withFallback$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_14

    iget v1, v0, Lcom/example/websites/SearchQuery$withFallback$1;->label:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/example/websites/SearchQuery$withFallback$1;->label:I

    goto :goto_19

    :cond_14
    new-instance v0, Lcom/example/websites/SearchQuery$withFallback$1;

    invoke-direct {v0, p0, p3}, Lcom/example/websites/SearchQuery$withFallback$1;-><init>(Lcom/example/websites/SearchQuery;Lkotlin/coroutines/Continuation;)V

    .local v0, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_19
    iget-object v1, v0, Lcom/example/websites/SearchQuery$withFallback$1;->result:Ljava/lang/Object;

    .local v1, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 38
    iget v3, v0, Lcom/example/websites/SearchQuery$withFallback$1;->label:I

    packed-switch v3, :pswitch_data_ba

    .end local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v1    # "$result":Ljava/lang/Object;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .restart local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v1    # "$result":Ljava/lang/Object;
    :pswitch_2c
    iget-object p1, v0, Lcom/example/websites/SearchQuery$withFallback$1;->L$1:Ljava/lang/Object;

    check-cast p1, Ljava/util/Iterator;

    iget-object p2, v0, Lcom/example/websites/SearchQuery$withFallback$1;->L$0:Ljava/lang/Object;

    check-cast p2, Lkotlin/jvm/functions/Function2;

    .local p2, "execute":Lkotlin/jvm/functions/Function2;
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, v2

    move-object v2, v1

    goto/16 :goto_a6

    .end local p2    # "execute":Lkotlin/jvm/functions/Function2;
    :pswitch_3b
    move-object p1, p0

    .local p1, "this":Lcom/example/websites/SearchQuery;
    iget-object p2, v0, Lcom/example/websites/SearchQuery$withFallback$1;->L$1:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    .local p2, "original":Ljava/lang/String;
    iget-object v3, v0, Lcom/example/websites/SearchQuery$withFallback$1;->L$0:Ljava/lang/Object;

    check-cast v3, Lkotlin/jvm/functions/Function2;

    .local v3, "execute":Lkotlin/jvm/functions/Function2;
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v4, v1

    goto :goto_71

    .end local v3    # "execute":Lkotlin/jvm/functions/Function2;
    .end local p1    # "this":Lcom/example/websites/SearchQuery;
    .end local p2    # "original":Ljava/lang/String;
    :pswitch_49
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p0

    .line 39
    .local v3, "this":Lcom/example/websites/SearchQuery;
    .local p1, "query":Ljava/lang/String;
    .local p2, "execute":Lkotlin/jvm/functions/Function2;
    invoke-virtual {v3, p1}, Lcom/example/websites/SearchQuery;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 40
    .local p1, "original":Ljava/lang/String;
    move-object v4, p1

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5f

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 41
    :cond_5f
    iput-object p2, v0, Lcom/example/websites/SearchQuery$withFallback$1;->L$0:Ljava/lang/Object;

    iput-object p1, v0, Lcom/example/websites/SearchQuery$withFallback$1;->L$1:Ljava/lang/Object;

    const/4 v4, 0x1

    iput v4, v0, Lcom/example/websites/SearchQuery$withFallback$1;->label:I

    invoke-interface {p2, p1, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v2, :cond_6d

    .line 38
    .end local v3    # "this":Lcom/example/websites/SearchQuery;
    return-object v2

    .line 41
    .restart local v3    # "this":Lcom/example/websites/SearchQuery;
    :cond_6d
    move-object v6, p2

    move-object p2, p1

    move-object p1, v3

    move-object v3, v6

    .line 38
    .local v3, "execute":Lkotlin/jvm/functions/Function2;
    .local p1, "this":Lcom/example/websites/SearchQuery;
    .local p2, "original":Ljava/lang/String;
    :goto_71
    check-cast v4, Ljava/util/List;

    .line 42
    .local v4, "exact":Ljava/util/List;
    move-object v5, v4

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7d

    return-object v4

    .line 43
    .end local v4    # "exact":Ljava/util/List;
    :cond_7d
    return-object v4

    invoke-virtual {p1, p2}, Lcom/example/websites/SearchQuery;->alternatives(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move-object p2, v3

    move-object p1, v4

    .end local v3    # "execute":Lkotlin/jvm/functions/Function2;
    .end local p1    # "this":Lcom/example/websites/SearchQuery;
    .local p2, "execute":Lkotlin/jvm/functions/Function2;
    :goto_88
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 44
    .local v3, "alternative":Ljava/lang/String;
    iput-object p2, v0, Lcom/example/websites/SearchQuery$withFallback$1;->L$0:Ljava/lang/Object;

    iput-object p1, v0, Lcom/example/websites/SearchQuery$withFallback$1;->L$1:Ljava/lang/Object;

    const/4 v4, 0x2

    iput v4, v0, Lcom/example/websites/SearchQuery$withFallback$1;->label:I

    invoke-interface {p2, v3, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "alternative":Ljava/lang/String;
    if-ne v3, v2, :cond_a2

    .line 38
    return-object v2

    .line 44
    :cond_a2
    move-object v6, v2

    move-object v2, v1

    move-object v1, v3

    move-object v3, v6

    .line 38
    .end local v1    # "$result":Ljava/lang/Object;
    .local v2, "$result":Ljava/lang/Object;
    :goto_a6
    check-cast v1, Ljava/util/List;

    .line 45
    .local v1, "similar":Ljava/util/List;
    move-object v4, v1

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_b2

    return-object v1

    :cond_b2
    move-object v1, v2

    move-object v2, v3

    goto :goto_88

    .line 47
    .end local v2    # "$result":Ljava/lang/Object;
    .local v1, "$result":Ljava/lang/Object;
    :cond_b5
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    :pswitch_data_ba
    .packed-switch 0x0
        :pswitch_49
        :pswitch_3b
        :pswitch_2c
    .end packed-switch
.end method
