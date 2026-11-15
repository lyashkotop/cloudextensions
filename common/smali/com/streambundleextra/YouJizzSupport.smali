.class public final Lcom/streambundleextra/YouJizzSupport;
.super Ljava/lang/Object;
.source "YouJizzSupport.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static media(Lcom/streambundlehtml/nodes/Document;)Z
    .registers 11

    .line 8
    const-string v0, ""

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundleextra/YouJizzSupport;->site(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_e

    return v2

    :cond_e
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 9
    const-string v3, "script"

    invoke-virtual {p0, v3}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v3

    invoke-virtual {v3}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2a

    .line 19
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    .line 9
    :cond_2a
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/nodes/Element;

    .line 10
    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Element;->data()Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\b(?:var\\s+)?dataEncodings\\s*=\\s*"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    if-nez v6, :cond_45

    goto :goto_1d

    .line 12
    :cond_45
    :try_start_45
    new-instance v6, Lorg/json/JSONTokener;

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v6, v4}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Lorg/json/JSONArray;

    if-nez v5, :cond_5b

    goto :goto_1d

    :cond_5b
    check-cast v4, Lorg/json/JSONArray;

    .line 13
    const/4 v5, 0x0

    :goto_5e
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v5, v6, :cond_65

    .line 18
    goto :goto_1d

    .line 14
    :cond_65
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_6c

    :goto_6b
    goto :goto_c2

    :cond_6c
    const-string v7, "filename"

    invoke-virtual {v6, v7, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_79

    goto :goto_6b

    :cond_79
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v7}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 15
    invoke-static {v7}, Lcom/streambundleextra/MediaFix;->isDirect(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c2

    invoke-interface {v1, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8e

    goto :goto_c2

    :cond_8e
    const-string v8, "name"

    const-string v9, "quality"

    invoke-virtual {v6, v9, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 16
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v8

    const-string v9, "source"

    invoke-virtual {v8, v9}, Lcom/streambundlehtml/nodes/Element;->appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v8

    const-string v9, "src"

    invoke-virtual {v8, v9, v7}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v8

    const-string v9, "data-quality"

    invoke-virtual {v8, v9, v6}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v6

    const-string v8, "type"

    const-string v9, ".m3u8"

    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_bd

    const-string v7, "application/x-mpegURL"

    goto :goto_bf

    :cond_bd
    const-string v7, "video/mp4"

    :goto_bf
    invoke-virtual {v6, v8, v7}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    :try_end_c2
    .catch Lorg/json/JSONException; {:try_start_45 .. :try_end_c2} :catch_c5

    .line 13
    :cond_c2
    :goto_c2
    add-int/lit8 v5, v5, 0x1

    goto :goto_5e

    .line 18
    :catch_c5
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "YouJizz: \u043d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c \u0432\u0430\u0440\u0438\u0430\u043d\u0442\u044b \u0432\u0438\u0434\u0435\u043e"

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static results(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;
    .registers 2

    .line 6
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundleextra/YouJizzSupport;->site(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    return-object p0

    :cond_b
    const-string v0, "#content"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-nez v0, :cond_16

    const-string v0, ""

    goto :goto_1a

    :cond_16
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object v0

    :goto_1a
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    return-object p0
.end method

.method static site(Ljava/lang/String;)Z
    .registers 3

    .line 5
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    const-string v1, "youjizz.com"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    if-eqz p0, :cond_1b

    const-string v1, ".youjizz.com"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_19} :catch_1e

    if-nez p0, :cond_1c

    :cond_1b
    return v0

    :cond_1c
    const/4 p0, 0x1

    return p0

    :catch_1e
    move-exception p0

    return v0
.end method
