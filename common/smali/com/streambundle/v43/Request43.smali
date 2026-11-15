.class public final Lcom/streambundle/v43/Request43;
.super Ljava/lang/Object;
.source "Request43.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundle/v43/Request43$Guard;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static checked(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5

    .line 14
    invoke-static {p0}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 15
    invoke-static {p0}, Lcom/streambundle/v43/Repair43;->validate(Ljava/lang/Object;)V

    .line 16
    invoke-static {p1}, Lcom/streambundle/v43/SiteAccess;->forUrl(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v0

    if-eqz v0, :cond_52

    .line 17
    const-string v0, "Url"

    invoke-static {p0, v0}, Lcom/streambundle/v43/Repair43;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->string(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 18
    invoke-static {p1}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 19
    const-string v1, "strip2.co"

    invoke-static {p1, v1}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_23

    :goto_22
    goto :goto_2e

    :cond_23
    const-string v1, "punishbang.com"

    invoke-static {p1, v1}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2c

    goto :goto_22

    :cond_2c
    const-string v1, "tubesafari.com"

    .line 20
    :goto_2e
    invoke-static {v0}, Lcom/streambundle/v43/Repair43;->host(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/streambundle/v43/Repair43;->site(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_39

    goto :goto_52

    .line 21
    :cond_39
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ": \u0441\u0430\u0439\u0442 \u043f\u0435\u0440\u0435\u043d\u0430\u043f\u0440\u0430\u0432\u0438\u043b \u0437\u0430\u043f\u0440\u043e\u0441 \u043d\u0430 \u043f\u043e\u0441\u0442\u043e\u0440\u043e\u043d\u043d\u044e\u044e \u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0443. \u0420\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u044b \u043f\u043e\u0438\u0441\u043a\u0430 \u043d\u0435 \u043f\u043e\u043b\u0443\u0447\u0435\u043d\u044b."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 23
    :cond_52
    :goto_52
    return-object p0
.end method

.method public static get(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 34

    .line 36
    move-object/from16 v13, p1

    invoke-static/range {p1 .. p1}, Lcom/streambundle/v43/SiteAccess;->forUrl(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v11

    .line 37
    if-nez v11, :cond_d

    invoke-static/range {p0 .. p16}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 38
    :cond_d
    new-instance v0, Lcom/streambundle/v43/Request43$Guard;

    move-object v14, v0

    move-object/from16 v1, p14

    invoke-direct {v0, v1, v13}, Lcom/streambundle/v43/Request43$Guard;-><init>(Lkotlin/coroutines/Continuation;Ljava/lang/String;)V

    .line 39
    move/from16 v0, p15

    and-int/lit16 v15, v0, -0x201

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    move-wide/from16 v9, p9

    move/from16 v12, p12

    move-object/from16 v13, p13

    move-object/from16 v16, p16

    invoke-static/range {v0 .. v16}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 40
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_3e

    goto :goto_44

    :cond_3e
    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcom/streambundle/v43/Request43;->checked(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    :goto_44
    return-object v0
.end method

.method public static post(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/lang/Object;Lokhttp3/RequestBody;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 42

    .line 43
    move-object/from16 v15, p1

    invoke-static/range {p1 .. p1}, Lcom/streambundle/v43/SiteAccess;->forUrl(Ljava/lang/String;)Lokhttp3/Interceptor;

    move-result-object v16

    .line 44
    if-nez v16, :cond_d

    invoke-static/range {p0 .. p20}, Lcom/lagradost/nicehttp/Requests;->post$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/lang/Object;Lokhttp3/RequestBody;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 45
    :cond_d
    new-instance v0, Lcom/streambundle/v43/Request43$Guard;

    move-object/from16 v18, v0

    move-object/from16 v1, p18

    invoke-direct {v0, v1, v15}, Lcom/streambundle/v43/Request43$Guard;-><init>(Lkotlin/coroutines/Continuation;Ljava/lang/String;)V

    .line 46
    move/from16 v0, p19

    and-int/lit16 v0, v0, -0x2001

    move/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move-object/from16 v12, p12

    move-wide/from16 v13, p13

    move-object/from16 v15, v16

    move/from16 v16, p16

    move-object/from16 v17, p17

    move-object/from16 v20, p20

    invoke-static/range {v0 .. v20}, Lcom/lagradost/nicehttp/Requests;->post$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/lang/Object;Lokhttp3/RequestBody;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 47
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_4b

    goto :goto_51

    :cond_4b
    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcom/streambundle/v43/Request43;->checked(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    :goto_51
    return-object v0
.end method
