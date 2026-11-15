.class public final Lcom/streambundlehtml/parser/CharacterReader;
.super Ljava/lang/Object;
.source "CharacterReader.java"


# static fields
.field static final EOF:C = '\uffff'

.field static final maxBufferLen:I = 0x8000

.field private static final maxStringCacheLen:I = 0xc

.field private static final minReadAheadLen:I = 0x400

.field static final readAheadLimit:I = 0x6000

.field private static final stringCacheSize:I = 0x200


# instance fields
.field private bufLength:I

.field private bufMark:I

.field private bufPos:I

.field private bufSplitPoint:I

.field private charBuf:[C

.field private lastIcIndex:I

.field private lastIcSeq:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private lineNumberOffset:I

.field private newlinePositions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private readFully:Z

.field private reader:Ljava/io/Reader;

.field private readerPos:I

.field private stringCache:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "input"    # Ljava/io/Reader;

    .line 47
    const v0, 0x8000

    invoke-direct {p0, p1, v0}, Lcom/streambundlehtml/parser/CharacterReader;-><init>(Ljava/io/Reader;I)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;I)V
    .registers 4
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "sz"    # I

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, -0x1

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    .line 33
    const/16 v0, 0x200

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    .line 36
    const/4 v0, 0x1

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->lineNumberOffset:I

    .line 39
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 40
    invoke-virtual {p1}, Ljava/io/Reader;->markSupported()Z

    move-result v0

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 41
    iput-object p1, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    .line 42
    const v0, 0x8000

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 43
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "input"    # Ljava/lang/String;

    .line 51
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/streambundlehtml/parser/CharacterReader;-><init>(Ljava/io/Reader;I)V

    .line 52
    return-void
.end method

.method private bufferUp()V
    .registers 12

    .line 69
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->readFully:Z

    if-nez v0, :cond_7d

    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufSplitPoint:I

    if-lt v0, v1, :cond_7d

    .line 74
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_17

    .line 75
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    .line 76
    .local v0, "pos":I
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    sub-int/2addr v2, v3

    .local v2, "offset":I
    goto :goto_1a

    .line 78
    .end local v0    # "pos":I
    .end local v2    # "offset":I
    :cond_17
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 79
    .restart local v0    # "pos":I
    const/4 v2, 0x0

    .line 83
    .restart local v2    # "offset":I
    :goto_1a
    :try_start_1a
    iget-object v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    int-to-long v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/io/Reader;->skip(J)J

    move-result-wide v3

    .line 84
    .local v3, "skipped":J
    iget-object v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    const v6, 0x8000

    invoke-virtual {v5, v6}, Ljava/io/Reader;->mark(I)V

    .line 85
    const/4 v5, 0x0

    .line 86
    .local v5, "read":I
    :goto_2a
    const/16 v6, 0x400

    const/4 v7, 0x1

    if-gt v5, v6, :cond_44

    .line 87
    iget-object v6, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    iget-object v8, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v9, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    array-length v9, v9

    sub-int/2addr v9, v5

    invoke-virtual {v6, v8, v5, v9}, Ljava/io/Reader;->read([CII)I

    move-result v6

    .line 88
    .local v6, "thisRead":I
    if-ne v6, v1, :cond_3f

    .line 89
    iput-boolean v7, p0, Lcom/streambundlehtml/parser/CharacterReader;->readFully:Z

    .line 90
    :cond_3f
    if-gtz v6, :cond_42

    .line 91
    goto :goto_44

    .line 92
    :cond_42
    add-int/2addr v5, v6

    .line 93
    .end local v6    # "thisRead":I
    goto :goto_2a

    .line 94
    :cond_44
    :goto_44
    iget-object v6, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    invoke-virtual {v6}, Ljava/io/Reader;->reset()V

    .line 95
    if-lez v5, :cond_6e

    .line 96
    int-to-long v8, v0

    const/4 v6, 0x0

    cmp-long v10, v3, v8

    if-eqz v10, :cond_52

    const/4 v7, 0x0

    :cond_52
    invoke-static {v7}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 97
    iput v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    .line 98
    iget v7, p0, Lcom/streambundlehtml/parser/CharacterReader;->readerPos:I

    add-int/2addr v7, v0

    iput v7, p0, Lcom/streambundlehtml/parser/CharacterReader;->readerPos:I

    .line 99
    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 100
    iget v7, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    if-eq v7, v1, :cond_64

    .line 101
    iput v6, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    .line 102
    :cond_64
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    const/16 v6, 0x6000

    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufSplitPoint:I
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_6e} :catch_76

    .line 106
    .end local v3    # "skipped":J
    .end local v5    # "read":I
    :cond_6e
    nop

    .line 107
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->scanBufferForNewlines()V

    .line 108
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->lastIcSeq:Ljava/lang/String;

    .line 109
    return-void

    .line 104
    :catch_76
    move-exception v1

    .line 105
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lcom/streambundlehtml/UncheckedIOException;

    invoke-direct {v3, v1}, Lcom/streambundlehtml/UncheckedIOException;-><init>(Ljava/io/IOException;)V

    throw v3

    .line 70
    .end local v0    # "pos":I
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "offset":I
    :cond_7d
    return-void
