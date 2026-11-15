.class public abstract Lcom/streambundlehtml/select/Evaluator$AttributeKeyPair;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "AttributeKeyPair"
.end annotation


# instance fields
.field key:Ljava/lang/String;

.field value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 309
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/select/Evaluator$AttributeKeyPair;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 310
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "trimValue"    # Z

    .line 312
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    .line 313
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 314
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 316
    invoke-static {p1}, Lcom/streambundlehtml/internal/Normalizer;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeKeyPair;->key:Ljava/lang/String;

    .line 317
    const-string v0, "\'"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1f

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    goto :goto_2d

    .line 318
    :cond_1f
    const-string v0, "\""

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2f

    :goto_2d
    const/4 v0, 0x1

    goto :goto_30

    :cond_2f
    const/4 v0, 0x0

    .line 319
    .local v0, "isStringLiteral":Z
    :goto_30
    if-eqz v0, :cond_3b

    .line 320
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {p2, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 323
    :cond_3b
    if-eqz p3, :cond_42

    invoke-static {p2}, Lcom/streambundlehtml/internal/Normalizer;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_46

    :cond_42
    invoke-static {p2, v0}, Lcom/streambundlehtml/internal/Normalizer;->normalize(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    :goto_46
    iput-object v1, p0, Lcom/streambundlehtml/select/Evaluator$AttributeKeyPair;->value:Ljava/lang/String;

    .line 324
    return-void
.end method
