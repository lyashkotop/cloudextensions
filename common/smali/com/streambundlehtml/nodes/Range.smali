.class public Lcom/streambundlehtml/nodes/Range;
.super Ljava/lang/Object;
.source "Range.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/nodes/Range$Position;
    }
.end annotation


# static fields
.field private static final EndRangeKey:Ljava/lang/String;

.field private static final RangeKey:Ljava/lang/String;

.field private static final Untracked:Lcom/streambundlehtml/nodes/Range;

.field private static final UntrackedPos:Lcom/streambundlehtml/nodes/Range$Position;


# instance fields
.field private final end:Lcom/streambundlehtml/nodes/Range$Position;

.field private final start:Lcom/streambundlehtml/nodes/Range$Position;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 15
    const-string v0, "jsoup.sourceRange"

    invoke-static {v0}, Lcom/streambundlehtml/nodes/Attributes;->internalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Range;->RangeKey:Ljava/lang/String;

    .line 16
    const-string v0, "jsoup.endSourceRange"

    invoke-static {v0}, Lcom/streambundlehtml/nodes/Attributes;->internalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Range;->EndRangeKey:Ljava/lang/String;

    .line 17
    new-instance v0, Lcom/streambundlehtml/nodes/Range$Position;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1, v1}, Lcom/streambundlehtml/nodes/Range$Position;-><init>(III)V

    sput-object v0, Lcom/streambundlehtml/nodes/Range;->UntrackedPos:Lcom/streambundlehtml/nodes/Range$Position;

    .line 18
    new-instance v0, Lcom/streambundlehtml/nodes/Range;

    sget-object v1, Lcom/streambundlehtml/nodes/Range;->UntrackedPos:Lcom/streambundlehtml/nodes/Range$Position;

    sget-object v2, Lcom/streambundlehtml/nodes/Range;->UntrackedPos:Lcom/streambundlehtml/nodes/Range$Position;

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Range;-><init>(Lcom/streambundlehtml/nodes/Range$Position;Lcom/streambundlehtml/nodes/Range$Position;)V

    sput-object v0, Lcom/streambundlehtml/nodes/Range;->Untracked:Lcom/streambundlehtml/nodes/Range;

    return-void
.end method

.method public constructor <init>(Lcom/streambundlehtml/nodes/Range$Position;Lcom/streambundlehtml/nodes/Range$Position;)V
    .registers 3
    .param p1, "start"    # Lcom/streambundlehtml/nodes/Range$Position;
    .param p2, "end"    # Lcom/streambundlehtml/nodes/Range$Position;

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Range;->start:Lcom/streambundlehtml/nodes/Range$Position;

    .line 27
    iput-object p2, p0, Lcom/streambundlehtml/nodes/Range;->end:Lcom/streambundlehtml/nodes/Range$Position;

    .line 28
    return-void
.end method

.method static synthetic access$000()Lcom/streambundlehtml/nodes/Range$Position;
    .registers 1

    .line 12
    sget-object v0, Lcom/streambundlehtml/nodes/Range;->UntrackedPos:Lcom/streambundlehtml/nodes/Range$Position;

    return-object v0
.end method

.method static of(Lcom/streambundlehtml/nodes/Node;Z)Lcom/streambundlehtml/nodes/Range;
    .registers 4
    .param p0, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p1, "start"    # Z

    .line 61
    if-eqz p1, :cond_5

    sget-object v0, Lcom/streambundlehtml/nodes/Range;->RangeKey:Ljava/lang/String;

    goto :goto_7

    :cond_5
    sget-object v0, Lcom/streambundlehtml/nodes/Range;->EndRangeKey:Ljava/lang/String;

    .line 62
    .local v0, "key":Ljava/lang/String;
    :goto_7
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Node;->hasAttr(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_10

    .line 63
    sget-object v1, Lcom/streambundlehtml/nodes/Range;->Untracked:Lcom/streambundlehtml/nodes/Range;

    return-object v1

    .line 65
    :cond_10
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/nodes/Attributes;->getUserData(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundlehtml/helper/Validate;->ensureNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Range;

    return-object v1
.end method


# virtual methods
.method public end()Lcom/streambundlehtml/nodes/Range$Position;
    .registers 2

    .line 43
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Range;->end:Lcom/streambundlehtml/nodes/Range$Position;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .line 79
    if-ne p0, p1, :cond_4

    const/4 v0, 0x1

    return v0

    .line 80
    :cond_4
    const/4 v0, 0x0

    if-eqz p1, :cond_28

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_28

    .line 82
    move-object v1, p1

    check-cast v1, Lcom/streambundlehtml/nodes/Range;

    .line 84
    .local v1, "range":Lcom/streambundlehtml/nodes/Range;
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Range;->start:Lcom/streambundlehtml/nodes/Range$Position;

    iget-object v3, v1, Lcom/streambundlehtml/nodes/Range;->start:Lcom/streambundlehtml/nodes/Range$Position;

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Range$Position;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1f

    return v0

    .line 85
    :cond_1f
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Range;->end:Lcom/streambundlehtml/nodes/Range$Position;

    iget-object v2, v1, Lcom/streambundlehtml/nodes/Range;->end:Lcom/streambundlehtml/nodes/Range$Position;

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/nodes/Range$Position;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 80
    .end local v1    # "range":Lcom/streambundlehtml/nodes/Range;
    :cond_28
    return v0
.end method

.method public hashCode()I
    .registers 4

    .line 90
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Range;->start:Lcom/streambundlehtml/nodes/Range$Position;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Range$Position;->hashCode()I

    move-result v0

    .line 91
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Range;->end:Lcom/streambundlehtml/nodes/Range$Position;

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Range$Position;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 92
    .end local v0    # "result":I
    .local v1, "result":I
    return v1
.end method

.method public isTracked()Z
    .registers 2

    .line 51
    sget-object v0, Lcom/streambundlehtml/nodes/Range;->Untracked:Lcom/streambundlehtml/nodes/Range;

    if-eq p0, v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public start()Lcom/streambundlehtml/nodes/Range$Position;
    .registers 2

    .line 35
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Range;->start:Lcom/streambundlehtml/nodes/Range$Position;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Range;->start:Lcom/streambundlehtml/nodes/Range$Position;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Range;->end:Lcom/streambundlehtml/nodes/Range$Position;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public track(Lcom/streambundlehtml/nodes/Node;Z)V
    .registers 5
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "start"    # Z

    .line 74
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Node;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    if-eqz p2, :cond_9

    sget-object v1, Lcom/streambundlehtml/nodes/Range;->RangeKey:Ljava/lang/String;

    goto :goto_b

    :cond_9
    sget-object v1, Lcom/streambundlehtml/nodes/Range;->EndRangeKey:Ljava/lang/String;

    :goto_b
    invoke-virtual {v0, v1, p0}, Lcom/streambundlehtml/nodes/Attributes;->putUserData(Ljava/lang/String;Ljava/lang/Object;)Lcom/streambundlehtml/nodes/Attributes;

    .line 75
    return-void
.end method
