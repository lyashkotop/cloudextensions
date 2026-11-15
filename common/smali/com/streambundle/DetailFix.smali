.class public final Lcom/streambundle/DetailFix;
.super Ljava/lang/Object;
.source "DetailFix.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    array-length v0, p2

    new-array v1, v0, [Ljava/lang/Class;

    .line 11
    const/4 v2, 0x0

    :goto_4
    if-lt v2, v0, :cond_13

    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 13
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 11
    :cond_13
    const-class v3, Ljava/lang/String;

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method

.method public static mediaUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 18
    :try_start_0
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 20
    if-eqz v1, :cond_5e

    const-string v2, "pervertium.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    const-string v2, ".pervertium.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5e

    .line 21
    :cond_1a
    const-string v1, "^/videos/(\\d+)(?:/|$)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_5e

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/embed/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5c} :catch_5d

    return-object p0

    .line 24
    :catch_5d
    move-exception v0

    .line 25
    :cond_5e
    return-object p0
.end method

.method public static poster(Ljava/lang/Object;)V
    .registers 14

    .line 30
    :try_start_0
    const-string v0, "baseUri"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {p0, v0, v2}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 31
    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 32
    if-eqz v2, :cond_102

    const-string v3, "punishworld.com"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_27

    const-string v3, ".punishworld.com"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_27

    goto/16 :goto_102

    .line 33
    :cond_27
    const-string v2, "com.streambundleextra.MediaFix"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 34
    const-string v3, "cachedPoster"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v1

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    aput-object v0, v3, v1

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_45} :catch_103

    .line 35
    const-string v3, "content"

    const-string v5, "selectFirst"

    const-string v6, "attr"

    const/4 v7, 0x2

    if-eqz v2, :cond_54

    :try_start_4e
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_87

    .line 36
    :cond_54
    new-array v8, v4, [Ljava/lang/String;

    const-string v9, "video[poster], meta[property=og:image], meta[name=twitter:image], link[itemprop=thumbnailUrl]"

    aput-object v9, v8, v1

    invoke-static {p0, v5, v8}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 37
    if-eqz v8, :cond_87

    .line 38
    const/4 v9, 0x3

    new-array v10, v9, [Ljava/lang/String;

    const-string v11, "poster"

    aput-object v11, v10, v1

    aput-object v3, v10, v4

    const-string v11, "href"

    aput-object v11, v10, v7

    move v11, v1

    :goto_6e
    if-lt v11, v9, :cond_71

    goto :goto_87

    :cond_71
    aget-object v2, v10, v11

    .line 39
    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v6, v2}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 40
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_84

    goto :goto_87

    .line 38
    :cond_84
    add-int/lit8 v11, v11, 0x1

    goto :goto_6e

    .line 44
    :cond_87
    :goto_87
    if-eqz v2, :cond_8f

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_b5

    .line 45
    :cond_8f
    const-string v8, "(?:preview_url|image|poster)\\s*:\\s*[\'\"]([^\'\"]+)[\'\"]"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    const-string v9, "html"

    new-array v10, v1, [Ljava/lang/String;

    invoke-static {p0, v9, v10}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    .line 46
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    move-result v9

    if-eqz v9, :cond_b5

    invoke-virtual {v8, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v8, "\\/"

    const-string v9, "/"

    invoke-virtual {v2, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 48
    :cond_b5
    if-eqz v2, :cond_101

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_be

    goto :goto_101

    .line 49
    :cond_be
    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    new-array v2, v4, [Ljava/lang/String;

    const-string v8, "meta[property=og:image]"

    aput-object v8, v2, v1

    invoke-static {p0, v5, v2}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 51
    if-nez v2, :cond_f7

    .line 52
    const-string v2, "head"

    new-array v5, v1, [Ljava/lang/String;

    invoke-static {p0, v2, v5}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v2, "appendElement"

    new-array v5, v4, [Ljava/lang/String;

    const-string v8, "meta"

    aput-object v8, v5, v1

    invoke-static {p0, v2, v5}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 53
    new-array p0, v7, [Ljava/lang/String;

    const-string v5, "property"

    aput-object v5, p0, v1

    const-string v5, "og:image"

    aput-object v5, p0, v4

    invoke-static {v2, v6, p0}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    .line 55
    :cond_f7
    new-array p0, v7, [Ljava/lang/String;

    aput-object v3, p0, v1

    aput-object v0, p0, v4

    invoke-static {v2, v6, p0}, Lcom/streambundle/DetailFix;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;
    :try_end_100
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_100} :catch_103

    goto :goto_104

    .line 48
    :cond_101
    :goto_101
    return-void

    .line 32
    :cond_102
    :goto_102
    return-void

    .line 56
    :catch_103
    move-exception p0

    :goto_104
    nop

    .line 57
    return-void
.end method
