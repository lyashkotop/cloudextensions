.class public final Lcom/lagradost/CatalogSite;
.super Ljava/lang/Object;
.source "CatalogParser.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCatalogParser.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CatalogParser.kt\ncom/lagradost/CatalogSite\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,133:1\n1#2:134\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0002\u0008\t\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000e\u0010\u0010\u001a\u00020\u00052\u0006\u0010\u0011\u001a\u00020\u0005J\u000e\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0005J\t\u0010\u0015\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0016\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0017\u001a\u00020\u0005H\u00c6\u0003J\'\u0010\u0018\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0005H\u00c6\u0001J\u0014\u0010\u0019\u001a\u00020\u00132\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u001b\u001a\u00020\u0003H\u00d6\u0081\u0004J\n\u0010\u001c\u001a\u00020\u0005H\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000cR\u0011\u0010\u000e\u001a\u00020\u00058F\u00a2\u0006\u0006\u001a\u0004\u0008\u000f\u0010\u000c"
    }
    d2 = {
        "Lcom/lagradost/CatalogSite;",
        "",
        "id",
        "",
        "label",
        "",
        "base",
        "<init>",
        "(ILjava/lang/String;Ljava/lang/String;)V",
        "getId",
        "()I",
        "getLabel",
        "()Ljava/lang/String;",
        "getBase",
        "home",
        "getHome",
        "search",
        "query",
        "isVideo",
        "",
        "url",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
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
.field private final base:Ljava/lang/String;

.field private final id:I

.field private final label:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "id"    # I
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "base"    # Ljava/lang/String;

    const-string v0, "label"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "base"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lagradost/CatalogSite;->id:I

    iput-object p2, p0, Lcom/lagradost/CatalogSite;->label:Ljava/lang/String;

    iput-object p3, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    return-void
.end method

.method public static synthetic copy$default(Lcom/lagradost/CatalogSite;ILjava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/lagradost/CatalogSite;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_6

    iget p1, p0, Lcom/lagradost/CatalogSite;->id:I

    :cond_6
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_c

    iget-object p2, p0, Lcom/lagradost/CatalogSite;->label:Ljava/lang/String;

    :cond_c
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_12

    iget-object p3, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    :cond_12
    invoke-virtual {p0, p1, p2, p3}, Lcom/lagradost/CatalogSite;->copy(ILjava/lang/String;Ljava/lang/String;)Lcom/lagradost/CatalogSite;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .registers 2

    iget v0, p0, Lcom/lagradost/CatalogSite;->id:I

    return v0
.end method

.method public final component2()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/lagradost/CatalogSite;->label:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(ILjava/lang/String;Ljava/lang/String;)Lcom/lagradost/CatalogSite;
    .registers 5

    const-string v0, "label"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "base"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/CatalogSite;

    invoke-direct {v0, p1, p2, p3}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    move-object v1, p1

    check-cast v1, Lcom/lagradost/CatalogSite;

    iget v3, p0, Lcom/lagradost/CatalogSite;->id:I

    iget v4, v1, Lcom/lagradost/CatalogSite;->id:I

    if-eq v3, v4, :cond_14

    return v2

    :cond_14
    iget-object v3, p0, Lcom/lagradost/CatalogSite;->label:Ljava/lang/String;

    iget-object v4, v1, Lcom/lagradost/CatalogSite;->label:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    return v2

    :cond_1f
    iget-object v3, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    iget-object v1, v1, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2a

    return v2

    :cond_2a
    return v0
.end method

.method public final getBase()Ljava/lang/String;
    .registers 2

    .line 8
    iget-object v0, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    return-object v0
.end method

.method public final getHome()Ljava/lang/String;
    .registers 3

    .line 9
    iget v0, p0, Lcom/lagradost/CatalogSite;->id:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_19

    iget-object v0, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/en"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1b

    :cond_19
    iget-object v0, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    :goto_1b
    return-object v0
.end method

.method public final getId()I
    .registers 2

    .line 8
    iget v0, p0, Lcom/lagradost/CatalogSite;->id:I

    return v0
.end method

.method public final getLabel()Ljava/lang/String;
    .registers 2

    .line 8
    iget-object v0, p0, Lcom/lagradost/CatalogSite;->label:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    iget v0, p0, Lcom/lagradost/CatalogSite;->id:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/lagradost/CatalogSite;->label:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    return v0
.end method

.method public final isVideo(Ljava/lang/String;)Z
    .registers 9
    .param p1, "url"    # Ljava/lang/String;

    const-string v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    :try_start_5
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v0, p0

    check-cast v0, Lcom/lagradost/CatalogSite;

    .line 134
    .local v0, "$this$isVideo_u24lambda_u240":Lcom/lagradost/CatalogSite;
    const/4 v1, 0x0

    .line 17
    .local v1, "$i$a$-runCatching-CatalogSite$isVideo$path$1":I
    new-instance v2, Ljava/net/URI;

    invoke-direct {v2, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    .end local v0    # "$this$isVideo_u24lambda_u240":Lcom/lagradost/CatalogSite;
    .end local v1    # "$i$a$-runCatching-CatalogSite$isVideo$path$1":I
    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_18
    .catchall {:try_start_5 .. :try_end_18} :catchall_19

    goto :goto_24

    :catchall_19
    move-exception v0

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_24
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2c

    move-object v0, v2

    :cond_2c
    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_32

    return v1

    .line 18
    .local v0, "path":Ljava/lang/String;
    :cond_32
    iget v3, p0, Lcom/lagradost/CatalogSite;->id:I

    const/4 v4, 0x1

    const/4 v5, 0x2

    if-eq v3, v4, :cond_66

    const/4 v6, 0x3

    if-eq v3, v6, :cond_54

    const/4 v1, 0x4

    if-eq v3, v1, :cond_4d

    .line 22
    new-instance v1, Lkotlin/text/Regex;

    const-string v2, "^/\\d+[^/]*\\.html$"

    invoke-direct {v1, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    move-object v2, v0

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v1

    goto :goto_6c

    .line 21
    :cond_4d
    sget-object v1, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    invoke-virtual {v1, v0}, Lcom/lagradost/MissavSearch;->videoPath(Ljava/lang/String;)Z

    move-result v1

    goto :goto_6c

    .line 20
    :cond_54
    const-string v3, "/play/"

    invoke-static {v0, v3, v1, v5, v2}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_64

    const-string v3, "/xid/"

    invoke-static {v0, v3, v1, v5, v2}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6c

    :cond_64
    move v1, v4

    goto :goto_6c

    .line 19
    :cond_66
    const-string v3, "/video/"

    invoke-static {v0, v3, v1, v5, v2}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v1

    .line 18
    :cond_6c
    :goto_6c
    return v1
.end method

.method public final search(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;

    iget v0, p0, Lcom/lagradost/CatalogSite;->id:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_14

    invoke-virtual {p0}, Lcom/lagradost/CatalogSite;->getBase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/search/?query="

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_14
    const-string v0, "query"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    iget v0, p0, Lcom/lagradost/CatalogSite;->id:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_6e

    const/4 v1, 0x3

    if-eq v0, v1, :cond_57

    const/4 v1, 0x4

    if-eq v0, v1, :cond_40

    .line 14
    iget-object v0, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/search/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_84

    .line 13
    :cond_40
    iget-object v0, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/en/search/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_84

    .line 12
    :cond_57
    iget-object v0, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/?s="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_84

    .line 11
    :cond_6e
    iget-object v0, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/search?q="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 15
    :goto_84
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    iget v0, p0, Lcom/lagradost/CatalogSite;->id:I

    iget-object v1, p0, Lcom/lagradost/CatalogSite;->label:Ljava/lang/String;

    iget-object v2, p0, Lcom/lagradost/CatalogSite;->base:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CatalogSite(id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", label="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", base="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
