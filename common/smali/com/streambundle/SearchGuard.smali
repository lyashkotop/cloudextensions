.class public final Lcom/streambundle/SearchGuard;
.super Ljava/lang/Object;
.source "SearchGuard.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    array-length v0, p2

    new-array v0, v0, [Ljava/lang/Class;

    .line 11
    const/4 v1, 0x0

    :goto_4
    array-length v2, p2

    if-lt v1, v2, :cond_14

    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 13
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 11
    :cond_14
    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public static clean(Ljava/lang/Object;)V
    .registers 9

    invoke-static {p0}, Lcom/streambundle/MetadataDisplay;->sanitizeSearch(Ljava/lang/Object;)V

    .line 18
    const-string v0, "nextElementSibling"

    const-string v1, "remove"

    const-string v2, "select"

    :try_start_6
    const-string v3, "baseUri"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {p0, v3, v5}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 19
    const-string v5, "(?i)(/search|[?&](s|q|k|query|search)=)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-nez v3, :cond_22

    return-void

    .line 20
    :cond_22
    nop

    .line 21
    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/Object;

    const-string v6, ":matchesOwn((?iu)(nothing found|no (?:matching )?(?:results|videos)(?: were)? found|no results|did not match any|nothing matched|\u043d\u0438\u0447\u0435\u0433\u043e \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u043e|\u043d\u0438\u0447\u0435\u0433\u043e \u043d\u0435 \u043d\u0430\u0448\u043b\u043e\u0441\u044c|\u043f\u043e \u0432\u0430\u0448\u0435\u043c\u0443 \u0437\u0430\u043f\u0440\u043e\u0441\u0443 \u043d\u0438\u0447\u0435\u0433\u043e|\u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u043e\u0432 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u043e|\u0432\u0438\u0434\u0435\u043e \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u043e))"

    aput-object v6, v5, v4

    invoke-static {p0, v2, v5}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 22
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3e

    .line 23
    const-string v0, "empty"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p0, v0, v1}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    return-void

    .line 26
    :cond_3e
    new-array v5, v3, [Ljava/lang/Object;

    const-string v6, ".trending, #trending, [id*=trending], [class*=trending], .recommended-videos, #recommended-videos, .related-videos"

    aput-object v6, v5, v4

    invoke-static {p0, v2, v5}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v5, v1, v6}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    nop

    .line 28
    new-instance v5, Ljava/util/ArrayList;

    new-array v6, v3, [Ljava/lang/Object;

    const-string v7, "h1:matchesOwn((?iu)^(?:\u0432 \u0442\u0440\u0435\u043d\u0434\u0435|trending(?: videos)?|recommended(?: videos)?)$), h2:matchesOwn((?iu)^(?:\u0432 \u0442\u0440\u0435\u043d\u0434\u0435|trending(?: videos)?|recommended(?: videos)?)$), h3:matchesOwn((?iu)^(?:\u0432 \u0442\u0440\u0435\u043d\u0434\u0435|trending(?: videos)?|recommended(?: videos)?)$)"

    aput-object v7, v6, v4

    invoke-static {p0, v2, v6}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-direct {v5, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_63
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_6a

    .line 42
    goto :goto_ba

    .line 28
    :cond_6a
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 29
    nop

    .line 30
    const-string v5, "parent"

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v2, v5, v6}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 31
    if-eqz v5, :cond_8a

    const-string v6, "children"

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v5, v6, v7}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v3, :cond_8a

    move-object v2, v5

    .line 32
    :cond_8a
    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {v2, v0, v5}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 33
    nop

    :goto_91
    if-nez v5, :cond_94

    goto :goto_a6

    .line 34
    :cond_94
    const-string v6, "tagName"

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v5, v6, v7}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 35
    const-string v7, "h[1-6]"

    invoke-virtual {v6, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_ac

    .line 40
    :goto_a6
    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {v2, v1, v5}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_63

    .line 36
    :cond_ac
    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v5, v0, v6}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 37
    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v5, v1, v7}, Lcom/streambundle/SearchGuard;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b7
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_b7} :catch_b9

    .line 38
    move-object v5, v6

    goto :goto_91

    .line 42
    :catch_b9
    move-exception p0

    .line 45
    :goto_ba
    return-void
.end method
