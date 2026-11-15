.class abstract Lcom/streambundlehtml/helper/HttpConnection$Base;
.super Ljava/lang/Object;
.source "HttpConnection.java"

# interfaces
.implements Lcom/streambundlehtml/Connection$Base;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/helper/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "Base"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/streambundlehtml/Connection$Base<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Lcom/streambundlehtml/Connection$Base<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final UnsetUrl:Ljava/net/URL;


# instance fields
.field cookies:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field method:Lcom/streambundlehtml/Connection$Method;

.field url:Ljava/net/URL;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 401
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://undefined/"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/streambundlehtml/helper/HttpConnection$Base;->UnsetUrl:Ljava/net/URL;
    :try_end_9
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_9} :catch_b

    .line 404
    nop

    .line 405
    return-void

    .line 402
    :catch_b
    move-exception v0

    .line 403
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private constructor <init>()V
    .registers 2

    .line 412
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 407
    sget-object v0, Lcom/streambundlehtml/helper/HttpConnection$Base;->UnsetUrl:Ljava/net/URL;

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->url:Ljava/net/URL;

    .line 408
    sget-object v0, Lcom/streambundlehtml/Connection$Method;->GET:Lcom/streambundlehtml/Connection$Method;

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->method:Lcom/streambundlehtml/Connection$Method;

    .line 413
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    .line 414
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    .line 415
    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundlehtml/helper/HttpConnection$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/streambundlehtml/helper/HttpConnection$1;

    .line 397
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    invoke-direct {p0}, Lcom/streambundlehtml/helper/HttpConnection$Base;-><init>()V

    return-void
.end method

