.class public final Lcom/example/epawg/EpawgParser$streams$$inlined$sortedByDescending$1;
.super Ljava/lang/Object;
.source "Comparisons.kt"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/epawg/EpawgParser;->streams(Lorg/jsoup/nodes/Document;)Ljava/util/List;
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
    value = "SMAP\nComparisons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Comparisons.kt\nkotlin/comparisons/ComparisonsKt__ComparisonsKt$compareByDescending$1\n+ 2 EpawgParser.kt\ncom/example/epawg/EpawgParser\n*L\n1#1,328:1\n50#2:329\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
    value = {
        "SMAP\nComparisons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Comparisons.kt\nkotlin/comparisons/ComparisonsKt__ComparisonsKt$compareByDescending$1\n+ 2 EpawgParser.kt\ncom/example/epawg/EpawgParser\n*L\n1#1,328:1\n50#2:329\n*E\n"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7
    .param p1, "a"    # Ljava/lang/Object;
    .param p2, "b"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 121
    move-object v0, p2

    check-cast v0, Lcom/example/epawg/EpawgParser$Stream;

    .local v0, "it":Lcom/example/epawg/EpawgParser$Stream;
    const/4 v1, 0x0

    .line 329
    .local v1, "$i$a$-sortedByDescending-EpawgParser$streams$4":I
    invoke-virtual {v0}, Lcom/example/epawg/EpawgParser$Stream;->getQuality()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 121
    .end local v0    # "it":Lcom/example/epawg/EpawgParser$Stream;
    .end local v1    # "$i$a$-sortedByDescending-EpawgParser$streams$4":I
    check-cast v0, Ljava/lang/Comparable;

    move-object v1, p1

    check-cast v1, Lcom/example/epawg/EpawgParser$Stream;

    .local v1, "it":Lcom/example/epawg/EpawgParser$Stream;
    const/4 v2, 0x0

    .line 329
    .local v2, "$i$a$-sortedByDescending-EpawgParser$streams$4":I
    invoke-virtual {v1}, Lcom/example/epawg/EpawgParser$Stream;->getQuality()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 121
    .end local v1    # "it":Lcom/example/epawg/EpawgParser$Stream;
    .end local v2    # "$i$a$-sortedByDescending-EpawgParser$streams$4":I
    check-cast v1, Ljava/lang/Comparable;

    invoke-static {v0, v1}, Lkotlin/comparisons/ComparisonsKt;->compareValues(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result v0

    return v0
.end method
