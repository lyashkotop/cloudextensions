.class Lcom/streambundlehtml/nodes/Attributes$Dataset;
.super Ljava/util/AbstractMap;
.source "Attributes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/nodes/Attributes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Dataset"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/nodes/Attributes$Dataset$EntrySet;,
        Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractMap<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final attributes:Lcom/streambundlehtml/nodes/Attributes;


# direct methods
.method private constructor <init>(Lcom/streambundlehtml/nodes/Attributes;)V
    .registers 2
    .param p1, "attributes"    # Lcom/streambundlehtml/nodes/Attributes;

    .line 496
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 497
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 498
    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundlehtml/nodes/Attributes;Lcom/streambundlehtml/nodes/Attributes$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/streambundlehtml/nodes/Attributes;
    .param p2, "x1"    # Lcom/streambundlehtml/nodes/Attributes$1;

    .line 493
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes$Dataset;-><init>(Lcom/streambundlehtml/nodes/Attributes;)V

    return-void
.end method

.method static synthetic access$700(Lcom/streambundlehtml/nodes/Attributes$Dataset;)Lcom/streambundlehtml/nodes/Attributes;
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/nodes/Attributes$Dataset;

    .line 493
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    return-object v0
.end method


# virtual methods
.method public entrySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 502
    new-instance v0, Lcom/streambundlehtml/nodes/Attributes$Dataset$EntrySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/streambundlehtml/nodes/Attributes$Dataset$EntrySet;-><init>(Lcom/streambundlehtml/nodes/Attributes$Dataset;Lcom/streambundlehtml/nodes/Attributes$1;)V

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 493
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/nodes/Attributes$Dataset;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 507
    # invokes: Lcom/streambundlehtml/nodes/Attributes;->dataKey(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1}, Lcom/streambundlehtml/nodes/Attributes;->access$500(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 508
    .local v0, "dataKey":Ljava/lang/String;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_14

    :cond_13
    const/4 v1, 0x0

    .line 509
    .local v1, "oldValue":Ljava/lang/String;
    :goto_14
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v2, v0, p2}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 510
    return-object v1
.end method
