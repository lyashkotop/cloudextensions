.class public Lcom/streambundlehtml/parser/Tag;
.super Ljava/lang/Object;
.source "Tag.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final blockTags:[Ljava/lang/String;

.field private static final emptyTags:[Ljava/lang/String;

.field private static final formListedTags:[Ljava/lang/String;

.field private static final formSubmitTags:[Ljava/lang/String;

.field private static final formatAsInlineTags:[Ljava/lang/String;

.field private static final inlineTags:[Ljava/lang/String;

.field private static final preserveWhitespaceTags:[Ljava/lang/String;

.field private static final tags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/streambundlehtml/parser/Tag;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private empty:Z

.field private formList:Z

.field private formSubmit:Z

.field private formatAsBlock:Z

.field private isBlock:Z

.field private normalName:Ljava/lang/String;

.field private preserveWhitespace:Z

.field private selfClosing:Z

.field private tagName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 70

    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    .line 234
    const-string v68, "marquee"

    const-string v69, "listing"

    const-string v1, "html"

    const-string v2, "head"

    const-string v3, "body"

    const-string v4, "frameset"

    const-string v5, "script"

    const-string v6, "noscript"

    const-string v7, "style"

    const-string v8, "meta"

    const-string v9, "link"

    const-string v10, "title"

    const-string v11, "frame"

    const-string v12, "noframes"

    const-string v13, "section"

    const-string v14, "nav"

    const-string v15, "aside"

    const-string v16, "hgroup"

    const-string v17, "header"

    const-string v18, "footer"

    const-string v19, "p"

    const-string v20, "h1"

    const-string v21, "h2"

    const-string v22, "h3"

    const-string v23, "h4"

    const-string v24, "h5"

    const-string v25, "h6"

    const-string v26, "ul"

    const-string v27, "ol"

    const-string v28, "pre"

    const-string v29, "div"

    const-string v30, "blockquote"

    const-string v31, "hr"

    const-string v32, "address"

    const-string v33, "figure"

    const-string v34, "figcaption"

    const-string v35, "form"

    const-string v36, "fieldset"

    const-string v37, "ins"

    const-string v38, "del"

    const-string v39, "dl"

    const-string v40, "dt"

    const-string v41, "dd"

    const-string v42, "li"

    const-string v43, "table"

    const-string v44, "caption"

    const-string v45, "thead"

    const-string v46, "tfoot"

    const-string v47, "tbody"

    const-string v48, "colgroup"

    const-string v49, "col"

    const-string v50, "tr"

    const-string v51, "th"

    const-string v52, "td"

    const-string v53, "video"

    const-string v54, "audio"

    const-string v55, "canvas"

    const-string v56, "details"

    const-string v57, "menu"

    const-string v58, "plaintext"

    const-string v59, "template"

    const-string v60, "article"

    const-string v61, "main"

    const-string v62, "svg"

    const-string v63, "math"

    const-string v64, "center"

    const-string v65, "template"

    const-string v66, "dir"

    const-string v67, "applet"

    filled-new-array/range {v1 .. v69}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/Tag;->blockTags:[Ljava/lang/String;

    .line 243
    const-string v67, "strike"

    const-string v68, "nobr"

    const-string v1, "object"

    const-string v2, "base"

    const-string v3, "font"

    const-string v4, "tt"

    const-string v5, "i"

    const-string v6, "b"

    const-string v7, "u"

    const-string v8, "big"

    const-string v9, "small"

    const-string v10, "em"

    const-string v11, "strong"

    const-string v12, "dfn"

    const-string v13, "code"

    const-string v14, "samp"

    const-string v15, "kbd"

    const-string v16, "var"

    const-string v17, "cite"

    const-string v18, "abbr"

    const-string v19, "time"

    const-string v20, "acronym"

    const-string v21, "mark"

    const-string v22, "ruby"

    const-string v23, "rt"

    const-string v24, "rp"

    const-string v25, "a"

    const-string v26, "img"

    const-string v27, "br"

    const-string v28, "wbr"

    const-string v29, "map"

    const-string v30, "q"

    const-string v31, "sub"

    const-string v32, "sup"

    const-string v33, "bdo"

    const-string v34, "iframe"

    const-string v35, "embed"

    const-string v36, "span"

    const-string v37, "input"

    const-string v38, "select"

    const-string v39, "textarea"

    const-string v40, "label"

    const-string v41, "button"

    const-string v42, "optgroup"

    const-string v43, "option"

    const-string v44, "legend"

    const-string v45, "datalist"

    const-string v46, "keygen"

    const-string v47, "output"

    const-string v48, "progress"

    const-string v49, "meter"

    const-string v50, "area"

    const-string v51, "param"

    const-string v52, "source"

    const-string v53, "track"

    const-string v54, "summary"

    const-string v55, "command"

    const-string v56, "device"

    const-string v57, "area"

    const-string v58, "basefont"

    const-string v59, "bgsound"

    const-string v60, "menuitem"

    const-string v61, "param"

    const-string v62, "source"

    const-string v63, "track"

    const-string v64, "data"

    const-string v65, "bdi"

    const-string v66, "s"

    filled-new-array/range {v1 .. v68}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/Tag;->inlineTags:[Ljava/lang/String;

    .line 251
    const-string v20, "source"

    const-string v21, "track"

    const-string v1, "meta"

    const-string v2, "link"

    const-string v3, "base"

    const-string v4, "frame"

    const-string v5, "img"

    const-string v6, "br"

    const-string v7, "wbr"

    const-string v8, "embed"

    const-string v9, "hr"

    const-string v10, "input"

    const-string v11, "keygen"

    const-string v12, "col"

    const-string v13, "command"

    const-string v14, "device"

    const-string v15, "area"

    const-string v16, "basefont"

    const-string v17, "bgsound"

    const-string v18, "menuitem"

    const-string v19, "param"

    filled-new-array/range {v1 .. v21}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/Tag;->emptyTags:[Ljava/lang/String;

    .line 256
    const-string v18, "del"

    const-string v19, "s"

    const-string v1, "title"

    const-string v2, "a"

    const-string v3, "p"

    const-string v4, "h1"

    const-string v5, "h2"

    const-string v6, "h3"

    const-string v7, "h4"

    const-string v8, "h5"

    const-string v9, "h6"

    const-string v10, "pre"

    const-string v11, "address"

    const-string v12, "li"

    const-string v13, "th"

    const-string v14, "td"

    const-string v15, "script"

    const-string v16, "style"

    const-string v17, "ins"

    filled-new-array/range {v1 .. v19}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/Tag;->formatAsInlineTags:[Ljava/lang/String;

    .line 260
    const-string v0, "pre"

    const-string v1, "plaintext"

    const-string v2, "title"

    const-string v3, "textarea"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/Tag;->preserveWhitespaceTags:[Ljava/lang/String;

    .line 265
    const-string v10, "select"

    const-string v11, "textarea"

    const-string v4, "button"

    const-string v5, "fieldset"

    const-string v6, "input"

    const-string v7, "keygen"

    const-string v8, "object"

    const-string v9, "output"

    filled-new-array/range {v4 .. v11}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/Tag;->formListedTags:[Ljava/lang/String;

    .line 268
    const-string v0, "object"

    const-string v1, "select"

    const-string v2, "input"

    const-string v4, "keygen"

    filled-new-array {v2, v4, v0, v1, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/Tag;->formSubmitTags:[Ljava/lang/String;

    .line 274
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->blockTags:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1b8
    if-ge v3, v1, :cond_1c7

    aget-object v4, v0, v3

    .line 275
    .local v4, "tagName":Ljava/lang/String;
    new-instance v5, Lcom/streambundlehtml/parser/Tag;

    invoke-direct {v5, v4}, Lcom/streambundlehtml/parser/Tag;-><init>(Ljava/lang/String;)V

    .line 276
    .local v5, "tag":Lcom/streambundlehtml/parser/Tag;
    invoke-static {v5}, Lcom/streambundlehtml/parser/Tag;->register(Lcom/streambundlehtml/parser/Tag;)V

    .line 274
    .end local v4    # "tagName":Ljava/lang/String;
    .end local v5    # "tag":Lcom/streambundlehtml/parser/Tag;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b8

    .line 278
    :cond_1c7
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->inlineTags:[Ljava/lang/String;

    array-length v1, v0

    const/4 v3, 0x0

    :goto_1cb
    if-ge v3, v1, :cond_1de

    aget-object v4, v0, v3

    .line 279
    .restart local v4    # "tagName":Ljava/lang/String;
    new-instance v5, Lcom/streambundlehtml/parser/Tag;

    invoke-direct {v5, v4}, Lcom/streambundlehtml/parser/Tag;-><init>(Ljava/lang/String;)V

    .line 280
    .restart local v5    # "tag":Lcom/streambundlehtml/parser/Tag;
    iput-boolean v2, v5, Lcom/streambundlehtml/parser/Tag;->isBlock:Z

    .line 281
    iput-boolean v2, v5, Lcom/streambundlehtml/parser/Tag;->formatAsBlock:Z

    .line 282
    invoke-static {v5}, Lcom/streambundlehtml/parser/Tag;->register(Lcom/streambundlehtml/parser/Tag;)V

    .line 278
    .end local v4    # "tagName":Ljava/lang/String;
    .end local v5    # "tag":Lcom/streambundlehtml/parser/Tag;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1cb

    .line 286
    :cond_1de
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->emptyTags:[Ljava/lang/String;

    array-length v1, v0

    const/4 v3, 0x0

    :goto_1e2
    const/4 v4, 0x1

    if-ge v3, v1, :cond_1f7

    aget-object v5, v0, v3

    .line 287
    .local v5, "tagName":Ljava/lang/String;
    sget-object v6, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/parser/Tag;

    .line 288
    .local v6, "tag":Lcom/streambundlehtml/parser/Tag;
    invoke-static {v6}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 289
    iput-boolean v4, v6, Lcom/streambundlehtml/parser/Tag;->empty:Z

    .line 286
    .end local v5    # "tagName":Ljava/lang/String;
    .end local v6    # "tag":Lcom/streambundlehtml/parser/Tag;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e2

    .line 292
    :cond_1f7
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->formatAsInlineTags:[Ljava/lang/String;

    array-length v1, v0

    const/4 v3, 0x0

    :goto_1fb
    if-ge v3, v1, :cond_20f

    aget-object v5, v0, v3

    .line 293
    .restart local v5    # "tagName":Ljava/lang/String;
    sget-object v6, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/parser/Tag;

    .line 294
    .restart local v6    # "tag":Lcom/streambundlehtml/parser/Tag;
    invoke-static {v6}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 295
    iput-boolean v2, v6, Lcom/streambundlehtml/parser/Tag;->formatAsBlock:Z

    .line 292
    .end local v5    # "tagName":Ljava/lang/String;
    .end local v6    # "tag":Lcom/streambundlehtml/parser/Tag;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1fb

    .line 298
    :cond_20f
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->preserveWhitespaceTags:[Ljava/lang/String;

    array-length v1, v0

    const/4 v3, 0x0

    :goto_213
    if-ge v3, v1, :cond_227

    aget-object v5, v0, v3

    .line 299
    .restart local v5    # "tagName":Ljava/lang/String;
    sget-object v6, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/parser/Tag;

    .line 300
    .restart local v6    # "tag":Lcom/streambundlehtml/parser/Tag;
    invoke-static {v6}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 301
    iput-boolean v4, v6, Lcom/streambundlehtml/parser/Tag;->preserveWhitespace:Z

    .line 298
    .end local v5    # "tagName":Ljava/lang/String;
    .end local v6    # "tag":Lcom/streambundlehtml/parser/Tag;
    add-int/lit8 v3, v3, 0x1

    goto :goto_213

    .line 304
    :cond_227
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->formListedTags:[Ljava/lang/String;

    array-length v1, v0

    const/4 v3, 0x0

    :goto_22b
    if-ge v3, v1, :cond_23f

    aget-object v5, v0, v3

    .line 305
    .restart local v5    # "tagName":Ljava/lang/String;
    sget-object v6, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/streambundlehtml/parser/Tag;

    .line 306
    .restart local v6    # "tag":Lcom/streambundlehtml/parser/Tag;
    invoke-static {v6}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 307
    iput-boolean v4, v6, Lcom/streambundlehtml/parser/Tag;->formList:Z

    .line 304
    .end local v5    # "tagName":Ljava/lang/String;
    .end local v6    # "tag":Lcom/streambundlehtml/parser/Tag;
    add-int/lit8 v3, v3, 0x1

    goto :goto_22b

    .line 310
    :cond_23f
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->formSubmitTags:[Ljava/lang/String;

    array-length v1, v0

    :goto_242
    if-ge v2, v1, :cond_256

    aget-object v3, v0, v2

    .line 311
    .local v3, "tagName":Ljava/lang/String;
    sget-object v5, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/parser/Tag;

    .line 312
    .local v5, "tag":Lcom/streambundlehtml/parser/Tag;
    invoke-static {v5}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 313
    iput-boolean v4, v5, Lcom/streambundlehtml/parser/Tag;->formSubmit:Z

    .line 310
    .end local v3    # "tagName":Ljava/lang/String;
    .end local v5    # "tag":Lcom/streambundlehtml/parser/Tag;
    add-int/lit8 v2, v2, 0x1

    goto :goto_242

    .line 315
    :cond_256
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "tagName"    # Ljava/lang/String;

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->isBlock:Z

    .line 20
    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->formatAsBlock:Z

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->empty:Z

    .line 22
    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->selfClosing:Z

    .line 23
    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->preserveWhitespace:Z

    .line 24
    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->formList:Z

    .line 25
    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->formSubmit:Z

    .line 28
    iput-object p1, p0, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    .line 29
    invoke-static {p1}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tag;->normalName:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public static isKnownTag(Ljava/lang/String;)Z
    .registers 2
    .param p0, "tagName"    # Ljava/lang/String;

    .line 155
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static register(Lcom/streambundlehtml/parser/Tag;)V
    .registers 3
    .param p0, "tag"    # Lcom/streambundlehtml/parser/Tag;

    .line 318
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/streambundlehtml/parser/Tag;
    .registers 2
    .param p0, "tagName"    # Ljava/lang/String;

    .line 91
    sget-object v0, Lcom/streambundlehtml/parser/ParseSettings;->preserveCase:Lcom/streambundlehtml/parser/ParseSettings;

    invoke-static {p0, v0}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;Lcom/streambundlehtml/parser/ParseSettings;)Lcom/streambundlehtml/parser/Tag;
    .registers 5
    .param p0, "tagName"    # Ljava/lang/String;
    .param p1, "settings"    # Lcom/streambundlehtml/parser/ParseSettings;

    .line 60
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 61
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/parser/Tag;

    .line 63
    .local v0, "tag":Lcom/streambundlehtml/parser/Tag;
    if-nez v0, :cond_3f

    .line 64
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 65
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 66
    invoke-static {p0}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "normalName":Ljava/lang/String;
    sget-object v2, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/streambundlehtml/parser/Tag;

    .line 69
    if-nez v0, :cond_2d

    .line 71
    new-instance v2, Lcom/streambundlehtml/parser/Tag;

    invoke-direct {v2, p0}, Lcom/streambundlehtml/parser/Tag;-><init>(Ljava/lang/String;)V

    move-object v0, v2

    .line 72
    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/streambundlehtml/parser/Tag;->isBlock:Z

    goto :goto_3f

    .line 73
    :cond_2d
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/ParseSettings;->preserveTagCase()Z

    move-result v2

    if-eqz v2, :cond_3f

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3f

    .line 74
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Tag;->clone()Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    .line 75
    iput-object p0, v0, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    .line 78
    .end local v1    # "normalName":Ljava/lang/String;
    :cond_3f
    :goto_3f
    return-object v0
.end method


# virtual methods
.method protected clone()Lcom/streambundlehtml/parser/Tag;
    .registers 3

    .line 226
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/parser/Tag;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_7

    return-object v0

    .line 227
    :catch_7
    move-exception v0

    .line 228
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 14
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Tag;->clone()Lcom/streambundlehtml/parser/Tag;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 190
    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 191
    :cond_4
    instance-of v1, p1, Lcom/streambundlehtml/parser/Tag;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 193
    :cond_a
    move-object v1, p1

    check-cast v1, Lcom/streambundlehtml/parser/Tag;

    .line 195
    .local v1, "tag":Lcom/streambundlehtml/parser/Tag;
    iget-object v3, p0, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    iget-object v4, v1, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    return v2

    .line 196
    :cond_18
    iget-boolean v3, p0, Lcom/streambundlehtml/parser/Tag;->empty:Z

    iget-boolean v4, v1, Lcom/streambundlehtml/parser/Tag;->empty:Z

    if-eq v3, v4, :cond_1f

    return v2

    .line 197
    :cond_1f
    iget-boolean v3, p0, Lcom/streambundlehtml/parser/Tag;->formatAsBlock:Z

    iget-boolean v4, v1, Lcom/streambundlehtml/parser/Tag;->formatAsBlock:Z

    if-eq v3, v4, :cond_26

    return v2

    .line 198
    :cond_26
    iget-boolean v3, p0, Lcom/streambundlehtml/parser/Tag;->isBlock:Z

    iget-boolean v4, v1, Lcom/streambundlehtml/parser/Tag;->isBlock:Z

    if-eq v3, v4, :cond_2d

    return v2

    .line 199
    :cond_2d
    iget-boolean v3, p0, Lcom/streambundlehtml/parser/Tag;->preserveWhitespace:Z

    iget-boolean v4, v1, Lcom/streambundlehtml/parser/Tag;->preserveWhitespace:Z

    if-eq v3, v4, :cond_34

    return v2

    .line 200
    :cond_34
    iget-boolean v3, p0, Lcom/streambundlehtml/parser/Tag;->selfClosing:Z

    iget-boolean v4, v1, Lcom/streambundlehtml/parser/Tag;->selfClosing:Z

    if-eq v3, v4, :cond_3b

    return v2

    .line 201
    :cond_3b
    iget-boolean v3, p0, Lcom/streambundlehtml/parser/Tag;->formList:Z

    iget-boolean v4, v1, Lcom/streambundlehtml/parser/Tag;->formList:Z

    if-eq v3, v4, :cond_42

    return v2

    .line 202
    :cond_42
    iget-boolean v3, p0, Lcom/streambundlehtml/parser/Tag;->formSubmit:Z

    iget-boolean v4, v1, Lcom/streambundlehtml/parser/Tag;->formSubmit:Z

    if-eq v3, v4, :cond_49

    const/4 v0, 0x0

    :cond_49
    return v0
.end method

.method public formatAsBlock()Z
    .registers 2

    .line 109
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->formatAsBlock:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 38
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .line 207
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 208
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/streambundlehtml/parser/Tag;->isBlock:Z

    add-int/2addr v1, v2

    .line 209
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Lcom/streambundlehtml/parser/Tag;->formatAsBlock:Z

    add-int/2addr v0, v2

    .line 210
    .end local v1    # "result":I
    .restart local v0    # "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/streambundlehtml/parser/Tag;->empty:Z

    add-int/2addr v1, v2

    .line 211
    .end local v0    # "result":I
    .restart local v1    # "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Lcom/streambundlehtml/parser/Tag;->selfClosing:Z

    add-int/2addr v0, v2

    .line 212
    .end local v1    # "result":I
    .restart local v0    # "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/streambundlehtml/parser/Tag;->preserveWhitespace:Z

    add-int/2addr v1, v2

    .line 213
    .end local v0    # "result":I
    .restart local v1    # "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Lcom/streambundlehtml/parser/Tag;->formList:Z

    add-int/2addr v0, v2

    .line 214
    .end local v1    # "result":I
    .restart local v0    # "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/streambundlehtml/parser/Tag;->formSubmit:Z

    add-int/2addr v1, v2

    .line 215
    .end local v0    # "result":I
    .restart local v1    # "result":I
    return v1
.end method

.method public isBlock()Z
    .registers 2

    .line 100
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->isBlock:Z

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .line 127
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->empty:Z

    return v0
.end method

.method public isFormListed()Z
    .registers 2

    .line 172
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->formList:Z

    return v0
.end method

.method public isFormSubmittable()Z
    .registers 2

    .line 180
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->formSubmit:Z

    return v0
.end method

.method public isInline()Z
    .registers 2

    .line 118
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->isBlock:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isKnownTag()Z
    .registers 3

    .line 145
    sget-object v0, Lcom/streambundlehtml/parser/Tag;->tags:Ljava/util/Map;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSelfClosing()Z
    .registers 2

    .line 136
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->empty:Z

    if-nez v0, :cond_a

    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->selfClosing:Z

    if-nez v0, :cond_a

    const/4 v0, 0x0

    goto :goto_b

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0
.end method

.method public normalName()Ljava/lang/String;
    .registers 2

    .line 46
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tag;->normalName:Ljava/lang/String;

    return-object v0
.end method

.method public preserveWhitespace()Z
    .registers 2

    .line 164
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->preserveWhitespace:Z

    return v0
.end method

.method setSelfClosing()Lcom/streambundlehtml/parser/Tag;
    .registers 2

    .line 184
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tag;->selfClosing:Z

    .line 185
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 220
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tag;->tagName:Ljava/lang/String;

    return-object v0
.end method
