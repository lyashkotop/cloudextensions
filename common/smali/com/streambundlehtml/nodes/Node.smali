.class public abstract Lcom/streambundlehtml/nodes/Node;
.super Ljava/lang/Object;
.source "Node.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;
    }
.end annotation


# static fields
.field static final EmptyNodes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation
.end field

.field static final EmptyString:Ljava/lang/String; = ""


# instance fields
.field parentNode:Lcom/streambundlehtml/nodes/Node;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field siblingIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 25
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Node;->EmptyNodes:Ljava/util/List;

    return-void
.end method

.method protected constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method private addSiblingHtml(ILjava/lang/String;)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "html"    # Ljava/lang/String;

    .line 376
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 377
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 379
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->parent()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    instance-of v0, v0, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->parent()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    .line 380
    .local v0, "context":Lcom/streambundlehtml/nodes/Element;
    :goto_18
    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p2, v0, v2}, Lcom/streambundlehtml/parser/Parser;->parseFragmentInput(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 381
    .local v1, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    const/4 v3, 0x0

    new-array v3, v3, [Lcom/streambundlehtml/nodes/Node;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v2, p1, v3}, Lcom/streambundlehtml/nodes/Node;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 382
    return-void
.end method

.method private getDeepChild(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;

    .line 452
    nop

    :goto_1
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->childrenSize()I

    move-result v0

    if-lez v0, :cond_14

    .line 453
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object p1, v0

    check-cast p1, Lcom/streambundlehtml/nodes/Element;

    goto :goto_1

    .line 455
    :cond_14
    return-object p1
.end method

.method static isNode(Lcom/streambundlehtml/nodes/Node;Ljava/lang/String;)Z
    .registers 3
    .param p0, "node"    # Lcom/streambundlehtml/nodes/Node;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "normalName"    # Ljava/lang/String;

    .line 750
    if-eqz p0, :cond_e

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method static synthetic lambda$forEachNode$0(Ljava/util/function/Consumer;Lcom/streambundlehtml/nodes/Node;I)V
    .registers 3
    .param p0, "action"    # Ljava/util/function/Consumer;
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 676
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$forEachNode$1(Lcom/streambundlehtml/helper/Consumer;Lcom/streambundlehtml/nodes/Node;I)V
    .registers 3
    .param p0, "action"    # Lcom/streambundlehtml/helper/Consumer;
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 685
    invoke-interface {p0, p1}, Lcom/streambundlehtml/helper/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method private reindexChildren(I)V
    .registers 6
    .param p1, "start"    # I

    .line 560
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v0

    .line 561
    .local v0, "size":I
    if-nez v0, :cond_7

    return-void

    .line 562
    :cond_7
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v1

    .line 563
    .local v1, "childNodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    move v2, p1

    .local v2, "i":I
    :goto_c
    if-ge v2, v0, :cond_1a

    .line 564
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v3, v2}, Lcom/streambundlehtml/nodes/Node;->setSiblingIndex(I)V

    .line 563
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 566
    .end local v2    # "i":I
    :cond_1a
    return-void
.end method


# virtual methods
.method public absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;

    .line 216
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 217
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Attributes;->hasKeyIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 220
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->baseUri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Attributes;->getIgnoreCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 218
    :cond_24
    const-string v0, ""

    return-object v0
.end method

.method protected varargs addChildren(I[Lcom/streambundlehtml/nodes/Node;)V
    .registers 11
    .param p1, "index"    # I
    .param p2, "children"    # [Lcom/streambundlehtml/nodes/Node;

    .line 514
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 515
    array-length v0, p2

    if-nez v0, :cond_7

    .line 516
    return-void

    .line 518
    :cond_7
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    .line 521
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v1, 0x0

    aget-object v2, p2, v1

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Node;->parent()Lcom/streambundlehtml/nodes/Node;

    move-result-object v2

    .line 522
    .local v2, "firstParent":Lcom/streambundlehtml/nodes/Node;
    if-eqz v2, :cond_5e

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v3

    array-length v4, p2

    if-ne v3, v4, :cond_5e

    .line 523
    const/4 v3, 0x1

    .line 524
    .local v3, "sameList":Z
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v4

    .line 526
    .local v4, "firstParentNodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    array-length v5, p2

    .line 527
    .local v5, "i":I
    :goto_21
    add-int/lit8 v6, v5, -0x1

    .end local v5    # "i":I
    .local v6, "i":I
    if-lez v5, :cond_31

    .line 528
    aget-object v5, p2, v6

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-eq v5, v7, :cond_2f

    .line 529
    const/4 v3, 0x0

    .line 530
    goto :goto_31

    .line 528
    :cond_2f
    move v5, v6

    goto :goto_21

    .line 533
    :cond_31
    :goto_31
    if-eqz v3, :cond_5e

    .line 534
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v5

    if-nez v5, :cond_3b

    const/4 v5, 0x1

    goto :goto_3c

    :cond_3b
    const/4 v5, 0x0

    .line 535
    .local v5, "wasEmpty":Z
    :goto_3c
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Node;->empty()Lcom/streambundlehtml/nodes/Node;

    .line 536
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v0, p1, v7}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 537
    array-length v6, p2

    .line 538
    :goto_47
    add-int/lit8 v7, v6, -0x1

    .end local v6    # "i":I
    .local v7, "i":I
    if-lez v6, :cond_51

    .line 539
    aget-object v6, p2, v7

    iput-object p0, v6, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    move v6, v7

    goto :goto_47

    .line 541
    :cond_51
    if-eqz v5, :cond_5a

    aget-object v1, p2, v1

    iget v1, v1, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    if-nez v1, :cond_5a

    goto :goto_5d

    .line 542
    :cond_5a
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Node;->reindexChildren(I)V

    .line 543
    :goto_5d
    return-void

    .line 547
    .end local v3    # "sameList":Z
    .end local v4    # "firstParentNodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    .end local v5    # "wasEmpty":Z
    .end local v7    # "i":I
    :cond_5e
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->noNullElements([Ljava/lang/Object;)V

    .line 548
    array-length v3, p2

    :goto_62
    if-ge v1, v3, :cond_6c

    aget-object v4, p2, v1

    .line 549
    .local v4, "child":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {p0, v4}, Lcom/streambundlehtml/nodes/Node;->reparentChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 548
    .end local v4    # "child":Lcom/streambundlehtml/nodes/Node;
    add-int/lit8 v1, v1, 0x1

    goto :goto_62

    .line 551
    :cond_6c
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 552
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Node;->reindexChildren(I)V

    .line 553
    return-void
.end method

.method protected varargs addChildren([Lcom/streambundlehtml/nodes/Node;)V
    .registers 7
    .param p1, "children"    # [Lcom/streambundlehtml/nodes/Node;

    .line 504
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    .line 506
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    array-length v1, p1

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_1c

    aget-object v3, p1, v2

    .line 507
    .local v3, "child":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {p0, v3}, Lcom/streambundlehtml/nodes/Node;->reparentChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 508
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 509
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/nodes/Node;->setSiblingIndex(I)V

    .line 506
    .end local v3    # "child":Lcom/streambundlehtml/nodes/Node;
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 511
    :cond_1c
    return-void
.end method

.method public after(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;
    .registers 6
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;

    .line 368
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 369
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 371
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    iget v1, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    new-array v2, v2, [Lcom/streambundlehtml/nodes/Node;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/streambundlehtml/nodes/Node;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 372
    return-object p0
.end method

.method public after(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .line 357
    iget v0, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/streambundlehtml/nodes/Node;->addSiblingHtml(ILjava/lang/String;)V

    .line 358
    return-object p0
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Ljava/lang/String;

    .line 118
    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Parser;->settings()Lcom/streambundlehtml/parser/ParseSettings;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 119
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/streambundlehtml/nodes/Attributes;->putIgnoreCase(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    return-object p0
.end method

.method public attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "attributeKey"    # Ljava/lang/String;

    .line 82
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 83
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->hasAttributes()Z

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_c

    .line 84
    return-object v1

    .line 86
    :cond_c
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Attributes;->getIgnoreCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "val":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1b

    .line 88
    return-object v0

    .line 89
    :cond_1b
    const-string v2, "abs:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 90
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Node;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 91
    :cond_30
    return-object v1
.end method

.method public abstract attributes()Lcom/streambundlehtml/nodes/Attributes;
.end method

.method public attributesSize()I
    .registers 2

    .line 107
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->size()I

    move-result v0

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    return v0
.end method

.method public abstract baseUri()Ljava/lang/String;
.end method

.method public before(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;
    .registers 6
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;

    .line 343
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 344
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 346
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    iget v1, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/streambundlehtml/nodes/Node;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/streambundlehtml/nodes/Node;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 347
    return-object p0
.end method

.method public before(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .line 332
    iget v0, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    invoke-direct {p0, v0, p1}, Lcom/streambundlehtml/nodes/Node;->addSiblingHtml(ILjava/lang/String;)V

    .line 333
    return-object p0
.end method

.method public childNode(I)Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .param p1, "index"    # I

    .line 231
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Node;

    return-object v0
.end method

.method public abstract childNodeSize()I
.end method

.method public childNodes()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 240
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v0

    if-nez v0, :cond_9

    .line 241
    sget-object v0, Lcom/streambundlehtml/nodes/Node;->EmptyNodes:Ljava/util/List;

    return-object v0

    .line 243
    :cond_9
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    .line 244
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 245
    .local v1, "rewrap":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 246
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method protected childNodesAsArray()[Lcom/streambundlehtml/nodes/Node;
    .registers 3

    .line 270
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/streambundlehtml/nodes/Node;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/streambundlehtml/nodes/Node;

    return-object v0
.end method

.method public childNodesCopy()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 255
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    .line 256
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 257
    .local v1, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Node;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Node;

    .line 258
    .local v3, "node":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Node;->clone()Lcom/streambundlehtml/nodes/Node;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    .end local v3    # "node":Lcom/streambundlehtml/nodes/Node;
    goto :goto_11

    .line 260
    :cond_25
    return-object v1
.end method

.method public clearAttributes()Lcom/streambundlehtml/nodes/Node;
    .registers 3

    .line 158
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 159
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 160
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/streambundlehtml/nodes/Attribute;>;"
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 161
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 162
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_e

    .line 165
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/streambundlehtml/nodes/Attribute;>;"
    :cond_1b
    return-object p0
.end method

.method public clone()Lcom/streambundlehtml/nodes/Node;
    .registers 8

    .line 820
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Node;->doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 823
    .local v0, "thisClone":Lcom/streambundlehtml/nodes/Node;
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 824
    .local v1, "nodesToProcess":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/streambundlehtml/nodes/Node;>;"
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 826
    :goto_d
    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_38

    .line 827
    invoke-virtual {v1}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Node;

    .line 829
    .local v2, "currParent":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v3

    .line 830
    .local v3, "size":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1e
    if-ge v4, v3, :cond_37

    .line 831
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v5

    .line 832
    .local v5, "childNodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v6, v2}, Lcom/streambundlehtml/nodes/Node;->doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v6

    .line 833
    .local v6, "childClone":Lcom/streambundlehtml/nodes/Node;
    invoke-interface {v5, v4, v6}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 834
    invoke-virtual {v1, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 830
    .end local v5    # "childNodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    .end local v6    # "childClone":Lcom/streambundlehtml/nodes/Node;
    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    .line 836
    .end local v2    # "currParent":Lcom/streambundlehtml/nodes/Node;
    .end local v3    # "size":I
    .end local v4    # "i":I
    :cond_37
    goto :goto_d

    .line 838
    :cond_38
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 24
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->clone()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    return-object v0
.end method

.method protected doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;
    .registers 6
    .param p1, "parent"    # Lcom/streambundlehtml/nodes/Node;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 859
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Node;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_2b

    .line 862
    .local v0, "clone":Lcom/streambundlehtml/nodes/Node;
    nop

    .line 864
    iput-object p1, v0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    .line 865
    if-nez p1, :cond_d

    const/4 v1, 0x0

    goto :goto_f

    :cond_d
    iget v1, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    :goto_f
    iput v1, v0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    .line 867
    if-nez p1, :cond_2a

    instance-of v1, p0, Lcom/streambundlehtml/nodes/Document;

    if-nez v1, :cond_2a

    .line 868
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v1

    .line 869
    .local v1, "doc":Lcom/streambundlehtml/nodes/Document;
    if-eqz v1, :cond_2a

    .line 870
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->shallowClone()Lcom/streambundlehtml/nodes/Document;

    move-result-object v2

    .line 871
    .local v2, "docClone":Lcom/streambundlehtml/nodes/Document;
    iput-object v2, v0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    .line 872
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document;->ensureChildNodes()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 876
    .end local v1    # "doc":Lcom/streambundlehtml/nodes/Document;
    .end local v2    # "docClone":Lcom/streambundlehtml/nodes/Document;
    :cond_2a
    return-object v0

    .line 860
    .end local v0    # "clone":Lcom/streambundlehtml/nodes/Node;
    :catch_2b
    move-exception v0

    .line 861
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected abstract doSetBaseUri(Ljava/lang/String;)V
.end method

.method public abstract empty()Lcom/streambundlehtml/nodes/Node;
.end method

.method protected abstract ensureChildNodes()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 781
    if-ne p0, p1, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    :goto_5
    return v0
.end method

.method public filter(Lcom/streambundlehtml/select/NodeFilter;)Lcom/streambundlehtml/nodes/Node;
    .registers 2
    .param p1, "nodeFilter"    # Lcom/streambundlehtml/select/NodeFilter;

    .line 695
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 696
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/NodeTraversor;->filter(Lcom/streambundlehtml/select/NodeFilter;Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    .line 697
    return-object p0
.end method

.method public firstChild()Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 638
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    .line 639
    :cond_8
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Node;

    return-object v0
.end method

.method public forEachNode(Lcom/streambundlehtml/helper/Consumer;)Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundlehtml/helper/Consumer<",
            "-",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Node;"
        }
    .end annotation

    .line 684
    .local p1, "action":Lcom/streambundlehtml/helper/Consumer;, "Lcom/streambundlehtml/helper/Consumer<-Lcom/streambundlehtml/nodes/Node;>;"
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 685
    new-instance v0, Lcom/streambundlehtml/nodes/Node$0;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/nodes/Node$0;-><init>(Lcom/streambundlehtml/helper/Consumer;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 686
    return-object p0
.end method

.method public forEachNode(Ljava/util/function/Consumer;)Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "-",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Node;"
        }
    .end annotation

    .line 675
    .local p1, "action":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<-Lcom/streambundlehtml/nodes/Node;>;"
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 676
    new-instance v0, Lcom/streambundlehtml/nodes/Node$1;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/nodes/Node$1;-><init>(Ljava/util/function/Consumer;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 677
    return-object p0
.end method

.method public hasAttr(Ljava/lang/String;)Z
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;

    .line 129
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 130
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->hasAttributes()Z

    move-result v0

    if-nez v0, :cond_b

    .line 131
    const/4 v0, 0x0

    return v0

    .line 133
    :cond_b
    const-string v0, "abs:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 134
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/nodes/Attributes;->hasKeyIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Node;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_31

    .line 136
    const/4 v1, 0x1

    return v1

    .line 138
    .end local v0    # "key":Ljava/lang/String;
    :cond_31
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Attributes;->hasKeyIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected abstract hasAttributes()Z
.end method

.method public hasParent()Z
    .registers 2

    .line 63
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public hasSameValue(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 802
    if-ne p0, p1, :cond_4

    const/4 v0, 0x1

    return v0

    .line 803
    :cond_4
    if-eqz p1, :cond_20

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_20

    .line 805
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->outerHtml()Ljava/lang/String;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Node;->outerHtml()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 803
    :cond_20
    const/4 v0, 0x0

    return v0
.end method

.method public hashCode()I
    .registers 2

    .line 792
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public html(Ljava/lang/Appendable;)Ljava/lang/Appendable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Appendable;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 732
    .local p1, "appendable":Ljava/lang/Appendable;, "TT;"
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Node;->outerHtml(Ljava/lang/Appendable;)V

    .line 733
    return-object p1
.end method

.method protected indent(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 7
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 768
    const/16 v0, 0xa

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    move-result-object v0

    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->indentAmount()I

    move-result v1

    mul-int v1, v1, p2

    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->maxPaddingWidth()I

    move-result v2

    invoke-static {v1, v2}, Lcom/streambundlehtml/internal/StringUtil;->padding(II)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 769
    return-void
.end method

.method final isNode(Ljava/lang/String;)Z
    .registers 3
    .param p1, "normalName"    # Ljava/lang/String;

    .line 755
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public lastChild()Lcom/streambundlehtml/nodes/Node;
    .registers 4
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 650
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v0

    .line 651
    .local v0, "size":I
    if-nez v0, :cond_8

    const/4 v1, 0x0

    return-object v1

    .line 652
    :cond_8
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v1

    .line 653
    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    add-int/lit8 v2, v0, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Node;

    return-object v2
.end method

.method public nextSibling()Lcom/streambundlehtml/nodes/Node;
    .registers 5
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 590
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 591
    return-object v1

    .line 593
    :cond_6
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    .line 594
    .local v0, "siblings":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    iget v2, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    add-int/lit8 v2, v2, 0x1

    .line 595
    .local v2, "index":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v2, :cond_1d

    .line 596
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Node;

    return-object v1

    .line 598
    :cond_1d
    return-object v1
.end method

.method public abstract nodeName()Ljava/lang/String;
.end method

.method nodelistChanged()V
    .registers 1

    .line 460
    return-void
.end method

.method public normalName()Ljava/lang/String;
    .registers 2

    .line 49
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->nodeName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public outerHtml()Ljava/lang/String;
    .registers 3

    .line 707
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 708
    .local v0, "accum":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Node;->outerHtml(Ljava/lang/Appendable;)V

    .line 709
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected outerHtml(Ljava/lang/Appendable;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;

    .line 713
    new-instance v0, Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;

    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->outputSettings(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;-><init>(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 714
    return-void
.end method

.method abstract outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public ownerDocument()Lcom/streambundlehtml/nodes/Document;
    .registers 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 313
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->root()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 314
    .local v0, "root":Lcom/streambundlehtml/nodes/Node;
    instance-of v1, v0, Lcom/streambundlehtml/nodes/Document;

    if-eqz v1, :cond_c

    move-object v1, v0

    check-cast v1, Lcom/streambundlehtml/nodes/Document;

    goto :goto_d

    :cond_c
    const/4 v1, 0x0

    :goto_d
    return-object v1
.end method

.method public parent()Lcom/streambundlehtml/nodes/Node;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 286
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    return-object v0
.end method

.method public final parentNode()Lcom/streambundlehtml/nodes/Node;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 294
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    return-object v0
.end method

.method public previousSibling()Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 606
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 607
    return-object v1

    .line 609
    :cond_6
    iget v0, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    if-lez v0, :cond_1b

    .line 610
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Node;

    return-object v0

    .line 612
    :cond_1b
    return-object v1
.end method

.method public remove()V
    .registers 2

    .line 321
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 322
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v0, p0}, Lcom/streambundlehtml/nodes/Node;->removeChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 323
    return-void
.end method

.method public removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3
    .param p1, "attributeKey"    # Ljava/lang/String;

    .line 147
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 148
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 149
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Attributes;->removeIgnoreCase(Ljava/lang/String;)V

    .line 150
    :cond_10
    return-object p0
.end method

.method protected removeChild(Lcom/streambundlehtml/nodes/Node;)V
    .registers 4
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Node;

    .line 495
    iget-object v0, p1, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-ne v0, p0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 496
    iget v0, p1, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    .line 497
    .local v0, "index":I
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 498
    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Node;->reindexChildren(I)V

    .line 499
    const/4 v1, 0x0

    iput-object v1, p1, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    .line 500
    return-void
.end method

.method protected reparentChild(Lcom/streambundlehtml/nodes/Node;)V
    .registers 2
    .param p1, "child"    # Lcom/streambundlehtml/nodes/Node;

    .line 556
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/nodes/Node;->setParentNode(Lcom/streambundlehtml/nodes/Node;)V

    .line 557
    return-void
.end method

.method protected replaceChild(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/nodes/Node;)V
    .registers 5
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "in"    # Lcom/streambundlehtml/nodes/Node;

    .line 480
    iget-object v0, p1, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-ne v0, p0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 481
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 482
    if-ne p1, p2, :cond_10

    return-void

    .line 484
    :cond_10
    iget-object v0, p2, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-eqz v0, :cond_19

    .line 485
    iget-object v0, p2, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v0, p2}, Lcom/streambundlehtml/nodes/Node;->removeChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 487
    :cond_19
    iget v0, p1, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    .line 488
    .local v0, "index":I
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 489
    iput-object p0, p2, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    .line 490
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/nodes/Node;->setSiblingIndex(I)V

    .line 491
    const/4 v1, 0x0

    iput-object v1, p1, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    .line 492
    return-void
.end method

.method public replaceWith(Lcom/streambundlehtml/nodes/Node;)V
    .registers 3
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Node;

    .line 467
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 468
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 469
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v0, p0, p1}, Lcom/streambundlehtml/nodes/Node;->replaceChild(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/nodes/Node;)V

    .line 470
    return-void
.end method

.method public root()Lcom/streambundlehtml/nodes/Node;
    .registers 3

    .line 302
    move-object v0, p0

    .line 303
    .local v0, "node":Lcom/streambundlehtml/nodes/Node;
    :goto_1
    iget-object v1, v0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-eqz v1, :cond_8

    .line 304
    iget-object v0, v0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    goto :goto_1

    .line 305
    :cond_8
    return-object v0
.end method

.method public setBaseUri(Ljava/lang/String;)V
    .registers 2
    .param p1, "baseUri"    # Ljava/lang/String;

    .line 188
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 189
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Node;->doSetBaseUri(Ljava/lang/String;)V

    .line 190
    return-void
.end method

.method protected setParentNode(Lcom/streambundlehtml/nodes/Node;)V
    .registers 3
    .param p1, "parentNode"    # Lcom/streambundlehtml/nodes/Node;

    .line 473
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 474
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-eqz v0, :cond_c

    .line 475
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v0, p0}, Lcom/streambundlehtml/nodes/Node;->removeChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 476
    :cond_c
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    .line 477
    return-void
.end method

.method protected setSiblingIndex(I)V
    .registers 2
    .param p1, "siblingIndex"    # I

    .line 626
    iput p1, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    .line 627
    return-void
.end method

.method public shallowClone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 848
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Node;->doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    return-object v0
.end method

.method public siblingIndex()I
    .registers 2

    .line 622
    iget v0, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    return v0
.end method

.method public siblingNodes()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 574
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-nez v0, :cond_9

    .line 575
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 577
    :cond_9
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->ensureChildNodes()Ljava/util/List;

    move-result-object v0

    .line 578
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 579
    .local v1, "siblings":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Node;

    .line 580
    .local v3, "node":Lcom/streambundlehtml/nodes/Node;
    if-eq v3, p0, :cond_2f

    .line 581
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 580
    .end local v3    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_2f
    goto :goto_1e

    .line 582
    :cond_30
    return-object v1
.end method

.method public sourceRange()Lcom/streambundlehtml/nodes/Range;
    .registers 2

    .line 745
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Range;->of(Lcom/streambundlehtml/nodes/Node;Z)Lcom/streambundlehtml/nodes/Range;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 764
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public traverse(Lcom/streambundlehtml/select/NodeVisitor;)Lcom/streambundlehtml/nodes/Node;
    .registers 2
    .param p1, "nodeVisitor"    # Lcom/streambundlehtml/select/NodeVisitor;

    .line 662
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 663
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 664
    return-object p0
.end method

.method public unwrap()Lcom/streambundlehtml/nodes/Node;
    .registers 5
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 443
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 444
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->firstChild()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 445
    .local v0, "firstChild":Lcom/streambundlehtml/nodes/Node;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    iget v2, p0, Lcom/streambundlehtml/nodes/Node;->siblingIndex:I

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->childNodesAsArray()[Lcom/streambundlehtml/nodes/Node;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/streambundlehtml/nodes/Node;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 446
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->remove()V

    .line 448
    return-object v0
.end method

.method public wrap(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 10
    .param p1, "html"    # Ljava/lang/String;

    .line 392
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 396
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    instance-of v0, v0, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    goto :goto_1b

    .line 397
    :cond_12
    instance-of v0, p0, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_1a

    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    goto :goto_1b

    .line 398
    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    nop

    .line 399
    .local v0, "context":Lcom/streambundlehtml/nodes/Element;
    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v0, v2}, Lcom/streambundlehtml/parser/Parser;->parseFragmentInput(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 400
    .local v1, "wrapChildren":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Node;

    .line 401
    .local v3, "wrapNode":Lcom/streambundlehtml/nodes/Node;
    instance-of v4, v3, Lcom/streambundlehtml/nodes/Element;

    if-nez v4, :cond_34

    .line 402
    return-object p0

    .line 404
    :cond_34
    move-object v4, v3

    check-cast v4, Lcom/streambundlehtml/nodes/Element;

    .line 405
    .local v4, "wrap":Lcom/streambundlehtml/nodes/Element;
    invoke-direct {p0, v4}, Lcom/streambundlehtml/nodes/Node;->getDeepChild(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v5

    .line 406
    .local v5, "deepest":Lcom/streambundlehtml/nodes/Element;
    iget-object v6, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-eqz v6, :cond_44

    .line 407
    iget-object v6, p0, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v6, p0, v4}, Lcom/streambundlehtml/nodes/Node;->replaceChild(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/nodes/Node;)V

    .line 408
    :cond_44
    const/4 v6, 0x1

    new-array v6, v6, [Lcom/streambundlehtml/nodes/Node;

    aput-object p0, v6, v2

    invoke-virtual {v5, v6}, Lcom/streambundlehtml/nodes/Element;->addChildren([Lcom/streambundlehtml/nodes/Node;)V

    .line 411
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_71

    .line 413
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_53
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_71

    .line 414
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/nodes/Node;

    .line 416
    .local v6, "remainder":Lcom/streambundlehtml/nodes/Node;
    if-ne v4, v6, :cond_62

    .line 417
    goto :goto_6e

    .line 419
    :cond_62
    iget-object v7, v6, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-eqz v7, :cond_6b

    .line 420
    iget-object v7, v6, Lcom/streambundlehtml/nodes/Node;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v7, v6}, Lcom/streambundlehtml/nodes/Node;->removeChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 421
    :cond_6b
    invoke-virtual {v4, v6}, Lcom/streambundlehtml/nodes/Element;->after(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 413
    .end local v6    # "remainder":Lcom/streambundlehtml/nodes/Node;
    :goto_6e
    add-int/lit8 v2, v2, 0x1

    goto :goto_53

    .line 424
    .end local v2    # "i":I
    :cond_71
    return-object p0
.end method
