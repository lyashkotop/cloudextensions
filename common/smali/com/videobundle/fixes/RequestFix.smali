.class public final Lcom/videobundle/fixes/RequestFix;
.super Ljava/lang/Object;


# direct methods
.method public static get(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 38

    invoke-static/range {p1 .. p1}, Lcom/videobundle/fixes/SiteFix;->postSearch(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    invoke-static/range {p0 .. p16}, Lcom/lagradost/nicehttp/Requests;->get$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_b
    invoke-static/range {p1 .. p1}, Lcom/videobundle/fixes/SiteFix;->postUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {p1 .. p1}, Lcom/videobundle/fixes/SiteFix;->form(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v10, p6

    move/from16 v11, p7

    move-object/from16 v12, p8

    move-wide/from16 v13, p9

    move-object/from16 v15, p11

    move/from16 v16, p12

    move-object/from16 v17, p13

    move-object/from16 v18, p14

    move/from16 v8, p15

    and-int/lit16 v7, v8, 0xfe0

    shl-int/lit8 v7, v7, 0x4

    and-int/lit8 v8, v8, 0x1f

    or-int/2addr v8, v7

    or-int/lit16 v8, v8, 0x1c0

    move/from16 v19, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v20, 0x0

    invoke-static/range {v0 .. v20}, Lcom/lagradost/nicehttp/Requests;->post$default(Lcom/lagradost/nicehttp/Requests;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/lang/Object;Lokhttp3/RequestBody;ZILjava/util/concurrent/TimeUnit;JLokhttp3/Interceptor;ZLcom/lagradost/nicehttp/ResponseParser;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
