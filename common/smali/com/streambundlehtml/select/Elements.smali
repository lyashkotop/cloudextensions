.class public Lcom/streambundlehtml/select/Elements;
.super Ljava/util/ArrayList;
.source "Elements.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lcom/streambundlehtml/nodes/Element;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "initialCapacity"    # I

    .line 32
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;)V"
        }
    .end annotation

    .line 36
    .local p1, "elements":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;)V"
        }
    .end annotation

    .line 40
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 41
    return-void
.end method

.method public varargs constructor <init>([Lcom/streambundlehtml/nodes/Element;)V
    .registers 3
    .param p1, "elements"    # [Lcom/streambundlehtml/nodes/Element;

    .line 44
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 45
    return-void
.end method

.method private childNodesOfType(Ljava/lang/Class;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/streambundlehtml/nodes/Node;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 675
    .local p1, "tClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 676
    .local v0, "nodes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 677
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_16
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v4

    if-ge v3, v4, :cond_32

    .line 678
    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->childNode(I)Lcom/streambundlehtml/nodes/Node;

    move-result-object v4

    .line 679
    .local v4, "node":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {p1, v4}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 680
    invoke-virtual {p1, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 677
    .end local v4    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 682
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    .end local v3    # "i":I
    :cond_32
    goto :goto_9

    .line 683
    :cond_33
    return-object v0
.end method

.method private siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;
    .registers 10
    .param p1, "query"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "next"    # Z
    .param p3, "all"    # Z

    .line 571
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v0}, Lcom/streambundlehtml/select/Elements;-><init>()V

    .line 572
    .local v0, "els":Lcom/streambundlehtml/select/Elements;
    if-eqz p1, :cond_c

    invoke-static {p1}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v1

    goto :goto_d

    :cond_c
    const/4 v1, 0x0

    .line 573
    .local v1, "eval":Lcom/streambundlehtml/select/Evaluator;
    :goto_d
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    .line 575
    .local v3, "e":Lcom/streambundlehtml/nodes/Element;
    :cond_1d
    if-eqz p2, :cond_24

    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->nextElementSibling()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    goto :goto_28

    :cond_24
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->previousElementSibling()Lcom/streambundlehtml/nodes/Element;

    move-result-object v4

    .line 576
    .local v4, "sib":Lcom/streambundlehtml/nodes/Element;
    :goto_28
    if-nez v4, :cond_2b

    goto :goto_3d

    .line 577
    :cond_2b
    if-nez v1, :cond_31

    .line 578
    invoke-virtual {v0, v4}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    .line 579
    :cond_31
    invoke-virtual {v4, v1}, Lcom/streambundlehtml/nodes/Element;->is(Lcom/streambundlehtml/select/Evaluator;)Z

    move-result v5

    if-eqz v5, :cond_3a

    .line 580
    invoke-virtual {v0, v4}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    .line 581
    :cond_3a
    :goto_3a
    move-object v3, v4

    .line 582
    .end local v4    # "sib":Lcom/streambundlehtml/nodes/Element;
    if-nez p3, :cond_1d

    .line 583
    .end local v3    # "e":Lcom/streambundlehtml/nodes/Element;
    :goto_3d
    goto :goto_11

    .line 584
    :cond_3e
    return-object v0
.end method


# virtual methods
.method public addClass(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "className"    # Ljava/lang/String;

    .line 137
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 138
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->addClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 139
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 140
    :cond_14
    return-object p0
.end method

.method public after(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .line 370
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 371
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->after(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 372
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 373
    :cond_14
    return-object p0
.end method

.method public append(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .line 344
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 345
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->append(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 346
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 347
    :cond_14
    return-object p0
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 5
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Ljava/lang/String;

    .line 113
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 114
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1, p2}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 115
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 116
    :cond_14
    return-object p0
.end method

.method public attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "attributeKey"    # Ljava/lang/String;

    .line 70
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 71
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 72
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 73
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    :cond_1b
    goto :goto_4

    .line 74
    :cond_1c
    const-string v0, ""

    return-object v0
.end method

.method public before(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .line 357
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 358
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->before(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 359
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 360
    :cond_14
    return-object p0
.end method

.method public clone()Lcom/streambundlehtml/select/Elements;
    .registers 5

    .line 53
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/select/Elements;-><init>(I)V

    .line 55
    .local v0, "clone":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 56
    .local v2, "e":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->clone()Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 58
    .end local v2    # "e":Lcom/streambundlehtml/nodes/Element;
    :cond_21
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2

    .line 27
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->clone()Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public comments()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Comment;",
            ">;"
        }
    .end annotation

    .line 654
    const-class v0, Lcom/streambundlehtml/nodes/Comment;

    invoke-direct {p0, v0}, Lcom/streambundlehtml/select/Elements;->childNodesOfType(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public dataNodes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/DataNode;",
            ">;"
        }
    .end annotation

    .line 671
    const-class v0, Lcom/streambundlehtml/nodes/DataNode;

    invoke-direct {p0, v0}, Lcom/streambundlehtml/select/Elements;->childNodesOfType(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public eachAttr(Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .param p1, "attributeKey"    # Ljava/lang/String;
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

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 99
    .local v0, "attrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 100
    .local v2, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2, p1}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 101
    invoke-virtual {v2, p1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .end local v2    # "element":Lcom/streambundlehtml/nodes/Element;
    :cond_26
    goto :goto_d

    .line 103
    :cond_27
    return-object v0
.end method

.method public eachText()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 245
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 246
    .local v0, "texts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 247
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->hasText()Z

    move-result v3

    if-eqz v3, :cond_26

    .line 248
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 249
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_26
    goto :goto_d

    .line 250
    :cond_27
    return-object v0
.end method

.method public empty()Lcom/streambundlehtml/select/Elements;
    .registers 3

    .line 426
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 427
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->empty()Lcom/streambundlehtml/nodes/Element;

    .line 428
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 429
    :cond_14
    return-object p0
.end method

.method public eq(I)Lcom/streambundlehtml/select/Elements;
    .registers 6
    .param p1, "index"    # I

    .line 485
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v0

    if-le v0, p1, :cond_18

    new-instance v0, Lcom/streambundlehtml/select/Elements;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {p0, p1}, Lcom/streambundlehtml/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/streambundlehtml/select/Elements;-><init>([Lcom/streambundlehtml/nodes/Element;)V

    goto :goto_1d

    :cond_18
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v0}, Lcom/streambundlehtml/select/Elements;-><init>()V

    :goto_1d
    return-object v0
.end method

.method public filter(Lcom/streambundlehtml/select/NodeFilter;)Lcom/streambundlehtml/select/Elements;
    .registers 2
    .param p1, "nodeFilter"    # Lcom/streambundlehtml/select/NodeFilter;

    .line 632
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/NodeTraversor;->filter(Lcom/streambundlehtml/select/NodeFilter;Lcom/streambundlehtml/select/Elements;)V

    .line 633
    return-object p0
.end method

.method public first()Lcom/streambundlehtml/nodes/Element;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 605
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    goto :goto_f

    :cond_8
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    :goto_f
    return-object v0
.end method

.method public forms()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/FormElement;",
            ">;"
        }
    .end annotation

    .line 642
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 643
    .local v0, "forms":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/FormElement;>;"
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 644
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    instance-of v3, v2, Lcom/streambundlehtml/nodes/FormElement;

    if-eqz v3, :cond_1f

    .line 645
    move-object v3, v2

    check-cast v3, Lcom/streambundlehtml/nodes/FormElement;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 644
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_1f
    goto :goto_9

    .line 646
    :cond_20
    return-object v0
.end method

.method public hasAttr(Ljava/lang/String;)Z
    .registers 5
    .param p1, "attributeKey"    # Ljava/lang/String;

    .line 83
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 84
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 85
    const/4 v0, 0x1

    return v0

    .line 86
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    :cond_18
    goto :goto_4

    .line 87
    :cond_19
    const/4 v0, 0x0

    return v0
.end method

.method public hasClass(Ljava/lang/String;)Z
    .registers 5
    .param p1, "className"    # Ljava/lang/String;

    .line 173
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 174
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 175
    const/4 v0, 0x1

    return v0

    .line 176
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    :cond_18
    goto :goto_4

    .line 177
    :cond_19
    const/4 v0, 0x0

    return v0
.end method

.method public hasText()Z
    .registers 4

    .line 229
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 230
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->hasText()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 231
    const/4 v0, 0x1

    return v0

    .line 232
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    :cond_18
    goto :goto_4

    .line 233
    :cond_19
    const/4 v0, 0x0

    return v0
.end method

.method public html(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .line 318
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 319
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->html(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 320
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 321
    :cond_14
    return-object p0
.end method

.method public html()Ljava/lang/String;
    .registers 5

    .line 260
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 261
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 262
    .local v2, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_1f

    .line 263
    const-string v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    :cond_1f
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->html()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .end local v2    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_8

    .line 266
    :cond_27
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public is(Ljava/lang/String;)Z
    .registers 6
    .param p1, "query"    # Ljava/lang/String;

    .line 494
    invoke-static {p1}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v0

    .line 495
    .local v0, "eval":Lcom/streambundlehtml/select/Evaluator;
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 496
    .local v2, "e":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2, v0}, Lcom/streambundlehtml/nodes/Element;->is(Lcom/streambundlehtml/select/Evaluator;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 497
    const/4 v1, 0x1

    return v1

    .line 498
    .end local v2    # "e":Lcom/streambundlehtml/nodes/Element;
    :cond_1c
    goto :goto_8

    .line 499
    :cond_1d
    const/4 v1, 0x0

    return v1
.end method

.method public last()Lcom/streambundlehtml/nodes/Element;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 613
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    goto :goto_14

    :cond_8
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    :goto_14
    return-object v0
.end method

.method public next()Lcom/streambundlehtml/select/Elements;
    .registers 4

    .line 507
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1}, Lcom/streambundlehtml/select/Elements;->siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public next(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;

    .line 516
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/streambundlehtml/select/Elements;->siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public nextAll()Lcom/streambundlehtml/select/Elements;
    .registers 3

    .line 524
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v1}, Lcom/streambundlehtml/select/Elements;->siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public nextAll(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "query"    # Ljava/lang/String;

    .line 533
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, v0}, Lcom/streambundlehtml/select/Elements;->siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public not(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;

    .line 473
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/Selector;->select(Ljava/lang/String;Ljava/lang/Iterable;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    .line 474
    .local v0, "out":Lcom/streambundlehtml/select/Elements;
    invoke-static {p0, v0}, Lcom/streambundlehtml/select/Selector;->filterOut(Ljava/util/Collection;Ljava/util/Collection;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    return-object v1
.end method

.method public outerHtml()Ljava/lang/String;
    .registers 5

    .line 276
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 277
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 278
    .local v2, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_1f

    .line 279
    const-string v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    :cond_1f
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .end local v2    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_8

    .line 282
    :cond_27
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public parents()Lcom/streambundlehtml/select/Elements;
    .registers 5

    .line 592
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 593
    .local v0, "combo":Ljava/util/HashSet;, "Ljava/util/HashSet<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 594
    .local v2, "e":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->parents()Lcom/streambundlehtml/select/Elements;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 595
    .end local v2    # "e":Lcom/streambundlehtml/nodes/Element;
    goto :goto_9

    .line 596
    :cond_1d
    new-instance v1, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/select/Elements;-><init>(Ljava/util/Collection;)V

    return-object v1
.end method

.method public prepend(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .line 331
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 332
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->prepend(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 333
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 334
    :cond_14
    return-object p0
.end method

.method public prev()Lcom/streambundlehtml/select/Elements;
    .registers 3

    .line 541
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, v1}, Lcom/streambundlehtml/select/Elements;->siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public prev(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "query"    # Ljava/lang/String;

    .line 550
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Lcom/streambundlehtml/select/Elements;->siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public prevAll()Lcom/streambundlehtml/select/Elements;
    .registers 4

    .line 558
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1}, Lcom/streambundlehtml/select/Elements;->siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public prevAll(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;

    .line 567
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/streambundlehtml/select/Elements;->siblings(Ljava/lang/String;ZZ)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public remove()Lcom/streambundlehtml/select/Elements;
    .registers 3

    .line 445
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 446
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->remove()V

    .line 447
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 448
    :cond_14
    return-object p0
.end method

.method public removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;

    .line 125
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 126
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 127
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 128
    :cond_14
    return-object p0
.end method

.method public removeClass(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "className"    # Ljava/lang/String;

    .line 149
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 150
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->removeClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 151
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 152
    :cond_14
    return-object p0
.end method

.method public select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "query"    # Ljava/lang/String;

    .line 459
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/Selector;->select(Ljava/lang/String;Ljava/lang/Iterable;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public tagName(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "tagName"    # Ljava/lang/String;

    .line 305
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 306
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->tagName(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 307
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 308
    :cond_14
    return-object p0
.end method

.method public text()Ljava/lang/String;
    .registers 5

    .line 214
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 215
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 216
    .local v2, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_1f

    .line 217
    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    :cond_1f
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .end local v2    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_8

    .line 220
    :cond_27
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public textNodes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/TextNode;",
            ">;"
        }
    .end annotation

    .line 662
    const-class v0, Lcom/streambundlehtml/nodes/TextNode;

    invoke-direct {p0, v0}, Lcom/streambundlehtml/select/Elements;->childNodesOfType(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 293
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toggleClass(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "className"    # Ljava/lang/String;

    .line 161
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 162
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->toggleClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 163
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 164
    :cond_14
    return-object p0
.end method

.method public traverse(Lcom/streambundlehtml/select/NodeVisitor;)Lcom/streambundlehtml/select/Elements;
    .registers 2
    .param p1, "nodeVisitor"    # Lcom/streambundlehtml/select/NodeVisitor;

    .line 622
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/select/Elements;)V

    .line 623
    return-object p0
.end method

.method public unwrap()Lcom/streambundlehtml/select/Elements;
    .registers 3

    .line 408
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 409
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->unwrap()Lcom/streambundlehtml/nodes/Node;

    .line 410
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_4

    .line 411
    :cond_14
    return-object p0
.end method

.method public val(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .line 199
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 200
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->val(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_4

    .line 201
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public val()Ljava/lang/String;
    .registers 2

    .line 186
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v0

    if-lez v0, :cond_f

    .line 188
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->first()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->val()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 190
    :cond_f
    const-string v0, ""

    return-object v0
.end method

.method public wrap(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .line 386
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 387
    invoke-virtual {p0}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 388
    .local v1, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Element;->wrap(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 389
    .end local v1    # "element":Lcom/streambundlehtml/nodes/Element;
    goto :goto_7

    .line 390
    :cond_17
    return-object p0
.end method
