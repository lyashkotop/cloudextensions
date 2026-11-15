.class public final Lcom/streambundle/v38/ThumbnailSize;
.super Ljava/lang/Object;
.source "ThumbnailSize.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static choose(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 15

    .line 6
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_9c

    const-string v0, "data:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    goto/16 :goto_9c

    .line 7
    :cond_12
    nop

    .line 8
    nop

    .line 9
    const-string v0, ","

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v2, 0x0

    const-wide v3, 0x7fefffffffffffffL    # Double.MAX_VALUE

    move v5, v2

    :goto_22
    if-lt v5, v0, :cond_25

    .line 28
    return-object v1

    .line 9
    :cond_25
    aget-object v6, p0, v5

    .line 10
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, "\\s+"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 11
    aget-object v7, v6, v2

    invoke-static {p1, v7}, Lcom/streambundle/v38/BundleMetadata;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 12
    invoke-static {v7}, Lcom/streambundle/v38/PosterSupport;->valid(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3e

    goto :goto_99

    .line 13
    :cond_3e
    nop

    .line 14
    array-length v8, v6

    const-wide v9, 0x4076800000000000L    # 360.0

    const/4 v11, 0x1

    if-le v8, v11, :cond_70

    aget-object v8, v6, v11

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v11, :cond_70

    .line 16
    :try_start_50
    aget-object v6, v6, v11

    .line 17
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v8, v11

    invoke-virtual {v6, v2, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v11
    :try_end_5f
    .catch Ljava/lang/NumberFormatException; {:try_start_50 .. :try_end_5f} :catch_6e

    .line 18
    :try_start_5f
    const-string v8, "x"

    invoke-virtual {v6, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6
    :try_end_65
    .catch Ljava/lang/NumberFormatException; {:try_start_5f .. :try_end_65} :catch_6b

    if-eqz v6, :cond_69

    mul-double/2addr v9, v11

    goto :goto_6f

    :cond_69
    move-wide v9, v11

    goto :goto_70

    .line 19
    :catch_6b
    move-exception v6

    move-wide v9, v11

    goto :goto_6f

    :catch_6e
    move-exception v6

    :goto_6f
    nop

    .line 21
    :cond_70
    :goto_70
    const-wide/16 v11, 0x0

    cmpg-double v6, v9, v11

    if-lez v6, :cond_99

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-nez v6, :cond_99

    invoke-static {v9, v10}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v6

    if-eqz v6, :cond_83

    goto :goto_99

    .line 22
    :cond_83
    const-wide/high16 v11, 0x4074000000000000L    # 320.0

    cmpl-double v6, v9, v11

    if-ltz v6, :cond_8b

    sub-double/2addr v9, v11

    goto :goto_92

    :cond_8b
    const-wide v11, 0x4094a00000000000L    # 1320.0

    sub-double v9, v11, v9

    .line 23
    :goto_92
    cmpg-double v6, v9, v3

    if-gez v6, :cond_99

    .line 24
    nop

    .line 25
    move-object v1, v7

    move-wide v3, v9

    .line 9
    :cond_99
    :goto_99
    add-int/lit8 v5, v5, 0x1

    goto :goto_22

    .line 6
    :cond_9c
    :goto_9c
    return-object v1
.end method
