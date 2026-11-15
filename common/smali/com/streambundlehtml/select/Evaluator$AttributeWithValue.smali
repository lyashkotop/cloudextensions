.class public final Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;
.super Lcom/streambundlehtml/select/Evaluator$AttributeKeyPair;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AttributeWithValue"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 182
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/select/Evaluator$AttributeKeyPair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 5
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 187
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;->key:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;->value:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;->key:Ljava/lang/String;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 192
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;->key:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;->value:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const-string v0, "[%s=%s]"

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
