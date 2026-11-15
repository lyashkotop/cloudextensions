.class public Lcom/streambundlehtml/safety/Safelist;
.super Ljava/lang/Object;
.source "Safelist.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/safety/Safelist$TagName;,
        Lcom/streambundlehtml/safety/Safelist$AttributeKey;,
        Lcom/streambundlehtml/safety/Safelist$AttributeValue;,
        Lcom/streambundlehtml/safety/Safelist$Protocol;,
        Lcom/streambundlehtml/safety/Safelist$TypedValue;
    }
.end annotation


# static fields
.field private static final All:Ljava/lang/String; = ":all"


# instance fields
.field private final attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/streambundlehtml/safety/Safelist$TagName;",
            "Ljava/util/Set<",
            "Lcom/streambundlehtml/safety/Safelist$AttributeKey;",
            ">;>;"
        }
    .end annotation
.end field

.field private final enforcedAttributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/streambundlehtml/safety/Safelist$TagName;",
            "Ljava/util/Map<",
            "Lcom/streambundlehtml/safety/Safelist$AttributeKey;",
            "Lcom/streambundlehtml/safety/Safelist$AttributeValue;",
            ">;>;"
        }
    .end annotation
.end field

.field private preserveRelativeLinks:Z

.field private final protocols:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/streambundlehtml/safety/Safelist$TagName;",
            "Ljava/util/Map<",
            "Lcom/streambundlehtml/safety/Safelist$AttributeKey;",
            "Ljava/util/Set<",
            "Lcom/streambundlehtml/safety/Safelist$Protocol;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final tagNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/streambundlehtml/safety/Safelist$TagName;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    .line 211
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    .line 212
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    .line 213
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    .line 214
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/safety/Safelist;->preserveRelativeLinks:Z

    .line 215
    return-void
.end method

