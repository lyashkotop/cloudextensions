.class public Lcom/streambundlehtml/nodes/Range$Position;
.super Ljava/lang/Object;
.source "Range.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/nodes/Range;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Position"
.end annotation


# instance fields
.field private final columnNumber:I

.field private final lineNumber:I

.field private final pos:I


# direct methods
.method public constructor <init>(III)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "lineNumber"    # I
    .param p3, "columnNumber"    # I

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    iput p1, p0, Lcom/streambundlehtml/nodes/Range$Position;->pos:I

    .line 121
    iput p2, p0, Lcom/streambundlehtml/nodes/Range$Position;->lineNumber:I

    .line 122
    iput p3, p0, Lcom/streambundlehtml/nodes/Range$Position;->columnNumber:I

    .line 123
    return-void
.end method


# virtual methods
.method public columnNumber()I
    .registers 2

    .line 148
    iget v0, p0, Lcom/streambundlehtml/nodes/Range$Position;->columnNumber:I

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 170
    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 171
    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_2a

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_2a

    .line 172
    move-object v2, p1

    check-cast v2, Lcom/streambundlehtml/nodes/Range$Position;

    .line 173
    .local v2, "position":Lcom/streambundlehtml/nodes/Range$Position;
    iget v3, p0, Lcom/streambundlehtml/nodes/Range$Position;->pos:I

    iget v4, v2, Lcom/streambundlehtml/nodes/Range$Position;->pos:I

    if-eq v3, v4, :cond_1b

    return v1

    .line 174
    :cond_1b
    iget v3, p0, Lcom/streambundlehtml/nodes/Range$Position;->lineNumber:I

    iget v4, v2, Lcom/streambundlehtml/nodes/Range$Position;->lineNumber:I

    if-eq v3, v4, :cond_22

    return v1

    .line 175
    :cond_22
    iget v3, p0, Lcom/streambundlehtml/nodes/Range$Position;->columnNumber:I

    iget v4, v2, Lcom/streambundlehtml/nodes/Range$Position;->columnNumber:I

    if-eq v3, v4, :cond_29

    const/4 v0, 0x0

    :cond_29
    return v0

    .line 171
    .end local v2    # "position":Lcom/streambundlehtml/nodes/Range$Position;
    :cond_2a
    return v1
.end method

.method public hashCode()I
    .registers 4

    .line 180
    iget v0, p0, Lcom/streambundlehtml/nodes/Range$Position;->pos:I

    .line 181
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/streambundlehtml/nodes/Range$Position;->lineNumber:I

    add-int/2addr v1, v2

    .line 182
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget v2, p0, Lcom/streambundlehtml/nodes/Range$Position;->columnNumber:I

    add-int/2addr v0, v2

    .line 183
    .end local v1    # "result":I
    .restart local v0    # "result":I
    return v0
.end method

.method public isTracked()Z
    .registers 2

    .line 156
    # getter for: Lcom/streambundlehtml/nodes/Range;->UntrackedPos:Lcom/streambundlehtml/nodes/Range$Position;
    invoke-static {}, Lcom/streambundlehtml/nodes/Range;->access$000()Lcom/streambundlehtml/nodes/Range$Position;

    move-result-object v0

    if-eq p0, v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public lineNumber()I
    .registers 2

    .line 139
    iget v0, p0, Lcom/streambundlehtml/nodes/Range$Position;->lineNumber:I

    return v0
.end method

.method public pos()I
    .registers 2

    .line 131
    iget v0, p0, Lcom/streambundlehtml/nodes/Range$Position;->pos:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/streambundlehtml/nodes/Range$Position;->lineNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/streambundlehtml/nodes/Range$Position;->columnNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/streambundlehtml/nodes/Range$Position;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
