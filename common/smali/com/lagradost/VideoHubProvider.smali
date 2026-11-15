.class public final Lcom/lagradost/VideoHubProvider;
.super Lcom/lagradost/cloudstream3/MainAPI;
.source "VideoHub.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nVideoHub.kt\nKotlin\n*S Kotlin\n*F\n+ 1 VideoHub.kt\ncom/lagradost/VideoHubProvider\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,247:1\n1#2:248\n1#2:264\n1#2:289\n1739#3:249\n1814#3,3:250\n1795#3,10:253\n2068#3:263\n2069#3:265\n1805#3:266\n296#3,2:267\n777#3:269\n873#3,2:270\n1453#3,2:272\n1468#3,4:274\n1795#3,10:278\n2068#3:288\n2069#3:290\n1805#3:291\n296#3,2:292\n*S KotlinDebug\n*F\n+ 1 VideoHub.kt\ncom/lagradost/VideoHubProvider\n*L\n109#1:264\n222#1:289\n90#1:249\n90#1:250,3\n109#1:253,10\n109#1:263\n109#1:265\n109#1:266\n142#1:267,2\n172#1:269\n172#1:270,2\n242#1:272,2\n242#1:274,4\n222#1:278,10\n222#1:288\n222#1:290\n222#1:291\n229#1:292,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u000b\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010$\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0010\u0010\'\u001a\u00020\u00072\u0006\u0010(\u001a\u00020\u0007H\u0002J\u0010\u00102\u001a\u00020\u00072\u0006\u00103\u001a\u00020\u0007H\u0002J\u0010\u00104\u001a\u00020\u00132\u0006\u0010(\u001a\u00020\u0007H\u0002J\u0012\u00105\u001a\u0004\u0018\u00010\u00072\u0006\u0010(\u001a\u00020\u0007H\u0002J*\u00106\u001a\u0002072\u0006\u0010(\u001a\u00020\u00072\u0008\u0008\u0002\u00108\u001a\u00020\u00072\u0008\u0008\u0002\u00109\u001a\u00020\u0013H\u0082@\u00a2\u0006\u0002\u0010:J\u001c\u0010;\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00070*2\u0006\u0010(\u001a\u00020\u0007H\u0002J\u000c\u0010<\u001a\u00020=*\u00020&H\u0002J\u001e\u0010 \u001a\u00020>2\u0006\u0010?\u001a\u00020,2\u0006\u0010@\u001a\u00020AH\u0096@\u00a2\u0006\u0002\u0010BJ\u0018\u0010C\u001a\u0004\u0018\u00010\u00072\u0006\u00103\u001a\u00020\u0007H\u0082@\u00a2\u0006\u0002\u0010DJ\u001c\u0010E\u001a\u0008\u0012\u0004\u0012\u00020&0\u001e2\u0006\u00103\u001a\u00020\u0007H\u0082@\u00a2\u0006\u0002\u0010DJ\u001c\u0010F\u001a\u0008\u0012\u0004\u0012\u00020=0\u001e2\u0006\u00103\u001a\u00020\u0007H\u0096@\u00a2\u0006\u0002\u0010DJ\u0018\u0010G\u001a\u0004\u0018\u00010H2\u0006\u0010(\u001a\u00020\u0007H\u0082@\u00a2\u0006\u0002\u0010DJ\u0016\u0010I\u001a\u00020J2\u0006\u0010(\u001a\u00020\u0007H\u0096@\u00a2\u0006\u0002\u0010DJF\u0010K\u001a\u00020\u00132\u0006\u0010L\u001a\u00020\u00072\u0006\u0010M\u001a\u00020\u00132\u0012\u0010N\u001a\u000e\u0012\u0004\u0012\u00020P\u0012\u0004\u0012\u00020Q0O2\u0012\u0010R\u001a\u000e\u0012\u0004\u0012\u00020S\u0012\u0004\u0012\u00020Q0OH\u0096@\u00a2\u0006\u0002\u0010TR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u00020\u0007X\u0096\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000bR\u001a\u0010\u000c\u001a\u00020\u0007X\u0096\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\t\"\u0004\u0008\u000e\u0010\u000bR\u001a\u0010\u000f\u001a\u00020\u0007X\u0096\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\t\"\u0004\u0008\u0011\u0010\u000bR\u0014\u0010\u0012\u001a\u00020\u0013X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R\u0014\u0010\u0016\u001a\u00020\u0013X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0015R\u001a\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u001a0\u0019X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001cR\u001a\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u001f0\u001eX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008 \u0010!R\u000e\u0010\"\u001a\u00020#X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010$\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020&0%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R&\u0010)\u001a\u001a\u0012\u0004\u0012\u00020\u0007\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00070*0%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010+\u001a\u000e\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020\u00070%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010-\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00070%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010.\u001a\u00020\u0007X\u0082D\u00a2\u0006\u0002\n\u0000R \u0010/\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00070*8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u00080\u00101"
    }
    d2 = {
        "Lcom/lagradost/VideoHubProvider;",
        "Lcom/lagradost/cloudstream3/MainAPI;",
        "site",
        "Lcom/lagradost/CatalogSite;",
        "<init>",
        "(Lcom/lagradost/CatalogSite;)V",
        "name",
        "",
        "getName",
        "()Ljava/lang/String;",
        "setName",
        "(Ljava/lang/String;)V",
        "mainUrl",
        "getMainUrl",
        "setMainUrl",
        "lang",
        "getLang",
        "setLang",
        "hasMainPage",
        "",
        "getHasMainPage",
        "()Z",
        "hasDownloadSupport",
        "getHasDownloadSupport",
        "supportedTypes",
        "",
        "Lcom/lagradost/cloudstream3/TvType;",
        "getSupportedTypes",
        "()Ljava/util/Set;",
        "mainPage",
        "",
        "Lcom/lagradost/cloudstream3/MainPageData;",
        "getMainPage",
        "()Ljava/util/List;",
        "cloudflare",
        "Lcom/lagradost/cloudstream3/network/CloudflareKiller;",
        "cardCache",
        "Ljava/util/concurrent/ConcurrentHashMap;",
        "Lcom/lagradost/VideoCard;",
        "cacheKey",
        "url",
        "pageCookies",
        "",
        "pageUrls",
        "",
        "translationCache",
        "ua",
        "requestHeaders",
        "getRequestHeaders",
        "()Ljava/util/Map;",
        "encode",
        "query",
        "ownUrl",
        "failover",
        "fetch",
        "Lorg/jsoup/nodes/Document;",
        "referer",
        "mirror",
        "(Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "posterHeaders",
        "toResult",
        "Lcom/lagradost/cloudstream3/SearchResponse;",
        "Lcom/lagradost/cloudstream3/HomePageResponse;",
        "page",
        "request",
        "Lcom/lagradost/cloudstream3/MainPageRequest;",
        "(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "translated",
        "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "beegSearch",
        "search",
        "beegDetails",
        "Lcom/lagradost/VideoDetails;",
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
        "(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final cardCache:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/lagradost/VideoCard;",
            ">;"
        }
    .end annotation
.end field

.field private final cloudflare:Lcom/lagradost/cloudstream3/network/CloudflareKiller;

.field private final hasDownloadSupport:Z

.field private final hasMainPage:Z

.field private lang:Ljava/lang/String;

.field private final mainPage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lagradost/cloudstream3/MainPageData;",
            ">;"
        }
    .end annotation
.end field

.field private mainUrl:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private final pageCookies:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final pageUrls:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final site:Lcom/lagradost/CatalogSite;

.field private final supportedTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/lagradost/cloudstream3/TvType;",
            ">;"
        }
    .end annotation
.end field

