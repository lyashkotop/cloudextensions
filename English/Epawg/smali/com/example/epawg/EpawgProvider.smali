.class public final Lcom/example/epawg/EpawgProvider;
.super Lcom/lagradost/cloudstream3/MainAPI;
.source "EpawgProvider.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEpawgProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EpawgProvider.kt\ncom/example/epawg/EpawgProvider\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,122:1\n1#2:123\n1586#3:124\n1661#3,3:125\n832#3:128\n862#3,2:129\n*S KotlinDebug\n*F\n+ 1 EpawgProvider.kt\ncom/example/epawg/EpawgProvider\n*L\n61#1:124\n61#1:125,3\n103#1:128\n103#1:129,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u000b\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0016\u0010%\u001a\u00020&2\u0006\u0010\'\u001a\u00020\u0005H\u0082@\u00a2\u0006\u0002\u0010(J\u0010\u0010)\u001a\u00020\u00052\u0006\u0010\'\u001a\u00020\u0005H\u0002J\u0016\u0010*\u001a\u0008\u0012\u0004\u0012\u00020+0 2\u0006\u0010%\u001a\u00020&H\u0002J\u001e\u0010\"\u001a\u00020,2\u0006\u0010-\u001a\u00020.2\u0006\u0010/\u001a\u000200H\u0096@\u00a2\u0006\u0002\u00101J\u001c\u00102\u001a\u0008\u0012\u0004\u0012\u00020+0 2\u0006\u00103\u001a\u00020\u0005H\u0096@\u00a2\u0006\u0002\u0010(J\u0016\u00104\u001a\u0002052\u0006\u0010\'\u001a\u00020\u0005H\u0096@\u00a2\u0006\u0002\u0010(JF\u00106\u001a\u00020\u00162\u0006\u00107\u001a\u00020\u00052\u0006\u00108\u001a\u00020\u00162\u0012\u00109\u001a\u000e\u0012\u0004\u0012\u00020;\u0012\u0004\u0012\u00020<0:2\u0012\u0010=\u001a\u000e\u0012\u0004\u0012\u00020>\u0012\u0004\u0012\u00020<0:H\u0096@\u00a2\u0006\u0002\u0010?R\u001a\u0010\u0004\u001a\u00020\u0005X\u0096\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001a\u0010\n\u001a\u00020\u0005X\u0096\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u0007\"\u0004\u0008\u000c\u0010\tR\u001a\u0010\r\u001a\u00020\u0005X\u0096\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u0007\"\u0004\u0008\u000f\u0010\tR\u001a\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u0011X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0016X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u0014\u0010\u0019\u001a\u00020\u0016X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u0018R\u0014\u0010\u001b\u001a\u00020\u0016X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u0018R\u0014\u0010\u001d\u001a\u00020\u0016X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010\u0018R\u001a\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020!0 X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010#R\u000e\u0010$\u001a\u00020\u0005X\u0082D\u00a2\u0006\u0002\n\u0000\u00a8\u0006@"
    }
    d2 = {
        "Lcom/example/epawg/EpawgProvider;",
        "Lcom/lagradost/cloudstream3/MainAPI;",
        "<init>",
        "()V",
        "mainUrl",
        "",
        "getMainUrl",
        "()Ljava/lang/String;",
        "setMainUrl",
        "(Ljava/lang/String;)V",
        "name",
        "getName",
        "setName",
        "lang",
        "getLang",
        "setLang",
        "supportedTypes",
        "",
        "Lcom/lagradost/cloudstream3/TvType;",
        "getSupportedTypes",
        "()Ljava/util/Set;",
        "hasMainPage",
        "",
        "getHasMainPage",
        "()Z",
        "hasQuickSearch",
        "getHasQuickSearch",
        "hasDownloadSupport",
        "getHasDownloadSupport",
        "hasChromecastSupport",
        "getHasChromecastSupport",
        "mainPage",
        "",
        "Lcom/lagradost/cloudstream3/MainPageData;",
        "getMainPage",
        "()Ljava/util/List;",
        "userAgent",
        "document",
        "Lorg/jsoup/nodes/Document;",
        "url",
        "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "pageUrl",
        "searchResponses",
        "Lcom/lagradost/cloudstream3/SearchResponse;",
        "Lcom/lagradost/cloudstream3/HomePageResponse;",
        "page",
        "",
        "request",
        "Lcom/lagradost/cloudstream3/MainPageRequest;",
        "(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "search",
        "query",
        "load",
        "Lcom/lagradost/cloudstream3/LoadResponse;",
        "loadLinks",
        "data",
        "isCasting",
        "subtitleCallback",
        "Lkotlin/Function1;",
        "Lcom/lagradost/cloudstream3/SubtitleFile;",
        "",
        "callback",
        "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
        "(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
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
        "SMAP\nEpawgProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EpawgProvider.kt\ncom/example/epawg/EpawgProvider\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,122:1\n1#2:123\n1586#3:124\n1661#3,3:125\n832#3:128\n862#3,2:129\n*S KotlinDebug\n*F\n+ 1 EpawgProvider.kt\ncom/example/epawg/EpawgProvider\n*L\n61#1:124\n61#1:125,3\n103#1:128\n103#1:129,2\n*E\n"
    }
.end annotation


# instance fields
.field private final hasChromecastSupport:Z

.field private final hasDownloadSupport:Z

.field private final hasMainPage:Z

.field private final hasQuickSearch:Z

