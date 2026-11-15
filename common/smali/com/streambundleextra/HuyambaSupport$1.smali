.class Lcom/streambundleextra/HuyambaSupport$1;
.super Ljava/lang/Object;
.source "HuyambaSupport.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundleextra/HuyambaSupport;->search(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$end:Lkotlin/coroutines/Continuation;

.field private final synthetic val$site:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lkotlin/coroutines/Continuation;Ljava/lang/Object;)V
    .registers 3

    .line 18
    iput-object p1, p0, Lcom/streambundleextra/HuyambaSupport$1;->val$end:Lkotlin/coroutines/Continuation;

    iput-object p2, p0, Lcom/streambundleextra/HuyambaSupport$1;->val$site:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/String;Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 31
    check-cast p2, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    invoke-virtual {p2, p0}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterUrl(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Lcom/lagradost/cloudstream3/MovieSearchResponse;->setPosterHeaders(Ljava/util/Map;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .registers 3

    .line 19
    iget-object p1, p0, Lcom/streambundleextra/HuyambaSupport$1;->val$end:Lkotlin/coroutines/Continuation;

    invoke-static {p2}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p2

    invoke-interface {p1, p2}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .registers 19

    .line 22
    move-object/from16 v1, p0

    .line 23
    :try_start_2
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_c1

    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_c1

    .line 24
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/HuyambaSupport;->site(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b9

    .line 25
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/streambundleextra/MediaFix;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundleextra/MediaFix;->searchDocument(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v2

    .line 26
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 27
    const-string v5, "article"

    invoke-virtual {v2, v5}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_44
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5
    :try_end_48
    .catchall {:try_start_2 .. :try_end_48} :catchall_da

    const/4 v6, 0x0

    if-nez v5, :cond_53

    .line 33
    nop

    .line 34
    if-eqz p2, :cond_f2

    :try_start_4e
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->close()V
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_e2

    goto/16 :goto_f2

    .line 27
    :cond_53
    :try_start_53
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    .line 28
    const-string v7, "a[href]"

    invoke-virtual {v5, v7}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    if-nez v5, :cond_62

    :cond_61
    :goto_61
    goto :goto_44

    :cond_62
    const-string v7, "href"

    invoke-virtual {v5, v7}, Lcom/streambundlehtml/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_61

    invoke-interface {v4, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_75

    goto :goto_61

    .line 29
    :cond_75
    const-string v7, "title"

    invoke-virtual {v5, v7}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_85

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v7

    :cond_85
    move-object v9, v7

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_8d

    goto :goto_44

    .line 30
    :cond_8d
    const-string v7, "img"

    invoke-virtual {v5, v7}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    if-nez v5, :cond_96

    :goto_95
    goto :goto_9d

    :cond_96
    const-string v6, "src"

    invoke-virtual {v5, v6}, Lcom/streambundlehtml/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_95

    :goto_9d
    invoke-static {v0}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    .line 31
    iget-object v7, v1, Lcom/streambundleextra/HuyambaSupport$1;->val$site:Ljava/lang/Object;

    move-object v8, v7

    check-cast v8, Lcom/lagradost/cloudstream3/MainAPI;

    sget-object v11, Lcom/lagradost/cloudstream3/TvType;->Movie:Lcom/lagradost/cloudstream3/TvType;

    new-instance v13, Lcom/streambundleextra/HuyambaSupport$1$$ExternalSyntheticLambda0;

    invoke-direct {v13, v6, v5}, Lcom/streambundleextra/HuyambaSupport$1$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    const/16 v14, 0x8

    const/4 v15, 0x0

    const/4 v12, 0x0

    invoke-static/range {v8 .. v15}, Lcom/streambundle/v38/DetailMetadata;->searchCard(Lcom/lagradost/cloudstream3/MainAPI;Ljava/lang/String;Ljava/lang/String;Lcom/lagradost/cloudstream3/TvType;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lcom/lagradost/cloudstream3/MovieSearchResponse;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_44

    .line 24
    :cond_b9
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Huyamba: \u043d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 \u0430\u0434\u0440\u0435\u0441 \u0437\u0435\u0440\u043a\u0430\u043b\u0430"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 23
    :cond_c1
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Huyamba: HTTP "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->code()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_da
    .catchall {:try_start_53 .. :try_end_da} :catchall_da

    .line 34
    :catchall_da
    move-exception v0

    move-object v6, v0

    if-eqz p2, :cond_e1

    :try_start_de
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->close()V

    :cond_e1
    throw v6
    :try_end_e2
    .catchall {:try_start_de .. :try_end_e2} :catchall_e2

    :catchall_e2
    move-exception v0

    if-eqz v6, :cond_eb

    if-eq v6, v0, :cond_ec

    :try_start_e7
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_ec

    :cond_eb
    move-object v6, v0

    :cond_ec
    :goto_ec
    throw v6
    :try_end_ed
    .catch Ljava/lang/Exception; {:try_start_e7 .. :try_end_ed} :catch_ed

    :catch_ed
    move-exception v0

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v3

    .line 35
    :cond_f2
    :goto_f2
    iget-object v0, v1, Lcom/streambundleextra/HuyambaSupport$1;->val$end:Lkotlin/coroutines/Continuation;

    invoke-interface {v0, v3}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    .line 36
    return-void
.end method
