.class public final Lcom/example/tubesafari/TubeSafariParser$Stream;
.super Ljava/lang/Object;
.source "TubeSafariParser.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tubesafari/TubeSafariParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Stream"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0013\u0008\u0086\u0008\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0013\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0014\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0015\u001a\u00020\u0008H\u00c6\u0003J1\u0010\u0016\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008H\u00c6\u0001J\u0014\u0010\u0017\u001a\u00020\u00082\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u0019\u001a\u00020\u0005H\u00d6\u0081\u0004J\n\u0010\u001a\u001a\u00020\u0003H\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000cR\u0011\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/example/tubesafari/TubeSafariParser$Stream;",
        "",
        "url",
        "",
        "quality",
        "",
        "label",
        "remote",
        "",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;Z)V",
        "getUrl",
        "()Ljava/lang/String;",
        "getQuality",
        "()I",
        "getLabel",
        "getRemote",
        "()Z",
        "component1",
        "component2",
        "component3",
        "component4",
        "copy",
        "equals",
        "other",
        "hashCode",
        "toString",
        "VideoSources_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final label:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final quality:I

.field private final remote:Z

.field private final url:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Z)V
    .registers 5
    .param p1, "url"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "quality"    # I
    .param p3, "label"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4, "remote"    # Z

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->url:Ljava/lang/String;

    iput p2, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->quality:I

    iput-object p3, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->label:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->remote:Z

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILjava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 8

    .line 12
    and-int/lit8 p6, p5, 0x2

    const/4 v0, 0x0

    if-eqz p6, :cond_6

    const/4 p2, 0x0

    :cond_6
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_c

    const-string p3, "Auto"

    :cond_c
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_11

    const/4 p4, 0x0

    :cond_11
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/example/tubesafari/TubeSafariParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    return-void
.end method

.method public static synthetic copy$default(Lcom/example/tubesafari/TubeSafariParser$Stream;Ljava/lang/String;ILjava/lang/String;ZILjava/lang/Object;)Lcom/example/tubesafari/TubeSafariParser$Stream;
    .registers 7

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_6

    iget-object p1, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->url:Ljava/lang/String;

    :cond_6
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_c

    iget p2, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->quality:I

    :cond_c
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_12

    iget-object p3, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->label:Ljava/lang/String;

    :cond_12
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_18

    iget-boolean p4, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->remote:Z

    :cond_18
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/example/tubesafari/TubeSafariParser$Stream;->copy(Ljava/lang/String;ILjava/lang/String;Z)Lcom/example/tubesafari/TubeSafariParser$Stream;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .registers 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->url:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()I
    .registers 2

    iget v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->quality:I

    return v0
.end method

.method public final component3()Ljava/lang/String;
    .registers 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->label:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()Z
    .registers 2

    iget-boolean v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->remote:Z

    return v0
.end method

.method public final copy(Ljava/lang/String;ILjava/lang/String;Z)Lcom/example/tubesafari/TubeSafariParser$Stream;
    .registers 6
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Lcom/example/tubesafari/TubeSafariParser$Stream;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/example/tubesafari/TubeSafariParser$Stream;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/example/tubesafari/TubeSafariParser$Stream;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    move-object v1, p1

    check-cast v1, Lcom/example/tubesafari/TubeSafariParser$Stream;

    iget-object v3, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->url:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/tubesafari/TubeSafariParser$Stream;->url:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    return v2

    :cond_18
    iget v3, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->quality:I

    iget v4, v1, Lcom/example/tubesafari/TubeSafariParser$Stream;->quality:I

    if-eq v3, v4, :cond_1f

    return v2

    :cond_1f
    iget-object v3, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->label:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/tubesafari/TubeSafariParser$Stream;->label:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    return v2

    :cond_2a
    iget-boolean v3, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->remote:Z

    iget-boolean v1, v1, Lcom/example/tubesafari/TubeSafariParser$Stream;->remote:Z

    if-eq v3, v1, :cond_31

    return v2

    :cond_31
    return v0
.end method

.method public final getLabel()Ljava/lang/String;
    .registers 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 12
    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->label:Ljava/lang/String;

    return-object v0
.end method

.method public final getQuality()I
    .registers 2

    .line 12
    iget v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->quality:I

    return v0
.end method

.method public final getRemote()Z
    .registers 2

    .line 12
    iget-boolean v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->remote:Z

    return v0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 12
    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->url:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    iget-object v0, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->quality:I

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->label:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->remote:Z

    invoke-static {v2}, Lcom/example/tubesafari/TubeSafariParser$Stream$$ExternalSyntheticBackport0;->m(Z)I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Stream(url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", quality="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->quality:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", label="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", remote="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/example/tubesafari/TubeSafariParser$Stream;->remote:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
