.class public final Lcom/streambundlehtml/internal/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/internal/StringUtil$StringJoiner;
    }
.end annotation


# static fields
.field private static final MaxCachedBuilderSize:I = 0x2000

.field private static final MaxIdleBuilders:I = 0x8

.field private static final controlChars:Ljava/util/regex/Pattern;

.field private static final extraDotSegmentsPattern:Ljava/util/regex/Pattern;

.field static final padding:[Ljava/lang/String;

.field private static final threadLocalBuilders:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/util/Stack<",
            "Ljava/lang/StringBuilder;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final validUriScheme:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 22

    .line 20
    const-string v20, "                   "

    const-string v21, "                    "

    const-string v1, ""

    const-string v2, " "

    const-string v3, "  "

    const-string v4, "   "

    const-string v5, "    "

    const-string v6, "     "

    const-string v7, "      "

    const-string v8, "       "

    const-string v9, "        "

    const-string v10, "         "

    const-string v11, "          "

    const-string v12, "           "

    const-string v13, "            "

    const-string v14, "             "

    const-string v15, "              "

    const-string v16, "               "

    const-string v17, "                "

    const-string v18, "                 "

    const-string v19, "                  "

    filled-new-array/range {v1 .. v21}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/internal/StringUtil;->padding:[Ljava/lang/String;

    .line 284
    const-string v0, "^/((\\.{1,2}/)+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/internal/StringUtil;->extraDotSegmentsPattern:Ljava/util/regex/Pattern;

    .line 331
    const-string v0, "^[a-zA-Z][a-zA-Z0-9+-.]*:"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/internal/StringUtil;->validUriScheme:Ljava/util/regex/Pattern;

    .line 333
    const-string v0, "[\\x00-\\x1f]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/internal/StringUtil;->controlChars:Ljava/util/regex/Pattern;

    .line 338
    new-instance v0, Lcom/streambundlehtml/internal/StringUtil$1;

    invoke-direct {v0}, Lcom/streambundlehtml/internal/StringUtil$1;-><init>()V

    sput-object v0, Lcom/streambundlehtml/internal/StringUtil;->threadLocalBuilders:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendNormalisedWhitespace(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V
    .registers 9
    .param p0, "accum"    # Ljava/lang/StringBuilder;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "stripLeading"    # Z

    .line 234
    const/4 v0, 0x0

    .line 235
    .local v0, "lastWasWhite":Z
    const/4 v1, 0x0

    .line 237
    .local v1, "reachedNonWhite":Z
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 239
    .local v2, "len":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_7
    if-ge v3, v2, :cond_33

    .line 240
    invoke-virtual {p1, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v4

    .line 241
    .local v4, "c":I
    invoke-static {v4}, Lcom/streambundlehtml/internal/StringUtil;->isActuallyWhitespace(I)Z

    move-result v5

    if-eqz v5, :cond_22

    .line 242
    if-eqz p2, :cond_18

    if-nez v1, :cond_18

    goto :goto_2d

    :cond_18
    if-eqz v0, :cond_1b

    .line 243
    goto :goto_2d

    .line 244
    :cond_1b
    const/16 v5, 0x20

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 245
    const/4 v0, 0x1

    goto :goto_2d

    .line 247
    :cond_22
    invoke-static {v4}, Lcom/streambundlehtml/internal/StringUtil;->isInvisibleChar(I)Z

    move-result v5

    if-nez v5, :cond_2d

    .line 248
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 249
    const/4 v0, 0x0

    .line 250
    const/4 v1, 0x1

    .line 239
    :cond_2d
    :goto_2d
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v3, v5

    goto :goto_7

    .line 253
    .end local v3    # "i":I
    .end local v4    # "c":I
    :cond_33
    return-void
.end method

.method public static borrowBuilder()Ljava/lang/StringBuilder;
    .registers 3

    .line 353
    sget-object v0, Lcom/streambundlehtml/internal/StringUtil;->threadLocalBuilders:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    .line 354
    .local v0, "builders":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/StringBuilder;>;"
    invoke-virtual {v0}, Ljava/util/Stack;->empty()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 355
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x2000

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    goto :goto_1c

    .line 356
    :cond_16
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/StringBuilder;

    .line 354
    :goto_1c
    return-object v1
.end method

.method public static varargs in(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 5
    .param p0, "needle"    # Ljava/lang/String;
    .param p1, "haystack"    # [Ljava/lang/String;

    .line 256
    array-length v0, p1

    .line 257
    .local v0, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    if-ge v1, v0, :cond_11

    .line 258
    aget-object v2, p1, v1

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 259
    const/4 v2, 0x1

    return v2

    .line 257
    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 261
    .end local v1    # "i":I
    :cond_11
    const/4 v1, 0x0

    return v1
.end method

.method public static inSorted(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 3
    .param p0, "needle"    # Ljava/lang/String;
    .param p1, "haystack"    # [Ljava/lang/String;

    .line 265
    invoke-static {p1, p0}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public static isActuallyWhitespace(I)Z
    .registers 2
    .param p0, "c"    # I

    .line 206
    const/16 v0, 0x20

    if-eq p0, v0, :cond_1a

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1a

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1a

    const/16 v0, 0xc

    if-eq p0, v0, :cond_1a

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1a

    const/16 v0, 0xa0

    if-eq p0, v0, :cond_1a

    const/4 v0, 0x0

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x1

    :goto_1b
    return v0
.end method

.method public static isAscii(Ljava/lang/String;)Z
    .registers 4
    .param p0, "string"    # Ljava/lang/String;

    .line 274
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 275
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 276
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 277
    .local v1, "c":I
    const/16 v2, 0x7f

    if-le v1, v2, :cond_14

    .line 278
    const/4 v2, 0x0

    return v2

    .line 275
    .end local v1    # "c":I
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 281
    .end local v0    # "i":I
    :cond_17
    const/4 v0, 0x1

    return v0
.end method

.method public static isBlank(Ljava/lang/String;)Z
    .registers 5
    .param p0, "string"    # Ljava/lang/String;

    .line 151
    const/4 v0, 0x1

    if-eqz p0, :cond_20

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_20

    .line 154
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 155
    .local v1, "l":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    if-ge v2, v1, :cond_1f

    .line 156
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    invoke-static {v3}, Lcom/streambundlehtml/internal/StringUtil;->isWhitespace(I)Z

    move-result v3

    if-nez v3, :cond_1c

    .line 157
    const/4 v0, 0x0

    return v0

    .line 155
    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 159
    .end local v2    # "i":I
    :cond_1f
    return v0

    .line 152
    .end local v1    # "l":I
    :cond_20
    return v0
.end method

.method public static isInvisibleChar(I)Z
    .registers 2
    .param p0, "c"    # I

    .line 211
    const/16 v0, 0x200b

    if-eq p0, v0, :cond_a

    const/16 v0, 0xad

    if-eq p0, v0, :cond_a

    const/4 v0, 0x0

    goto :goto_b

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0
.end method

.method public static isNumeric(Ljava/lang/String;)Z
    .registers 5
    .param p0, "string"    # Ljava/lang/String;

    .line 179
    const/4 v0, 0x0

    if-eqz p0, :cond_20

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_20

    .line 182
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 183
    .local v1, "l":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    if-ge v2, v1, :cond_1e

    .line 184
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(I)Z

    move-result v3

    if-nez v3, :cond_1b

    .line 185
    return v0

    .line 183
    :cond_1b
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 187
    .end local v2    # "i":I
    :cond_1e
    const/4 v0, 0x1

    return v0

    .line 180
    .end local v1    # "l":I
    :cond_20
    return v0
.end method

.method public static isWhitespace(I)Z
    .registers 2
    .param p0, "c"    # I

    .line 197
    const/16 v0, 0x20

    if-eq p0, v0, :cond_16

    const/16 v0, 0x9

    if-eq p0, v0, :cond_16

    const/16 v0, 0xa

    if-eq p0, v0, :cond_16

    const/16 v0, 0xc

    if-eq p0, v0, :cond_16

    const/16 v0, 0xd

    if-eq p0, v0, :cond_16

    const/4 v0, 0x0

    goto :goto_17

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0
.end method

.method public static join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "sep"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 31
    .local p0, "strings":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/streambundlehtml/internal/StringUtil;->join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "sep"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 41
    .local p0, "strings":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_9

    .line 42
    const-string v0, ""

    return-object v0

    .line 44
    :cond_9
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "start":Ljava/lang/String;
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_18

    .line 46
    return-object v0

    .line 48
    :cond_18
    new-instance v1, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;

    invoke-direct {v1, p1}, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;-><init>(Ljava/lang/String;)V

    .line 49
    .local v1, "j":Lcom/streambundlehtml/internal/StringUtil$StringJoiner;
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;->add(Ljava/lang/Object;)Lcom/streambundlehtml/internal/StringUtil$StringJoiner;

    .line 50
    :goto_20
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 51
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;->add(Ljava/lang/Object;)Lcom/streambundlehtml/internal/StringUtil$StringJoiner;

    goto :goto_20

    .line 53
    :cond_2e
    invoke-virtual {v1}, Lcom/streambundlehtml/internal/StringUtil$StringJoiner;->complete()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static join([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "strings"    # [Ljava/lang/String;
    .param p1, "sep"    # Ljava/lang/String;

    .line 63
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/streambundlehtml/internal/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static normaliseWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "string"    # Ljava/lang/String;

    .line 222
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 223
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lcom/streambundlehtml/internal/StringUtil;->appendNormalisedWhitespace(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 224
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static padding(I)Ljava/lang/String;
    .registers 2
    .param p0, "width"    # I

    .line 123
    const/16 v0, 0x1e

    invoke-static {p0, v0}, Lcom/streambundlehtml/internal/StringUtil;->padding(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static padding(II)Ljava/lang/String;
    .registers 6
    .param p0, "width"    # I
    .param p1, "maxPaddingWidth"    # I

    .line 133
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ltz p0, :cond_6

    const/4 v2, 0x1

    goto :goto_7

    :cond_6
    const/4 v2, 0x0

    :goto_7
    const-string v3, "width must be >= 0"

    invoke-static {v2, v3}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 134
    const/4 v2, -0x1

    if-lt p1, v2, :cond_10

    const/4 v0, 0x1

    :cond_10
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 135
    if-eq p1, v2, :cond_19

    .line 136
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result p0

    .line 137
    :cond_19
    sget-object v0, Lcom/streambundlehtml/internal/StringUtil;->padding:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_23

    .line 138
    sget-object v0, Lcom/streambundlehtml/internal/StringUtil;->padding:[Ljava/lang/String;

    aget-object v0, v0, p0

    return-object v0

    .line 139
    :cond_23
    new-array v0, p0, [C

    .line 140
    .local v0, "out":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_26
    if-ge v1, p0, :cond_2f

    .line 141
    const/16 v2, 0x20

    aput-char v2, v0, v1

    .line 140
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 142
    .end local v1    # "i":I
    :cond_2f
    invoke-static {v0}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .registers 5
    .param p0, "sb"    # Ljava/lang/StringBuilder;

    .line 366
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 367
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 369
    .local v0, "string":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/16 v2, 0x2000

    if-le v1, v2, :cond_16

    .line 370
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object p0, v1

    goto :goto_1e

    .line 372
    :cond_16
    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 374
    :goto_1e
    sget-object v1, Lcom/streambundlehtml/internal/StringUtil;->threadLocalBuilders:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Stack;

    .line 375
    .local v1, "builders":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/StringBuilder;>;"
    invoke-virtual {v1, p0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    :goto_29
    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v2

    const/16 v3, 0x8

    if-le v2, v3, :cond_35

    .line 378
    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_29

    .line 380
    :cond_35
    return-object v0
.end method

.method public static resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "relUrl"    # Ljava/lang/String;

    .line 314
    invoke-static {p0}, Lcom/streambundlehtml/internal/StringUtil;->stripControlChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Lcom/streambundlehtml/internal/StringUtil;->stripControlChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 318
    :try_start_8
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/net/MalformedURLException; {:try_start_8 .. :try_end_d} :catch_17

    .line 323
    .local v0, "base":Ljava/net/URL;
    nop

    .line 324
    :try_start_e
    invoke-static {v0, p1}, Lcom/streambundlehtml/internal/StringUtil;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 319
    .end local v0    # "base":Ljava/net/URL;
    :catch_17
    move-exception v0

    .line 321
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 322
    .local v1, "abs":Ljava/net/URL;
    invoke-virtual {v1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2
    :try_end_21
    .catch Ljava/net/MalformedURLException; {:try_start_e .. :try_end_21} :catch_22

    return-object v2

    .line 325
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .end local v1    # "abs":Ljava/net/URL;
    :catch_22
    move-exception v0

    .line 328
    .restart local v0    # "e":Ljava/net/MalformedURLException;
    sget-object v1, Lcom/streambundlehtml/internal/StringUtil;->validUriScheme:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_31

    move-object v1, p1

    goto :goto_33

    :cond_31
    const-string v1, ""

    :goto_33
    return-object v1
.end method

.method public static resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;
    .registers 8
    .param p0, "base"    # Ljava/net/URL;
    .param p1, "relUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 293
    invoke-static {p1}, Lcom/streambundlehtml/internal/StringUtil;->stripControlChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 295
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 296
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 298
    :cond_21
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 299
    .local v0, "url":Ljava/net/URL;
    sget-object v1, Lcom/streambundlehtml/internal/StringUtil;->extraDotSegmentsPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 300
    .local v1, "fixedFile":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/net/URL;->getRef()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_57

    .line 301
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/URL;->getRef()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 303
    :cond_57
    new-instance v2, Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result v5

    invoke-direct {v2, v3, v4, v5, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    return-object v2
.end method

.method public static startsWithNewline(Ljava/lang/String;)Z
    .registers 4
    .param p0, "string"    # Ljava/lang/String;

    .line 168
    const/4 v0, 0x0

    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_13

    .line 170
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_12

    const/4 v0, 0x1

    :cond_12
    return v0

    .line 169
    :cond_13
    return v0
.end method

.method private static stripControlChars(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "input"    # Ljava/lang/String;

    .line 335
    sget-object v0, Lcom/streambundlehtml/internal/StringUtil;->controlChars:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
