.class public final Lcom/lagradost/VideoHubProvider$search$2$invokeSuspend$$inlined$sortedByDescending$1;
.super Ljava/lang/Object;
.source "Comparisons.kt"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lagradost/VideoHubProvider$search$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
    value = "SMAP\nComparisons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Comparisons.kt\nkotlin/comparisons/ComparisonsKt__ComparisonsKt$compareByDescending$1\n+ 2 VideoHub.kt\ncom/lagradost/VideoHubProvider$search$2\n*L\n1#1,325:1\n137#2:326\n*E\n"
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
.field final synthetic $missavCode$inlined:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/lagradost/VideoHubProvider$search$2$invokeSuspend$$inlined$sortedByDescending$1;->$missavCode$inlined:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 8
    .param p1, "a"    # Ljava/lang/Object;
    .param p2, "b"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 120
    move-object v0, p2

    check-cast v0, Lcom/lagradost/VideoCard;

    .local v0, "it":Lcom/lagradost/VideoCard;
    const/4 v1, 0x0

    .line 326
    .local v1, "$i$a$-sortedByDescending-VideoHubProvider$search$2$sorted$1":I
    sget-object v2, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    iget-object v3, p0, Lcom/lagradost/VideoHubProvider$search$2$invokeSuspend$$inlined$sortedByDescending$1;->$missavCode$inlined:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Lcom/lagradost/MissavSearch;->matches(Lcom/lagradost/VideoCard;Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 120
    .end local v0    # "it":Lcom/lagradost/VideoCard;
    .end local v1    # "$i$a$-sortedByDescending-VideoHubProvider$search$2$sorted$1":I
    check-cast v0, Ljava/lang/Comparable;

    move-object v1, p1

    check-cast v1, Lcom/lagradost/VideoCard;

    .local v1, "it":Lcom/lagradost/VideoCard;
    const/4 v2, 0x0

    .line 326
    .local v2, "$i$a$-sortedByDescending-VideoHubProvider$search$2$sorted$1":I
    sget-object v3, Lcom/lagradost/MissavSearch;->INSTANCE:Lcom/lagradost/MissavSearch;

    iget-object v4, p0, Lcom/lagradost/VideoHubProvider$search$2$invokeSuspend$$inlined$sortedByDescending$1;->$missavCode$inlined:Ljava/lang/String;

    invoke-virtual {v3, v1, v4}, Lcom/lagradost/MissavSearch;->matches(Lcom/lagradost/VideoCard;Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 120
    .end local v1    # "it":Lcom/lagradost/VideoCard;
    .end local v2    # "$i$a$-sortedByDescending-VideoHubProvider$search$2$sorted$1":I
    check-cast v1, Ljava/lang/Comparable;

    invoke-static {v0, v1}, Lkotlin/comparisons/ComparisonsKt;->compareValues(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result v0

    return v0
.end method
