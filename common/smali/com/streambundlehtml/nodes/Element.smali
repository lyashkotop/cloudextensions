.class public Lcom/streambundlehtml/nodes/Element;
.super Lcom/streambundlehtml/nodes/Node;
.source "Element.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/nodes/Element$NodeList;
    }
.end annotation


# static fields
.field private static final BaseUriKey:Ljava/lang/String;

.field private static final ClassSplit:Ljava/util/regex/Pattern;

.field private static final EmptyChildren:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field attributes:Lcom/streambundlehtml/nodes/Attributes;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field childNodes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation
.end field

.field private shadowChildrenRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private tag:Lcom/streambundlehtml/parser/Tag;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 45
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Element;->EmptyChildren:Ljava/util/List;

    .line 46
    const-string v0, "\\s+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Element;->ClassSplit:Ljava/util/regex/Pattern;

    .line 47
    const-string v0, "baseUri"

    invoke-static {v0}, Lcom/streambundlehtml/nodes/Attributes;->internalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Element;->BaseUriKey:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V
    .registers 4
    .param p1, "tag"    # Lcom/streambundlehtml/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V
    .registers 5
    .param p1, "tag"    # Lcom/streambundlehtml/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "attributes"    # Lcom/streambundlehtml/nodes/Attributes;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 70
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/Node;-><init>()V

    .line 71
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 72
    sget-object v0, Lcom/streambundlehtml/nodes/Element;->EmptyNodes:Ljava/util/List;

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    .line 73
    iput-object p3, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 74
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    .line 75
    if-eqz p2, :cond_13

    .line 76
    invoke-virtual {p0, p2}, Lcom/streambundlehtml/nodes/Element;->setBaseUri(Ljava/lang/String;)V

    .line 77
    :cond_13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "tag"    # Ljava/lang/String;

    .line 58
    invoke-static {p1}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 59
    return-void
.end method

.method static synthetic access$000(Ljava/lang/StringBuilder;Lcom/streambundlehtml/nodes/TextNode;)V
    .registers 2
    .param p0, "x0"    # Ljava/lang/StringBuilder;
    .param p1, "x1"    # Lcom/streambundlehtml/nodes/TextNode;

    .line 44
    invoke-static {p0, p1}, Lcom/streambundlehtml/nodes/Element;->appendNormalisedText(Ljava/lang/StringBuilder;Lcom/streambundlehtml/nodes/TextNode;)V

    return-void
.end method