.method private constructor <init>(Lcom/streambundlehtml/helper/HttpConnection$Base;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundlehtml/helper/HttpConnection$Base<",
            "TT;>;)V"
        }
    .end annotation

    .line 417
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    .local p1, "copy":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 407
    sget-object v0, Lcom/streambundlehtml/helper/HttpConnection$Base;->UnsetUrl:Ljava/net/URL;

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->url:Ljava/net/URL;

    .line 408
    sget-object v0, Lcom/streambundlehtml/Connection$Method;->GET:Lcom/streambundlehtml/Connection$Method;

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->method:Lcom/streambundlehtml/Connection$Method;

    .line 418
    iget-object v0, p1, Lcom/streambundlehtml/helper/HttpConnection$Base;->url:Ljava/net/URL;

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->url:Ljava/net/URL;

    .line 419
    iget-object v0, p1, Lcom/streambundlehtml/helper/HttpConnection$Base;->method:Lcom/streambundlehtml/Connection$Method;

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->method:Lcom/streambundlehtml/Connection$Method;

    .line 420
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    .line 421
    iget-object v0, p1, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_24
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_47

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 422
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v2, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Collection;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    goto :goto_24

    .line 424
    :cond_47
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    iget-object v1, p1, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 425
    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundlehtml/helper/HttpConnection$Base;Lcom/streambundlehtml/helper/HttpConnection$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/streambundlehtml/helper/HttpConnection$Base;
    .param p2, "x1"    # Lcom/streambundlehtml/helper/HttpConnection$1;

    .line 397
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    invoke-direct {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;-><init>(Lcom/streambundlehtml/helper/HttpConnection$Base;)V

    return-void
.end method

.method private static fixHeaderEncoding(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "val"    # Ljava/lang/String;

    .line 483
    # getter for: Lcom/streambundlehtml/helper/HttpConnection;->ISO_8859_1:Ljava/nio/charset/Charset;
    invoke-static {}, Lcom/streambundlehtml/helper/HttpConnection;->access$200()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 484
    .local v0, "bytes":[B
    invoke-static {v0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->looksLikeUtf8([B)Z

    move-result v1

    if-nez v1, :cond_f

    .line 485
    return-object p0

    .line 486
    :cond_f
    new-instance v1, Ljava/lang/String;

    # getter for: Lcom/streambundlehtml/helper/HttpConnection;->UTF_8:Ljava/nio/charset/Charset;
    invoke-static {}, Lcom/streambundlehtml/helper/HttpConnection;->access$300()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v1
.end method

.method private getHeadersCaseInsensitive(Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 582
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 584
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 585
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 586
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    .line 587
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_2c
    goto :goto_d

    .line 589
    :cond_2d
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private static looksLikeUtf8([B)Z
    .registers 9
    .param p0, "input"    # [B

    .line 490
    const/4 v0, 0x0

    .line 492
    .local v0, "i":I
    array-length v1, p0

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lt v1, v2, :cond_21

    aget-byte v1, p0, v3

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0xef

    if-ne v1, v2, :cond_21

    aget-byte v1, p0, v4

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0xbb

    if-ne v1, v2, :cond_21

    const/4 v1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0xbf

    if-ne v1, v2, :cond_21

    .line 496
    const/4 v0, 0x3

    .line 500
    :cond_21
    array-length v1, p0

    .local v1, "j":I
    :goto_22
    if-ge v0, v1, :cond_59

    .line 501
    aget-byte v2, p0, v0

    .line 502
    .local v2, "o":I
    and-int/lit16 v5, v2, 0x80

    if-nez v5, :cond_2b

    .line 503
    goto :goto_56

    .line 507
    :cond_2b
    and-int/lit16 v5, v2, 0xe0

    const/16 v6, 0xc0

    if-ne v5, v6, :cond_34

    .line 508
    add-int/lit8 v5, v0, 0x1

    .local v5, "end":I
    goto :goto_45

    .line 509
    .end local v5    # "end":I
    :cond_34
    and-int/lit16 v5, v2, 0xf0

    const/16 v6, 0xe0

    if-ne v5, v6, :cond_3d

    .line 510
    add-int/lit8 v5, v0, 0x2

    .restart local v5    # "end":I
    goto :goto_45

    .line 511
    .end local v5    # "end":I
    :cond_3d
    and-int/lit16 v5, v2, 0xf8

    const/16 v6, 0xf0

    if-ne v5, v6, :cond_58

    .line 512
    add-int/lit8 v5, v0, 0x3

    .line 517
    .restart local v5    # "end":I
    :goto_45
    array-length v6, p0

    if-lt v5, v6, :cond_49

    .line 518
    return v3

    .line 520
    :cond_49
    if-ge v0, v5, :cond_56

    .line 521
    add-int/lit8 v0, v0, 0x1

    .line 522
    aget-byte v2, p0, v0

    .line 523
    and-int/lit16 v6, v2, 0xc0

    const/16 v7, 0x80

    if-eq v6, v7, :cond_49

    .line 524
    return v3

    .line 500
    .end local v2    # "o":I
    .end local v5    # "end":I
    :cond_56
    :goto_56
    add-int/2addr v0, v4

    goto :goto_22

    .line 514
    .restart local v2    # "o":I
    :cond_58
    return v3

    .line 528
    .end local v1    # "j":I
    .end local v2    # "o":I
    :cond_59
    return v4
.end method

.method private scanHeaders(Ljava/lang/String;)Ljava/util/Map$Entry;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 593
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    invoke-static {p1}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 594
    .local v0, "lc":Ljava/lang/String;
    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 595
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 596
    return-object v2

    .line 597
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_2b
    goto :goto_e

    .line 598
    :cond_2c
    const/4 v1, 0x0

    return-object v1
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 462
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    if-nez p2, :cond_a

    const-string v0, ""

    goto :goto_b

    :cond_a
    move-object v0, p2

    .line 466
    .end local p2    # "value":Ljava/lang/String;
    .local v0, "value":Ljava/lang/String;
    :goto_b
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers(Ljava/lang/String;)Ljava/util/List;

    move-result-object p2

    .line 467
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 468
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object p2, v1

    .line 469
    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    :cond_20
    invoke-static {v0}, Lcom/streambundlehtml/helper/HttpConnection$Base;->fixHeaderEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 473
    return-object p0
.end method

.method public cookie(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 607
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 608
    const-string v0, "value"

    invoke-static {p2, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 609
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 610
    return-object p0
.end method

.method public cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .line 602
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 603
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public cookies()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 625
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    return-object v0
.end method

.method public hasCookie(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .line 614
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 615
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasHeader(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .line 539
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 540
    invoke-direct {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->getHeadersCaseInsensitive(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 547
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 548
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 549
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 550
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 551
    .local v2, "candidate":Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 552
    const/4 v1, 0x1

    return v1

    .line 553
    .end local v2    # "candidate":Ljava/lang/String;
    :cond_22
    goto :goto_e

    .line 554
    :cond_23
    const/4 v1, 0x0

    return v1
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 532
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->removeHeader(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 534
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/helper/HttpConnection$Base;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;

    .line 535
    return-object p0
.end method

.method public header(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .line 450
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 451
    invoke-direct {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->getHeadersCaseInsensitive(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 452
    .local v0, "vals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_16

    .line 454
    const-string v1, ", "

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 457
    :cond_16
    const/4 v1, 0x0

    return-object v1
.end method

.method public headers(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 478
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 479
    invoke-direct {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->getHeadersCaseInsensitive(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public headers()Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 566
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 567
    .local v0, "map":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 568
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 569
    .local v3, "header":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 570
    .local v4, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_3d

    .line 571
    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v3, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 572
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v3    # "header":Ljava/lang/String;
    .end local v4    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3d
    goto :goto_15

    .line 573
    :cond_3e
    return-object v0
.end method

.method public method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection$Base;
    .registers 3
    .param p1, "method"    # Lcom/streambundlehtml/Connection$Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundlehtml/Connection$Method;",
            ")TT;"
        }
    .end annotation

    .line 444
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "method"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 445
    iput-object p1, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->method:Lcom/streambundlehtml/Connection$Method;

    .line 446
    return-object p0
.end method

.method public method()Lcom/streambundlehtml/Connection$Method;
    .registers 2

    .line 440
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->method:Lcom/streambundlehtml/Connection$Method;

    return-object v0
.end method

.method public multiHeaders()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 578
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public removeCookie(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 619
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 620
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    return-object p0
.end method

.method public removeHeader(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Base;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 558
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 559
    invoke-direct {p0, p1}, Lcom/streambundlehtml/helper/HttpConnection$Base;->scanHeaders(Ljava/lang/String;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 560
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v0, :cond_14

    .line 561
    iget-object v1, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 562
    :cond_14
    return-object p0
.end method

.method public url(Ljava/net/URL;)Lcom/streambundlehtml/Connection$Base;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")TT;"
        }
    .end annotation

    .line 434
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    const-string v0, "url"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notNullParam(Ljava/lang/Object;Ljava/lang/String;)V

    .line 435
    # invokes: Lcom/streambundlehtml/helper/HttpConnection;->punyUrl(Ljava/net/URL;)Ljava/net/URL;
    invoke-static {p1}, Lcom/streambundlehtml/helper/HttpConnection;->access$100(Ljava/net/URL;)Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->url:Ljava/net/URL;

    .line 436
    return-object p0
.end method

.method public url()Ljava/net/URL;
    .registers 3

    .line 428
    .local p0, "this":Lcom/streambundlehtml/helper/HttpConnection$Base;, "Lcom/streambundlehtml/helper/HttpConnection$Base<TT;>;"
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->url:Ljava/net/URL;

    sget-object v1, Lcom/streambundlehtml/helper/HttpConnection$Base;->UnsetUrl:Ljava/net/URL;

    if-eq v0, v1, :cond_9

    .line 430
    iget-object v0, p0, Lcom/streambundlehtml/helper/HttpConnection$Base;->url:Ljava/net/URL;

    return-object v0

    .line 429
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "URL not set. Make sure to call #url(...) before executing the request."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
