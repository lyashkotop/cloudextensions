.class public Lcom/streambundlehtml/parser/TokenQueue;
.super Ljava/lang/Object;
.source "TokenQueue.java"


# static fields
.field private static final CssIdentifierChars:[Ljava/lang/String;

.field private static final ESC:C = '\\'

.field private static final ElementSelectorChars:[Ljava/lang/String;


# instance fields
.field private pos:I

.field private queue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 347
    const-string v0, "*|"

    const-string v1, "|"

    const-string v2, "_"

    const-string v3, "-"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/TokenQueue;->ElementSelectorChars:[Ljava/lang/String;

    .line 357
    filled-new-array {v3, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/TokenQueue;->CssIdentifierChars:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 22
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 23
    iput-object p1, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    .line 24
    return-void
.end method

.method private varargs consumeEscapedCssIdentifier([Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "matches"    # [Ljava/lang/String;

    .line 361
    iget v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 362
    .local v0, "start":I
    const/4 v1, 0x0

    .line 363
    .local v1, "escaped":Z
    :goto_3
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_30

    .line 364
    iget-object v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x5c

    const/4 v4, 0x1

    if-ne v2, v3, :cond_24

    invoke-direct {p0}, Lcom/streambundlehtml/parser/TokenQueue;->remainingLength()I

    move-result v2

    if-le v2, v4, :cond_24

    .line 365
    const/4 v1, 0x1

    .line 366
    iget v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    goto :goto_3

    .line 367
    :cond_24
    invoke-direct {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->matchesCssIdentifier([Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 368
    iget v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/2addr v2, v4

    iput v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    goto :goto_3

    .line 374
    :cond_30
    iget-object v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 375
    .local v2, "consumed":Ljava/lang/String;
    if-eqz v1, :cond_3f

    invoke-static {v2}, Lcom/streambundlehtml/parser/TokenQueue;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_40

    :cond_3f
    move-object v3, v2

    :goto_40
    return-object v3
.end method

.method public static escapeCssIdentifier(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "in"    # Ljava/lang/String;

    .line 302
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 303
    .local v0, "out":Ljava/lang/StringBuilder;
    new-instance v1, Lcom/streambundlehtml/parser/TokenQueue;

    invoke-direct {v1, p0}, Lcom/streambundlehtml/parser/TokenQueue;-><init>(Ljava/lang/String;)V

    .line 304
    .local v1, "q":Lcom/streambundlehtml/parser/TokenQueue;
    :goto_9
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2d

    .line 305
    sget-object v2, Lcom/streambundlehtml/parser/TokenQueue;->ElementSelectorChars:[Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchesCssIdentifier([Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 306
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/TokenQueue;->consume()C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 308
    :cond_1f
    const/16 v2, 0x5c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/TokenQueue;->consume()C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 311
    :cond_2d
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private varargs matchesCssIdentifier([Ljava/lang/String;)Z
    .registers 3
    .param p1, "matches"    # [Ljava/lang/String;

    .line 379
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->matchesWord()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->matchesAny([Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x0

    goto :goto_f

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0
.end method

.method private remainingLength()I
    .registers 3

    .line 35
    iget-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "in"    # Ljava/lang/String;

    .line 281
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 282
    .local v0, "out":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 283
    .local v1, "last":C
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_b
    if-ge v4, v3, :cond_21

    aget-char v5, v2, v4

    .line 284
    .local v5, "c":C
    const/16 v6, 0x5c

    if-ne v5, v6, :cond_1a

    .line 285
    if-ne v1, v6, :cond_1d

    .line 286
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 287
    const/4 v5, 0x0

    goto :goto_1d

    .line 291
    :cond_1a
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 292
    :cond_1d
    :goto_1d
    move v1, v5

    .line 283
    .end local v5    # "c":C
    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    .line 294
    :cond_21
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public addFirst(Ljava/lang/String;)V
    .registers 5
    .param p1, "seq"    # Ljava/lang/String;

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 46
    return-void
.end method

.method public advance()V
    .registers 2

    .line 116
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c

    iget v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 117
    :cond_c
    return-void
.end method

.method public chompBalanced(CC)Ljava/lang/String;
    .registers 14
    .param p1, "open"    # C
    .param p2, "close"    # C

    .line 230
    const/4 v0, -0x1

    .line 231
    .local v0, "start":I
    const/4 v1, -0x1

    .line 232
    .local v1, "end":I
    const/4 v2, 0x0

    .line 233
    .local v2, "depth":I
    const/4 v3, 0x0

    .line 234
    .local v3, "last":C
    const/4 v4, 0x0

    .line 235
    .local v4, "inSingleQuote":Z
    const/4 v5, 0x0

    .line 236
    .local v5, "inDoubleQuote":Z
    const/4 v6, 0x0

    .line 239
    .local v6, "inRegexQE":Z
    :cond_7
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_e

    goto :goto_5c

    .line 240
    :cond_e
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->consume()C

    move-result v7

    .line 241
    .local v7, "c":C
    const/16 v8, 0x5c

    if-eq v3, v8, :cond_48

    .line 242
    const/16 v8, 0x27

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-ne v7, v8, :cond_25

    if-eq v7, p1, :cond_25

    if-nez v5, :cond_25

    .line 243
    if-nez v4, :cond_23

    const/4 v9, 0x1

    :cond_23
    move v4, v9

    goto :goto_31

    .line 244
    :cond_25
    const/16 v8, 0x22

    if-ne v7, v8, :cond_31

    if-eq v7, p1, :cond_31

    if-nez v4, :cond_31

    .line 245
    if-nez v5, :cond_30

    const/4 v9, 0x1

    :cond_30
    move v5, v9

    .line 246
    :cond_31
    :goto_31
    if-nez v4, :cond_46

    if-nez v5, :cond_46

    if-nez v6, :cond_46

    .line 251
    if-ne v7, p1, :cond_41

    .line 252
    add-int/lit8 v2, v2, 0x1

    .line 253
    const/4 v8, -0x1

    if-ne v0, v8, :cond_53

    .line 254
    iget v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    goto :goto_53

    .line 256
    :cond_41
    if-ne v7, p2, :cond_53

    .line 257
    add-int/lit8 v2, v2, -0x1

    goto :goto_53

    .line 247
    :cond_46
    move v3, v7

    .line 248
    goto :goto_5a

    .line 258
    :cond_48
    const/16 v8, 0x51

    if-ne v7, v8, :cond_4e

    .line 259
    const/4 v6, 0x1

    goto :goto_53

    .line 260
    :cond_4e
    const/16 v8, 0x45

    if-ne v7, v8, :cond_53

    .line 261
    const/4 v6, 0x0

    .line 264
    :cond_53
    :goto_53
    if-lez v2, :cond_59

    if-eqz v3, :cond_59

    .line 265
    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 266
    :cond_59
    move v3, v7

    .line 267
    .end local v7    # "c":C
    :goto_5a
    if-gtz v2, :cond_7

    .line 268
    :goto_5c
    if-ltz v1, :cond_65

    iget-object v7, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    goto :goto_67

    :cond_65
    const-string v7, ""

    .line 269
    .local v7, "out":Ljava/lang/String;
    :goto_67
    if-lez v2, :cond_85

    .line 270
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Did not find balanced marker at \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/streambundlehtml/helper/Validate;->fail(Ljava/lang/String;)V

    .line 272
    :cond_85
    return-object v7
.end method

.method public chompTo(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "seq"    # Ljava/lang/String;

    .line 209
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->consumeTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 210
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    .line 211
    return-object v0
.end method

.method public chompToIgnoreCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "seq"    # Ljava/lang/String;

    .line 215
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->consumeToIgnoreCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 216
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    .line 217
    return-object v0
.end method

.method public consume()C
    .registers 4

    .line 124
    iget-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public consume(Ljava/lang/String;)V
    .registers 5
    .param p1, "seq"    # Ljava/lang/String;

    .line 135
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 137
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 138
    .local v0, "len":I
    invoke-direct {p0}, Lcom/streambundlehtml/parser/TokenQueue;->remainingLength()I

    move-result v1

    if-gt v0, v1, :cond_16

    .line 141
    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 142
    return-void

    .line 139
    :cond_16
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Queue not long enough to consume sequence"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    .end local v0    # "len":I
    :cond_1e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Queue did not match expected sequence"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public consumeCssIdentifier()Ljava/lang/String;
    .registers 2

    .line 355
    sget-object v0, Lcom/streambundlehtml/parser/TokenQueue;->CssIdentifierChars:[Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeEscapedCssIdentifier([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public consumeElementSelector()Ljava/lang/String;
    .registers 2

    .line 345
    sget-object v0, Lcom/streambundlehtml/parser/TokenQueue;->ElementSelectorChars:[Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeEscapedCssIdentifier([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public consumeTo(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "seq"    # Ljava/lang/String;

    .line 150
    iget-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v0, p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 151
    .local v0, "offset":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1d

    .line 152
    iget-object v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 153
    .local v1, "consumed":Ljava/lang/String;
    iget v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 154
    return-object v1

    .line 156
    .end local v1    # "consumed":Ljava/lang/String;
    :cond_1d
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public varargs consumeToAny([Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "seq"    # [Ljava/lang/String;

    .line 192
    iget v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 193
    .local v0, "start":I
    :goto_2
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_15

    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->matchesAny([Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 194
    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    goto :goto_2

    .line 197
    :cond_15
    iget-object v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public consumeToIgnoreCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "seq"    # Ljava/lang/String;

    .line 161
    iget v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 162
    .local v0, "start":I
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, "first":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 164
    .local v3, "canScan":Z
    :goto_14
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4d

    .line 165
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 166
    goto :goto_4d

    .line 168
    :cond_21
    if-eqz v3, :cond_47

    .line 169
    iget-object v4, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v4, v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    iget v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    sub-int/2addr v4, v5

    .line 170
    .local v4, "skip":I
    if-nez v4, :cond_36

    .line 171
    iget v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/2addr v5, v2

    iput v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    goto :goto_46

    .line 172
    :cond_36
    if-gez v4, :cond_41

    .line 173
    iget-object v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    iput v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    goto :goto_46

    .line 175
    :cond_41
    iget v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/2addr v5, v4

    iput v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 176
    .end local v4    # "skip":I
    :goto_46
    goto :goto_14

    .line 178
    :cond_47
    iget v4, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/2addr v4, v2

    iput v4, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    goto :goto_14

    .line 181
    :cond_4d
    :goto_4d
    iget-object v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v4, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v2, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public consumeWhitespace()Z
    .registers 3

    .line 319
    const/4 v0, 0x0

    .line 320
    .local v0, "seen":Z
    :goto_1
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->matchesWhitespace()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 321
    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 322
    const/4 v0, 0x1

    goto :goto_1

    .line 324
    :cond_f
    return v0
.end method

.method public consumeWord()Ljava/lang/String;
    .registers 4

    .line 332
    iget v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 333
    .local v0, "start":I
    :goto_2
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->matchesWord()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 334
    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    goto :goto_2

    .line 335
    :cond_f
    iget-object v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public isEmpty()Z
    .registers 2

    .line 31
    invoke-direct {p0}, Lcom/streambundlehtml/parser/TokenQueue;->remainingLength()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public matchChomp(Ljava/lang/String;)Z
    .registers 4
    .param p1, "seq"    # Ljava/lang/String;

    .line 88
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 89
    iget v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 90
    const/4 v0, 0x1

    return v0

    .line 92
    :cond_11
    const/4 v0, 0x0

    return v0
.end method

.method public matches(Ljava/lang/String;)Z
    .registers 8
    .param p1, "seq"    # Ljava/lang/String;

    .line 54
    iget-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v1, 0x1

    move-object v3, p1

    .end local p1    # "seq":Ljava/lang/String;
    .local v3, "seq":Ljava/lang/String;
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result p1

    return p1
.end method

.method public varargs matchesAny([C)Z
    .registers 8
    .param p1, "seq"    # [C

    .line 71
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 72
    return v1

    .line 74
    :cond_8
    array-length v0, p1

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v0, :cond_1d

    aget-char v3, p1, v2

    .line 75
    .local v3, "c":C
    iget-object v4, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v5, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v3, :cond_1a

    .line 76
    const/4 v0, 0x1

    return v0

    .line 74
    .end local v3    # "c":C
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 78
    :cond_1d
    return v1
.end method

.method public varargs matchesAny([Ljava/lang/String;)Z
    .registers 7
    .param p1, "seq"    # [Ljava/lang/String;

    .line 63
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v0, :cond_12

    aget-object v3, p1, v2

    .line 64
    .local v3, "s":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 65
    const/4 v0, 0x1

    return v0

    .line 63
    .end local v3    # "s":Ljava/lang/String;
    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 67
    :cond_12
    return v1
.end method

.method public matchesWhitespace()Z
    .registers 3

    .line 101
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->isWhitespace(I)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    return v0
.end method

.method public matchesWord()Z
    .registers 3

    .line 109
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    return v0
.end method

.method public remainder()Ljava/lang/String;
    .registers 3

    .line 387
    iget-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 388
    .local v0, "remainder":Ljava/lang/String;
    iget-object v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    .line 389
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 394
    iget-object v0, p0, Lcom/streambundlehtml/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lcom/streambundlehtml/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