.method static synthetic access$100(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/parser/Tag;
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/nodes/Element;

    .line 44
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    return-object v0
.end method

.method private static appendNormalisedText(Ljava/lang/StringBuilder;Lcom/streambundlehtml/nodes/TextNode;)V
    .registers 4
    .param p0, "accum"    # Ljava/lang/StringBuilder;
    .param p1, "textNode"    # Lcom/streambundlehtml/nodes/TextNode;

    .line 1407
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/TextNode;->getWholeText()Ljava/lang/String;

    move-result-object v0

    .line 1408
    .local v0, "text":Ljava/lang/String;
    iget-object v1, p1, Lcom/streambundlehtml/nodes/TextNode;->parentNode:Lcom/streambundlehtml/nodes/Node;

    invoke-static {v1}, Lcom/streambundlehtml/nodes/Element;->preserveWhitespace(Lcom/streambundlehtml/nodes/Node;)Z

    move-result v1

    if-nez v1, :cond_18

    instance-of v1, p1, Lcom/streambundlehtml/nodes/CDataNode;

    if-nez v1, :cond_18

    .line 1411
    invoke-static {p0}, Lcom/streambundlehtml/nodes/TextNode;->lastCharIsWhitespace(Ljava/lang/StringBuilder;)Z

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->appendNormalisedWhitespace(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    goto :goto_1b

    .line 1409
    :cond_18
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1412
    :goto_1b
    return-void
.end method

.method private static appendWholeText(Lcom/streambundlehtml/nodes/Node;Ljava/lang/StringBuilder;)V
    .registers 3
    .param p0, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .line 1350
    instance-of v0, p0, Lcom/streambundlehtml/nodes/TextNode;

    if-eqz v0, :cond_f

    .line 1351
    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/nodes/TextNode;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/TextNode;->getWholeText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 1352
    :cond_f
    const-string v0, "br"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Node;->isNode(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 1353
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1355
    :cond_1c
    :goto_1c
    return-void
.end method

.method private static indexInList(Lcom/streambundlehtml/nodes/Element;Ljava/util/List;)I
    .registers 5
    .param p0, "search"    # Lcom/streambundlehtml/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Lcom/streambundlehtml/nodes/Element;",
            ">(",
            "Lcom/streambundlehtml/nodes/Element;",
            "Ljava/util/List<",
            "TE;>;)I"
        }
    .end annotation

    .line 977
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<TE;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 978
    .local v0, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_11

    .line 979
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p0, :cond_e

    .line 980
    return v1

    .line 978
    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 982
    .end local v1    # "i":I
    :cond_11
    const/4 v1, 0x0

    return v1
.end method

.method private isFormatAsBlock(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z
    .registers 3
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 1845
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_24

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_24

    :cond_1c
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->outline()Z

    move-result v0

    if-nez v0, :cond_24

    const/4 v0, 0x0

    goto :goto_25

    :cond_24
    const/4 v0, 0x1

    :goto_25
    return v0
.end method

.method private isInlineable(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z
    .registers 3
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 1849
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isInline()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 1850
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->isBlock()Z

    move-result v0

    if-nez v0, :cond_1b

    goto :goto_29

    .line 1851
    :cond_1b
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->previousSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    if-eqz v0, :cond_29

    .line 1852
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->outline()Z

    move-result v0

    if-nez v0, :cond_29

    const/4 v0, 0x1

    goto :goto_2a

    :cond_29
    :goto_29
    const/4 v0, 0x0

    .line 1849
    :goto_2a
    return v0
.end method

.method static synthetic lambda$data$2(Ljava/lang/StringBuilder;Lcom/streambundlehtml/nodes/Node;I)V
    .registers 5
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "childNode"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 1481
    instance-of v0, p1, Lcom/streambundlehtml/nodes/DataNode;

    if-eqz v0, :cond_f

    .line 1482
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/DataNode;

    .line 1483
    .local v0, "data":Lcom/streambundlehtml/nodes/DataNode;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/DataNode;->getWholeData()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1484
    .end local v0    # "data":Lcom/streambundlehtml/nodes/DataNode;
    goto :goto_2e

    :cond_f
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Comment;

    if-eqz v0, :cond_1e

    .line 1485
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/Comment;

    .line 1486
    .local v0, "comment":Lcom/streambundlehtml/nodes/Comment;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Comment;->getData()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v0    # "comment":Lcom/streambundlehtml/nodes/Comment;
    goto :goto_2d

    .line 1487
    :cond_1e
    instance-of v0, p1, Lcom/streambundlehtml/nodes/CDataNode;

    if-eqz v0, :cond_2d

    .line 1490
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/CDataNode;

    .line 1491
    .local v0, "cDataNode":Lcom/streambundlehtml/nodes/CDataNode;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/CDataNode;->getWholeText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2e

    .line 1487
    .end local v0    # "cDataNode":Lcom/streambundlehtml/nodes/CDataNode;
    :cond_2d
    :goto_2d
    nop

    .line 1493
    :goto_2e
    return-void
.end method

.method static synthetic lambda$forEach$3(Ljava/util/function/Consumer;Lcom/streambundlehtml/nodes/Node;I)V
    .registers 4
    .param p0, "action"    # Ljava/util/function/Consumer;
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 1808
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_a

    .line 1809
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    invoke-interface {p0, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 1810
    :cond_a
    return-void
.end method

.method static synthetic lambda$forEach$4(Lcom/streambundlehtml/helper/Consumer;Lcom/streambundlehtml/nodes/Node;I)V
    .registers 4
    .param p0, "action"    # Lcom/streambundlehtml/helper/Consumer;
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 1820
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_a

    .line 1821
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    invoke-interface {p0, v0}, Lcom/streambundlehtml/helper/Consumer;->accept(Ljava/lang/Object;)V

    .line 1822
    :cond_a
    return-void
.end method

.method static synthetic lambda$hasText$1(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 5
    .param p0, "hasText"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 1457
    instance-of v0, p1, Lcom/streambundlehtml/nodes/TextNode;

    if-eqz v0, :cond_14

    .line 1458
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/TextNode;

    .line 1459
    .local v0, "textNode":Lcom/streambundlehtml/nodes/TextNode;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/TextNode;->isBlank()Z

    move-result v1

    if-nez v1, :cond_14

    .line 1460
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 1461
    sget-object v1, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v1

    .line 1464
    .end local v0    # "textNode":Lcom/streambundlehtml/nodes/TextNode;
    :cond_14
    sget-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v0
.end method

.method static synthetic lambda$wholeText$0(Ljava/lang/StringBuilder;Lcom/streambundlehtml/nodes/Node;I)V
    .registers 3
    .param p0, "accum"    # Ljava/lang/StringBuilder;
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 1345
    invoke-static {p1, p0}, Lcom/streambundlehtml/nodes/Element;->appendWholeText(Lcom/streambundlehtml/nodes/Node;Ljava/lang/StringBuilder;)V

    return-void
.end method

.method private nextElementSiblings(Z)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "next"    # Z

    .line 935
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v0}, Lcom/streambundlehtml/select/Elements;-><init>()V

    .line 936
    .local v0, "els":Lcom/streambundlehtml/select/Elements;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-nez v1, :cond_a

    .line 937
    return-object v0

    .line 938
    :cond_a
    invoke-virtual {v0, p0}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    .line 939
    if-eqz p1, :cond_14

    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->nextAll()Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    goto :goto_18

    :cond_14
    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->prevAll()Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    :goto_18
    return-object v1
.end method

.method private ownText(Ljava/lang/StringBuilder;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .line 1395
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v1

    if-ge v0, v1, :cond_32

    .line 1396
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Node;

    .line 1397
    .local v1, "child":Lcom/streambundlehtml/nodes/Node;
    instance-of v2, v1, Lcom/streambundlehtml/nodes/TextNode;

    if-eqz v2, :cond_1a

    .line 1398
    move-object v2, v1

    check-cast v2, Lcom/streambundlehtml/nodes/TextNode;

    .line 1399
    .local v2, "textNode":Lcom/streambundlehtml/nodes/TextNode;
    invoke-static {p1, v2}, Lcom/streambundlehtml/nodes/Element;->appendNormalisedText(Ljava/lang/StringBuilder;Lcom/streambundlehtml/nodes/TextNode;)V

    .end local v2    # "textNode":Lcom/streambundlehtml/nodes/TextNode;
    goto :goto_2e

    .line 1400
    :cond_1a
    const-string v2, "br"

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Node;->isNode(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-static {p1}, Lcom/streambundlehtml/nodes/TextNode;->lastCharIsWhitespace(Ljava/lang/StringBuilder;)Z

    move-result v2

    if-nez v2, :cond_2e

    .line 1401
    const-string v2, " "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 1400
    :cond_2e
    :goto_2e
    nop

    .line 1395
    .end local v1    # "child":Lcom/streambundlehtml/nodes/Node;
    :goto_2f
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1404
    .end local v0    # "i":I
    :cond_32
    return-void
.end method

.method static preserveWhitespace(Lcom/streambundlehtml/nodes/Node;)Z
    .registers 4
    .param p0, "node"    # Lcom/streambundlehtml/nodes/Node;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1416
    instance-of v0, p0, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_1e

    .line 1417
    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 1418
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    const/4 v1, 0x0

    .line 1420
    .local v1, "i":I
    :goto_8
    iget-object v2, v0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Tag;->preserveWhitespace()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1421
    const/4 v2, 0x1

    return v2

    .line 1422
    :cond_12
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 1423
    add-int/lit8 v1, v1, 0x1

    .line 1424
    const/4 v2, 0x6

    if-ge v1, v2, :cond_1e

    if-eqz v0, :cond_1e

    goto :goto_8

    .line 1426
    .end local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    .end local v1    # "i":I
    :cond_1e
    const/4 v0, 0x0

    return v0
.end method

.method private static searchUpForAttribute(Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "start"    # Lcom/streambundlehtml/nodes/Element;
    .param p1, "key"    # Ljava/lang/String;

    .line 122
    move-object v0, p0

    .line 123
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    :goto_1
    if-eqz v0, :cond_1b

    .line 124
    iget-object v1, v0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v1, :cond_16

    iget-object v1, v0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 125
    iget-object v1, v0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v1, p1}, Lcom/streambundlehtml/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 126
    :cond_16
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    goto :goto_1

    .line 128
    :cond_1b
    const-string v1, ""

    return-object v1
.end method


# virtual methods
.method public addClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .line 1593
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1595
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1596
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1597
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->classNames(Ljava/util/Set;)Lcom/streambundlehtml/nodes/Element;

    .line 1599
    return-object p0
.end method

.method public after(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;

    .line 795
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->after(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public after(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .line 784
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->after(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic after(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->after(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic after(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->after(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public append(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .line 733
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 734
    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, p0, v1}, Lcom/streambundlehtml/parser/Parser;->parseFragmentInput(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 735
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/streambundlehtml/nodes/Node;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Element;->addChildren([Lcom/streambundlehtml/nodes/Node;)V

    .line 736
    return-object p0
.end method

.method public appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "child"    # Lcom/streambundlehtml/nodes/Node;

    .line 574
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 577
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->reparentChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 578
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->ensureChildNodes()Ljava/util/List;

    .line 579
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 580
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/nodes/Node;->setSiblingIndex(I)V

    .line 581
    return-object p0
.end method

.method public appendChildren(Ljava/util/Collection;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Element;"
        }
    .end annotation

    .line 592
    .local p1, "children":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/nodes/Element;->insertChildren(ILjava/util/Collection;)Lcom/streambundlehtml/nodes/Element;

    .line 593
    return-object p0
.end method

.method public appendElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .line 682
    new-instance v0, Lcom/streambundlehtml/nodes/Element;

    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Parser;->settings()Lcom/streambundlehtml/parser/ParseSettings;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v1

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V

    .line 683
    .local v0, "child":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 684
    return-object v0
.end method

.method public appendText(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .line 707
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 708
    new-instance v0, Lcom/streambundlehtml/nodes/TextNode;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    .line 709
    .local v0, "node":Lcom/streambundlehtml/nodes/TextNode;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 710
    return-object p0
.end method

.method public appendTo(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;
    .registers 2
    .param p1, "parent"    # Lcom/streambundlehtml/nodes/Element;

    .line 603
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 604
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 605
    return-object p0
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Ljava/lang/String;

    .line 226
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/nodes/Node;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 227
    return-object p0
.end method

.method public attr(Ljava/lang/String;Z)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Z

    .line 241
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Z)Lcom/streambundlehtml/nodes/Attributes;

    .line 242
    return-object p0
.end method

.method public bridge synthetic attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3

    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public attributes()Lcom/streambundlehtml/nodes/Attributes;
    .registers 2

    .line 111
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-nez v0, :cond_b

    .line 112
    new-instance v0, Lcom/streambundlehtml/nodes/Attributes;

    invoke-direct {v0}, Lcom/streambundlehtml/nodes/Attributes;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 113
    :cond_b
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    return-object v0
.end method

.method public baseUri()Ljava/lang/String;
    .registers 2

    .line 118
    sget-object v0, Lcom/streambundlehtml/nodes/Element;->BaseUriKey:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Element;->searchUpForAttribute(Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public before(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;

    .line 772
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->before(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public before(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .line 761
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->before(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic before(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->before(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic before(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->before(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public child(I)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "index"    # I

    .line 293
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method childElementsList()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;"
        }
    .end annotation

    .line 329
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v0

    if-nez v0, :cond_9

    .line 330
    sget-object v0, Lcom/streambundlehtml/nodes/Element;->EmptyChildren:Ljava/util/List;

    return-object v0

    .line 333
    :cond_9
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->shadowChildrenRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->shadowChildrenRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    move-object v1, v0

    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    if-nez v0, :cond_42

    .line 334
    .end local v1    # "children":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    :cond_18
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 335
    .local v0, "size":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 337
    .restart local v1    # "children":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_24
    if-ge v2, v0, :cond_3b

    .line 338
    iget-object v3, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Node;

    .line 339
    .local v3, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v4, v3, Lcom/streambundlehtml/nodes/Element;

    if-eqz v4, :cond_38

    .line 340
    move-object v4, v3

    check-cast v4, Lcom/streambundlehtml/nodes/Element;

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    .end local v3    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_38
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 342
    .end local v2    # "i":I
    :cond_3b
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/streambundlehtml/nodes/Element;->shadowChildrenRef:Ljava/lang/ref/WeakReference;

    .line 344
    .end local v0    # "size":I
    :cond_42
    return-object v1
.end method

.method public childNodeSize()I
    .registers 2

    .line 138
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public children()Lcom/streambundlehtml/select/Elements;
    .registers 3

    .line 320
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/select/Elements;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method public childrenSize()I
    .registers 2

    .line 308
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public className()Ljava/lang/String;
    .registers 2

    .line 1503
    const-string v0, "class"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public classNames(Ljava/util/Set;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Element;"
        }
    .end annotation

    .line 1526
    .local p1, "classNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1527
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    const-string v1, "class"

    if-eqz v0, :cond_13

    .line 1528
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->remove(Ljava/lang/String;)V

    goto :goto_20

    .line 1530
    :cond_13
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    const-string v2, " "

    invoke-static {p1, v2}, Lcom/streambundlehtml/internal/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 1532
    :goto_20
    return-object p0
.end method

.method public classNames()Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1513
    sget-object v0, Lcom/streambundlehtml/nodes/Element;->ClassSplit:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->className()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v0

    .line 1514
    .local v0, "names":[Ljava/lang/String;
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 1515
    .local v1, "classNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v2, ""

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1517
    return-object v1
.end method

.method public clearAttributes()Lcom/streambundlehtml/nodes/Element;
    .registers 2

    .line 1770
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v0, :cond_a

    .line 1771
    invoke-super {p0}, Lcom/streambundlehtml/nodes/Node;->clearAttributes()Lcom/streambundlehtml/nodes/Node;

    .line 1772
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 1775
    :cond_a
    return-object p0
.end method

.method public bridge synthetic clearAttributes()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->clearAttributes()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/streambundlehtml/nodes/Element;
    .registers 2

    .line 1748
    invoke-super {p0}, Lcom/streambundlehtml/nodes/Node;->clone()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->clone()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->clone()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public closest(Lcom/streambundlehtml/select/Evaluator;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "evaluator"    # Lcom/streambundlehtml/select/Evaluator;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 515
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 516
    move-object v0, p0

    .line 517
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->root()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 519
    .local v1, "root":Lcom/streambundlehtml/nodes/Element;
    :cond_8
    invoke-virtual {p1, v1, v0}, Lcom/streambundlehtml/select/Evaluator;->matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 520
    return-object v0

    .line 521
    :cond_f
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 522
    if-nez v0, :cond_8

    .line 523
    const/4 v2, 0x0

    return-object v2
.end method

.method public closest(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "cssQuery"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 504
    invoke-static {p1}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->closest(Lcom/streambundlehtml/select/Evaluator;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public cssSelector()Ljava/lang/String;
    .registers 9

    .line 830
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->id()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_40

    .line 832
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->id()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundlehtml/parser/TokenQueue;->escapeCssIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 833
    .local v0, "idSel":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v3

    .line 834
    .local v3, "doc":Lcom/streambundlehtml/nodes/Document;
    if-eqz v3, :cond_3f

    .line 835
    invoke-virtual {v3, v0}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v4

    .line 836
    .local v4, "els":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {v4}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v5

    if-ne v5, v2, :cond_3e

    invoke-virtual {v4, v1}, Lcom/streambundlehtml/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, p0, :cond_3e

    .line 837
    return-object v0

    .line 838
    .end local v4    # "els":Lcom/streambundlehtml/select/Elements;
    :cond_3e
    goto :goto_40

    .line 839
    :cond_3f
    return-object v0

    .line 844
    .end local v0    # "idSel":Ljava/lang/String;
    .end local v3    # "doc":Lcom/streambundlehtml/nodes/Document;
    :cond_40
    :goto_40
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/parser/TokenQueue;->escapeCssIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "\\:"

    const-string v4, "|"

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 845
    .local v0, "tagName":Ljava/lang/String;
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 848
    .local v3, "selector":Ljava/lang/StringBuilder;
    new-instance v4, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;

    const-string v5, "."

    invoke-direct {v4, v5}, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;-><init>(Ljava/lang/String;)V

    .line 849
    .local v4, "escapedClasses":Lcom/streambundlehtml/internal/StringUtil$StringJoiner;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_67
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .local v6, "name":Ljava/lang/String;
    invoke-static {v6}, Lcom/streambundlehtml/parser/TokenQueue;->escapeCssIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;->add(Ljava/lang/Object;)Lcom/streambundlehtml/internal/StringUtil$StringJoiner;

    goto :goto_67

    .line 850
    .end local v6    # "name":Ljava/lang/String;
    :cond_7b
    invoke-virtual {v4}, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;->complete()Ljava/lang/String;

    move-result-object v5

    .line 851
    .local v5, "classes":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_8e

    .line 852
    const/16 v6, 0x2e

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 854
    :cond_8e
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v6

    if-eqz v6, :cond_e8

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v6

    instance-of v6, v6, Lcom/streambundlehtml/nodes/Document;

    if-nez v6, :cond_e8

    .line 857
    const-string v6, " > "

    invoke-virtual {v3, v1, v6}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 858
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/streambundlehtml/nodes/Element;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v6

    invoke-virtual {v6}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v6

    if-le v6, v2, :cond_ca

    .line 859
    nop

    .line 860
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->elementSiblingIndex()I

    move-result v6

    add-int/2addr v6, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v6, v2, v1

    .line 859
    const-string v1, ":nth-child(%d)"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 862
    :cond_ca
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->cssSelector()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v3}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 855
    :cond_e8
    invoke-static {v3}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public data()Ljava/lang/String;
    .registers 3

    .line 1479
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1480
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Lcom/streambundlehtml/nodes/Element$0;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/nodes/Element$0;-><init>(Ljava/lang/StringBuilder;)V

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Element;->traverse(Lcom/streambundlehtml/select/NodeVisitor;)Lcom/streambundlehtml/nodes/Element;

    .line 1494
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public dataNodes()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/DataNode;",
            ">;"
        }
    .end annotation

    .line 391
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 392
    .local v0, "dataNodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/DataNode;>;"
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Node;

    .line 393
    .local v2, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v3, v2, Lcom/streambundlehtml/nodes/DataNode;

    if-eqz v3, :cond_21

    .line 394
    move-object v3, v2

    check-cast v3, Lcom/streambundlehtml/nodes/DataNode;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 395
    .end local v2    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_21
    goto :goto_b

    .line 396
    :cond_22
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public dataset()Ljava/util/Map;
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

    .line 259
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->dataset()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "parent"    # Lcom/streambundlehtml/nodes/Node;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1759
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 1760
    .local v0, "clone":Lcom/streambundlehtml/nodes/Element;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Attributes;->clone()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v1

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    iput-object v1, v0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 1761
    new-instance v1, Lcom/streambundlehtml/nodes/Element$NodeList;

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v0, v2}, Lcom/streambundlehtml/nodes/Element$NodeList;-><init>(Lcom/streambundlehtml/nodes/Element;I)V

    iput-object v1, v0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    .line 1762
    iget-object v1, v0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1764
    return-object v0
.end method

.method protected bridge synthetic doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Node;
    .registers 2
    .param p1    # Lcom/streambundlehtml/nodes/Node;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->doClone(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method protected doSetBaseUri(Ljava/lang/String;)V
    .registers 4
    .param p1, "baseUri"    # Ljava/lang/String;

    .line 133
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/nodes/Element;->BaseUriKey:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 134
    return-void
.end method

.method public elementSiblingIndex()I
    .registers 2

    .line 960
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return v0

    .line 961
    :cond_8
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Element;->indexInList(Lcom/streambundlehtml/nodes/Element;Ljava/util/List;)I

    move-result v0

    return v0
.end method

.method public empty()Lcom/streambundlehtml/nodes/Element;
    .registers 2

    .line 804
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 805
    return-object p0
.end method

.method public bridge synthetic empty()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->empty()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public endSourceRange()Lcom/streambundlehtml/nodes/Range;
    .registers 2

    .line 1669
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Range;->of(Lcom/streambundlehtml/nodes/Node;Z)Lcom/streambundlehtml/nodes/Range;

    move-result-object v0

    return-object v0
.end method

.method protected ensureChildNodes()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 98
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    sget-object v1, Lcom/streambundlehtml/nodes/Element;->EmptyNodes:Ljava/util/List;

    if-ne v0, v1, :cond_e

    .line 99
    new-instance v0, Lcom/streambundlehtml/nodes/Element$NodeList;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lcom/streambundlehtml/nodes/Element$NodeList;-><init>(Lcom/streambundlehtml/nodes/Element;I)V

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    .line 101
    :cond_e
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    return-object v0
.end method

.method public expectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 7
    .param p1, "cssQuery"    # Ljava/lang/String;

    .line 467
    nop

    .line 468
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/Selector;->selectFirst(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 469
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_e

    .line 470
    const-string v1, "No elements matched the query \'%s\' on element \'%s\'."

    goto :goto_10

    .line 471
    :cond_e
    const-string v1, "No elements matched the query \'%s\' in the document."

    :goto_10
    nop

    .line 472
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object v2, v3, v4

    .line 467
    invoke-static {v0, v1, v3}, Lcom/streambundlehtml/helper/Validate;->ensureNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public filter(Lcom/streambundlehtml/select/NodeFilter;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "nodeFilter"    # Lcom/streambundlehtml/select/NodeFilter;

    .line 1828
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->filter(Lcom/streambundlehtml/select/NodeFilter;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic filter(Lcom/streambundlehtml/select/NodeFilter;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->filter(Lcom/streambundlehtml/select/NodeFilter;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public firstElementChild()Lcom/streambundlehtml/nodes/Element;
    .registers 7
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 993
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v0

    .line 994
    .local v0, "size":I
    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    .line 995
    :cond_8
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->ensureChildNodes()Ljava/util/List;

    move-result-object v2

    .line 996
    .local v2, "children":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    if-ge v3, v0, :cond_20

    .line 997
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/nodes/Node;

    .line 998
    .local v4, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v5, v4, Lcom/streambundlehtml/nodes/Element;

    if-eqz v5, :cond_1d

    move-object v1, v4

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    return-object v1

    .line 996
    .end local v4    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 1000
    .end local v3    # "i":I
    :cond_20
    return-object v1
.end method

.method public firstElementSibling()Lcom/streambundlehtml/nodes/Element;
    .registers 4

    .line 947
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 948
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    .line 949
    .local v0, "siblings":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_1d

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    goto :goto_1e

    :cond_1d
    move-object v1, p0

    :goto_1e
    return-object v1

    .line 951
    .end local v0    # "siblings":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    :cond_1f
    return-object p0
.end method

.method public forEach(Lcom/streambundlehtml/helper/Consumer;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/streambundlehtml/helper/Consumer<",
            "-",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Element;"
        }
    .end annotation

    .line 1818
    .local p1, "action":Lcom/streambundlehtml/helper/Consumer;, "Lcom/streambundlehtml/helper/Consumer<-Lcom/streambundlehtml/nodes/Element;>;"
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1819
    new-instance v0, Lcom/streambundlehtml/nodes/Element$4;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/nodes/Element$4;-><init>(Lcom/streambundlehtml/helper/Consumer;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 1823
    return-object p0
.end method

.method public forEach(Ljava/util/function/Consumer;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "-",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Element;"
        }
    .end annotation

    .line 1806
    .local p1, "action":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<-Lcom/streambundlehtml/nodes/Element;>;"
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1807
    new-instance v0, Lcom/streambundlehtml/nodes/Element$2;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/nodes/Element$2;-><init>(Ljava/util/function/Consumer;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 1811
    return-object p0
.end method

.method public forEachNode(Ljava/util/function/Consumer;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "-",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Element;"
        }
    .end annotation

    .line 1795
    .local p1, "action":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<-Lcom/streambundlehtml/nodes/Node;>;"
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->forEachNode(Ljava/util/function/Consumer;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic forEachNode(Ljava/util/function/Consumer;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->forEachNode(Ljava/util/function/Consumer;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public getAllElements()Lcom/streambundlehtml/select/Elements;
    .registers 2

    .line 1286
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$AllElements;

    invoke-direct {v0}, Lcom/streambundlehtml/select/Evaluator$AllElements;-><init>()V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementById(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1045
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 1047
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$Id;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$Id;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    .line 1048
    .local v0, "elements":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {v0}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v1

    if-lez v1, :cond_1a

    .line 1049
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    return-object v1

    .line 1051
    :cond_1a
    const/4 v1, 0x0

    return-object v1
.end method

.method public getElementsByAttribute(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .line 1078
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 1079
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1081
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$Attribute;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$Attribute;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeStarting(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "keyPrefix"    # Ljava/lang/String;

    .line 1091
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 1092
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1094
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$AttributeStarting;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$AttributeStarting;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValue(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 1105
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;

    invoke-direct {v0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueContaining(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "match"    # Ljava/lang/String;

    .line 1149
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueContaining;

    invoke-direct {v0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueContaining;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueEnding(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "valueSuffix"    # Ljava/lang/String;

    .line 1138
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueEnding;

    invoke-direct {v0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueEnding;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueMatching(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "regex"    # Ljava/lang/String;

    .line 1172
    :try_start_0
    invoke-static {p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0
    :try_end_4
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_4} :catch_a

    .line 1175
    .local v0, "pattern":Ljava/util/regex/Pattern;
    nop

    .line 1176
    invoke-virtual {p0, p1, v0}, Lcom/streambundlehtml/nodes/Element;->getElementsByAttributeValueMatching(Ljava/lang/String;Ljava/util/regex/Pattern;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    return-object v1

    .line 1173
    .end local v0    # "pattern":Ljava/util/regex/Pattern;
    :catch_a
    move-exception v0

    .line 1174
    .local v0, "e":Ljava/util/regex/PatternSyntaxException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Pattern syntax error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getElementsByAttributeValueMatching(Ljava/lang/String;Ljava/util/regex/Pattern;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/util/regex/Pattern;

    .line 1159
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;

    invoke-direct {v0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;-><init>(Ljava/lang/String;Ljava/util/regex/Pattern;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueNot(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 1116
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueNot;

    invoke-direct {v0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueNot;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueStarting(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "valuePrefix"    # Ljava/lang/String;

    .line 1127
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueStarting;

    invoke-direct {v0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueStarting;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByClass(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .line 1066
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 1068
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$Class;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$Class;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByIndexEquals(I)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "index"    # I

    .line 1203
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$IndexEquals;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$IndexEquals;-><init>(I)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByIndexGreaterThan(I)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "index"    # I

    .line 1194
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$IndexGreaterThan;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$IndexGreaterThan;-><init>(I)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByIndexLessThan(I)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "index"    # I

    .line 1185
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$IndexLessThan;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$IndexLessThan;-><init>(I)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByTag(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "tagName"    # Ljava/lang/String;

    .line 1029
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 1030
    invoke-static {p1}, Lcom/streambundlehtml/internal/Normalizer;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1032
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$Tag;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$Tag;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsContainingOwnText(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "searchText"    # Ljava/lang/String;

    .line 1225
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$ContainsOwnText;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$ContainsOwnText;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsContainingText(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "searchText"    # Ljava/lang/String;

    .line 1214
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$ContainsText;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$ContainsText;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsMatchingOwnText(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 6
    .param p1, "regex"    # Ljava/lang/String;

    .line 1273
    :try_start_0
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0
    :try_end_4
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_4} :catch_a

    .line 1276
    .local v0, "pattern":Ljava/util/regex/Pattern;
    nop

    .line 1277
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->getElementsMatchingOwnText(Ljava/util/regex/Pattern;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    return-object v1

    .line 1274
    .end local v0    # "pattern":Ljava/util/regex/Pattern;
    :catch_a
    move-exception v0

    .line 1275
    .local v0, "e":Ljava/util/regex/PatternSyntaxException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Pattern syntax error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getElementsMatchingOwnText(Ljava/util/regex/Pattern;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "pattern"    # Ljava/util/regex/Pattern;

    .line 1261
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$MatchesOwn;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$MatchesOwn;-><init>(Ljava/util/regex/Pattern;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsMatchingText(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 6
    .param p1, "regex"    # Ljava/lang/String;

    .line 1247
    :try_start_0
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0
    :try_end_4
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_4} :catch_a

    .line 1250
    .local v0, "pattern":Ljava/util/regex/Pattern;
    nop

    .line 1251
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->getElementsMatchingText(Ljava/util/regex/Pattern;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    return-object v1

    .line 1248
    .end local v0    # "pattern":Ljava/util/regex/Pattern;
    :catch_a
    move-exception v0

    .line 1249
    .local v0, "e":Ljava/util/regex/PatternSyntaxException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Pattern syntax error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getElementsMatchingText(Ljava/util/regex/Pattern;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "pattern"    # Ljava/util/regex/Pattern;

    .line 1235
    new-instance v0, Lcom/streambundlehtml/select/Evaluator$Matches;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/select/Evaluator$Matches;-><init>(Ljava/util/regex/Pattern;)V

    invoke-static {v0, p0}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method protected hasAttributes()Z
    .registers 2

    .line 106
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method protected hasChildNodes()Z
    .registers 3

    .line 94
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    sget-object v1, Lcom/streambundlehtml/nodes/Element;->EmptyNodes:Ljava/util/List;

    if-eq v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public hasClass(Ljava/lang/String;)Z
    .registers 12
    .param p1, "className"    # Ljava/lang/String;

    .line 1542
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 1543
    return v1

    .line 1545
    :cond_6
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    const-string v2, "class"

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/nodes/Attributes;->getIgnoreCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1546
    .local v3, "classAttr":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    .line 1547
    .local v0, "len":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    .line 1549
    .local v8, "wantLen":I
    if-eqz v0, :cond_65

    if-ge v0, v8, :cond_1c

    move-object v6, p1

    goto :goto_66

    .line 1554
    :cond_1c
    if-ne v0, v8, :cond_23

    .line 1555
    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    return v1

    .line 1559
    :cond_23
    const/4 v2, 0x0

    .line 1560
    .local v2, "inClass":Z
    const/4 v4, 0x0

    .line 1561
    .local v4, "start":I
    const/4 v5, 0x0

    move v9, v5

    move v5, v4

    .end local v4    # "start":I
    .local v5, "start":I
    .local v9, "i":I
    :goto_28
    if-ge v9, v0, :cond_56

    .line 1562
    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 1563
    if-eqz v2, :cond_49

    .line 1565
    sub-int v4, v9, v5

    if-ne v4, v8, :cond_45

    const/4 v4, 0x1

    const/4 v7, 0x0

    move-object v6, p1

    .end local p1    # "className":Ljava/lang/String;
    .local v6, "className":Ljava/lang/String;
    invoke-virtual/range {v3 .. v8}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result p1

    if-eqz p1, :cond_46

    .line 1566
    const/4 p1, 0x1

    return p1

    .line 1565
    .end local v6    # "className":Ljava/lang/String;
    .restart local p1    # "className":Ljava/lang/String;
    :cond_45
    move-object v6, p1

    .line 1568
    .end local p1    # "className":Ljava/lang/String;
    .restart local v6    # "className":Ljava/lang/String;
    :cond_46
    const/4 p1, 0x0

    move v2, p1

    .end local v2    # "inClass":Z
    .local p1, "inClass":Z
    goto :goto_52

    .line 1563
    .end local v6    # "className":Ljava/lang/String;
    .restart local v2    # "inClass":Z
    .local p1, "className":Ljava/lang/String;
    :cond_49
    move-object v6, p1

    .end local p1    # "className":Ljava/lang/String;
    .restart local v6    # "className":Ljava/lang/String;
    goto :goto_52

    .line 1571
    .end local v6    # "className":Ljava/lang/String;
    .restart local p1    # "className":Ljava/lang/String;
    :cond_4b
    move-object v6, p1

    .end local p1    # "className":Ljava/lang/String;
    .restart local v6    # "className":Ljava/lang/String;
    if-nez v2, :cond_52

    .line 1573
    const/4 p1, 0x1

    .line 1574
    .end local v2    # "inClass":Z
    .local p1, "inClass":Z
    move v2, v9

    move v5, v2

    move v2, p1

    .line 1561
    .end local p1    # "inClass":Z
    .restart local v2    # "inClass":Z
    :cond_52
    :goto_52
    add-int/lit8 v9, v9, 0x1

    move-object p1, v6

    goto :goto_28

    .end local v6    # "className":Ljava/lang/String;
    .local p1, "className":Ljava/lang/String;
    :cond_56
    move-object v6, p1

    .line 1580
    .end local v9    # "i":I
    .end local p1    # "className":Ljava/lang/String;
    .restart local v6    # "className":Ljava/lang/String;
    if-eqz v2, :cond_64

    sub-int p1, v0, v5

    if-ne p1, v8, :cond_64

    .line 1581
    const/4 v4, 0x1

    const/4 v7, 0x0

    invoke-virtual/range {v3 .. v8}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result p1

    return p1

    .line 1584
    :cond_64
    return v1

    .line 1549
    .end local v2    # "inClass":Z
    .end local v5    # "start":I
    .end local v6    # "className":Ljava/lang/String;
    .restart local p1    # "className":Ljava/lang/String;
    :cond_65
    move-object v6, p1

    .line 1550
    .end local p1    # "className":Ljava/lang/String;
    .restart local v6    # "className":Ljava/lang/String;
    :goto_66
    return v1
.end method

.method public hasText()Z
    .registers 3

    .line 1455
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 1456
    .local v0, "hasText":Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v1, Lcom/streambundlehtml/nodes/Element$5;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/nodes/Element$5;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Element;->filter(Lcom/streambundlehtml/select/NodeFilter;)Lcom/streambundlehtml/nodes/Element;

    .line 1466
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    return v1
.end method

.method public html(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 2
    .param p1, "html"    # Ljava/lang/String;

    .line 1741
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->empty()Lcom/streambundlehtml/nodes/Element;

    .line 1742
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->append(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1743
    return-object p0
.end method

.method public html(Ljava/lang/Appendable;)Ljava/lang/Appendable;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Appendable;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 1727
    .local p1, "appendable":Ljava/lang/Appendable;, "TT;"
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 1728
    .local v0, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_17

    .line 1729
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v2, p1}, Lcom/streambundlehtml/nodes/Node;->outerHtml(Ljava/lang/Appendable;)V

    .line 1728
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 1731
    .end local v1    # "i":I
    :cond_17
    return-object p1
.end method

.method public html()Ljava/lang/String;
    .registers 4

    .line 1719
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1720
    .local v0, "accum":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->html(Ljava/lang/Appendable;)Ljava/lang/Appendable;

    .line 1721
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    .line 1722
    .local v1, "html":Ljava/lang/String;
    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->outputSettings(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    goto :goto_1b

    :cond_1a
    move-object v2, v1

    :goto_1b
    return-object v2
.end method

.method public id(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .line 214
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 215
    const-string v0, "id"

    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 216
    return-object p0
.end method

.method public id()Ljava/lang/String;
    .registers 3

    .line 205
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->getIgnoreCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_d
    const-string v0, ""

    :goto_f
    return-object v0
.end method

.method public insertChildren(ILjava/util/Collection;)Lcom/streambundlehtml/nodes/Element;
    .registers 7
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection<",
            "+",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Element;"
        }
    .end annotation

    .line 644
    .local p2, "children":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/streambundlehtml/nodes/Node;>;"
    const-string v0, "Children collection to be inserted must not be null."

    invoke-static {p2, v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 645
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v0

    .line 646
    .local v0, "currentSize":I
    if-gez p1, :cond_e

    add-int/lit8 v1, v0, 0x1

    add-int/2addr p1, v1

    .line 647
    :cond_e
    const/4 v1, 0x0

    if-ltz p1, :cond_15

    if-gt p1, v0, :cond_15

    const/4 v2, 0x1

    goto :goto_16

    :cond_15
    const/4 v2, 0x0

    :goto_16
    const-string v3, "Insert position out of bounds."

    invoke-static {v2, v3}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 649
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 650
    .local v2, "nodes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Node;>;"
    new-array v1, v1, [Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/streambundlehtml/nodes/Node;

    .line 651
    .local v1, "nodeArray":[Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {p0, p1, v1}, Lcom/streambundlehtml/nodes/Element;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 652
    return-object p0
.end method

.method public varargs insertChildren(I[Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;
    .registers 6
    .param p1, "index"    # I
    .param p2, "children"    # [Lcom/streambundlehtml/nodes/Node;

    .line 665
    const-string v0, "Children collection to be inserted must not be null."

    invoke-static {p2, v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 666
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v0

    .line 667
    .local v0, "currentSize":I
    if-gez p1, :cond_e

    add-int/lit8 v1, v0, 0x1

    add-int/2addr p1, v1

    .line 668
    :cond_e
    if-ltz p1, :cond_14

    if-gt p1, v0, :cond_14

    const/4 v1, 0x1

    goto :goto_15

    :cond_14
    const/4 v1, 0x0

    :goto_15
    const-string v2, "Insert position out of bounds."

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 670
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/nodes/Element;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 671
    return-object p0
.end method

.method public is(Lcom/streambundlehtml/select/Evaluator;)Z
    .registers 3
    .param p1, "evaluator"    # Lcom/streambundlehtml/select/Evaluator;

    .line 493
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->root()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {p1, v0, p0}, Lcom/streambundlehtml/select/Evaluator;->matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v0

    return v0
.end method

.method public is(Ljava/lang/String;)Z
    .registers 3
    .param p1, "cssQuery"    # Ljava/lang/String;

    .line 484
    invoke-static {p1}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->is(Lcom/streambundlehtml/select/Evaluator;)Z

    move-result v0

    return v0
.end method

.method public isBlock()Z
    .registers 2

    .line 196
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isBlock()Z

    move-result v0

    return v0
.end method

.method public lastElementChild()Lcom/streambundlehtml/nodes/Element;
    .registers 7
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1011
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v0

    .line 1012
    .local v0, "size":I
    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    .line 1013
    :cond_8
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->ensureChildNodes()Ljava/util/List;

    move-result-object v2

    .line 1014
    .local v2, "children":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    add-int/lit8 v3, v0, -0x1

    .local v3, "i":I
    :goto_e
    if-ltz v3, :cond_21

    .line 1015
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/nodes/Node;

    .line 1016
    .local v4, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v5, v4, Lcom/streambundlehtml/nodes/Element;

    if-eqz v5, :cond_1e

    move-object v1, v4

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    return-object v1

    .line 1014
    .end local v4    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_1e
    add-int/lit8 v3, v3, -0x1

    goto :goto_e

    .line 1018
    .end local v3    # "i":I
    :cond_21
    return-object v1
.end method

.method public lastElementSibling()Lcom/streambundlehtml/nodes/Element;
    .registers 4

    .line 969
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_23

    .line 970
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    .line 971
    .local v0, "siblings":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_21

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    goto :goto_22

    :cond_21
    move-object v1, p0

    :goto_22
    return-object v1

    .line 973
    .end local v0    # "siblings":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    :cond_23
    return-object p0
.end method

.method public nextElementSibling()Lcom/streambundlehtml/nodes/Element;
    .registers 6
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 892
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->parentNode:Lcom/streambundlehtml/nodes/Node;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 893
    :cond_6
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    .line 894
    .local v0, "siblings":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Element;->indexInList(Lcom/streambundlehtml/nodes/Element;Ljava/util/List;)I

    move-result v2

    .line 895
    .local v2, "index":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v4, v2, 0x1

    if-le v3, v4, :cond_23

    .line 896
    add-int/lit8 v1, v2, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    return-object v1

    .line 898
    :cond_23
    return-object v1
.end method

.method public nextElementSiblings()Lcom/streambundlehtml/select/Elements;
    .registers 2

    .line 907
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Element;->nextElementSiblings(Z)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .line 143
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method nodelistChanged()V
    .registers 2

    .line 352
    invoke-super {p0}, Lcom/streambundlehtml/nodes/Node;->nodelistChanged()V

    .line 353
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Element;->shadowChildrenRef:Ljava/lang/ref/WeakReference;

    .line 354
    return-void
.end method

.method public normalName()Ljava/lang/String;
    .registers 2

    .line 163
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->normalName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 7
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1678
    invoke-virtual {p0, p3}, Lcom/streambundlehtml/nodes/Element;->shouldIndent(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 1679
    instance-of v0, p1, Ljava/lang/StringBuilder;

    if-eqz v0, :cond_17

    .line 1680
    move-object v0, p1

    check-cast v0, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_1a

    .line 1681
    invoke-virtual {p0, p1, p2, p3}, Lcom/streambundlehtml/nodes/Element;->indent(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V

    goto :goto_1a

    .line 1683
    :cond_17
    invoke-virtual {p0, p1, p2, p3}, Lcom/streambundlehtml/nodes/Element;->indent(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 1686
    :cond_1a
    :goto_1a
    const/16 v0, 0x3c

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 1687
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v0, p1, p3}, Lcom/streambundlehtml/nodes/Attributes;->html(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 1690
    :cond_30
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/16 v1, 0x3e

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isSelfClosing()Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 1691
    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    move-result-object v0

    sget-object v2, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->html:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    if-ne v0, v2, :cond_56

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_56

    .line 1692
    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_5f

    .line 1694
    :cond_56
    const-string v0, " />"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_5f

    .line 1697
    :cond_5c
    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1698
    :goto_5f
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1702
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isSelfClosing()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_60

    .line 1703
    :cond_11
    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    if-eqz v0, :cond_4d

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4d

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    .line 1704
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_4a

    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->outline()Z

    move-result v0

    if-eqz v0, :cond_49

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_4a

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v1, :cond_49

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/streambundlehtml/nodes/Element;

    if-nez v0, :cond_4a

    :cond_49
    goto :goto_4d

    .line 1706
    :cond_4a
    invoke-virtual {p0, p1, p2, p3}, Lcom/streambundlehtml/nodes/Element;->indent(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 1707
    :cond_4d
    :goto_4d
    const-string v0, "</"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    const/16 v1, 0x3e

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1709
    :goto_60
    return-void
.end method

.method public ownText()Ljava/lang/String;
    .registers 3

    .line 1389
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1390
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Element;->ownText(Ljava/lang/StringBuilder;)V

    .line 1391
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public final parent()Lcom/streambundlehtml/nodes/Element;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 264
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->parentNode:Lcom/streambundlehtml/nodes/Node;

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic parent()Lcom/streambundlehtml/nodes/Node;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public parents()Lcom/streambundlehtml/select/Elements;
    .registers 4

    .line 272
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v0}, Lcom/streambundlehtml/select/Elements;-><init>()V

    .line 273
    .local v0, "parents":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    .line 274
    .local v1, "parent":Lcom/streambundlehtml/nodes/Element;
    :goto_9
    if-eqz v1, :cond_1b

    const-string v2, "#root"

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Element;->isNode(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1b

    .line 275
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    .line 276
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    goto :goto_9

    .line 278
    :cond_1b
    return-object v0
.end method

.method public prepend(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .line 746
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 747
    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, p0, v1}, Lcom/streambundlehtml/parser/Parser;->parseFragmentInput(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 748
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v1, 0x0

    new-array v2, v1, [Lcom/streambundlehtml/nodes/Node;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/streambundlehtml/nodes/Node;

    invoke-virtual {p0, v1, v2}, Lcom/streambundlehtml/nodes/Element;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 749
    return-object p0
.end method

.method public prependChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p1, "child"    # Lcom/streambundlehtml/nodes/Node;

    .line 615
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 617
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/streambundlehtml/nodes/Node;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v1, v0}, Lcom/streambundlehtml/nodes/Element;->addChildren(I[Lcom/streambundlehtml/nodes/Node;)V

    .line 618
    return-object p0
.end method

.method public prependChildren(Ljava/util/Collection;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;)",
            "Lcom/streambundlehtml/nodes/Element;"
        }
    .end annotation

    .line 629
    .local p1, "children":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/streambundlehtml/nodes/Node;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/nodes/Element;->insertChildren(ILjava/util/Collection;)Lcom/streambundlehtml/nodes/Element;

    .line 630
    return-object p0
.end method

.method public prependElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .line 695
    new-instance v0, Lcom/streambundlehtml/nodes/Element;

    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Parser;->settings()Lcom/streambundlehtml/parser/ParseSettings;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v1

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V

    .line 696
    .local v0, "child":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->prependChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 697
    return-object v0
.end method

.method public prependText(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .line 720
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 721
    new-instance v0, Lcom/streambundlehtml/nodes/TextNode;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    .line 722
    .local v0, "node":Lcom/streambundlehtml/nodes/TextNode;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->prependChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 723
    return-object p0
.end method

.method public previousElementSibling()Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 916
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->parentNode:Lcom/streambundlehtml/nodes/Node;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 917
    :cond_6
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    .line 918
    .local v0, "siblings":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Element;->indexInList(Lcom/streambundlehtml/nodes/Element;Ljava/util/List;)I

    move-result v2

    .line 919
    .local v2, "index":I
    if-lez v2, :cond_1d

    .line 920
    add-int/lit8 v1, v2, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    return-object v1

    .line 922
    :cond_1d
    return-object v1
.end method

.method public previousElementSiblings()Lcom/streambundlehtml/select/Elements;
    .registers 2

    .line 931
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Element;->nextElementSiblings(Z)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "attributeKey"    # Ljava/lang/String;

    .line 1780
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public removeClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .line 1608
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1610
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1611
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1612
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->classNames(Ljava/util/Set;)Lcom/streambundlehtml/nodes/Element;

    .line 1614
    return-object p0
.end method

.method public root()Lcom/streambundlehtml/nodes/Element;
    .registers 2

    .line 1785
    invoke-super {p0}, Lcom/streambundlehtml/nodes/Node;->root()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic root()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->root()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public select(Lcom/streambundlehtml/select/Evaluator;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "evaluator"    # Lcom/streambundlehtml/select/Evaluator;

    .line 429
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/Selector;->select(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p1, "cssQuery"    # Ljava/lang/String;

    .line 418
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/Selector;->select(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public selectFirst(Lcom/streambundlehtml/select/Evaluator;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "evaluator"    # Lcom/streambundlehtml/select/Evaluator;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 455
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/Collector;->findFirst(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "cssQuery"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 443
    invoke-static {p1, p0}, Lcom/streambundlehtml/select/Selector;->selectFirst(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public selectXpath(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;
    .registers 4
    .param p1, "xpath"    # Ljava/lang/String;

    .line 545
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    const-class v1, Lcom/streambundlehtml/nodes/Element;

    invoke-static {p1, p0, v1}, Lcom/streambundlehtml/nodes/NodeUtils;->selectXpath(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/select/Elements;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method public selectXpath(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .param p1, "xpath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/streambundlehtml/nodes/Node;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 562
    .local p2, "nodeType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p1, p0, p2}, Lcom/streambundlehtml/nodes/NodeUtils;->selectXpath(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public shallowClone()Lcom/streambundlehtml/nodes/Element;
    .registers 5

    .line 1754
    new-instance v0, Lcom/streambundlehtml/nodes/Element;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-nez v3, :cond_e

    const/4 v3, 0x0

    goto :goto_14

    :cond_e
    iget-object v3, p0, Lcom/streambundlehtml/nodes/Element;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Attributes;->clone()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v3

    :goto_14
    invoke-direct {v0, v1, v2, v3}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    return-object v0
.end method

.method public bridge synthetic shallowClone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->shallowClone()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method shouldIndent(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z
    .registers 3
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 1673
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Element;->isFormatAsBlock(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Element;->isInlineable(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public siblingElements()Lcom/streambundlehtml/select/Elements;
    .registers 5

    .line 871
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->parentNode:Lcom/streambundlehtml/nodes/Node;

    if-nez v0, :cond_b

    .line 872
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/streambundlehtml/select/Elements;-><init>(I)V

    return-object v0

    .line 874
    :cond_b
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->childElementsList()Ljava/util/List;

    move-result-object v0

    .line 875
    .local v0, "elements":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Element;>;"
    new-instance v1, Lcom/streambundlehtml/select/Elements;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-direct {v1, v2}, Lcom/streambundlehtml/select/Elements;-><init>(I)V

    .line 876
    .local v1, "siblings":Lcom/streambundlehtml/select/Elements;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_22
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    .line 877
    .local v3, "el":Lcom/streambundlehtml/nodes/Element;
    if-eq v3, p0, :cond_33

    .line 878
    invoke-virtual {v1, v3}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    .line 877
    .end local v3    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_33
    goto :goto_22

    .line 879
    :cond_34
    return-object v1
.end method

.method public tag()Lcom/streambundlehtml/parser/Tag;
    .registers 2

    .line 186
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    return-object v0
.end method

.method public tagName(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "tagName"    # Ljava/lang/String;

    .line 175
    const-string v0, "tagName"

    invoke-static {p1, v0}, Lcom/streambundlehtml/helper/Validate;->notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    invoke-static {p0}, Lcom/streambundlehtml/nodes/NodeUtils;->parser(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/parser/Parser;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Parser;->settings()Lcom/streambundlehtml/parser/ParseSettings;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    .line 177
    return-object p0
.end method

.method public tagName()Ljava/lang/String;
    .registers 2

    .line 153
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "text"    # Ljava/lang/String;

    .line 1437
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1438
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->empty()Lcom/streambundlehtml/nodes/Element;

    .line 1440
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 1442
    .local v0, "owner":Lcom/streambundlehtml/nodes/Document;
    if-eqz v0, :cond_23

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->parser()Lcom/streambundlehtml/parser/Parser;

    move-result-object v1

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Parser;->isContentForTagData(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 1443
    new-instance v1, Lcom/streambundlehtml/nodes/DataNode;

    invoke-direct {v1, p1}, Lcom/streambundlehtml/nodes/DataNode;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_2b

    .line 1445
    :cond_23
    new-instance v1, Lcom/streambundlehtml/nodes/TextNode;

    invoke-direct {v1, p1}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 1447
    :goto_2b
    return-object p0
.end method

.method public text()Ljava/lang/String;
    .registers 3

    .line 1306
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1307
    .local v0, "accum":Ljava/lang/StringBuilder;
    new-instance v1, Lcom/streambundlehtml/nodes/Element$1;

    invoke-direct {v1, p0, v0}, Lcom/streambundlehtml/nodes/Element$1;-><init>(Lcom/streambundlehtml/nodes/Element;Ljava/lang/StringBuilder;)V

    invoke-static {v1, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 1333
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public textNodes()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/TextNode;",
            ">;"
        }
    .end annotation

    .line 373
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 374
    .local v0, "textNodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/TextNode;>;"
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Node;

    .line 375
    .local v2, "node":Lcom/streambundlehtml/nodes/Node;
    instance-of v3, v2, Lcom/streambundlehtml/nodes/TextNode;

    if-eqz v3, :cond_21

    .line 376
    move-object v3, v2

    check-cast v3, Lcom/streambundlehtml/nodes/TextNode;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    .end local v2    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_21
    goto :goto_b

    .line 378
    :cond_22
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public toggleClass(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p1, "className"    # Ljava/lang/String;

    .line 1623
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1625
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1626
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 1627
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_14

    .line 1629
    :cond_11
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1630
    :goto_14
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->classNames(Ljava/util/Set;)Lcom/streambundlehtml/nodes/Element;

    .line 1632
    return-object p0
.end method

.method public traverse(Lcom/streambundlehtml/select/NodeVisitor;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "nodeVisitor"    # Lcom/streambundlehtml/select/NodeVisitor;

    .line 1790
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->traverse(Lcom/streambundlehtml/select/NodeVisitor;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic traverse(Lcom/streambundlehtml/select/NodeVisitor;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->traverse(Lcom/streambundlehtml/select/NodeVisitor;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method

.method public val(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .line 1652
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "textarea"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1653
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->text(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_15

    .line 1655
    :cond_10
    const-string v0, "value"

    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1656
    :goto_15
    return-object p0
.end method

.method public val()Ljava/lang/String;
    .registers 3

    .line 1640
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "textarea"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1641
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1643
    :cond_11
    const-string v0, "value"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public wholeOwnText()Ljava/lang/String;
    .registers 5

    .line 1367
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1368
    .local v0, "accum":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Element;->childNodeSize()I

    move-result v1

    .line 1369
    .local v1, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    if-ge v2, v1, :cond_19

    .line 1370
    iget-object v3, p0, Lcom/streambundlehtml/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Node;

    .line 1371
    .local v3, "node":Lcom/streambundlehtml/nodes/Node;
    invoke-static {v3, v0}, Lcom/streambundlehtml/nodes/Element;->appendWholeText(Lcom/streambundlehtml/nodes/Node;Ljava/lang/StringBuilder;)V

    .line 1369
    .end local v3    # "node":Lcom/streambundlehtml/nodes/Node;
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 1374
    .end local v2    # "i":I
    :cond_19
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public wholeText()Ljava/lang/String;
    .registers 3

    .line 1344
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1345
    .local v0, "accum":Ljava/lang/StringBuilder;
    new-instance v1, Lcom/streambundlehtml/nodes/Element$3;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/nodes/Element$3;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {v1, p0}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .line 1346
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public wrap(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .line 816
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Node;->wrap(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic wrap(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Element;->wrap(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object p1

    return-object p1
.end method