.field private lang:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final mainPage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/MainPageData;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private mainUrl:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private name:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final supportedTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/lagradost/cloudstream3/TvType;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final userAgent:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$6usZTs0M056OAecWuN9N7dX_3Kc(Lcom/example/epawg/EpawgParser$Card;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lcom/example/epawg/EpawgProvider;->searchResponses$lambda$0$0(Lcom/example/epawg/EpawgParser$Card;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$SJXocZ3GGwtXhl7e3S_DjCB_7uM(Lcom/lagradost/cloudstream3/SearchResponse;)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Lcom/example/epawg/EpawgProvider;->load$lambda$0(Lcom/lagradost/cloudstream3/SearchResponse;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .registers 5

    .line 27
    invoke-direct {p0}, Lcom/lagradost/cloudstream3/MainAPI;-><init>()V

    .line 28
    const-string v0, "https://epawg.com"

    iput-object v0, p0, Lcom/example/epawg/EpawgProvider;->mainUrl:Ljava/lang/String;

    .line 29
    const-string v0, "Epawg"

    iput-object v0, p0, Lcom/example/epawg/EpawgProvider;->name:Ljava/lang/String;

    .line 30
    const-string v0, "en"

    iput-object v0, p0, Lcom/example/epawg/EpawgProvider;->lang:Ljava/lang/String;

    .line 31
    sget-object v0, Lcom/lagradost/cloudstream3/TvType;->NSFW:Lcom/lagradost/cloudstream3/TvType;

    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/example/epawg/EpawgProvider;->supportedTypes:Ljava/util/Set;

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/example/epawg/EpawgProvider;->hasMainPage:Z

    .line 34
    iput-boolean v0, p0, Lcom/example/epawg/EpawgProvider;->hasDownloadSupport:Z

    .line 37
    const/4 v1, 0x2

    new-array v1, v1, [Lkotlin/Pair;

    const-string v2, "/latest-updates/"

    const-string v3, "Latest"

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "/most-popular/"

    const-string v3, "Popular"

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v1, v0

    invoke-static {v1}, Lcom/lagradost/cloudstream3/MainAPIKt;->mainPageOf([Lkotlin/Pair;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/epawg/EpawgProvider;->mainPage:Ljava/util/List;

    .line 39
    const-string v0, "Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    iput-object v0, p0, Lcom/example/epawg/EpawgProvider;->userAgent:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public static final synthetic access$document(Lcom/example/epawg/EpawgProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4
    .param p0, "$this"    # Lcom/example/epawg/EpawgProvider;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/example/epawg/EpawgProvider;->document(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getUserAgent$p(Lcom/example/epawg/EpawgProvider;)Ljava/lang/String;
    .registers 2
    .param p0, "$this"    # Lcom/example/epawg/EpawgProvider;

    .line 27
    iget-object v0, p0, Lcom/example/epawg/EpawgProvider;->userAgent:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$searchResponses(Lcom/example/epawg/EpawgProvider;Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 3
    .param p0, "$this"    # Lcom/example/epawg/EpawgProvider;
    .param p1, "document"    # Lorg/jsoup/nodes/Document;

    .line 27
    invoke-direct {p0, p1}, Lcom/example/epawg/EpawgProvider;->searchResponses(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method private final document(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 28
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lorg/jsoup/nodes/Document;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v0, p2

    instance-of v0, v0, Lcom/example/epawg/EpawgProvider$document$1;

    if-nez v0, :cond_d

    invoke-static/range {p1 .. p1}, Lcom/videobundle/fixes/MetadataSupport;->cached(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    if-eqz v0, :cond_d

    return-object v0

    :cond_d
    move-object/from16 v1, p2

    instance-of v0, v1, Lcom/example/epawg/EpawgProvider$document$1;

    if-eqz v0, :cond_25

    move-object v0, v1

    check-cast v0, Lcom/example/epawg/EpawgProvider$document$1;

    iget v2, v0, Lcom/example/epawg/EpawgProvider$document$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_25

    iget v2, v0, Lcom/example/epawg/EpawgProvider$document$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v0, Lcom/example/epawg/EpawgProvider$document$1;->label:I

    move-object/from16 v2, p0

    goto :goto_2c

    :cond_25
    new-instance v0, Lcom/example/epawg/EpawgProvider$document$1;

    move-object/from16 v2, p0

    invoke-direct {v0, v2, v1}, Lcom/example/epawg/EpawgProvider$document$1;-><init>(Lcom/example/epawg/EpawgProvider;Lkotlin/coroutines/Continuation;)V

    :goto_2c
    move-object v15, v0

    .local v15, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v14, v15, Lcom/example/epawg/EpawgProvider$document$1;->result:Ljava/lang/Object;

    .local v14, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 42
    iget v3, v15, Lcom/example/epawg/EpawgProvider$document$1;->label:I

    const/4 v12, 0x1

    const/16 v20, 0x0

    packed-switch v3, :pswitch_data_15e

    .end local v14    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v14    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :pswitch_43
    move-object/from16 v0, p0

    .local v0, "this":Lcom/example/epawg/EpawgProvider;
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, v0

    move-object/from16 v23, v14

    move-object/from16 v24, v15

    const/16 v21, 0x1

    goto :goto_bb

    .end local v0    # "this":Lcom/example/epawg/EpawgProvider;
    :pswitch_50
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v13, p0

    .local v13, "this":Lcom/example/epawg/EpawgProvider;
    move-object/from16 v4, p1

    .line 43
    .local v4, "url":Ljava/lang/String;
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v3

    const/4 v5, 0x2

    new-array v5, v5, [Lkotlin/Pair;

    .end local v4    # "url":Ljava/lang/String;
    const-string v6, "User-Agent"

    iget-object v7, v13, Lcom/example/epawg/EpawgProvider;->userAgent:Ljava/lang/String;

    invoke-static {v6, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v6

    aput-object v6, v5, v20

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13}, Lcom/example/epawg/EpawgProvider;->getMainUrl()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x2f

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Referer"

    invoke-static {v7, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v6

    aput-object v6, v5, v12

    invoke-static {v5}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v5

    iput v12, v15, Lcom/example/epawg/EpawgProvider$document$1;->label:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v16, 0x0

    move-object/from16 v22, v13

    const/16 v21, 0x1

    .end local v13    # "this":Lcom/example/epawg/EpawgProvider;
    .local v22, "this":Lcom/example/epawg/EpawgProvider;
    move-wide/from16 v12, v16

    const/16 v16, 0x0

    move-object/from16 v23, v14

    .end local v14    # "$result":Ljava/lang/Object;
    .local v23, "$result":Ljava/lang/Object;
    move-object/from16 v14, v16

    const/16 v16, 0x0

    move-object/from16 v24, v15

    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .local v24, "$continuation":Lkotlin/coroutines/Continuation;
    move/from16 v15, v16

    const/16 v16, 0x0

    const/16 v18, 0xffc

    const/16 v19, 0x0

    move-object/from16 v17, v24

    invoke-static/range {v3 .. v19}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v0, :cond_b9

    .line 42
    .end local v22    # "this":Lcom/example/epawg/EpawgProvider;
    invoke-static/range {v0 .. v0}, Lcom/videobundle/fixes/MetadataSupport;->remember(Ljava/lang/Object;)V

    return-object v0

    .line 43
    .restart local v22    # "this":Lcom/example/epawg/EpawgProvider;
    :cond_b9
    move-object/from16 v3, v22

    .line 42
    .end local v22    # "this":Lcom/example/epawg/EpawgProvider;
    .local v3, "this":Lcom/example/epawg/EpawgProvider;
    :goto_bb
    move-object v0, v14

    check-cast v0, Lcom/lagradost/nicehttp/NiceResponse;

    .line 44
    .local v0, "response":Lcom/lagradost/nicehttp/NiceResponse;
    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v4

    const/16 v5, 0xc8

    if-gt v5, v4, :cond_cc

    const/16 v5, 0x12c

    if-ge v4, v5, :cond_cc

    const/4 v12, 0x1

    goto :goto_cd

    :cond_cc
    const/4 v12, 0x0

    :goto_cd
    if-eqz v12, :cond_140

    .line 45
    invoke-static {v0}, Lcom/example/websites/SourceDocumentKt;->sourceDocument(Lcom/lagradost/nicehttp/NiceResponse;)Lorg/jsoup/nodes/Document;

    move-result-object v4

    .line 47
    .end local v0    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    .local v4, "result":Lorg/jsoup/nodes/Document;
    :try_start_d3
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v0, v3

    check-cast v0, Lcom/example/epawg/EpawgProvider;

    .line 123
    const/4 v0, 0x0

    .line 47
    .local v0, "$i$a$-runCatching-EpawgProvider$document$2":I
    new-instance v5, Ljava/net/URI;

    invoke-virtual {v4}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .end local v0    # "$i$a$-runCatching-EpawgProvider$document$2":I
    invoke-static {v5}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_e6
    .catchall {:try_start_d3 .. :try_end_e6} :catchall_e7

    goto :goto_f2

    :catchall_e7
    move-exception v0

    sget-object v5, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_f2
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f9

    const/4 v0, 0x0

    :cond_f9
    check-cast v0, Ljava/net/URI;

    if-eqz v0, :cond_13c

    .local v0, "uri":Ljava/net/URI;
    const/4 v5, 0x0

    .line 48
    .local v5, "$i$a$-let-EpawgProvider$document$3":I
    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v6

    const-string v7, "https"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13a

    const-string v6, "epawg.com"

    const-string v7, "www.epawg.com"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13a

    .line 49
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "https://"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/example/epawg/EpawgProvider;->setMainUrl(Ljava/lang/String;)V

    .line 51
    .end local v0    # "uri":Ljava/net/URI;
    .end local v3    # "this":Lcom/example/epawg/EpawgProvider;
    :cond_13a
    nop

    .line 47
    .end local v5    # "$i$a$-let-EpawgProvider$document$3":I
    nop

    .line 52
    :cond_13c
    invoke-static/range {v4 .. v4}, Lcom/videobundle/fixes/MetadataSupport;->remember(Ljava/lang/Object;)V

    return-object v4

    .line 44
    .end local v4    # "result":Lorg/jsoup/nodes/Document;
    .local v0, "response":Lcom/lagradost/nicehttp/NiceResponse;
    .restart local v3    # "this":Lcom/example/epawg/EpawgProvider;
    :cond_140
    new-instance v4, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Epawg: HTTP "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    throw v4

    nop

    :pswitch_data_15e
    .packed-switch 0x0
        :pswitch_50
        :pswitch_43
    .end packed-switch
.end method

.method private static final load$lambda$0(Lcom/lagradost/cloudstream3/SearchResponse;)Ljava/lang/String;
    .registers 2
    .param p0, "it"    # Lcom/lagradost/cloudstream3/SearchResponse;

    .line 87
    invoke-interface {p0}, Lcom/lagradost/cloudstream3/SearchResponse;->getUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final pageUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "url"    # Ljava/lang/String;

    .line 56
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 57
    .local v0, "uri":Ljava/net/URI;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/example/epawg/EpawgProvider;->getMainUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    if-nez v2, :cond_1b

    move-object v2, v3

    :cond_1b
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3e

    .line 123
    nop

    .local v2, "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 57
    .local v4, "$i$a$-let-EpawgProvider$pageUrl$1":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v6, 0x3f

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .end local v2    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-let-EpawgProvider$pageUrl$1":I
    if-nez v2, :cond_3d

    goto :goto_3e

    :cond_3d
    move-object v3, v2

    :cond_3e
    :goto_3e
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private final searchResponses(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 20
    .param p1, "document"    # Lorg/jsoup/nodes/Document;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            ")",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;"
        }
    .end annotation

    .line 61
    sget-object v0, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/example/epawg/EpawgParser;->cards(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 124
    .local v2, "$i$f$map":I
    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v0, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v3, Ljava/util/Collection;

    .local v3, "destination$iv$iv":Ljava/util/Collection;
    move-object v4, v0

    .local v4, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 125
    .local v5, "$i$f$mapTo":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 126
    .local v7, "item$iv$iv":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Lcom/example/epawg/EpawgParser$Card;

    .local v8, "card":Lcom/example/epawg/EpawgParser$Card;
    const/4 v9, 0x0

    .line 62
    .local v9, "$i$a$-map-EpawgProvider$searchResponses$1":I
    move-object/from16 v10, p0

    check-cast v10, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {v8}, Lcom/example/epawg/EpawgParser$Card;->getTitle()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8}, Lcom/example/epawg/EpawgParser$Card;->getUrl()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Lcom/lagradost/cloudstream3/TvType;->NSFW:Lcom/lagradost/cloudstream3/TvType;

    new-instance v15, Lcom/example/epawg/EpawgProvider$$ExternalSyntheticLambda1;

    invoke-direct {v15, v8}, Lcom/example/epawg/EpawgProvider$$ExternalSyntheticLambda1;-><init>(Lcom/example/epawg/EpawgParser$Card;)V

    const/16 v16, 0x8

    const/16 v17, 0x0

    const/4 v14, 0x0

    invoke-static/range {v10 .. v17}, Lcom/streambundle/v38/DetailMetadata;->searchCard(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;

    move-result-object v10

    .line 64
    nop

    .line 126
    .end local v8    # "card":Lcom/example/epawg/EpawgParser$Card;
    .end local v9    # "$i$a$-map-EpawgProvider$searchResponses$1":I
    invoke-interface {v3, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 127
    .end local v7    # "item$iv$iv":Ljava/lang/Object;
    :cond_4d
    nop

    .end local v3    # "destination$iv$iv":Ljava/util/Collection;
    .end local v4    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$mapTo":I
    check-cast v3, Ljava/util/List;

    .line 124
    nop

    .line 65
    .end local v0    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$map":I
    invoke-static/range {v3 .. v3}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    return-object v3
.end method

.method private static final searchResponses$lambda$0$0(Lcom/example/epawg/EpawgParser$Card;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;
    .registers 3
    .param p0, "$card"    # Lcom/example/epawg/EpawgParser$Card;
    .param p1, "$this$newMovieSearchResponse"    # Lcom/lagradost/cloudstream3/MovieSearchResponse;

    .line 63
    invoke-virtual {p0}, Lcom/example/epawg/EpawgParser$Card;->getPoster()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 64
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public detailUnscreened(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 16
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/cloudstream3/LoadResponse;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    instance-of v0, p2, Lcom/example/epawg/EpawgProvider$load$1;

    if-eqz v0, :cond_14

    move-object v0, p2

    check-cast v0, Lcom/example/epawg/EpawgProvider$load$1;

    iget v1, v0, Lcom/example/epawg/EpawgProvider$load$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_14

    iget v1, v0, Lcom/example/epawg/EpawgProvider$load$1;->label:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/example/epawg/EpawgProvider$load$1;->label:I

    goto :goto_19

    :cond_14
    new-instance v0, Lcom/example/epawg/EpawgProvider$load$1;

    invoke-direct {v0, p0, p2}, Lcom/example/epawg/EpawgProvider$load$1;-><init>(Lcom/example/epawg/EpawgProvider;Lkotlin/coroutines/Continuation;)V

    .local v0, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_19
    iget-object v8, v0, Lcom/example/epawg/EpawgProvider$load$1;->result:Ljava/lang/Object;

    .local v8, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v9

    .line 80
    iget v1, v0, Lcom/example/epawg/EpawgProvider$load$1;->label:I

    const/4 v2, 0x1

    packed-switch v1, :pswitch_data_e8

    .end local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v8    # "$result":Ljava/lang/Object;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .restart local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v8    # "$result":Ljava/lang/Object;
    :pswitch_2d
    invoke-static {v8}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object p1, v8

    goto/16 :goto_db

    :pswitch_33
    move-object p1, p0

    .local p1, "this":Lcom/example/epawg/EpawgProvider;
    iget-object v1, v0, Lcom/example/epawg/EpawgProvider$load$1;->L$0:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .local v1, "current":Ljava/lang/String;
    invoke-static {v8}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v10, v1

    move-object v3, v8

    goto :goto_57

    .end local v1    # "current":Ljava/lang/String;
    .end local p1    # "this":Lcom/example/epawg/EpawgProvider;
    :pswitch_3e
    invoke-static {v8}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v1, p0

    .line 81
    .local v1, "this":Lcom/example/epawg/EpawgProvider;
    .local p1, "url":Ljava/lang/String;
    invoke-direct {v1, p1}, Lcom/example/epawg/EpawgProvider;->pageUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 82
    .local p1, "current":Ljava/lang/String;
    iput-object p1, v0, Lcom/example/epawg/EpawgProvider$load$1;->L$0:Ljava/lang/Object;

    iput v2, v0, Lcom/example/epawg/EpawgProvider$load$1;->label:I

    invoke-direct {v1, p1, v0}, Lcom/example/epawg/EpawgProvider;->document(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v9, :cond_55

    .line 80
    .end local v1    # "this":Lcom/example/epawg/EpawgProvider;
    invoke-static/range {v9 .. v9}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    return-object v9

    .line 82
    .restart local v1    # "this":Lcom/example/epawg/EpawgProvider;
    :cond_55
    move-object v10, p1

    move-object p1, v1

    .line 80
    .end local v1    # "this":Lcom/example/epawg/EpawgProvider;
    .local v10, "current":Ljava/lang/String;
    .local p1, "this":Lcom/example/epawg/EpawgProvider;
    :goto_57
    move-object v1, v3

    check-cast v1, Lorg/jsoup/nodes/Document;

    .line 83
    .local v1, "document":Lorg/jsoup/nodes/Document;
    nop

    .line 84
    nop

    .line 83
    const-string v3, "h1"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_e0

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_e0

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 84
    if-eqz v3, :cond_e0

    .line 83
    nop

    .line 84
    move-object v4, v3

    .line 123
    .local v4, "p0":Ljava/lang/String;
    const/4 v5, 0x0

    .line 84
    .local v5, "$i$a$-takeIf-EpawgProvider$load$title$1":I
    move-object v6, v4

    check-cast v6, Ljava/lang/CharSequence;

    invoke-static {v6}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_83

    goto :goto_84

    .end local v4    # "p0":Ljava/lang/String;
    :cond_83
    const/4 v2, 0x0

    .end local v5    # "$i$a$-takeIf-EpawgProvider$load$title$1":I
    :goto_84
    const/4 v4, 0x0

    if-eqz v2, :cond_89

    move-object v2, v3

    goto :goto_8a

    :cond_89
    move-object v2, v4

    .line 83
    :goto_8a
    if-eqz v2, :cond_e0

    .line 85
    .local v2, "title":Ljava/lang/String;
    const-string v3, "video[poster]"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_9c

    const-string v5, "poster"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_ac

    .line 86
    :cond_9c
    const-string v3, "meta[property=og:image]"

    invoke-virtual {v1, v3}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_ab

    const-string v5, "content"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_ac

    :cond_ab
    move-object v3, v4

    .line 85
    :cond_ac
    :goto_ac
    move-object v11, v3

    .line 87
    .local v11, "poster":Ljava/lang/String;
    invoke-direct {p1, v1}, Lcom/example/epawg/EpawgProvider;->searchResponses(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v3

    new-instance v5, Lcom/example/epawg/EpawgProvider$$ExternalSyntheticLambda0;

    invoke-direct {v5}, Lcom/example/epawg/EpawgProvider$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v3, v10, v5}, Lcom/example/websites/SourceDocumentKt;->relatedResults(Ljava/util/List;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ljava/util/List;

    move-result-object v12

    .line 88
    .end local v1    # "document":Lorg/jsoup/nodes/Document;
    .local v12, "related":Ljava/util/List;
    move-object v1, p1

    check-cast v1, Lcom/lagradost/cloudstream3/MainAPI;

    sget-object v5, Lcom/lagradost/cloudstream3/TvType;->NSFW:Lcom/lagradost/cloudstream3/TvType;

    new-instance v3, Lcom/example/epawg/EpawgProvider$load$2;

    invoke-direct {v3, v12, v11, v4}, Lcom/example/epawg/EpawgProvider$load$2;-><init>(Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    move-object v6, v3

    check-cast v6, Lkotlin/jvm/functions/Function2;

    iput-object v4, v0, Lcom/example/epawg/EpawgProvider$load$1;->L$0:Ljava/lang/Object;

    const/4 v3, 0x2

    iput v3, v0, Lcom/example/epawg/EpawgProvider$load$1;->label:I

    move-object v3, v10

    move-object v4, v5

    move-object v5, v10

    move-object v7, v0

    invoke-static/range {v1 .. v7}, Lcom/lagradost/cloudstream3/MainAPIKt;->newMovieLoadResponse(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;Ljava/lang/String;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local v2    # "title":Ljava/lang/String;
    .end local v10    # "current":Ljava/lang/String;
    .end local v11    # "poster":Ljava/lang/String;
    .end local v12    # "related":Ljava/util/List;
    .end local p1    # "this":Lcom/example/epawg/EpawgProvider;
    if-ne p1, v9, :cond_db

    .line 80
    invoke-static/range {v9 .. v9}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    return-object v9

    .line 88
    :cond_db
    :goto_db
    invoke-static/range {p1 .. p1}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 84
    :cond_e0
    new-instance p1, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    const-string v1, "Video title not found"

    invoke-direct {p1, v1}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_data_e8
    .packed-switch 0x0
        :pswitch_3e
        :pswitch_33
        :pswitch_2d
    .end packed-switch
.end method

.method public getHasChromecastSupport()Z
    .registers 2

    .line 35
    iget-boolean v0, p0, Lcom/example/epawg/EpawgProvider;->hasChromecastSupport:Z

    return v0
.end method

.method public getHasDownloadSupport()Z
    .registers 2

    .line 34
    iget-boolean v0, p0, Lcom/example/epawg/EpawgProvider;->hasDownloadSupport:Z

    return v0
.end method

.method public getHasMainPage()Z
    .registers 2

    .line 32
    iget-boolean v0, p0, Lcom/example/epawg/EpawgProvider;->hasMainPage:Z

    return v0
.end method

.method public getHasQuickSearch()Z
    .registers 2

    .line 33
    iget-boolean v0, p0, Lcom/example/epawg/EpawgProvider;->hasQuickSearch:Z

    return v0
.end method

.method public getLang()Ljava/lang/String;
    .registers 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/example/epawg/EpawgProvider;->lang:Ljava/lang/String;

    return-object v0
.end method

.method public getMainPage(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4

    invoke-static/range {p0 .. p3}, Lcom/streambundle/v38/Screening;->home(Ljava/lang/Object;ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getMainPage()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/MainPageData;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/example/epawg/EpawgProvider;->mainPage:Ljava/util/List;

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getMainUrl()Ljava/lang/String;
    .registers 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 28
    iget-object v0, p0, Lcom/example/epawg/EpawgProvider;->mainUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 29
    iget-object v0, p0, Lcom/example/epawg/EpawgProvider;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSupportedTypes()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/lagradost/cloudstream3/TvType;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 31
    iget-object v0, p0, Lcom/example/epawg/EpawgProvider;->supportedTypes:Ljava/util/Set;

    return-object v0
.end method

.method public homeUnscreened(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 14
    .param p2    # Lcom/lagradost/cloudstream3/MainPageRequest;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/lagradost/cloudstream3/MainPageRequest;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/cloudstream3/HomePageResponse;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    instance-of v0, p3, Lcom/example/epawg/EpawgProvider$getMainPage$1;

    if-eqz v0, :cond_14

    move-object v0, p3

    check-cast v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;

    iget v1, v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_14

    iget v1, v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;->label:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;->label:I

    goto :goto_19

    :cond_14
    new-instance v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;

    invoke-direct {v0, p0, p3}, Lcom/example/epawg/EpawgProvider$getMainPage$1;-><init>(Lcom/example/epawg/EpawgProvider;Lkotlin/coroutines/Continuation;)V

    .local v0, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_19
    iget-object v1, v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;->result:Ljava/lang/Object;

    .local v1, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 67
    iget v3, v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;->label:I

    const/4 v4, 0x1

    packed-switch v3, :pswitch_data_bc

    .end local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v1    # "$result":Ljava/lang/Object;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .restart local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v1    # "$result":Ljava/lang/Object;
    :pswitch_2d
    move-object p1, p0

    .local p1, "this":Lcom/example/epawg/EpawgProvider;
    iget-object p2, v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;->L$0:Ljava/lang/Object;

    check-cast p2, Lcom/lagradost/cloudstream3/MainPageRequest;

    .local p2, "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p1

    move-object p1, v1

    goto :goto_9a

    .end local p1    # "this":Lcom/example/epawg/EpawgProvider;
    .end local p2    # "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    :pswitch_38
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p0

    .line 68
    .local v3, "this":Lcom/example/epawg/EpawgProvider;
    .local p1, "page":I
    .restart local p2    # "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcom/lagradost/cloudstream3/MainPageRequest;->getData()Ljava/lang/String;

    move-result-object v6

    new-array v7, v4, [C

    const/4 v8, 0x0

    const/16 v9, 0x2f

    aput-char v9, v7, v8

    invoke-static {v6, v7}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-le p1, v4, :cond_6c

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_6e

    .end local p1    # "page":I
    :cond_6c
    const-string v6, "/"

    :goto_6e
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 69
    .local p1, "path":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/example/epawg/EpawgProvider;->getMainUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object p2, v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;->L$0:Ljava/lang/Object;

    iput v4, v0, Lcom/example/epawg/EpawgProvider$getMainPage$1;->label:I

    invoke-direct {v3, v5, v0}, Lcom/example/epawg/EpawgProvider;->document(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "path":Ljava/lang/String;
    if-ne p1, v2, :cond_9a

    .line 67
    .end local v3    # "this":Lcom/example/epawg/EpawgProvider;
    invoke-static/range {v2 .. v2}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .restart local v3    # "this":Lcom/example/epawg/EpawgProvider;
    :cond_9a
    :goto_9a
    check-cast p1, Lorg/jsoup/nodes/Document;

    .line 71
    .local p1, "document":Lorg/jsoup/nodes/Document;
    new-instance v2, Lcom/lagradost/cloudstream3/HomePageList;

    invoke-virtual {p2}, Lcom/lagradost/cloudstream3/MainPageRequest;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, p1}, Lcom/example/epawg/EpawgProvider;->searchResponses(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v2, v5, v6, v4}, Lcom/lagradost/cloudstream3/HomePageList;-><init>(Ljava/lang/String;Ljava/util/List;Z)V

    .line 72
    sget-object v4, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    invoke-virtual {v4, p1}, Lcom/example/epawg/EpawgParser;->hasNext(Lorg/jsoup/nodes/Document;)Z

    move-result v4

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 70
    invoke-static {v2, v4}, Lcom/lagradost/cloudstream3/MainAPIKt;->newHomePageResponse(Lcom/lagradost/cloudstream3/HomePageList;Ljava/lang/Boolean;)Lcom/lagradost/cloudstream3/HomePageResponse;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    :pswitch_data_bc
    .packed-switch 0x0
        :pswitch_38
        :pswitch_2d
    .end packed-switch
.end method

.method public linksOriginal48(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 22
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5, "$completion"    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/lagradost/cloudstream3/SubtitleFile;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    invoke-static/range {p4 .. p4}, Lcom/streambundle/Unified;->links(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;

    move-result-object p4

    move-object/from16 v0, p5

    instance-of v1, v0, Lcom/example/epawg/EpawgProvider$loadLinks$1;

    if-eqz v1, :cond_1c

    move-object v1, v0

    check-cast v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;

    iget v2, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_1c

    iget v2, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->label:I

    move-object/from16 v2, p0

    goto :goto_23

    :cond_1c
    new-instance v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;

    move-object/from16 v2, p0

    invoke-direct {v1, v2, v0}, Lcom/example/epawg/EpawgProvider$loadLinks$1;-><init>(Lcom/example/epawg/EpawgProvider;Lkotlin/coroutines/Continuation;)V

    .local v1, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_23
    iget-object v3, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->result:Ljava/lang/Object;

    .local v3, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v4

    .line 94
    iget v5, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->label:I

    const/4 v6, 0x1

    packed-switch v5, :pswitch_data_16a

    .end local v1    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v3    # "$result":Ljava/lang/Object;
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v1    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v3    # "$result":Ljava/lang/Object;
    :pswitch_37
    move-object/from16 v5, p0

    .local v5, "this":Lcom/example/epawg/EpawgProvider;
    iget-object v7, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$3:Ljava/lang/Object;

    check-cast v7, Lkotlin/jvm/functions/Function1;

    iget-object v8, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$2:Ljava/lang/Object;

    check-cast v8, Ljava/util/Iterator;

    iget-object v9, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    .local v9, "referer":Ljava/lang/String;
    iget-object v10, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    check-cast v10, Lkotlin/jvm/functions/Function1;

    .local v10, "callback":Lkotlin/jvm/functions/Function1;
    invoke-static {v3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v11, v5

    move-object v13, v8

    move-object v14, v9

    move-object v12, v10

    move-object v9, v3

    move-object v10, v4

    goto/16 :goto_154

    .end local v5    # "this":Lcom/example/epawg/EpawgProvider;
    .end local v9    # "referer":Ljava/lang/String;
    .end local v10    # "callback":Lkotlin/jvm/functions/Function1;
    :pswitch_54
    move-object/from16 v5, p0

    .restart local v5    # "this":Lcom/example/epawg/EpawgProvider;
    iget-object v7, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    check-cast v7, Lkotlin/jvm/functions/Function1;

    .local v7, "callback":Lkotlin/jvm/functions/Function1;
    iget-object v8, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    .local v8, "data":Ljava/lang/String;
    invoke-static {v3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v9, v3

    goto :goto_7d

    .end local v5    # "this":Lcom/example/epawg/EpawgProvider;
    .end local v7    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v8    # "data":Ljava/lang/String;
    :pswitch_63
    invoke-static {v3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v5, p0

    .restart local v5    # "this":Lcom/example/epawg/EpawgProvider;
    move-object/from16 v7, p4

    .restart local v7    # "callback":Lkotlin/jvm/functions/Function1;
    move-object/from16 v8, p1

    .line 101
    .restart local v8    # "data":Ljava/lang/String;
    invoke-direct {v5, v8}, Lcom/example/epawg/EpawgProvider;->pageUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v8, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    iput-object v7, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    iput v6, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->label:I

    invoke-direct {v5, v9, v1}, Lcom/example/epawg/EpawgProvider;->document(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v4, :cond_7d

    .line 94
    .end local v5    # "this":Lcom/example/epawg/EpawgProvider;
    return-object v4

    .restart local v5    # "this":Lcom/example/epawg/EpawgProvider;
    :cond_7d
    :goto_7d
    check-cast v9, Lorg/jsoup/nodes/Document;

    .line 102
    .local v9, "document":Lorg/jsoup/nodes/Document;
    invoke-virtual {v9}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v10

    check-cast v10, Ljava/lang/CharSequence;

    invoke-static {v10}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_91

    .line 123
    const/4 v10, 0x0

    .line 102
    .local v10, "$i$a$-ifBlank-EpawgProvider$loadLinks$referer$1":I
    invoke-direct {v5, v8}, Lcom/example/epawg/EpawgProvider;->pageUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .end local v8    # "data":Ljava/lang/String;
    .end local v10    # "$i$a$-ifBlank-EpawgProvider$loadLinks$referer$1":I
    nop

    :cond_91
    move-object v8, v10

    check-cast v8, Ljava/lang/String;

    .line 103
    .local v8, "referer":Ljava/lang/String;
    sget-object v10, Lcom/example/epawg/EpawgParser;->INSTANCE:Lcom/example/epawg/EpawgParser;

    invoke-virtual {v10, v9}, Lcom/example/epawg/EpawgParser;->streams(Lorg/jsoup/nodes/Document;)Ljava/util/List;

    move-result-object v10

    move-object v9, v10

    check-cast v9, Ljava/lang/Iterable;

    .local v9, "$this$filterNot$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 128
    .local v10, "$i$f$filterNot":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    check-cast v11, Ljava/util/Collection;

    .local v9, "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    .local v11, "destination$iv$iv":Ljava/util/Collection;
    const/4 v12, 0x0

    .line 129
    .local v12, "$i$f$filterNotTo":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .end local v9    # "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    :goto_aa
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_cb

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .local v9, "element$iv$iv":Ljava/lang/Object;
    move-object v14, v9

    check-cast v14, Lcom/example/epawg/EpawgParser$Stream;

    .local v14, "it":Lcom/example/epawg/EpawgParser$Stream;
    const/4 v15, 0x0

    .line 103
    .local v15, "$i$a$-filterNot-EpawgProvider$loadLinks$streams$1":I
    sget-object v6, Lcom/example/tubesafari/TubeSafariParser;->INSTANCE:Lcom/example/tubesafari/TubeSafariParser;

    invoke-virtual {v14}, Lcom/example/epawg/EpawgParser$Stream;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/example/tubesafari/TubeSafariParser;->isExcluded(Ljava/lang/String;)Z

    move-result v0

    .line 129
    .end local v14    # "it":Lcom/example/epawg/EpawgParser$Stream;
    .end local v15    # "$i$a$-filterNot-EpawgProvider$loadLinks$streams$1":I
    if-nez v0, :cond_c7

    invoke-interface {v11, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_c7
    move-object/from16 v0, p5

    const/4 v6, 0x1

    goto :goto_aa

    .line 130
    .end local v9    # "element$iv$iv":Ljava/lang/Object;
    :cond_cb
    nop

    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v12    # "$i$f$filterNotTo":I
    move-object v0, v11

    check-cast v0, Ljava/util/List;

    .line 128
    nop

    .line 103
    .end local v10    # "$i$f$filterNot":I
    nop

    .line 104
    .local v0, "streams":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_162

    .line 105
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move-object/from16 v0, p5

    move-object v9, v3

    move-object v10, v4

    move-object v11, v5

    move-object v13, v6

    move-object v12, v7

    move-object v14, v8

    .end local v3    # "$result":Ljava/lang/Object;
    .end local v5    # "this":Lcom/example/epawg/EpawgProvider;
    .end local v7    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v8    # "referer":Ljava/lang/String;
    .end local p5    # "$completion":Lkotlin/coroutines/Continuation;
    .local v0, "$completion":Lkotlin/coroutines/Continuation;
    .local v9, "$result":Ljava/lang/Object;
    .local v11, "this":Lcom/example/epawg/EpawgProvider;
    .local v12, "callback":Lkotlin/jvm/functions/Function1;
    .local v14, "referer":Ljava/lang/String;
    :goto_e3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15a

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Lcom/example/epawg/EpawgParser$Stream;

    .line 106
    .local v15, "stream":Lcom/example/epawg/EpawgParser$Stream;
    nop

    .line 107
    nop

    .line 108
    invoke-virtual {v11}, Lcom/example/epawg/EpawgProvider;->getName()Ljava/lang/String;

    move-result-object v3

    .line 109
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11}, Lcom/example/epawg/EpawgProvider;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v15}, Lcom/example/epawg/EpawgParser$Stream;->getLabel()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 110
    invoke-virtual {v15}, Lcom/example/epawg/EpawgParser$Stream;->getUrl()Ljava/lang/String;

    move-result-object v5

    .line 111
    new-instance v6, Ljava/net/URI;

    invoke-virtual {v15}, Lcom/example/epawg/EpawgParser$Stream;->getUrl()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v6

    const-string v7, ".m3u8"

    const/4 v8, 0x0

    move-object/from16 p1, v0

    .end local v0    # "$completion":Lkotlin/coroutines/Continuation;
    .local p1, "$completion":Lkotlin/coroutines/Continuation;
    const/4 v0, 0x2

    const/4 v2, 0x0

    invoke-static {v6, v7, v8, v0, v2}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_136

    sget-object v6, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    goto :goto_138

    :cond_136
    sget-object v6, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->VIDEO:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    .line 107
    :goto_138
    new-instance v7, Lcom/example/epawg/EpawgProvider$loadLinks$2;

    invoke-direct {v7, v14, v15, v11, v2}, Lcom/example/epawg/EpawgProvider$loadLinks$2;-><init>(Ljava/lang/String;Lcom/example/epawg/EpawgParser$Stream;Lcom/example/epawg/EpawgProvider;Lkotlin/coroutines/Continuation;)V

    check-cast v7, Lkotlin/jvm/functions/Function2;

    iput-object v12, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    iput-object v14, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    iput-object v13, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$2:Ljava/lang/Object;

    iput-object v12, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->L$3:Ljava/lang/Object;

    iput v0, v1, Lcom/example/epawg/EpawgProvider$loadLinks$1;->label:I

    move-object v8, v1

    invoke-static/range {v3 .. v8}, Lcom/lagradost/cloudstream3/utils/ExtractorApiKt;->newExtractorLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    .end local v15    # "stream":Lcom/example/epawg/EpawgParser$Stream;
    if-ne v3, v10, :cond_151

    .line 94
    .end local v11    # "this":Lcom/example/epawg/EpawgProvider;
    return-object v10

    .line 107
    .restart local v11    # "this":Lcom/example/epawg/EpawgProvider;
    :cond_151
    move-object/from16 v0, p1

    move-object v7, v12

    .line 106
    .end local p1    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v0    # "$completion":Lkotlin/coroutines/Continuation;
    :goto_154
    invoke-interface {v7, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v2, p0

    goto :goto_e3

    .line 119
    :cond_15a
    move-object/from16 p1, v0

    .end local v0    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local p1    # "$completion":Lkotlin/coroutines/Continuation;
    const/4 v0, 0x1

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 104
    .end local v9    # "$result":Ljava/lang/Object;
    .end local v11    # "this":Lcom/example/epawg/EpawgProvider;
    .end local v12    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v14    # "referer":Ljava/lang/String;
    .end local p1    # "$completion":Lkotlin/coroutines/Continuation;
    .local v0, "streams":Ljava/util/List;
    .restart local v3    # "$result":Ljava/lang/Object;
    .restart local v5    # "this":Lcom/example/epawg/EpawgProvider;
    .restart local v7    # "callback":Lkotlin/jvm/functions/Function1;
    .restart local v8    # "referer":Ljava/lang/String;
    .restart local p5    # "$completion":Lkotlin/coroutines/Continuation;
    :cond_162
    new-instance v2, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    const-string v4, "No playable sources found. The site may have changed."

    invoke-direct {v2, v4}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    throw v2

    :pswitch_data_16a
    .packed-switch 0x0
        :pswitch_63
        :pswitch_54
        :pswitch_37
    .end packed-switch
.end method

.method public load(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3

    invoke-static/range {p0 .. p2}, Lcom/streambundle/v38/Screening;->detail(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public loadLinks(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 6

    invoke-static/range {p0 .. p5}, Lcom/streambundle/v48/LinkGuard;->load(Ljava/lang/Object;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public search(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4

    invoke-static/range {p0 .. p2}, Lcom/streambundle/v38/Screening;->search(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public searchOriginal(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 6
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "+",
            "Lcom/lagradost/cloudstream3/SearchResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 76
    sget-object v0, Lcom/example/websites/SearchQuery;->INSTANCE:Lcom/example/websites/SearchQuery;

    new-instance v1, Lcom/example/epawg/EpawgProvider$search$2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/example/epawg/EpawgProvider$search$2;-><init>(Lcom/example/epawg/EpawgProvider;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-virtual {v0, p1, v1, p2}, Lcom/example/websites/SearchQuery;->withFallback(Ljava/lang/String;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 78
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setLang(Ljava/lang/String;)V
    .registers 2
    .param p1, "<set-?>"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 30
    iput-object p1, p0, Lcom/example/epawg/EpawgProvider;->lang:Ljava/lang/String;

    return-void
.end method

.method public setMainUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "<set-?>"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 28
    iput-object p1, p0, Lcom/example/epawg/EpawgProvider;->mainUrl:Ljava/lang/String;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "<set-?>"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 29
    iput-object p1, p0, Lcom/example/epawg/EpawgProvider;->name:Ljava/lang/String;

    return-void
.end method
