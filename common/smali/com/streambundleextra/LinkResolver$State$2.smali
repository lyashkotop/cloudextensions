.class Lcom/streambundleextra/LinkResolver$State$2;
.super Ljava/lang/Object;
.source "LinkResolver.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundleextra/LinkResolver$State;->process(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/streambundleextra/LinkResolver$State;

.field final synthetic val$ref:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/streambundleextra/LinkResolver$State;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    iput-object p1, p0, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    iput-object p2, p0, Lcom/streambundleextra/LinkResolver$State$2;->val$ref:Ljava/lang/String;

    iput-object p3, p0, Lcom/streambundleextra/LinkResolver$State$2;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .registers 3

    .line 33
    iget-object p1, p0, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lcom/streambundleextra/LinkResolver$State;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .registers 22

    .line 35
    move-object/from16 v1, p0

    const-string v0, "Cookie"

    .line 36
    :try_start_4
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v3

    if-eqz v3, :cond_f4

    if-eqz v2, :cond_f4

    .line 37
    const/16 v3, 0x200

    new-array v4, v3, [B

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_1a
    if-ge v6, v3, :cond_26

    rsub-int v7, v6, 0x200

    invoke-virtual {v2, v4, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v7

    if-lez v7, :cond_26

    add-int/2addr v6, v7

    goto :goto_1a

    :cond_26
    if-lez v6, :cond_34

    new-instance v2, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v2, v4, v5, v6, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    goto :goto_36

    :cond_34
    const-string v2, ""

    .line 38
    :goto_36
    const/16 v3, 0x8

    const/4 v7, 0x4

    const/4 v8, 0x1

    if-lt v6, v3, :cond_59

    aget-byte v3, v4, v7

    const/16 v9, 0x66

    if-ne v3, v9, :cond_59

    const/4 v3, 0x5

    aget-byte v3, v4, v3

    const/16 v9, 0x74

    if-ne v3, v9, :cond_59

    const/4 v3, 0x6

    aget-byte v3, v4, v3

    const/16 v9, 0x79

    if-ne v3, v9, :cond_59

    const/4 v3, 0x7

    aget-byte v3, v4, v3

    const/16 v9, 0x70

    if-ne v3, v9, :cond_59

    const/4 v3, 0x1

    goto :goto_5a

    :cond_59
    const/4 v3, 0x0

    :goto_5a
    if-lt v6, v7, :cond_80

    aget-byte v7, v4, v5

    and-int/lit16 v7, v7, 0xff

    const/16 v9, 0x1a

    if-ne v7, v9, :cond_80

    aget-byte v7, v4, v8

    and-int/lit16 v7, v7, 0xff

    const/16 v9, 0x45

    if-ne v7, v9, :cond_80

    const/4 v7, 0x2

    aget-byte v7, v4, v7

    and-int/lit16 v7, v7, 0xff

    const/16 v9, 0xdf

    if-ne v7, v9, :cond_80

    const/4 v7, 0x3

    aget-byte v7, v4, v7

    and-int/lit16 v7, v7, 0xff

    const/16 v9, 0xa3

    if-ne v7, v9, :cond_80

    const/4 v7, 0x1

    goto :goto_81

    :cond_80
    const/4 v7, 0x0

    .line 39
    :goto_81
    const-string v9, "#EXTM3U"

    invoke-virtual {v2, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v16

    const/16 v2, 0xbc

    if-le v6, v2, :cond_96

    aget-byte v6, v4, v5

    const/16 v9, 0x47

    if-ne v6, v9, :cond_96

    aget-byte v2, v4, v2

    if-ne v2, v9, :cond_96

    const/4 v5, 0x1

    .line 40
    :cond_96
    if-nez v3, :cond_9f

    if-nez v7, :cond_9f

    if-nez v16, :cond_9f

    if-nez v5, :cond_9f

    goto :goto_f4

    :cond_9f
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v13

    iget-object v2, v1, Lcom/streambundleextra/LinkResolver$State$2;->val$ref:Ljava/lang/String;

    invoke-static {v2}, Lcom/streambundleextra/MediaFix;->headers(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v3

    invoke-virtual {v3, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_be

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    :cond_be
    iget-object v0, v1, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    iget-object v0, v0, Lcom/streambundleextra/LinkResolver$State;->callback:Lkotlin/jvm/functions/Function1;

    move-object v10, v0

    iget-object v3, v1, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    iget-object v3, v3, Lcom/streambundleextra/LinkResolver$State;->site:Lcom/streambundleextra/VideoBundleSite;

    invoke-virtual {v3}, Lcom/streambundleextra/VideoBundleSite;->getName()Ljava/lang/String;

    move-result-object v11

    iget-object v3, v1, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    iget-object v3, v3, Lcom/streambundleextra/LinkResolver$State;->site:Lcom/streambundleextra/VideoBundleSite;

    invoke-virtual {v3}, Lcom/streambundleextra/VideoBundleSite;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Lcom/streambundleextra/LinkResolver$State$2;->val$url:Ljava/lang/String;

    iget-object v5, v1, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    iget-object v5, v5, Lcom/streambundleextra/LinkResolver$State;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-static {v3, v4, v5}, Lcom/streambundleextra/MediaFix;->qualityName(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)Ljava/lang/String;

    move-result-object v12

    iget-object v14, v1, Lcom/streambundleextra/LinkResolver$State$2;->val$ref:Ljava/lang/String;

    iget-object v3, v1, Lcom/streambundleextra/LinkResolver$State$2;->val$url:Ljava/lang/String;

    iget-object v4, v1, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    iget-object v4, v4, Lcom/streambundleextra/LinkResolver$State;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-static {v3, v4}, Lcom/streambundleextra/MediaFix;->quality(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document;)I

    move-result v15

    const/16 v18, 0x0

    move-object/from16 v17, v2

    invoke-static/range {v10 .. v17}, Lcom/streambundle/v38/MediaLink;->emit(Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/util/Map;)V

    iget-object v0, v1, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    iput-boolean v8, v0, Lcom/streambundleextra/LinkResolver$State;->found:Z
    :try_end_f4
    .catchall {:try_start_4 .. :try_end_f4} :catchall_fa

    .line 43
    :cond_f4
    :goto_f4
    if-eqz p2, :cond_111

    :try_start_f6
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->close()V
    :try_end_f9
    .catch Ljava/lang/Exception; {:try_start_f6 .. :try_end_f9} :catch_110
    .catchall {:try_start_f6 .. :try_end_f9} :catchall_107

    goto :goto_111

    .line 35
    :catchall_fa
    move-exception v0

    move-object v2, v0

    if-eqz p2, :cond_106

    :try_start_fe
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Response;->close()V
    :try_end_101
    .catchall {:try_start_fe .. :try_end_101} :catchall_102

    goto :goto_106

    :catchall_102
    move-exception v0

    :try_start_103
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_106
    :goto_106
    throw v2
    :try_end_107
    .catch Ljava/lang/Exception; {:try_start_103 .. :try_end_107} :catch_110
    .catchall {:try_start_103 .. :try_end_107} :catchall_107

    .line 43
    :catchall_107
    move-exception v0

    iget-object v2, v1, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v2, v3}, Lcom/streambundleextra/LinkResolver$State;->resumeWith(Ljava/lang/Object;)V

    throw v0

    :catch_110
    move-exception v0

    :cond_111
    :goto_111
    iget-object v0, v1, Lcom/streambundleextra/LinkResolver$State$2;->this$0:Lcom/streambundleextra/LinkResolver$State;

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v2}, Lcom/streambundleextra/LinkResolver$State;->resumeWith(Ljava/lang/Object;)V

    .line 44
    return-void
.end method