.method public constructor <init>(Lcom/streambundlehtml/safety/Safelist;)V
    .registers 10
    .param p1, "copy"    # Lcom/streambundlehtml/safety/Safelist;

    .line 222
    invoke-direct {p0}, Lcom/streambundlehtml/safety/Safelist;-><init>()V

    .line 223
    iget-object v0, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    iget-object v1, p1, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 224
    iget-object v0, p1, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_37

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 225
    .local v1, "copyTagAttributes":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;>;"
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/safety/Safelist$TagName;

    new-instance v4, Ljava/util/HashSet;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Collection;

    invoke-direct {v4, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .end local v1    # "copyTagAttributes":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;>;"
    goto :goto_14

    .line 227
    :cond_37
    iget-object v0, p1, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_64

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 228
    .local v1, "enforcedEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;>;"
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/safety/Safelist$TagName;

    new-instance v4, Ljava/util/HashMap;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .end local v1    # "enforcedEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;>;"
    goto :goto_41

    .line 230
    :cond_64
    iget-object v0, p1, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ba

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 231
    .local v1, "protocolsEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;>;"
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 232
    .local v2, "attributeProtocolsCopy":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_8d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_ae

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 233
    .local v4, "attributeProtocols":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    new-instance v6, Ljava/util/HashSet;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Collection;

    invoke-direct {v6, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    .end local v4    # "attributeProtocols":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    goto :goto_8d

    .line 235
    :cond_ae
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/safety/Safelist$TagName;

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .end local v1    # "protocolsEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;>;"
    .end local v2    # "attributeProtocolsCopy":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    goto :goto_6e

    .line 237
    :cond_ba
    iget-boolean v0, p1, Lcom/streambundlehtml/safety/Safelist;->preserveRelativeLinks:Z

    iput-boolean v0, p0, Lcom/streambundlehtml/safety/Safelist;->preserveRelativeLinks:Z

    .line 238
    return-void
.end method

.method public static basic()Lcom/streambundlehtml/safety/Safelist;
    .registers 25

    .line 127
    new-instance v0, Lcom/streambundlehtml/safety/Safelist;

    invoke-direct {v0}, Lcom/streambundlehtml/safety/Safelist;-><init>()V

    const-string v23, "u"

    const-string v24, "ul"

    const-string v1, "a"

    const-string v2, "b"

    const-string v3, "blockquote"

    const-string v4, "br"

    const-string v5, "cite"

    const-string v6, "code"

    const-string v7, "dd"

    const-string v8, "dl"

    const-string v9, "dt"

    const-string v10, "em"

    const-string v11, "i"

    const-string v12, "li"

    const-string v13, "ol"

    const-string v14, "p"

    const-string v15, "pre"

    const-string v16, "q"

    const-string v17, "small"

    const-string v18, "span"

    const-string v19, "strike"

    const-string v20, "strong"

    const-string v21, "sub"

    const-string v22, "sup"

    filled-new-array/range {v1 .. v24}, [Ljava/lang/String;

    move-result-object v1

    .line 128
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/safety/Safelist;->addTags([Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v1, "href"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v2

    .line 133
    const-string v3, "a"

    invoke-virtual {v0, v3, v2}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v2, "cite"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v4

    .line 134
    const-string v5, "blockquote"

    invoke-virtual {v0, v5, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v4

    .line 135
    const-string v6, "q"

    invoke-virtual {v0, v6, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v4, "mailto"

    const-string v6, "ftp"

    const-string v7, "http"

    const-string v8, "https"

    filled-new-array {v6, v7, v8, v4}, [Ljava/lang/String;

    move-result-object v4

    .line 137
    invoke-virtual {v0, v3, v1, v4}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v1

    .line 138
    invoke-virtual {v0, v5, v2, v1}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v1

    .line 139
    invoke-virtual {v0, v2, v2, v1}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    .line 141
    const-string v1, "rel"

    const-string v2, "nofollow"

    invoke-virtual {v0, v3, v1, v2}, Lcom/streambundlehtml/safety/Safelist;->addEnforcedAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    .line 127
    return-object v0
.end method

.method public static basicWithImages()Lcom/streambundlehtml/safety/Safelist;
    .registers 8

    .line 153
    invoke-static {}, Lcom/streambundlehtml/safety/Safelist;->basic()Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v1, "img"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v2

    .line 154
    invoke-virtual {v0, v2}, Lcom/streambundlehtml/safety/Safelist;->addTags([Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v6, "title"

    const-string v7, "width"

    const-string v2, "align"

    const-string v3, "alt"

    const-string v4, "height"

    const-string v5, "src"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v2

    .line 155
    invoke-virtual {v0, v1, v2}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v2, "http"

    const-string v3, "https"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    .line 156
    const-string v3, "src"

    invoke-virtual {v0, v1, v3, v2}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    .line 153
    return-object v0
.end method

.method private isValidAnchor(Ljava/lang/String;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .line 595
    const-string v0, "#"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, ".*\\s.*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public static none()Lcom/streambundlehtml/safety/Safelist;
    .registers 1

    .line 96
    new-instance v0, Lcom/streambundlehtml/safety/Safelist;

    invoke-direct {v0}, Lcom/streambundlehtml/safety/Safelist;-><init>()V

    return-object v0
.end method

.method public static relaxed()Lcom/streambundlehtml/safety/Safelist;
    .registers 43

    .line 171
    new-instance v0, Lcom/streambundlehtml/safety/Safelist;

    invoke-direct {v0}, Lcom/streambundlehtml/safety/Safelist;-><init>()V

    const-string v41, "u"

    const-string v42, "ul"

    const-string v1, "a"

    const-string v2, "b"

    const-string v3, "blockquote"

    const-string v4, "br"

    const-string v5, "caption"

    const-string v6, "cite"

    const-string v7, "code"

    const-string v8, "col"

    const-string v9, "colgroup"

    const-string v10, "dd"

    const-string v11, "div"

    const-string v12, "dl"

    const-string v13, "dt"

    const-string v14, "em"

    const-string v15, "h1"

    const-string v16, "h2"

    const-string v17, "h3"

    const-string v18, "h4"

    const-string v19, "h5"

    const-string v20, "h6"

    const-string v21, "i"

    const-string v22, "img"

    const-string v23, "li"

    const-string v24, "ol"

    const-string v25, "p"

    const-string v26, "pre"

    const-string v27, "q"

    const-string v28, "small"

    const-string v29, "span"

    const-string v30, "strike"

    const-string v31, "strong"

    const-string v32, "sub"

    const-string v33, "sup"

    const-string v34, "table"

    const-string v35, "tbody"

    const-string v36, "td"

    const-string v37, "tfoot"

    const-string v38, "th"

    const-string v39, "thead"

    const-string v40, "tr"

    filled-new-array/range {v1 .. v42}, [Ljava/lang/String;

    move-result-object v1

    .line 172
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/safety/Safelist;->addTags([Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v1, "title"

    const-string v2, "href"

    filled-new-array {v2, v1}, [Ljava/lang/String;

    move-result-object v1

    .line 179
    const-string v3, "a"

    invoke-virtual {v0, v3, v1}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v1, "cite"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v4

    .line 180
    const-string v5, "blockquote"

    invoke-virtual {v0, v5, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v4, "span"

    const-string v6, "width"

    filled-new-array {v4, v6}, [Ljava/lang/String;

    move-result-object v7

    .line 181
    const-string v8, "col"

    invoke-virtual {v0, v8, v7}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v4, v6}, [Ljava/lang/String;

    move-result-object v4

    .line 182
    const-string v7, "colgroup"

    invoke-virtual {v0, v7, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v11, "title"

    const-string v12, "width"

    const-string v7, "align"

    const-string v8, "alt"

    const-string v9, "height"

    const-string v10, "src"

    filled-new-array/range {v7 .. v12}, [Ljava/lang/String;

    move-result-object v4

    .line 183
    const-string v7, "img"

    invoke-virtual {v0, v7, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v4, "start"

    const-string v8, "type"

    filled-new-array {v4, v8}, [Ljava/lang/String;

    move-result-object v4

    .line 184
    const-string v9, "ol"

    invoke-virtual {v0, v9, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v4

    .line 185
    const-string v9, "q"

    invoke-virtual {v0, v9, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v4, "summary"

    filled-new-array {v4, v6}, [Ljava/lang/String;

    move-result-object v4

    .line 186
    const-string v10, "table"

    invoke-virtual {v0, v10, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v4, "colspan"

    const-string v10, "rowspan"

    const-string v11, "abbr"

    const-string v12, "axis"

    filled-new-array {v11, v12, v4, v10, v6}, [Ljava/lang/String;

    move-result-object v4

    .line 187
    const-string v6, "td"

    invoke-virtual {v0, v6, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v14, "scope"

    const-string v15, "width"

    const-string v10, "abbr"

    const-string v11, "axis"

    const-string v12, "colspan"

    const-string v13, "rowspan"

    filled-new-array/range {v10 .. v15}, [Ljava/lang/String;

    move-result-object v4

    .line 188
    const-string v6, "th"

    invoke-virtual {v0, v6, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v4

    .line 191
    const-string v6, "ul"

    invoke-virtual {v0, v6, v4}, Lcom/streambundlehtml/safety/Safelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    const-string v4, "mailto"

    const-string v6, "ftp"

    const-string v8, "http"

    const-string v10, "https"

    filled-new-array {v6, v8, v10, v4}, [Ljava/lang/String;

    move-result-object v4

    .line 193
    invoke-virtual {v0, v3, v2, v4}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v8, v10}, [Ljava/lang/String;

    move-result-object v2

    .line 194
    invoke-virtual {v0, v5, v1, v2}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v8, v10}, [Ljava/lang/String;

    move-result-object v2

    .line 195
    invoke-virtual {v0, v1, v1, v2}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v8, v10}, [Ljava/lang/String;

    move-result-object v2

    .line 196
    const-string v3, "src"

    invoke-virtual {v0, v7, v3, v2}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    filled-new-array {v8, v10}, [Ljava/lang/String;

    move-result-object v2

    .line 197
    invoke-virtual {v0, v9, v1, v2}, Lcom/streambundlehtml/safety/Safelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    .line 171
    return-object v0
.end method

.method public static simpleText()Lcom/streambundlehtml/safety/Safelist;
    .registers 6

    .line 106
    new-instance v0, Lcom/streambundlehtml/safety/Safelist;

    invoke-direct {v0}, Lcom/streambundlehtml/safety/Safelist;-><init>()V

    const-string v1, "strong"

    const-string v2, "u"

    const-string v3, "b"

    const-string v4, "em"

    const-string v5, "i"

    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/safety/Safelist;->addTags([Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    .line 106
    return-object v0
.end method

.method private testValidProtocol(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Attribute;Ljava/util/Set;)Z
    .registers 11
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "attr"    # Lcom/streambundlehtml/nodes/Attribute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundlehtml/nodes/Element;",
            "Lcom/streambundlehtml/nodes/Attribute;",
            "Ljava/util/Set<",
            "Lcom/streambundlehtml/safety/Safelist$Protocol;",
            ">;)Z"
        }
    .end annotation

    .line 568
    .local p3, "protocols":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;"
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 569
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_12

    .line 570
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 571
    :cond_12
    iget-boolean v1, p0, Lcom/streambundlehtml/safety/Safelist;->preserveRelativeLinks:Z

    if-nez v1, :cond_19

    .line 572
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/nodes/Attribute;->setValue(Ljava/lang/String;)Ljava/lang/String;

    .line 574
    :cond_19
    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1d
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/safety/Safelist$Protocol;

    .line 575
    .local v2, "protocol":Lcom/streambundlehtml/safety/Safelist$Protocol;
    invoke-virtual {v2}, Lcom/streambundlehtml/safety/Safelist$Protocol;->toString()Ljava/lang/String;

    move-result-object v3

    .line 577
    .local v3, "prot":Ljava/lang/String;
    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_3d

    .line 578
    invoke-direct {p0, v0}, Lcom/streambundlehtml/safety/Safelist;->isValidAnchor(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 579
    return v5

    .line 585
    :cond_3d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ":"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 587
    invoke-static {v0}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5b

    .line 588
    return v5

    .line 590
    .end local v2    # "protocol":Lcom/streambundlehtml/safety/Safelist$Protocol;
    .end local v3    # "prot":Ljava/lang/String;
    :cond_5b
    goto :goto_1d

    .line 591
    :cond_5c
    const/4 v1, 0x0

    return v1
.end method


# virtual methods
.method public varargs addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;
    .registers 9
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attributes"    # [Ljava/lang/String;

    .line 294
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 295
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 296
    array-length v0, p2

    const/4 v1, 0x0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    const-string v2, "No attribute names supplied."

    invoke-static {v0, v2}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 298
    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v0

    .line 299
    .local v0, "tagName":Lcom/streambundlehtml/safety/Safelist$TagName;
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 300
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 301
    .local v2, "attributeSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    array-length v3, p2

    :goto_21
    if-ge v1, v3, :cond_32

    aget-object v4, p2, v1

    .line 302
    .local v4, "key":Ljava/lang/String;
    invoke-static {v4}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 303
    invoke-static {v4}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 301
    .end local v4    # "key":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 305
    :cond_32
    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 306
    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 307
    .local v1, "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 308
    .end local v1    # "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    goto :goto_4b

    .line 309
    :cond_46
    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    :goto_4b
    return-object p0
.end method

.method public addEnforcedAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;
    .registers 9
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 374
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 375
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 376
    invoke-static {p3}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 378
    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v0

    .line 379
    .local v0, "tagName":Lcom/streambundlehtml/safety/Safelist$TagName;
    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 380
    invoke-static {p2}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    move-result-object v1

    .line 381
    .local v1, "attrKey":Lcom/streambundlehtml/safety/Safelist$AttributeKey;
    invoke-static {p3}, Lcom/streambundlehtml/safety/Safelist$AttributeValue;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeValue;

    move-result-object v2

    .line 383
    .local v2, "attrVal":Lcom/streambundlehtml/safety/Safelist$AttributeValue;
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 384
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3b

    .line 386
    :cond_2e
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 387
    .local v3, "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    iget-object v4, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    .end local v3    # "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    :goto_3b
    return-object p0
.end method

.method public varargs addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;
    .registers 12
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;
    .param p3, "protocols"    # [Ljava/lang/String;

    .line 453
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 454
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 455
    invoke-static {p3}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 457
    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v0

    .line 458
    .local v0, "tagName":Lcom/streambundlehtml/safety/Safelist$TagName;
    invoke-static {p2}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    move-result-object v1

    .line 462
    .local v1, "attrKey":Lcom/streambundlehtml/safety/Safelist$AttributeKey;
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 463
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .local v2, "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    goto :goto_2c

    .line 465
    .end local v2    # "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    :cond_22
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 466
    .restart local v2    # "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    :goto_2c
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_39

    .line 469
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .local v3, "protSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;"
    goto :goto_41

    .line 471
    .end local v3    # "protSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;"
    :cond_39
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 472
    .restart local v3    # "protSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;"
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    :goto_41
    array-length v4, p3

    const/4 v5, 0x0

    :goto_43
    if-ge v5, v4, :cond_54

    aget-object v6, p3, v5

    .line 475
    .local v6, "protocol":Ljava/lang/String;
    invoke-static {v6}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 476
    invoke-static {v6}, Lcom/streambundlehtml/safety/Safelist$Protocol;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$Protocol;

    move-result-object v7

    .line 477
    .local v7, "prot":Lcom/streambundlehtml/safety/Safelist$Protocol;
    invoke-interface {v3, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 474
    .end local v6    # "protocol":Ljava/lang/String;
    .end local v7    # "prot":Lcom/streambundlehtml/safety/Safelist$Protocol;
    add-int/lit8 v5, v5, 0x1

    goto :goto_43

    .line 479
    :cond_54
    return-object p0
.end method

.method public varargs addTags([Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;
    .registers 7
    .param p1, "tags"    # [Ljava/lang/String;

    .line 247
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 249
    array-length v0, p1

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_18

    aget-object v2, p1, v1

    .line 250
    .local v2, "tagName":Ljava/lang/String;
    invoke-static {v2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 251
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    invoke-static {v2}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 249
    .end local v2    # "tagName":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 253
    :cond_18
    return-object p0
.end method

.method getEnforcedAttributes(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;
    .registers 9
    .param p1, "tagName"    # Ljava/lang/String;

    .line 599
    new-instance v0, Lcom/streambundlehtml/nodes/Attributes;

    invoke-direct {v0}, Lcom/streambundlehtml/nodes/Attributes;-><init>()V

    .line 600
    .local v0, "attrs":Lcom/streambundlehtml/nodes/Attributes;
    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v1

    .line 601
    .local v1, "tag":Lcom/streambundlehtml/safety/Safelist$TagName;
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_45

    .line 602
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 603
    .local v2, "keyVals":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_21
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_45

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 604
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    invoke-virtual {v5}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/safety/Safelist$AttributeValue;

    invoke-virtual {v6}, Lcom/streambundlehtml/safety/Safelist$AttributeValue;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 605
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    goto :goto_21

    .line 607
    .end local v2    # "keyVals":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    :cond_45
    return-object v0
.end method

.method protected isSafeAttribute(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Attribute;)Z
    .registers 13
    .param p1, "tagName"    # Ljava/lang/String;
    .param p2, "el"    # Lcom/streambundlehtml/nodes/Element;
    .param p3, "attr"    # Lcom/streambundlehtml/nodes/Attribute;

    .line 539
    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v0

    .line 540
    .local v0, "tag":Lcom/streambundlehtml/safety/Safelist$TagName;
    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    move-result-object v1

    .line 542
    .local v1, "key":Lcom/streambundlehtml/safety/Safelist$AttributeKey;
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 543
    .local v2, "okSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_44

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_44

    .line 544
    iget-object v5, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 545
    iget-object v5, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 547
    .local v5, "attrProts":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    invoke-interface {v5, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_41

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    invoke-direct {p0, p2, p3, v6}, Lcom/streambundlehtml/safety/Safelist;->testValidProtocol(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Attribute;Ljava/util/Set;)Z

    move-result v6

    if-nez v6, :cond_41

    goto :goto_42

    :cond_41
    const/4 v3, 0x1

    :goto_42
    return v3

    .line 549
    .end local v5    # "attrProts":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    :cond_43
    return v4

    .line 553
    :cond_44
    iget-object v5, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 554
    .local v5, "enforcedSet":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    if-eqz v5, :cond_69

    .line 555
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/safety/Safelist;->getEnforcedAttributes(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v6

    .line 556
    .local v6, "expect":Lcom/streambundlehtml/nodes/Attributes;
    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v7

    .line 557
    .local v7, "attrKey":Ljava/lang/String;
    invoke-virtual {v6, v7}, Lcom/streambundlehtml/nodes/Attributes;->hasKeyIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_69

    .line 558
    invoke-virtual {v6, v7}, Lcom/streambundlehtml/nodes/Attributes;->getIgnoreCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    return v3

    .line 562
    .end local v6    # "expect":Lcom/streambundlehtml/nodes/Attributes;
    .end local v7    # "attrKey":Ljava/lang/String;
    :cond_69
    const-string v6, ":all"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_78

    invoke-virtual {p0, v6, p2, p3}, Lcom/streambundlehtml/safety/Safelist;->isSafeAttribute(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Attribute;)Z

    move-result v6

    if-eqz v6, :cond_78

    const/4 v3, 0x1

    :cond_78
    return v3
.end method

.method protected isSafeTag(Ljava/lang/String;)Z
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;

    .line 528
    iget-object v0, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public preserveRelativeLinks(Z)Lcom/streambundlehtml/safety/Safelist;
    .registers 2
    .param p1, "preserve"    # Z

    .line 432
    iput-boolean p1, p0, Lcom/streambundlehtml/safety/Safelist;->preserveRelativeLinks:Z

    .line 433
    return-object p0
.end method

.method public varargs removeAttributes(Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;
    .registers 9
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attributes"    # [Ljava/lang/String;

    .line 330
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 331
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 332
    array-length v0, p2

    const/4 v1, 0x0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    const-string v2, "No attribute names supplied."

    invoke-static {v0, v2}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 334
    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v0

    .line 335
    .local v0, "tagName":Lcom/streambundlehtml/safety/Safelist$TagName;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 336
    .local v2, "attributeSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    array-length v3, p2

    :goto_1c
    if-ge v1, v3, :cond_2d

    aget-object v4, p2, v1

    .line 337
    .local v4, "key":Ljava/lang/String;
    invoke-static {v4}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 338
    invoke-static {v4}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 336
    .end local v4    # "key":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .line 340
    :cond_2d
    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_53

    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_53

    .line 341
    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 342
    .local v1, "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    invoke-interface {v1, v2}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 344
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_53

    .line 345
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    .end local v1    # "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    :cond_53
    const-string v1, ":all"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_84

    .line 348
    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 349
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;>;>;"
    :goto_65
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_84

    .line 350
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 351
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    .line 352
    .local v4, "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    invoke-interface {v4, v2}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 353
    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_83

    .line 354
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 355
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;>;"
    .end local v4    # "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;"
    :cond_83
    goto :goto_65

    .line 357
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Lcom/streambundlehtml/safety/Safelist$TagName;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$AttributeKey;>;>;>;"
    :cond_84
    return-object p0
.end method

.method public removeEnforcedAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;
    .registers 7
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;

    .line 401
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 402
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 404
    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v0

    .line 405
    .local v0, "tagName":Lcom/streambundlehtml/safety/Safelist$TagName;
    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    iget-object v1, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 406
    invoke-static {p2}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    move-result-object v1

    .line 407
    .local v1, "attrKey":Lcom/streambundlehtml/safety/Safelist$AttributeKey;
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 408
    .local v2, "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 411
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    .end local v1    # "attrKey":Lcom/streambundlehtml/safety/Safelist$AttributeKey;
    .end local v2    # "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Lcom/streambundlehtml/safety/Safelist$AttributeValue;>;"
    :cond_34
    return-object p0
.end method

.method public varargs removeProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;
    .registers 12
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;
    .param p3, "removeProtocols"    # [Ljava/lang/String;

    .line 495
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 496
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 497
    invoke-static {p3}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 499
    invoke-static {p1}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v0

    .line 500
    .local v0, "tagName":Lcom/streambundlehtml/safety/Safelist$TagName;
    invoke-static {p2}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    move-result-object v1

    .line 504
    .local v1, "attr":Lcom/streambundlehtml/safety/Safelist$AttributeKey;
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "Cannot remove a protocol that is not set."

    invoke-static {v2, v3}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 505
    iget-object v2, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 506
    .local v2, "tagProtocols":Ljava/util/Map;, "Ljava/util/Map<Lcom/streambundlehtml/safety/Safelist$AttributeKey;Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;>;"
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    invoke-static {v4, v3}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 508
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 509
    .local v3, "attrProtocols":Ljava/util/Set;, "Ljava/util/Set<Lcom/streambundlehtml/safety/Safelist$Protocol;>;"
    array-length v4, p3

    const/4 v5, 0x0

    :goto_33
    if-ge v5, v4, :cond_44

    aget-object v6, p3, v5

    .line 510
    .local v6, "protocol":Ljava/lang/String;
    invoke-static {v6}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 511
    invoke-static {v6}, Lcom/streambundlehtml/safety/Safelist$Protocol;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$Protocol;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 509
    .end local v6    # "protocol":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_33

    .line 514
    :cond_44
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_58

    .line 515
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_58

    .line 517
    iget-object v4, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    :cond_58
    return-object p0
.end method

.method public varargs removeTags([Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist;
    .registers 7
    .param p1, "tags"    # [Ljava/lang/String;

    .line 263
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 265
    array-length v0, p1

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_2a

    aget-object v2, p1, v1

    .line 266
    .local v2, "tag":Ljava/lang/String;
    invoke-static {v2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 267
    invoke-static {v2}, Lcom/streambundlehtml/safety/Safelist$TagName;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$TagName;

    move-result-object v3

    .line 269
    .local v3, "tagName":Lcom/streambundlehtml/safety/Safelist$TagName;
    iget-object v4, p0, Lcom/streambundlehtml/safety/Safelist;->tagNames:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 270
    iget-object v4, p0, Lcom/streambundlehtml/safety/Safelist;->attributes:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    iget-object v4, p0, Lcom/streambundlehtml/safety/Safelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    iget-object v4, p0, Lcom/streambundlehtml/safety/Safelist;->protocols:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .end local v2    # "tag":Ljava/lang/String;
    .end local v3    # "tagName":Lcom/streambundlehtml/safety/Safelist$TagName;
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 275
    :cond_2a
    return-object p0
.end method
