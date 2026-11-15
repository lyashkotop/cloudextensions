.class public Lcom/streambundlehtml/parser/HtmlTreeBuilder;
.super Lcom/streambundlehtml/parser/TreeBuilder;
.source "HtmlTreeBuilder.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final MaxScopeSearchDepth:I = 0x64

.field static final TagSearchButton:[Ljava/lang/String;

.field static final TagSearchEndTags:[Ljava/lang/String;

.field static final TagSearchList:[Ljava/lang/String;

.field static final TagSearchSelectScope:[Ljava/lang/String;

.field static final TagSearchSpecial:[Ljava/lang/String;

.field static final TagSearchTableScope:[Ljava/lang/String;

.field static final TagThoroughSearchEndTags:[Ljava/lang/String;

.field static final TagsSearchInScope:[Ljava/lang/String;

.field private static final maxQueueDepth:I = 0x100

.field private static final maxUsedFormattingElements:I = 0xc


# instance fields
.field private baseUriSetFromDoc:Z

.field private contextElement:Lcom/streambundlehtml/nodes/Element;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private emptyEnd:Lcom/streambundlehtml/parser/Token$EndTag;

.field private formElement:Lcom/streambundlehtml/nodes/FormElement;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private formattingElements:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;"
        }
    .end annotation
.end field

.field private fosterInserts:Z

.field private fragmentParsing:Z

.field private framesetOk:Z

.field private headElement:Lcom/streambundlehtml/nodes/Element;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private originalState:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field private pendingTableCharacters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private specificScopeTarget:[Ljava/lang/String;

.field private state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field private tmplInsertMode:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/streambundlehtml/parser/HtmlTreeBuilderState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 80

    .line 27
    nop

    .line 29
    const-string v6, "td"

    const-string v7, "th"

    const-string v0, "applet"

    const-string v1, "caption"

    const-string v2, "html"

    const-string v3, "marquee"

    const-string v4, "object"

    const-string v5, "table"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagsSearchInScope:[Ljava/lang/String;

    .line 30
    const-string v0, "ol"

    const-string v1, "ul"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchList:[Ljava/lang/String;

    .line 31
    const-string v0, "button"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchButton:[Ljava/lang/String;

    .line 32
    const-string v0, "html"

    const-string v1, "table"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchTableScope:[Ljava/lang/String;

    .line 33
    const-string v0, "optgroup"

    const-string v1, "option"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchSelectScope:[Ljava/lang/String;

    .line 34
    const-string v9, "rt"

    const-string v10, "rtc"

    const-string v1, "dd"

    const-string v2, "dt"

    const-string v3, "li"

    const-string v4, "optgroup"

    const-string v5, "option"

    const-string v6, "p"

    const-string v7, "rb"

    const-string v8, "rp"

    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchEndTags:[Ljava/lang/String;

    .line 35
    const-string v17, "thead"

    const-string v18, "tr"

    const-string v1, "caption"

    const-string v2, "colgroup"

    const-string v3, "dd"

    const-string v4, "dt"

    const-string v5, "li"

    const-string v6, "optgroup"

    const-string v7, "option"

    const-string v8, "p"

    const-string v9, "rb"

    const-string v10, "rp"

    const-string v11, "rt"

    const-string v12, "rtc"

    const-string v13, "tbody"

    const-string v14, "td"

    const-string v15, "tfoot"

    const-string v16, "th"

    filled-new-array/range {v1 .. v18}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagThoroughSearchEndTags:[Ljava/lang/String;

    .line 36
    const-string v78, "wbr"

    const-string v79, "xmp"

    const-string v1, "address"

    const-string v2, "applet"

    const-string v3, "area"

    const-string v4, "article"

    const-string v5, "aside"

    const-string v6, "base"

    const-string v7, "basefont"

    const-string v8, "bgsound"

    const-string v9, "blockquote"

    const-string v10, "body"

    const-string v11, "br"

    const-string v12, "button"

    const-string v13, "caption"

    const-string v14, "center"

    const-string v15, "col"

    const-string v16, "colgroup"

    const-string v17, "command"

    const-string v18, "dd"

    const-string v19, "details"

    const-string v20, "dir"

    const-string v21, "div"

    const-string v22, "dl"

    const-string v23, "dt"

    const-string v24, "embed"

    const-string v25, "fieldset"

    const-string v26, "figcaption"

    const-string v27, "figure"

    const-string v28, "footer"

    const-string v29, "form"

    const-string v30, "frame"

    const-string v31, "frameset"

    const-string v32, "h1"

    const-string v33, "h2"

    const-string v34, "h3"

    const-string v35, "h4"

    const-string v36, "h5"

    const-string v37, "h6"

    const-string v38, "head"

    const-string v39, "header"

    const-string v40, "hgroup"

    const-string v41, "hr"

    const-string v42, "html"

    const-string v43, "iframe"

    const-string v44, "img"

    const-string v45, "input"

    const-string v46, "isindex"

    const-string v47, "li"

    const-string v48, "link"

    const-string v49, "listing"

    const-string v50, "marquee"

    const-string v51, "menu"

    const-string v52, "meta"

    const-string v53, "nav"

    const-string v54, "noembed"

    const-string v55, "noframes"

    const-string v56, "noscript"

    const-string v57, "object"

    const-string v58, "ol"

    const-string v59, "p"

    const-string v60, "param"

    const-string v61, "plaintext"

    const-string v62, "pre"

    const-string v63, "script"

    const-string v64, "section"

    const-string v65, "select"

    const-string v66, "style"

    const-string v67, "summary"

    const-string v68, "table"

    const-string v69, "tbody"

    const-string v70, "td"

    const-string v71, "textarea"

    const-string v72, "tfoot"

    const-string v73, "th"

    const-string v74, "thead"

    const-string v75, "title"

    const-string v76, "tr"

    const-string v77, "ul"

    filled-new-array/range {v1 .. v79}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchSpecial:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 27
    invoke-direct {p0}, Lcom/streambundlehtml/parser/TreeBuilder;-><init>()V

    .line 570
    const/4 v0, 0x0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->specificScopeTarget:[Ljava/lang/String;

    return-void
.end method

.method private varargs clearStackToContext([Ljava/lang/String;)V
    .registers 6
    .param p1, "nodeNames"    # [Ljava/lang/String;

    .line 443
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "pos":I
    :goto_8
    if-ltz v0, :cond_31

    .line 444
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 445
    .local v1, "next":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/streambundlehtml/internal/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_31

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "html"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 446
    goto :goto_31

    .line 448
    :cond_29
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 443
    .end local v1    # "next":Lcom/streambundlehtml/nodes/Element;
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 450
    .end local v0    # "pos":I
    :cond_31
    :goto_31
    return-void
.end method

.method private inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 6
    .param p1, "targetName"    # Ljava/lang/String;
    .param p2, "baseTypes"    # [Ljava/lang/String;
    .param p3, "extraTypes"    # [Ljava/lang/String;

    .line 573
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->specificScopeTarget:[Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 574
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->specificScopeTarget:[Ljava/lang/String;

    invoke-direct {p0, v0, p2, p3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inSpecificScope([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private inSpecificScope([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 11
    .param p1, "targetNames"    # [Ljava/lang/String;
    .param p2, "baseTypes"    # [Ljava/lang/String;
    .param p3, "extraTypes"    # [Ljava/lang/String;

    .line 579
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 580
    .local v0, "bottom":I
    const/16 v2, 0x64

    const/4 v3, 0x0

    if-le v0, v2, :cond_10

    add-int/lit8 v2, v0, -0x64

    goto :goto_11

    :cond_10
    const/4 v2, 0x0

    .line 583
    .local v2, "top":I
    :goto_11
    move v4, v0

    .local v4, "pos":I
    :goto_12
    if-lt v4, v2, :cond_3a

    .line 584
    iget-object v5, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v5}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v5

    .line 585
    .local v5, "elName":Ljava/lang/String;
    invoke-static {v5, p1}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_27

    .line 586
    return v1

    .line 587
    :cond_27
    invoke-static {v5, p2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2e

    .line 588
    return v3

    .line 589
    :cond_2e
    if-eqz p3, :cond_37

    invoke-static {v5, p3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_37

    .line 590
    return v3

    .line 583
    .end local v5    # "elName":Ljava/lang/String;
    :cond_37
    add-int/lit8 v4, v4, -0x1

    goto :goto_12

    .line 593
    .end local v4    # "pos":I
    :cond_3a
    return v3
.end method

.method private insert(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/parser/Token;)V
    .registers 4
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "token"    # Lcom/streambundlehtml/parser/Token;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 265
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 266
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 267
    return-void
.end method

.method private insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V
    .registers 5
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "token"    # Lcom/streambundlehtml/parser/Token;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 322
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 323
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Document;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_2f

    .line 324
    :cond_e
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->isFosterInserts()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableFoster:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 325
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertInFosterParent(Lcom/streambundlehtml/nodes/Node;)V

    goto :goto_2f

    .line 327
    :cond_28
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 330
    :goto_2f
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_4c

    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isFormListed()Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 331
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formElement:Lcom/streambundlehtml/nodes/FormElement;

    if-eqz v0, :cond_4c

    .line 332
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formElement:Lcom/streambundlehtml/nodes/FormElement;

    move-object v1, p1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/FormElement;->addElement(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/FormElement;

    .line 334
    :cond_4c
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onNodeInserted(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 335
    return-void
.end method

.method private isSameFormattingElement(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 5
    .param p1, "a"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "b"    # Lcom/streambundlehtml/nodes/Element;

    .line 772
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 774
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const/4 v0, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x0

    .line 772
    :goto_1f
    return v0
.end method

.method private static onStack(Ljava/util/ArrayList;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 8
    .param p1, "element"    # Lcom/streambundlehtml/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;",
            "Lcom/streambundlehtml/nodes/Element;",
            ")Z"
        }
    .end annotation

    .line 360
    .local p0, "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 361
    .local v0, "bottom":I
    const/16 v2, 0x100

    const/4 v3, 0x0

    if-lt v0, v2, :cond_e

    add-int/lit16 v2, v0, -0x100

    goto :goto_f

    :cond_e
    const/4 v2, 0x0

    .line 362
    .local v2, "upper":I
    :goto_f
    move v4, v0

    .local v4, "pos":I
    :goto_10
    if-lt v4, v2, :cond_1e

    .line 363
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    .line 364
    .local v5, "next":Lcom/streambundlehtml/nodes/Element;
    if-ne v5, p1, :cond_1b

    .line 365
    return v1

    .line 362
    .end local v5    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_1b
    add-int/lit8 v4, v4, -0x1

    goto :goto_10

    .line 368
    .end local v4    # "pos":I
    :cond_1e
    return v3
.end method

.method private replaceInQueue(Ljava/util/ArrayList;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V
    .registers 6
    .param p2, "out"    # Lcom/streambundlehtml/nodes/Element;
    .param p3, "in"    # Lcom/streambundlehtml/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;",
            "Lcom/streambundlehtml/nodes/Element;",
            "Lcom/streambundlehtml/nodes/Element;",
            ")V"
        }
    .end annotation

    .line 474
    .local p1, "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    .line 475
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v1, 0x1

    goto :goto_a

    :cond_9
    const/4 v1, 0x0

    :goto_a
    invoke-static {v1}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 476
    invoke-virtual {p1, v0, p3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 477
    return-void
.end method


# virtual methods
.method aboveOnStack(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;
    .registers 6
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 453
    nop

    .line 454
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "pos":I
    :goto_9
    if-ltz v0, :cond_23

    .line 455
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 456
    .local v1, "next":Lcom/streambundlehtml/nodes/Element;
    if-ne v1, p1, :cond_20

    .line 457
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    return-object v2

    .line 454
    .end local v1    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_20
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    .line 460
    .end local v0    # "pos":I
    :cond_23
    const/4 v0, 0x0

    return-object v0
.end method

.method checkActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V
    .registers 8
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Element;

    .line 751
    const/4 v0, 0x0

    .line 752
    .local v0, "numSeen":I
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 753
    .local v1, "size":I
    add-int/lit8 v2, v1, -0xc

    .local v2, "ceil":I
    if-gez v2, :cond_e

    const/4 v2, 0x0

    .line 755
    :cond_e
    move v3, v1

    .local v3, "pos":I
    :goto_f
    if-lt v3, v2, :cond_30

    .line 756
    iget-object v4, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/nodes/Element;

    .line 757
    .local v4, "el":Lcom/streambundlehtml/nodes/Element;
    if-nez v4, :cond_1c

    .line 758
    goto :goto_30

    .line 760
    :cond_1c
    invoke-direct {p0, p1, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->isSameFormattingElement(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v5

    if-eqz v5, :cond_24

    .line 761
    add-int/lit8 v0, v0, 0x1

    .line 763
    :cond_24
    const/4 v5, 0x3

    if-ne v0, v5, :cond_2d

    .line 764
    iget-object v5, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 765
    goto :goto_30

    .line 755
    .end local v4    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_2d
    add-int/lit8 v3, v3, -0x1

    goto :goto_f

    .line 768
    .end local v3    # "pos":I
    :cond_30
    :goto_30
    return-void
.end method

.method clearFormattingElementsToLastMarker()V
    .registers 2

    .line 820
    nop

    :goto_1
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_11

    .line 821
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->removeLastFormattingElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 822
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    if-nez v0, :cond_10

    .line 823
    goto :goto_11

    .line 824
    .end local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_10
    goto :goto_1

    .line 825
    :cond_11
    :goto_11
    return-void
.end method

.method clearStackToTableBodyContext()V
    .registers 5

    .line 435
    const-string v0, "thead"

    const-string v1, "template"

    const-string v2, "tbody"

    const-string v3, "tfoot"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToContext([Ljava/lang/String;)V

    .line 436
    return-void
.end method

.method clearStackToTableContext()V
    .registers 3

    .line 431
    const-string v0, "table"

    const-string v1, "template"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToContext([Ljava/lang/String;)V

    .line 432
    return-void
.end method

.method clearStackToTableRowContext()V
    .registers 3

    .line 439
    const-string v0, "tr"

    const-string v1, "template"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToContext([Ljava/lang/String;)V

    .line 440
    return-void
.end method

.method closeElement(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .line 702
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 703
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 704
    :cond_18
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 705
    return-void
.end method

.method currentTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    .registers 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 900
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_19

    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    return-object v0
.end method

.method defaultSettings()Lcom/streambundlehtml/parser/ParseSettings;
    .registers 2

    .line 64
    sget-object v0, Lcom/streambundlehtml/parser/ParseSettings;->htmlDefault:Lcom/streambundlehtml/parser/ParseSettings;

    return-object v0
.end method

.method error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V
    .registers 9
    .param p1, "state"    # Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 224
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->parser:Lcom/streambundlehtml/parser/Parser;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Parser;->getErrors()Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 225
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->parser:Lcom/streambundlehtml/parser/Parser;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Parser;->getErrors()Lcom/streambundlehtml/parser/ParseErrorList;

    move-result-object v0

    new-instance v1, Lcom/streambundlehtml/parser/ParseError;

    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    iget-object v3, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    .line 226
    invoke-virtual {v3}, Lcom/streambundlehtml/parser/Token;->tokenType()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    const/4 v3, 0x1

    aput-object v4, v5, v3

    const/4 v3, 0x2

    aput-object p1, v5, v3

    const-string v3, "Unexpected %s token [%s] when in state [%s]"

    invoke-direct {v1, v2, v3, v5}, Lcom/streambundlehtml/parser/ParseError;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 225
    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 227
    :cond_32
    return-void
.end method

.method framesetOk(Z)V
    .registers 2
    .param p1, "framesetOk"    # Z

    .line 192
    iput-boolean p1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk:Z

    .line 193
    return-void
.end method

.method framesetOk()Z
    .registers 2

    .line 196
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk:Z

    return v0
.end method

.method generateImpliedEndTags()V
    .registers 2

    .line 687
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->generateImpliedEndTags(Z)V

    .line 688
    return-void
.end method

.method generateImpliedEndTags(Ljava/lang/String;)V
    .registers 4
    .param p1, "excludeTag"    # Ljava/lang/String;

    .line 679
    nop

    :goto_1
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchEndTags:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 680
    if-eqz p1, :cond_1a

    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 681
    goto :goto_1e

    .line 682
    :cond_1a
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    goto :goto_1

    .line 684
    :cond_1e
    :goto_1e
    return-void
.end method

.method generateImpliedEndTags(Z)V
    .registers 4
    .param p1, "thorough"    # Z

    .line 695
    if-eqz p1, :cond_5

    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagThoroughSearchEndTags:[Ljava/lang/String;

    goto :goto_7

    :cond_5
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchEndTags:[Ljava/lang/String;

    .line 696
    .local v0, "search":[Ljava/lang/String;
    :goto_7
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 697
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    goto :goto_7

    .line 699
    :cond_19
    return-void
.end method

.method getActiveFormattingElement(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "nodeName"    # Ljava/lang/String;

    .line 842
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "pos":I
    :goto_8
    if-ltz v0, :cond_23

    .line 843
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 844
    .local v1, "next":Lcom/streambundlehtml/nodes/Element;
    if-nez v1, :cond_15

    .line 845
    goto :goto_23

    .line 846
    :cond_15
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 847
    return-object v1

    .line 842
    .end local v1    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_20
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 849
    .end local v0    # "pos":I
    :cond_23
    :goto_23
    const/4 v0, 0x0

    return-object v0
.end method

.method getBaseUri()Ljava/lang/String;
    .registers 2

    .line 204
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    return-object v0
.end method

.method getDocument()Lcom/streambundlehtml/nodes/Document;
    .registers 2

    .line 200
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    return-object v0
.end method

.method getFormElement()Lcom/streambundlehtml/nodes/FormElement;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 652
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formElement:Lcom/streambundlehtml/nodes/FormElement;

    return-object v0
.end method

.method getFromStack(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 7
    .param p1, "elName"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 373
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 374
    .local v0, "bottom":I
    const/16 v1, 0x100

    if-lt v0, v1, :cond_f

    add-int/lit16 v1, v0, -0x100

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    .line 375
    .local v1, "upper":I
    :goto_10
    move v2, v0

    .local v2, "pos":I
    :goto_11
    if-lt v2, v1, :cond_29

    .line 376
    iget-object v3, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    .line 377
    .local v3, "next":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26

    .line 378
    return-object v3

    .line 375
    .end local v3    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_26
    add-int/lit8 v2, v2, -0x1

    goto :goto_11

    .line 381
    .end local v2    # "pos":I
    :cond_29
    const/4 v2, 0x0

    return-object v2
.end method

.method getHeadElement()Lcom/streambundlehtml/nodes/Element;
    .registers 2

    .line 640
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->headElement:Lcom/streambundlehtml/nodes/Element;

    return-object v0
.end method

.method getPendingTableCharacters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 664
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    return-object v0
.end method

.method getStack()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;"
        }
    .end annotation

    .line 347
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    return-object v0
.end method

.method inButtonScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .line 615
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchButton:[Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inListItemScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .line 611
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchList:[Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .line 601
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inScope(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 4
    .param p1, "targetName"    # Ljava/lang/String;
    .param p2, "extras"    # [Ljava/lang/String;

    .line 605
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagsSearchInScope:[Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inScope([Ljava/lang/String;)Z
    .registers 4
    .param p1, "targetNames"    # [Ljava/lang/String;

    .line 597
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagsSearchInScope:[Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inSpecificScope([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inSelectScope(Ljava/lang/String;)Z
    .registers 8
    .param p1, "targetName"    # Ljava/lang/String;

    .line 623
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .local v0, "pos":I
    :goto_8
    const/4 v2, 0x0

    if-ltz v0, :cond_2a

    .line 624
    iget-object v3, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/nodes/Element;

    .line 625
    .local v3, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v4

    .line 626
    .local v4, "elName":Ljava/lang/String;
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 627
    return v1

    .line 628
    :cond_1e
    sget-object v5, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchSelectScope:[Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_27

    .line 629
    return v2

    .line 623
    .end local v3    # "el":Lcom/streambundlehtml/nodes/Element;
    .end local v4    # "elName":Ljava/lang/String;
    :cond_27
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 631
    .end local v0    # "pos":I
    :cond_2a
    const-string v0, "Should not be reachable"

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->fail(Ljava/lang/String;)V

    .line 632
    return v2
.end method

.method inTableScope(Ljava/lang/String;)Z
    .registers 4
    .param p1, "targetName"    # Ljava/lang/String;

    .line 619
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchTableScope:[Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected initialiseParse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)V
    .registers 6
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation runtime Ljavax/annotation/ParametersAreNonnullByDefault;
    .end annotation

    .line 74
    invoke-super {p0, p1, p2, p3}, Lcom/streambundlehtml/parser/TreeBuilder;->initialiseParse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)V

    .line 77
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->Initial:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->originalState:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 79
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    .line 80
    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->headElement:Lcom/streambundlehtml/nodes/Element;

    .line 81
    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formElement:Lcom/streambundlehtml/nodes/FormElement;

    .line 82
    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->contextElement:Lcom/streambundlehtml/nodes/Element;

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    .line 86
    new-instance v0, Lcom/streambundlehtml/parser/Token$EndTag;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$EndTag;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->emptyEnd:Lcom/streambundlehtml/parser/Token$EndTag;

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->framesetOk:Z

    .line 88
    iput-boolean v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->fosterInserts:Z

    .line 89
    iput-boolean v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->fragmentParsing:Z

    .line 90
    return-void
.end method

.method insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;
    .registers 6
    .param p1, "startTag"    # Lcom/streambundlehtml/parser/Token$StartTag;

    .line 231
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p1, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_25

    .line 232
    iget-object v0, p1, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->deduplicate(Lcom/streambundlehtml/parser/ParseSettings;)I

    move-result v0

    .line 233
    .local v0, "dupes":I
    if-lez v0, :cond_25

    .line 234
    iget-object v1, p1, Lcom/streambundlehtml/parser/Token$StartTag;->normalName:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const-string v1, "Dropped duplicate attribute(s) in tag [%s]"

    invoke-virtual {p0, v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    .end local v0    # "dupes":I
    :cond_25
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->isSelfClosing()Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 241
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 242
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 243
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 244
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->emptyEnd:Lcom/streambundlehtml/parser/Token$EndTag;

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$EndTag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v2

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/Token$Tag;->name(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Lcom/streambundlehtml/parser/Token;)V

    .line 245
    return-object v0

    .line 248
    .end local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_4f
    new-instance v0, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {p0, v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v1

    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    iget-object v3, p1, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeAttributes(Lcom/streambundlehtml/nodes/Attributes;)Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 249
    .restart local v0    # "el":Lcom/streambundlehtml/nodes/Element;
    invoke-direct {p0, v0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/parser/Token;)V

    .line 250
    return-object v0
.end method

.method insert(Lcom/streambundlehtml/nodes/Element;)V
    .registers 3
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;

    .line 260
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 261
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    return-void
.end method

.method insert(Lcom/streambundlehtml/parser/Token$Character;)V
    .registers 6
    .param p1, "characterToken"    # Lcom/streambundlehtml/parser/Token$Character;

    .line 306
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 307
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v1

    .line 308
    .local v1, "tagName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v2

    .line 310
    .local v2, "data":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Character;->isCData()Z

    move-result v3

    if-eqz v3, :cond_18

    .line 311
    new-instance v3, Lcom/streambundlehtml/nodes/CDataNode;

    invoke-direct {v3, v2}, Lcom/streambundlehtml/nodes/CDataNode;-><init>(Ljava/lang/String;)V

    .local v3, "node":Lcom/streambundlehtml/nodes/Node;
    goto :goto_29

    .line 312
    .end local v3    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_18
    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->isContentForTagData(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 313
    new-instance v3, Lcom/streambundlehtml/nodes/DataNode;

    invoke-direct {v3, v2}, Lcom/streambundlehtml/nodes/DataNode;-><init>(Ljava/lang/String;)V

    .restart local v3    # "node":Lcom/streambundlehtml/nodes/Node;
    goto :goto_29

    .line 315
    .end local v3    # "node":Lcom/streambundlehtml/nodes/Node;
    :cond_24
    new-instance v3, Lcom/streambundlehtml/nodes/TextNode;

    invoke-direct {v3, v2}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    .line 316
    .restart local v3    # "node":Lcom/streambundlehtml/nodes/Node;
    :goto_29
    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 317
    invoke-virtual {p0, v3, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onNodeInserted(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 318
    return-void
.end method

.method insert(Lcom/streambundlehtml/parser/Token$Comment;)V
    .registers 4
    .param p1, "commentToken"    # Lcom/streambundlehtml/parser/Token$Comment;

    .line 300
    new-instance v0, Lcom/streambundlehtml/nodes/Comment;

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$Comment;->getData()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/nodes/Comment;-><init>(Ljava/lang/String;)V

    .line 301
    .local v0, "comment":Lcom/streambundlehtml/nodes/Comment;
    invoke-direct {p0, v0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 302
    return-void
.end method

.method insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;
    .registers 8
    .param p1, "startTag"    # Lcom/streambundlehtml/parser/Token$StartTag;

    .line 270
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    .line 271
    .local v0, "tag":Lcom/streambundlehtml/parser/Tag;
    new-instance v1, Lcom/streambundlehtml/nodes/Element;

    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    iget-object v3, p1, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeAttributes(Lcom/streambundlehtml/nodes/Attributes;)Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 272
    .local v1, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-direct {p0, v1, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 273
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_42

    .line 274
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isKnownTag()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 275
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_42

    .line 276
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->normalName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    const-string v3, "Tag [%s] cannot be self closing; not a void tag"

    invoke-virtual {v2, v3, v4}, Lcom/streambundlehtml/parser/Tokeniser;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_42

    .line 279
    :cond_3f
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->setSelfClosing()Lcom/streambundlehtml/parser/Tag;

    .line 281
    :cond_42
    :goto_42
    return-object v1
.end method

.method insertForm(Lcom/streambundlehtml/parser/Token$StartTag;ZZ)Lcom/streambundlehtml/nodes/FormElement;
    .registers 8
    .param p1, "startTag"    # Lcom/streambundlehtml/parser/Token$StartTag;
    .param p2, "onStack"    # Z
    .param p3, "checkTemplateStack"    # Z

    .line 285
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    .line 286
    .local v0, "tag":Lcom/streambundlehtml/parser/Tag;
    new-instance v1, Lcom/streambundlehtml/nodes/FormElement;

    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    iget-object v3, p1, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeAttributes(Lcom/streambundlehtml/nodes/Attributes;)Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3, v2}, Lcom/streambundlehtml/nodes/FormElement;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 287
    .local v1, "el":Lcom/streambundlehtml/nodes/FormElement;
    if-eqz p3, :cond_26

    .line 288
    const-string v2, "template"

    invoke-virtual {p0, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_29

    .line 289
    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->setFormElement(Lcom/streambundlehtml/nodes/FormElement;)V

    goto :goto_29

    .line 291
    :cond_26
    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->setFormElement(Lcom/streambundlehtml/nodes/FormElement;)V

    .line 293
    :cond_29
    :goto_29
    invoke-direct {p0, v1, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertNode(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 294
    if-eqz p2, :cond_33

    .line 295
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    :cond_33
    return-object v1
.end method

.method insertInFosterParent(Lcom/streambundlehtml/nodes/Node;)V
    .registers 6
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Node;

    .line 862
    const-string v0, "table"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 863
    .local v0, "lastTable":Lcom/streambundlehtml/nodes/Element;
    const/4 v1, 0x0

    .line 864
    .local v1, "isLastTableParent":Z
    if-eqz v0, :cond_1a

    .line 865
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    if-eqz v2, :cond_15

    .line 866
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    .line 867
    .local v2, "fosterParent":Lcom/streambundlehtml/nodes/Element;
    const/4 v1, 0x1

    goto :goto_23

    .line 869
    .end local v2    # "fosterParent":Lcom/streambundlehtml/nodes/Element;
    :cond_15
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->aboveOnStack(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v2

    .restart local v2    # "fosterParent":Lcom/streambundlehtml/nodes/Element;
    goto :goto_23

    .line 871
    .end local v2    # "fosterParent":Lcom/streambundlehtml/nodes/Element;
    :cond_1a
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 874
    .restart local v2    # "fosterParent":Lcom/streambundlehtml/nodes/Element;
    :goto_23
    if-eqz v1, :cond_2c

    .line 875
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 876
    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Element;->before(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_2f

    .line 879
    :cond_2c
    invoke-virtual {v2, p1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 880
    :goto_2f
    return-void
.end method

.method insertMarkerToFormattingElements()V
    .registers 3

    .line 857
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 858
    return-void
.end method

.method insertOnStackAfter(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V
    .registers 6
    .param p1, "after"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "in"    # Lcom/streambundlehtml/nodes/Element;

    .line 464
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    .line 465
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_b

    const/4 v1, 0x1

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    invoke-static {v1}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 466
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 467
    return-void
.end method

.method insertStartTag(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "startTagName"    # Ljava/lang/String;

    .line 254
    new-instance v0, Lcom/streambundlehtml/nodes/Element;

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {p0, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V

    .line 255
    .local v0, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/nodes/Element;)V

    .line 256
    return-object v0
.end method

.method protected isContentForTagData(Ljava/lang/String;)Z
    .registers 3
    .param p1, "normalName"    # Ljava/lang/String;

    .line 913
    const-string v0, "script"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "style"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x0

    goto :goto_13

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0
.end method

.method isFosterInserts()Z
    .registers 2

    .line 644
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->fosterInserts:Z

    return v0
.end method

.method isFragmentParsing()Z
    .registers 2

    .line 220
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->fragmentParsing:Z

    return v0
.end method

.method isInActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)Z
    .registers 3
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;

    .line 838
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/util/ArrayList;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v0

    return v0
.end method

.method isSpecial(Lcom/streambundlehtml/nodes/Element;)Z
    .registers 4
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;

    .line 710
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    .line 711
    .local v0, "name":Ljava/lang/String;
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->TagSearchSpecial:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method lastFormattingElement()Lcom/streambundlehtml/nodes/Element;
    .registers 3

    .line 715
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_19

    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    return-object v0
.end method

.method markInsertionMode()V
    .registers 2

    .line 184
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->originalState:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 185
    return-void
.end method

.method maybeSetBaseUri(Lcom/streambundlehtml/nodes/Element;)V
    .registers 4
    .param p1, "base"    # Lcom/streambundlehtml/nodes/Element;

    .line 208
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    if-eqz v0, :cond_5

    .line 209
    return-void

    .line 211
    :cond_5
    const-string v0, "href"

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, "href":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1b

    .line 213
    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    .line 214
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    .line 215
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/nodes/Document;->setBaseUri(Ljava/lang/String;)V

    .line 217
    :cond_1b
    return-void
.end method

.method newInstance()Lcom/streambundlehtml/parser/HtmlTreeBuilder;
    .registers 2

    .line 69
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;-><init>()V

    return-object v0
.end method

.method bridge synthetic newInstance()Lcom/streambundlehtml/parser/TreeBuilder;
    .registers 2

    .line 27
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->newInstance()Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    move-result-object v0

    return-object v0
.end method

.method newPendingTableCharacters()V
    .registers 2

    .line 660
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    .line 661
    return-void
.end method

.method onStack(Lcom/streambundlehtml/nodes/Element;)Z
    .registers 3
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;

    .line 351
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/util/ArrayList;Lcom/streambundlehtml/nodes/Element;)Z

    move-result v0

    return v0
.end method

.method onStack(Ljava/lang/String;)Z
    .registers 3
    .param p1, "elName"    # Ljava/lang/String;

    .line 355
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method originalState()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    .registers 2

    .line 188
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->originalState:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    return-object v0
.end method

.method parseFragment(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Ljava/util/List;
    .registers 10
    .param p1, "inputFragment"    # Ljava/lang/String;
    .param p2, "context"    # Lcom/streambundlehtml/nodes/Element;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "baseUri"    # Ljava/lang/String;
    .param p4, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/nodes/Element;",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/parser/Parser;",
            ")",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Node;",
            ">;"
        }
    .end annotation

    .line 94
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->Initial:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    iput-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 95
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p3, p4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->initialiseParse(Ljava/io/Reader;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)V

    .line 96
    iput-object p2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->contextElement:Lcom/streambundlehtml/nodes/Element;

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->fragmentParsing:Z

    .line 98
    const/4 v1, 0x0

    .line 100
    .local v1, "root":Lcom/streambundlehtml/nodes/Element;
    const/4 v2, -0x1

    if-eqz p2, :cond_112

    .line 101
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v3

    if-eqz v3, :cond_28

    .line 102
    iget-object v3, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v4

    invoke-virtual {v4}, Lcom/streambundlehtml/nodes/Document;->quirksMode()Lcom/streambundlehtml/nodes/Document$QuirksMode;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/nodes/Document;->quirksMode(Lcom/streambundlehtml/nodes/Document$QuirksMode;)Lcom/streambundlehtml/nodes/Document;

    .line 105
    :cond_28
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v3

    .line 106
    .local v3, "contextTag":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_130

    goto/16 :goto_a6

    :sswitch_35
    const-string v0, "noembed"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/4 v0, 0x3

    goto/16 :goto_a7

    :sswitch_40
    const-string v0, "plaintext"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/16 v0, 0x9

    goto :goto_a7

    :sswitch_4b
    const-string v0, "noscript"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/16 v0, 0x8

    goto :goto_a7

    :sswitch_56
    const-string v0, "noframes"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/4 v0, 0x4

    goto :goto_a7

    :sswitch_60
    const-string v0, "title"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/4 v0, 0x0

    goto :goto_a7

    :sswitch_6a
    const-string v0, "style"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/4 v0, 0x5

    goto :goto_a7

    :sswitch_74
    const-string v0, "xml"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/4 v0, 0x6

    goto :goto_a7

    :sswitch_7e
    const-string v0, "script"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/4 v0, 0x7

    goto :goto_a7

    :sswitch_88
    const-string v4, "textarea"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a6

    goto :goto_a7

    :sswitch_91
    const-string v0, "iframe"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/4 v0, 0x2

    goto :goto_a7

    :sswitch_9b
    const-string v0, "template"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    const/16 v0, 0xa

    goto :goto_a7

    :cond_a6
    :goto_a6
    const/4 v0, -0x1

    :goto_a7
    packed-switch v0, :pswitch_data_15e

    .line 132
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v4, Lcom/streambundlehtml/parser/TokeniserState;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v4}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_e7

    .line 128
    :pswitch_b2
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v4, Lcom/streambundlehtml/parser/TokeniserState;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v4}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 129
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTemplate:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pushTemplateMode(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 130
    goto :goto_e7

    .line 125
    :pswitch_bf
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v4, Lcom/streambundlehtml/parser/TokeniserState;->PLAINTEXT:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v4}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 126
    goto :goto_e7

    .line 122
    :pswitch_c7
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v4, Lcom/streambundlehtml/parser/TokeniserState;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v4}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 123
    goto :goto_e7

    .line 119
    :pswitch_cf
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v4, Lcom/streambundlehtml/parser/TokeniserState;->ScriptData:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v4}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 120
    goto :goto_e7

    .line 116
    :pswitch_d7
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v4, Lcom/streambundlehtml/parser/TokeniserState;->Rawtext:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v4}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 117
    goto :goto_e7

    .line 109
    :pswitch_df
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v4, Lcom/streambundlehtml/parser/TokeniserState;->Rcdata:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v4}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 110
    nop

    .line 134
    :goto_e7
    new-instance v0, Lcom/streambundlehtml/nodes/Element;

    iget-object v4, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {p0, v3, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v4

    invoke-direct {v0, v4, p3}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;)V

    move-object v1, v0

    .line 135
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Document;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 136
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->resetInsertionMode()Z

    .line 141
    move-object v0, p2

    .line 142
    .local v0, "formSearch":Lcom/streambundlehtml/nodes/Element;
    :goto_101
    if-eqz v0, :cond_112

    .line 143
    instance-of v4, v0, Lcom/streambundlehtml/nodes/FormElement;

    if-eqz v4, :cond_10d

    .line 144
    move-object v4, v0

    check-cast v4, Lcom/streambundlehtml/nodes/FormElement;

    iput-object v4, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formElement:Lcom/streambundlehtml/nodes/FormElement;

    .line 145
    goto :goto_112

    .line 147
    :cond_10d
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    goto :goto_101

    .line 151
    .end local v0    # "formSearch":Lcom/streambundlehtml/nodes/Element;
    .end local v3    # "contextTag":Ljava/lang/String;
    :cond_112
    :goto_112
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->runParser()V

    .line 152
    if-eqz p2, :cond_129

    .line 155
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->siblingNodes()Ljava/util/List;

    move-result-object v0

    .line 156
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_124

    .line 157
    invoke-virtual {v1, v2, v0}, Lcom/streambundlehtml/nodes/Element;->insertChildren(ILjava/util/Collection;)Lcom/streambundlehtml/nodes/Element;

    .line 158
    :cond_124
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 161
    .end local v0    # "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    :cond_129
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Document;->childNodes()Ljava/util/List;

    move-result-object v0

    return-object v0

    :sswitch_data_130
    .sparse-switch
        -0x4ec53386 -> :sswitch_9b
        -0x47007d5c -> :sswitch_91
        -0x3bcc48c6 -> :sswitch_88
        -0x361a2f35 -> :sswitch_7e
        0x1d017 -> :sswitch_74
        0x68b1db1 -> :sswitch_6a
        0x6942258 -> :sswitch_60
        0x47177da7 -> :sswitch_56
        0x5c7ac9cc -> :sswitch_4b
        0x759d29f7 -> :sswitch_40
        0x7e19b1b8 -> :sswitch_35
    .end sparse-switch

    :pswitch_data_15e
    .packed-switch 0x0
        :pswitch_df
        :pswitch_df
        :pswitch_d7
        :pswitch_d7
        :pswitch_d7
        :pswitch_d7
        :pswitch_d7
        :pswitch_cf
        :pswitch_c7
        :pswitch_bf
        :pswitch_b2
    .end packed-switch
.end method

.method pop()Lcom/streambundlehtml/nodes/Element;
    .registers 4

    .line 338
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 339
    .local v0, "size":I
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    return-object v1
.end method

.method popStackToBefore(Ljava/lang/String;)V
    .registers 5
    .param p1, "elName"    # Ljava/lang/String;

    .line 420
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "pos":I
    :goto_8
    if-ltz v0, :cond_25

    .line 421
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 422
    .local v1, "next":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 423
    goto :goto_25

    .line 425
    :cond_1d
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 420
    .end local v1    # "next":Lcom/streambundlehtml/nodes/Element;
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 428
    .end local v0    # "pos":I
    :cond_25
    :goto_25
    return-void
.end method

.method popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;
    .registers 5
    .param p1, "elName"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 397
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "pos":I
    :goto_8
    if-ltz v0, :cond_30

    .line 398
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 399
    .local v1, "el":Lcom/streambundlehtml/nodes/Element;
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 400
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 401
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    instance-of v2, v2, Lcom/streambundlehtml/parser/Token$EndTag;

    if-eqz v2, :cond_2c

    .line 402
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    invoke-virtual {p0, v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onNodeClosed(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 403
    :cond_2c
    return-object v1

    .line 397
    .end local v1    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_2d
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 406
    .end local v0    # "pos":I
    :cond_30
    const/4 v0, 0x0

    return-object v0
.end method

.method varargs popStackToClose([Ljava/lang/String;)V
    .registers 5
    .param p1, "elNames"    # [Ljava/lang/String;

    .line 411
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "pos":I
    :goto_8
    if-ltz v0, :cond_25

    .line 412
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 413
    .local v1, "next":Lcom/streambundlehtml/nodes/Element;
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 414
    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 415
    goto :goto_25

    .line 411
    .end local v1    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_22
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 417
    .end local v0    # "pos":I
    :cond_25
    :goto_25
    return-void
.end method

.method popTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    .registers 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 888
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_19

    .line 889
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    return-object v0

    .line 891
    :cond_19
    const/4 v0, 0x0

    return-object v0
.end method

.method positionOfElement(Lcom/streambundlehtml/nodes/Element;)I
    .registers 4
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;

    .line 719
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_15

    .line 720
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-ne p1, v1, :cond_12

    .line 721
    return v0

    .line 719
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 723
    .end local v0    # "i":I
    :cond_15
    const/4 v0, -0x1

    return v0
.end method

.method protected process(Lcom/streambundlehtml/parser/Token;)Z
    .registers 3
    .param p1, "token"    # Lcom/streambundlehtml/parser/Token;

    .line 166
    iput-object p1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    .line 167
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, p1, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0
.end method

.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z
    .registers 4
    .param p1, "token"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "state"    # Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 171
    iput-object p1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    .line 172
    invoke-virtual {p2, p1, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic processStartTag(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Z
    .registers 3

    .line 27
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/parser/TreeBuilder;->processStartTag(Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)Z

    move-result p1

    return p1
.end method

.method push(Lcom/streambundlehtml/nodes/Element;)V
    .registers 3
    .param p1, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 343
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 344
    return-void
.end method

.method pushActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V
    .registers 3
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Element;

    .line 736
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->checkActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 737
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 738
    return-void
.end method

.method pushTemplateMode(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V
    .registers 3
    .param p1, "state"    # Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 884
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 885
    return-void
.end method

.method pushWithBookmark(Lcom/streambundlehtml/nodes/Element;I)V
    .registers 5
    .param p1, "in"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "bookmark"    # I

    .line 741
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->checkActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V

    .line 744
    :try_start_3
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3 .. :try_end_8} :catch_9

    .line 747
    goto :goto_f

    .line 745
    :catch_9
    move-exception v0

    .line 746
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 748
    .end local v0    # "e":Ljava/lang/IndexOutOfBoundsException;
    :goto_f
    return-void
.end method

.method reconstructFormattingElements()V
    .registers 11

    .line 779
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x100

    if-le v0, v1, :cond_b

    .line 780
    return-void

    .line 781
    :cond_b
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->lastFormattingElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 782
    .local v0, "last":Lcom/streambundlehtml/nodes/Element;
    if-eqz v0, :cond_76

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v1

    if-nez v1, :cond_76

    .line 785
    move-object v1, v0

    .line 786
    .local v1, "entry":Lcom/streambundlehtml/nodes/Element;
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 787
    .local v2, "size":I
    add-int/lit8 v3, v2, -0xc

    .local v3, "ceil":I
    if-gez v3, :cond_23

    const/4 v3, 0x0

    .line 788
    :cond_23
    add-int/lit8 v4, v2, -0x1

    .line 789
    .local v4, "pos":I
    const/4 v5, 0x0

    .line 791
    .local v5, "skip":Z
    :cond_26
    if-ne v4, v3, :cond_2a

    .line 792
    const/4 v5, 0x1

    .line 793
    goto :goto_3e

    .line 795
    :cond_2a
    iget-object v6, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v1, v6

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 796
    if-eqz v1, :cond_3e

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Lcom/streambundlehtml/nodes/Element;)Z

    move-result v6

    if-eqz v6, :cond_26

    .line 797
    nop

    .line 800
    :cond_3e
    :goto_3e
    if-nez v5, :cond_4b

    .line 801
    iget-object v6, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v1, v6

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 802
    :cond_4b
    invoke-static {v1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 805
    const/4 v5, 0x0

    .line 806
    new-instance v6, Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-virtual {p0, v7, v8}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tagFor(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v7

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v8

    invoke-virtual {v8}, Lcom/streambundlehtml/nodes/Attributes;->clone()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v6, v7, v9, v8}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 807
    .local v6, "newEl":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p0, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/nodes/Element;)V

    .line 810
    iget-object v7, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v7, v4, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 813
    add-int/lit8 v7, v2, -0x1

    if-ne v4, v7, :cond_75

    .line 814
    nop

    .line 816
    .end local v6    # "newEl":Lcom/streambundlehtml/nodes/Element;
    return-void

    .line 815
    :cond_75
    goto :goto_3e

    .line 783
    .end local v1    # "entry":Lcom/streambundlehtml/nodes/Element;
    .end local v2    # "size":I
    .end local v3    # "ceil":I
    .end local v4    # "pos":I
    .end local v5    # "skip":Z
    :cond_76
    return-void
.end method

.method removeFromActiveFormattingElements(Lcom/streambundlehtml/nodes/Element;)V
    .registers 5
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;

    .line 828
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "pos":I
    :goto_8
    if-ltz v0, :cond_1d

    .line 829
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 830
    .local v1, "next":Lcom/streambundlehtml/nodes/Element;
    if-ne v1, p1, :cond_1a

    .line 831
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 832
    goto :goto_1d

    .line 828
    .end local v1    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_1a
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 835
    .end local v0    # "pos":I
    :cond_1d
    :goto_1d
    return-void
.end method

.method removeFromStack(Lcom/streambundlehtml/nodes/Element;)Z
    .registers 6
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;

    .line 385
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .local v0, "pos":I
    :goto_8
    if-ltz v0, :cond_1d

    .line 386
    iget-object v2, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 387
    .local v2, "next":Lcom/streambundlehtml/nodes/Element;
    if-ne v2, p1, :cond_1a

    .line 388
    iget-object v3, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 389
    return v1

    .line 385
    .end local v2    # "next":Lcom/streambundlehtml/nodes/Element;
    :cond_1a
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 392
    .end local v0    # "pos":I
    :cond_1d
    const/4 v0, 0x0

    return v0
.end method

.method removeLastFormattingElement()Lcom/streambundlehtml/nodes/Element;
    .registers 4

    .line 727
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 728
    .local v0, "size":I
    if-lez v0, :cond_13

    .line 729
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    return-object v1

    .line 731
    :cond_13
    const/4 v1, 0x0

    return-object v1
.end method

.method replaceActiveFormattingElement(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V
    .registers 4
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "in"    # Lcom/streambundlehtml/nodes/Element;

    .line 853
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-direct {p0, v0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->replaceInQueue(Ljava/util/ArrayList;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V

    .line 854
    return-void
.end method

.method replaceOnStack(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V
    .registers 4
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "in"    # Lcom/streambundlehtml/nodes/Element;

    .line 470
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-direct {p0, v0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->replaceInQueue(Ljava/util/ArrayList;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V

    .line 471
    return-void
.end method

.method resetBody()V
    .registers 3

    .line 563
    const-string v0, "body"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_13

    .line 564
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->doc:Lcom/streambundlehtml/nodes/Document;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 566
    :cond_13
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 567
    return-void
.end method

.method resetInsertionMode()Z
    .registers 12

    .line 486
    const/4 v0, 0x0

    .line 487
    .local v0, "last":Z
    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    .line 488
    .local v1, "bottom":I
    const/16 v3, 0x100

    const/4 v4, 0x0

    if-lt v1, v3, :cond_11

    add-int/lit16 v3, v1, -0x100

    goto :goto_12

    :cond_11
    const/4 v3, 0x0

    .line 489
    .local v3, "upper":I
    :goto_12
    iget-object v5, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 491
    .local v5, "origState":Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    iget-object v6, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :cond_21

    .line 492
    sget-object v6, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 495
    :cond_21
    move v6, v1

    .local v6, "pos":I
    :goto_22
    if-lt v6, v3, :cond_154

    .line 496
    iget-object v7, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/streambundlehtml/nodes/Element;

    .line 497
    .local v7, "node":Lcom/streambundlehtml/nodes/Element;
    if-ne v6, v3, :cond_35

    .line 498
    const/4 v0, 0x1

    .line 499
    iget-boolean v8, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->fragmentParsing:Z

    if-eqz v8, :cond_35

    .line 500
    iget-object v7, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->contextElement:Lcom/streambundlehtml/nodes/Element;

    .line 502
    :cond_35
    if-eqz v7, :cond_3c

    invoke-virtual {v7}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v8

    goto :goto_3e

    :cond_3c
    const-string v8, ""

    .line 503
    .local v8, "name":Ljava/lang/String;
    :goto_3e
    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_15a

    goto/16 :goto_e9

    :sswitch_47
    const-string v9, "caption"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/4 v9, 0x7

    goto/16 :goto_ea

    :sswitch_52
    const-string v9, "thead"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/4 v9, 0x5

    goto/16 :goto_ea

    :sswitch_5d
    const-string v9, "tfoot"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/4 v9, 0x6

    goto/16 :goto_ea

    :sswitch_68
    const-string v9, "tbody"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/4 v9, 0x4

    goto/16 :goto_ea

    :sswitch_73
    const-string v9, "table"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/16 v9, 0x9

    goto/16 :goto_ea

    :sswitch_7f
    const-string v9, "html"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/16 v9, 0xe

    goto :goto_ea

    :sswitch_8a
    const-string v9, "head"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/16 v9, 0xb

    goto :goto_ea

    :sswitch_95
    const-string v9, "body"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/16 v9, 0xc

    goto :goto_ea

    :sswitch_a0
    const-string v9, "tr"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/4 v9, 0x3

    goto :goto_ea

    :sswitch_aa
    const-string v9, "th"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/4 v9, 0x2

    goto :goto_ea

    :sswitch_b4
    const-string v9, "td"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/4 v9, 0x1

    goto :goto_ea

    :sswitch_be
    const-string v9, "colgroup"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/16 v9, 0x8

    goto :goto_ea

    :sswitch_c9
    const-string v9, "select"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/4 v9, 0x0

    goto :goto_ea

    :sswitch_d3
    const-string v9, "template"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/16 v9, 0xa

    goto :goto_ea

    :sswitch_de
    const-string v9, "frameset"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e9

    const/16 v9, 0xd

    goto :goto_ea

    :cond_e9
    :goto_e9
    const/4 v9, -0x1

    :goto_ea
    packed-switch v9, :pswitch_data_198

    goto :goto_148

    .line 550
    :pswitch_ee
    iget-object v9, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->headElement:Lcom/streambundlehtml/nodes/Element;

    if-nez v9, :cond_f5

    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->BeforeHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    goto :goto_f7

    :cond_f5
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    :goto_f7
    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 551
    goto :goto_154

    .line 547
    :pswitch_fb
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 548
    goto :goto_154

    .line 544
    :pswitch_101
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 545
    goto :goto_154

    .line 538
    :pswitch_107
    if-nez v0, :cond_148

    .line 539
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 540
    goto :goto_154

    .line 533
    :pswitch_10f
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentTemplateMode()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-result-object v9

    .line 534
    .local v9, "tmplState":Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    const-string v10, "Bug: no template insertion mode on stack!"

    invoke-static {v9, v10}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 535
    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 536
    goto :goto_154

    .line 530
    .end local v9    # "tmplState":Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    :pswitch_11c
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 531
    goto :goto_154

    .line 527
    :pswitch_122
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InColumnGroup:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 528
    goto :goto_154

    .line 524
    :pswitch_128
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InCaption:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 525
    goto :goto_154

    .line 521
    :pswitch_12e
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 522
    goto :goto_154

    .line 516
    :pswitch_134
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 517
    goto :goto_154

    .line 510
    :pswitch_13a
    if-nez v0, :cond_148

    .line 511
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InCell:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 512
    goto :goto_154

    .line 505
    :pswitch_142
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InSelect:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 507
    goto :goto_154

    .line 553
    :cond_148
    :goto_148
    if-eqz v0, :cond_150

    .line 554
    sget-object v9, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v9}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 555
    goto :goto_154

    .line 495
    .end local v7    # "node":Lcom/streambundlehtml/nodes/Element;
    .end local v8    # "name":Ljava/lang/String;
    :cond_150
    add-int/lit8 v6, v6, -0x1

    goto/16 :goto_22

    .line 558
    .end local v6    # "pos":I
    :cond_154
    :goto_154
    iget-object v6, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    if-ne v6, v5, :cond_159

    const/4 v2, 0x0

    :cond_159
    return v2

    :sswitch_data_15a
    .sparse-switch
        -0x620c002b -> :sswitch_de
        -0x4ec53386 -> :sswitch_d3
        -0x3600cb04 -> :sswitch_c9
        -0x25eb9b01 -> :sswitch_be
        0xe70 -> :sswitch_b4
        0xe74 -> :sswitch_aa
        0xe7e -> :sswitch_a0
        0x2e39a2 -> :sswitch_95
        0x30cde0 -> :sswitch_8a
        0x3107ab -> :sswitch_7f
        0x6903bce -> :sswitch_73
        0x690e016 -> :sswitch_68
        0x692b2e2 -> :sswitch_5d
        0x6937454 -> :sswitch_52
        0x20ef99e6 -> :sswitch_47
    .end sparse-switch

    :pswitch_data_198
    .packed-switch 0x0
        :pswitch_142
        :pswitch_13a
        :pswitch_13a
        :pswitch_134
        :pswitch_12e
        :pswitch_12e
        :pswitch_12e
        :pswitch_128
        :pswitch_122
        :pswitch_11c
        :pswitch_10f
        :pswitch_107
        :pswitch_101
        :pswitch_fb
        :pswitch_ee
    .end packed-switch
.end method

.method setFormElement(Lcom/streambundlehtml/nodes/FormElement;)V
    .registers 2
    .param p1, "formElement"    # Lcom/streambundlehtml/nodes/FormElement;

    .line 656
    iput-object p1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->formElement:Lcom/streambundlehtml/nodes/FormElement;

    .line 657
    return-void
.end method

.method setFosterInserts(Z)V
    .registers 2
    .param p1, "fosterInserts"    # Z

    .line 648
    iput-boolean p1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->fosterInserts:Z

    .line 649
    return-void
.end method

.method setHeadElement(Lcom/streambundlehtml/nodes/Element;)V
    .registers 2
    .param p1, "headElement"    # Lcom/streambundlehtml/nodes/Element;

    .line 636
    iput-object p1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->headElement:Lcom/streambundlehtml/nodes/Element;

    .line 637
    return-void
.end method

.method state()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    .registers 2

    .line 180
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    return-object v0
.end method

.method templateModeSize()I
    .registers 2

    .line 896
    iget-object v0, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tmplInsertMode:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 905
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TreeBuilder{currentToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentToken:Lcom/streambundlehtml/parser/Token;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", currentElement="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 908
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 905
    return-object v0
.end method

.method transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V
    .registers 2
    .param p1, "state"    # Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 176
    iput-object p1, p0, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->state:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 177
    return-void
.end method
