.class public final Lcom/streambundlehtml/select/Evaluator$IsEmpty;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IsEmpty"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 635
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 7
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 638
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v0

    .line 639
    .local v0, "family":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/Node;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Node;

    .line 640
    .local v2, "n":Lcom/streambundlehtml/nodes/Node;
    instance-of v3, v2, Lcom/streambundlehtml/nodes/Comment;

    if-nez v3, :cond_22

    instance-of v3, v2, Lcom/streambundlehtml/nodes/XmlDeclaration;

    if-nez v3, :cond_22

    instance-of v3, v2, Lcom/streambundlehtml/nodes/DocumentType;

    if-nez v3, :cond_22

    const/4 v1, 0x0

    return v1

    .line 641
    .end local v2    # "n":Lcom/streambundlehtml/nodes/Node;
    :cond_22
    goto :goto_8

    .line 642
    :cond_23
    const/4 v1, 0x1

    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 646
    const-string v0, ":empty"

    return-object v0
.end method
