.class public Lcom/streambundlehtml/nodes/Attributes;
.super Ljava/lang/Object;
.source "Attributes.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/nodes/Attributes$Dataset;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/streambundlehtml/nodes/Attribute;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final EmptyString:Ljava/lang/String; = ""

.field private static final GrowthFactor:I = 0x2

.field private static final InitialCapacity:I = 0x3

.field static final InternalPrefix:C = '/'

.field static final NotFound:I = -0x1

.field protected static final dataPrefix:Ljava/lang/String; = "data-"


# instance fields
.field keys:[Ljava/lang/String;

.field private size:I

.field vals:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    .line 51
    const/4 v0, 0x3

    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    .line 52
    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000(Lcom/streambundlehtml/nodes/Attributes;)I
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/nodes/Attributes;

    .line 35
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    return v0
.end method

.method static synthetic access$100(Lcom/streambundlehtml/nodes/Attributes;Ljava/lang/String;)Z
    .registers 3
    .param p0, "x0"    # Lcom/streambundlehtml/nodes/Attributes;
    .param p1, "x1"    # Ljava/lang/String;

    .line 35
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->isInternalKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/streambundlehtml/nodes/Attributes;I)V
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/nodes/Attributes;
    .param p1, "x1"    # I

    .line 35
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->remove(I)V

    return-void
.end method