.end method

.method private static cacheString([C[Ljava/lang/String;II)Ljava/lang/String;
    .registers 8
    .param p0, "charBuf"    # [C
    .param p1, "stringCache"    # [Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "count"    # I

    .line 714
    const/16 v0, 0xc

    if-le p3, v0, :cond_a

    .line 715
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0, p2, p3}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    .line 716
    :cond_a
    const/4 v0, 0x1

    if-ge p3, v0, :cond_10

    .line 717
    const-string v0, ""

    return-object v0

    .line 720
    :cond_10
    const/4 v0, 0x0

    .line 721
    .local v0, "hash":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    if-ge v1, p3, :cond_1f

    .line 722
    mul-int/lit8 v2, v0, 0x1f

    add-int v3, p2, v1

    aget-char v3, p0, v3

    add-int v0, v2, v3

    .line 721
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 726
    .end local v1    # "i":I
    :cond_1f
    and-int/lit16 v1, v0, 0x1ff

    .line 727
    .local v1, "index":I
    aget-object v2, p1, v1

    .line 729
    .local v2, "cached":Ljava/lang/String;
    if-eqz v2, :cond_2c

    invoke-static {p0, p2, p3, v2}, Lcom/streambundlehtml/parser/CharacterReader;->rangeEquals([CIILjava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 730
    return-object v2

    .line 732
    :cond_2c
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p0, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 733
    .end local v2    # "cached":Ljava/lang/String;
    .local v3, "cached":Ljava/lang/String;
    aput-object v3, p1, v1

    .line 736
    return-object v3
.end method

.method private isEmptyNoBufferUp()Z
    .registers 3

    .line 238
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method private lineNumIndex(I)I
    .registers 4
    .param p1, "pos"    # I

    .line 199
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isTrackNewlines()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return v0

    .line 200
    :cond_8
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 201
    .local v0, "i":I
    const/4 v1, -0x1

    if-ge v0, v1, :cond_1b

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    add-int/lit8 v0, v1, -0x2

    .line 202
    :cond_1b
    return v0
.end method

.method static rangeEquals([CIILjava/lang/String;)Z
    .registers 9
    .param p0, "charBuf"    # [C
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "cached"    # Ljava/lang/String;

    .line 743
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-ne p2, v0, :cond_20

    .line 744
    move v0, p1

    .line 745
    .local v0, "i":I
    const/4 v2, 0x0

    .line 746
    .local v2, "j":I
    :goto_9
    add-int/lit8 v3, p2, -0x1

    .end local p2    # "count":I
    .local v3, "count":I
    if-eqz p2, :cond_1e

    .line 747
    add-int/lit8 p2, v0, 0x1

    .end local v0    # "i":I
    .local p2, "i":I
    aget-char v0, p0, v0

    add-int/lit8 v4, v2, 0x1

    .end local v2    # "j":I
    .local v4, "j":I
    invoke-virtual {p3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v0, v2, :cond_1a

    .line 748
    return v1

    .line 747
    :cond_1a
    move v0, p2

    move p2, v3

    move v2, v4

    goto :goto_9

    .line 750
    .end local v4    # "j":I
    .end local p2    # "i":I
    .restart local v0    # "i":I
    .restart local v2    # "j":I
    :cond_1e
    const/4 p2, 0x1

    return p2

    .line 752
    .end local v0    # "i":I
    .end local v2    # "j":I
    .end local v3    # "count":I
    .local p2, "count":I
    :cond_20
    return v1
.end method

.method private scanBufferForNewlines()V
    .registers 5

    .line 209
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isTrackNewlines()Z

    move-result v0

    if-nez v0, :cond_7

    .line 210
    return-void

    .line 212
    :cond_7
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_38

    .line 214
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->readerPos:I

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/CharacterReader;->lineNumIndex(I)I

    move-result v0

    .line 215
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_19

    const/4 v0, 0x0

    .line 216
    :cond_19
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 217
    .local v1, "linePos":I
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->lineNumberOffset:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->lineNumberOffset:I

    .line 218
    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 219
    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    .end local v0    # "index":I
    .end local v1    # "linePos":I
    :cond_38
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .local v0, "i":I
    :goto_3a
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v0, v1, :cond_57

    .line 223
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    aget-char v1, v1, v0

    const/16 v2, 0xa

    if-ne v1, v2, :cond_54

    .line 224
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->readerPos:I

    add-int/lit8 v2, v2, 0x1

    add-int/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    :cond_54
    add-int/lit8 v0, v0, 0x1

    goto :goto_3a

    .line 226
    .end local v0    # "i":I
    :cond_57
    return-void
.end method


# virtual methods
.method public advance()V
    .registers 2

    .line 271
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 272
    return-void
.end method

.method public close()V
    .registers 3

    .line 55
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    if-nez v0, :cond_5

    .line 56
    return-void

    .line 58
    :cond_5
    const/4 v0, 0x0

    :try_start_6
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_b} :catch_14
    .catchall {:try_start_6 .. :try_end_b} :catchall_c

    goto :goto_15

    .line 61
    :catchall_c
    move-exception v1

    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    .line 62
    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 63
    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    .line 64
    throw v1

    .line 59
    :catch_14
    move-exception v1

    .line 61
    :goto_15
    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->reader:Ljava/io/Reader;

    .line 62
    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 63
    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    .line 64
    nop

    .line 65
    return-void
.end method

.method public columnNumber()I
    .registers 2

    .line 174
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->pos()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/CharacterReader;->columnNumber(I)I

    move-result v0

    return v0
.end method

.method columnNumber(I)I
    .registers 4
    .param p1, "pos"    # I

    .line 178
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isTrackNewlines()Z

    move-result v0

    if-nez v0, :cond_9

    .line 179
    add-int/lit8 v0, p1, 0x1

    return v0

    .line 181
    :cond_9
    invoke-direct {p0, p1}, Lcom/streambundlehtml/parser/CharacterReader;->lineNumIndex(I)I

    move-result v0

    .line 182
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_13

    .line 183
    add-int/lit8 v1, p1, 0x1

    return v1

    .line 184
    :cond_13
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int v1, p1, v1

    add-int/lit8 v1, v1, 0x1

    return v1
.end method

.method consume()C
    .registers 3

    .line 251
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 252
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmptyNoBufferUp()Z

    move-result v0

    if-eqz v0, :cond_d

    const v0, 0xffff

    goto :goto_13

    :cond_d
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v0, v0, v1

    .line 253
    .local v0, "val":C
    :goto_13
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 254
    return v0
.end method

.method consumeAttributeQuoted(Z)Ljava/lang/String;
    .registers 9
    .param p1, "single"    # Z

    .line 437
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 438
    .local v0, "pos":I
    move v1, v0

    .line 439
    .local v1, "start":I
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    .line 440
    .local v2, "remaining":I
    iget-object v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 442
    .local v3, "val":[C
    :goto_7
    if-ge v0, v2, :cond_19

    .line 443
    aget-char v4, v3, v0

    sparse-switch v4, :sswitch_data_2c

    goto :goto_16

    .line 448
    :sswitch_f
    if-eqz p1, :cond_12

    goto :goto_19

    .line 450
    :cond_12
    :sswitch_12
    if-nez p1, :cond_16

    goto :goto_19

    .line 446
    :sswitch_15
    goto :goto_19

    .line 452
    :cond_16
    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 455
    :cond_19
    :goto_19
    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 456
    if-le v0, v1, :cond_28

    iget-object v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    sub-int v6, v0, v1

    invoke-static {v4, v5, v1, v6}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    goto :goto_2a

    :cond_28
    const-string v4, ""

    :goto_2a
    return-object v4

    nop

    :sswitch_data_2c
    .sparse-switch
        0x0 -> :sswitch_15
        0x22 -> :sswitch_12
        0x26 -> :sswitch_15
        0x27 -> :sswitch_f
    .end sparse-switch
.end method

.method consumeData()Ljava/lang/String;
    .registers 8

    .line 415
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 416
    .local v0, "pos":I
    move v1, v0

    .line 417
    .local v1, "start":I
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    .line 418
    .local v2, "remaining":I
    iget-object v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 420
    .local v3, "val":[C
    :goto_7
    if-ge v0, v2, :cond_12

    .line 421
    aget-char v4, v3, v0

    sparse-switch v4, :sswitch_data_24

    .line 427
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 425
    :sswitch_11
    nop

    .line 430
    :cond_12
    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 431
    if-le v0, v1, :cond_21

    iget-object v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    sub-int v6, v0, v1

    invoke-static {v4, v5, v1, v6}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    goto :goto_23

    :cond_21
    const-string v4, ""

    :goto_23
    return-object v4

    :sswitch_data_24
    .sparse-switch
        0x0 -> :sswitch_11
        0x26 -> :sswitch_11
        0x3c -> :sswitch_11
    .end sparse-switch
.end method

.method consumeDigitSequence()Ljava/lang/String;
    .registers 5

    .line 565
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 566
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 567
    .local v0, "start":I
    :goto_5
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v1, v2, :cond_20

    .line 568
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v1, v1, v2

    .line 569
    .local v1, "c":C
    const/16 v2, 0x30

    if-lt v1, v2, :cond_20

    const/16 v2, 0x39

    if-gt v1, v2, :cond_20

    .line 570
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 573
    .end local v1    # "c":C
    goto :goto_5

    .line 574
    :cond_20
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v3, v0

    invoke-static {v1, v2, v0, v3}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method consumeHexSequence()Ljava/lang/String;
    .registers 5

    .line 552
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 553
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 554
    .local v0, "start":I
    :goto_5
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v1, v2, :cond_30

    .line 555
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v1, v1, v2

    .line 556
    .local v1, "c":C
    const/16 v2, 0x30

    if-lt v1, v2, :cond_19

    const/16 v2, 0x39

    if-le v1, v2, :cond_29

    :cond_19
    const/16 v2, 0x41

    if-lt v1, v2, :cond_21

    const/16 v2, 0x46

    if-le v1, v2, :cond_29

    :cond_21
    const/16 v2, 0x61

    if-lt v1, v2, :cond_30

    const/16 v2, 0x66

    if-gt v1, v2, :cond_30

    .line 557
    :cond_29
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 560
    .end local v1    # "c":C
    goto :goto_5

    .line 561
    :cond_30
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v3, v0

    invoke-static {v1, v2, v0, v3}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method consumeLetterSequence()Ljava/lang/String;
    .registers 5

    .line 517
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 518
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 519
    .local v0, "start":I
    :goto_5
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v1, v2, :cond_2e

    .line 520
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v1, v1, v2

    .line 521
    .local v1, "c":C
    const/16 v2, 0x41

    if-lt v1, v2, :cond_19

    const/16 v2, 0x5a

    if-le v1, v2, :cond_27

    :cond_19
    const/16 v2, 0x61

    if-lt v1, v2, :cond_21

    const/16 v2, 0x7a

    if-le v1, v2, :cond_27

    :cond_21
    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 522
    :cond_27
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 525
    .end local v1    # "c":C
    goto :goto_5

    .line 527
    :cond_2e
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v3, v0

    invoke-static {v1, v2, v0, v3}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method consumeLetterThenDigitSequence()Ljava/lang/String;
    .registers 5

    .line 531
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 532
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 533
    .local v0, "start":I
    :goto_5
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v1, v2, :cond_2e

    .line 534
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v1, v1, v2

    .line 535
    .local v1, "c":C
    const/16 v2, 0x41

    if-lt v1, v2, :cond_19

    const/16 v2, 0x5a

    if-le v1, v2, :cond_27

    :cond_19
    const/16 v2, 0x61

    if-lt v1, v2, :cond_21

    const/16 v2, 0x7a

    if-le v1, v2, :cond_27

    :cond_21
    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 536
    :cond_27
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 539
    .end local v1    # "c":C
    goto :goto_5

    .line 540
    :cond_2e
    :goto_2e
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmptyNoBufferUp()Z

    move-result v1

    if-nez v1, :cond_49

    .line 541
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v1, v1, v2

    .line 542
    .restart local v1    # "c":C
    const/16 v2, 0x30

    if-lt v1, v2, :cond_49

    const/16 v2, 0x39

    if-gt v1, v2, :cond_49

    .line 543
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 546
    .end local v1    # "c":C
    goto :goto_2e

    .line 548
    :cond_49
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v3, v0

    invoke-static {v1, v2, v0, v3}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method consumeRawData()Ljava/lang/String;
    .registers 8

    .line 463
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 464
    .local v0, "pos":I
    move v1, v0

    .line 465
    .local v1, "start":I
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    .line 466
    .local v2, "remaining":I
    iget-object v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 468
    .local v3, "val":[C
    :goto_7
    if-ge v0, v2, :cond_12

    .line 469
    aget-char v4, v3, v0

    sparse-switch v4, :sswitch_data_24

    .line 474
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 472
    :sswitch_11
    nop

    .line 477
    :cond_12
    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 478
    if-le v0, v1, :cond_21

    iget-object v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    sub-int v6, v0, v1

    invoke-static {v4, v5, v1, v6}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    goto :goto_23

    :cond_21
    const-string v4, ""

    :goto_23
    return-object v4

    :sswitch_data_24
    .sparse-switch
        0x0 -> :sswitch_11
        0x3c -> :sswitch_11
    .end sparse-switch
.end method

.method consumeTagName()Ljava/lang/String;
    .registers 8

    .line 484
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 485
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 486
    .local v0, "pos":I
    move v1, v0

    .line 487
    .local v1, "start":I
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    .line 488
    .local v2, "remaining":I
    iget-object v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 490
    .local v3, "val":[C
    :goto_a
    if-ge v0, v2, :cond_15

    .line 491
    aget-char v4, v3, v0

    sparse-switch v4, :sswitch_data_28

    .line 502
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 500
    :sswitch_14
    nop

    .line 505
    :cond_15
    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 506
    if-le v0, v1, :cond_24

    iget-object v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    sub-int v6, v0, v1

    invoke-static {v4, v5, v1, v6}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    goto :goto_26

    :cond_24
    const-string v4, ""

    :goto_26
    return-object v4

    nop

    :sswitch_data_28
    .sparse-switch
        0x9 -> :sswitch_14
        0xa -> :sswitch_14
        0xc -> :sswitch_14
        0xd -> :sswitch_14
        0x20 -> :sswitch_14
        0x2f -> :sswitch_14
        0x3c -> :sswitch_14
        0x3e -> :sswitch_14
    .end sparse-switch
.end method

.method public consumeTo(C)Ljava/lang/String;
    .registers 6
    .param p1, "c"    # C

    .line 341
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/CharacterReader;->nextIndexOf(C)I

    move-result v0

    .line 342
    .local v0, "offset":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_17

    .line 343
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    invoke-static {v1, v2, v3, v0}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    .line 344
    .local v1, "consumed":Ljava/lang/String;
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 345
    return-object v1

    .line 347
    .end local v1    # "consumed":Ljava/lang/String;
    :cond_17
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeToEnd()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method consumeTo(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "seq"    # Ljava/lang/String;

    .line 352
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/CharacterReader;->nextIndexOf(Ljava/lang/CharSequence;)I

    move-result v0

    .line 353
    .local v0, "offset":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_17

    .line 354
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    invoke-static {v1, v2, v3, v0}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    .line 355
    .local v1, "consumed":Ljava/lang/String;
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 356
    return-object v1

    .line 357
    .end local v1    # "consumed":Ljava/lang/String;
    :cond_17
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v1, v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_27

    .line 359
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->consumeToEnd()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 363
    :cond_27
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    .line 364
    .local v1, "endPos":I
    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    iget v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int v5, v1, v5

    invoke-static {v2, v3, v4, v5}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v2

    .line 365
    .local v2, "consumed":Ljava/lang/String;
    iput v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 366
    return-object v2
.end method

.method public varargs consumeToAny([C)Ljava/lang/String;
    .registers 10
    .param p1, "chars"    # [C

    .line 376
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 377
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 378
    .local v0, "pos":I
    move v1, v0

    .line 379
    .local v1, "start":I
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    .line 380
    .local v2, "remaining":I
    iget-object v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 381
    .local v3, "val":[C
    array-length v4, p1

    .line 384
    .local v4, "charLen":I
    :goto_b
    if-ge v0, v2, :cond_1d

    .line 385
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_e
    if-ge v5, v4, :cond_1a

    .line 386
    aget-char v6, v3, v0

    aget-char v7, p1, v5

    if-ne v6, v7, :cond_17

    .line 387
    goto :goto_1d

    .line 385
    :cond_17
    add-int/lit8 v5, v5, 0x1

    goto :goto_e

    .line 389
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 392
    .end local v5    # "i":I
    :cond_1d
    :goto_1d
    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 393
    if-le v0, v1, :cond_2c

    iget-object v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v6, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    sub-int v7, v0, v1

    invoke-static {v5, v6, v1, v7}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v5

    goto :goto_2e

    :cond_2c
    const-string v5, ""

    :goto_2e
    return-object v5
.end method

.method varargs consumeToAnySorted([C)Ljava/lang/String;
    .registers 9
    .param p1, "chars"    # [C

    .line 397
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 398
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 399
    .local v0, "pos":I
    move v1, v0

    .line 400
    .local v1, "start":I
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    .line 401
    .local v2, "remaining":I
    iget-object v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    .line 403
    .local v3, "val":[C
    :goto_a
    if-ge v0, v2, :cond_18

    .line 404
    aget-char v4, v3, v0

    invoke-static {p1, v4}, Ljava/util/Arrays;->binarySearch([CC)I

    move-result v4

    if-ltz v4, :cond_15

    .line 405
    goto :goto_18

    .line 406
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 408
    :cond_18
    :goto_18
    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 409
    iget v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    if-le v4, v1, :cond_29

    iget-object v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    sub-int v6, v0, v1

    invoke-static {v4, v5, v1, v6}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    goto :goto_2b

    :cond_29
    const-string v4, ""

    :goto_2b
    return-object v4
.end method

.method consumeToEnd()Ljava/lang/String;
    .registers 6

    .line 510
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 511
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->stringCache:[Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    iget v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v3, v4

    invoke-static {v0, v1, v2, v3}, Lcom/streambundlehtml/parser/CharacterReader;->cacheString([C[Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    .line 512
    .local v0, "data":Ljava/lang/String;
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    iput v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 513
    return-object v0
.end method

.method containsIgnoreCase(Ljava/lang/String;)Z
    .registers 9
    .param p1, "seq"    # Ljava/lang/String;

    .line 679
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->lastIcSeq:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, -0x1

    if-eqz v0, :cond_17

    .line 680
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->lastIcIndex:I

    if-ne v0, v3, :cond_10

    return v1

    .line 681
    :cond_10
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->lastIcIndex:I

    iget v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    if-lt v0, v4, :cond_17

    return v2

    .line 683
    :cond_17
    iput-object p1, p0, Lcom/streambundlehtml/parser/CharacterReader;->lastIcSeq:Ljava/lang/String;

    .line 685
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 686
    .local v0, "loScan":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/CharacterReader;->nextIndexOf(Ljava/lang/CharSequence;)I

    move-result v4

    .line 687
    .local v4, "lo":I
    if-le v4, v3, :cond_2b

    .line 688
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/2addr v1, v4

    iput v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->lastIcIndex:I

    return v2

    .line 691
    :cond_2b
    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    .line 692
    .local v5, "hiScan":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/streambundlehtml/parser/CharacterReader;->nextIndexOf(Ljava/lang/CharSequence;)I

    move-result v6

    .line 693
    .local v6, "hi":I
    if-le v6, v3, :cond_38

    const/4 v1, 0x1

    .line 694
    .local v1, "found":Z
    :cond_38
    if-eqz v1, :cond_3e

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int v3, v2, v6

    :cond_3e
    iput v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->lastIcIndex:I

    .line 695
    return v1
.end method

.method public current()C
    .registers 3

    .line 246
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 247
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmptyNoBufferUp()Z

    move-result v0

    if-eqz v0, :cond_d

    const v0, 0xffff

    goto :goto_13

    :cond_d
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v0, v0, v1

    :goto_13
    return v0
.end method

.method cursorPos()Ljava/lang/String;
    .registers 3

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->lineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->columnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 3

    .line 233
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 234
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-lt v0, v1, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public isTrackNewlines()Z
    .registers 2

    .line 142
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public lineNumber()I
    .registers 2

    .line 152
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->pos()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/CharacterReader;->lineNumber(I)I

    move-result v0

    return v0
.end method

.method lineNumber(I)I
    .registers 5
    .param p1, "pos"    # I

    .line 158
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isTrackNewlines()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_8

    .line 159
    return v1

    .line 161
    :cond_8
    invoke-direct {p0, p1}, Lcom/streambundlehtml/parser/CharacterReader;->lineNumIndex(I)I

    move-result v0

    .line 162
    .local v0, "i":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_12

    .line 163
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->lineNumberOffset:I

    return v1

    .line 164
    :cond_12
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->lineNumberOffset:I

    add-int/2addr v2, v0

    add-int/2addr v2, v1

    return v2
.end method

.method mark()V
    .registers 3

    .line 276
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v0, v1

    const/16 v1, 0x400

    if-ge v0, v1, :cond_c

    .line 277
    const/4 v0, 0x0

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufSplitPoint:I

    .line 279
    :cond_c
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 280
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    .line 281
    return-void
.end method

.method matchConsume(Ljava/lang/String;)Z
    .registers 4
    .param p1, "seq"    # Ljava/lang/String;

    .line 653
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 654
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/CharacterReader;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 655
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 656
    const/4 v0, 0x1

    return v0

    .line 658
    :cond_14
    const/4 v0, 0x0

    return v0
.end method

.method matchConsumeIgnoreCase(Ljava/lang/String;)Z
    .registers 4
    .param p1, "seq"    # Ljava/lang/String;

    .line 663
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/CharacterReader;->matchesIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 664
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 665
    const/4 v0, 0x1

    return v0

    .line 667
    :cond_11
    const/4 v0, 0x0

    return v0
.end method

.method matches(C)Z
    .registers 4
    .param p1, "c"    # C

    .line 578
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v0, v0, v1

    if-ne v0, p1, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method matches(Ljava/lang/String;)Z
    .registers 8
    .param p1, "seq"    # Ljava/lang/String;

    .line 583
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 584
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 585
    .local v0, "scanLength":I
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    if-le v0, v1, :cond_10

    .line 586
    return v2

    .line 588
    :cond_10
    const/4 v1, 0x0

    .local v1, "offset":I
    :goto_11
    if-ge v1, v0, :cond_24

    .line 589
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    iget-object v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/2addr v5, v1

    aget-char v4, v4, v5

    if-eq v3, v4, :cond_21

    .line 590
    return v2

    .line 588
    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 591
    .end local v1    # "offset":I
    :cond_24
    const/4 v1, 0x1

    return v1
.end method

.method varargs matchesAny([C)Z
    .registers 7
    .param p1, "seq"    # [C

    .line 610
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 611
    return v1

    .line 613
    :cond_8
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 614
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v0, v0, v2

    .line 615
    .local v0, "c":C
    array-length v2, p1

    const/4 v3, 0x0

    :goto_13
    if-ge v3, v2, :cond_1e

    aget-char v4, p1, v3

    .line 616
    .local v4, "seek":C
    if-ne v4, v0, :cond_1b

    .line 617
    const/4 v1, 0x1

    return v1

    .line 615
    .end local v4    # "seek":C
    :cond_1b
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 619
    :cond_1e
    return v1
.end method

.method matchesAnySorted([C)Z
    .registers 4
    .param p1, "seq"    # [C

    .line 623
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 624
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_17

    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v0, v0, v1

    invoke-static {p1, v0}, Ljava/util/Arrays;->binarySearch([CC)I

    move-result v0

    if-ltz v0, :cond_17

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    return v0
.end method

.method matchesAsciiAlpha()Z
    .registers 4

    .line 639
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 640
    return v1

    .line 641
    :cond_8
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v0, v0, v2

    .line 642
    .local v0, "c":C
    const/16 v2, 0x41

    if-lt v0, v2, :cond_16

    const/16 v2, 0x5a

    if-le v0, v2, :cond_1e

    :cond_16
    const/16 v2, 0x61

    if-lt v0, v2, :cond_1f

    const/16 v2, 0x7a

    if-gt v0, v2, :cond_1f

    :cond_1e
    const/4 v1, 0x1

    :cond_1f
    return v1
.end method

.method matchesDigit()Z
    .registers 4

    .line 646
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 647
    return v1

    .line 648
    :cond_8
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v0, v0, v2

    .line 649
    .local v0, "c":C
    const/16 v2, 0x30

    if-lt v0, v2, :cond_17

    const/16 v2, 0x39

    if-gt v0, v2, :cond_17

    const/4 v1, 0x1

    :cond_17
    return v1
.end method

.method matchesIgnoreCase(Ljava/lang/String;)Z
    .registers 8
    .param p1, "seq"    # Ljava/lang/String;

    .line 595
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 596
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 597
    .local v0, "scanLength":I
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    if-le v0, v1, :cond_10

    .line 598
    return v2

    .line 600
    :cond_10
    const/4 v1, 0x0

    .local v1, "offset":I
    :goto_11
    if-ge v1, v0, :cond_2c

    .line 601
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    .line 602
    .local v3, "upScan":C
    iget-object v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v5, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/2addr v5, v1

    aget-char v4, v4, v5

    invoke-static {v4}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    .line 603
    .local v4, "upTarget":C
    if-eq v3, v4, :cond_29

    .line 604
    return v2

    .line 600
    .end local v3    # "upScan":C
    .end local v4    # "upTarget":C
    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 606
    .end local v1    # "offset":I
    :cond_2c
    const/4 v1, 0x1

    return v1
.end method

.method matchesLetter()Z
    .registers 4

    .line 628
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 629
    return v1

    .line 630
    :cond_8
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    aget-char v0, v0, v2

    .line 631
    .local v0, "c":C
    const/16 v2, 0x41

    if-lt v0, v2, :cond_16

    const/16 v2, 0x5a

    if-le v0, v2, :cond_24

    :cond_16
    const/16 v2, 0x61

    if-lt v0, v2, :cond_1e

    const/16 v2, 0x7a

    if-le v0, v2, :cond_24

    :cond_1e
    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-eqz v2, :cond_25

    :cond_24
    const/4 v1, 0x1

    :cond_25
    return v1
.end method

.method nextIndexOf(C)I
    .registers 4
    .param p1, "c"    # C

    .line 302
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 303
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .local v0, "i":I
    :goto_5
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v0, v1, :cond_17

    .line 304
    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    aget-char v1, v1, v0

    if-ne p1, v1, :cond_14

    .line 305
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int v1, v0, v1

    return v1

    .line 303
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 307
    .end local v0    # "i":I
    :cond_17
    const/4 v0, -0x1

    return v0
.end method

.method nextIndexOf(Ljava/lang/CharSequence;)I
    .registers 9
    .param p1, "seq"    # Ljava/lang/CharSequence;

    .line 317
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->bufferUp()V

    .line 319
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 320
    .local v0, "startChar":C
    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .local v1, "offset":I
    :goto_a
    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v1, v2, :cond_4e

    .line 322
    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    aget-char v2, v2, v1

    if-eq v0, v2, :cond_21

    .line 323
    :goto_14
    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v1, v2, :cond_21

    iget-object v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    aget-char v2, v2, v1

    if-eq v0, v2, :cond_21

    goto :goto_14

    .line 324
    :cond_21
    add-int/lit8 v2, v1, 0x1

    .line 325
    .local v2, "i":I
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    add-int/2addr v3, v2

    add-int/lit8 v3, v3, -0x1

    .line 326
    .local v3, "last":I
    iget v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-ge v1, v4, :cond_4b

    iget v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    if-gt v3, v4, :cond_4b

    .line 327
    const/4 v4, 0x1

    .local v4, "j":I
    :goto_33
    if-ge v2, v3, :cond_44

    invoke-interface {p1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    iget-object v6, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    aget-char v6, v6, v2

    if-ne v5, v6, :cond_44

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    .line 328
    .end local v4    # "j":I
    :cond_44
    if-ne v2, v3, :cond_4b

    .line 329
    iget v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int v4, v1, v4

    return v4

    .line 320
    .end local v2    # "i":I
    .end local v3    # "last":I
    :cond_4b
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 332
    .end local v1    # "offset":I
    :cond_4e
    const/4 v1, -0x1

    return v1
.end method

.method public pos()I
    .registers 3

    .line 116
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->readerPos:I

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    add-int/2addr v0, v1

    return v0
.end method

.method rangeEquals(IILjava/lang/String;)Z
    .registers 5
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "cached"    # Ljava/lang/String;

    .line 757
    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    invoke-static {v0, p1, p2, p3}, Lcom/streambundlehtml/parser/CharacterReader;->rangeEquals([CIILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method rewindToMark()V
    .registers 4

    .line 288
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_d

    .line 291
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 292
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/CharacterReader;->unmark()V

    .line 293
    return-void

    .line 289
    :cond_d
    new-instance v0, Lcom/streambundlehtml/UncheckedIOException;

    new-instance v1, Ljava/io/IOException;

    const-string v2, "Mark invalid"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/streambundlehtml/UncheckedIOException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .line 700
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    iget v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v0, v1

    if-gez v0, :cond_a

    .line 701
    const-string v0, ""

    return-object v0

    .line 702
    :cond_a
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundlehtml/parser/CharacterReader;->charBuf:[C

    iget v2, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    iget v3, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufLength:I

    iget v4, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public trackNewlines(Z)V
    .registers 4
    .param p1, "track"    # Z

    .line 128
    if-eqz p1, :cond_13

    iget-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    if-nez v0, :cond_13

    .line 129
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x199

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    .line 130
    invoke-direct {p0}, Lcom/streambundlehtml/parser/CharacterReader;->scanBufferForNewlines()V

    goto :goto_18

    .line 132
    :cond_13
    if-nez p1, :cond_18

    .line 133
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->newlinePositions:Ljava/util/ArrayList;

    .line 134
    :cond_18
    :goto_18
    return-void
.end method

.method unconsume()V
    .registers 4

    .line 261
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_b

    .line 264
    iget v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufPos:I

    .line 265
    return-void

    .line 262
    :cond_b
    new-instance v0, Lcom/streambundlehtml/UncheckedIOException;

    new-instance v1, Ljava/io/IOException;

    const-string v2, "WTF: No buffer left to unconsume."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/streambundlehtml/UncheckedIOException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method unmark()V
    .registers 2

    .line 284
    const/4 v0, -0x1

    iput v0, p0, Lcom/streambundlehtml/parser/CharacterReader;->bufMark:I

    .line 285
    return-void
.end method
