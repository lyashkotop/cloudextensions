.class public final Lcom/lagradost/HlsVariant;
.super Ljava/lang/Object;
.source "HlsPlaylist.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0007H\u00c6\u0003J\'\u0010\u0013\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u00c6\u0001J\u0014\u0010\u0014\u001a\u00020\u00152\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u0017\u001a\u00020\u0005H\u00d6\u0081\u0004J\n\u0010\u0018\u001a\u00020\u0003H\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f"
    }
    d2 = {
        "Lcom/lagradost/HlsVariant;",
        "",
        "url",
        "",
        "height",
        "",
        "bandwidth",
        "",
        "<init>",
        "(Ljava/lang/String;IJ)V",
        "getUrl",
        "()Ljava/lang/String;",
        "getHeight",
        "()I",
        "getBandwidth",
        "()J",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "toString"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final bandwidth:J

.field private final height:I

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;IJ)V
    .registers 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "height"    # I
    .param p3, "bandwidth"    # J

    const-string v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lagradost/HlsVariant;->url:Ljava/lang/String;

    iput p2, p0, Lcom/lagradost/HlsVariant;->height:I

    iput-wide p3, p0, Lcom/lagradost/HlsVariant;->bandwidth:J

    return-void
.end method

.method public static synthetic copy$default(Lcom/lagradost/HlsVariant;Ljava/lang/String;IJILjava/lang/Object;)Lcom/lagradost/HlsVariant;
    .registers 7

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_6

    iget-object p1, p0, Lcom/lagradost/HlsVariant;->url:Ljava/lang/String;

    :cond_6
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_c

    iget p2, p0, Lcom/lagradost/HlsVariant;->height:I

    :cond_c
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_12

    iget-wide p3, p0, Lcom/lagradost/HlsVariant;->bandwidth:J

    :cond_12
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/lagradost/HlsVariant;->copy(Ljava/lang/String;IJ)Lcom/lagradost/HlsVariant;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/lagradost/HlsVariant;->url:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()I
    .registers 2

    iget v0, p0, Lcom/lagradost/HlsVariant;->height:I

    return v0
.end method

.method public final component3()J
    .registers 3

    iget-wide v0, p0, Lcom/lagradost/HlsVariant;->bandwidth:J

    return-wide v0
.end method

.method public final copy(Ljava/lang/String;IJ)Lcom/lagradost/HlsVariant;
    .registers 6

    const-string v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/HlsVariant;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/lagradost/HlsVariant;-><init>(Ljava/lang/String;IJ)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/lagradost/HlsVariant;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    move-object v1, p1

    check-cast v1, Lcom/lagradost/HlsVariant;

    iget-object v3, p0, Lcom/lagradost/HlsVariant;->url:Ljava/lang/String;

    iget-object v4, v1, Lcom/lagradost/HlsVariant;->url:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    return v2

    :cond_18
    iget v3, p0, Lcom/lagradost/HlsVariant;->height:I

    iget v4, v1, Lcom/lagradost/HlsVariant;->height:I

    if-eq v3, v4, :cond_1f

    return v2

    :cond_1f
    iget-wide v3, p0, Lcom/lagradost/HlsVariant;->bandwidth:J

    iget-wide v5, v1, Lcom/lagradost/HlsVariant;->bandwidth:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_28

    return v2

    :cond_28
    return v0
.end method

.method public final getBandwidth()J
    .registers 3

    .line 5
    iget-wide v0, p0, Lcom/lagradost/HlsVariant;->bandwidth:J

    return-wide v0
.end method

.method public final getHeight()I
    .registers 2

    .line 5
    iget v0, p0, Lcom/lagradost/HlsVariant;->height:I

    return v0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 2

    .line 5
    iget-object v0, p0, Lcom/lagradost/HlsVariant;->url:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    iget-object v0, p0, Lcom/lagradost/HlsVariant;->url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/lagradost/HlsVariant;->height:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-wide v2, p0, Lcom/lagradost/HlsVariant;->bandwidth:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    add-int/2addr v0, v2

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    iget-object v0, p0, Lcom/lagradost/HlsVariant;->url:Ljava/lang/String;

    iget v1, p0, Lcom/lagradost/HlsVariant;->height:I

    iget-wide v2, p0, Lcom/lagradost/HlsVariant;->bandwidth:J

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "HlsVariant(url="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", height="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", bandwidth="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
