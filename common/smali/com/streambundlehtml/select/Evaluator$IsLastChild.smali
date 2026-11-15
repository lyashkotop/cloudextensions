.class public final Lcom/streambundlehtml/select/Evaluator$IsLastChild;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IsLastChild"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 406
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 7
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 409
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 410
    .local v0, "p":Lcom/streambundlehtml/nodes/Element;
    if-eqz v0, :cond_1b

    instance-of v1, v0, Lcom/streambundlehtml/nodes/Document;

    if-nez v1, :cond_1b

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->elementSiblingIndex()I

    move-result v1

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->children()Lcom/streambundlehtml/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/select/Elements;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-ne v1, v2, :cond_1b

    goto :goto_1c

    :cond_1b
    const/4 v3, 0x0

    :goto_1c
    return v3
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 415
    const-string v0, ":last-child"

    return-object v0
.end method
