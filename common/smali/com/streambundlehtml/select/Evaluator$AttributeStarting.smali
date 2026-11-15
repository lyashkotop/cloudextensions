.class public final Lcom/streambundlehtml/select/Evaluator$AttributeStarting;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AttributeStarting"
.end annotation


# instance fields
.field private final keyPrefix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "keyPrefix"    # Ljava/lang/String;

    .line 155
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    .line 156
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 157
    invoke-static {p1}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeStarting;->keyPrefix:Ljava/lang/String;

    .line 158
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 8
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 162
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->asList()Ljava/util/List;

    move-result-object v0

    .line 163
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Attribute;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Attribute;

    .line 164
    .local v2, "attribute":Lcom/streambundlehtml/nodes/Attribute;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/streambundlehtml/select/Evaluator$AttributeStarting;->keyPrefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 165
    const/4 v1, 0x1

    return v1

    .line 166
    .end local v2    # "attribute":Lcom/streambundlehtml/nodes/Attribute;
    :cond_2a
    goto :goto_c

    .line 167
    :cond_2b
    const/4 v1, 0x0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 172
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeStarting;->keyPrefix:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "[^%s]"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