.method static synthetic access$500(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .line 35
    invoke-static {p0}, Lcom/streambundlehtml/nodes/Attributes;->dataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addObject(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 136
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Attributes;->checkCapacity(I)V

    .line 137
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    aput-object p1, v0, v1

    .line 138
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    aput-object p2, v0, v1

    .line 139
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    .line 140
    return-void
.end method

.method private checkCapacity(I)V
    .registers 5
    .param p1, "minNewSize"    # I

    .line 56
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-lt p1, v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 57
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    array-length v0, v0

    .line 58
    .local v0, "curCap":I
    if-lt v0, p1, :cond_10

    .line 59
    return-void

    .line 60
    :cond_10
    const/4 v1, 0x3

    if-lt v0, v1, :cond_17

    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    mul-int/lit8 v1, v1, 0x2

    .line 61
    .local v1, "newCap":I
    :cond_17
    if-le p1, v1, :cond_1a

    .line 62
    move v1, p1

    .line 64
    :cond_1a
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    .line 65
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    .line 66
    return-void
.end method

.method static checkNotNull(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "val"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 89
    if-nez p0, :cond_5

    const-string v0, ""

    goto :goto_8

    :cond_5
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    :goto_8
    return-object v0
.end method

.method private static dataKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;

    .line 552
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "data-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private indexOfKeyIgnoreCase(Ljava/lang/String;)I
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 78
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 79
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-ge v0, v1, :cond_16

    .line 80
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 81
    return v0

    .line 79
    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 83
    .end local v0    # "i":I
    :cond_16
    const/4 v0, -0x1

    return v0
.end method

.method static internalKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;

    .line 556
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isInternalKey(Ljava/lang/String;)Z
    .registers 6
    .param p1, "key"    # Ljava/lang/String;

    .line 560
    const/4 v0, 0x0

    if-eqz p1, :cond_13

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_13

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x2f

    if-ne v1, v3, :cond_13

    const/4 v0, 0x1

    :cond_13
    return v0
.end method

.method private remove(I)V
    .registers 7
    .param p1, "index"    # I

    .line 217
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    const/4 v1, 0x1

    if-lt p1, v0, :cond_7

    const/4 v0, 0x1

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isFalse(Z)V

    .line 218
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    sub-int/2addr v0, p1

    sub-int/2addr v0, v1

    .line 219
    .local v0, "shifted":I
    if-lez v0, :cond_23

    .line 220
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    add-int/lit8 v3, p1, 0x1

    iget-object v4, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    invoke-static {v2, v3, v4, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 221
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    add-int/lit8 v3, p1, 0x1

    iget-object v4, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    invoke-static {v2, v3, v4, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 223
    :cond_23
    iget v2, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    .line 224
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 225
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    iget v2, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    aput-object v3, v1, v2

    .line 226
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 131
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/nodes/Attributes;->addObject(Ljava/lang/String;Ljava/lang/Object;)V

    .line 132
    return-object p0
.end method

.method public addAll(Lcom/streambundlehtml/nodes/Attributes;)V
    .registers 7
    .param p1, "incoming"    # Lcom/streambundlehtml/nodes/Attributes;

    .line 307
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Attributes;->size()I

    move-result v0

    if-nez v0, :cond_7

    .line 308
    return-void

    .line 309
    :cond_7
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    iget v1, p1, Lcom/streambundlehtml/nodes/Attributes;->size:I

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Attributes;->checkCapacity(I)V

    .line 311
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-eqz v0, :cond_15

    const/4 v0, 0x1

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    .line 313
    .local v0, "needsPut":Z
    :goto_16
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Attribute;

    .line 314
    .local v2, "attr":Lcom/streambundlehtml/nodes/Attribute;
    if-eqz v0, :cond_2c

    .line 315
    invoke-virtual {p0, v2}, Lcom/streambundlehtml/nodes/Attributes;->put(Lcom/streambundlehtml/nodes/Attribute;)Lcom/streambundlehtml/nodes/Attributes;

    goto :goto_37

    .line 317
    :cond_2c
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/streambundlehtml/nodes/Attributes;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 318
    .end local v2    # "attr":Lcom/streambundlehtml/nodes/Attribute;
    :goto_37
    goto :goto_1a

    .line 319
    :cond_38
    return-void
.end method

.method public asList()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/nodes/Attribute;",
            ">;"
        }
    .end annotation

    .line 356
    new-instance v0, Ljava/util/ArrayList;

    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 357
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/nodes/Attribute;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    iget v2, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-ge v1, v2, :cond_2c

    .line 358
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-direct {p0, v2}, Lcom/streambundlehtml/nodes/Attributes;->isInternalKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 359
    goto :goto_29

    .line 360
    :cond_17
    new-instance v2, Lcom/streambundlehtml/nodes/Attribute;

    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v3, v3, v1

    iget-object v4, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v4, v4, v1

    check-cast v4, Ljava/lang/String;

    invoke-direct {v2, v3, v4, p0}, Lcom/streambundlehtml/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 361
    .local v2, "attr":Lcom/streambundlehtml/nodes/Attribute;
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 357
    .end local v2    # "attr":Lcom/streambundlehtml/nodes/Attribute;
    :goto_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 363
    .end local v1    # "i":I
    :cond_2c
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public clone()Lcom/streambundlehtml/nodes/Attributes;
    .registers 4

    .line 450
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Attributes;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_22

    .line 453
    .local v0, "clone":Lcom/streambundlehtml/nodes/Attributes;
    nop

    .line 454
    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    iput v1, v0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    .line 455
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    iget v2, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, v0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    .line 456
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    iget v2, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    .line 457
    return-object v0

    .line 451
    .end local v0    # "clone":Lcom/streambundlehtml/nodes/Attributes;
    :catch_22
    move-exception v0

    .line 452
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 35
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attributes;->clone()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    return-object v0
.end method

.method public dataset()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 372
    new-instance v0, Lcom/streambundlehtml/nodes/Attributes$Dataset;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/streambundlehtml/nodes/Attributes$Dataset;-><init>(Lcom/streambundlehtml/nodes/Attributes;Lcom/streambundlehtml/nodes/Attributes$1;)V

    return-object v0
.end method

.method public deduplicate(Lcom/streambundlehtml/parser/ParseSettings;)I
    .registers 8
    .param p1, "settings"    # Lcom/streambundlehtml/parser/ParseSettings;

    .line 475
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attributes;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 476
    const/4 v0, 0x0

    return v0

    .line 477
    :cond_8
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/ParseSettings;->preserveAttributeCase()Z

    move-result v0

    .line 478
    .local v0, "preserve":Z
    const/4 v1, 0x0

    .line 479
    .local v1, "dupes":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_4e

    .line 480
    add-int/lit8 v3, v2, 0x1

    .local v3, "j":I
    :goto_15
    iget-object v4, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_4b

    .line 481
    iget-object v4, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v4, v4, v3

    if-nez v4, :cond_21

    .line 482
    goto :goto_4b

    .line 483
    :cond_21
    if-eqz v0, :cond_31

    iget-object v4, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v4, v4, v2

    iget-object v5, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v5, v5, v3

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_41

    :cond_31
    if-nez v0, :cond_48

    iget-object v4, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v4, v4, v2

    iget-object v5, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v5, v5, v3

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_48

    .line 484
    :cond_41
    add-int/lit8 v1, v1, 0x1

    .line 485
    invoke-direct {p0, v3}, Lcom/streambundlehtml/nodes/Attributes;->remove(I)V

    .line 486
    add-int/lit8 v3, v3, -0x1

    .line 480
    :cond_48
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 479
    .end local v3    # "j":I
    :cond_4b
    :goto_4b
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 490
    .end local v2    # "i":I
    :cond_4e
    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 11
    .param p1, "o"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 413
    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 414
    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_44

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_44

    .line 416
    move-object v2, p1

    check-cast v2, Lcom/streambundlehtml/nodes/Attributes;

    .line 417
    .local v2, "that":Lcom/streambundlehtml/nodes/Attributes;
    iget v3, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    iget v4, v2, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-eq v3, v4, :cond_1b

    return v1

    .line 418
    :cond_1b
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1c
    iget v4, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-ge v3, v4, :cond_43

    .line 419
    iget-object v4, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v4, v4, v3

    .line 420
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v2, v4}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v5

    .line 421
    .local v5, "thatI":I
    const/4 v6, -0x1

    if-ne v5, v6, :cond_2c

    .line 422
    return v1

    .line 423
    :cond_2c
    iget-object v6, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v6, v6, v3

    .line 424
    .local v6, "val":Ljava/lang/Object;
    iget-object v7, v2, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v7, v7, v5

    .line 425
    .local v7, "thatVal":Ljava/lang/Object;
    if-nez v6, :cond_39

    .line 426
    if-eqz v7, :cond_40

    .line 427
    return v1

    .line 428
    :cond_39
    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_40

    .line 429
    return v1

    .line 418
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "thatI":I
    .end local v6    # "val":Ljava/lang/Object;
    .end local v7    # "thatVal":Ljava/lang/Object;
    :cond_40
    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    .line 431
    .end local v3    # "i":I
    :cond_43
    return v0

    .line 414
    .end local v2    # "that":Lcom/streambundlehtml/nodes/Attributes;
    :cond_44
    return v1
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 99
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v0

    .line 100
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    const-string v1, ""

    goto :goto_12

    :cond_a
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-static {v1}, Lcom/streambundlehtml/nodes/Attributes;->checkNotNull(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_12
    return-object v1
.end method

.method public getIgnoreCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 109
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKeyIgnoreCase(Ljava/lang/String;)I

    move-result v0

    .line 110
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    const-string v1, ""

    goto :goto_12

    :cond_a
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-static {v1}, Lcom/streambundlehtml/nodes/Attributes;->checkNotNull(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_12
    return-object v1
.end method

.method getUserData(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 120
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 121
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->isInternalKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    invoke-static {p1}, Lcom/streambundlehtml/nodes/Attributes;->internalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 122
    :cond_d
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKeyIgnoreCase(Ljava/lang/String;)I

    move-result v0

    .line 123
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_16

    const/4 v1, 0x0

    goto :goto_1a

    :cond_16
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v1, v1, v0

    :goto_1a
    return-object v1
.end method

.method public hasDeclaredValueForKey(Ljava/lang/String;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 272
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v0

    .line 273
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v1, v1, v0

    if-eqz v1, :cond_f

    const/4 v1, 0x1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    return v1
.end method

.method public hasDeclaredValueForKeyIgnoreCase(Ljava/lang/String;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 282
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKeyIgnoreCase(Ljava/lang/String;)I

    move-result v0

    .line 283
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v1, v1, v0

    if-eqz v1, :cond_f

    const/4 v1, 0x1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    return v1
.end method

.method public hasKey(Ljava/lang/String;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 254
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public hasKeyIgnoreCase(Ljava/lang/String;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 263
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKeyIgnoreCase(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public hashCode()I
    .registers 4

    .line 440
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    .line 441
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v1, v2

    .line 442
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v0, v2

    .line 443
    .end local v1    # "result":I
    .restart local v0    # "result":I
    return v0
.end method

.method public html()Ljava/lang/String;
    .registers 4

    .line 380
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 382
    .local v0, "sb":Ljava/lang/StringBuilder;
    :try_start_4
    new-instance v1, Lcom/streambundlehtml/nodes/Document;

    const-string v2, ""

    invoke-direct {v1, v2}, Lcom/streambundlehtml/nodes/Document;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->html(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_12} :catch_18

    .line 385
    nop

    .line 386
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 383
    :catch_18
    move-exception v1

    .line 384
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/streambundlehtml/SerializationException;

    invoke-direct {v2, v1}, Lcom/streambundlehtml/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method final html(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 8
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 390
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    .line 391
    .local v0, "sz":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-ge v1, v0, :cond_30

    .line 392
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-direct {p0, v2}, Lcom/streambundlehtml/nodes/Attributes;->isInternalKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 393
    goto :goto_2d

    .line 394
    :cond_10
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/streambundlehtml/nodes/Attribute;->getValidKey(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;)Ljava/lang/String;

    move-result-object v2

    .line 395
    .local v2, "key":Ljava/lang/String;
    if-eqz v2, :cond_2d

    .line 396
    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aget-object v3, v3, v1

    check-cast v3, Ljava/lang/String;

    const/16 v4, 0x20

    invoke-interface {p1, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    move-result-object v4

    invoke-static {v2, v3, v4, p2}, Lcom/streambundlehtml/nodes/Attribute;->htmlNoValidate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 391
    .end local v2    # "key":Ljava/lang/String;
    :cond_2d
    :goto_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 398
    .end local v1    # "i":I
    :cond_30
    return-void
.end method

.method indexOfKey(Ljava/lang/String;)I
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 69
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 70
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-ge v0, v1, :cond_16

    .line 71
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 72
    return v0

    .line 70
    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 74
    .end local v0    # "i":I
    :cond_16
    const/4 v0, -0x1

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .line 299
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/streambundlehtml/nodes/Attribute;",
            ">;"
        }
    .end annotation

    .line 322
    new-instance v0, Lcom/streambundlehtml/nodes/Attributes$1;

    invoke-direct {v0, p0}, Lcom/streambundlehtml/nodes/Attributes$1;-><init>(Lcom/streambundlehtml/nodes/Attributes;)V

    return-object v0
.end method

.method public normalize()V
    .registers 4

    .line 464
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    if-ge v0, v1, :cond_14

    .line 465
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 464
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 467
    .end local v0    # "i":I
    :cond_14
    return-void
.end method

.method public put(Lcom/streambundlehtml/nodes/Attribute;)Lcom/streambundlehtml/nodes/Attributes;
    .registers 4
    .param p1, "attribute"    # Lcom/streambundlehtml/nodes/Attribute;

    .line 208
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 209
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 210
    iput-object p0, p1, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    .line 211
    return-object p0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 149
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 150
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v0

    .line 151
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    .line 152
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aput-object p2, v1, v0

    goto :goto_12

    .line 154
    :cond_f
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/nodes/Attributes;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 155
    :goto_12
    return-object p0
.end method

.method public put(Ljava/lang/String;Z)Lcom/streambundlehtml/nodes/Attributes;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .line 195
    if-eqz p2, :cond_7

    .line 196
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/streambundlehtml/nodes/Attributes;->putIgnoreCase(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a

    .line 198
    :cond_7
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->remove(Ljava/lang/String;)V

    .line 199
    :goto_a
    return-object p0
.end method

.method putIgnoreCase(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 178
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKeyIgnoreCase(Ljava/lang/String;)I

    move-result v0

    .line 179
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1a

    .line 180
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aput-object p2, v1, v0

    .line 181
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 182
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aput-object p1, v1, v0

    goto :goto_1d

    .line 185
    :cond_1a
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/nodes/Attributes;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 186
    :cond_1d
    :goto_1d
    return-void
.end method

.method putUserData(Ljava/lang/String;Ljava/lang/Object;)Lcom/streambundlehtml/nodes/Attributes;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 166
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 167
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->isInternalKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    invoke-static {p1}, Lcom/streambundlehtml/nodes/Attributes;->internalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 168
    :cond_d
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 169
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v0

    .line 170
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1c

    .line 171
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aput-object p2, v1, v0

    goto :goto_1f

    .line 173
    :cond_1c
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/nodes/Attributes;->addObject(Ljava/lang/String;Ljava/lang/Object;)V

    .line 174
    :goto_1f
    return-object p0
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 233
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v0

    .line 234
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_a

    .line 235
    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Attributes;->remove(I)V

    .line 236
    :cond_a
    return-void
.end method

.method public removeIgnoreCase(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 243
    invoke-direct {p0, p1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKeyIgnoreCase(Ljava/lang/String;)I

    move-result v0

    .line 244
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_a

    .line 245
    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/Attributes;->remove(I)V

    .line 246
    :cond_a
    return-void
.end method

.method public size()I
    .registers 2

    .line 292
    iget v0, p0, Lcom/streambundlehtml/nodes/Attributes;->size:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 402
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attributes;->html()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
