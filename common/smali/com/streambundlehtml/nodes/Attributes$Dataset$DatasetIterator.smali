.class Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;
.super Ljava/lang/Object;
.source "Attributes.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/nodes/Attributes$Dataset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DatasetIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private attr:Lcom/streambundlehtml/nodes/Attribute;

.field private attrIter:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Lcom/streambundlehtml/nodes/Attribute;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/streambundlehtml/nodes/Attributes$Dataset;


# direct methods
.method private constructor <init>(Lcom/streambundlehtml/nodes/Attributes$Dataset;)V
    .registers 2

    .line 530
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->this$0:Lcom/streambundlehtml/nodes/Attributes$Dataset;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 531
    iget-object p1, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->this$0:Lcom/streambundlehtml/nodes/Attributes$Dataset;

    # getter for: Lcom/streambundlehtml/nodes/Attributes$Dataset;->attributes:Lcom/streambundlehtml/nodes/Attributes;
    invoke-static {p1}, Lcom/streambundlehtml/nodes/Attributes$Dataset;->access$700(Lcom/streambundlehtml/nodes/Attributes$Dataset;)Lcom/streambundlehtml/nodes/Attributes;

    move-result-object p1

    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->attrIter:Ljava/util/Iterator;

    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundlehtml/nodes/Attributes$Dataset;Lcom/streambundlehtml/nodes/Attributes$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/streambundlehtml/nodes/Attributes$Dataset;
    .param p2, "x1"    # Lcom/streambundlehtml/nodes/Attributes$1;

    .line 530
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;-><init>(Lcom/streambundlehtml/nodes/Attributes$Dataset;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .line 534
    nop

    :cond_1
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->attrIter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 535
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->attrIter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Attribute;

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->attr:Lcom/streambundlehtml/nodes/Attribute;

    .line 536
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->attr:Lcom/streambundlehtml/nodes/Attribute;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attribute;->isDataAttribute()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    .line 538
    :cond_1d
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .line 530
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 542
    new-instance v0, Lcom/streambundlehtml/nodes/Attribute;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->attr:Lcom/streambundlehtml/nodes/Attribute;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "data-"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->attr:Lcom/streambundlehtml/nodes/Attribute;

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public remove()V
    .registers 3

    .line 546
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->this$0:Lcom/streambundlehtml/nodes/Attributes$Dataset;

    # getter for: Lcom/streambundlehtml/nodes/Attributes$Dataset;->attributes:Lcom/streambundlehtml/nodes/Attributes;
    invoke-static {v0}, Lcom/streambundlehtml/nodes/Attributes$Dataset;->access$700(Lcom/streambundlehtml/nodes/Attributes$Dataset;)Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes$Dataset$DatasetIterator;->attr:Lcom/streambundlehtml/nodes/Attribute;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->remove(Ljava/lang/String;)V

    .line 547
    return-void
.end method
