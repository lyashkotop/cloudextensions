.class Lcom/streambundlehtml/nodes/Attributes$1;
.super Ljava/lang/Object;
.source "Attributes.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/streambundlehtml/nodes/Attribute;",
        ">;"
    }
.end annotation


# instance fields
.field i:I

.field final synthetic this$0:Lcom/streambundlehtml/nodes/Attributes;


# direct methods
.method constructor <init>(Lcom/streambundlehtml/nodes/Attributes;)V
    .registers 3
    .param p1, "this$0"    # Lcom/streambundlehtml/nodes/Attributes;

    .line 322
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 323
    const/4 v0, 0x0

    iput v0, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 5

    .line 327
    nop

    :goto_1
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    # getter for: Lcom/streambundlehtml/nodes/Attributes;->size:I
    invoke-static {v1}, Lcom/streambundlehtml/nodes/Attributes;->access$000(Lcom/streambundlehtml/nodes/Attributes;)I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_22

    .line 328
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v1, v1, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    iget v3, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    aget-object v1, v1, v3

    # invokes: Lcom/streambundlehtml/nodes/Attributes;->isInternalKey(Ljava/lang/String;)Z
    invoke-static {v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->access$100(Lcom/streambundlehtml/nodes/Attributes;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 329
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    goto :goto_1

    .line 334
    :cond_22
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    # getter for: Lcom/streambundlehtml/nodes/Attributes;->size:I
    invoke-static {v1}, Lcom/streambundlehtml/nodes/Attributes;->access$000(Lcom/streambundlehtml/nodes/Attributes;)I

    move-result v1

    if-lt v0, v1, :cond_2d

    const/4 v2, 0x0

    :cond_2d
    return v2
.end method

.method public next()Lcom/streambundlehtml/nodes/Attribute;
    .registers 5

    .line 339
    new-instance v0, Lcom/streambundlehtml/nodes/Attribute;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v1, v1, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v2, v2, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    iget v3, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    aget-object v2, v2, v3

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    invoke-direct {v0, v1, v2, v3}, Lcom/streambundlehtml/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 340
    .local v0, "attr":Lcom/streambundlehtml/nodes/Attribute;
    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    .line 341
    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .line 322
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attributes$1;->next()Lcom/streambundlehtml/nodes/Attribute;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 3

    .line 346
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes$1;->this$0:Lcom/streambundlehtml/nodes/Attributes;

    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/streambundlehtml/nodes/Attributes$1;->i:I

    # invokes: Lcom/streambundlehtml/nodes/Attributes;->remove(I)V
    invoke-static {v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->access$200(Lcom/streambundlehtml/nodes/Attributes;I)V

    .line 347
    return-void
.end method
