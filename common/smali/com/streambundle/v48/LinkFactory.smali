.class public final Lcom/streambundle/v48/LinkFactory;
.super Ljava/lang/Object;
.source "LinkFactory.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/util/Map;)Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    .registers 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    move-object/from16 v1, p2

    move-object/from16 v2, p5

    const-string v0, "com.lagradost.cloudstream3.utils.ExtractorLink"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 15
    const/4 v5, 0x6

    const/4 v10, 0x1

    const/4 v11, 0x0

    :try_start_d
    const-string v0, "com.lagradost.cloudstream3.utils.ExtractorLinkType"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 16
    if-eqz p4, :cond_18

    const-string v12, "M3U8"

    goto :goto_1a

    :cond_18
    const-string v12, "VIDEO"

    :goto_1a
    invoke-static {v0, v12}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v12

    .line 17
    new-instance v13, Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;
    :try_end_20
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_d .. :try_end_20} :catch_9b
    .catch Ljava/lang/LinkageError; {:try_start_d .. :try_end_20} :catch_99

    move/from16 v14, p3

    :try_start_22
    invoke-direct {v13, v1, v14, v2}, Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;ILjava/util/Map;)V

    .line 18
    new-array v15, v10, [Ljava/lang/Object;

    new-instance v4, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v4, v10}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 19
    new-instance v6, Lcom/streambundle/v48/LinkFactory$1;

    invoke-direct {v6, v15, v4}, Lcom/streambundle/v48/LinkFactory$1;-><init>([Ljava/lang/Object;Ljava/util/concurrent/CountDownLatch;)V

    .line 20
    const-string v17, "com.lagradost.cloudstream3.utils.ExtractorApiKt"

    invoke-static/range {v17 .. v17}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 21
    const-string v8, "newExtractorLink"

    new-array v9, v5, [Ljava/lang/Class;

    const-class v20, Ljava/lang/String;

    aput-object v20, v9, v11

    const-class v20, Ljava/lang/String;

    aput-object v20, v9, v10

    const-class v20, Ljava/lang/String;

    const/16 v19, 0x2

    aput-object v20, v9, v19

    const/16 v17, 0x3

    aput-object v0, v9, v17

    const-class v0, Lkotlin/jvm/functions/Function2;

    const/16 v18, 0x4

    aput-object v0, v9, v18

    const-class v0, Lkotlin/coroutines/Continuation;

    const/16 v16, 0x5

    aput-object v0, v9, v16

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 22
    new-array v7, v5, [Ljava/lang/Object;

    aput-object p0, v7, v11

    aput-object p0, v7, v10

    const/4 v8, 0x2

    aput-object p1, v7, v8

    const/4 v8, 0x3

    aput-object v12, v7, v8

    const/4 v8, 0x4

    aput-object v13, v7, v8

    const/4 v8, 0x5

    aput-object v6, v7, v8

    const/4 v6, 0x0

    invoke-virtual {v0, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 20
    nop

    .line 23
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7e

    check-cast v0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    return-object v0

    .line 24
    :cond_7e
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v6, 0x3e8

    invoke-virtual {v4, v6, v7, v0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-eqz v0, :cond_9e

    aget-object v0, v15, v11

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9e

    aget-object v0, v15, v11

    check-cast v0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;
    :try_end_94
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_22 .. :try_end_94} :catch_97
    .catch Ljava/lang/LinkageError; {:try_start_22 .. :try_end_94} :catch_95

    return-object v0

    .line 25
    :catch_95
    move-exception v0

    goto :goto_9e

    :catch_97
    move-exception v0

    goto :goto_9e

    :catch_99
    move-exception v0

    goto :goto_9c

    :catch_9b
    move-exception v0

    :goto_9c
    move/from16 v14, p3

    .line 26
    :cond_9e
    :goto_9e
    const/16 v0, 0x8

    new-array v4, v0, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v11

    aput-object v6, v4, v10

    const/4 v7, 0x2

    aput-object v6, v4, v7

    const/4 v7, 0x3

    aput-object v6, v4, v7

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x4

    aput-object v7, v4, v8

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x5

    aput-object v7, v4, v8

    const-class v7, Ljava/util/Map;

    aput-object v7, v4, v5

    const/4 v7, 0x7

    aput-object v6, v4, v7

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 27
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static/range {p4 .. p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v11

    aput-object p0, v0, v10

    const/4 v8, 0x2

    aput-object p1, v0, v8

    const/4 v8, 0x3

    aput-object v1, v0, v8

    const/4 v1, 0x4

    aput-object v4, v0, v1

    const/4 v1, 0x5

    aput-object v6, v0, v1

    aput-object v2, v0, v5

    const/4 v1, 0x0

    aput-object v1, v0, v7

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    .line 26
    return-object v0
.end method

.method static synthetic lambda$0(Ljava/lang/String;ILjava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    .line 17
    const-string p4, "Referer"

    const-class v0, Ljava/lang/String;

    invoke-static {p3, p4, v0, p0}, Lcom/streambundle/v48/LinkFactory;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    sget-object p0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string p4, "Quality"

    invoke-static {p3, p4, p0, p1}, Lcom/streambundle/v48/LinkFactory;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    const-string p0, "Headers"

    const-class p1, Ljava/util/Map;

    invoke-static {p3, p0, p1, p2}, Lcom/streambundle/v48/LinkFactory;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 29
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "set"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p3, v0, v4

    invoke-virtual {p2, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_24} :catch_25

    return-void

    :catch_25
    move-exception p0

    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Cloudstream link field: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method
