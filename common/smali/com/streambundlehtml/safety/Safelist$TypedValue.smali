.class abstract Lcom/streambundlehtml/safety/Safelist$TypedValue;
.super Ljava/lang/Object;
.source "Safelist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/safety/Safelist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "TypedValue"
.end annotation


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .line 655
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 656
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 657
    iput-object p1, p0, Lcom/streambundlehtml/safety/Safelist$TypedValue;->value:Ljava/lang/String;

    .line 658
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .line 670
    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 671
    :cond_4
    const/4 v1, 0x0

    if-nez p1, :cond_8

    return v1

    .line 672
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_13

    return v1

    .line 673
    :cond_13
    move-object v2, p1

    check-cast v2, Lcom/streambundlehtml/safety/Safelist$TypedValue;

    .line 674
    .local v2, "other":Lcom/streambundlehtml/safety/Safelist$TypedValue;
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist$TypedValue;->value:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 675
    iget-object v3, v2, Lcom/streambundlehtml/safety/Safelist$TypedValue;->value:Ljava/lang/String;

    if-eqz v3, :cond_1f

    const/4 v0, 0x0

    :cond_1f
    return v0

    .line 676
    :cond_20
    iget-object v0, p0, Lcom/streambundlehtml/safety/Safelist$TypedValue;->value:Ljava/lang/String;

    iget-object v1, v2, Lcom/streambundlehtml/safety/Safelist$TypedValue;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hashCode()I
    .registers 5

    .line 662
    const/16 v0, 0x1f

    .line 663
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 664
    .local v1, "result":I
    mul-int/lit8 v2, v1, 0x1f

    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist$TypedValue;->value:Ljava/lang/String;

    if-nez v3, :cond_b

    const/4 v3, 0x0

    goto :goto_11

    :cond_b
    iget-object v3, p0, Lcom/streambundlehtml/safety/Safelist$TypedValue;->value:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_11
    add-int/2addr v2, v3

    .line 665
    .end local v1    # "result":I
    .local v2, "result":I
    return v2
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 681
    iget-object v0, p0, Lcom/streambundlehtml/safety/Safelist$TypedValue;->value:Ljava/lang/String;

    return-object v0
.end method
