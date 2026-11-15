.class public final Lcom/lagradost/HlsPlaylist$variants$$inlined$thenByDescending$1;
.super Ljava/lang/Object;
.source "Comparisons.kt"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/HlsPlaylist;->variants(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nComparisons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Comparisons.kt\nkotlin/comparisons/ComparisonsKt__ComparisonsKt$thenByDescending$1\n+ 2 HlsPlaylist.kt\ncom/lagradost/HlsPlaylist\n*L\n1#1,325:1\n20#2:326\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $this_thenByDescending:Ljava/util/Comparator;


# direct methods
.method public constructor <init>(Ljava/util/Comparator;)V
    .registers 2

    iput-object p1, p0, Lcom/lagradost/HlsPlaylist$variants$$inlined$thenByDescending$1;->$this_thenByDescending:Ljava/util/Comparator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 9
    .param p1, "a"    # Ljava/lang/Object;
    .param p2, "b"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 169
    iget-object v0, p0, Lcom/lagradost/HlsPlaylist$variants$$inlined$thenByDescending$1;->$this_thenByDescending:Ljava/util/Comparator;

    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 170
    .local v0, "previousCompare":I
    if-eqz v0, :cond_a

    move v1, v0

    goto :goto_2a

    :cond_a
    move-object v1, p2

    check-cast v1, Lcom/lagradost/HlsVariant;

    .local v1, "it":Lcom/lagradost/HlsVariant;
    const/4 v2, 0x0

    .line 326
    .local v2, "$i$a$-thenByDescending-HlsPlaylist$variants$4":I
    invoke-virtual {v1}, Lcom/lagradost/HlsVariant;->getBandwidth()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    check-cast v3, Ljava/lang/Comparable;

    .line 170
    .end local v1    # "it":Lcom/lagradost/HlsVariant;
    .end local v2    # "$i$a$-thenByDescending-HlsPlaylist$variants$4":I
    move-object v1, p1

    check-cast v1, Lcom/lagradost/HlsVariant;

    .restart local v1    # "it":Lcom/lagradost/HlsVariant;
    const/4 v2, 0x0

    .line 326
    .restart local v2    # "$i$a$-thenByDescending-HlsPlaylist$variants$4":I
    invoke-virtual {v1}, Lcom/lagradost/HlsVariant;->getBandwidth()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    check-cast v4, Ljava/lang/Comparable;

    .line 170
    .end local v1    # "it":Lcom/lagradost/HlsVariant;
    .end local v2    # "$i$a$-thenByDescending-HlsPlaylist$variants$4":I
    invoke-static {v3, v4}, Lkotlin/comparisons/ComparisonsKt;->compareValues(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result v1

    :goto_2a
    return v1
.end method
