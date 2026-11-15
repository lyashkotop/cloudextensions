.class public final synthetic Lcom/streambundlehtml/select/NodeFilter$-CC;
.super Ljava/lang/Object;
.source "NodeFilter.java"


# direct methods
.method public static $default$tail(Lcom/streambundlehtml/select/NodeFilter;Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 4
    .param p0, "_this"    # Lcom/streambundlehtml/select/NodeFilter;
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 59
    sget-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v0
.end method
