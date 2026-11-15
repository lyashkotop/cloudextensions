.class public final Lcom/lagradost/MissavSearch;
.super Ljava/lang/Object;
.source "MissavSearch.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nMissavSearch.kt\nKotlin\n*S Kotlin\n*F\n+ 1 MissavSearch.kt\ncom/lagradost/MissavSearch\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,58:1\n1#2:59\n777#3:60\n873#3,2:61\n1960#3,3:63\n*S KotlinDebug\n*F\n+ 1 MissavSearch.kt\ncom/lagradost/MissavSearch\n*L\n27#1:60\n27#1:61,2\n44#1:63,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0005J\u0014\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00082\u0006\u0010\u0006\u001a\u00020\u0005J\u000e\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0005J\u000e\u0010\u000c\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010\u000f\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0004\u001a\u00020\u0005J\u0018\u0010\u0012\u001a\u0004\u0018\u00010\u00112\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u0004\u001a\u00020\u0005"
    }
    d2 = {
        "Lcom/lagradost/MissavSearch;",
        "",
        "<init>",
        "()V",
        "code",
        "",
        "query",
        "variants",
        "",
        "videoPath",
        "",
        "path",
        "isDetail",
        "doc",
        "Lorg/jsoup/nodes/Document;",
        "matches",
        "card",
        "Lcom/lagradost/VideoCard;",
        "detail"
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
.field public static final INSTANCE:Lcom/lagradost/MissavSearch;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/MissavSearch;

    invoke-direct {v0}, Lcom/lagradost/MissavSearch;-><init>()V

    sput-object v0, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$YXkVj7JKbf5dRRsSukpL49dopxk(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 1

    invoke-static {p0}, Lcom/lagradost/MissavSearch;->matches$lambda$0(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method private static final matches$lambda$0(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "it"    # Ljava/lang/String;

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    sget-object v0, Lkotlin/text/Regex;->Companion:Lkotlin/text/Regex$Companion;

    invoke-virtual {v0, p0}, Lkotlin/text/Regex$Companion;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method


# virtual methods
.method public final code(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p1, "query"    # Ljava/lang/String;

    const-string v0, "query"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https://"

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_65

    .line 11
    :try_start_1c
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v0, p0

    check-cast v0, Lcom/lagradost/MissavSearch;

    .line 59
    .local v0, "$this$code_u24lambda_u240":Lcom/lagradost/MissavSearch;
    const/4 v5, 0x0

    .line 11
    .local v5, "$i$a$-runCatching-MissavSearch$code$raw$1":I
    new-instance v6, Ljava/net/URI;

    move-object v7, p1

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {v7}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v6

    const-string v7, "getPath(...)"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-array v7, v1, [C

    const/16 v8, 0x2f

    aput-char v8, v7, v2

    invoke-static {v6, v7}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v8, v4, v3, v4}, Lkotlin/text/StringsKt;->substringAfterLast$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .end local v0    # "$this$code_u24lambda_u240":Lcom/lagradost/MissavSearch;
    .end local v5    # "$i$a$-runCatching-MissavSearch$code$raw$1":I
    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_4d
    .catchall {:try_start_1c .. :try_end_4d} :catchall_4e

    goto :goto_59

    :catchall_4e
    move-exception v0

    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_59
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_60

    move-object v0, v4

    :cond_60
    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_70

    return-object v4

    .line 12
    :cond_65
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 10
    :cond_70
    nop

    .line 13
    .local v0, "raw":Ljava/lang/String;
    move-object v2, v0

    check-cast v2, Ljava/lang/CharSequence;

    new-instance v5, Lkotlin/text/Regex;

    const-string v6, "[\u2010\u2011\u2012\u2013\u2014\u2212]"

    invoke-direct {v5, v6}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const-string v6, "-"

    invoke-virtual {v5, v2, v6}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v7, "ROOT"

    invoke-static {v5, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "toUpperCase(...)"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .local v2, "text":Ljava/lang/String;
    new-instance v5, Lkotlin/text/Regex;

    const-string v7, "^FC2[\\s_-]*(?:PPV[\\s_-]*)?(\\d{3,10})$"

    invoke-direct {v5, v7}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v7, v2

    check-cast v7, Ljava/lang/CharSequence;

    invoke-virtual {v5, v7}, Lkotlin/text/Regex;->matchEntire(Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;

    move-result-object v5

    if-eqz v5, :cond_bd

    move-object v3, v5

    .local v3, "it":Lkotlin/text/MatchResult;
    const/4 v4, 0x0

    .line 15
    .local v4, "$i$a$-let-MissavSearch$code$1":I
    invoke-interface {v3}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "FC2-PPV-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 17
    .end local v3    # "it":Lkotlin/text/MatchResult;
    .end local v4    # "$i$a$-let-MissavSearch$code$1":I
    :cond_bd
    new-instance v5, Lkotlin/text/Regex;

    const-string v7, "^([0-9]{0,3}[A-Z]{2,12})[\\s_-]*(\\d{2,8})$"

    invoke-direct {v5, v7}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v7, v2

    check-cast v7, Ljava/lang/CharSequence;

    invoke-virtual {v5, v7}, Lkotlin/text/Regex;->matchEntire(Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;

    move-result-object v5

    if-eqz v5, :cond_f2

    move-object v4, v5

    .local v4, "it":Lkotlin/text/MatchResult;
    const/4 v5, 0x0

    .line 18
    .local v5, "$i$a$-let-MissavSearch$code$2":I
    invoke-interface {v4}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v4}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 20
    .end local v4    # "it":Lkotlin/text/MatchResult;
    .end local v5    # "$i$a$-let-MissavSearch$code$2":I
    :cond_f2
    move-object v1, v2

    .line 59
    .local v1, "it":Ljava/lang/String;
    const/4 v3, 0x0

    .line 20
    .local v3, "$i$a$-takeIf-MissavSearch$code$3":I
    new-instance v5, Lkotlin/text/Regex;

    const-string v6, "^\\d{3,10}$"

    invoke-direct {v5, v6}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v6, v1

    check-cast v6, Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v1

    .end local v1    # "it":Ljava/lang/String;
    .end local v3    # "$i$a$-takeIf-MissavSearch$code$3":I
    if-eqz v1, :cond_105

    move-object v4, v2

    :cond_105
    return-object v4
.end method

.method public final detail(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Lcom/lagradost/VideoCard;
    .registers 12
    .param p1, "doc"    # Lorg/jsoup/nodes/Document;
    .param p2, "code"    # Ljava/lang/String;

    const-string v0, "doc"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "code"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    invoke-virtual {p0, p1}, Lcom/lagradost/MissavSearch;->isDetail(Lorg/jsoup/nodes/Document;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_12

    return-object v1

    .line 50
    :cond_12
    const-string v0, "h1"

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_31

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_31

    move-object v3, v0

    .line 59
    .local v3, "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 50
    .local v4, "$i$a$-takeIf-MissavSearch$detail$title$1":I
    move-object v5, v3

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v5}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v5

    xor-int/2addr v5, v2

    .end local v3    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-takeIf-MissavSearch$detail$title$1":I
    if-eqz v5, :cond_2e

    goto :goto_2f

    :cond_2e
    move-object v0, v1

    :goto_2f
    if-nez v0, :cond_3c

    :cond_31
    sget-object v0, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    const-string v3, "og:title"

    invoke-virtual {v0, p1, v3}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3c

    return-object v1

    .line 51
    .local v0, "title":Ljava/lang/String;
    :cond_3c
    sget-object v3, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v4

    const-string v5, "location(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v6, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    const-string v7, "og:image"

    invoke-virtual {v6, p1, v7}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lcom/lagradost/CatalogParser;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_56

    return-object v1

    .line 52
    .local v3, "poster":Ljava/lang/String;
    :cond_56
    sget-object v4, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    const-string v6, "og:type"

    invoke-virtual {v4, p1, v6}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_62

    const-string v4, ""

    .line 53
    .local v4, "type":Ljava/lang/String;
    :cond_62
    const-string v6, "video, #player, .plyr, [data-video-id]"

    invoke-virtual {p1, v6}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v6

    const/4 v7, 0x0

    if-eqz v6, :cond_6c

    goto :goto_6d

    :cond_6c
    move v2, v7

    .line 54
    .local v2, "hasPlayer":Z
    :goto_6d
    const/4 v6, 0x2

    const-string v8, "video"

    invoke-static {v4, v8, v7, v6, v1}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_79

    if-nez v2, :cond_79

    return-object v1

    .line 55
    :cond_79
    new-instance v6, Lcom/lagradost/VideoCard;

    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v6, v0, v7, v3}, Lcom/lagradost/VideoCard;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v5, v6

    .line 59
    .local v5, "it":Lcom/lagradost/VideoCard;
    const/4 v7, 0x0

    .line 55
    .local v7, "$i$a$-takeIf-MissavSearch$detail$1":I
    sget-object v8, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    invoke-virtual {v8, v5, p2}, Lcom/lagradost/MissavSearch;->matches(Lcom/lagradost/VideoCard;Ljava/lang/String;)Z

    move-result v5

    .end local v5    # "it":Lcom/lagradost/VideoCard;
    .end local v7    # "$i$a$-takeIf-MissavSearch$detail$1":I
    if-eqz v5, :cond_90

    move-object v1, v6

    :cond_90
    return-object v1
.end method

.method public final isDetail(Lorg/jsoup/nodes/Document;)Z
    .registers 8
    .param p1, "doc"    # Lorg/jsoup/nodes/Document;

    const-string v0, "doc"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    :try_start_5
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v0, p0

    check-cast v0, Lcom/lagradost/MissavSearch;

    .line 59
    .local v0, "$this$isDetail_u24lambda_u240":Lcom/lagradost/MissavSearch;
    const/4 v1, 0x0

    .line 36
    .local v1, "$i$a$-runCatching-MissavSearch$isDetail$path$1":I
    new-instance v2, Ljava/net/URI;

    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    .end local v0    # "$this$isDetail_u24lambda_u240":Lcom/lagradost/MissavSearch;
    .end local v1    # "$i$a$-runCatching-MissavSearch$isDetail$path$1":I
    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1c
    .catchall {:try_start_5 .. :try_end_1c} :catchall_1d

    goto :goto_28

    :catchall_1d
    move-exception v0

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_28
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_30

    move-object v0, v2

    :cond_30
    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_36

    return v1

    .line 37
    .local v0, "path":Ljava/lang/String;
    :cond_36
    invoke-virtual {p0, v0}, Lcom/lagradost/MissavSearch;->videoPath(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3d

    return v1

    .line 38
    :cond_3d
    const-string v3, "video, #player, .plyr, [data-video-id]"

    invoke-virtual {p1, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-nez v3, :cond_5a

    .line 39
    sget-object v3, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    const-string v4, "og:type"

    invoke-virtual {v3, p1, v4}, Lcom/lagradost/CatalogParser;->meta(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_51

    const-string v3, ""

    :cond_51
    const/4 v4, 0x2

    const-string v5, "video"

    invoke-static {v3, v5, v1, v4, v2}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5b

    :cond_5a
    const/4 v1, 0x1

    .line 38
    :cond_5b
    return v1
.end method

.method public final matches(Lcom/lagradost/VideoCard;Ljava/lang/String;)Z
    .registers 24
    .param p1, "card"    # Lcom/lagradost/VideoCard;
    .param p2, "code"    # Ljava/lang/String;

    move-object/from16 v0, p2

    const-string v1, "card"

    move-object/from16 v2, p1

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "code"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "ROOT"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "toUpperCase(...)"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v5, v1

    check-cast v5, Ljava/lang/CharSequence;

    const/4 v1, 0x1

    new-array v6, v1, [C

    const/16 v7, 0x2d

    const/4 v11, 0x0

    aput-char v7, v6, v11

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x6

    const/4 v10, 0x0

    invoke-static/range {v5 .. v10}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 43
    .local v5, "pieces":Ljava/util/List;
    new-instance v6, Lkotlin/text/Regex;

    move-object v12, v5

    check-cast v12, Ljava/lang/Iterable;

    const-string v7, "[-_\\s]*"

    move-object v13, v7

    check-cast v13, Ljava/lang/CharSequence;

    sget-object v18, Lcom/lagradost/-$$Lambda$MissavSearch$YXkVj7JKbf5dRRsSukpL49dopxk;->INSTANCE:Lcom/lagradost/-$$Lambda$MissavSearch$YXkVj7JKbf5dRRsSukpL49dopxk;

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x1e

    const/16 v20, 0x0

    invoke-static/range {v12 .. v20}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "(?<![A-Z0-9])"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "(?![A-Z0-9])"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 44
    .local v6, "token":Lkotlin/text/Regex;
    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Lcom/lagradost/VideoCard;->getTitle()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    new-instance v9, Ljava/net/URI;

    invoke-virtual/range {p1 .. p1}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v9

    const-string v10, "getPath(...)"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-array v10, v1, [C

    const/16 v12, 0x2f

    aput-char v12, v10, v11

    invoke-static {v9, v10}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-static {v9, v12, v10, v7, v10}, Lkotlin/text/StringsKt;->substringAfterLast$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v8, v1

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$any$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 63
    .local v8, "$i$f$any":I
    instance-of v9, v7, Ljava/util/Collection;

    if-eqz v9, :cond_a6

    move-object v9, v7

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_a6

    move v1, v11

    goto :goto_ce

    .line 64
    :cond_a6
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_aa
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_cd

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .local v10, "element$iv":Ljava/lang/Object;
    move-object v12, v10

    check-cast v12, Ljava/lang/String;

    .local v12, "it":Ljava/lang/String;
    const/4 v13, 0x0

    .line 45
    .local v13, "$i$a$-any-MissavSearch$matches$1":I
    sget-object v14, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v14, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v12, v14}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v14, Ljava/lang/CharSequence;

    invoke-virtual {v6, v14}, Lkotlin/text/Regex;->containsMatchIn(Ljava/lang/CharSequence;)Z

    move-result v12

    .line 64
    .end local v12    # "it":Ljava/lang/String;
    .end local v13    # "$i$a$-any-MissavSearch$matches$1":I
    if-eqz v12, :cond_aa

    goto :goto_ce

    .line 65
    .end local v10    # "element$iv":Ljava/lang/Object;
    :cond_cd
    move v1, v11

    .line 44
    .end local v7    # "$this$any$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$any":I
    :goto_ce
    return v1
.end method

.method public final variants(Ljava/lang/String;)Ljava/util/List;
    .registers 11
    .param p1, "query"    # Ljava/lang/String;
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

    const-string v0, "query"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    invoke-virtual {p0, p1}, Lcom/lagradost/MissavSearch;->code(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1b

    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 24
    .local v0, "code":Ljava/lang/String;
    :cond_1b
    const/4 v1, 0x2

    new-array v7, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v0, v7, v1

    const/4 v8, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    const-string v2, "-"

    const-string v3, ""

    move-object v1, v0

    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v8

    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public final videoPath(Ljava/lang/String;)Z
    .registers 14
    .param p1, "path"    # Ljava/lang/String;

    const-string v0, "path"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    const/4 v0, 0x1

    new-array v1, v0, [C

    const/4 v2, 0x0

    const/16 v3, 0x2f

    aput-char v3, v1, v2

    invoke-static {p1, v1}, Lkotlin/text/StringsKt;->trim(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ljava/lang/CharSequence;

    new-array v5, v0, [C

    aput-char v3, v5, v2

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x6

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 60
    .local v3, "$i$f$filter":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination$iv$iv":Ljava/util/Collection;
    move-object v5, v1

    .local v5, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 61
    .local v6, "$i$f$filterTo":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_30
    :goto_30
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4c

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Ljava/lang/String;

    .local v9, "it":Ljava/lang/String;
    const/4 v10, 0x0

    .line 27
    .local v10, "$i$a$-filter-MissavSearch$videoPath$parts$1":I
    move-object v11, v9

    check-cast v11, Ljava/lang/CharSequence;

    invoke-static {v11}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    xor-int/2addr v11, v0

    .line 61
    .end local v9    # "it":Ljava/lang/String;
    .end local v10    # "$i$a$-filter-MissavSearch$videoPath$parts$1":I
    if-eqz v11, :cond_30

    invoke-interface {v4, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_30

    .line 62
    .end local v8    # "element$iv$iv":Ljava/lang/Object;
    :cond_4c
    nop

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v5    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$filterTo":I
    check-cast v4, Ljava/util/List;

    .line 60
    nop

    .end local v1    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$filter":I
    check-cast v4, Ljava/util/Collection;

    .line 27
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    .line 28
    .local v1, "parts":Ljava/util/List;
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_6f

    check-cast v3, Ljava/lang/CharSequence;

    new-instance v4, Lkotlin/text/Regex;

    const-string v5, "dm\\d*"

    invoke-direct {v4, v5}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v3

    if-ne v3, v0, :cond_6f

    move v3, v0

    goto :goto_70

    :cond_6f
    move v3, v2

    :goto_70
    if-eqz v3, :cond_75

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 29
    :cond_75
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_8e

    check-cast v3, Ljava/lang/CharSequence;

    new-instance v4, Lkotlin/text/Regex;

    const-string v5, "[a-z]{2}"

    invoke-direct {v4, v5}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v3

    if-ne v3, v0, :cond_8e

    move v3, v0

    goto :goto_8f

    :cond_8e
    move v3, v2

    :goto_8f
    if-eqz v3, :cond_94

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 30
    :cond_94
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-eq v3, v0, :cond_9b

    return v2

    .line 31
    :cond_9b
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->single(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 33
    .local v0, "slug":Ljava/lang/String;
    new-instance v2, Lkotlin/text/Regex;

    const-string v3, "(?i)^(?:(?:[0-9]{0,4}[a-z]{2,15}[-_]?\\d{2,10}|fc2[-_]ppv[-_]\\d{3,10}|\\d{6}[-_]\\d{2,6})(?:[-_][a-z0-9_-]+)?|\\d{5,12})$"

    invoke-direct {v2, v3}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v3, v0

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v2

    return v2
.end method
