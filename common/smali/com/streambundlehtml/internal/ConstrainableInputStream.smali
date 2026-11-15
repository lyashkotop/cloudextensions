.class public final Lcom/streambundlehtml/internal/ConstrainableInputStream;
.super Ljava/io/BufferedInputStream;
.source "ConstrainableInputStream.java"


# static fields
.field private static final DefaultSize:I = 0x8000


# instance fields
.field private final capped:Z

.field private interrupted:Z

.field private final maxSize:I

.field private remaining:I

.field private startTime:J

.field private timeout:J


# direct methods
.method private constructor <init>(Ljava/io/InputStream;II)V
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "bufferSize"    # I
    .param p3, "maxSize"    # I

    .line 27
    invoke-direct {p0, p1, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 22
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->timeout:J

    .line 28
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ltz p3, :cond_d

    const/4 v2, 0x1

    goto :goto_e

    :cond_d
    const/4 v2, 0x0

    :goto_e
    invoke-static {v2}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 29
    iput p3, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->maxSize:I

    .line 30
    iput p3, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->remaining:I

    .line 31
    if-nez p3, :cond_18

    const/4 v0, 0x0

    :cond_18
    iput-boolean v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->capped:Z

    .line 32
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->startTime:J

    .line 33
    return-void
.end method

.method private expired()Z
    .registers 9

    .line 113
    iget-wide v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->timeout:J

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    cmp-long v5, v0, v2

    if-nez v5, :cond_a

    .line 114
    return v4

    .line 116
    :cond_a
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 117
    .local v0, "now":J
    iget-wide v2, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->startTime:J

    sub-long v2, v0, v2

    .line 118
    .local v2, "dur":J
    iget-wide v5, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->timeout:J

    cmp-long v7, v2, v5

    if-lez v7, :cond_19

    const/4 v4, 0x1

    :cond_19
    return v4
.end method

.method public static wrap(Ljava/io/InputStream;II)Lcom/streambundlehtml/internal/ConstrainableInputStream;
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "bufferSize"    # I
    .param p2, "maxSize"    # I

    .line 43
    instance-of v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;

    if-eqz v0, :cond_8

    .line 44
    move-object v0, p0

    check-cast v0, Lcom/streambundlehtml/internal/ConstrainableInputStream;

    goto :goto_d

    .line 45
    :cond_8
    new-instance v0, Lcom/streambundlehtml/internal/ConstrainableInputStream;

    invoke-direct {v0, p0, p1, p2}, Lcom/streambundlehtml/internal/ConstrainableInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 43
    :goto_d
    return-object v0
.end method


# virtual methods
.method public read([BII)I
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    iget-boolean v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->interrupted:Z

    const/4 v1, -0x1

    if-nez v0, :cond_3c

    iget-boolean v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->capped:Z

    if-eqz v0, :cond_d

    iget v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->remaining:I

    if-lez v0, :cond_3c

    .line 52
    :cond_d
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->interrupted:Z

    .line 55
    return v1

    .line 57
    :cond_17
    invoke-direct {p0}, Lcom/streambundlehtml/internal/ConstrainableInputStream;->expired()Z

    move-result v0

    if-nez v0, :cond_34

    .line 60
    iget-boolean v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->capped:Z

    if-eqz v0, :cond_27

    iget v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->remaining:I

    if-le p3, v0, :cond_27

    .line 61
    iget p3, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->remaining:I

    .line 64
    :cond_27
    :try_start_27
    invoke-super {p0, p1, p2, p3}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v0

    .line 65
    .local v0, "read":I
    iget v1, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->remaining:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->remaining:I
    :try_end_30
    .catch Ljava/net/SocketTimeoutException; {:try_start_27 .. :try_end_30} :catch_31

    .line 66
    return v0

    .line 67
    .end local v0    # "read":I
    :catch_31
    move-exception v0

    .line 68
    .local v0, "e":Ljava/net/SocketTimeoutException;
    const/4 v1, 0x0

    return v1

    .line 58
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    :cond_34
    new-instance v0, Ljava/net/SocketTimeoutException;

    const-string v1, "Read timeout"

    invoke-direct {v0, v1}, Ljava/net/SocketTimeoutException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_3c
    return v1
.end method

.method public readToByteBuffer(I)Ljava/nio/ByteBuffer;
    .registers 10
    .param p1, "max"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ltz p1, :cond_6

    const/4 v2, 0x1

    goto :goto_7

    :cond_6
    const/4 v2, 0x0

    :goto_7
    const-string v3, "maxSize must be 0 (unlimited) or larger"

    invoke-static {v2, v3}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 78
    if-gtz p1, :cond_f

    const/4 v0, 0x0

    .line 79
    .local v0, "localCapped":Z
    :cond_f
    const v2, 0x8000

    if-eqz v0, :cond_17

    if-ge p1, v2, :cond_17

    move v2, p1

    .line 80
    .local v2, "bufferSize":I
    :cond_17
    new-array v3, v2, [B

    .line 81
    .local v3, "readBuffer":[B
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 84
    .local v4, "outStream":Ljava/io/ByteArrayOutputStream;
    move v5, p1

    .line 86
    .local v5, "remaining":I
    :goto_1f
    if-eqz v0, :cond_26

    invoke-static {v5, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    goto :goto_27

    :cond_26
    move v6, v2

    :goto_27
    invoke-virtual {p0, v3, v1, v6}, Lcom/streambundlehtml/internal/ConstrainableInputStream;->read([BII)I

    move-result v6

    .line 87
    .local v6, "read":I
    const/4 v7, -0x1

    if-ne v6, v7, :cond_2f

    goto :goto_37

    .line 88
    :cond_2f
    if-eqz v0, :cond_41

    .line 89
    if-lt v6, v5, :cond_40

    .line 90
    invoke-virtual {v4, v3, v1, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 91
    nop

    .line 97
    :goto_37
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    return-object v1

    .line 93
    :cond_40
    sub-int/2addr v5, v6

    .line 95
    :cond_41
    invoke-virtual {v4, v3, v1, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1f
.end method

.method public reset()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    invoke-super {p0}, Ljava/io/BufferedInputStream;->reset()V

    .line 103
    iget v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->maxSize:I

    iget v1, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->markpos:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->remaining:I

    .line 104
    return-void
.end method

.method public timeout(JJ)Lcom/streambundlehtml/internal/ConstrainableInputStream;
    .registers 7
    .param p1, "startTimeNanos"    # J
    .param p3, "timeoutMillis"    # J

    .line 107
    iput-wide p1, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->startTime:J

    .line 108
    const-wide/32 v0, 0xf4240

    mul-long v0, v0, p3

    iput-wide v0, p0, Lcom/streambundlehtml/internal/ConstrainableInputStream;->timeout:J

    .line 109
    return-object p0
.end method