.field private final translationCache:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final ua:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/lagradost/CatalogSite;)V
    .registers 6
    .param p1, "site"    # Lcom/lagradost/CatalogSite;

    const-string v0, "site"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    invoke-direct {p0}, Lcom/lagradost/cloudstream3/MainAPI;-><init>()V

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    .line 28
    invoke-static {}, Lcom/lagradost/CatalogParserKt;->getCatalogSites()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v2}, Lcom/lagradost/CatalogSite;->getLabel()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->name:Ljava/lang/String;

    .line 29
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v0}, Lcom/lagradost/CatalogSite;->getBase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->mainUrl:Ljava/lang/String;

    .line 30
    const-string v0, "ru"

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->lang:Ljava/lang/String;

    .line 31
    iput-boolean v1, p0, Lcom/lagradost/VideoHubProvider;->hasMainPage:Z

    .line 32
    iput-boolean v1, p0, Lcom/lagradost/VideoHubProvider;->hasDownloadSupport:Z

    .line 33
    sget-object v0, Lcom/lagradost/cloudstream3/TvType;->Movie:Lcom/lagradost/cloudstream3/TvType;

    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->supportedTypes:Ljava/util/Set;

    .line 34
    new-array v0, v1, [Lkotlin/Pair;

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v1}, Lcom/lagradost/CatalogSite;->getHome()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u041d\u043e\u0432\u044b\u0435 \u0432\u0438\u0434\u0435\u043e"

    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/lagradost/cloudstream3/MainAPIKt;->mainPageOf([Lkotlin/Pair;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->mainPage:Ljava/util/List;

    .line 35
    new-instance v0, Lcom/lagradost/cloudstream3/network/CloudflareKiller;

    invoke-direct {v0}, Lcom/lagradost/cloudstream3/network/CloudflareKiller;-><init>()V

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->cloudflare:Lcom/lagradost/cloudstream3/network/CloudflareKiller;

    .line 36
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->cardCache:Ljava/util/concurrent/ConcurrentHashMap;

    .line 38
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->pageCookies:Ljava/util/concurrent/ConcurrentHashMap;

    .line 39
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->pageUrls:Ljava/util/concurrent/ConcurrentHashMap;

    .line 40
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->translationCache:Ljava/util/concurrent/ConcurrentHashMap;

    .line 41
    const-string v0, "Mozilla/5.0 (Linux; Android 12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36"

    iput-object v0, p0, Lcom/lagradost/VideoHubProvider;->ua:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public static final synthetic access$beegDetails(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4
    .param p0, "$this"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/lagradost/VideoHubProvider;->beegDetails(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$beegSearch(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4
    .param p0, "$this"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/lagradost/VideoHubProvider;->beegSearch(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$encode(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "$this"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "query"    # Ljava/lang/String;

    .line 27
    invoke-direct {p0, p1}, Lcom/lagradost/VideoHubProvider;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$fetch(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 6
    .param p0, "$this"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "referer"    # Ljava/lang/String;
    .param p3, "mirror"    # Z
    .param p4, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lagradost/VideoHubProvider;->fetch(Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getSite$p(Lcom/lagradost/VideoHubProvider;)Lcom/lagradost/CatalogSite;
    .registers 2
    .param p0, "$this"    # Lcom/lagradost/VideoHubProvider;

    .line 27
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    return-object v0
.end method

.method public static final synthetic access$loadLinks$emit(Lcom/lagradost/VideoHubProvider;Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 8
    .param p0, "this$0"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "emitted"    # Ljava/util/HashSet;
    .param p2, "wrapped"    # Lkotlin/jvm/functions/Function1;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "ref"    # Ljava/lang/String;
    .param p5, "sourceHeaders"    # Ljava/util/Map;
    .param p6, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-static/range {p0 .. p6}, Lcom/lagradost/VideoHubProvider;->loadLinks$emit(Lcom/lagradost/VideoHubProvider;Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$loadLinks$emit$deliver(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 11
    .param p0, "emitted"    # Ljava/util/HashSet;
    .param p1, "wrapped"    # Lkotlin/jvm/functions/Function1;
    .param p2, "this$0"    # Lcom/lagradost/VideoHubProvider;
    .param p3, "$ref"    # Ljava/lang/String;
    .param p4, "mediaHeaders"    # Ljava/util/Map;
    .param p5, "link"    # Ljava/lang/String;
    .param p6, "height"    # I
    .param p7, "label"    # Ljava/lang/String;
    .param p8, "isHls"    # Z
    .param p9, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-static/range {p0 .. p9}, Lcom/lagradost/VideoHubProvider;->loadLinks$emit$deliver(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 10
    .param p0, "visited"    # Ljava/util/HashSet;
    .param p1, "this$0"    # Lcom/lagradost/VideoHubProvider;
    .param p2, "$subtitleCallback"    # Lkotlin/jvm/functions/Function1;
    .param p3, "wrapped"    # Lkotlin/jvm/functions/Function1;
    .param p4, "emitted"    # Ljava/util/HashSet;
    .param p5, "url"    # Ljava/lang/String;
    .param p6, "ref"    # Ljava/lang/String;
    .param p7, "depth"    # I
    .param p8, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-static/range {p0 .. p8}, Lcom/lagradost/VideoHubProvider;->loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$posterHeaders(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;)Ljava/util/Map;
    .registers 3
    .param p0, "$this"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "url"    # Ljava/lang/String;

    .line 27
    invoke-direct {p0, p1}, Lcom/lagradost/VideoHubProvider;->posterHeaders(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$toResult(Lcom/lagradost/VideoHubProvider;Lcom/lagradost/VideoCard;)Lcom/lagradost/cloudstream3/SearchResponse;
    .registers 3
    .param p0, "$this"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "$receiver"    # Lcom/lagradost/VideoCard;

    .line 27
    invoke-direct {p0, p1}, Lcom/lagradost/VideoHubProvider;->toResult(Lcom/lagradost/VideoCard;)Lcom/lagradost/cloudstream3/SearchResponse;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lagradost/cloudstream3/SearchResponse;

    return-object v0
.end method

.method public static final synthetic access$translated(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4
    .param p0, "$this"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/lagradost/VideoHubProvider;->translated(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private final beegDetails(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 38
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/lagradost/VideoDetails;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    instance-of v2, v1, Lcom/lagradost/VideoHubProvider$beegDetails$1;

    if-eqz v2, :cond_1a

    move-object v2, v1

    check-cast v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;

    iget v3, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->label:I

    const/high16 v4, -0x80000000

    and-int/2addr v3, v4

    if-eqz v3, :cond_1a

    iget v3, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->label:I

    sub-int/2addr v3, v4

    iput v3, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->label:I

    move-object/from16 v3, p0

    goto :goto_21

    :cond_1a
    new-instance v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;

    move-object/from16 v3, p0

    invoke-direct {v2, v3, v1}, Lcom/lagradost/VideoHubProvider$beegDetails$1;-><init>(Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    .local v2, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_21
    iget-object v4, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->result:Ljava/lang/Object;

    .local v4, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v5

    .line 140
    iget v6, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->label:I

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v6, :cond_6e

    if-ne v6, v7, :cond_66

    iget-object v6, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$4:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .local v6, "host":Ljava/lang/String;
    iget-object v9, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$3:Ljava/lang/Object;

    check-cast v9, Ljava/util/Iterator;

    iget-object v10, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$2:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    .local v10, "query":Ljava/lang/String;
    iget-object v11, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$1:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    .local v11, "id":Ljava/lang/String;
    iget-object v12, v2, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$0:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    .end local p1    # "url":Ljava/lang/String;
    .local v12, "url":Ljava/lang/String;
    :try_start_43
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_46
    .catch Ljava/util/concurrent/CancellationException; {:try_start_43 .. :try_end_46} :catch_5f
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_46} :catch_53

    move v13, v7

    move-object v14, v11

    move-object v7, v5

    move-object v11, v10

    move-object v5, v2

    move-object v10, v9

    move-object v2, v1

    move-object v9, v3

    move-object v1, v12

    move-object v12, v6

    move-object v6, v4

    goto/16 :goto_176

    .line 148
    :catch_53
    move-exception v0

    move-object v7, v5

    move-object v14, v11

    move-object v5, v4

    move-object v11, v10

    move-object v4, v2

    move-object v10, v9

    move-object v2, v1

    move-object v9, v3

    move-object v1, v12

    goto/16 :goto_1c7

    :catch_5f
    move-exception v0

    move-object v7, v3

    move-object v5, v4

    move-object v4, v2

    move-object v2, v1

    goto/16 :goto_1d1

    .line 140
    .end local v2    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v4    # "$result":Ljava/lang/Object;
    .end local v6    # "host":Ljava/lang/String;
    .end local v10    # "query":Ljava/lang/String;
    .end local v11    # "id":Ljava/lang/String;
    .end local v12    # "url":Ljava/lang/String;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_66
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v2, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .restart local v2    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v4    # "$result":Ljava/lang/Object;
    :cond_6e
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 141
    new-instance v6, Lkotlin/text/Regex;

    const-string v9, "/xid/(\\d+)"

    invoke-direct {v6, v9}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    new-instance v9, Ljava/net/URI;

    invoke-direct {v9, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v9

    const-string v10, "getPath(...)"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v9, Ljava/lang/CharSequence;

    const/4 v10, 0x0

    const/4 v11, 0x2

    invoke-static {v6, v9, v10, v11, v8}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v6

    if-eqz v6, :cond_1d3

    invoke-interface {v6}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_1d3

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    if-nez v6, :cond_a0

    goto/16 :goto_1d3

    .line 142
    .local v6, "id":Ljava/lang/String;
    :cond_a0
    new-instance v9, Ljava/net/URI;

    invoke-direct {v9, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_e5

    move-object v12, v9

    check-cast v12, Ljava/lang/CharSequence;

    new-array v13, v7, [C

    const/16 v9, 0x26

    aput-char v9, v13, v10

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x6

    const/16 v17, 0x0

    invoke-static/range {v12 .. v17}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v9

    if-eqz v9, :cond_e5

    check-cast v9, Ljava/lang/Iterable;

    .local v9, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 267
    .local v12, "$i$f$firstOrNull":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_c7
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_e1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .local v14, "element$iv":Ljava/lang/Object;
    move-object v15, v14

    check-cast v15, Ljava/lang/String;

    .local v15, "it":Ljava/lang/String;
    const/16 v16, 0x0

    .line 142
    .local v16, "$i$a$-firstOrNull-VideoHubProvider$beegDetails$query$1":I
    const-string v7, "e="

    invoke-static {v15, v7, v10, v11, v8}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v7

    .line 267
    .end local v15    # "it":Ljava/lang/String;
    .end local v16    # "$i$a$-firstOrNull-VideoHubProvider$beegDetails$query$1":I
    if-eqz v7, :cond_df

    goto :goto_e2

    :cond_df
    const/4 v7, 0x1

    goto :goto_c7

    .line 268
    .end local v14    # "element$iv":Ljava/lang/Object;
    :cond_e1
    move-object v14, v8

    .end local v9    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v12    # "$i$f$firstOrNull":I
    :goto_e2
    check-cast v14, Ljava/lang/String;

    goto :goto_e6

    .line 142
    :cond_e5
    move-object v14, v8

    :goto_e6
    if-nez v14, :cond_ea

    const-string v14, ""

    :cond_ea
    move-object v7, v14

    .line 143
    .local v7, "query":Ljava/lang/String;
    const-string v9, "api-search.xv-cdn.net"

    const-string v10, "api-search-s1.xv-cdn.net"

    filled-new-array {v9, v10}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    move-object v11, v6

    move-object v10, v7

    move-object v7, v3

    move-object v6, v5

    move-object v5, v4

    move-object v4, v2

    move-object v2, v1

    move-object v1, v0

    .end local v6    # "id":Ljava/lang/String;
    .end local p0    # "this":Lcom/lagradost/VideoHubProvider;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "$completion":Lkotlin/coroutines/Continuation;
    .local v1, "url":Ljava/lang/String;
    .local v2, "$completion":Lkotlin/coroutines/Continuation;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .local v5, "$result":Ljava/lang/Object;
    .local v7, "this":Lcom/lagradost/VideoHubProvider;
    .restart local v10    # "query":Ljava/lang/String;
    .restart local v11    # "id":Ljava/lang/String;
    :goto_103
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Ljava/lang/String;

    .line 144
    .local v12, "host":Ljava/lang/String;
    nop

    .line 145
    :try_start_111
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v18
    :try_end_115
    .catch Ljava/util/concurrent/CancellationException; {:try_start_111 .. :try_end_115} :catch_1ce
    .catch Ljava/lang/Exception; {:try_start_111 .. :try_end_115} :catch_1c0

    :try_start_115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "https://"

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "/id/"

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "/?format=ajax&"

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19
    :try_end_136
    .catch Ljava/util/concurrent/CancellationException; {:try_start_115 .. :try_end_136} :catch_1b4
    .catch Ljava/lang/Exception; {:try_start_115 .. :try_end_136} :catch_1b2

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const-wide/16 v27, 0xc

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v33, 0xefe

    const/16 v34, 0x0

    :try_start_150
    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v4, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$0:Ljava/lang/Object;

    iput-object v11, v4, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$1:Ljava/lang/Object;

    iput-object v10, v4, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$2:Ljava/lang/Object;

    iput-object v9, v4, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$3:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v4, Lcom/lagradost/VideoHubProvider$beegDetails$1;->L$4:Ljava/lang/Object;

    const/4 v13, 0x1

    iput v13, v4, Lcom/lagradost/VideoHubProvider$beegDetails$1;->label:I

    move-object/from16 v32, v4

    invoke-static/range {v18 .. v34}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_16b
    .catch Ljava/util/concurrent/CancellationException; {:try_start_150 .. :try_end_16b} :catch_1ce
    .catch Ljava/lang/Exception; {:try_start_150 .. :try_end_16b} :catch_1c0

    if-ne v0, v6, :cond_16e

    .line 140
    return-object v6

    .line 145
    :cond_16e
    move-object v14, v11

    move-object v11, v10

    move-object v10, v9

    move-object v9, v7

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v0

    .line 140
    .end local v4    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v7    # "this":Lcom/lagradost/VideoHubProvider;
    .end local v10    # "query":Ljava/lang/String;
    .local v5, "$continuation":Lkotlin/coroutines/Continuation;
    .local v6, "$result":Ljava/lang/Object;
    .local v9, "this":Lcom/lagradost/VideoHubProvider;
    .local v11, "query":Ljava/lang/String;
    .local v14, "id":Ljava/lang/String;
    :goto_176
    :try_start_176
    check-cast v4, Lcom/lagradost/nicehttp/NiceResponse;

    move-object v0, v4

    .line 146
    .local v0, "response":Lcom/lagradost/nicehttp/NiceResponse;
    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v4

    const/16 v15, 0xc8

    if-ne v4, v15, :cond_19b

    .line 147
    sget-object v4, Lcom/lagradost/BeegParser;->INSTANCE:Lcom/lagradost/BeegParser;

    new-instance v15, Lorg/json/JSONObject;

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getText()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v15, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Lcom/lagradost/VideoHubProvider;->getMainUrl()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v15, v13}, Lcom/lagradost/BeegParser;->details(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/lagradost/VideoDetails;

    move-result-object v4
    :try_end_194
    .catch Ljava/util/concurrent/CancellationException; {:try_start_176 .. :try_end_194} :catch_1a9
    .catch Ljava/lang/Exception; {:try_start_176 .. :try_end_194} :catch_1a4

    if-eqz v4, :cond_19b

    .line 248
    .local v4, "it":Lcom/lagradost/VideoDetails;
    const/4 v7, 0x0

    .line 147
    .local v7, "$i$a$-let-VideoHubProvider$beegDetails$2":I
    invoke-static {v14}, Lcom/streambundle/v38/BundleMetadata;->beegInspected(Ljava/lang/String;)V

    return-object v4

    .line 143
    .end local v0    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    .end local v4    # "it":Lcom/lagradost/VideoDetails;
    .end local v7    # "$i$a$-let-VideoHubProvider$beegDetails$2":I
    .end local v12    # "host":Ljava/lang/String;
    :cond_19b
    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v14

    goto/16 :goto_103

    .line 148
    .restart local v12    # "host":Ljava/lang/String;
    :catch_1a4
    move-exception v0

    move-object v4, v5

    move-object v5, v6

    move-object v6, v12

    goto :goto_1c7

    :catch_1a9
    move-exception v0

    move-object v4, v5

    move-object v5, v6

    move-object v7, v9

    move-object v10, v11

    move-object v6, v12

    move-object v11, v14

    move-object v12, v1

    goto :goto_1d1

    .end local v6    # "$result":Ljava/lang/Object;
    .end local v9    # "this":Lcom/lagradost/VideoHubProvider;
    .end local v14    # "id":Ljava/lang/String;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .local v5, "$result":Ljava/lang/Object;
    .local v7, "this":Lcom/lagradost/VideoHubProvider;
    .restart local v10    # "query":Ljava/lang/String;
    .local v11, "id":Ljava/lang/String;
    :catch_1b2
    move-exception v0

    goto :goto_1b6

    :catch_1b4
    move-exception v0

    goto :goto_1bd

    :goto_1b6
    move-object v14, v11

    move-object v11, v10

    move-object v10, v9

    move-object v9, v7

    move-object v7, v6

    move-object v6, v12

    goto :goto_1c7

    :goto_1bd
    move-object v6, v12

    move-object v12, v1

    goto :goto_1d1

    :catch_1c0
    move-exception v0

    move-object v14, v11

    move-object v11, v10

    move-object v10, v9

    move-object v9, v7

    move-object v7, v6

    move-object v6, v12

    .end local v7    # "this":Lcom/lagradost/VideoHubProvider;
    .end local v10    # "query":Ljava/lang/String;
    .end local v12    # "host":Ljava/lang/String;
    .local v6, "host":Ljava/lang/String;
    .restart local v9    # "this":Lcom/lagradost/VideoHubProvider;
    .local v11, "query":Ljava/lang/String;
    .restart local v14    # "id":Ljava/lang/String;
    :goto_1c7
    move-object v6, v7

    move-object v7, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v14

    .end local v6    # "host":Ljava/lang/String;
    goto/16 :goto_103

    .end local v9    # "this":Lcom/lagradost/VideoHubProvider;
    .end local v14    # "id":Ljava/lang/String;
    .restart local v7    # "this":Lcom/lagradost/VideoHubProvider;
    .restart local v10    # "query":Ljava/lang/String;
    .local v11, "id":Ljava/lang/String;
    .restart local v12    # "host":Ljava/lang/String;
    :catch_1ce
    move-exception v0

    move-object v6, v12

    move-object v12, v1

    .end local v1    # "url":Ljava/lang/String;
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .restart local v6    # "host":Ljava/lang/String;
    .local v12, "url":Ljava/lang/String;
    :goto_1d1
    throw v0

    .line 150
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    .end local v6    # "host":Ljava/lang/String;
    .end local v12    # "url":Ljava/lang/String;
    .restart local v1    # "url":Ljava/lang/String;
    :cond_1d2
    return-object v8

    .line 141
    .end local v1    # "url":Ljava/lang/String;
    .end local v5    # "$result":Ljava/lang/Object;
    .end local v7    # "this":Lcom/lagradost/VideoHubProvider;
    .end local v10    # "query":Ljava/lang/String;
    .end local v11    # "id":Ljava/lang/String;
    .local v2, "$continuation":Lkotlin/coroutines/Continuation;
    .local v4, "$result":Ljava/lang/Object;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "$completion":Lkotlin/coroutines/Continuation;
    :cond_1d3
    :goto_1d3
    return-object v8
.end method

.method private final beegSearch(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 33
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/lagradost/VideoCard;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v1, p2

    instance-of v0, v1, Lcom/lagradost/VideoHubProvider$beegSearch$1;

    if-eqz v0, :cond_18

    move-object v0, v1

    check-cast v0, Lcom/lagradost/VideoHubProvider$beegSearch$1;

    iget v2, v0, Lcom/lagradost/VideoHubProvider$beegSearch$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_18

    iget v2, v0, Lcom/lagradost/VideoHubProvider$beegSearch$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v0, Lcom/lagradost/VideoHubProvider$beegSearch$1;->label:I

    move-object/from16 v2, p0

    goto :goto_1f

    :cond_18
    new-instance v0, Lcom/lagradost/VideoHubProvider$beegSearch$1;

    move-object/from16 v2, p0

    invoke-direct {v0, v2, v1}, Lcom/lagradost/VideoHubProvider$beegSearch$1;-><init>(Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    :goto_1f
    move-object v3, v0

    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v4, v3, Lcom/lagradost/VideoHubProvider$beegSearch$1;->result:Ljava/lang/Object;

    .local v4, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v5

    .line 103
    iget v0, v3, Lcom/lagradost/VideoHubProvider$beegSearch$1;->label:I

    const/4 v6, 0x1

    if-eqz v0, :cond_61

    if-ne v0, v6, :cond_59

    iget-object v0, v3, Lcom/lagradost/VideoHubProvider$beegSearch$1;->L$3:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    .local v7, "host":Ljava/lang/String;
    iget-object v0, v3, Lcom/lagradost/VideoHubProvider$beegSearch$1;->L$2:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Ljava/util/Iterator;

    iget-object v0, v3, Lcom/lagradost/VideoHubProvider$beegSearch$1;->L$1:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ljava/lang/Exception;

    .local v9, "failure":Ljava/lang/Exception;
    iget-object v0, v3, Lcom/lagradost/VideoHubProvider$beegSearch$1;->L$0:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Ljava/lang/String;

    .end local p1    # "query":Ljava/lang/String;
    .local v10, "query":Ljava/lang/String;
    :try_start_41
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_44
    .catch Ljava/util/concurrent/CancellationException; {:try_start_41 .. :try_end_44} :catch_53
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_44} :catch_49

    move-object v13, v2

    move-object v6, v5

    move-object v5, v4

    goto/16 :goto_10a

    .line 110
    :catch_49
    move-exception v0

    move-object v13, v2

    move-object v15, v5

    move-object v14, v8

    move-object v5, v4

    move-object v4, v3

    move-object v3, v1

    move-object v1, v10

    goto/16 :goto_1e0

    :catch_53
    move-exception v0

    move-object/from16 v24, v1

    move-object v13, v2

    goto/16 :goto_1f5

    .line 103
    .end local v3    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v4    # "$result":Ljava/lang/Object;
    .end local v7    # "host":Ljava/lang/String;
    .end local v9    # "failure":Ljava/lang/Exception;
    .end local v10    # "query":Ljava/lang/String;
    .restart local p1    # "query":Ljava/lang/String;
    :cond_59
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v3    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v4    # "$result":Ljava/lang/Object;
    :cond_61
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 104
    const/4 v0, 0x0

    .line 105
    .local v0, "failure":Ljava/lang/Exception;
    const-string v7, "api-search.xv-cdn.net"

    const-string v8, "api-search-s1.xv-cdn.net"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-object/from16 v24, v0

    move-object v13, v2

    move-object v15, v5

    move-object v14, v7

    move-object v5, v4

    move-object v4, v3

    move-object v3, v1

    move-object/from16 v1, p1

    .end local v0    # "failure":Ljava/lang/Exception;
    .end local p0    # "this":Lcom/lagradost/VideoHubProvider;
    .end local p1    # "query":Ljava/lang/String;
    .end local p2    # "$completion":Lkotlin/coroutines/Continuation;
    .local v1, "query":Ljava/lang/String;
    .local v3, "$completion":Lkotlin/coroutines/Continuation;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .local v5, "$result":Ljava/lang/Object;
    .local v13, "this":Lcom/lagradost/VideoHubProvider;
    .local v24, "failure":Ljava/lang/Exception;
    :goto_7f
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f6

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Ljava/lang/String;

    .line 106
    .local v12, "host":Ljava/lang/String;
    nop

    .line 107
    :try_start_8d
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v7

    invoke-direct {v13, v1}, Lcom/lagradost/VideoHubProvider;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_95
    .catch Ljava/util/concurrent/CancellationException; {:try_start_8d .. :try_end_95} :catch_1e7
    .catch Ljava/lang/Exception; {:try_start_8d .. :try_end_95} :catch_1d4

    :try_start_95
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "https://"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "/search/?format=ajax&k="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "&p=1"

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8
    :try_end_b3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_95 .. :try_end_b3} :catch_1b8
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_b3} :catch_1af

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const-wide/16 v19, 0xc

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v25, 0xefe

    const/16 v26, 0x0

    :try_start_c8
    iput-object v1, v4, Lcom/lagradost/VideoHubProvider$beegSearch$1;->L$0:Ljava/lang/Object;

    invoke-static/range {v24 .. v24}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v4, Lcom/lagradost/VideoHubProvider$beegSearch$1;->L$1:Ljava/lang/Object;

    iput-object v14, v4, Lcom/lagradost/VideoHubProvider$beegSearch$1;->L$2:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v4, Lcom/lagradost/VideoHubProvider$beegSearch$1;->L$3:Ljava/lang/Object;

    iput v6, v4, Lcom/lagradost/VideoHubProvider$beegSearch$1;->label:I
    :try_end_da
    .catch Ljava/util/concurrent/CancellationException; {:try_start_c8 .. :try_end_da} :catch_1e7
    .catch Ljava/lang/Exception; {:try_start_c8 .. :try_end_da} :catch_1d4

    move-object/from16 v27, v12

    const/4 v0, 0x0

    .end local v12    # "host":Ljava/lang/String;
    .local v27, "host":Ljava/lang/String;
    move-object v12, v0

    move-object/from16 v28, v13

    .end local v13    # "this":Lcom/lagradost/VideoHubProvider;
    .local v28, "this":Lcom/lagradost/VideoHubProvider;
    move/from16 v13, v16

    move-object/from16 v29, v14

    move/from16 v14, v17

    move-object v6, v15

    move-object/from16 v15, v18

    move-wide/from16 v16, v19

    move-object/from16 v18, v21

    move/from16 v19, v22

    move-object/from16 v20, v23

    move-object/from16 v21, v4

    move/from16 v22, v25

    move-object/from16 v23, v26

    :try_start_f7
    invoke-static/range {v7 .. v23}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_fb
    .catch Ljava/util/concurrent/CancellationException; {:try_start_f7 .. :try_end_fb} :catch_1a2
    .catch Ljava/lang/Exception; {:try_start_f7 .. :try_end_fb} :catch_1a0

    if-ne v0, v6, :cond_fe

    .line 103
    return-object v6

    .line 107
    :cond_fe
    move-object v10, v1

    move-object v1, v3

    move-object v3, v4

    move-object/from16 v9, v24

    move-object/from16 v7, v27

    move-object/from16 v13, v28

    move-object/from16 v8, v29

    move-object v4, v0

    .line 103
    .end local v4    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v24    # "failure":Ljava/lang/Exception;
    .end local v27    # "host":Ljava/lang/String;
    .end local v28    # "this":Lcom/lagradost/VideoHubProvider;
    .local v1, "$completion":Lkotlin/coroutines/Continuation;
    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v7    # "host":Ljava/lang/String;
    .restart local v9    # "failure":Ljava/lang/Exception;
    .restart local v10    # "query":Ljava/lang/String;
    .restart local v13    # "this":Lcom/lagradost/VideoHubProvider;
    :goto_10a
    :try_start_10a
    check-cast v4, Lcom/lagradost/nicehttp/NiceResponse;

    move-object v0, v4

    .line 108
    .local v0, "response":Lcom/lagradost/nicehttp/NiceResponse;
    new-instance v4, Lorg/json/JSONObject;

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getText()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v4, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v11, "items"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 109
    .local v4, "items":Lorg/json/JSONArray;
    const/4 v11, 0x0

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v12

    invoke-static {v11, v12}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object v11

    check-cast v11, Ljava/lang/Iterable;

    .local v11, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 253
    .local v12, "$i$f$mapNotNull":I
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    check-cast v14, Ljava/util/Collection;

    .local v14, "destination$iv$iv":Ljava/util/Collection;
    move-object v15, v11

    .local v15, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/16 v16, 0x0

    .line 262
    .local v16, "$i$f$mapNotNullTo":I
    move-object/from16 v17, v15

    .local v17, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/16 v18, 0x0

    .line 263
    .local v18, "$i$f$forEach":I
    invoke-interface/range {v17 .. v17}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_13a
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_178

    move-object/from16 v20, v19

    check-cast v20, Lkotlin/collections/IntIterator;

    invoke-virtual/range {v20 .. v20}, Lkotlin/collections/IntIterator;->nextInt()I

    move-result v20

    .local v20, "element$iv$iv$iv":I
    move/from16 v21, v20

    .local v21, "element$iv$iv":I
    const/16 v22, 0x0

    .line 262
    .local v22, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move/from16 p1, v21

    .local p1, "index":I
    const/16 v23, 0x0

    .line 109
    .local v23, "$i$a$-mapNotNull-VideoHubProvider$beegSearch$2":I
    move-object/from16 p2, v0

    .end local v0    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    .local p2, "response":Lcom/lagradost/nicehttp/NiceResponse;
    sget-object v0, Lcom/lagradost/BeegParser;->INSTANCE:Lcom/lagradost/BeegParser;
    :try_end_154
    .catch Ljava/util/concurrent/CancellationException; {:try_start_10a .. :try_end_154} :catch_19a
    .catch Ljava/lang/Exception; {:try_start_10a .. :try_end_154} :catch_18f

    move-object/from16 v24, v1

    move/from16 v1, p1

    .end local p1    # "index":I
    .local v1, "index":I
    .local v24, "$completion":Lkotlin/coroutines/Continuation;
    .restart local p0    # "this":Lcom/lagradost/VideoHubProvider;
    :try_start_158
    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .end local p0    # "this":Lcom/lagradost/VideoHubProvider;
    move/from16 v25, v1

    .end local v1    # "index":I
    .local v25, "index":I
    const-string v1, "getJSONObject(...)"

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v13}, Lcom/lagradost/VideoHubProvider;->getMainUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/lagradost/BeegParser;->card(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/lagradost/VideoCard;

    move-result-object v0

    .line 262
    .end local v23    # "$i$a$-mapNotNull-VideoHubProvider$beegSearch$2":I
    .end local v25    # "index":I
    if-eqz v0, :cond_171

    .line 264
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 262
    .local v1, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v14, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 263
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v1    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v21    # "element$iv$iv":I
    .end local v22    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_171
    move-object/from16 v2, p0

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    .end local v20    # "element$iv$iv$iv":I
    goto :goto_13a

    .line 265
    .end local v24    # "$completion":Lkotlin/coroutines/Continuation;
    .end local p2    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    .local v0, "response":Lcom/lagradost/nicehttp/NiceResponse;
    .local v1, "$completion":Lkotlin/coroutines/Continuation;
    :cond_178
    move-object/from16 p2, v0

    move-object/from16 v24, v1

    .line 266
    .end local v0    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    .end local v1    # "$completion":Lkotlin/coroutines/Continuation;
    .end local v17    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v18    # "$i$f$forEach":I
    .restart local v24    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local p2    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    nop

    .end local v14    # "destination$iv$iv":Ljava/util/Collection;
    .end local v15    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v16    # "$i$f$mapNotNullTo":I
    move-object v0, v14

    check-cast v0, Ljava/util/List;
    :try_end_180
    .catch Ljava/util/concurrent/CancellationException; {:try_start_158 .. :try_end_180} :catch_18b
    .catch Ljava/lang/Exception; {:try_start_158 .. :try_end_180} :catch_182

    .line 253
    nop

    .line 109
    .end local v11    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v12    # "$i$f$mapNotNull":I
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
    move-result v11
    if-eqz v11, :beeg_search_results

    move-object v4, v3
    move-object v15, v6
    move-object v14, v8
    move-object v1, v10
    move-object/from16 v3, v24
    const/4 v0, 0x0
    goto/16 :goto_1e0

    :beeg_search_results
    return-object v0

    .line 110
    .end local v4    # "items":Lorg/json/JSONArray;
    .end local p2    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    :catch_182
    move-exception v0

    move-object v4, v3

    move-object v15, v6

    move-object v14, v8

    move-object v1, v10

    move-object/from16 v3, v24

    goto/16 :goto_1e0

    :catch_18b
    move-exception v0

    move-object v4, v5

    goto/16 :goto_1f5

    .end local v24    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v1    # "$completion":Lkotlin/coroutines/Continuation;
    :catch_18f
    move-exception v0

    move-object/from16 v24, v1

    move-object v4, v3

    move-object v15, v6

    move-object v14, v8

    move-object v1, v10

    move-object/from16 v3, v24

    .end local v1    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v24    # "$completion":Lkotlin/coroutines/Continuation;
    goto/16 :goto_1e0

    .end local v24    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v1    # "$completion":Lkotlin/coroutines/Continuation;
    :catch_19a
    move-exception v0

    move-object/from16 v24, v1

    move-object v4, v5

    .end local v1    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v24    # "$completion":Lkotlin/coroutines/Continuation;
    goto/16 :goto_1f5

    .end local v7    # "host":Ljava/lang/String;
    .end local v9    # "failure":Ljava/lang/Exception;
    .end local v10    # "query":Ljava/lang/String;
    .end local v13    # "this":Lcom/lagradost/VideoHubProvider;
    .local v1, "query":Ljava/lang/String;
    .local v3, "$completion":Lkotlin/coroutines/Continuation;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .local v24, "failure":Ljava/lang/Exception;
    .restart local v27    # "host":Ljava/lang/String;
    .restart local v28    # "this":Lcom/lagradost/VideoHubProvider;
    :catch_1a0
    move-exception v0

    goto :goto_1be

    :catch_1a2
    move-exception v0

    move-object v10, v1

    move-object/from16 v9, v24

    move-object/from16 v7, v27

    move-object/from16 v13, v28

    move-object/from16 v24, v3

    move-object v3, v4

    move-object v4, v5

    goto :goto_1f5

    .end local v27    # "host":Ljava/lang/String;
    .end local v28    # "this":Lcom/lagradost/VideoHubProvider;
    .local v12, "host":Ljava/lang/String;
    .restart local v13    # "this":Lcom/lagradost/VideoHubProvider;
    :catch_1af
    move-exception v0

    move-object/from16 v27, v12

    move-object/from16 v28, v13

    move-object/from16 v29, v14

    move-object v6, v15

    .end local v12    # "host":Ljava/lang/String;
    .end local v13    # "this":Lcom/lagradost/VideoHubProvider;
    .restart local v27    # "host":Ljava/lang/String;
    .restart local v28    # "this":Lcom/lagradost/VideoHubProvider;
    goto :goto_1be

    .end local v27    # "host":Ljava/lang/String;
    .end local v28    # "this":Lcom/lagradost/VideoHubProvider;
    .restart local v12    # "host":Ljava/lang/String;
    .restart local v13    # "this":Lcom/lagradost/VideoHubProvider;
    :catch_1b8
    move-exception v0

    move-object/from16 v27, v12

    move-object/from16 v28, v13

    .end local v12    # "host":Ljava/lang/String;
    .end local v13    # "this":Lcom/lagradost/VideoHubProvider;
    .restart local v27    # "host":Ljava/lang/String;
    .restart local v28    # "this":Lcom/lagradost/VideoHubProvider;
    goto :goto_1c8

    :goto_1be
    move-object v15, v6

    move-object/from16 v9, v24

    move-object/from16 v7, v27

    move-object/from16 v13, v28

    move-object/from16 v14, v29

    goto :goto_1e0

    :goto_1c8
    move-object v10, v1

    move-object/from16 v9, v24

    move-object/from16 v7, v27

    move-object/from16 v13, v28

    move-object/from16 v24, v3

    move-object v3, v4

    move-object v4, v5

    goto :goto_1f5

    .end local v27    # "host":Ljava/lang/String;
    .end local v28    # "this":Lcom/lagradost/VideoHubProvider;
    .restart local v12    # "host":Ljava/lang/String;
    .restart local v13    # "this":Lcom/lagradost/VideoHubProvider;
    :catch_1d4
    move-exception v0

    move-object/from16 v27, v12

    move-object/from16 v28, v13

    move-object/from16 v29, v14

    move-object v6, v15

    move-object/from16 v9, v24

    move-object/from16 v7, v27

    .end local v12    # "host":Ljava/lang/String;
    .end local v24    # "failure":Ljava/lang/Exception;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v7    # "host":Ljava/lang/String;
    .restart local v9    # "failure":Ljava/lang/Exception;
    :goto_1e0
    move-object/from16 v24, v0

    move-object/from16 v2, p0

    const/4 v6, 0x1

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v7    # "host":Ljava/lang/String;
    .end local v9    # "failure":Ljava/lang/Exception;
    .restart local v24    # "failure":Ljava/lang/Exception;
    goto/16 :goto_7f

    .restart local v12    # "host":Ljava/lang/String;
    :catch_1e7
    move-exception v0

    move-object/from16 v27, v12

    move-object/from16 v28, v13

    move-object v10, v1

    move-object/from16 v9, v24

    move-object/from16 v7, v27

    move-object/from16 v24, v3

    move-object v3, v4

    move-object v4, v5

    .end local v1    # "query":Ljava/lang/String;
    .end local v5    # "$result":Ljava/lang/Object;
    .end local v12    # "host":Ljava/lang/String;
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    .local v4, "$result":Ljava/lang/Object;
    .restart local v7    # "host":Ljava/lang/String;
    .restart local v9    # "failure":Ljava/lang/Exception;
    .restart local v10    # "query":Ljava/lang/String;
    .local v24, "$completion":Lkotlin/coroutines/Continuation;
    :goto_1f5
    throw v0

    .line 112
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    .end local v7    # "host":Ljava/lang/String;
    .end local v9    # "failure":Ljava/lang/Exception;
    .end local v10    # "query":Ljava/lang/String;
    .restart local v1    # "query":Ljava/lang/String;
    .local v3, "$completion":Lkotlin/coroutines/Continuation;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v5    # "$result":Ljava/lang/Object;
    .local v24, "failure":Ljava/lang/Exception;
    :cond_1f6
    move-object/from16 v28, v13

    .end local v13    # "this":Lcom/lagradost/VideoHubProvider;
    .restart local v28    # "this":Lcom/lagradost/VideoHubProvider;
    if-eqz v24, :cond_1ff

    move-object/from16 v0, v24

    check-cast v0, Ljava/lang/Throwable;

    goto :goto_208

    :cond_1ff
    new-instance v0, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    const-string v2, "Beeg: \u043f\u043e\u0438\u0441\u043a \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d"

    invoke-direct {v0, v2}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Throwable;

    :goto_208
    throw v0
.end method

.method private final cacheKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "url"    # Ljava/lang/String;

    .line 37
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getPath(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v1, v1, [C

    const/4 v2, 0x0

    const/16 v3, 0x2f

    aput-char v3, v1, v2

    invoke-static {v0, v1}, Lkotlin/text/StringsKt;->trimEnd(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "query"    # Ljava/lang/String;

    .line 44
    const-string v0, "UTF-8"

    invoke-static {p1, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v0, "encode(...)"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "+"

    const-string v3, "%20"

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final failover(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "url"    # Ljava/lang/String;

    .line 49
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v0}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_3a

    invoke-direct {p0, p1}, Lcom/lagradost/VideoHubProvider;->ownUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 50
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, "missav.live"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    const-string v2, "https://missav.live"

    const-string v3, "https://missav.ws"

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3b

    .line 51
    :cond_2d
    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    const-string v2, "https://missav.ws"

    const-string v3, "https://missav.live"

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3b

    .line 52
    :cond_3a
    const/4 v0, 0x0

    :goto_3b
    return-object v0
.end method

.method private final fetch(Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 34
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "referer"    # Ljava/lang/String;
    .param p3, "mirror"    # Z
    .param p4, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lorg/jsoup/nodes/Document;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v0, p4

    instance-of v0, v0, Lcom/lagradost/VideoHubProvider$fetch$1;

    if-nez v0, :cond_d

    invoke-static/range {p1 .. p1}, Lcom/videobundle/fixes/MetadataSupport;->cached(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    if-eqz v0, :cond_d

    return-object v0

    :cond_d
    move-object/from16 v1, p0

    move-object/from16 v2, p4

    instance-of v0, v2, Lcom/lagradost/VideoHubProvider$fetch$1;

    if-eqz v0, :cond_25

    move-object v0, v2

    check-cast v0, Lcom/lagradost/VideoHubProvider$fetch$1;

    iget v3, v0, Lcom/lagradost/VideoHubProvider$fetch$1;->label:I

    const/high16 v4, -0x80000000

    and-int/2addr v3, v4

    if-eqz v3, :cond_25

    iget v3, v0, Lcom/lagradost/VideoHubProvider$fetch$1;->label:I

    sub-int/2addr v3, v4

    iput v3, v0, Lcom/lagradost/VideoHubProvider$fetch$1;->label:I

    goto :goto_2a

    :cond_25
    new-instance v0, Lcom/lagradost/VideoHubProvider$fetch$1;

    invoke-direct {v0, v1, v2}, Lcom/lagradost/VideoHubProvider$fetch$1;-><init>(Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    :goto_2a
    move-object v15, v0

    .local v15, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v14, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->result:Ljava/lang/Object;

    .local v14, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v12

    .line 53
    iget v0, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->label:I

    const/16 v20, 0x0

    const/4 v13, 0x2

    const/4 v11, 0x0

    const/4 v10, 0x1

    if-eqz v0, :cond_87

    if-eq v0, v10, :cond_60

    if-ne v0, v13, :cond_58

    iget-boolean v0, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->Z$0:Z

    .end local p3    # "mirror":Z
    .local v0, "mirror":Z
    iget-object v3, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->L$3:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .local v3, "alternative":Ljava/lang/String;
    iget-object v4, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->L$2:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Exception;

    .local v4, "e":Ljava/lang/Exception;
    iget-object v5, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->L$1:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    .end local p2    # "referer":Ljava/lang/String;
    .local v5, "referer":Ljava/lang/String;
    iget-object v6, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->L$0:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .end local p1    # "url":Ljava/lang/String;
    .local v6, "url":Ljava/lang/String;
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v25, v14

    move-object v9, v15

    goto/16 :goto_234

    .end local v0    # "mirror":Z
    .end local v3    # "alternative":Ljava/lang/String;
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "referer":Ljava/lang/String;
    .end local v6    # "url":Ljava/lang/String;
    .end local v14    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "referer":Ljava/lang/String;
    .restart local p3    # "mirror":Z
    :cond_58
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v14    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :cond_60
    iget-boolean v3, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->Z$0:Z

    .end local p3    # "mirror":Z
    .local v3, "mirror":Z
    iget-object v0, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->L$1:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    .end local p2    # "referer":Ljava/lang/String;
    .local v4, "referer":Ljava/lang/String;
    iget-object v0, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->L$0:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .end local p1    # "url":Ljava/lang/String;
    .local v5, "url":Ljava/lang/String;
    :try_start_6c
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_6f
    .catch Ljava/util/concurrent/CancellationException; {:try_start_6c .. :try_end_6f} :catch_80
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_6f} :catch_77

    move v6, v3

    move-object v3, v12

    move-object/from16 v25, v14

    move-object/from16 v27, v15

    goto/16 :goto_112

    .line 64
    :catch_77
    move-exception v0

    move v6, v3

    move-object v3, v12

    move-object/from16 v25, v14

    move-object/from16 v27, v15

    goto/16 :goto_1f8

    .line 63
    :catch_80
    move-exception v0

    move v6, v3

    move-object/from16 v25, v14

    move-object v9, v15

    goto/16 :goto_243

    .line 53
    .end local v3    # "mirror":Z
    .end local v4    # "referer":Ljava/lang/String;
    .end local v5    # "url":Ljava/lang/String;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "referer":Ljava/lang/String;
    .restart local p3    # "mirror":Z
    :cond_87
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 54
    nop

    .line 55
    :try_start_8b
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v3
    :try_end_8f
    .catch Ljava/util/concurrent/CancellationException; {:try_start_8b .. :try_end_8f} :catch_239
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_8f} :catch_1ec

    :try_start_8f
    invoke-direct/range {p0 .. p0}, Lcom/lagradost/VideoHubProvider;->getRequestHeaders()Ljava/util/Map;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v0, 0x0

    const/16 v16, 0x0

    const-wide/16 v17, 0x19

    .line 56
    iget-object v4, v1, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v4}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v4
    :try_end_a1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_8f .. :try_end_a1} :catch_1e1
    .catch Ljava/lang/Exception; {:try_start_8f .. :try_end_a1} :catch_1ec

    const/4 v6, 0x4

    if-ne v4, v6, :cond_c7

    :try_start_a4
    invoke-direct/range {p0 .. p1}, Lcom/lagradost/VideoHubProvider;->ownUrl(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c7

    iget-object v4, v1, Lcom/lagradost/VideoHubProvider;->cloudflare:Lcom/lagradost/cloudstream3/network/CloudflareKiller;
    :try_end_ac
    .catch Ljava/util/concurrent/CancellationException; {:try_start_a4 .. :try_end_ac} :catch_bb
    .catch Ljava/lang/Exception; {:try_start_a4 .. :try_end_ac} :catch_ad

    goto :goto_c9

    .line 64
    :catch_ad
    move-exception v0

    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move/from16 v6, p3

    move-object v3, v12

    move-object/from16 v25, v14

    move-object/from16 v27, v15

    goto/16 :goto_1f8

    .line 63
    :catch_bb
    move-exception v0

    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move/from16 v6, p3

    move-object/from16 v25, v14

    move-object v9, v15

    goto/16 :goto_243

    .line 56
    :cond_c7
    move-object/from16 v4, v20

    :goto_c9
    :try_start_c9
    move-object/from16 v19, v4

    check-cast v19, Lokhttp3/Interceptor;

    .line 55
    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0xcf8

    const/16 v24, 0x0

    move-object/from16 v6, p1

    iput-object v6, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->L$0:Ljava/lang/Object;

    move-object/from16 v4, p2

    iput-object v4, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->L$1:Ljava/lang/Object;
    :try_end_dd
    .catch Ljava/util/concurrent/CancellationException; {:try_start_c9 .. :try_end_dd} :catch_1e1
    .catch Ljava/lang/Exception; {:try_start_c9 .. :try_end_dd} :catch_1ec

    move-object/from16 v25, v12

    move/from16 v12, p3

    :try_start_e1
    iput-boolean v12, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->Z$0:Z

    iput v10, v15, Lcom/lagradost/VideoHubProvider$fetch$1;->label:I
    :try_end_e5
    .catch Ljava/util/concurrent/CancellationException; {:try_start_e1 .. :try_end_e5} :catch_1e1
    .catch Ljava/lang/Exception; {:try_start_e1 .. :try_end_e5} :catch_1d9

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    move v10, v0

    move-object/from16 v11, v16

    move-object/from16 v26, v25

    move-wide/from16 v12, v17

    move-object/from16 v25, v14

    .end local v14    # "$result":Ljava/lang/Object;
    .local v25, "$result":Ljava/lang/Object;
    move-object/from16 v14, v19

    move-object/from16 v27, v15

    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .local v27, "$continuation":Lkotlin/coroutines/Continuation;
    move/from16 v15, v21

    move-object/from16 v16, v22

    move-object/from16 v17, v27

    move/from16 v18, v23

    move-object/from16 v19, v24

    :try_start_100
    invoke-static/range {v3 .. v19}, Lcom/videobundle/fixes/RequestFix;->get(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v14
    :try_end_104
    .catch Ljava/util/concurrent/CancellationException; {:try_start_100 .. :try_end_104} :catch_1ce
    .catch Ljava/lang/Exception; {:try_start_100 .. :try_end_104} :catch_1c4

    move-object/from16 v3, v26

    if-ne v14, v3, :cond_10c

    .line 53
    invoke-static/range {v3 .. v3}, Lcom/videobundle/fixes/MetadataSupport;->remember(Ljava/lang/Object;)V

    return-object v3

    .line 55
    :cond_10c
    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move/from16 v6, p3

    .line 53
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "referer":Ljava/lang/String;
    .end local p3    # "mirror":Z
    .restart local v4    # "referer":Ljava/lang/String;
    .restart local v5    # "url":Ljava/lang/String;
    .local v6, "mirror":Z
    :goto_112
    :try_start_112
    check-cast v14, Lcom/lagradost/nicehttp/NiceResponse;

    move-object v0, v14

    .line 57
    .local v0, "response":Lcom/lagradost/nicehttp/NiceResponse;
    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v7

    const/16 v8, 0xc8

    if-gt v8, v7, :cond_123

    const/16 v8, 0x12c

    if-ge v7, v8, :cond_123

    const/4 v11, 0x1

    goto :goto_124

    :cond_123
    const/4 v11, 0x0

    :goto_124
    if-eqz v11, :cond_18f

    .line 58
    iget-object v7, v1, Lcom/lagradost/VideoHubProvider;->pageCookies:Ljava/util/concurrent/ConcurrentHashMap;

    check-cast v7, Ljava/util/Map;

    new-instance v8, Ljava/net/URI;

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getUrl()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getCookies()Ljava/util/Map;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getUrl()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Lcom/streambundle/Unified;->document(Ljava/lang/Object;)V

    .line 60
    .local v7, "doc":Lorg/jsoup/nodes/Document;
    const-string v8, "#challenge-running, #cf-challenge-running"

    invoke-virtual {v7, v8}, Lorg/jsoup/nodes/Document;->selectFirst(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v8

    if-nez v8, :cond_172

    invoke-virtual {v7}, Lorg/jsoup/nodes/Document;->title()Ljava/lang/String;

    move-result-object v8

    const-string v9, "title(...)"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v8, Ljava/lang/CharSequence;

    const-string v9, "Just a moment"

    check-cast v9, Ljava/lang/CharSequence;

    const/4 v10, 0x1

    invoke-static {v8, v9, v10}, Lkotlin/text/StringsKt;->contains(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v8

    if-nez v8, :cond_172

    .line 62
    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static/range {v7 .. v7}, Lcom/videobundle/fixes/MetadataSupport;->remember(Ljava/lang/Object;)V

    return-object v7

    .line 61
    :cond_172
    new-instance v8, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    iget-object v9, v1, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v9}, Lcom/lagradost/CatalogSite;->getLabel()Ljava/lang/String;

    move-result-object v9
    :try_end_17a
    .catch Ljava/util/concurrent/CancellationException; {:try_start_112 .. :try_end_17a} :catch_1bf
    .catch Ljava/lang/Exception; {:try_start_112 .. :try_end_17a} :catch_1bd

    :try_start_17a
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ": \u0442\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 Cloudflare \u0432\u043e \u0432\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u043e\u043c \u0431\u0440\u0430\u0443\u0437\u0435\u0440\u0435."

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9
    :try_end_18b
    .catch Ljava/util/concurrent/CancellationException; {:try_start_17a .. :try_end_18b} :catch_1b8
    .catch Ljava/lang/Exception; {:try_start_17a .. :try_end_18b} :catch_1bd

    :try_start_18b
    invoke-direct {v8, v9}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    .end local v4    # "referer":Ljava/lang/String;
    .end local v5    # "url":Ljava/lang/String;
    .end local v6    # "mirror":Z
    .end local v25    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local p4    # "$completion":Lkotlin/coroutines/Continuation;
    throw v8

    .line 57
    .end local v7    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v4    # "referer":Ljava/lang/String;
    .restart local v5    # "url":Ljava/lang/String;
    .restart local v6    # "mirror":Z
    .restart local v25    # "$result":Ljava/lang/Object;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local p4    # "$completion":Lkotlin/coroutines/Continuation;
    :cond_18f
    new-instance v7, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    iget-object v8, v1, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v8}, Lcom/lagradost/CatalogSite;->getLabel()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v9
    :try_end_19b
    .catch Ljava/util/concurrent/CancellationException; {:try_start_18b .. :try_end_19b} :catch_1bf
    .catch Ljava/lang/Exception; {:try_start_18b .. :try_end_19b} :catch_1bd

    :try_start_19b
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ": HTTP "

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ". \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0441\u0430\u0439\u0442 \u0432\u043e \u0432\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u043e\u043c \u0431\u0440\u0430\u0443\u0437\u0435\u0440\u0435 Cloudstream."

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8
    :try_end_1b4
    .catch Ljava/util/concurrent/CancellationException; {:try_start_19b .. :try_end_1b4} :catch_1b8
    .catch Ljava/lang/Exception; {:try_start_19b .. :try_end_1b4} :catch_1bd

    :try_start_1b4
    invoke-direct {v7, v8}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    .end local v4    # "referer":Ljava/lang/String;
    .end local v5    # "url":Ljava/lang/String;
    .end local v6    # "mirror":Z
    .end local v25    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local p4    # "$completion":Lkotlin/coroutines/Continuation;
    throw v7
    :try_end_1b8
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1b4 .. :try_end_1b8} :catch_1bf
    .catch Ljava/lang/Exception; {:try_start_1b4 .. :try_end_1b8} :catch_1bd

    .line 63
    .end local v0    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    .restart local v4    # "referer":Ljava/lang/String;
    .restart local v5    # "url":Ljava/lang/String;
    .restart local v6    # "mirror":Z
    .restart local v25    # "$result":Ljava/lang/Object;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local p4    # "$completion":Lkotlin/coroutines/Continuation;
    :catch_1b8
    move-exception v0

    move-object/from16 v9, v27

    goto/16 :goto_243

    .line 64
    :catch_1bd
    move-exception v0

    goto :goto_1f8

    .line 63
    :catch_1bf
    move-exception v0

    move-object/from16 v9, v27

    goto/16 :goto_243

    .line 64
    .end local v4    # "referer":Ljava/lang/String;
    .end local v5    # "url":Ljava/lang/String;
    .end local v6    # "mirror":Z
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "referer":Ljava/lang/String;
    .restart local p3    # "mirror":Z
    :catch_1c4
    move-exception v0

    move-object/from16 v3, v26

    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move/from16 v6, p3

    goto :goto_1f8

    .line 63
    :catch_1ce
    move-exception v0

    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move/from16 v6, p3

    move-object/from16 v9, v27

    goto/16 :goto_243

    .line 64
    .end local v25    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v14    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :catch_1d9
    move-exception v0

    move-object/from16 v27, v15

    move-object/from16 v3, v25

    move-object/from16 v25, v14

    goto :goto_1f2

    .line 63
    :catch_1e1
    move-exception v0

    move-object/from16 v25, v14

    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move/from16 v6, p3

    move-object v9, v15

    .end local v14    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v25    # "$result":Ljava/lang/Object;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    goto :goto_243

    .line 64
    .end local v25    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v14    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :catch_1ec
    move-exception v0

    move-object v3, v12

    move-object/from16 v25, v14

    move-object/from16 v27, v15

    :goto_1f2
    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move/from16 v6, p3

    .line 65
    .end local v14    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "referer":Ljava/lang/String;
    .end local p3    # "mirror":Z
    .local v0, "e":Ljava/lang/Exception;
    .restart local v4    # "referer":Ljava/lang/String;
    .restart local v5    # "url":Ljava/lang/String;
    .restart local v6    # "mirror":Z
    .restart local v25    # "$result":Ljava/lang/Object;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    :goto_1f8
    if-eqz v6, :cond_1fe

    invoke-direct {v1, v5}, Lcom/lagradost/VideoHubProvider;->failover(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    :cond_1fe
    move-object/from16 v7, v20

    .line 66
    .local v7, "alternative":Ljava/lang/String;
    if-eqz v7, :cond_238

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v9, v27

    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .local v9, "$continuation":Lkotlin/coroutines/Continuation;
    iput-object v8, v9, Lcom/lagradost/VideoHubProvider$fetch$1;->L$0:Ljava/lang/Object;

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iput-object v8, v9, Lcom/lagradost/VideoHubProvider$fetch$1;->L$1:Ljava/lang/Object;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iput-object v8, v9, Lcom/lagradost/VideoHubProvider$fetch$1;->L$2:Ljava/lang/Object;

    invoke-static {v7}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iput-object v8, v9, Lcom/lagradost/VideoHubProvider$fetch$1;->L$3:Ljava/lang/Object;

    iput-boolean v6, v9, Lcom/lagradost/VideoHubProvider$fetch$1;->Z$0:Z

    const/4 v8, 0x2

    iput v8, v9, Lcom/lagradost/VideoHubProvider$fetch$1;->label:I

    const/4 v8, 0x0

    invoke-direct {v1, v7, v4, v8, v9}, Lcom/lagradost/VideoHubProvider;->fetch(Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v3, :cond_22c

    .line 53
    invoke-static/range {v3 .. v3}, Lcom/videobundle/fixes/MetadataSupport;->remember(Ljava/lang/Object;)V

    return-object v3

    .line 66
    :cond_22c
    move-object v3, v7

    move-object/from16 v28, v4

    move-object v4, v0

    move v0, v6

    move-object v6, v5

    move-object/from16 v5, v28

    .line 67
    .end local v7    # "alternative":Ljava/lang/String;
    .local v0, "mirror":Z
    .local v3, "alternative":Ljava/lang/String;
    .local v4, "e":Ljava/lang/Exception;
    .local v5, "referer":Ljava/lang/String;
    .local v6, "url":Ljava/lang/String;
    :goto_234
    invoke-static/range {v14 .. v14}, Lcom/videobundle/fixes/MetadataSupport;->remember(Ljava/lang/Object;)V

    return-object v14

    .end local v3    # "alternative":Ljava/lang/String;
    .end local v9    # "$continuation":Lkotlin/coroutines/Continuation;
    .local v0, "e":Ljava/lang/Exception;
    .local v4, "referer":Ljava/lang/String;
    .local v5, "url":Ljava/lang/String;
    .local v6, "mirror":Z
    .restart local v7    # "alternative":Ljava/lang/String;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    :cond_238
    throw v0

    .line 63
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v4    # "referer":Ljava/lang/String;
    .end local v5    # "url":Ljava/lang/String;
    .end local v6    # "mirror":Z
    .end local v7    # "alternative":Ljava/lang/String;
    .end local v25    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v14    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "referer":Ljava/lang/String;
    .restart local p3    # "mirror":Z
    :catch_239
    move-exception v0

    move-object/from16 v25, v14

    move-object v9, v15

    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move/from16 v6, p3

    .end local v14    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "referer":Ljava/lang/String;
    .end local p3    # "mirror":Z
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .restart local v4    # "referer":Ljava/lang/String;
    .restart local v5    # "url":Ljava/lang/String;
    .restart local v6    # "mirror":Z
    .restart local v9    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v25    # "$result":Ljava/lang/Object;
    :goto_243
    throw v0
.end method

.method static synthetic fetch$default(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 7

    .line 53
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_8

    invoke-virtual {p0}, Lcom/lagradost/VideoHubProvider;->getMainUrl()Ljava/lang/String;

    move-result-object p2

    :cond_8
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_d

    const/4 p3, 0x1

    :cond_d
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lagradost/VideoHubProvider;->fetch(Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private final getRequestHeaders()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 42
    const/4 v0, 0x2

    new-array v0, v0, [Lkotlin/Pair;

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider;->ua:Ljava/lang/String;

    const-string v2, "User-Agent"

    invoke-static {v2, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "Accept-Language"

    const-string v2, "ru,en;q=0.9"

    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic lambda$EpGtcAU0dPdOEQytjgC2oZxFZYc(Ljava/util/Map$Entry;)Ljava/lang/CharSequence;
    .registers 1

    invoke-static {p0}, Lcom/lagradost/VideoHubProvider;->posterHeaders$lambda$0(Ljava/util/Map$Entry;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic lambda$J4D1eigzQtYxAMUfPlvMIBOVo5c(Lcom/lagradost/VideoCard;Lcom/lagradost/VideoHubProvider;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/lagradost/VideoHubProvider;->toResult$lambda$0(Lcom/lagradost/VideoCard;Lcom/lagradost/VideoHubProvider;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic lambda$Mx_BiALXllB5AfarFDzd1M3XhmY(Lorg/json/JSONArray;I)Ljava/lang/CharSequence;
    .registers 2

    invoke-static {p0, p1}, Lcom/lagradost/VideoHubProvider;->translated$lambda$1(Lorg/json/JSONArray;I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic lambda$XJSavOqzIlO8FmvX8idv3KX-PO4(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/lagradost/VideoHubProvider;->loadLinks$lambda$0(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic lambda$vWnICdE1cb6sxv-HRebRESl_3PA(Ljava/util/ArrayList;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lcom/lagradost/VideoHubProvider;->loadLinks$resolve$lambda$2(Ljava/util/ArrayList;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method private static final loadLinks$emit(Lcom/lagradost/VideoHubProvider;Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 40
    .param p0, "this$0"    # Lcom/lagradost/VideoHubProvider;
    .param p1, "emitted"    # Ljava/util/HashSet;
    .param p2, "wrapped"    # Lkotlin/jvm/functions/Function1;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "ref"    # Ljava/lang/String;
    .param p5, "sourceHeaders"    # Ljava/util/Map;
    .param p6, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lagradost/VideoHubProvider;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v15, p3

    move-object/from16 v14, p4

    move-object/from16 v13, p6

    instance-of v0, v13, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;

    if-eqz v0, :cond_1c

    move-object v0, v13

    check-cast v0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;

    iget v2, v0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_1c

    iget v2, v0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->label:I

    goto :goto_21

    :cond_1c
    new-instance v0, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;

    invoke-direct {v0, v13}, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;-><init>(Lkotlin/coroutines/Continuation;)V

    :goto_21
    move-object v11, v0

    .local v11, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v12, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->result:Ljava/lang/Object;

    .local v12, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v10

    .line 189
    iget v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->label:I

    const-string v9, "p"

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    if-eqz v0, :cond_10c

    if-eq v0, v6, :cond_ca

    if-eq v0, v7, :cond_95

    if-ne v0, v8, :cond_8d

    iget v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->I$0:I

    .local v0, "knownQuality":I
    iget-boolean v2, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->Z$0:Z

    .local v2, "hls":Z
    iget-object v3, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$10:Ljava/lang/Object;

    check-cast v3, Lcom/lagradost/HlsVariant;

    .local v3, "track":Lcom/lagradost/HlsVariant;
    iget-object v4, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$9:Ljava/lang/Object;

    check-cast v4, Ljava/util/Iterator;

    iget-object v5, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$8:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    .local v5, "height":Ljava/lang/Integer;
    iget-object v6, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$7:Ljava/lang/Object;

    check-cast v6, Ljava/util/List;

    .local v6, "tracks":Ljava/util/List;
    iget-object v7, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$6:Ljava/lang/Object;

    check-cast v7, Ljava/util/Map;

    .local v7, "mediaHeaders":Ljava/util/Map;
    iget-object v8, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$5:Ljava/lang/Object;

    check-cast v8, Ljava/util/Map;

    move/from16 v17, v0

    .end local v0    # "knownQuality":I
    .end local p5    # "sourceHeaders":Ljava/util/Map;
    .local v8, "sourceHeaders":Ljava/util/Map;
    .local v17, "knownQuality":I
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$4:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .end local p4    # "ref":Ljava/lang/String;
    .local v0, "ref":Ljava/lang/String;
    iget-object v14, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$3:Ljava/lang/Object;

    check-cast v14, Ljava/lang/String;

    .end local p3    # "url":Ljava/lang/String;
    .local v14, "url":Ljava/lang/String;
    iget-object v15, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$2:Ljava/lang/Object;

    check-cast v15, Lkotlin/jvm/functions/Function1;

    move-object/from16 p4, v0

    .end local v0    # "ref":Ljava/lang/String;
    .end local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v15, "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "ref":Ljava/lang/String;
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$1:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    move-object/from16 p1, v0

    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoHubProvider;

    .end local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local v0, "this$0":Lcom/lagradost/VideoHubProvider;
    invoke-static {v12}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v16, v5

    move-object/from16 v18, v8

    move-object/from16 v20, v12

    move-object/from16 v19, v14

    move-object v5, v15

    move/from16 v14, v17

    const/16 v26, 0x3

    move-object/from16 v15, p1

    move-object/from16 v12, p4

    move-object/from16 v17, v6

    move-object v8, v7

    move-object v7, v10

    move-object v6, v11

    move-object v11, v0

    move v10, v2

    move-object v0, v13

    move-object v13, v9

    move-object v9, v4

    goto/16 :goto_3d0

    .end local v0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v2    # "hls":Z
    .end local v3    # "track":Lcom/lagradost/HlsVariant;
    .end local v5    # "height":Ljava/lang/Integer;
    .end local v6    # "tracks":Ljava/util/List;
    .end local v7    # "mediaHeaders":Ljava/util/Map;
    .end local v8    # "sourceHeaders":Ljava/util/Map;
    .end local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v12    # "$result":Ljava/lang/Object;
    .end local v14    # "url":Ljava/lang/String;
    .end local v15    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v17    # "knownQuality":I
    .restart local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "url":Ljava/lang/String;
    .restart local p5    # "sourceHeaders":Ljava/util/Map;
    :cond_8d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v12    # "$result":Ljava/lang/Object;
    :cond_95
    iget v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->I$0:I

    .local v0, "knownQuality":I
    iget-boolean v2, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->Z$0:Z

    .restart local v2    # "hls":Z
    iget-object v3, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$8:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    .local v3, "height":Ljava/lang/Integer;
    iget-object v4, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$7:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    .local v4, "tracks":Ljava/util/List;
    iget-object v5, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$6:Ljava/lang/Object;

    check-cast v5, Ljava/util/Map;

    .local v5, "mediaHeaders":Ljava/util/Map;
    iget-object v6, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$5:Ljava/lang/Object;

    check-cast v6, Ljava/util/Map;

    .end local p5    # "sourceHeaders":Ljava/util/Map;
    .local v6, "sourceHeaders":Ljava/util/Map;
    iget-object v7, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$4:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    .end local p4    # "ref":Ljava/lang/String;
    .local v7, "ref":Ljava/lang/String;
    iget-object v8, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$3:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    .end local p3    # "url":Ljava/lang/String;
    .local v8, "url":Ljava/lang/String;
    iget-object v14, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$2:Ljava/lang/Object;

    check-cast v14, Lkotlin/jvm/functions/Function1;

    .end local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v14, "wrapped":Lkotlin/jvm/functions/Function1;
    iget-object v15, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$1:Ljava/lang/Object;

    check-cast v15, Ljava/util/HashSet;

    move/from16 v17, v0

    .end local v0    # "knownQuality":I
    .end local p1    # "emitted":Ljava/util/HashSet;
    .local v15, "emitted":Ljava/util/HashSet;
    .restart local v17    # "knownQuality":I
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoHubProvider;

    .end local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local v0, "this$0":Lcom/lagradost/VideoHubProvider;
    invoke-static {v12}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v13, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    move-object v11, v10

    goto/16 :goto_32a

    .end local v0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v2    # "hls":Z
    .end local v3    # "height":Ljava/lang/Integer;
    .end local v4    # "tracks":Ljava/util/List;
    .end local v5    # "mediaHeaders":Ljava/util/Map;
    .end local v6    # "sourceHeaders":Ljava/util/Map;
    .end local v7    # "ref":Ljava/lang/String;
    .end local v8    # "url":Ljava/lang/String;
    .end local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .end local v17    # "knownQuality":I
    .restart local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p1    # "emitted":Ljava/util/HashSet;
    .restart local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "url":Ljava/lang/String;
    .restart local p4    # "ref":Ljava/lang/String;
    .restart local p5    # "sourceHeaders":Ljava/util/Map;
    :cond_ca
    iget-boolean v2, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->Z$0:Z

    .restart local v2    # "hls":Z
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$6:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/util/Map;

    .local v3, "mediaHeaders":Ljava/util/Map;
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$5:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/util/Map;

    .end local p5    # "sourceHeaders":Ljava/util/Map;
    .local v4, "sourceHeaders":Ljava/util/Map;
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$4:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .end local p4    # "ref":Ljava/lang/String;
    .local v5, "ref":Ljava/lang/String;
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$3:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Ljava/lang/String;

    .end local p3    # "url":Ljava/lang/String;
    .restart local v8    # "url":Ljava/lang/String;
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$2:Ljava/lang/Object;

    move-object v14, v0

    check-cast v14, Lkotlin/jvm/functions/Function1;

    .end local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$1:Ljava/lang/Object;

    move-object v15, v0

    check-cast v15, Ljava/util/HashSet;

    .end local p1    # "emitted":Ljava/util/HashSet;
    .restart local v15    # "emitted":Ljava/util/HashSet;
    iget-object v0, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$0:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/lagradost/VideoHubProvider;

    .end local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local v1, "this$0":Lcom/lagradost/VideoHubProvider;
    :try_start_ef
    invoke-static {v12}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_f2
    .catch Ljava/util/concurrent/CancellationException; {:try_start_ef .. :try_end_f2} :catch_105
    .catch Ljava/lang/Exception; {:try_start_ef .. :try_end_f2} :catch_fb

    move-object/from16 v30, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    move-object v11, v10

    goto/16 :goto_198

    .line 195
    :catch_fb
    move-exception v0

    move-object/from16 v30, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    move-object v11, v10

    goto/16 :goto_1f8

    :catch_105
    move-exception v0

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    goto/16 :goto_21b

    .line 189
    .end local v1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v2    # "hls":Z
    .end local v3    # "mediaHeaders":Ljava/util/Map;
    .end local v4    # "sourceHeaders":Ljava/util/Map;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v8    # "url":Ljava/lang/String;
    .end local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .restart local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p1    # "emitted":Ljava/util/HashSet;
    .restart local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "url":Ljava/lang/String;
    .restart local p4    # "ref":Ljava/lang/String;
    .restart local p5    # "sourceHeaders":Ljava/util/Map;
    :cond_10c
    invoke-static {v12}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 190
    move-object v0, v15

    check-cast v0, Ljava/lang/CharSequence;

    const-string v2, ".m3u8"

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v0, v2, v6}, Lkotlin/text/StringsKt;->contains(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v8

    .line 191
    .local v8, "hls":Z
    invoke-direct {v1, v14}, Lcom/lagradost/VideoHubProvider;->posterHeaders(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    move-object/from16 v5, p5

    invoke-static {v0, v5}, Lkotlin/collections/MapsKt;->plus(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    .line 192
    .local v4, "mediaHeaders":Ljava/util/Map;
    if-eqz v8, :cond_21c

    .line 193
    :try_start_126
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v2

    const/4 v0, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const-wide/16 v21, 0xf

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0xef8

    const/16 v27, 0x0

    iput-object v1, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$0:Ljava/lang/Object;

    move-object/from16 v3, p1

    iput-object v3, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$1:Ljava/lang/Object;

    move-object/from16 v13, p2

    iput-object v13, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$2:Ljava/lang/Object;

    iput-object v15, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$3:Ljava/lang/Object;

    iput-object v14, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$4:Ljava/lang/Object;

    invoke-static/range {p5 .. p5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$5:Ljava/lang/Object;

    iput-object v4, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$6:Ljava/lang/Object;

    iput-boolean v8, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->Z$0:Z

    iput v6, v11, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->label:I
    :try_end_159
    .catch Ljava/util/concurrent/CancellationException; {:try_start_126 .. :try_end_159} :catch_204
    .catch Ljava/lang/Exception; {:try_start_126 .. :try_end_159} :catch_1de

    move-object/from16 v3, p3

    move-object/from16 v29, v4

    .end local v4    # "mediaHeaders":Ljava/util/Map;
    .local v29, "mediaHeaders":Ljava/util/Map;
    move-object/from16 v5, p4

    move v7, v6

    move-object v6, v0

    move-object/from16 v7, v17

    move/from16 v28, v8

    .end local v8    # "hls":Z
    .local v28, "hls":Z
    move/from16 v8, v18

    move-object/from16 v30, v9

    move/from16 v9, v19

    move-object/from16 v31, v10

    move-object/from16 v10, v20

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    .end local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v12    # "$result":Ljava/lang/Object;
    .local v19, "$continuation":Lkotlin/coroutines/Continuation;
    .local v20, "$result":Ljava/lang/Object;
    move-wide/from16 v11, v21

    move-object/from16 v13, v23

    move/from16 v14, v24

    move-object/from16 v15, v25

    move-object/from16 v16, v19

    move/from16 v17, v26

    move-object/from16 v18, v27

    :try_start_181
    invoke-static/range {v2 .. v18}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v12
    :try_end_185
    .catch Ljava/util/concurrent/CancellationException; {:try_start_181 .. :try_end_185} :catch_1ce
    .catch Ljava/lang/Exception; {:try_start_181 .. :try_end_185} :catch_1bc

    move-object/from16 v11, v31

    if-ne v12, v11, :cond_18a

    .line 189
    return-object v11

    .line 193
    :cond_18a
    move-object/from16 v15, p1

    move-object/from16 v14, p2

    move-object/from16 v8, p3

    move-object/from16 v5, p4

    move-object/from16 v4, p5

    move/from16 v2, v28

    move-object/from16 v3, v29

    .line 189
    .end local v28    # "hls":Z
    .end local v29    # "mediaHeaders":Ljava/util/Map;
    .end local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local p1    # "emitted":Ljava/util/HashSet;
    .end local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local p3    # "url":Ljava/lang/String;
    .end local p4    # "ref":Ljava/lang/String;
    .end local p5    # "sourceHeaders":Ljava/util/Map;
    .restart local v1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "hls":Z
    .restart local v3    # "mediaHeaders":Ljava/util/Map;
    .local v4, "sourceHeaders":Ljava/util/Map;
    .restart local v5    # "ref":Ljava/lang/String;
    .local v8, "url":Ljava/lang/String;
    .restart local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v15    # "emitted":Ljava/util/HashSet;
    :goto_198
    :try_start_198
    check-cast v12, Lcom/lagradost/nicehttp/NiceResponse;

    move-object v0, v12

    .line 194
    .local v0, "response":Lcom/lagradost/nicehttp/NiceResponse;
    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v6

    const/16 v7, 0xc8

    if-ne v6, v7, :cond_1b2

    sget-object v6, Lcom/lagradost/HlsPlaylist;->INSTANCE:Lcom/lagradost/HlsPlaylist;

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getUrl()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v7, v9}, Lcom/lagradost/HlsPlaylist;->variants(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    goto :goto_1fc

    :cond_1b2
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v6
    :try_end_1b6
    .catch Ljava/util/concurrent/CancellationException; {:try_start_198 .. :try_end_1b6} :catch_1b9
    .catch Ljava/lang/Exception; {:try_start_198 .. :try_end_1b6} :catch_1b7

    goto :goto_1fc

    .line 195
    .end local v0    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    :catch_1b7
    move-exception v0

    goto :goto_1f8

    :catch_1b9
    move-exception v0

    goto/16 :goto_21b

    .end local v1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v2    # "hls":Z
    .end local v3    # "mediaHeaders":Ljava/util/Map;
    .end local v4    # "sourceHeaders":Ljava/util/Map;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v8    # "url":Ljava/lang/String;
    .end local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .restart local v28    # "hls":Z
    .restart local v29    # "mediaHeaders":Ljava/util/Map;
    .restart local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p1    # "emitted":Ljava/util/HashSet;
    .restart local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "url":Ljava/lang/String;
    .restart local p4    # "ref":Ljava/lang/String;
    .restart local p5    # "sourceHeaders":Ljava/util/Map;
    :catch_1bc
    move-exception v0

    move-object/from16 v11, v31

    move-object/from16 v15, p1

    move-object/from16 v14, p2

    move-object/from16 v8, p3

    move-object/from16 v5, p4

    move-object/from16 v4, p5

    move/from16 v2, v28

    move-object/from16 v3, v29

    goto :goto_1f8

    :catch_1ce
    move-exception v0

    move-object/from16 v15, p1

    move-object/from16 v14, p2

    move-object/from16 v8, p3

    move-object/from16 v5, p4

    move-object/from16 v4, p5

    move/from16 v2, v28

    move-object/from16 v3, v29

    goto :goto_21b

    .end local v19    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v20    # "$result":Ljava/lang/Object;
    .end local v28    # "hls":Z
    .end local v29    # "mediaHeaders":Ljava/util/Map;
    .local v4, "mediaHeaders":Ljava/util/Map;
    .local v8, "hls":Z
    .restart local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v12    # "$result":Ljava/lang/Object;
    :catch_1de
    move-exception v0

    move-object/from16 v29, v4

    move/from16 v28, v8

    move-object/from16 v30, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    move-object v11, v10

    move-object/from16 v15, p1

    move-object/from16 v14, p2

    move-object/from16 v8, p3

    move-object/from16 v5, p4

    move-object/from16 v4, p5

    move/from16 v2, v28

    move-object/from16 v3, v29

    .end local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v12    # "$result":Ljava/lang/Object;
    .end local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local p1    # "emitted":Ljava/util/HashSet;
    .end local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local p3    # "url":Ljava/lang/String;
    .end local p4    # "ref":Ljava/lang/String;
    .end local p5    # "sourceHeaders":Ljava/util/Map;
    .local v0, "<unused var>":Ljava/lang/Exception;
    .restart local v1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "hls":Z
    .restart local v3    # "mediaHeaders":Ljava/util/Map;
    .local v4, "sourceHeaders":Ljava/util/Map;
    .restart local v5    # "ref":Ljava/lang/String;
    .local v8, "url":Ljava/lang/String;
    .restart local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v15    # "emitted":Ljava/util/HashSet;
    .restart local v19    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v20    # "$result":Ljava/lang/Object;
    :goto_1f8
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v6

    .end local v0    # "<unused var>":Ljava/lang/Exception;
    :goto_1fc
    move-object v0, v1

    move v10, v2

    move-object v9, v3

    move-object/from16 v16, v4

    move-object v13, v5

    move-object v12, v8

    goto :goto_23a

    .end local v1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v2    # "hls":Z
    .end local v3    # "mediaHeaders":Ljava/util/Map;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .end local v19    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v20    # "$result":Ljava/lang/Object;
    .local v4, "mediaHeaders":Ljava/util/Map;
    .local v8, "hls":Z
    .restart local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v12    # "$result":Ljava/lang/Object;
    .restart local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p1    # "emitted":Ljava/util/HashSet;
    .restart local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "url":Ljava/lang/String;
    .restart local p4    # "ref":Ljava/lang/String;
    .restart local p5    # "sourceHeaders":Ljava/util/Map;
    :catch_204
    move-exception v0

    move-object/from16 v29, v4

    move/from16 v28, v8

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    move-object/from16 v15, p1

    move-object/from16 v14, p2

    move-object/from16 v8, p3

    move-object/from16 v5, p4

    move-object/from16 v4, p5

    move/from16 v2, v28

    move-object/from16 v3, v29

    .end local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v12    # "$result":Ljava/lang/Object;
    .end local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local p1    # "emitted":Ljava/util/HashSet;
    .end local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local p3    # "url":Ljava/lang/String;
    .end local p4    # "ref":Ljava/lang/String;
    .end local p5    # "sourceHeaders":Ljava/util/Map;
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .restart local v1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "hls":Z
    .restart local v3    # "mediaHeaders":Ljava/util/Map;
    .local v4, "sourceHeaders":Ljava/util/Map;
    .restart local v5    # "ref":Ljava/lang/String;
    .local v8, "url":Ljava/lang/String;
    .restart local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v15    # "emitted":Ljava/util/HashSet;
    .restart local v19    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v20    # "$result":Ljava/lang/Object;
    :goto_21b
    throw v0

    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    .end local v1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v2    # "hls":Z
    .end local v3    # "mediaHeaders":Ljava/util/Map;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .end local v19    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v20    # "$result":Ljava/lang/Object;
    .local v4, "mediaHeaders":Ljava/util/Map;
    .local v8, "hls":Z
    .restart local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v12    # "$result":Ljava/lang/Object;
    .restart local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p1    # "emitted":Ljava/util/HashSet;
    .restart local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "url":Ljava/lang/String;
    .restart local p4    # "ref":Ljava/lang/String;
    .restart local p5    # "sourceHeaders":Ljava/util/Map;
    :cond_21c
    move-object/from16 v29, v4

    move/from16 v28, v8

    move-object/from16 v30, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    move-object v11, v10

    .end local v4    # "mediaHeaders":Ljava/util/Map;
    .end local v8    # "hls":Z
    .end local v11    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v12    # "$result":Ljava/lang/Object;
    .restart local v19    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v20    # "$result":Ljava/lang/Object;
    .restart local v28    # "hls":Z
    .restart local v29    # "mediaHeaders":Ljava/util/Map;
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v6

    move-object/from16 v15, p1

    move-object/from16 v14, p2

    move-object/from16 v12, p3

    move-object/from16 v13, p4

    move-object/from16 v16, p5

    move-object v0, v1

    move/from16 v10, v28

    move-object/from16 v9, v29

    .line 192
    .end local v28    # "hls":Z
    .end local v29    # "mediaHeaders":Ljava/util/Map;
    .end local p0    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local p1    # "emitted":Ljava/util/HashSet;
    .end local p2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local p3    # "url":Ljava/lang/String;
    .end local p4    # "ref":Ljava/lang/String;
    .end local p5    # "sourceHeaders":Ljava/util/Map;
    .local v0, "this$0":Lcom/lagradost/VideoHubProvider;
    .local v9, "mediaHeaders":Ljava/util/Map;
    .local v10, "hls":Z
    .local v12, "url":Ljava/lang/String;
    .local v13, "ref":Ljava/lang/String;
    .restart local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v15    # "emitted":Ljava/util/HashSet;
    .local v16, "sourceHeaders":Ljava/util/Map;
    :goto_23a
    move-object v8, v6

    .line 203
    .local v8, "tracks":Ljava/util/List;
    new-instance v1, Lkotlin/text/Regex;

    const-string v2, "(\\d{3,4})p"

    invoke-direct {v1, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v2, v12

    check-cast v2, Ljava/lang/CharSequence;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {v1, v2, v3, v5, v4}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v1

    if-eqz v1, :cond_266

    invoke-interface {v1}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_266

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_267

    invoke-static {v1}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    if-nez v1, :cond_264

    goto :goto_267

    :cond_264
    move-object v4, v1

    goto :goto_289

    :cond_266
    const/4 v2, 0x1

    .line 204
    :cond_267
    :goto_267
    new-instance v1, Lkotlin/text/Regex;

    const-string v6, "\\d{3,4}[xX](\\d{3,4})"

    invoke-direct {v1, v6}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v6, v12

    check-cast v6, Ljava/lang/CharSequence;

    invoke-static {v1, v6, v3, v5, v4}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object v1

    if-eqz v1, :cond_289

    invoke-interface {v1}, Lkotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_289

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_289

    invoke-static {v1}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    .line 203
    :cond_289
    :goto_289
    move-object/from16 v17, v4

    .line 205
    .local v17, "height":Ljava/lang/Integer;
    if-eqz v17, :cond_292

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_298

    :cond_292
    sget-object v1, Lcom/lagradost/cloudstream3/utils/Qualities;->Unknown:Lcom/lagradost/cloudstream3/utils/Qualities;

    invoke-virtual {v1}, Lcom/lagradost/cloudstream3/utils/Qualities;->getValue()I

    move-result v1

    :goto_298
    move v7, v1

    .line 206
    .local v7, "knownQuality":I
    const-string v1, "\u0410\u0432\u0442\u043e"

    if-eqz v10, :cond_2ac

    move-object v3, v8

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    xor-int/2addr v2, v3

    if-eqz v2, :cond_2ac

    move-object/from16 v18, v1

    move-object/from16 v6, v30

    goto :goto_2d8

    :cond_2ac
    if-eqz v17, :cond_2cf

    move-object/from16 v2, v17

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 248
    nop

    .local v2, "it":I
    const/4 v3, 0x0

    .line 206
    .local v3, "$i$a$-let-VideoHubProvider$loadLinks$emit$2":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-object/from16 v6, v30

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .end local v2    # "it":I
    .end local v3    # "$i$a$-let-VideoHubProvider$loadLinks$emit$2":I
    if-nez v2, :cond_2cc

    goto :goto_2d1

    :cond_2cc
    move-object/from16 v18, v2

    goto :goto_2d8

    :cond_2cf
    move-object/from16 v6, v30

    :goto_2d1
    if-eqz v10, :cond_2d4

    goto :goto_2d6

    :cond_2d4
    const-string v1, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    :goto_2d6
    move-object/from16 v18, v1

    :goto_2d8
    move-object/from16 v4, v19

    .end local v19    # "$continuation":Lkotlin/coroutines/Continuation;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    iput-object v0, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$0:Ljava/lang/Object;

    iput-object v15, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$1:Ljava/lang/Object;

    iput-object v14, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$2:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$3:Ljava/lang/Object;

    iput-object v13, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$4:Ljava/lang/Object;

    invoke-static/range {v16 .. v16}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$5:Ljava/lang/Object;

    iput-object v9, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$6:Ljava/lang/Object;

    iput-object v8, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$7:Ljava/lang/Object;

    invoke-static/range {v17 .. v17}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$8:Ljava/lang/Object;

    iput-boolean v10, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->Z$0:Z

    iput v7, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->I$0:I

    iput v5, v4, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->label:I

    move-object v1, v15

    move-object v2, v14

    move-object v3, v0

    .end local v4    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v19    # "$continuation":Lkotlin/coroutines/Continuation;
    move-object v4, v13

    move-object v5, v9

    move-object/from16 v21, v13

    move-object v13, v6

    .end local v13    # "ref":Ljava/lang/String;
    .local v21, "ref":Ljava/lang/String;
    move-object v6, v12

    move/from16 v22, v7

    .end local v7    # "knownQuality":I
    .local v22, "knownQuality":I
    move-object/from16 v23, v8

    .end local v8    # "tracks":Ljava/util/List;
    .local v23, "tracks":Ljava/util/List;
    move-object/from16 v8, v18

    move-object/from16 v29, v9

    .end local v9    # "mediaHeaders":Ljava/util/Map;
    .restart local v29    # "mediaHeaders":Ljava/util/Map;
    move v9, v10

    move/from16 v28, v10

    .end local v10    # "hls":Z
    .restart local v28    # "hls":Z
    move-object/from16 v10, v19

    invoke-static/range {v1 .. v10}, Lcom/lagradost/VideoHubProvider;->loadLinks$emit$deliver(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v11, :cond_31b

    .line 189
    return-object v11

    .line 206
    :cond_31b
    move-object v8, v12

    move-object/from16 v6, v16

    move-object/from16 v3, v17

    move-object/from16 v7, v21

    move/from16 v17, v22

    move-object/from16 v4, v23

    move/from16 v2, v28

    move-object/from16 v5, v29

    .line 207
    .end local v12    # "url":Ljava/lang/String;
    .end local v16    # "sourceHeaders":Ljava/util/Map;
    .end local v21    # "ref":Ljava/lang/String;
    .end local v22    # "knownQuality":I
    .end local v23    # "tracks":Ljava/util/List;
    .end local v28    # "hls":Z
    .end local v29    # "mediaHeaders":Ljava/util/Map;
    .local v2, "hls":Z
    .local v3, "height":Ljava/lang/Integer;
    .local v4, "tracks":Ljava/util/List;
    .local v5, "mediaHeaders":Ljava/util/Map;
    .restart local v6    # "sourceHeaders":Ljava/util/Map;
    .local v7, "ref":Ljava/lang/String;
    .local v8, "url":Ljava/lang/String;
    .local v17, "knownQuality":I
    :goto_32a
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v9, v1

    move v10, v2

    move-object/from16 v16, v3

    move-object/from16 v18, v6

    move-object v12, v7

    move-object v7, v11

    move-object/from16 v6, v19

    move-object v11, v0

    move-object/from16 v19, v8

    move-object/from16 v0, p6

    move-object v8, v5

    move-object v5, v14

    move/from16 v14, v17

    move-object/from16 v17, v4

    .end local v2    # "hls":Z
    .end local v3    # "height":Ljava/lang/Integer;
    .end local v4    # "tracks":Ljava/util/List;
    .end local v7    # "ref":Ljava/lang/String;
    .end local p6    # "$completion":Lkotlin/coroutines/Continuation;
    .local v0, "$completion":Lkotlin/coroutines/Continuation;
    .local v5, "wrapped":Lkotlin/jvm/functions/Function1;
    .local v6, "$continuation":Lkotlin/coroutines/Continuation;
    .local v8, "mediaHeaders":Ljava/util/Map;
    .restart local v10    # "hls":Z
    .local v11, "this$0":Lcom/lagradost/VideoHubProvider;
    .local v12, "ref":Ljava/lang/String;
    .local v14, "knownQuality":I
    .local v16, "height":Ljava/lang/Integer;
    .local v17, "tracks":Ljava/util/List;
    .local v18, "sourceHeaders":Ljava/util/Map;
    .local v19, "url":Ljava/lang/String;
    :goto_343
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lcom/lagradost/HlsVariant;

    .local v21, "track":Lcom/lagradost/HlsVariant;
    invoke-virtual/range {v21 .. v21}, Lcom/lagradost/HlsVariant;->getUrl()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v21}, Lcom/lagradost/HlsVariant;->getHeight()I

    move-result v23

    invoke-virtual/range {v21 .. v21}, Lcom/lagradost/HlsVariant;->getHeight()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x1

    iput-object v11, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$0:Ljava/lang/Object;

    iput-object v15, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$1:Ljava/lang/Object;

    iput-object v5, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$2:Ljava/lang/Object;

    invoke-static/range {v19 .. v19}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$3:Ljava/lang/Object;

    iput-object v12, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$4:Ljava/lang/Object;

    invoke-static/range {v18 .. v18}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$5:Ljava/lang/Object;

    iput-object v8, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$6:Ljava/lang/Object;

    invoke-static/range {v17 .. v17}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$7:Ljava/lang/Object;

    invoke-static/range {v16 .. v16}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$8:Ljava/lang/Object;

    iput-object v9, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$9:Ljava/lang/Object;

    invoke-static/range {v21 .. v21}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->L$10:Ljava/lang/Object;

    iput-boolean v10, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->Z$0:Z

    iput v14, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->I$0:I

    const/4 v4, 0x3

    iput v4, v6, Lcom/lagradost/VideoHubProvider$loadLinks$emit$1;->label:I

    move-object v1, v15

    move-object v2, v5

    move-object v3, v11

    move/from16 v26, v4

    move-object v4, v12

    move-object/from16 v27, v5

    .end local v5    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v27, "wrapped":Lkotlin/jvm/functions/Function1;
    move-object v5, v8

    move-object/from16 v28, v6

    .end local v6    # "$continuation":Lkotlin/coroutines/Continuation;
    .local v28, "$continuation":Lkotlin/coroutines/Continuation;
    move-object/from16 v6, v22

    move-object/from16 v32, v7

    move/from16 v7, v23

    move-object/from16 v22, v8

    .end local v8    # "mediaHeaders":Ljava/util/Map;
    .local v22, "mediaHeaders":Ljava/util/Map;
    move-object/from16 v8, v24

    move-object/from16 v23, v9

    move/from16 v9, v25

    move/from16 v24, v10

    .end local v10    # "hls":Z
    .local v24, "hls":Z
    move-object/from16 v10, v28

    invoke-static/range {v1 .. v10}, Lcom/lagradost/VideoHubProvider;->loadLinks$emit$deliver(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v2, v32

    if-ne v1, v2, :cond_3c5

    .line 189
    return-object v2

    .line 207
    :cond_3c5
    move-object v7, v2

    move-object/from16 v8, v22

    move-object/from16 v9, v23

    move/from16 v10, v24

    move-object/from16 v5, v27

    move-object/from16 v6, v28

    .end local v21    # "track":Lcom/lagradost/HlsVariant;
    .end local v22    # "mediaHeaders":Ljava/util/Map;
    .end local v24    # "hls":Z
    .end local v27    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v28    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v5    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v6    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v8    # "mediaHeaders":Ljava/util/Map;
    .restart local v10    # "hls":Z
    :goto_3d0
    goto/16 :goto_343

    .line 208
    :cond_3d2
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static synthetic loadLinks$emit$default(Lcom/lagradost/VideoHubProvider;Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 16

    .line 189
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_8

    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object p5

    :cond_8
    move-object v5, p5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p6

    invoke-static/range {v0 .. v6}, Lcom/lagradost/VideoHubProvider;->loadLinks$emit(Lcom/lagradost/VideoHubProvider;Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static final loadLinks$emit$deliver(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 26
    .param p0, "emitted"    # Ljava/util/HashSet;
    .param p1, "wrapped"    # Lkotlin/jvm/functions/Function1;
    .param p2, "this$0"    # Lcom/lagradost/VideoHubProvider;
    .param p3, "$ref"    # Ljava/lang/String;
    .param p4, "mediaHeaders"    # Ljava/util/Map;
    .param p5, "link"    # Ljava/lang/String;
    .param p6, "height"    # I
    .param p7, "label"    # Ljava/lang/String;
    .param p8, "isHls"    # Z
    .param p9, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/lagradost/cloudstream3/utils/ExtractorLink;",
            "Lkotlin/Unit;",
            ">;",
            "Lcom/lagradost/VideoHubProvider;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Z",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move/from16 v0, p6

    move/from16 v1, p8

    move-object/from16 v2, p9

    instance-of v3, v2, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;

    if-eqz v3, :cond_1a

    move-object v3, v2

    check-cast v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;

    iget v4, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->label:I

    const/high16 v5, -0x80000000

    and-int/2addr v4, v5

    if-eqz v4, :cond_1a

    iget v4, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->label:I

    sub-int/2addr v4, v5

    iput v4, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->label:I

    goto :goto_1f

    :cond_1a
    new-instance v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;

    invoke-direct {v3, v2}, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_1f
    iget-object v10, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->result:Ljava/lang/Object;

    .local v10, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v11

    .line 196
    iget v4, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->label:I

    const/4 v5, 0x1

    if-eqz v4, :cond_5f

    if-ne v4, v5, :cond_57

    iget-boolean v1, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->Z$0:Z

    .end local p8    # "isHls":Z
    .local v1, "isHls":Z
    iget v0, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->I$0:I

    .end local p6    # "height":I
    .local v0, "height":I
    iget-object v4, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$7:Ljava/lang/Object;

    check-cast v4, Lkotlin/jvm/functions/Function1;

    iget-object v5, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$6:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    .end local p7    # "label":Ljava/lang/String;
    .local v5, "label":Ljava/lang/String;
    iget-object v6, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$5:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .end local p5    # "link":Ljava/lang/String;
    .local v6, "link":Ljava/lang/String;
    iget-object v7, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$4:Ljava/lang/Object;

    check-cast v7, Ljava/util/Map;

    .end local p4    # "mediaHeaders":Ljava/util/Map;
    .local v7, "mediaHeaders":Ljava/util/Map;
    iget-object v8, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$3:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    .end local p3    # "$ref":Ljava/lang/String;
    .local v8, "$ref":Ljava/lang/String;
    iget-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$2:Ljava/lang/Object;

    check-cast v9, Lcom/lagradost/VideoHubProvider;

    .end local p2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local v9, "this$0":Lcom/lagradost/VideoHubProvider;
    iget-object v11, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$1:Ljava/lang/Object;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    .end local p1    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v11, "wrapped":Lkotlin/jvm/functions/Function1;
    iget-object v12, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$0:Ljava/lang/Object;

    check-cast v12, Ljava/util/HashSet;

    .end local p0    # "emitted":Ljava/util/HashSet;
    .local v12, "emitted":Ljava/util/HashSet;
    invoke-static {v10}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v14, v5

    move-object v5, v10

    goto/16 :goto_e9

    .end local v0    # "height":I
    .end local v1    # "isHls":Z
    .end local v3    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v5    # "label":Ljava/lang/String;
    .end local v6    # "link":Ljava/lang/String;
    .end local v7    # "mediaHeaders":Ljava/util/Map;
    .end local v8    # "$ref":Ljava/lang/String;
    .end local v9    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v10    # "$result":Ljava/lang/Object;
    .end local v11    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v12    # "emitted":Ljava/util/HashSet;
    .restart local p0    # "emitted":Ljava/util/HashSet;
    .restart local p1    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p3    # "$ref":Ljava/lang/String;
    .restart local p4    # "mediaHeaders":Ljava/util/Map;
    .restart local p5    # "link":Ljava/lang/String;
    .restart local p6    # "height":I
    .restart local p7    # "label":Ljava/lang/String;
    .restart local p8    # "isHls":Z
    :cond_57
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .restart local v3    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v10    # "$result":Ljava/lang/Object;
    :cond_5f
    invoke-static {v10}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 197
    move-object/from16 v12, p0

    move-object/from16 v13, p5

    invoke-virtual {v12, v13}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_ed

    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/VideoHubProvider;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/VideoHubProvider;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " \u00b7 "

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v14, p7

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    if-eqz v1, :cond_8f

    sget-object v7, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    goto :goto_91

    :cond_8f
    sget-object v7, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->VIDEO:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    :goto_91
    new-instance v8, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;

    const/4 v9, 0x0

    move-object/from16 v15, p3

    move-object/from16 v5, p4

    invoke-direct {v8, v15, v5, v0, v9}, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$2;-><init>(Ljava/lang/String;Ljava/util/Map;ILkotlin/coroutines/Continuation;)V

    check-cast v8, Lkotlin/jvm/functions/Function2;

    invoke-static/range {p0 .. p0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$0:Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$1:Ljava/lang/Object;

    invoke-static/range {p2 .. p2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$2:Ljava/lang/Object;

    invoke-static/range {p3 .. p3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$3:Ljava/lang/Object;

    invoke-static/range {p4 .. p4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$4:Ljava/lang/Object;

    invoke-static/range {p5 .. p5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$5:Ljava/lang/Object;

    invoke-static/range {p7 .. p7}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$6:Ljava/lang/Object;

    move-object/from16 v9, p1

    iput-object v9, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->L$7:Ljava/lang/Object;

    iput v0, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->I$0:I

    iput-boolean v1, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->Z$0:Z

    const/4 v0, 0x1

    iput v0, v3, Lcom/lagradost/VideoHubProvider$loadLinks$emit$deliver$1;->label:I

    move-object v5, v6

    move-object/from16 v6, p5

    move-object v9, v3

    invoke-static/range {v4 .. v9}, Lcom/lagradost/cloudstream3/utils/ExtractorApiKt;->newExtractorLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v11, :cond_dd

    .line 196
    return-object v11

    .line 197
    :cond_dd
    move-object/from16 v4, p1

    move-object v11, v4

    move-object/from16 v9, p2

    move-object/from16 v7, p4

    move-object v5, v0

    move-object v6, v13

    move-object v8, v15

    move/from16 v0, p6

    .end local p0    # "emitted":Ljava/util/HashSet;
    .end local p1    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local p2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local p3    # "$ref":Ljava/lang/String;
    .end local p4    # "mediaHeaders":Ljava/util/Map;
    .end local p5    # "link":Ljava/lang/String;
    .end local p6    # "height":I
    .end local p7    # "label":Ljava/lang/String;
    .end local p8    # "isHls":Z
    .restart local v0    # "height":I
    .restart local v1    # "isHls":Z
    .restart local v6    # "link":Ljava/lang/String;
    .restart local v7    # "mediaHeaders":Ljava/util/Map;
    .restart local v8    # "$ref":Ljava/lang/String;
    .restart local v9    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v11    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v12    # "emitted":Ljava/util/HashSet;
    .local v14, "label":Ljava/lang/String;
    :goto_e9
    invoke-interface {v4, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_fb

    .end local v0    # "height":I
    .end local v1    # "isHls":Z
    .end local v6    # "link":Ljava/lang/String;
    .end local v7    # "mediaHeaders":Ljava/util/Map;
    .end local v8    # "$ref":Ljava/lang/String;
    .end local v9    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v11    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v12    # "emitted":Ljava/util/HashSet;
    .end local v14    # "label":Ljava/lang/String;
    .restart local p0    # "emitted":Ljava/util/HashSet;
    .restart local p1    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p3    # "$ref":Ljava/lang/String;
    .restart local p4    # "mediaHeaders":Ljava/util/Map;
    .restart local p5    # "link":Ljava/lang/String;
    .restart local p6    # "height":I
    .restart local p7    # "label":Ljava/lang/String;
    .restart local p8    # "isHls":Z
    :cond_ed
    move-object/from16 v15, p3

    move-object/from16 v14, p7

    move-object/from16 v11, p1

    move-object/from16 v9, p2

    move-object/from16 v7, p4

    move/from16 v0, p6

    move-object v6, v13

    move-object v8, v15

    .line 202
    .end local p0    # "emitted":Ljava/util/HashSet;
    .end local p1    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local p2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local p3    # "$ref":Ljava/lang/String;
    .end local p4    # "mediaHeaders":Ljava/util/Map;
    .end local p5    # "link":Ljava/lang/String;
    .end local p6    # "height":I
    .end local p7    # "label":Ljava/lang/String;
    .end local p8    # "isHls":Z
    .restart local v0    # "height":I
    .restart local v1    # "isHls":Z
    .restart local v6    # "link":Ljava/lang/String;
    .restart local v7    # "mediaHeaders":Ljava/util/Map;
    .restart local v8    # "$ref":Ljava/lang/String;
    .restart local v9    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v11    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v12    # "emitted":Ljava/util/HashSet;
    .restart local v14    # "label":Ljava/lang/String;
    :goto_fb
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v4
.end method

.method private static final loadLinks$lambda$0(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;
    .registers 4
    .param p0, "$emitted"    # Ljava/util/HashSet;
    .param p1, "$callback"    # Lkotlin/jvm/functions/Function1;
    .param p2, "link"    # Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    const-string v0, "link"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 188
    invoke-virtual {p2}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-interface {p1, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_12
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 38
    .param p0, "visited"    # Ljava/util/HashSet;
    .param p1, "this$0"    # Lcom/lagradost/VideoHubProvider;
    .param p2, "$subtitleCallback"    # Lkotlin/jvm/functions/Function1;
    .param p3, "wrapped"    # Lkotlin/jvm/functions/Function1;
    .param p4, "emitted"    # Ljava/util/HashSet;
    .param p5, "url"    # Ljava/lang/String;
    .param p6, "ref"    # Ljava/lang/String;
    .param p7, "depth"    # I
    .param p8, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/lagradost/VideoHubProvider;",
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
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move/from16 v6, p7

    move-object/from16 v7, p8

    instance-of v0, v7, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;

    if-eqz v0, :cond_22

    move-object v0, v7

    check-cast v0, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;

    iget v8, v0, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    const/high16 v9, -0x80000000

    and-int/2addr v8, v9

    if-eqz v8, :cond_22

    iget v8, v0, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    sub-int/2addr v8, v9

    iput v8, v0, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    goto :goto_27

    :cond_22
    new-instance v0, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;

    invoke-direct {v0, v7}, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;-><init>(Lkotlin/coroutines/Continuation;)V

    :goto_27
    move-object v8, v0

    .local v8, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v9, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->result:Ljava/lang/Object;

    .local v9, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v10

    .line 209
    iget v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    const-string v12, "location(...)"

    packed-switch v0, :pswitch_data_656

    move-object/from16 v13, p3

    move-object/from16 v14, p4

    .end local v8    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v9    # "$result":Ljava/lang/Object;
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v8, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v8    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v9    # "$result":Ljava/lang/Object;
    :pswitch_41
    iget v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    .end local p7    # "depth":I
    .local v0, "depth":I
    iget-object v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$11:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .local v6, "original":Ljava/lang/String;
    iget-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$10:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    .local v11, "embed":Ljava/lang/String;
    iget-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    check-cast v15, Ljava/util/Iterator;

    iget-object v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    check-cast v13, Ljava/lang/String;

    .local v13, "unpacked":Ljava/lang/String;
    iget-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    check-cast v14, Lorg/jsoup/nodes/Document;

    move/from16 p7, v0

    .end local v0    # "depth":I
    .local v14, "doc":Lorg/jsoup/nodes/Document;
    .restart local p7    # "depth":I
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .end local p6    # "ref":Ljava/lang/String;
    .local v0, "ref":Ljava/lang/String;
    iget-object v5, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    move-object v4, v5

    check-cast v4, Ljava/lang/String;

    .end local p5    # "url":Ljava/lang/String;
    .local v4, "url":Ljava/lang/String;
    iget-object v5, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashSet;

    move-object/from16 p6, v0

    .end local v0    # "ref":Ljava/lang/String;
    .end local p4    # "emitted":Ljava/util/HashSet;
    .local v5, "emitted":Ljava/util/HashSet;
    .restart local p6    # "ref":Ljava/lang/String;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    move-object/from16 p3, v0

    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    .end local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v0, "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    move-object v2, v3

    check-cast v2, Lcom/lagradost/VideoHubProvider;

    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local v2, "this$0":Lcom/lagradost/VideoHubProvider;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    move-object v1, v3

    check-cast v1, Ljava/util/HashSet;

    .end local p0    # "visited":Ljava/util/HashSet;
    .local v1, "visited":Ljava/util/HashSet;
    invoke-static {v9}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, v2

    move-object/from16 v17, v9

    move-object/from16 v21, v12

    move-object v12, v15

    move-object v2, v1

    move-object v15, v5

    move-object v9, v6

    move-object/from16 v1, p3

    move-object/from16 v5, p6

    move/from16 v6, p7

    goto/16 :goto_60e

    .end local v0    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "emitted":Ljava/util/HashSet;
    .end local v6    # "original":Ljava/lang/String;
    .end local v11    # "embed":Ljava/lang/String;
    .end local v13    # "unpacked":Ljava/lang/String;
    .end local v14    # "doc":Lorg/jsoup/nodes/Document;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "emitted":Ljava/util/HashSet;
    .restart local p5    # "url":Ljava/lang/String;
    :pswitch_90
    iget v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    .end local p7    # "depth":I
    .local v0, "depth":I
    iget-object v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$11:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .restart local v6    # "original":Ljava/lang/String;
    iget-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$10:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    .restart local v11    # "embed":Ljava/lang/String;
    iget-object v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    check-cast v13, Ljava/util/Iterator;

    iget-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    check-cast v14, Ljava/lang/String;

    .local v14, "unpacked":Ljava/lang/String;
    iget-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    check-cast v15, Lorg/jsoup/nodes/Document;

    move/from16 p7, v0

    .end local v0    # "depth":I
    .local v15, "doc":Lorg/jsoup/nodes/Document;
    .restart local p7    # "depth":I
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .end local p6    # "ref":Ljava/lang/String;
    .local v0, "ref":Ljava/lang/String;
    iget-object v5, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    move-object v4, v5

    check-cast v4, Ljava/lang/String;

    .end local p5    # "url":Ljava/lang/String;
    .restart local v4    # "url":Ljava/lang/String;
    iget-object v5, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashSet;

    move-object/from16 p6, v0

    .end local v0    # "ref":Ljava/lang/String;
    .end local p4    # "emitted":Ljava/util/HashSet;
    .restart local v5    # "emitted":Ljava/util/HashSet;
    .restart local p6    # "ref":Ljava/lang/String;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    move-object/from16 p3, v0

    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    .end local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v0, "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    move-object v2, v3

    check-cast v2, Lcom/lagradost/VideoHubProvider;

    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    move-object v1, v3

    check-cast v1, Ljava/util/HashSet;

    .end local p0    # "visited":Ljava/util/HashSet;
    .restart local v1    # "visited":Ljava/util/HashSet;
    invoke-static {v9}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, v2

    move-object/from16 v17, v9

    move-object/from16 v19, v12

    move-object v12, v15

    move-object v2, v1

    move-object v15, v5

    move-object v9, v6

    move-object/from16 v1, p3

    move-object/from16 v5, p6

    move/from16 v6, p7

    goto/16 :goto_597

    .end local v0    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "emitted":Ljava/util/HashSet;
    .end local v6    # "original":Ljava/lang/String;
    .end local v11    # "embed":Ljava/lang/String;
    .end local v14    # "unpacked":Ljava/lang/String;
    .end local v15    # "doc":Lorg/jsoup/nodes/Document;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "emitted":Ljava/util/HashSet;
    .restart local p5    # "url":Ljava/lang/String;
    :pswitch_df
    iget v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    .end local p7    # "depth":I
    .local v0, "depth":I
    iget-object v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$10:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .local v6, "media":Ljava/lang/String;
    iget-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    check-cast v11, Ljava/util/Iterator;

    iget-object v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    check-cast v13, Ljava/lang/String;

    .restart local v13    # "unpacked":Ljava/lang/String;
    iget-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    check-cast v14, Lorg/jsoup/nodes/Document;

    .local v14, "doc":Lorg/jsoup/nodes/Document;
    iget-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    move-object v5, v15

    check-cast v5, Ljava/lang/String;

    .end local p6    # "ref":Ljava/lang/String;
    .local v5, "ref":Ljava/lang/String;
    iget-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    move-object v4, v15

    check-cast v4, Ljava/lang/String;

    .end local p5    # "url":Ljava/lang/String;
    .restart local v4    # "url":Ljava/lang/String;
    iget-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    check-cast v15, Ljava/util/HashSet;

    move/from16 p7, v0

    .end local v0    # "depth":I
    .end local p4    # "emitted":Ljava/util/HashSet;
    .local v15, "emitted":Ljava/util/HashSet;
    .restart local p7    # "depth":I
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    move-object/from16 p3, v0

    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    .end local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v0, "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    move-object v2, v3

    check-cast v2, Lcom/lagradost/VideoHubProvider;

    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    move-object v1, v3

    check-cast v1, Ljava/util/HashSet;

    .end local p0    # "visited":Ljava/util/HashSet;
    .restart local v1    # "visited":Ljava/util/HashSet;
    invoke-static {v9}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move/from16 v6, p7

    move-object v3, v0

    move-object/from16 v0, p3

    goto/16 :goto_444

    .end local v0    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v6    # "media":Ljava/lang/String;
    .end local v13    # "unpacked":Ljava/lang/String;
    .end local v14    # "doc":Lorg/jsoup/nodes/Document;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "emitted":Ljava/util/HashSet;
    .restart local p5    # "url":Ljava/lang/String;
    .restart local p6    # "ref":Ljava/lang/String;
    :pswitch_11f
    iget v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    .end local p7    # "depth":I
    .local v6, "depth":I
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .end local p6    # "ref":Ljava/lang/String;
    .restart local v5    # "ref":Ljava/lang/String;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    .end local p5    # "url":Ljava/lang/String;
    .restart local v4    # "url":Ljava/lang/String;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Ljava/util/HashSet;

    .end local p4    # "emitted":Ljava/util/HashSet;
    .local v11, "emitted":Ljava/util/HashSet;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Lkotlin/jvm/functions/Function1;

    .end local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v13, "wrapped":Lkotlin/jvm/functions/Function1;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lkotlin/jvm/functions/Function1;

    .end local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v3, "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lcom/lagradost/VideoHubProvider;

    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljava/util/HashSet;

    .end local p0    # "visited":Ljava/util/HashSet;
    .restart local v1    # "visited":Ljava/util/HashSet;
    :try_start_144
    invoke-static {v9}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_147
    .catch Ljava/util/concurrent/CancellationException; {:try_start_144 .. :try_end_147} :catch_151
    .catch Ljava/lang/Exception; {:try_start_144 .. :try_end_147} :catch_14e

    move-object v14, v11

    move-object/from16 v18, v12

    move-object v11, v10

    move-object v10, v9

    goto/16 :goto_337

    .line 221
    :catch_14e
    move-exception v0

    goto/16 :goto_648

    :catch_151
    move-exception v0

    goto/16 :goto_64d

    .line 209
    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v3    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v6    # "depth":I
    .end local v11    # "emitted":Ljava/util/HashSet;
    .end local v13    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "emitted":Ljava/util/HashSet;
    .restart local p5    # "url":Ljava/lang/String;
    .restart local p6    # "ref":Ljava/lang/String;
    .restart local p7    # "depth":I
    :pswitch_154
    iget v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    .end local p7    # "depth":I
    .local v0, "depth":I
    iget-object v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    check-cast v6, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .local v6, "link":Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    iget-object v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    check-cast v13, Ljava/util/Iterator;

    iget-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    check-cast v14, Ljava/util/ArrayList;

    .local v14, "extracted":Ljava/util/ArrayList;
    iget-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    move-object v5, v15

    check-cast v5, Ljava/lang/String;

    .end local p6    # "ref":Ljava/lang/String;
    .restart local v5    # "ref":Ljava/lang/String;
    iget-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    move-object v4, v15

    check-cast v4, Ljava/lang/String;

    .end local p5    # "url":Ljava/lang/String;
    .restart local v4    # "url":Ljava/lang/String;
    iget-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    check-cast v15, Ljava/util/HashSet;

    .end local p4    # "emitted":Ljava/util/HashSet;
    .restart local v15    # "emitted":Ljava/util/HashSet;
    iget-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    move/from16 p7, v0

    .end local v0    # "depth":I
    .end local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v11, "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p7    # "depth":I
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    .end local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v0, "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    move-object v2, v3

    check-cast v2, Lcom/lagradost/VideoHubProvider;

    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    move-object v1, v3

    check-cast v1, Ljava/util/HashSet;

    .end local p0    # "visited":Ljava/util/HashSet;
    .restart local v1    # "visited":Ljava/util/HashSet;
    invoke-static {v9}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, v0

    move-object/from16 v18, v12

    move-object v0, v13

    move-object v13, v11

    move-object v11, v10

    move-object v10, v9

    move-object v9, v8

    move-object v8, v7

    move/from16 v7, p7

    goto/16 :goto_2d8

    .end local v0    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v6    # "link":Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    .end local v11    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v14    # "extracted":Ljava/util/ArrayList;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "emitted":Ljava/util/HashSet;
    .restart local p5    # "url":Ljava/lang/String;
    .restart local p6    # "ref":Ljava/lang/String;
    :pswitch_194
    iget v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    .end local p7    # "depth":I
    .local v6, "depth":I
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Ljava/util/ArrayList;

    .local v11, "extracted":Ljava/util/ArrayList;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .end local p6    # "ref":Ljava/lang/String;
    .restart local v5    # "ref":Ljava/lang/String;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    .end local p5    # "url":Ljava/lang/String;
    .restart local v4    # "url":Ljava/lang/String;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Ljava/util/HashSet;

    .end local p4    # "emitted":Ljava/util/HashSet;
    .local v13, "emitted":Ljava/util/HashSet;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    move-object v14, v0

    check-cast v14, Lkotlin/jvm/functions/Function1;

    .end local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v14, "wrapped":Lkotlin/jvm/functions/Function1;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lkotlin/jvm/functions/Function1;

    .end local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local v3    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lcom/lagradost/VideoHubProvider;

    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljava/util/HashSet;

    .end local p0    # "visited":Ljava/util/HashSet;
    .restart local v1    # "visited":Ljava/util/HashSet;
    :try_start_1be
    invoke-static {v9}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_1c1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1be .. :try_end_1c1} :catch_1d0
    .catch Ljava/lang/Exception; {:try_start_1be .. :try_end_1c1} :catch_1c8

    move-object/from16 v28, v14

    move-object v14, v13

    move-object/from16 v13, v28

    goto/16 :goto_231

    .line 214
    :catch_1c8
    move-exception v0

    move-object/from16 v28, v14

    move-object v14, v13

    move-object/from16 v13, v28

    goto/16 :goto_231

    :catch_1d0
    move-exception v0

    move-object/from16 v28, v14

    move-object v14, v13

    move-object/from16 v13, v28

    goto/16 :goto_300

    .line 209
    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v3    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v6    # "depth":I
    .end local v11    # "extracted":Ljava/util/ArrayList;
    .end local v13    # "emitted":Ljava/util/HashSet;
    .end local v14    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "emitted":Ljava/util/HashSet;
    .restart local p5    # "url":Ljava/lang/String;
    .restart local p6    # "ref":Ljava/lang/String;
    .restart local p7    # "depth":I
    :pswitch_1d8
    invoke-static {v9}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 210
    const/4 v11, 0x3

    if-gt v6, v11, :cond_64e

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1ea

    move-object/from16 v13, p3

    move-object/from16 v14, p4

    goto/16 :goto_652

    .line 212
    :cond_1ea
    invoke-direct {v2, v4}, Lcom/lagradost/VideoHubProvider;->ownUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_301

    .line 213
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v11, v0

    .line 214
    .restart local v11    # "extracted":Ljava/util/ArrayList;
    :try_start_1f6
    new-instance v0, Lcom/lagradost/-$$Lambda$VideoHubProvider$vWnICdE1cb6sxv-HRebRESl_3PA;

    invoke-direct {v0, v11}, Lcom/lagradost/-$$Lambda$VideoHubProvider$vWnICdE1cb6sxv-HRebRESl_3PA;-><init>(Ljava/util/ArrayList;)V

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    iput-object v2, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    iput-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;
    :try_end_201
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1f6 .. :try_end_201} :catch_22a
    .catch Ljava/lang/Exception; {:try_start_1f6 .. :try_end_201} :catch_224

    move-object/from16 v13, p3

    :try_start_203
    iput-object v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;
    :try_end_205
    .catch Ljava/util/concurrent/CancellationException; {:try_start_203 .. :try_end_205} :catch_222
    .catch Ljava/lang/Exception; {:try_start_203 .. :try_end_205} :catch_220

    move-object/from16 v14, p4

    :try_start_207
    iput-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    iput-object v4, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    iput-object v5, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    iput-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    iput v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    const/4 v15, 0x1

    iput v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    invoke-static {v4, v5, v3, v0, v8}, Lcom/lagradost/cloudstream3/utils/ExtractorApiKt;->loadExtractor(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0
    :try_end_218
    .catch Ljava/util/concurrent/CancellationException; {:try_start_207 .. :try_end_218} :catch_21d
    .catch Ljava/lang/Exception; {:try_start_207 .. :try_end_218} :catch_21b

    if-ne v0, v10, :cond_231

    .line 209
    return-object v10

    .line 214
    :catch_21b
    move-exception v0

    goto :goto_231

    :catch_21d
    move-exception v0

    goto/16 :goto_300

    :catch_220
    move-exception v0

    goto :goto_227

    :catch_222
    move-exception v0

    goto :goto_22d

    :catch_224
    move-exception v0

    move-object/from16 v13, p3

    :goto_227
    move-object/from16 v14, p4

    goto :goto_231

    :catch_22a
    move-exception v0

    move-object/from16 v13, p3

    :goto_22d
    move-object/from16 v14, p4

    goto/16 :goto_300

    .end local p0    # "visited":Ljava/util/HashSet;
    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local p4    # "emitted":Ljava/util/HashSet;
    .end local p5    # "url":Ljava/lang/String;
    .end local p6    # "ref":Ljava/lang/String;
    .end local p7    # "depth":I
    .restart local v1    # "visited":Ljava/util/HashSet;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v3    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local v4    # "url":Ljava/lang/String;
    .restart local v5    # "ref":Ljava/lang/String;
    .restart local v6    # "depth":I
    .local v13, "wrapped":Lkotlin/jvm/functions/Function1;
    .local v14, "emitted":Ljava/util/HashSet;
    :cond_231
    :goto_231
    nop

    .line 215
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-string v15, "iterator(...)"

    invoke-static {v0, v15}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .end local p8    # "$completion":Lkotlin/coroutines/Continuation;
    .local v7, "$completion":Lkotlin/coroutines/Continuation;
    :goto_23b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2e3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    move-object/from16 p7, v7

    .end local v7    # "$completion":Lkotlin/coroutines/Continuation;
    .local p7, "$completion":Lkotlin/coroutines/Continuation;
    const-string v7, "next(...)"

    invoke-static {v15, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v7, v15

    check-cast v7, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .line 216
    .local v7, "link":Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    invoke-virtual {v7}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getType()Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    move-result-object v15

    move-object/from16 p8, v9

    .end local v9    # "$result":Ljava/lang/Object;
    .local p8, "$result":Ljava/lang/Object;
    sget-object v9, Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;->M3U8:Lcom/lagradost/cloudstream3/utils/ExtractorLinkType;

    if-eq v15, v9, :cond_277

    invoke-virtual {v7}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    const-string v15, ".m3u8"

    check-cast v15, Ljava/lang/CharSequence;

    move-object/from16 v18, v12

    const/4 v12, 0x1

    invoke-static {v9, v15, v12}, Lkotlin/text/StringsKt;->contains(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v9

    if-eqz v9, :cond_26d

    goto :goto_279

    .line 217
    :cond_26d
    invoke-interface {v13, v7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v7, p7

    move-object/from16 v9, p8

    move-object/from16 v12, v18

    goto :goto_23b

    .line 216
    :cond_277
    move-object/from16 v18, v12

    :goto_279
    invoke-virtual {v7}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getUrl()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getReferer()Ljava/lang/String;

    move-result-object v12

    check-cast v12, Ljava/lang/CharSequence;

    invoke-static {v12}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_28b

    .line 248
    const/4 v12, 0x0

    .line 216
    .local v12, "$i$a$-ifBlank-VideoHubProvider$loadLinks$resolve$4":I
    move-object v12, v5

    .end local v12    # "$i$a$-ifBlank-VideoHubProvider$loadLinks$resolve$4":I
    :cond_28b
    check-cast v12, Ljava/lang/String;

    invoke-virtual {v7}, Lcom/lagradost/cloudstream3/utils/ExtractorLink;->getHeaders()Ljava/util/Map;

    move-result-object v15

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    iput-object v2, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    iput-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    iput-object v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    iput-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    iput-object v4, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    iput-object v5, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    move-object/from16 v19, v1

    .end local v1    # "visited":Ljava/util/HashSet;
    .local v19, "visited":Ljava/util/HashSet;
    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    iput-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    invoke-static {v7}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    iput v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    const/4 v1, 0x2

    iput v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    move-object/from16 p0, v2

    move-object/from16 p1, v14

    move-object/from16 p2, v13

    move-object/from16 p3, v9

    move-object/from16 p4, v12

    move-object/from16 p5, v15

    move-object/from16 p6, v8

    invoke-static/range {p0 .. p6}, Lcom/lagradost/VideoHubProvider;->loadLinks$emit(Lcom/lagradost/VideoHubProvider;Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v10, :cond_2c9

    .line 209
    return-object v10

    .line 216
    :cond_2c9
    move-object v9, v8

    move-object v15, v14

    move-object/from16 v1, v19

    move-object/from16 v8, p7

    move-object v14, v11

    move-object v11, v10

    move-object/from16 v10, p8

    move-object/from16 v28, v7

    move v7, v6

    move-object/from16 v6, v28

    .end local v11    # "extracted":Ljava/util/ArrayList;
    .end local v19    # "visited":Ljava/util/HashSet;
    .end local p7    # "$completion":Lkotlin/coroutines/Continuation;
    .end local p8    # "$result":Ljava/lang/Object;
    .restart local v1    # "visited":Ljava/util/HashSet;
    .local v6, "link":Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    .local v7, "depth":I
    .local v8, "$completion":Lkotlin/coroutines/Continuation;
    .local v9, "$continuation":Lkotlin/coroutines/Continuation;
    .local v10, "$result":Ljava/lang/Object;
    .local v14, "extracted":Ljava/util/ArrayList;
    .restart local v15    # "emitted":Ljava/util/HashSet;
    :goto_2d8
    move v6, v7

    move-object v7, v8

    move-object v8, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v14

    move-object v14, v15

    move-object/from16 v12, v18

    goto/16 :goto_23b

    .line 219
    .end local v10    # "$result":Ljava/lang/Object;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .local v6, "depth":I
    .local v7, "$completion":Lkotlin/coroutines/Continuation;
    .local v8, "$continuation":Lkotlin/coroutines/Continuation;
    .local v9, "$result":Ljava/lang/Object;
    .restart local v11    # "extracted":Ljava/util/ArrayList;
    .local v14, "emitted":Ljava/util/HashSet;
    :cond_2e3
    move-object/from16 v19, v1

    move-object/from16 p7, v7

    move-object/from16 p8, v9

    move-object/from16 v18, v12

    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v7    # "$completion":Lkotlin/coroutines/Continuation;
    .end local v9    # "$result":Ljava/lang/Object;
    .restart local v19    # "visited":Ljava/util/HashSet;
    .restart local p7    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local p8    # "$result":Ljava/lang/Object;
    move-object v0, v14

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    if-eqz v0, :cond_2f9

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :cond_2f9
    move-object/from16 v7, p7

    move-object/from16 v9, p8

    move-object/from16 v1, v19

    goto :goto_307

    .line 214
    .end local v19    # "visited":Ljava/util/HashSet;
    .end local p7    # "$completion":Lkotlin/coroutines/Continuation;
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .restart local v1    # "visited":Ljava/util/HashSet;
    .restart local v9    # "$result":Ljava/lang/Object;
    .local p8, "$completion":Lkotlin/coroutines/Continuation;
    :goto_300
    throw v0

    .line 212
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v3    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v6    # "depth":I
    .end local v11    # "extracted":Ljava/util/ArrayList;
    .end local v13    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v14    # "emitted":Ljava/util/HashSet;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "emitted":Ljava/util/HashSet;
    .restart local p5    # "url":Ljava/lang/String;
    .restart local p6    # "ref":Ljava/lang/String;
    .local p7, "depth":I
    :cond_301
    move-object/from16 v13, p3

    move-object/from16 v14, p4

    move-object/from16 v18, v12

    .line 221
    .end local p0    # "visited":Ljava/util/HashSet;
    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local p2    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local p4    # "emitted":Ljava/util/HashSet;
    .end local p5    # "url":Ljava/lang/String;
    .end local p6    # "ref":Ljava/lang/String;
    .end local p7    # "depth":I
    .end local p8    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v1    # "visited":Ljava/util/HashSet;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v3    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local v4    # "url":Ljava/lang/String;
    .restart local v5    # "ref":Ljava/lang/String;
    .restart local v6    # "depth":I
    .restart local v7    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v13    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v14    # "emitted":Ljava/util/HashSet;
    :goto_307
    :try_start_307
    invoke-direct {v2, v4}, Lcom/lagradost/VideoHubProvider;->ownUrl(Ljava/lang/String;)Z

    move-result v0

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    iput-object v2, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    iput-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    iput-object v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    iput-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    const/4 v11, 0x0

    iput-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    iput-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    iput-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    iput v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    const/4 v11, 0x3

    iput v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    invoke-direct {v2, v4, v5, v0, v8}, Lcom/lagradost/VideoHubProvider;->fetch(Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0
    :try_end_331
    .catch Ljava/util/concurrent/CancellationException; {:try_start_307 .. :try_end_331} :catch_64b
    .catch Ljava/lang/Exception; {:try_start_307 .. :try_end_331} :catch_646

    if-ne v0, v10, :cond_334

    .line 209
    return-object v10

    .line 221
    :cond_334
    move-object v11, v10

    move-object v10, v9

    move-object v9, v0

    .end local v9    # "$result":Ljava/lang/Object;
    .restart local v10    # "$result":Ljava/lang/Object;
    :goto_337
    :try_start_337
    check-cast v9, Lorg/jsoup/nodes/Document;
    :try_end_339
    .catch Ljava/util/concurrent/CancellationException; {:try_start_337 .. :try_end_339} :catch_63e
    .catch Ljava/lang/Exception; {:try_start_337 .. :try_end_339} :catch_636

    .line 222
    .local v9, "doc":Lorg/jsoup/nodes/Document;
    const-string v0, "script:not([src])"

    invoke-virtual {v9, v0}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    const-string v12, "select(...)"

    invoke-static {v0, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v12, v0

    check-cast v12, Ljava/lang/Iterable;

    .local v12, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v15, 0x0

    .line 278
    .local v15, "$i$f$mapNotNull":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 p0, v1

    .end local v1    # "visited":Ljava/util/HashSet;
    .restart local p0    # "visited":Ljava/util/HashSet;
    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    .local v1, "destination$iv$iv":Ljava/util/Collection;
    move-object/from16 v17, v12

    .local v17, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/16 v19, 0x0

    .line 287
    .local v19, "$i$f$mapNotNullTo":I
    move-object/from16 v20, v17

    .local v20, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/16 v21, 0x0

    .line 288
    .local v21, "$i$f$forEach":I
    invoke-interface/range {v20 .. v20}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_35e
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_39a

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    .local v23, "element$iv$iv$iv":Ljava/lang/Object;
    move-object/from16 v24, v23

    .local v24, "element$iv$iv":Ljava/lang/Object;
    const/16 v25, 0x0

    .line 287
    .local v25, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object/from16 v26, v24

    check-cast v26, Lorg/jsoup/nodes/Element;

    .local v26, "script":Lorg/jsoup/nodes/Element;
    const/16 v27, 0x0

    .line 223
    .local v27, "$i$a$-mapNotNull-VideoHubProvider$loadLinks$resolve$unpacked$1":I
    :try_start_372
    new-instance v0, Lcom/lagradost/cloudstream3/utils/JsUnpacker;
    :try_end_374
    .catch Ljava/lang/Exception; {:try_start_372 .. :try_end_374} :catch_38c

    move-object/from16 p1, v2

    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    :try_start_376
    invoke-virtual/range {v26 .. v26}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/lagradost/cloudstream3/utils/JsUnpacker;-><init>(Ljava/lang/String;)V

    .local v0, "unpacker":Lcom/lagradost/cloudstream3/utils/JsUnpacker;
    invoke-virtual {v0}, Lcom/lagradost/cloudstream3/utils/JsUnpacker;->detect()Z

    move-result v2

    if-eqz v2, :cond_388

    invoke-virtual {v0}, Lcom/lagradost/cloudstream3/utils/JsUnpacker;->unpack()Ljava/lang/String;

    move-result-object v2
    :try_end_387
    .catch Ljava/lang/Exception; {:try_start_376 .. :try_end_387} :catch_38a

    goto :goto_390

    :cond_388
    const/4 v2, 0x0

    goto :goto_390

    .end local v0    # "unpacker":Lcom/lagradost/cloudstream3/utils/JsUnpacker;
    :catch_38a
    move-exception v0

    goto :goto_38f

    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    :catch_38c
    move-exception v0

    move-object/from16 p1, v2

    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    :goto_38f
    const/4 v2, 0x0

    .line 287
    .end local v26    # "script":Lorg/jsoup/nodes/Element;
    .end local v27    # "$i$a$-mapNotNull-VideoHubProvider$loadLinks$resolve$unpacked$1":I
    :goto_390
    if-eqz v2, :cond_397

    move-object v0, v2

    .line 289
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v2, 0x0

    .line 287
    .local v2, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 288
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v2    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v24    # "element$iv$iv":Ljava/lang/Object;
    .end local v25    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_397
    move-object/from16 v2, p1

    .end local v23    # "element$iv$iv$iv":Ljava/lang/Object;
    goto :goto_35e

    .line 290
    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local v2, "this$0":Lcom/lagradost/VideoHubProvider;
    :cond_39a
    move-object/from16 p1, v2

    .line 291
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v20    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$forEach":I
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    nop

    .end local v1    # "destination$iv$iv":Ljava/util/Collection;
    .end local v17    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v19    # "$i$f$mapNotNullTo":I
    move-object v0, v1

    check-cast v0, Ljava/util/List;

    .line 278
    nop

    .end local v12    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v15    # "$i$f$mapNotNull":I
    move-object/from16 v19, v0

    check-cast v19, Ljava/lang/Iterable;

    .line 224
    const-string v0, "\n"

    move-object/from16 v20, v0

    check-cast v20, Ljava/lang/CharSequence;

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x3e

    const/16 v27, 0x0

    invoke-static/range {v19 .. v27}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 222
    nop

    .line 225
    .local v0, "unpacked":Ljava/lang/String;
    sget-object v1, Lcom/lagradost/MediaParser;->INSTANCE:Lcom/lagradost/MediaParser;

    invoke-virtual {v9}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v12, v18

    invoke-static {v2, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v9, v2, v0}, Lcom/lagradost/MediaParser;->media(Lorg/jsoup/nodes/Document;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object/from16 v2, p1

    move-object v15, v14

    move-object v14, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v1

    move-object/from16 v1, p0

    move-object/from16 v28, v13

    move-object v13, v0

    move-object/from16 v0, v28

    .end local v10    # "$result":Ljava/lang/Object;
    .end local p0    # "visited":Ljava/util/HashSet;
    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local v0, "wrapped":Lkotlin/jvm/functions/Function1;
    .local v1, "visited":Ljava/util/HashSet;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local v9, "$result":Ljava/lang/Object;
    .local v13, "unpacked":Ljava/lang/String;
    .local v14, "doc":Lorg/jsoup/nodes/Document;
    .local v15, "emitted":Ljava/util/HashSet;
    :goto_3df
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_445

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    move-object/from16 v18, v7

    .end local v7    # "$completion":Lkotlin/coroutines/Continuation;
    .local v17, "media":Ljava/lang/String;
    .local v18, "$completion":Lkotlin/coroutines/Continuation;
    invoke-virtual {v14}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v19, 0x0

    const/16 v20, 0x20

    const/16 v21, 0x0

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    iput-object v2, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    iput-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    iput-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    iput-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    move-object/from16 v22, v1

    .end local v1    # "visited":Ljava/util/HashSet;
    .local v22, "visited":Ljava/util/HashSet;
    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    iput-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    iput-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    invoke-static/range {v17 .. v17}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$10:Ljava/lang/Object;

    iput v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    const/4 v1, 0x4

    iput v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    move-object/from16 p0, v2

    move-object/from16 p1, v15

    move-object/from16 p2, v0

    move-object/from16 p3, v17

    move-object/from16 p4, v7

    move-object/from16 p5, v19

    move-object/from16 p6, v8

    move/from16 p7, v20

    move-object/from16 p8, v21

    invoke-static/range {p0 .. p8}, Lcom/lagradost/VideoHubProvider;->loadLinks$emit$default(Lcom/lagradost/VideoHubProvider;Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v10, :cond_440

    .line 209
    return-object v10

    .line 225
    :cond_440
    move-object/from16 v7, v18

    move-object/from16 v1, v22

    .end local v17    # "media":Ljava/lang/String;
    .end local v18    # "$completion":Lkotlin/coroutines/Continuation;
    .end local v22    # "visited":Ljava/util/HashSet;
    .restart local v1    # "visited":Ljava/util/HashSet;
    .restart local v7    # "$completion":Lkotlin/coroutines/Continuation;
    :goto_444
    goto :goto_3df

    .line 226
    :cond_445
    move-object/from16 v22, v1

    move-object/from16 v18, v7

    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v7    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v18    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v22    # "visited":Ljava/util/HashSet;
    move-object v1, v15

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    const/4 v7, 0x1

    xor-int/2addr v1, v7

    if-eqz v1, :cond_457

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    .line 227
    :cond_457
    sget-object v1, Lcom/lagradost/MediaParser;->INSTANCE:Lcom/lagradost/MediaParser;

    invoke-virtual {v14}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v12}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v14, v7}, Lcom/lagradost/MediaParser;->embeds(Lorg/jsoup/nodes/Document;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v7, v14

    move-object v14, v13

    move-object v13, v1

    move-object v1, v0

    move-object v0, v3

    move-object v3, v2

    move-object/from16 v2, v22

    .end local v13    # "unpacked":Ljava/lang/String;
    .end local v22    # "visited":Ljava/util/HashSet;
    .local v0, "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v1, "wrapped":Lkotlin/jvm/functions/Function1;
    .local v2, "visited":Ljava/util/HashSet;
    .local v3, "this$0":Lcom/lagradost/VideoHubProvider;
    .local v7, "doc":Lorg/jsoup/nodes/Document;
    .local v14, "unpacked":Ljava/lang/String;
    :goto_470
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_631

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 229
    .local v11, "embed":Ljava/lang/String;
    nop

    .line 230
    nop

    .line 229
    move-object/from16 v17, v9

    .end local v9    # "$result":Ljava/lang/Object;
    .local v17, "$result":Ljava/lang/Object;
    new-instance v9, Ljava/net/URI;

    invoke-direct {v9, v11}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_536

    check-cast v9, Ljava/lang/CharSequence;

    move-object/from16 v20, v10

    move-object/from16 v19, v12

    const/4 v12, 0x1

    new-array v10, v12, [C

    const/16 v12, 0x26

    move-object/from16 v21, v11

    .end local v11    # "embed":Ljava/lang/String;
    .local v21, "embed":Ljava/lang/String;
    const/4 v11, 0x0

    aput-char v12, v10, v11

    const/4 v12, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x6

    const/16 v24, 0x0

    move-object/from16 p0, v9

    move-object/from16 p1, v10

    move/from16 p2, v12

    move/from16 p3, v22

    move/from16 p4, v23

    move-object/from16 p5, v24

    invoke-static/range {p0 .. p5}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v9

    if-eqz v9, :cond_531

    check-cast v9, Ljava/lang/Iterable;

    .local v9, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 292
    .local v10, "$i$f$firstOrNull":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_4bb
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4e9

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    .local v22, "element$iv":Ljava/lang/Object;
    move-object/from16 v11, v22

    check-cast v11, Ljava/lang/String;

    .local v11, "it":Ljava/lang/String;
    const/16 v23, 0x0

    .line 229
    .local v23, "$i$a$-firstOrNull-VideoHubProvider$loadLinks$resolve$original$1":I
    move-object/from16 p1, v9

    .end local v9    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .local p1, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const-string v9, "u="

    move/from16 p2, v10

    move-object/from16 p3, v12

    move-object/from16 v24, v13

    const/4 v10, 0x0

    const/4 v12, 0x2

    const/4 v13, 0x0

    .end local v10    # "$i$f$firstOrNull":I
    .local p2, "$i$f$firstOrNull":I
    invoke-static {v11, v9, v10, v12, v13}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v9

    .line 292
    .end local v11    # "it":Ljava/lang/String;
    .end local v23    # "$i$a$-firstOrNull-VideoHubProvider$loadLinks$resolve$original$1":I
    if-eqz v9, :cond_4df

    goto :goto_4f1

    :cond_4df
    move-object/from16 v9, p1

    move/from16 v10, p2

    move-object/from16 v12, p3

    move-object/from16 v13, v24

    const/4 v11, 0x0

    goto :goto_4bb

    .line 293
    .end local v22    # "element$iv":Ljava/lang/Object;
    .end local p1    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local p2    # "$i$f$firstOrNull":I
    .restart local v9    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .restart local v10    # "$i$f$firstOrNull":I
    :cond_4e9
    move-object/from16 p1, v9

    move/from16 p2, v10

    move-object/from16 v24, v13

    .end local v9    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$firstOrNull":I
    .restart local p1    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .restart local p2    # "$i$f$firstOrNull":I
    const/16 v22, 0x0

    .line 229
    .end local p1    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local p2    # "$i$f$firstOrNull":I
    :goto_4f1
    move-object/from16 v9, v22

    check-cast v9, Ljava/lang/String;

    if-eqz v9, :cond_533

    const/16 v10, 0x3d

    const/4 v11, 0x2

    const/4 v12, 0x0

    invoke-static {v9, v10, v12, v11, v12}, Lkotlin/text/StringsKt;->substringAfter$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 230
    if-eqz v9, :cond_52e

    .line 229
    nop

    .line 230
    nop

    .line 248
    .local v9, "it":Ljava/lang/String;
    const/4 v10, 0x0

    .line 230
    .local v10, "$i$a$-let-VideoHubProvider$loadLinks$resolve$original$2":I
    const-string v11, "UTF-8"

    invoke-static {v9, v11}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .end local v9    # "it":Ljava/lang/String;
    .end local v10    # "$i$a$-let-VideoHubProvider$loadLinks$resolve$original$2":I
    if-eqz v11, :cond_52e

    .line 229
    nop

    .line 230
    move-object v9, v11

    .line 248
    .restart local v9    # "it":Ljava/lang/String;
    const/4 v10, 0x0

    .line 230
    .local v10, "$i$a$-takeIf-VideoHubProvider$loadLinks$resolve$original$3":I
    const-string v12, "https://"

    move/from16 p0, v10

    move-object/from16 p1, v11

    const/4 v10, 0x0

    const/4 v11, 0x2

    const/4 v13, 0x0

    .end local v10    # "$i$a$-takeIf-VideoHubProvider$loadLinks$resolve$original$3":I
    .local p0, "$i$a$-takeIf-VideoHubProvider$loadLinks$resolve$original$3":I
    invoke-static {v9, v12, v10, v11, v13}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_526

    const-string v12, "http://"

    invoke-static {v9, v12, v10, v11, v13}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_527

    :cond_526
    const/4 v10, 0x1

    .end local v9    # "it":Ljava/lang/String;
    .end local p0    # "$i$a$-takeIf-VideoHubProvider$loadLinks$resolve$original$3":I
    :cond_527
    if-eqz v10, :cond_52c

    move-object/from16 v9, p1

    goto :goto_541

    :cond_52c
    move-object v9, v13

    goto :goto_541

    :cond_52e
    const/4 v11, 0x2

    const/4 v13, 0x0

    goto :goto_540

    .line 229
    :cond_531
    move-object/from16 v24, v13

    :cond_533
    const/4 v11, 0x2

    const/4 v13, 0x0

    goto :goto_540

    .end local v21    # "embed":Ljava/lang/String;
    .local v11, "embed":Ljava/lang/String;
    :cond_536
    move-object/from16 v20, v10

    move-object/from16 v21, v11

    move-object/from16 v19, v12

    move-object/from16 v24, v13

    const/4 v11, 0x2

    const/4 v13, 0x0

    .end local v11    # "embed":Ljava/lang/String;
    .restart local v21    # "embed":Ljava/lang/String;
    :goto_540
    move-object v9, v13

    :goto_541
    nop

    .line 231
    .local v9, "original":Ljava/lang/String;
    if-eqz v9, :cond_59e

    add-int/lit8 v10, v6, 0x1

    iput-object v2, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    iput-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    iput-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    iput-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    iput-object v7, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    invoke-static {v14}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    move-object/from16 v12, v24

    iput-object v12, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    move-object/from16 v11, v21

    .end local v21    # "embed":Ljava/lang/String;
    .restart local v11    # "embed":Ljava/lang/String;
    iput-object v11, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$10:Ljava/lang/Object;

    invoke-static {v9}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    iput-object v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$11:Ljava/lang/Object;

    iput v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    const/4 v13, 0x5

    iput v13, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    move-object/from16 p0, v2

    move-object/from16 p1, v3

    move-object/from16 p2, v0

    move-object/from16 p3, v1

    move-object/from16 p4, v15

    move-object/from16 p5, v9

    move-object/from16 p6, v11

    move/from16 p7, v10

    move-object/from16 p8, v8

    invoke-static/range {p0 .. p8}, Lcom/lagradost/VideoHubProvider;->loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v10

    move-object/from16 v13, v20

    if-ne v10, v13, :cond_592

    .line 209
    return-object v13

    .line 231
    :cond_592
    move-object v10, v13

    move-object v13, v12

    move-object v12, v7

    move-object/from16 v7, v18

    .line 232
    .end local v18    # "$completion":Lkotlin/coroutines/Continuation;
    .local v7, "$completion":Lkotlin/coroutines/Continuation;
    .local v12, "doc":Lorg/jsoup/nodes/Document;
    :goto_597
    move-object/from16 v28, v14

    move-object v14, v12

    move-object v12, v13

    move-object/from16 v13, v28

    goto :goto_5a9

    .line 231
    .end local v11    # "embed":Ljava/lang/String;
    .end local v12    # "doc":Lorg/jsoup/nodes/Document;
    .local v7, "doc":Lorg/jsoup/nodes/Document;
    .restart local v18    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v21    # "embed":Ljava/lang/String;
    :cond_59e
    move-object/from16 v13, v20

    move-object/from16 v11, v21

    move-object/from16 v12, v24

    .end local v21    # "embed":Ljava/lang/String;
    .restart local v11    # "embed":Ljava/lang/String;
    move-object v10, v13

    move-object v13, v14

    move-object v14, v7

    move-object/from16 v7, v18

    .line 232
    .end local v18    # "$completion":Lkotlin/coroutines/Continuation;
    .local v7, "$completion":Lkotlin/coroutines/Continuation;
    .restart local v13    # "unpacked":Ljava/lang/String;
    .local v14, "doc":Lorg/jsoup/nodes/Document;
    :goto_5a9
    invoke-virtual {v15}, Ljava/util/HashSet;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_614

    move-object/from16 v18, v7

    .end local v7    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v18    # "$completion":Lkotlin/coroutines/Continuation;
    invoke-virtual {v14}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v20, v10

    move-object/from16 v10, v19

    invoke-static {v7, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    add-int/lit8 v19, v6, 0x1

    iput-object v2, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$0:Ljava/lang/Object;

    iput-object v3, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$1:Ljava/lang/Object;

    iput-object v0, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$2:Ljava/lang/Object;

    iput-object v1, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$3:Ljava/lang/Object;

    iput-object v15, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$4:Ljava/lang/Object;

    move-object/from16 v21, v10

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$5:Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$6:Ljava/lang/Object;

    iput-object v14, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$7:Ljava/lang/Object;

    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$8:Ljava/lang/Object;

    iput-object v12, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$9:Ljava/lang/Object;

    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$10:Ljava/lang/Object;

    invoke-static {v9}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->L$11:Ljava/lang/Object;

    iput v6, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->I$0:I

    const/4 v10, 0x6

    iput v10, v8, Lcom/lagradost/VideoHubProvider$loadLinks$resolve$1;->label:I

    move-object/from16 p0, v2

    move-object/from16 p1, v3

    move-object/from16 p2, v0

    move-object/from16 p3, v1

    move-object/from16 p4, v15

    move-object/from16 p5, v11

    move-object/from16 p6, v7

    move/from16 p7, v19

    move-object/from16 p8, v8

    invoke-static/range {p0 .. p8}, Lcom/lagradost/VideoHubProvider;->loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v10, v20

    if-ne v7, v10, :cond_60c

    .line 209
    return-object v10

    .line 232
    :cond_60c
    move-object/from16 v7, v18

    .line 233
    .end local v18    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v7    # "$completion":Lkotlin/coroutines/Continuation;
    :goto_60e
    move-object/from16 v18, v7

    move-object v7, v14

    move-object v14, v13

    move-object v13, v12

    goto :goto_61b

    .line 232
    :cond_614
    move-object/from16 v18, v7

    move-object/from16 v21, v19

    .end local v7    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v18    # "$completion":Lkotlin/coroutines/Continuation;
    move-object v7, v14

    move-object v14, v13

    move-object v13, v12

    .line 233
    .end local v13    # "unpacked":Ljava/lang/String;
    .local v7, "doc":Lorg/jsoup/nodes/Document;
    .local v14, "unpacked":Ljava/lang/String;
    :goto_61b
    move-object v12, v15

    check-cast v12, Ljava/util/Collection;

    invoke-interface {v12}, Ljava/util/Collection;->isEmpty()Z

    move-result v12

    const/16 v16, 0x1

    xor-int/lit8 v12, v12, 0x1

    if-eqz v12, :cond_62b

    sget-object v10, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v10

    :cond_62b
    move-object/from16 v9, v17

    move-object/from16 v12, v21

    goto/16 :goto_470

    .line 235
    .end local v11    # "embed":Ljava/lang/String;
    .end local v17    # "$result":Ljava/lang/Object;
    .local v9, "$result":Ljava/lang/Object;
    :cond_631
    move-object/from16 v17, v9

    .end local v9    # "$result":Ljava/lang/Object;
    .restart local v17    # "$result":Ljava/lang/Object;
    sget-object v9, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v9

    .line 221
    .end local v0    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v15    # "emitted":Ljava/util/HashSet;
    .end local v17    # "$result":Ljava/lang/Object;
    .end local v18    # "$completion":Lkotlin/coroutines/Continuation;
    .local v1, "visited":Ljava/util/HashSet;
    .local v2, "this$0":Lcom/lagradost/VideoHubProvider;
    .local v3, "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v7, "$completion":Lkotlin/coroutines/Continuation;
    .local v10, "$result":Ljava/lang/Object;
    .local v13, "wrapped":Lkotlin/jvm/functions/Function1;
    .local v14, "emitted":Ljava/util/HashSet;
    :catch_636
    move-exception v0

    move-object/from16 p0, v1

    move-object/from16 p1, v2

    move-object v9, v10

    move-object v11, v14

    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local p0, "visited":Ljava/util/HashSet;
    .local p1, "this$0":Lcom/lagradost/VideoHubProvider;
    goto :goto_648

    .end local p0    # "visited":Ljava/util/HashSet;
    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v1    # "visited":Ljava/util/HashSet;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    :catch_63e
    move-exception v0

    move-object/from16 p0, v1

    move-object/from16 p1, v2

    move-object v9, v10

    move-object v11, v14

    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    goto :goto_64d

    .end local v10    # "$result":Ljava/lang/Object;
    .end local p0    # "visited":Ljava/util/HashSet;
    .end local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v1    # "visited":Ljava/util/HashSet;
    .restart local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .restart local v9    # "$result":Ljava/lang/Object;
    :catch_646
    move-exception v0

    move-object v11, v14

    .end local v14    # "emitted":Ljava/util/HashSet;
    .local v0, "<unused var>":Ljava/lang/Exception;
    .local v11, "emitted":Ljava/util/HashSet;
    :goto_648
    sget-object v10, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v10

    .end local v0    # "<unused var>":Ljava/lang/Exception;
    .end local v11    # "emitted":Ljava/util/HashSet;
    .restart local v14    # "emitted":Ljava/util/HashSet;
    :catch_64b
    move-exception v0

    move-object v11, v14

    .end local v14    # "emitted":Ljava/util/HashSet;
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .restart local v11    # "emitted":Ljava/util/HashSet;
    :goto_64d
    throw v0

    .line 210
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    .end local v1    # "visited":Ljava/util/HashSet;
    .end local v2    # "this$0":Lcom/lagradost/VideoHubProvider;
    .end local v3    # "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v6    # "depth":I
    .end local v7    # "$completion":Lkotlin/coroutines/Continuation;
    .end local v11    # "emitted":Ljava/util/HashSet;
    .end local v13    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p0    # "visited":Ljava/util/HashSet;
    .restart local p1    # "this$0":Lcom/lagradost/VideoHubProvider;
    .local p2, "$subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "emitted":Ljava/util/HashSet;
    .restart local p5    # "url":Ljava/lang/String;
    .restart local p6    # "ref":Ljava/lang/String;
    .restart local p7    # "depth":I
    .restart local p8    # "$completion":Lkotlin/coroutines/Continuation;
    :cond_64e
    move-object/from16 v13, p3

    move-object/from16 v14, p4

    :goto_652
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_656
    .packed-switch 0x0
        :pswitch_1d8
        :pswitch_194
        :pswitch_154
        :pswitch_11f
        :pswitch_df
        :pswitch_90
        :pswitch_41
    .end packed-switch
.end method

.method private static final loadLinks$resolve$lambda$2(Ljava/util/ArrayList;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)Lkotlin/Unit;
    .registers 3
    .param p0, "$extracted"    # Ljava/util/ArrayList;
    .param p1, "it"    # Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 214
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private final ownUrl(Ljava/lang/String;)Z
    .registers 8
    .param p1, "url"    # Ljava/lang/String;

    .line 46
    const-string v0, "www."

    const/4 v1, 0x0

    :try_start_3
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v2, p0

    check-cast v2, Lcom/lagradost/VideoHubProvider;

    .line 248
    .local v2, "$this$ownUrl_u24lambda_u240":Lcom/lagradost/VideoHubProvider;
    const/4 v3, 0x0

    .line 46
    .local v3, "$i$a$-runCatching-VideoHubProvider$ownUrl$host$1":I
    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1c

    move-object v5, v0

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v4, v5}, Lkotlin/text/StringsKt;->removePrefix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1d

    :cond_1c
    move-object v4, v1

    .end local v2    # "$this$ownUrl_u24lambda_u240":Lcom/lagradost/VideoHubProvider;
    .end local v3    # "$i$a$-runCatching-VideoHubProvider$ownUrl$host$1":I
    :goto_1d
    invoke-static {v4}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_22

    goto :goto_2d

    :catchall_22
    move-exception v2

    sget-object v3, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v2}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    :goto_2d
    invoke-static {v2}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    goto :goto_35

    :cond_34
    move-object v1, v2

    :goto_35
    check-cast v1, Ljava/lang/String;

    .line 47
    .local v1, "host":Ljava/lang/String;
    iget-object v2, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v2}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_53

    const-string v0, "missav.live"

    const-string v2, "missav.ws"

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->contains(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v0

    goto :goto_71

    :cond_53
    new-instance v2, Ljava/net/URI;

    iget-object v3, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v3}, Lcom/lagradost/CatalogSite;->getBase()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    const-string v3, "getHost(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v2, v0}, Lkotlin/text/StringsKt;->removePrefix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_71
    return v0
.end method

.method private final posterHeaders(Ljava/lang/String;)Ljava/util/Map;
    .registers 14
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 71
    invoke-direct {p0}, Lcom/lagradost/VideoHubProvider;->getRequestHeaders()Ljava/util/Map;

    move-result-object v0

    const-string v1, "Referer"

    invoke-static {v1, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/collections/MapsKt;->plus(Ljava/util/Map;Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    .line 72
    .local v0, "headers":Ljava/util/Map;
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v1}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v1

    const-string v2, "Cookie"

    const/4 v3, 0x4

    if-ne v1, v3, :cond_24

    iget-object v1, p0, Lcom/lagradost/VideoHubProvider;->cloudflare:Lcom/lagradost/cloudstream3/network/CloudflareKiller;

    invoke-virtual {v1, p1}, Lcom/lagradost/cloudstream3/network/CloudflareKiller;->getCookieHeaders(Ljava/lang/String;)Lokhttp3/Headers;

    move-result-object v1

    invoke-virtual {v1, v2}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_54

    :cond_24
    iget-object v1, p0, Lcom/lagradost/VideoHubProvider;->pageCookies:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_53

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_53

    move-object v3, v1

    check-cast v3, Ljava/lang/Iterable;

    const-string v1, "; "

    move-object v4, v1

    check-cast v4, Ljava/lang/CharSequence;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    sget-object v9, Lcom/lagradost/-$$Lambda$VideoHubProvider$EpGtcAU0dPdOEQytjgC2oZxFZYc;->INSTANCE:Lcom/lagradost/-$$Lambda$VideoHubProvider$EpGtcAU0dPdOEQytjgC2oZxFZYc;

    const/16 v10, 0x1e

    const/4 v11, 0x0

    invoke-static/range {v3 .. v11}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_54

    :cond_53
    const/4 v1, 0x0

    .line 73
    .local v1, "cookie":Ljava/lang/String;
    :goto_54
    move-object v3, v1

    check-cast v3, Ljava/lang/CharSequence;

    if-eqz v3, :cond_62

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_60

    goto :goto_62

    :cond_60
    const/4 v3, 0x0

    goto :goto_63

    :cond_62
    :goto_62
    const/4 v3, 0x1

    :goto_63
    if-eqz v3, :cond_67

    move-object v2, v0

    goto :goto_6f

    :cond_67
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    invoke-static {v0, v2}, Lkotlin/collections/MapsKt;->plus(Ljava/util/Map;Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v2

    :goto_6f
    return-object v2
.end method

.method private static final posterHeaders$lambda$0(Ljava/util/Map$Entry;)Ljava/lang/CharSequence;
    .registers 4
    .param p0, "it"    # Ljava/util/Map$Entry;

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method

.method private final toResult(Lcom/lagradost/VideoCard;)Lcom/lagradost/cloudstream3/SearchResponse;
    .registers 12
    .param p1, "$this$toResult"    # Lcom/lagradost/VideoCard;

    .line 76
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->cardCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    const/16 v1, 0x5dc

    if-le v0, v1, :cond_f

    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->cardCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 77
    :cond_f
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->cardCache:Ljava/util/concurrent/ConcurrentHashMap;

    check-cast v0, Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/lagradost/VideoHubProvider;->cacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    move-object v2, p0

    check-cast v2, Lcom/lagradost/cloudstream3/MainAPI;

    invoke-virtual {p1}, Lcom/lagradost/VideoCard;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/lagradost/cloudstream3/TvType;->Movie:Lcom/lagradost/cloudstream3/TvType;

    const/4 v6, 0x0

    new-instance v7, Lcom/lagradost/-$$Lambda$VideoHubProvider$J4D1eigzQtYxAMUfPlvMIBOVo5c;

    invoke-direct {v7, p1, p0}, Lcom/lagradost/-$$Lambda$VideoHubProvider$J4D1eigzQtYxAMUfPlvMIBOVo5c;-><init>(Lcom/lagradost/VideoCard;Lcom/lagradost/VideoHubProvider;)V

    const/16 v8, 0x8

    const/4 v9, 0x0

    invoke-static/range {v2 .. v9}, Lcom/streambundle/v38/DetailMetadata;->searchCard(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;

    move-result-object v0

    check-cast v0, Lcom/lagradost/cloudstream3/SearchResponse;

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lagradost/cloudstream3/SearchResponse;

    return-object v0
.end method

.method private static final toResult$lambda$0(Lcom/lagradost/VideoCard;Lcom/lagradost/VideoHubProvider;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;
    .registers 4
    .param p0, "$this_toResult"    # Lcom/lagradost/VideoCard;
    .param p1, "this$0"    # Lcom/lagradost/VideoHubProvider;
    .param p2, "$this$newMovieSearchResponse"    # Lcom/lagradost/cloudstream3/MovieSearchResponse;

    const-string v0, "$this$newMovieSearchResponse"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    invoke-virtual {p0}, Lcom/lagradost/VideoCard;->getPoster()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterUrl(Ljava/lang/String;)V

    .line 80
    invoke-virtual {p2}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/lagradost/VideoHubProvider;->posterHeaders(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterHeaders(Ljava/util/Map;)V

    .line 81
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private final translated(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 40
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v0}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_e

    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    :cond_e
    const/4 v0, 0x0

    return-object v0

    :cond_10
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    instance-of v0, v3, Lcom/lagradost/VideoHubProvider$translated$1;

    if-eqz v0, :cond_2a

    move-object v0, v3

    check-cast v0, Lcom/lagradost/VideoHubProvider$translated$1;

    iget v4, v0, Lcom/lagradost/VideoHubProvider$translated$1;->label:I

    const/high16 v5, -0x80000000

    and-int/2addr v4, v5

    if-eqz v4, :cond_2a

    iget v4, v0, Lcom/lagradost/VideoHubProvider$translated$1;->label:I

    sub-int/2addr v4, v5

    iput v4, v0, Lcom/lagradost/VideoHubProvider$translated$1;->label:I

    goto :goto_2f

    :cond_2a
    new-instance v0, Lcom/lagradost/VideoHubProvider$translated$1;

    invoke-direct {v0, v1, v3}, Lcom/lagradost/VideoHubProvider$translated$1;-><init>(Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    :goto_2f
    move-object v15, v0

    .local v15, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v13, v15, Lcom/lagradost/VideoHubProvider$translated$1;->result:Ljava/lang/Object;

    .local v13, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 92
    iget v4, v15, Lcom/lagradost/VideoHubProvider$translated$1;->label:I

    const/16 v21, 0x0

    const/4 v14, 0x1

    if-eqz v4, :cond_68

    if-ne v4, v14, :cond_60

    iget-object v0, v15, Lcom/lagradost/VideoHubProvider$translated$1;->L$1:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    .local v4, "target":Ljava/lang/String;
    iget-object v0, v15, Lcom/lagradost/VideoHubProvider$translated$1;->L$0:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    .end local p1    # "query":Ljava/lang/String;
    .local v2, "query":Ljava/lang/String;
    :try_start_49
    invoke-static {v13}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_4c
    .catch Ljava/util/concurrent/CancellationException; {:try_start_49 .. :try_end_4c} :catch_59
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_4c} :catch_52

    move-object/from16 v26, v13

    move-object/from16 v27, v15

    goto/16 :goto_ed

    .line 101
    :catch_52
    move-exception v0

    move-object/from16 v26, v13

    move-object/from16 v27, v15

    goto/16 :goto_189

    :catch_59
    move-exception v0

    move-object/from16 v26, v13

    move-object/from16 v27, v15

    goto/16 :goto_193

    .line 92
    .end local v2    # "query":Ljava/lang/String;
    .end local v4    # "target":Ljava/lang/String;
    .end local v13    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local p1    # "query":Ljava/lang/String;
    :cond_60
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v13    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :cond_68
    invoke-static {v13}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 93
    iget-object v4, v1, Lcom/lagradost/VideoHubProvider;->translationCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_78

    move-object v0, v4

    .line 248
    .local v0, "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 93
    .local v4, "$i$a$-let-VideoHubProvider$translated$2":I
    return-object v0

    .line 94
    .end local v0    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-let-VideoHubProvider$translated$2":I
    :cond_78
    new-instance v4, Lkotlin/text/Regex;

    const-string v5, "[\u0410-\u042f\u0430-\u044f\u0401\u0451]"

    invoke-direct {v4, v5}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v5, v2

    check-cast v5, Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Lkotlin/text/Regex;->containsMatchIn(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_8b

    const-string v4, "en"

    goto :goto_8d

    :cond_8b
    const-string v4, "ru"

    :goto_8d
    move-object v12, v4

    .line 95
    .local v12, "target":Ljava/lang/String;
    nop

    .line 96
    :try_start_8f
    invoke-static {}, Lcom/lagradost/cloudstream3/MainActivityKt;->getApp()Lcom/lagradost/nicehttp/Requests;

    move-result-object v4

    invoke-direct/range {p0 .. p1}, Lcom/lagradost/VideoHubProvider;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5
    :try_end_97
    .catch Ljava/util/concurrent/CancellationException; {:try_start_8f .. :try_end_97} :catch_18a
    .catch Ljava/lang/Exception; {:try_start_8f .. :try_end_97} :catch_180

    :try_start_97
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "&dt=t&q="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_b0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_97 .. :try_end_b0} :catch_172
    .catch Ljava/lang/Exception; {:try_start_97 .. :try_end_b0} :catch_16a

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v16, 0x0

    const-wide/16 v17, 0x8

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0xefe

    const/16 v24, 0x0

    :try_start_c3
    iput-object v2, v15, Lcom/lagradost/VideoHubProvider$translated$1;->L$0:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v15, Lcom/lagradost/VideoHubProvider$translated$1;->L$1:Ljava/lang/Object;

    iput v14, v15, Lcom/lagradost/VideoHubProvider$translated$1;->label:I
    :try_end_cd
    .catch Ljava/util/concurrent/CancellationException; {:try_start_c3 .. :try_end_cd} :catch_18a
    .catch Ljava/lang/Exception; {:try_start_c3 .. :try_end_cd} :catch_180

    const/4 v11, 0x0

    move-object/from16 v25, v12

    .end local v12    # "target":Ljava/lang/String;
    .local v25, "target":Ljava/lang/String;
    move-object/from16 v12, v16

    move-object/from16 v26, v13

    .end local v13    # "$result":Ljava/lang/Object;
    .local v26, "$result":Ljava/lang/Object;
    move-wide/from16 v13, v17

    move-object/from16 v27, v15

    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .local v27, "$continuation":Lkotlin/coroutines/Continuation;
    move-object/from16 v15, v19

    move/from16 v16, v20

    move-object/from16 v17, v22

    move-object/from16 v18, v27

    move/from16 v19, v23

    move-object/from16 v20, v24

    :try_start_e4
    invoke-static/range {v4 .. v20}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v13
    :try_end_e8
    .catch Ljava/util/concurrent/CancellationException; {:try_start_e4 .. :try_end_e8} :catch_168
    .catch Ljava/lang/Exception; {:try_start_e4 .. :try_end_e8} :catch_166

    if-ne v13, v0, :cond_eb

    .line 92
    return-object v0

    .line 96
    :cond_eb
    move-object/from16 v4, v25

    .line 92
    .end local v25    # "target":Ljava/lang/String;
    .end local p1    # "query":Ljava/lang/String;
    .restart local v2    # "query":Ljava/lang/String;
    .local v4, "target":Ljava/lang/String;
    :goto_ed
    :try_start_ed
    check-cast v13, Lcom/lagradost/nicehttp/NiceResponse;

    move-object v0, v13

    .line 97
    .local v0, "response":Lcom/lagradost/nicehttp/NiceResponse;
    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getCode()I

    move-result v5

    const/16 v6, 0xc8

    if-eq v5, v6, :cond_f9

    return-object v21

    .line 98
    :cond_f9
    new-instance v5, Lorg/json/JSONArray;

    invoke-virtual {v0}, Lcom/lagradost/nicehttp/NiceResponse;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v14, 0x0

    invoke-virtual {v5, v14}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v5

    .line 99
    .local v5, "chunks":Lorg/json/JSONArray;
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    invoke-static {v14, v6}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object v6

    move-object/from16 v28, v6

    check-cast v28, Ljava/lang/Iterable;

    const-string v6, ""

    move-object/from16 v29, v6

    check-cast v29, Ljava/lang/CharSequence;

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    new-instance v6, Lcom/lagradost/-$$Lambda$VideoHubProvider$Mx_BiALXllB5AfarFDzd1M3XhmY;

    invoke-direct {v6, v5}, Lcom/lagradost/-$$Lambda$VideoHubProvider$Mx_BiALXllB5AfarFDzd1M3XhmY;-><init>(Lorg/json/JSONArray;)V

    const/16 v35, 0x1e

    const/16 v36, 0x0

    move-object/from16 v34, v6

    invoke-static/range {v28 .. v36}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    check-cast v6, Ljava/lang/CharSequence;

    invoke-static {v6}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 100
    .local v6, "text":Ljava/lang/String;
    move-object v7, v6

    .line 248
    .local v7, "it":Ljava/lang/String;
    const/4 v8, 0x0

    .line 100
    .local v8, "$i$a$-takeIf-VideoHubProvider$translated$3":I
    move-object v9, v7

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v9}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v9

    const/4 v10, 0x1

    xor-int/2addr v9, v10

    if-eqz v9, :cond_14e

    invoke-static {v7, v2, v10}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v9

    if-nez v9, :cond_14e

    move v14, v10

    .end local v7    # "it":Ljava/lang/String;
    .end local v8    # "$i$a$-takeIf-VideoHubProvider$translated$3":I
    :cond_14e
    if-eqz v14, :cond_152

    move-object v7, v6

    goto :goto_154

    :cond_152
    move-object/from16 v7, v21

    :goto_154
    if-eqz v7, :cond_189

    move-object v8, v7

    .line 248
    .local v8, "it":Ljava/lang/String;
    const/4 v9, 0x0

    .line 100
    .local v9, "$i$a$-also-VideoHubProvider$translated$4":I
    iget-object v10, v1, Lcom/lagradost/VideoHubProvider;->translationCache:Ljava/util/concurrent/ConcurrentHashMap;

    check-cast v10, Ljava/util/Map;

    invoke-interface {v10, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15f
    .catch Ljava/util/concurrent/CancellationException; {:try_start_ed .. :try_end_15f} :catch_164
    .catch Ljava/lang/Exception; {:try_start_ed .. :try_end_15f} :catch_162

    move-object/from16 v21, v7

    .end local v8    # "it":Ljava/lang/String;
    .end local v9    # "$i$a$-also-VideoHubProvider$translated$4":I
    goto :goto_189

    .line 101
    .end local v0    # "response":Lcom/lagradost/nicehttp/NiceResponse;
    .end local v5    # "chunks":Lorg/json/JSONArray;
    .end local v6    # "text":Ljava/lang/String;
    :catch_162
    move-exception v0

    goto :goto_189

    :catch_164
    move-exception v0

    goto :goto_193

    .end local v2    # "query":Ljava/lang/String;
    .end local v4    # "target":Ljava/lang/String;
    .restart local v25    # "target":Ljava/lang/String;
    .restart local p1    # "query":Ljava/lang/String;
    :catch_166
    move-exception v0

    goto :goto_17a

    :catch_168
    move-exception v0

    goto :goto_17d

    .end local v25    # "target":Ljava/lang/String;
    .end local v26    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v12    # "target":Ljava/lang/String;
    .restart local v13    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :catch_16a
    move-exception v0

    move-object/from16 v25, v12

    move-object/from16 v26, v13

    move-object/from16 v27, v15

    .end local v12    # "target":Ljava/lang/String;
    .end local v13    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v25    # "target":Ljava/lang/String;
    .restart local v26    # "$result":Ljava/lang/Object;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    goto :goto_17a

    .end local v25    # "target":Ljava/lang/String;
    .end local v26    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v12    # "target":Ljava/lang/String;
    .restart local v13    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :catch_172
    move-exception v0

    move-object/from16 v25, v12

    move-object/from16 v26, v13

    move-object/from16 v27, v15

    .end local v12    # "target":Ljava/lang/String;
    .end local v13    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v25    # "target":Ljava/lang/String;
    .restart local v26    # "$result":Ljava/lang/Object;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    goto :goto_17d

    :goto_17a
    move-object/from16 v4, v25

    goto :goto_189

    :goto_17d
    move-object/from16 v4, v25

    goto :goto_193

    .end local v25    # "target":Ljava/lang/String;
    .end local v26    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v12    # "target":Ljava/lang/String;
    .restart local v13    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :catch_180
    move-exception v0

    move-object/from16 v25, v12

    move-object/from16 v26, v13

    move-object/from16 v27, v15

    move-object/from16 v4, v25

    .line 95
    .end local v12    # "target":Ljava/lang/String;
    .end local v13    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local p1    # "query":Ljava/lang/String;
    .restart local v2    # "query":Ljava/lang/String;
    .restart local v4    # "target":Ljava/lang/String;
    .restart local v26    # "$result":Ljava/lang/Object;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    :cond_189
    :goto_189
    return-object v21

    .line 101
    .end local v2    # "query":Ljava/lang/String;
    .end local v4    # "target":Ljava/lang/String;
    .end local v26    # "$result":Ljava/lang/Object;
    .end local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v12    # "target":Ljava/lang/String;
    .restart local v13    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local p1    # "query":Ljava/lang/String;
    :catch_18a
    move-exception v0

    move-object/from16 v25, v12

    move-object/from16 v26, v13

    move-object/from16 v27, v15

    move-object/from16 v4, v25

    .end local v12    # "target":Ljava/lang/String;
    .end local v13    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local p1    # "query":Ljava/lang/String;
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .restart local v2    # "query":Ljava/lang/String;
    .restart local v4    # "target":Ljava/lang/String;
    .restart local v26    # "$result":Ljava/lang/Object;
    .restart local v27    # "$continuation":Lkotlin/coroutines/Continuation;
    :goto_193
    throw v0
.end method

.method private static final translated$lambda$1(Lorg/json/JSONArray;I)Ljava/lang/CharSequence;
    .registers 4
    .param p0, "$chunks"    # Lorg/json/JSONArray;
    .param p1, "it"    # I

    .line 99
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "optString(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method


# virtual methods
.method public detailUnscreened(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 35
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
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

    move-object/from16 v8, p0

    move-object/from16 v0, p1

    move-object/from16 v9, p2

    instance-of v1, v9, Lcom/lagradost/VideoHubProvider$load$1;

    if-eqz v1, :cond_1a

    move-object v1, v9

    check-cast v1, Lcom/lagradost/VideoHubProvider$load$1;

    iget v2, v1, Lcom/lagradost/VideoHubProvider$load$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_1a

    iget v2, v1, Lcom/lagradost/VideoHubProvider$load$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v1, Lcom/lagradost/VideoHubProvider$load$1;->label:I

    goto :goto_1f

    :cond_1a
    new-instance v1, Lcom/lagradost/VideoHubProvider$load$1;

    invoke-direct {v1, v8, v9}, Lcom/lagradost/VideoHubProvider$load$1;-><init>(Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    :goto_1f
    move-object v15, v1

    .local v15, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v14, v15, Lcom/lagradost/VideoHubProvider$load$1;->result:Ljava/lang/Object;

    .local v14, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v13

    .line 152
    iget v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->label:I

    const/4 v10, 0x5

    const/4 v2, 0x2

    const/4 v12, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x1

    if-eqz v1, :cond_ce

    if-eq v1, v6, :cond_c0

    if-eq v1, v2, :cond_a8

    if-eq v1, v7, :cond_82

    if-eq v1, v12, :cond_62

    if-ne v1, v10, :cond_5a

    iget-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$5:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/internal/Ref$ObjectRef;

    .local v1, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    iget-object v2, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$4:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .local v2, "location":Ljava/lang/String;
    iget-object v3, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$3:Ljava/lang/Object;

    check-cast v3, Lorg/jsoup/nodes/Document;

    .local v3, "doc":Lorg/jsoup/nodes/Document;
    iget-object v4, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$2:Ljava/lang/Object;

    check-cast v4, Lcom/lagradost/VideoDetails;

    .local v4, "apiInfo":Lcom/lagradost/VideoDetails;
    iget-object v5, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    check-cast v5, Lcom/lagradost/VideoCard;

    .local v5, "cached":Lcom/lagradost/VideoCard;
    iget-object v6, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    .end local p1    # "url":Ljava/lang/String;
    .local v0, "url":Ljava/lang/String;
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v6, v14

    move-object/from16 v18, v15

    goto/16 :goto_42c

    .end local v0    # "url":Ljava/lang/String;
    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .end local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v5    # "cached":Lcom/lagradost/VideoCard;
    .end local v14    # "$result":Ljava/lang/Object;
    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_5a
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .restart local v14    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    :cond_62
    iget-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$5:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/internal/Ref$ObjectRef;

    .restart local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    iget-object v2, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$4:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .restart local v2    # "location":Ljava/lang/String;
    iget-object v3, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$3:Ljava/lang/Object;

    check-cast v3, Lorg/jsoup/nodes/Document;

    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    iget-object v4, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$2:Ljava/lang/Object;

    check-cast v4, Lcom/lagradost/VideoDetails;

    .restart local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    iget-object v5, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    check-cast v5, Lcom/lagradost/VideoCard;

    .restart local v5    # "cached":Lcom/lagradost/VideoCard;
    iget-object v7, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    .end local p1    # "url":Ljava/lang/String;
    .local v7, "url":Ljava/lang/String;
    :try_start_7a
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_7d
    .catch Ljava/util/concurrent/CancellationException; {:try_start_7a .. :try_end_7d} :catch_a5
    .catch Ljava/lang/Exception; {:try_start_7a .. :try_end_7d} :catch_a2

    move/from16 v20, v6

    move-object v0, v14

    goto/16 :goto_2cf

    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .end local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v5    # "cached":Lcom/lagradost/VideoCard;
    .end local v7    # "url":Ljava/lang/String;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_82
    iget-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$5:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/internal/Ref$ObjectRef;

    .restart local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    iget-object v2, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$4:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .restart local v2    # "location":Ljava/lang/String;
    iget-object v3, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$3:Ljava/lang/Object;

    check-cast v3, Lorg/jsoup/nodes/Document;

    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    iget-object v4, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$2:Ljava/lang/Object;

    check-cast v4, Lcom/lagradost/VideoDetails;

    .restart local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    iget-object v5, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    check-cast v5, Lcom/lagradost/VideoCard;

    .restart local v5    # "cached":Lcom/lagradost/VideoCard;
    iget-object v7, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    .end local p1    # "url":Ljava/lang/String;
    .restart local v7    # "url":Ljava/lang/String;
    :try_start_9a
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_9d
    .catch Ljava/util/concurrent/CancellationException; {:try_start_9a .. :try_end_9d} :catch_a5
    .catch Ljava/lang/Exception; {:try_start_9a .. :try_end_9d} :catch_a2

    move/from16 v20, v6

    move-object v0, v14

    goto/16 :goto_25e

    .line 173
    :catch_a2
    move-exception v0

    goto/16 :goto_3b4

    :catch_a5
    move-exception v0

    goto/16 :goto_3c6

    .line 152
    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .end local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v5    # "cached":Lcom/lagradost/VideoCard;
    .end local v7    # "url":Ljava/lang/String;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_a8
    iget-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$2:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoDetails;

    .local v1, "apiInfo":Lcom/lagradost/VideoDetails;
    iget-object v2, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    check-cast v2, Lcom/lagradost/VideoCard;

    .local v2, "cached":Lcom/lagradost/VideoCard;
    iget-object v3, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    .end local p1    # "url":Ljava/lang/String;
    .restart local v0    # "url":Ljava/lang/String;
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v19, v1

    move/from16 v20, v6

    move v10, v7

    move-object v1, v14

    goto/16 :goto_14b

    .end local v0    # "url":Ljava/lang/String;
    .end local v1    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v2    # "cached":Lcom/lagradost/VideoCard;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_c0
    iget-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoCard;

    .local v1, "cached":Lcom/lagradost/VideoCard;
    iget-object v3, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    .end local p1    # "url":Ljava/lang/String;
    .restart local v0    # "url":Ljava/lang/String;
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, v14

    goto :goto_115

    .end local v0    # "url":Ljava/lang/String;
    .end local v1    # "cached":Lcom/lagradost/VideoCard;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_ce
    invoke-static {v14}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 153
    invoke-direct/range {p0 .. p1}, Lcom/lagradost/VideoHubProvider;->ownUrl(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_431

    .line 154
    iget-object v1, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v1}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v1

    if-ne v1, v12, :cond_f0

    iget-object v1, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v1, v0}, Lcom/lagradost/CatalogSite;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e8

    goto :goto_f0

    :cond_e8
    new-instance v1, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    const-string v2, "\u042d\u0442\u043e \u0440\u0430\u0437\u0434\u0435\u043b MissAV, \u0430 \u043d\u0435 \u0432\u0438\u0434\u0435\u043e. \u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u043f\u043e\u0438\u0441\u043a \u0432 \u043e\u0431\u043d\u043e\u0432\u043b\u0451\u043d\u043d\u043e\u043c \u043f\u043b\u0430\u0433\u0438\u043d\u0435."

    invoke-direct {v1, v2}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 155
    :cond_f0
    :goto_f0
    iget-object v1, v8, Lcom/lagradost/VideoHubProvider;->cardCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct/range {p0 .. p1}, Lcom/lagradost/VideoHubProvider;->cacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lagradost/VideoCard;

    .line 156
    .restart local v1    # "cached":Lcom/lagradost/VideoCard;
    iget-object v3, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v3}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v3

    if-ne v3, v7, :cond_119

    iput-object v0, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    iput-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    iput v6, v15, Lcom/lagradost/VideoHubProvider$load$1;->label:I

    invoke-direct {v8, v0, v15}, Lcom/lagradost/VideoHubProvider;->beegDetails(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v13, :cond_115

    .line 152
    invoke-static/range {v13 .. v13}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    return-object v13

    .line 156
    .end local p1    # "url":Ljava/lang/String;
    .restart local v0    # "url":Ljava/lang/String;
    :cond_115
    :goto_115
    check-cast v3, Lcom/lagradost/VideoDetails;

    move-object v5, v1

    goto :goto_11b

    .end local v0    # "url":Ljava/lang/String;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_119
    move-object v5, v1

    const/4 v3, 0x0

    .end local v1    # "cached":Lcom/lagradost/VideoCard;
    .end local p1    # "url":Ljava/lang/String;
    .restart local v0    # "url":Ljava/lang/String;
    .restart local v5    # "cached":Lcom/lagradost/VideoCard;
    :goto_11b
    move-object v4, v3

    .line 157
    .restart local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    if-nez v4, :cond_151

    const/4 v3, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x6

    const/16 v18, 0x0

    iput-object v0, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    iput-object v5, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    iput-object v4, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$2:Ljava/lang/Object;

    iput v2, v15, Lcom/lagradost/VideoHubProvider$load$1;->label:I

    move-object/from16 v1, p0

    move-object v2, v0

    move-object/from16 v19, v4

    .end local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    .local v19, "apiInfo":Lcom/lagradost/VideoDetails;
    move/from16 v4, v16

    move-object/from16 v16, v5

    .end local v5    # "cached":Lcom/lagradost/VideoCard;
    .local v16, "cached":Lcom/lagradost/VideoCard;
    move-object v5, v15

    move/from16 v20, v6

    move/from16 v6, v17

    move v10, v7

    move-object/from16 v7, v18

    invoke-static/range {v1 .. v7}, Lcom/lagradost/VideoHubProvider;->fetch$default(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v13, :cond_149

    .line 152
    invoke-static/range {v13 .. v13}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    return-object v13

    .line 157
    :cond_149
    move-object/from16 v2, v16

    .end local v16    # "cached":Lcom/lagradost/VideoCard;
    .restart local v2    # "cached":Lcom/lagradost/VideoCard;
    :goto_14b
    check-cast v1, Lorg/jsoup/nodes/Document;

    move-object v7, v0

    move-object/from16 v16, v2

    goto :goto_15a

    .end local v2    # "cached":Lcom/lagradost/VideoCard;
    .end local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    .restart local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    .restart local v5    # "cached":Lcom/lagradost/VideoCard;
    :cond_151
    move-object/from16 v19, v4

    move-object/from16 v16, v5

    move/from16 v20, v6

    move v10, v7

    .end local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v5    # "cached":Lcom/lagradost/VideoCard;
    .restart local v16    # "cached":Lcom/lagradost/VideoCard;
    .restart local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    move-object v7, v0

    const/4 v1, 0x0

    .end local v0    # "url":Ljava/lang/String;
    .restart local v7    # "url":Ljava/lang/String;
    :goto_15a
    move-object v6, v1

    .line 158
    .local v6, "doc":Lorg/jsoup/nodes/Document;
    if-eqz v6, :cond_163

    invoke-virtual {v6}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_164

    :cond_163
    move-object v0, v7

    :cond_164
    move-object v5, v0

    .line 159
    .local v5, "location":Ljava/lang/String;
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v0}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v0

    if-ne v0, v12, :cond_180

    if-eqz v6, :cond_178

    sget-object v0, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    invoke-virtual {v0, v6}, Lcom/lagradost/MissavSearch;->isDetail(Lorg/jsoup/nodes/Document;)Z

    move-result v0

    if-eqz v0, :cond_178

    goto :goto_180

    .line 160
    :cond_178
    new-instance v0, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    const-string v1, "MissAV \u0432\u0435\u0440\u043d\u0443\u043b \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0443 \u0440\u0430\u0437\u0434\u0435\u043b\u0430 \u0432\u043c\u0435\u0441\u0442\u043e \u0432\u0438\u0434\u0435\u043e. \u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0434\u043e\u0441\u0442\u0443\u043f \u043a \u0438\u0441\u0445\u043e\u0434\u043d\u043e\u0439 \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0435."

    invoke-direct {v0, v1}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_180
    :goto_180
    new-instance v0, Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    move-object v4, v0

    .local v4, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    if-nez v19, :cond_194

    sget-object v0, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v0, v6, v1, v5}, Lcom/lagradost/CatalogParser;->details(Lorg/jsoup/nodes/Document;Lcom/lagradost/CatalogSite;Ljava/lang/String;)Lcom/lagradost/VideoDetails;

    move-result-object v0

    goto :goto_196

    :cond_194
    move-object/from16 v0, v19

    :goto_196
    iput-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 162
    if-eqz v16, :cond_1f9

    iget-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    move-object/from16 v21, v0

    check-cast v21, Lcom/lagradost/VideoDetails;

    .line 163
    iget-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoDetails;

    invoke-virtual {v0}, Lcom/lagradost/VideoDetails;->getTitle()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    new-instance v1, Lkotlin/text/Regex;

    const-string v2, "#?\\d+"

    invoke-direct {v1, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1d1

    iget-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoDetails;

    invoke-virtual {v0}, Lcom/lagradost/VideoDetails;->getTitle()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1c8

    goto :goto_1d1

    :cond_1c8
    iget-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoDetails;

    invoke-virtual {v0}, Lcom/lagradost/VideoDetails;->getTitle()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d5

    :cond_1d1
    :goto_1d1
    invoke-virtual/range {v16 .. v16}, Lcom/lagradost/VideoCard;->getTitle()Ljava/lang/String;

    move-result-object v0

    :goto_1d5
    move-object/from16 v22, v0

    .line 164
    iget-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoDetails;

    invoke-virtual {v0}, Lcom/lagradost/VideoDetails;->getPoster()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e5

    invoke-virtual/range {v16 .. v16}, Lcom/lagradost/VideoCard;->getPoster()Ljava/lang/String;

    move-result-object v0

    :cond_1e5
    move-object/from16 v23, v0

    .line 162
    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x3c

    const/16 v29, 0x0

    invoke-static/range {v21 .. v29}, Lcom/lagradost/VideoDetails;->copy$default(Lcom/lagradost/VideoDetails;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;ILjava/lang/Object;)Lcom/lagradost/VideoDetails;

    move-result-object v0

    iput-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 166
    :cond_1f9

    iget-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoDetails;

    invoke-virtual {v0}, Lcom/lagradost/VideoDetails;->getRelated()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3c7

    iget-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoDetails;

    invoke-virtual {v0}, Lcom/lagradost/VideoDetails;->getTags()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3c7

    .line 167
    nop

    .line 168
    :try_start_21c
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v0}, Lcom/lagradost/CatalogSite;->getId()I

    move-result v0
    :try_end_222
    .catch Ljava/util/concurrent/CancellationException; {:try_start_21c .. :try_end_222} :catch_3b6
    .catch Ljava/lang/Exception; {:try_start_21c .. :try_end_222} :catch_3a4

    if-ne v0, v10, :cond_276

    :try_start_224
    iget-object v0, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Lcom/lagradost/VideoDetails;

    invoke-virtual {v0}, Lcom/lagradost/VideoDetails;->getTags()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v7, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    invoke-static/range {v16 .. v16}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    invoke-static/range {v19 .. v19}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$2:Ljava/lang/Object;

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$3:Ljava/lang/Object;

    iput-object v5, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$4:Ljava/lang/Object;

    iput-object v4, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$5:Ljava/lang/Object;

    iput v10, v15, Lcom/lagradost/VideoHubProvider$load$1;->label:I

    invoke-direct {v8, v0, v15}, Lcom/lagradost/VideoHubProvider;->beegSearch(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0
    :try_end_250
    .catch Ljava/util/concurrent/CancellationException; {:try_start_224 .. :try_end_250} :catch_26c
    .catch Ljava/lang/Exception; {:try_start_224 .. :try_end_250} :catch_262

    if-ne v0, v13, :cond_257

    .line 152
    invoke-static/range {v13 .. v13}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    return-object v13

    .line 168
    :cond_257
    move-object v1, v4

    move-object v2, v5

    move-object v3, v6

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    .end local v6    # "doc":Lorg/jsoup/nodes/Document;
    .end local v16    # "cached":Lcom/lagradost/VideoCard;
    .end local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    .local v1, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .local v2, "location":Ljava/lang/String;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "apiInfo":Lcom/lagradost/VideoDetails;
    .local v5, "cached":Lcom/lagradost/VideoCard;
    :goto_25e
    :try_start_25e
    check-cast v0, Ljava/util/List;
    :try_end_260
    .catch Ljava/util/concurrent/CancellationException; {:try_start_25e .. :try_end_260} :catch_a5
    .catch Ljava/lang/Exception; {:try_start_25e .. :try_end_260} :catch_a2

    goto/16 :goto_2e7

    .line 173
    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .local v5, "location":Ljava/lang/String;
    .restart local v6    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v16    # "cached":Lcom/lagradost/VideoCard;
    .restart local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    :catch_262
    move-exception v0

    move-object v1, v4

    move-object v2, v5

    move-object v3, v6

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    goto/16 :goto_3b4

    :catch_26c
    move-exception v0

    move-object v1, v4

    move-object v2, v5

    move-object v3, v6

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    goto/16 :goto_3c6

    .line 169
    :cond_276
    :try_start_276
    iget-object v0, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    iget-object v1, v4, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Lcom/lagradost/VideoDetails;

    invoke-virtual {v1}, Lcom/lagradost/VideoDetails;->getTags()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v8, v1}, Lcom/lagradost/VideoHubProvider;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lagradost/CatalogSite;->search(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v0, 0x0

    const/4 v10, 0x6

    const/16 v18, 0x0

    iput-object v7, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    invoke-static/range {v16 .. v16}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    invoke-static/range {v19 .. v19}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$2:Ljava/lang/Object;

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$3:Ljava/lang/Object;

    iput-object v5, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$4:Ljava/lang/Object;

    iput-object v4, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$5:Ljava/lang/Object;

    iput v12, v15, Lcom/lagradost/VideoHubProvider$load$1;->label:I
    :try_end_2ad
    .catch Ljava/util/concurrent/CancellationException; {:try_start_276 .. :try_end_2ad} :catch_3b6
    .catch Ljava/lang/Exception; {:try_start_276 .. :try_end_2ad} :catch_3a4

    move-object/from16 v1, p0

    move-object v12, v4

    .end local v4    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .local v12, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    move v4, v0

    move-object/from16 v21, v5

    .end local v5    # "location":Ljava/lang/String;
    .local v21, "location":Ljava/lang/String;
    move-object v5, v15

    move-object/from16 v22, v6

    .end local v6    # "doc":Lorg/jsoup/nodes/Document;
    .local v22, "doc":Lorg/jsoup/nodes/Document;
    move v6, v10

    move-object v10, v7

    .end local v7    # "url":Ljava/lang/String;
    .local v10, "url":Ljava/lang/String;
    move-object/from16 v7, v18

    :try_start_2ba
    invoke-static/range {v1 .. v7}, Lcom/lagradost/VideoHubProvider;->fetch$default(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_2be
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2ba .. :try_end_2be} :catch_398
    .catch Ljava/lang/Exception; {:try_start_2ba .. :try_end_2be} :catch_38c

    if-ne v0, v13, :cond_2c5

    .line 152
    invoke-static/range {v13 .. v13}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    return-object v13

    .line 169
    :cond_2c5
    move-object v7, v10

    move-object v1, v12

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    .line 152
    .end local v10    # "url":Ljava/lang/String;
    .end local v12    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v16    # "cached":Lcom/lagradost/VideoCard;
    .end local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v21    # "location":Ljava/lang/String;
    .end local v22    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .restart local v2    # "location":Ljava/lang/String;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "apiInfo":Lcom/lagradost/VideoDetails;
    .local v5, "cached":Lcom/lagradost/VideoCard;
    .restart local v7    # "url":Ljava/lang/String;
    :goto_2cf
    :try_start_2cf
    check-cast v0, Lorg/jsoup/nodes/Document;

    .line 170
    .local v0, "relatedDoc":Lorg/jsoup/nodes/Document;
    sget-object v6, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    move-object v10, v0

    check-cast v10, Lorg/jsoup/nodes/Element;

    iget-object v12, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v11

    move-object/from16 p1, v0

    .end local v0    # "relatedDoc":Lorg/jsoup/nodes/Document;
    .local p1, "relatedDoc":Lorg/jsoup/nodes/Document;
    const-string v0, "location(...)"

    invoke-static {v11, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v6, v10, v12, v11}, Lcom/lagradost/CatalogParser;->cards(Lorg/jsoup/nodes/Element;Lcom/lagradost/CatalogSite;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0
    :try_end_2e7
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2cf .. :try_end_2e7} :catch_a5
    .catch Ljava/lang/Exception; {:try_start_2cf .. :try_end_2e7} :catch_a2

    .line 168
    .end local p1    # "relatedDoc":Lorg/jsoup/nodes/Document;
    :goto_2e7
    nop

    .line 172
    .local v0, "related":Ljava/util/List;
    :try_start_2e8
    iget-object v6, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    move-object/from16 v21, v6

    check-cast v21, Lcom/lagradost/VideoDetails;

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object v6, v0

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 269
    .local v10, "$i$f$filter":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    check-cast v11, Ljava/util/Collection;

    .local v11, "destination$iv$iv":Ljava/util/Collection;
    move-object v12, v6

    .local v12, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/16 v16, 0x0

    .line 270
    .local v16, "$i$f$filterTo":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_308
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_34e

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    move-object/from16 p1, v26

    move-object/from16 v30, v0

    move-object/from16 v0, p1

    .local v0, "element$iv$iv":Ljava/lang/Object;
    .local v30, "related":Ljava/util/List;
    move-object/from16 v26, v0

    check-cast v26, Lcom/lagradost/VideoCard;
    :try_end_31c
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2e8 .. :try_end_31c} :catch_386
    .catch Ljava/lang/Exception; {:try_start_2e8 .. :try_end_31c} :catch_380

    .local v26, "it":Lcom/lagradost/VideoCard;
    const/16 v27, 0x0

    .line 172
    .local v27, "$i$a$-filter-VideoHubProvider$load$2":I
    move-object/from16 p1, v2

    .end local v2    # "location":Ljava/lang/String;
    .local p1, "location":Ljava/lang/String;
    :try_start_320
    invoke-virtual/range {v26 .. v26}, Lcom/lagradost/VideoCard;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v8, v2}, Lcom/lagradost/VideoHubProvider;->cacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_328
    .catch Ljava/util/concurrent/CancellationException; {:try_start_320 .. :try_end_328} :catch_347
    .catch Ljava/lang/Exception; {:try_start_320 .. :try_end_328} :catch_340

    move-object/from16 v31, v3

    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v31, "doc":Lorg/jsoup/nodes/Document;
    :try_start_32a
    invoke-direct {v8, v7}, Lcom/lagradost/VideoHubProvider;->cacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    .line 270
    .end local v26    # "it":Lcom/lagradost/VideoCard;
    .end local v27    # "$i$a$-filter-VideoHubProvider$load$2":I
    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_339

    invoke-interface {v11, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_339
    move-object/from16 v2, p1

    move-object/from16 v0, v30

    move-object/from16 v3, v31

    goto :goto_308

    .line 173
    .end local v0    # "element$iv$iv":Ljava/lang/Object;
    .end local v6    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$filter":I
    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v12    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v16    # "$i$f$filterTo":I
    .end local v30    # "related":Ljava/util/List;
    .end local v31    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    :catch_340
    move-exception v0

    move-object/from16 v31, v3

    move-object/from16 v2, p1

    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v31    # "doc":Lorg/jsoup/nodes/Document;
    goto/16 :goto_3b4

    .end local v31    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    :catch_347
    move-exception v0

    move-object/from16 v31, v3

    move-object/from16 v2, p1

    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v31    # "doc":Lorg/jsoup/nodes/Document;
    goto/16 :goto_3c6

    .line 271
    .end local v31    # "doc":Lorg/jsoup/nodes/Document;
    .end local p1    # "location":Ljava/lang/String;
    .local v0, "related":Ljava/util/List;
    .restart local v2    # "location":Ljava/lang/String;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v6    # "$this$filter$iv":Ljava/lang/Iterable;
    .restart local v10    # "$i$f$filter":I
    .restart local v11    # "destination$iv$iv":Ljava/util/Collection;
    .restart local v12    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .restart local v16    # "$i$f$filterTo":I
    :cond_34e
    move-object/from16 v30, v0

    move-object/from16 p1, v2

    move-object/from16 v31, v3

    .end local v0    # "related":Ljava/util/List;
    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .end local v11    # "destination$iv$iv":Ljava/util/Collection;
    .end local v12    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v16    # "$i$f$filterTo":I
    .restart local v30    # "related":Ljava/util/List;
    .restart local v31    # "doc":Lorg/jsoup/nodes/Document;
    .restart local p1    # "location":Ljava/lang/String;
    move-object v0, v11

    check-cast v0, Ljava/util/List;

    .line 269
    nop

    .end local v6    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$filter":I
    check-cast v0, Ljava/lang/Iterable;

    .line 172
    const/16 v2, 0x1e

    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v26

    const/16 v27, 0x0

    const/16 v28, 0x2f

    const/16 v29, 0x0

    invoke-static/range {v21 .. v29}, Lcom/lagradost/VideoDetails;->copy$default(Lcom/lagradost/VideoDetails;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;ILjava/lang/Object;)Lcom/lagradost/VideoDetails;

    move-result-object v0

    iput-object v0, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;
    :try_end_36c
    .catch Ljava/util/concurrent/CancellationException; {:try_start_32a .. :try_end_36c} :catch_379
    .catch Ljava/lang/Exception; {:try_start_32a .. :try_end_36c} :catch_373

    move-object/from16 v2, p1

    move-object v0, v7

    move-object/from16 v3, v31

    .end local v30    # "related":Ljava/util/List;
    goto/16 :goto_3d7

    .line 173
    :catch_373
    move-exception v0

    move-object/from16 v2, p1

    move-object/from16 v3, v31

    goto :goto_3b4

    :catch_379
    move-exception v0

    move-object/from16 v2, p1

    move-object/from16 v3, v31

    goto/16 :goto_3c6

    .end local v31    # "doc":Lorg/jsoup/nodes/Document;
    .end local p1    # "location":Ljava/lang/String;
    .restart local v2    # "location":Ljava/lang/String;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    :catch_380
    move-exception v0

    move-object/from16 p1, v2

    move-object/from16 v31, v3

    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v31    # "doc":Lorg/jsoup/nodes/Document;
    .restart local p1    # "location":Ljava/lang/String;
    goto :goto_3b4

    .end local v31    # "doc":Lorg/jsoup/nodes/Document;
    .end local p1    # "location":Ljava/lang/String;
    .restart local v2    # "location":Ljava/lang/String;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    :catch_386
    move-exception v0

    move-object/from16 p1, v2

    move-object/from16 v31, v3

    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v31    # "doc":Lorg/jsoup/nodes/Document;
    .restart local p1    # "location":Ljava/lang/String;
    goto :goto_3c6

    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v5    # "cached":Lcom/lagradost/VideoCard;
    .end local v7    # "url":Ljava/lang/String;
    .end local v31    # "doc":Lorg/jsoup/nodes/Document;
    .end local p1    # "location":Ljava/lang/String;
    .local v10, "url":Ljava/lang/String;
    .local v12, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .local v16, "cached":Lcom/lagradost/VideoCard;
    .restart local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    .restart local v21    # "location":Ljava/lang/String;
    .restart local v22    # "doc":Lorg/jsoup/nodes/Document;
    :catch_38c
    move-exception v0

    move-object v7, v10

    move-object v1, v12

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    goto :goto_3b4

    :catch_398
    move-exception v0

    move-object v7, v10

    move-object v1, v12

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    goto :goto_3c6

    .end local v10    # "url":Ljava/lang/String;
    .end local v12    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v21    # "location":Ljava/lang/String;
    .end local v22    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .local v5, "location":Ljava/lang/String;
    .local v6, "doc":Lorg/jsoup/nodes/Document;
    .restart local v7    # "url":Ljava/lang/String;
    :catch_3a4
    move-exception v0

    move-object v12, v4

    move-object/from16 v21, v5

    move-object/from16 v22, v6

    move-object v10, v7

    move-object v1, v12

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    .end local v6    # "doc":Lorg/jsoup/nodes/Document;
    .end local v16    # "cached":Lcom/lagradost/VideoCard;
    .end local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    .restart local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .restart local v2    # "location":Ljava/lang/String;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "apiInfo":Lcom/lagradost/VideoDetails;
    .local v5, "cached":Lcom/lagradost/VideoCard;
    :goto_3b4
    move-object v0, v7

    goto :goto_3d7

    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .local v5, "location":Ljava/lang/String;
    .restart local v6    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v16    # "cached":Lcom/lagradost/VideoCard;
    .restart local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    :catch_3b6
    move-exception v0

    move-object v12, v4

    move-object/from16 v21, v5

    move-object/from16 v22, v6

    move-object v10, v7

    move-object v1, v12

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    .end local v6    # "doc":Lorg/jsoup/nodes/Document;
    .end local v16    # "cached":Lcom/lagradost/VideoCard;
    .end local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .restart local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .restart local v2    # "location":Ljava/lang/String;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "apiInfo":Lcom/lagradost/VideoDetails;
    .local v5, "cached":Lcom/lagradost/VideoCard;
    :goto_3c6
    throw v0

    .line 166
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .local v5, "location":Ljava/lang/String;
    .restart local v6    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v16    # "cached":Lcom/lagradost/VideoCard;
    .restart local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    :cond_3c7
    :goto_3c7
    move-object v12, v4

    move-object/from16 v21, v5

    move-object/from16 v22, v6

    move-object v10, v7

    .line 175
    .end local v4    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v5    # "location":Ljava/lang/String;
    .end local v6    # "doc":Lorg/jsoup/nodes/Document;
    .end local v7    # "url":Ljava/lang/String;
    .restart local v10    # "url":Ljava/lang/String;
    .restart local v12    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .restart local v21    # "location":Ljava/lang/String;
    .restart local v22    # "doc":Lorg/jsoup/nodes/Document;
    move-object v0, v10

    move-object v1, v12

    move-object/from16 v5, v16

    move-object/from16 v4, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    .end local v10    # "url":Ljava/lang/String;
    .end local v12    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v16    # "cached":Lcom/lagradost/VideoCard;
    .end local v19    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v21    # "location":Ljava/lang/String;
    .end local v22    # "doc":Lorg/jsoup/nodes/Document;
    .local v0, "url":Ljava/lang/String;
    .restart local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .restart local v2    # "location":Ljava/lang/String;
    .restart local v3    # "doc":Lorg/jsoup/nodes/Document;
    .local v4, "apiInfo":Lcom/lagradost/VideoDetails;
    .local v5, "cached":Lcom/lagradost/VideoCard;
    :goto_3d7
    move-object v10, v8

    check-cast v10, Lcom/lagradost/cloudstream3/MainAPI;

    iget-object v6, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v6, Lcom/lagradost/VideoDetails;

    invoke-virtual {v6}, Lcom/lagradost/VideoDetails;->getTitle()Ljava/lang/String;

    move-result-object v11

    sget-object v6, Lcom/lagradost/cloudstream3/TvType;->Movie:Lcom/lagradost/cloudstream3/TvType;

    new-instance v7, Lcom/lagradost/VideoHubProvider$load$4;

    const/4 v12, 0x0

    invoke-direct {v7, v1, v8, v2, v12}, Lcom/lagradost/VideoHubProvider$load$4;-><init>(Lkotlin/jvm/internal/Ref$ObjectRef;Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v7, Lkotlin/jvm/functions/Function2;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$0:Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$1:Ljava/lang/Object;

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$2:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$3:Ljava/lang/Object;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$4:Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iput-object v12, v15, Lcom/lagradost/VideoHubProvider$load$1;->L$5:Ljava/lang/Object;

    const/4 v12, 0x5

    iput v12, v15, Lcom/lagradost/VideoHubProvider$load$1;->label:I

    move-object v12, v2

    move-object/from16 v17, v1

    move-object v1, v13

    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .local v17, "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    move-object v13, v6

    move-object v6, v14

    .end local v14    # "$result":Ljava/lang/Object;
    .local v6, "$result":Ljava/lang/Object;
    move-object v14, v2

    move-object/from16 v18, v15

    .end local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .local v18, "$continuation":Lkotlin/coroutines/Continuation;
    move-object v15, v7

    move-object/from16 v16, v18

    invoke-static/range {v10 .. v16}, Lcom/lagradost/cloudstream3/MainAPIKt;->newMovieLoadResponse(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;Ljava/lang/String;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v1, :cond_42a

    .line 152
    invoke-static/range {v1 .. v1}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 175
    :cond_42a
    move-object/from16 v1, v17

    .end local v17    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .restart local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    :goto_42c
    invoke-static/range {v14 .. v14}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    return-object v14

    .line 153
    .end local v0    # "url":Ljava/lang/String;
    .end local v1    # "info":Lkotlin/jvm/internal/Ref$ObjectRef;
    .end local v2    # "location":Ljava/lang/String;
    .end local v3    # "doc":Lorg/jsoup/nodes/Document;
    .end local v4    # "apiInfo":Lcom/lagradost/VideoDetails;
    .end local v5    # "cached":Lcom/lagradost/VideoCard;
    .end local v6    # "$result":Ljava/lang/Object;
    .end local v18    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v14    # "$result":Ljava/lang/Object;
    .restart local v15    # "$continuation":Lkotlin/coroutines/Continuation;
    .local p1, "url":Ljava/lang/String;
    :cond_431
    new-instance v1, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    iget-object v2, v8, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v2}, Lcom/lagradost/CatalogSite;->getLabel()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0435 \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getHasDownloadSupport()Z
    .registers 2

    .line 32
    iget-boolean v0, p0, Lcom/lagradost/VideoHubProvider;->hasDownloadSupport:Z

    return v0
.end method

.method public getHasMainPage()Z
    .registers 2

    .line 31
    iget-boolean v0, p0, Lcom/lagradost/VideoHubProvider;->hasMainPage:Z

    return v0
.end method

.method public getLang()Ljava/lang/String;
    .registers 2

    .line 30
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->lang:Ljava/lang/String;

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

    .line 34
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->mainPage:Ljava/util/List;

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getMainUrl()Ljava/lang/String;
    .registers 2

    .line 29
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->mainUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 28
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->name:Ljava/lang/String;

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

    .line 33
    iget-object v0, p0, Lcom/lagradost/VideoHubProvider;->supportedTypes:Ljava/util/Set;

    return-object v0
.end method

.method public homeUnscreened(ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 24
    .param p1, "page"    # I
    .param p2, "request"    # Lcom/lagradost/cloudstream3/MainPageRequest;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
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

    move-object/from16 v7, p0

    move/from16 v8, p1

    move-object/from16 v9, p3

    instance-of v0, v9, Lcom/lagradost/VideoHubProvider$getMainPage$1;

    if-eqz v0, :cond_1a

    move-object v0, v9

    check-cast v0, Lcom/lagradost/VideoHubProvider$getMainPage$1;

    iget v1, v0, Lcom/lagradost/VideoHubProvider$getMainPage$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_1a

    iget v1, v0, Lcom/lagradost/VideoHubProvider$getMainPage$1;->label:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/lagradost/VideoHubProvider$getMainPage$1;->label:I

    goto :goto_1f

    :cond_1a
    new-instance v0, Lcom/lagradost/VideoHubProvider$getMainPage$1;

    invoke-direct {v0, v7, v9}, Lcom/lagradost/VideoHubProvider$getMainPage$1;-><init>(Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    :goto_1f
    move-object v10, v0

    .local v10, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v11, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->result:Ljava/lang/Object;

    .local v11, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v12

    .line 83
    iget v0, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->label:I

    const/4 v13, 0x0

    const/4 v14, 0x1

    if-eqz v0, :cond_47

    if-ne v0, v14, :cond_3f

    iget v0, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->I$0:I

    .end local p1    # "page":I
    .local v0, "page":I
    iget-object v1, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->L$1:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .local v1, "url":Ljava/lang/String;
    iget-object v2, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->L$0:Ljava/lang/Object;

    check-cast v2, Lcom/lagradost/cloudstream3/MainPageRequest;

    .end local p2    # "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    .local v2, "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    invoke-static {v11}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v15, v2

    move-object v2, v1

    move-object v1, v11

    goto :goto_98

    .end local v0    # "page":I
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    .end local v10    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v11    # "$result":Ljava/lang/Object;
    .restart local p1    # "page":I
    .restart local p2    # "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    :cond_3f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v10    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v11    # "$result":Ljava/lang/Object;
    :cond_47
    invoke-static {v11}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 84
    if-ne v8, v14, :cond_51

    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/cloudstream3/MainPageRequest;->getData()Ljava/lang/String;

    move-result-object v0

    goto :goto_74

    :cond_51
    iget-object v0, v7, Lcom/lagradost/VideoHubProvider;->pageUrls:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static/range {p1 .. p1}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_74

    invoke-virtual/range {p2 .. p2}, Lcom/lagradost/cloudstream3/MainPageRequest;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lagradost/cloudstream3/MainAPIKt;->newHomePageResponse(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)Lcom/lagradost/cloudstream3/HomePageResponse;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_74
    :goto_74
    move-object v1, v0

    .line 85
    .restart local v1    # "url":Ljava/lang/String;
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x6

    const/4 v6, 0x0

    move-object/from16 v15, p2

    iput-object v15, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->L$0:Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->L$1:Ljava/lang/Object;

    iput v8, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->I$0:I

    iput v14, v10, Lcom/lagradost/VideoHubProvider$getMainPage$1;->label:I

    move-object/from16 v0, p0

    move-object v4, v10

    invoke-static/range {v0 .. v6}, Lcom/lagradost/VideoHubProvider;->fetch$default(Lcom/lagradost/VideoHubProvider;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v12, :cond_95

    .line 83
    invoke-static/range {v12 .. v12}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    return-object v12

    .line 85
    :cond_95
    move-object v2, v1

    move-object v1, v0

    move v0, v8

    .line 83
    .end local v1    # "url":Ljava/lang/String;
    .end local p1    # "page":I
    .end local p2    # "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    .restart local v0    # "page":I
    .local v2, "url":Ljava/lang/String;
    .local v15, "request":Lcom/lagradost/cloudstream3/MainPageRequest;
    :goto_98
    check-cast v1, Lorg/jsoup/nodes/Document;

    .line 86
    .local v1, "doc":Lorg/jsoup/nodes/Document;
    sget-object v3, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    move-object v4, v1

    check-cast v4, Lorg/jsoup/nodes/Element;

    iget-object v5, v7, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v6

    const-string v8, "location(...)"

    invoke-static {v6, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3, v4, v5, v6}, Lcom/lagradost/CatalogParser;->cards(Lorg/jsoup/nodes/Element;Lcom/lagradost/CatalogSite;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 87
    .local v3, "cards":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_11b

    .line 88
    sget-object v4, Lcom/lagradost/CatalogParser;->INSTANCE:Lcom/lagradost/CatalogParser;

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, v1, v5, v0}, Lcom/lagradost/CatalogParser;->nextPage(Lorg/jsoup/nodes/Document;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    .line 89
    .local v4, "next":Ljava/lang/String;
    if-eqz v4, :cond_d0

    iget-object v5, v7, Lcom/lagradost/VideoHubProvider;->pageUrls:Ljava/util/concurrent/ConcurrentHashMap;

    check-cast v5, Ljava/util/Map;

    add-int/lit8 v6, v0, 0x1

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    :cond_d0
    invoke-virtual {v15}, Lcom/lagradost/cloudstream3/MainPageRequest;->getName()Ljava/lang/String;

    move-result-object v5

    move-object v6, v3

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 249
    .local v8, "$i$f$map":I
    new-instance v12, Ljava/util/ArrayList;

    const/16 v13, 0xa

    invoke-static {v6, v13}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v12, Ljava/util/Collection;

    .local v12, "destination$iv$iv":Ljava/util/Collection;
    move-object v13, v6

    .local v13, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/16 v16, 0x0

    .line 250
    .local v16, "$i$f$mapTo":I
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_ec
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_105

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    .line 251
    .local v18, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v14, v18

    check-cast v14, Lcom/lagradost/VideoCard;

    .local v14, "it":Lcom/lagradost/VideoCard;
    const/16 v19, 0x0

    .line 90
    .local v19, "$i$a$-map-VideoHubProvider$getMainPage$2":I
    invoke-direct {v7, v14}, Lcom/lagradost/VideoHubProvider;->toResult(Lcom/lagradost/VideoCard;)Lcom/lagradost/cloudstream3/SearchResponse;

    move-result-object v14

    .line 251
    .end local v14    # "it":Lcom/lagradost/VideoCard;
    .end local v19    # "$i$a$-map-VideoHubProvider$getMainPage$2":I
    invoke-interface {v12, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/4 v14, 0x1

    goto :goto_ec

    .line 252
    .end local v18    # "item$iv$iv":Ljava/lang/Object;
    :cond_105
    nop

    .end local v12    # "destination$iv$iv":Ljava/util/Collection;
    .end local v13    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v16    # "$i$f$mapTo":I
    check-cast v12, Ljava/util/List;

    .line 249
    nop

    .line 90
    .end local v6    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$map":I
    if-eqz v4, :cond_10d

    const/4 v13, 0x1

    goto :goto_10e

    :cond_10d
    const/4 v13, 0x0

    :goto_10e
    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-static {v5, v12, v6}, Lcom/lagradost/cloudstream3/MainAPIKt;->newHomePageResponse(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)Lcom/lagradost/cloudstream3/HomePageResponse;

    move-result-object v5

    invoke-static/range {v5 .. v5}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    return-object v5

    .line 87
    .end local v4    # "next":Ljava/lang/String;
    :cond_11b
    new-instance v4, Lcom/lagradost/cloudstream3/ErrorLoadingException;

    iget-object v5, v7, Lcom/lagradost/VideoHubProvider;->site:Lcom/lagradost/CatalogSite;

    invoke-virtual {v5}, Lcom/lagradost/CatalogSite;->getLabel()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ": \u0441\u0430\u0439\u0442 \u043d\u0435 \u0432\u0435\u0440\u043d\u0443\u043b \u043a\u0430\u0442\u0430\u043b\u043e\u0433. \u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0434\u043e\u0441\u0442\u0443\u043f \u043a \u0441\u0430\u0439\u0442\u0443 \u0432\u043e \u0432\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u043e\u043c \u0431\u0440\u0430\u0443\u0437\u0435\u0440\u0435."

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/lagradost/cloudstream3/ErrorLoadingException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public linksOriginal48(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 39
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "isCasting"    # Z
    .param p3, "subtitleCallback"    # Lkotlin/jvm/functions/Function1;
    .param p4, "callback"    # Lkotlin/jvm/functions/Function1;
    .param p5, "$completion"    # Lkotlin/coroutines/Continuation;
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

    invoke-static/range {p4 .. p4}, Lcom/streambundle/Unified;->links(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;

    move-result-object p4

    invoke-static/range {p1 .. p1}, Lcom/streambundle/Unified;->playbackUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    move-object/from16 v1, p5

    instance-of v0, v1, Lcom/lagradost/VideoHubProvider$loadLinks$1;

    if-eqz v0, :cond_20

    move-object v0, v1

    check-cast v0, Lcom/lagradost/VideoHubProvider$loadLinks$1;

    iget v2, v0, Lcom/lagradost/VideoHubProvider$loadLinks$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_20

    iget v2, v0, Lcom/lagradost/VideoHubProvider$loadLinks$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v0, Lcom/lagradost/VideoHubProvider$loadLinks$1;->label:I

    move-object/from16 v11, p0

    goto :goto_27

    :cond_20
    new-instance v0, Lcom/lagradost/VideoHubProvider$loadLinks$1;

    move-object/from16 v11, p0

    invoke-direct {v0, v11, v1}, Lcom/lagradost/VideoHubProvider$loadLinks$1;-><init>(Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    :goto_27
    move-object v12, v0

    .local v12, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v13, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->result:Ljava/lang/Object;

    .local v13, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v14

    .line 185
    iget v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->label:I

    const/4 v15, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    if-eqz v0, :cond_cc

    if-eq v0, v9, :cond_a1

    if-eq v0, v10, :cond_6c

    if-ne v0, v15, :cond_64

    iget-boolean v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->Z$0:Z

    .end local p2    # "isCasting":Z
    .local v0, "isCasting":Z
    iget-object v2, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$7:Ljava/lang/Object;

    check-cast v2, Lokhttp3/Request;

    .local v2, "request":Lokhttp3/Request;
    iget-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$6:Ljava/lang/Object;

    check-cast v3, Lkotlin/text/Regex;

    .local v3, "pattern":Lkotlin/text/Regex;
    iget-object v4, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$5:Ljava/lang/Object;

    check-cast v4, Lkotlin/jvm/functions/Function1;

    .local v4, "wrapped":Lkotlin/jvm/functions/Function1;
    iget-object v5, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$4:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashSet;

    .local v5, "visited":Ljava/util/HashSet;
    iget-object v6, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$3:Ljava/lang/Object;

    check-cast v6, Ljava/util/HashSet;

    .local v6, "emitted":Ljava/util/HashSet;
    iget-object v7, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$2:Ljava/lang/Object;

    check-cast v7, Lkotlin/jvm/functions/Function1;

    .end local p4    # "callback":Lkotlin/jvm/functions/Function1;
    .local v7, "callback":Lkotlin/jvm/functions/Function1;
    iget-object v8, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .end local p3    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v8, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v10, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    .end local p1    # "data":Ljava/lang/String;
    .local v10, "data":Ljava/lang/String;
    invoke-static {v13}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move/from16 v18, v9

    goto/16 :goto_297

    .end local v0    # "isCasting":Z
    .end local v2    # "request":Lokhttp3/Request;
    .end local v3    # "pattern":Lkotlin/text/Regex;
    .end local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v5    # "visited":Ljava/util/HashSet;
    .end local v6    # "emitted":Ljava/util/HashSet;
    .end local v7    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v8    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v10    # "data":Ljava/lang/String;
    .end local v12    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v13    # "$result":Ljava/lang/Object;
    .restart local p1    # "data":Ljava/lang/String;
    .restart local p2    # "isCasting":Z
    .restart local p3    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "callback":Lkotlin/jvm/functions/Function1;
    :cond_64
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v12    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v13    # "$result":Ljava/lang/Object;
    :cond_6c
    iget-boolean v2, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->Z$0:Z

    .end local p2    # "isCasting":Z
    .local v2, "isCasting":Z
    iget-object v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$6:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lkotlin/text/Regex;

    .restart local v3    # "pattern":Lkotlin/text/Regex;
    iget-object v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$5:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lkotlin/jvm/functions/Function1;

    .restart local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    iget-object v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$4:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/util/HashSet;

    .restart local v5    # "visited":Ljava/util/HashSet;
    iget-object v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$3:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/util/HashSet;

    .restart local v6    # "emitted":Ljava/util/HashSet;
    iget-object v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$2:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lkotlin/jvm/functions/Function1;

    .end local p4    # "callback":Lkotlin/jvm/functions/Function1;
    .restart local v7    # "callback":Lkotlin/jvm/functions/Function1;
    iget-object v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .end local p3    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local v8    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Ljava/lang/String;

    .end local p1    # "data":Ljava/lang/String;
    .restart local v10    # "data":Ljava/lang/String;
    :try_start_91
    invoke-static {v13}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_94
    .catch Ljava/util/concurrent/CancellationException; {:try_start_91 .. :try_end_94} :catch_9e
    .catch Ljava/lang/Exception; {:try_start_91 .. :try_end_94} :catch_99

    move/from16 v18, v9

    move-object v0, v13

    goto/16 :goto_196

    .line 241
    :catch_99
    move-exception v0

    move/from16 v18, v9

    goto/16 :goto_1df

    :catch_9e
    move-exception v0

    goto/16 :goto_2c0

    .line 185
    .end local v2    # "isCasting":Z
    .end local v3    # "pattern":Lkotlin/text/Regex;
    .end local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v5    # "visited":Ljava/util/HashSet;
    .end local v6    # "emitted":Ljava/util/HashSet;
    .end local v7    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v8    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v10    # "data":Ljava/lang/String;
    .restart local p1    # "data":Ljava/lang/String;
    .restart local p2    # "isCasting":Z
    .restart local p3    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "callback":Lkotlin/jvm/functions/Function1;
    :cond_a1
    iget-boolean v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->Z$0:Z

    .end local p2    # "isCasting":Z
    .restart local v0    # "isCasting":Z
    iget-object v2, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$5:Ljava/lang/Object;

    check-cast v2, Lkotlin/jvm/functions/Function1;

    .local v2, "wrapped":Lkotlin/jvm/functions/Function1;
    iget-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$4:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashSet;

    .local v3, "visited":Ljava/util/HashSet;
    iget-object v4, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$3:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashSet;

    .local v4, "emitted":Ljava/util/HashSet;
    iget-object v5, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$2:Ljava/lang/Object;

    check-cast v5, Lkotlin/jvm/functions/Function1;

    .end local p4    # "callback":Lkotlin/jvm/functions/Function1;
    .local v5, "callback":Lkotlin/jvm/functions/Function1;
    iget-object v6, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    check-cast v6, Lkotlin/jvm/functions/Function1;

    .end local p3    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v6, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    iget-object v7, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    .end local p1    # "data":Ljava/lang/String;
    .local v7, "data":Ljava/lang/String;
    invoke-static {v13}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v8, v2

    move-object/from16 v20, v3

    move-object/from16 v19, v5

    move-object/from16 v17, v6

    move/from16 v18, v9

    move v15, v10

    move v9, v0

    move-object v10, v7

    move-object v7, v4

    goto :goto_128

    .end local v0    # "isCasting":Z
    .end local v2    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v3    # "visited":Ljava/util/HashSet;
    .end local v4    # "emitted":Ljava/util/HashSet;
    .end local v5    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v6    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v7    # "data":Ljava/lang/String;
    .restart local p1    # "data":Ljava/lang/String;
    .restart local p2    # "isCasting":Z
    .restart local p3    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "callback":Lkotlin/jvm/functions/Function1;
    :cond_cc
    invoke-static {v13}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 186
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 187
    .local v0, "emitted":Ljava/util/HashSet;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 188
    .local v2, "visited":Ljava/util/HashSet;
    new-instance v8, Lcom/lagradost/-$$Lambda$VideoHubProvider$XJSavOqzIlO8FmvX8idv3KX-PO4;

    move-object/from16 v7, p4

    .local v8, "wrapped":Lkotlin/jvm/functions/Function1;
    invoke-direct {v8, v0, v7}, Lcom/lagradost/-$$Lambda$VideoHubProvider$XJSavOqzIlO8FmvX8idv3KX-PO4;-><init>(Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;)V

    .line 236
    const/16 v16, 0x0

    move-object/from16 v6, p1

    iput-object v6, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    invoke-static/range {p3 .. p3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    invoke-static/range {p4 .. p4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$2:Ljava/lang/Object;

    iput-object v0, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$3:Ljava/lang/Object;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$4:Ljava/lang/Object;

    iput-object v8, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$5:Ljava/lang/Object;

    move/from16 v5, p2

    iput-boolean v5, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->Z$0:Z

    iput v9, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->label:I

    move-object/from16 v3, p0

    move-object/from16 v4, p3

    move-object v5, v8

    move-object v6, v0

    move-object/from16 v7, p1

    move-object/from16 v17, v8

    .end local v8    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v17, "wrapped":Lkotlin/jvm/functions/Function1;
    move-object/from16 v8, p1

    move/from16 v18, v9

    move/from16 v9, v16

    move v15, v10

    move-object v10, v12

    invoke-static/range {v2 .. v10}, Lcom/lagradost/VideoHubProvider;->loadLinks$resolve(Ljava/util/HashSet;Lcom/lagradost/VideoHubProvider;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v14, :cond_11b

    .line 185
    return-object v14

    .line 236
    :cond_11b
    move-object/from16 v10, p1

    move/from16 v9, p2

    move-object/from16 v19, p4

    move-object v7, v0

    move-object/from16 v20, v2

    move-object/from16 v8, v17

    move-object/from16 v17, p3

    .line 237
    .end local v0    # "emitted":Ljava/util/HashSet;
    .end local v2    # "visited":Ljava/util/HashSet;
    .end local p1    # "data":Ljava/lang/String;
    .end local p2    # "isCasting":Z
    .end local p3    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local p4    # "callback":Lkotlin/jvm/functions/Function1;
    .local v7, "emitted":Ljava/util/HashSet;
    .restart local v8    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v9, "isCasting":Z
    .restart local v10    # "data":Ljava/lang/String;
    .local v17, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v19, "callback":Lkotlin/jvm/functions/Function1;
    .local v20, "visited":Ljava/util/HashSet;
    :goto_128
    invoke-virtual {v7}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2c1

    .line 238
    new-instance v0, Lkotlin/text/Regex;

    const-string v2, "(?i)^https?://(?![^/]*(?:ads|traffic|doubleclick))(?!.+(?:preview|trailer|preroll|vast)).+\\.(?:m3u8|mp4)(?:[?#].*)?$"

    invoke-direct {v0, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object/from16 v22, v0

    .line 239
    .local v22, "pattern":Lkotlin/text/Regex;
    nop

    .line 240
    :try_start_138
    new-instance v2, Lcom/lagradost/cloudstream3/network/WebViewResolver;

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const-wide/16 v28, 0x61a8

    const/16 v30, 0x36

    const/16 v31, 0x0

    move-object/from16 v21, v2

    invoke-direct/range {v21 .. v31}, Lcom/lagradost/cloudstream3/network/WebViewResolver;-><init>(Lkotlin/text/Regex;Ljava/util/List;Ljava/lang/String;ZLjava/lang/String;Lkotlin/jvm/functions/Function1;JILkotlin/jvm/internal/DefaultConstructorMarker;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v0, 0xc

    const/16 v21, 0x0

    iput-object v10, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    invoke-static/range {v17 .. v17}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    invoke-static/range {v19 .. v19}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$2:Ljava/lang/Object;

    iput-object v7, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$3:Ljava/lang/Object;

    invoke-static/range {v20 .. v20}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$4:Ljava/lang/Object;

    iput-object v8, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$5:Ljava/lang/Object;

    invoke-static/range {v22 .. v22}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$6:Ljava/lang/Object;

    iput-boolean v9, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->Z$0:Z

    iput v15, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->label:I
    :try_end_177
    .catch Ljava/util/concurrent/CancellationException; {:try_start_138 .. :try_end_177} :catch_2ad
    .catch Ljava/lang/Exception; {:try_start_138 .. :try_end_177} :catch_1cc

    move-object v3, v10

    move-object v4, v10

    move-object v15, v7

    .end local v7    # "emitted":Ljava/util/HashSet;
    .local v15, "emitted":Ljava/util/HashSet;
    move-object v7, v12

    move-object/from16 v23, v8

    .end local v8    # "wrapped":Lkotlin/jvm/functions/Function1;
    .local v23, "wrapped":Lkotlin/jvm/functions/Function1;
    move v8, v0

    move/from16 v24, v9

    .end local v9    # "isCasting":Z
    .local v24, "isCasting":Z
    move-object/from16 v9, v21

    :try_start_182
    invoke-static/range {v2 .. v9}, Lcom/lagradost/cloudstream3/network/WebViewResolver;->resolveUsingWebView$default(Lcom/lagradost/cloudstream3/network/WebViewResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_186
    .catch Ljava/util/concurrent/CancellationException; {:try_start_182 .. :try_end_186} :catch_1bc
    .catch Ljava/lang/Exception; {:try_start_182 .. :try_end_186} :catch_1ad

    if-ne v0, v14, :cond_189

    .line 185
    return-object v14

    .line 240
    :cond_189
    move-object v6, v15

    move-object/from16 v8, v17

    move-object/from16 v7, v19

    move-object/from16 v5, v20

    move-object/from16 v3, v22

    move-object/from16 v4, v23

    move/from16 v2, v24

    .end local v15    # "emitted":Ljava/util/HashSet;
    .end local v17    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v19    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v20    # "visited":Ljava/util/HashSet;
    .end local v22    # "pattern":Lkotlin/text/Regex;
    .end local v23    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v24    # "isCasting":Z
    .local v2, "isCasting":Z
    .local v3, "pattern":Lkotlin/text/Regex;
    .local v4, "wrapped":Lkotlin/jvm/functions/Function1;
    .local v5, "visited":Ljava/util/HashSet;
    .local v6, "emitted":Ljava/util/HashSet;
    .local v7, "callback":Lkotlin/jvm/functions/Function1;
    .local v8, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    :goto_196
    :try_start_196
    check-cast v0, Lkotlin/Pair;

    invoke-virtual {v0}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/Request;
    :try_end_19e
    .catch Ljava/util/concurrent/CancellationException; {:try_start_196 .. :try_end_19e} :catch_9e
    .catch Ljava/lang/Exception; {:try_start_196 .. :try_end_19e} :catch_1ab

    move v9, v2

    move-object v15, v4

    move-object/from16 v17, v5

    move-object/from16 v19, v7

    move-object/from16 v20, v8

    move-object/from16 v21, v10

    move-object v10, v3

    move-object v8, v6

    goto :goto_1ed

    .line 241
    :catch_1ab
    move-exception v0

    goto :goto_1df

    .end local v2    # "isCasting":Z
    .end local v3    # "pattern":Lkotlin/text/Regex;
    .end local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v5    # "visited":Ljava/util/HashSet;
    .end local v6    # "emitted":Ljava/util/HashSet;
    .end local v7    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v8    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local v15    # "emitted":Ljava/util/HashSet;
    .restart local v17    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local v19    # "callback":Lkotlin/jvm/functions/Function1;
    .restart local v20    # "visited":Ljava/util/HashSet;
    .restart local v22    # "pattern":Lkotlin/text/Regex;
    .restart local v23    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v24    # "isCasting":Z
    :catch_1ad
    move-exception v0

    move-object v6, v15

    move-object/from16 v8, v17

    move-object/from16 v7, v19

    move-object/from16 v5, v20

    move-object/from16 v3, v22

    move-object/from16 v4, v23

    move/from16 v2, v24

    goto :goto_1df

    :catch_1bc
    move-exception v0

    move-object v6, v15

    move-object/from16 v8, v17

    move-object/from16 v7, v19

    move-object/from16 v5, v20

    move-object/from16 v3, v22

    move-object/from16 v4, v23

    move/from16 v2, v24

    goto/16 :goto_2c0

    .end local v15    # "emitted":Ljava/util/HashSet;
    .end local v23    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v24    # "isCasting":Z
    .local v7, "emitted":Ljava/util/HashSet;
    .local v8, "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v9    # "isCasting":Z
    :catch_1cc
    move-exception v0

    move-object v15, v7

    move-object/from16 v23, v8

    move/from16 v24, v9

    move-object v6, v15

    move-object/from16 v8, v17

    move-object/from16 v7, v19

    move-object/from16 v5, v20

    move-object/from16 v3, v22

    move-object/from16 v4, v23

    move/from16 v2, v24

    .end local v9    # "isCasting":Z
    .end local v17    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v19    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v20    # "visited":Ljava/util/HashSet;
    .end local v22    # "pattern":Lkotlin/text/Regex;
    .local v0, "<unused var>":Ljava/lang/Exception;
    .restart local v2    # "isCasting":Z
    .restart local v3    # "pattern":Lkotlin/text/Regex;
    .restart local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v5    # "visited":Ljava/util/HashSet;
    .restart local v6    # "emitted":Ljava/util/HashSet;
    .local v7, "callback":Lkotlin/jvm/functions/Function1;
    .local v8, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    :goto_1df
    const/4 v9, 0x0

    move-object v15, v4

    move-object/from16 v17, v5

    move-object/from16 v19, v7

    move-object/from16 v20, v8

    move-object v0, v9

    move-object/from16 v21, v10

    move v9, v2

    move-object v10, v3

    move-object v8, v6

    .line 239
    .end local v0    # "<unused var>":Ljava/lang/Exception;
    .end local v2    # "isCasting":Z
    .end local v3    # "pattern":Lkotlin/text/Regex;
    .end local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v5    # "visited":Ljava/util/HashSet;
    .end local v6    # "emitted":Ljava/util/HashSet;
    .end local v7    # "callback":Lkotlin/jvm/functions/Function1;
    .local v8, "emitted":Ljava/util/HashSet;
    .restart local v9    # "isCasting":Z
    .local v10, "pattern":Lkotlin/text/Regex;
    .local v15, "wrapped":Lkotlin/jvm/functions/Function1;
    .local v17, "visited":Ljava/util/HashSet;
    .restart local v19    # "callback":Lkotlin/jvm/functions/Function1;
    .local v20, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v21, "data":Ljava/lang/String;
    :goto_1ed
    nop

    .line 242
    .local v0, "request":Lokhttp3/Request;
    if-eqz v0, :cond_2a1

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lokhttp3/Request;->headers()Lokhttp3/Headers;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Headers;->names()Ljava/util/Set;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$associateWith$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 272
    .local v3, "$i$f$associateWith":I
    new-instance v4, Ljava/util/LinkedHashMap;

    const/16 v6, 0xa

    invoke-static {v2, v6}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-static {v6}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v6

    const/16 v7, 0x10

    invoke-static {v6, v7}, Lkotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 273
    .local v4, "result$iv":Ljava/util/LinkedHashMap;
    move-object v7, v4

    check-cast v7, Ljava/util/Map;

    .local v7, "destination$iv$iv":Ljava/util/Map;
    move-object v6, v2

    .local v6, "$this$associateWithTo$iv$iv":Ljava/lang/Iterable;
    const/16 v22, 0x0

    .line 274
    .local v22, "$i$f$associateWithTo":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_222
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_247

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 275
    .local v1, "element$iv$iv":Ljava/lang/Object;
    move-object/from16 p1, v2

    .end local v2    # "$this$associateWith$iv":Ljava/lang/Iterable;
    .local p1, "$this$associateWith$iv":Ljava/lang/Iterable;
    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    .local v2, "it":Ljava/lang/String;
    const/16 v24, 0x0

    .line 242
    .local v24, "$i$a$-associateWith-VideoHubProvider$loadLinks$2":I
    invoke-virtual {v0, v2}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    if-nez v25, :cond_23b

    const-string v25, ""

    :cond_23b
    move-object/from16 p2, v2

    move-object/from16 v2, v25

    .line 275
    .end local v2    # "it":Ljava/lang/String;
    .end local v24    # "$i$a$-associateWith-VideoHubProvider$loadLinks$2":I
    invoke-interface {v7, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v2, p1

    move-object/from16 v1, p5

    goto :goto_222

    .line 277
    .end local v1    # "element$iv$iv":Ljava/lang/Object;
    .end local p1    # "$this$associateWith$iv":Ljava/lang/Iterable;
    .local v2, "$this$associateWith$iv":Ljava/lang/Iterable;
    :cond_247
    move-object/from16 p1, v2

    .line 273
    .end local v2    # "$this$associateWith$iv":Ljava/lang/Iterable;
    .end local v6    # "$this$associateWithTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "destination$iv$iv":Ljava/util/Map;
    .end local v22    # "$i$f$associateWithTo":I
    .restart local p1    # "$this$associateWith$iv":Ljava/lang/Iterable;
    nop

    .line 242
    .end local v3    # "$i$f$associateWith":I
    .end local v4    # "result$iv":Ljava/util/LinkedHashMap;
    .end local p1    # "$this$associateWith$iv":Ljava/lang/Iterable;
    invoke-static/range {v21 .. v21}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$0:Ljava/lang/Object;

    invoke-static/range {v20 .. v20}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$1:Ljava/lang/Object;

    invoke-static/range {v19 .. v19}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$2:Ljava/lang/Object;

    iput-object v8, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$3:Ljava/lang/Object;

    invoke-static/range {v17 .. v17}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$4:Ljava/lang/Object;

    invoke-static {v15}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$5:Ljava/lang/Object;

    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$6:Ljava/lang/Object;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->L$7:Ljava/lang/Object;

    iput-boolean v9, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->Z$0:Z

    const/4 v1, 0x3

    iput v1, v12, Lcom/lagradost/VideoHubProvider$loadLinks$1;->label:I

    move-object/from16 v2, p0

    move-object v3, v8

    move-object v4, v15

    move-object/from16 v6, v21

    move-object v1, v8

    .end local v8    # "emitted":Ljava/util/HashSet;
    .local v1, "emitted":Ljava/util/HashSet;
    move-object v8, v12

    invoke-static/range {v2 .. v8}, Lcom/lagradost/VideoHubProvider;->loadLinks$emit(Lcom/lagradost/VideoHubProvider;Ljava/util/HashSet;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v14, :cond_28a

    .line 185
    return-object v14

    .line 242
    :cond_28a
    move-object v2, v0

    move-object v6, v1

    move v0, v9

    move-object v3, v10

    move-object v4, v15

    move-object/from16 v5, v17

    move-object/from16 v7, v19

    move-object/from16 v8, v20

    move-object/from16 v10, v21

    .line 244
    .end local v1    # "emitted":Ljava/util/HashSet;
    .end local v9    # "isCasting":Z
    .end local v15    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v17    # "visited":Ljava/util/HashSet;
    .end local v19    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v20    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v21    # "data":Ljava/lang/String;
    .local v0, "isCasting":Z
    .local v2, "request":Lokhttp3/Request;
    .local v3, "pattern":Lkotlin/text/Regex;
    .local v4, "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v5    # "visited":Ljava/util/HashSet;
    .local v6, "emitted":Ljava/util/HashSet;
    .local v7, "callback":Lkotlin/jvm/functions/Function1;
    .local v8, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v10, "data":Ljava/lang/String;
    :goto_297
    move v9, v0

    move-object/from16 v20, v5

    move-object/from16 v19, v7

    move-object/from16 v17, v8

    move-object v8, v4

    move-object v7, v6

    goto :goto_2c6

    .line 242
    .end local v2    # "request":Lokhttp3/Request;
    .end local v3    # "pattern":Lkotlin/text/Regex;
    .end local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v5    # "visited":Ljava/util/HashSet;
    .end local v6    # "emitted":Ljava/util/HashSet;
    .end local v7    # "callback":Lkotlin/jvm/functions/Function1;
    .local v0, "request":Lokhttp3/Request;
    .local v8, "emitted":Ljava/util/HashSet;
    .restart local v9    # "isCasting":Z
    .local v10, "pattern":Lkotlin/text/Regex;
    .restart local v15    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v17    # "visited":Ljava/util/HashSet;
    .restart local v19    # "callback":Lkotlin/jvm/functions/Function1;
    .restart local v20    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local v21    # "data":Ljava/lang/String;
    :cond_2a1
    move-object v1, v8

    .end local v8    # "emitted":Ljava/util/HashSet;
    .restart local v1    # "emitted":Ljava/util/HashSet;
    move-object v7, v1

    move-object v8, v15

    move-object/from16 v10, v21

    move-object/from16 v32, v20

    move-object/from16 v20, v17

    move-object/from16 v17, v32

    goto :goto_2c6

    .line 241
    .end local v0    # "request":Lokhttp3/Request;
    .end local v1    # "emitted":Ljava/util/HashSet;
    .end local v15    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v21    # "data":Ljava/lang/String;
    .local v7, "emitted":Ljava/util/HashSet;
    .local v8, "wrapped":Lkotlin/jvm/functions/Function1;
    .local v10, "data":Ljava/lang/String;
    .local v17, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .local v20, "visited":Ljava/util/HashSet;
    .local v22, "pattern":Lkotlin/text/Regex;
    :catch_2ad
    move-exception v0

    move-object v15, v7

    move-object/from16 v23, v8

    move/from16 v24, v9

    move-object v6, v15

    move-object/from16 v8, v17

    move-object/from16 v7, v19

    move-object/from16 v5, v20

    move-object/from16 v3, v22

    move-object/from16 v4, v23

    move/from16 v2, v24

    .end local v9    # "isCasting":Z
    .end local v17    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .end local v19    # "callback":Lkotlin/jvm/functions/Function1;
    .end local v20    # "visited":Ljava/util/HashSet;
    .end local v22    # "pattern":Lkotlin/text/Regex;
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    .local v2, "isCasting":Z
    .restart local v3    # "pattern":Lkotlin/text/Regex;
    .restart local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v5    # "visited":Ljava/util/HashSet;
    .restart local v6    # "emitted":Ljava/util/HashSet;
    .local v7, "callback":Lkotlin/jvm/functions/Function1;
    .local v8, "subtitleCallback":Lkotlin/jvm/functions/Function1;
    :goto_2c0
    throw v0

    .line 237
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    .end local v2    # "isCasting":Z
    .end local v3    # "pattern":Lkotlin/text/Regex;
    .end local v4    # "wrapped":Lkotlin/jvm/functions/Function1;
    .end local v5    # "visited":Ljava/util/HashSet;
    .end local v6    # "emitted":Ljava/util/HashSet;
    .local v7, "emitted":Ljava/util/HashSet;
    .local v8, "wrapped":Lkotlin/jvm/functions/Function1;
    .restart local v9    # "isCasting":Z
    .restart local v17    # "subtitleCallback":Lkotlin/jvm/functions/Function1;
    .restart local v19    # "callback":Lkotlin/jvm/functions/Function1;
    .restart local v20    # "visited":Ljava/util/HashSet;
    :cond_2c1
    move-object v15, v7

    move-object/from16 v23, v8

    move/from16 v24, v9

    .line 244
    :goto_2c6
    move-object v0, v7

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
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
    .registers 5
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
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

    .line 114
    new-instance v0, Lcom/lagradost/VideoHubProvider$search$2;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p0, v1}, Lcom/lagradost/VideoHubProvider$search$2;-><init>(Ljava/lang/String;Lcom/lagradost/VideoHubProvider;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, p2}, Lkotlinx/coroutines/CoroutineScopeKt;->coroutineScope(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 139
    invoke-static/range {v0 .. v0}, Lcom/streambundle/Unified;->output(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setLang(Ljava/lang/String;)V
    .registers 3
    .param p1, "<set-?>"    # Ljava/lang/String;

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    iput-object p1, p0, Lcom/lagradost/VideoHubProvider;->lang:Ljava/lang/String;

    return-void
.end method

.method public setMainUrl(Ljava/lang/String;)V
    .registers 3
    .param p1, "<set-?>"    # Ljava/lang/String;

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    iput-object p1, p0, Lcom/lagradost/VideoHubProvider;->mainUrl:Ljava/lang/String;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "<set-?>"    # Ljava/lang/String;

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    iput-object p1, p0, Lcom/lagradost/VideoHubProvider;->name:Ljava/lang/String;

    return-void
.end method
