.class Lcom/streambundle/v38/DetailMetadata$1;
.super Ljava/util/LinkedHashMap;
.source "DetailMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/v38/DetailMetadata;->cache(I)Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/String;",
        "Lcom/streambundle/v38/DetailMetadata$Info;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic val$limit:I


# direct methods
.method constructor <init>(IFZI)V
    .registers 5

    .line 31
    iput p4, p0, Lcom/streambundle/v38/DetailMetadata$1;->val$limit:I

    invoke-direct {p0, p1, p2, p3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Lcom/streambundle/v38/DetailMetadata$Info;",
            ">;)Z"
        }
    .end annotation

    .line 33
    invoke-virtual {p0}, Lcom/streambundle/v38/DetailMetadata$1;->size()I

    move-result p1

    iget v0, p0, Lcom/streambundle/v38/DetailMetadata$1;->val$limit:I

    if-le p1, v0, :cond_a

    const/4 p1, 0x1

    return p1

    :cond_a
    const/4 p1, 0x0

    return p1
.end method
