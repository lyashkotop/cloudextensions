.class public Lcom/streambundlehtml/select/NodeTraversor;
.super Ljava/lang/Object;
.source "NodeTraversor.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 0

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static filter(Lcom/streambundlehtml/select/NodeFilter;Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 7
    .param p0, "filter"    # Lcom/streambundlehtml/select/NodeFilter;
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Node;

    .line 83
    move-object v0, p1

    .line 84
    .local v0, "node":Lcom/streambundlehtml/nodes/Node;
    const/4 v1, 0x0

    .line 86
    .local v1, "depth":I
    :goto_2
    if-eqz v0, :cond_6d

    .line 87
    invoke-interface {p0, v0, v1}, Lcom/streambundlehtml/select/NodeFilter;->head(Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    move-result-object v2

    .line 88
    .local v2, "result":Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-ne v2, v3, :cond_d

    .line 89
    return-object v2

    .line 91
    :cond_d
    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-ne v2, v3, :cond_1f

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v3

    if-lez v3, :cond_1f

    .line 92
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Node;->childNode(I)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 93
    add-int/lit8 v1, v1, 0x1

    .line 94
    goto :goto_2

    .line 98
    :cond_1f
    :goto_1f
    nop

    .line 99
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->nextSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v3

    if-nez v3, :cond_4b

    if-lez v1, :cond_4b

    .line 101
    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-eq v2, v3, :cond_31

    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->SKIP_CHILDREN:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-eq v2, v3, :cond_31

    goto :goto_3a

    .line 102
    :cond_31
    invoke-interface {p0, v0, v1}, Lcom/streambundlehtml/select/NodeFilter;->tail(Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    move-result-object v2

    .line 103
    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-ne v2, v3, :cond_3a

    .line 104
    return-object v2

    .line 106
    :cond_3a
    :goto_3a
    move-object v3, v0

    .line 107
    .local v3, "prev":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->parentNode()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 108
    add-int/lit8 v1, v1, -0x1

    .line 109
    sget-object v4, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->REMOVE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-ne v2, v4, :cond_48

    .line 110
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Node;->remove()V

    .line 111
    :cond_48
    sget-object v2, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    .line 112
    .end local v3    # "prev":Lcom/streambundlehtml/nodes/Node;
    goto :goto_1f

    .line 114
    :cond_4b
    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-eq v2, v3, :cond_54

    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->SKIP_CHILDREN:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-eq v2, v3, :cond_54

    goto :goto_5d

    .line 115
    :cond_54
    invoke-interface {p0, v0, v1}, Lcom/streambundlehtml/select/NodeFilter;->tail(Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    move-result-object v2

    .line 116
    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-ne v2, v3, :cond_5d

    .line 117
    return-object v2

    .line 119
    :cond_5d
    :goto_5d
    if-ne v0, p1, :cond_60

    .line 120
    return-object v2

    .line 121
    :cond_60
    move-object v3, v0

    .line 122
    .restart local v3    # "prev":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->nextSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 123
    sget-object v4, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->REMOVE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-ne v2, v4, :cond_6c

    .line 124
    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Node;->remove()V

    .line 125
    .end local v2    # "result":Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .end local v3    # "prev":Lcom/streambundlehtml/nodes/Node;
    :cond_6c
    goto :goto_2

    .line 127
    :cond_6d
    sget-object v2, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v2
.end method

.method public static filter(Lcom/streambundlehtml/select/NodeFilter;Lcom/streambundlehtml/select/Elements;)V
    .registers 6
    .param p0, "filter"    # Lcom/streambundlehtml/select/NodeFilter;
    .param p1, "elements"    # Lcom/streambundlehtml/select/Elements;

    .line 136
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 137
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 138
    invoke-virtual {p1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 139
    .local v1, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-static {p0, v1}, Lcom/streambundlehtml/select/NodeTraversor;->filter(Lcom/streambundlehtml/select/NodeFilter;Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    move-result-object v2

    sget-object v3, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    if-ne v2, v3, :cond_1f

    .line 140
    goto :goto_20

    .line 139
    .end local v1    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_1f
    goto :goto_a

    .line 141
    :cond_20
    :goto_20
    return-void
.end method

.method public static traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V
    .registers 9
    .param p0, "visitor"    # Lcom/streambundlehtml/select/NodeVisitor;
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Node;

    .line 21
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 22
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 23
    move-object v0, p1

    .line 24
    .local v0, "node":Lcom/streambundlehtml/nodes/Node;
    const/4 v1, 0x0

    .line 26
    .local v1, "depth":I
    :cond_8
    :goto_8
    if-eqz v0, :cond_67

    .line 27
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->parentNode()Lcom/streambundlehtml/nodes/Node;

    move-result-object v2

    .line 28
    .local v2, "parent":Lcom/streambundlehtml/nodes/Node;
    const/4 v3, 0x0

    if-eqz v2, :cond_16

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v4

    goto :goto_17

    :cond_16
    const/4 v4, 0x0

    .line 29
    .local v4, "origSize":I
    :goto_17
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->nextSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v5

    .line 31
    .local v5, "next":Lcom/streambundlehtml/nodes/Node;
    invoke-interface {p0, v0, v1}, Lcom/streambundlehtml/select/NodeVisitor;->head(Lcom/streambundlehtml/nodes/Node;I)V

    .line 32
    if-eqz v2, :cond_3c

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->hasParent()Z

    move-result v6

    if-nez v6, :cond_3c

    .line 33
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v6

    if-ne v4, v6, :cond_35

    .line 34
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->siblingIndex()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/streambundlehtml/nodes/Node;->childNode(I)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    goto :goto_3c

    .line 36
    :cond_35
    move-object v0, v5

    .line 37
    if-nez v0, :cond_8

    .line 38
    move-object v0, v2

    .line 39
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    .line 45
    :cond_3c
    :goto_3c
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->childNodeSize()I

    move-result v6

    if-lez v6, :cond_49

    .line 46
    invoke-virtual {v0, v3}, Lcom/streambundlehtml/nodes/Node;->childNode(I)Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 47
    add-int/lit8 v1, v1, 0x1

    goto :goto_66

    .line 50
    :cond_49
    :goto_49
    nop

    .line 51
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->nextSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v3

    if-nez v3, :cond_5c

    if-lez v1, :cond_5c

    .line 52
    invoke-interface {p0, v0, v1}, Lcom/streambundlehtml/select/NodeVisitor;->tail(Lcom/streambundlehtml/nodes/Node;I)V

    .line 53
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->parentNode()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 54
    add-int/lit8 v1, v1, -0x1

    goto :goto_49

    .line 56
    :cond_5c
    invoke-interface {p0, v0, v1}, Lcom/streambundlehtml/select/NodeVisitor;->tail(Lcom/streambundlehtml/nodes/Node;I)V

    .line 57
    if-ne v0, p1, :cond_62

    .line 58
    goto :goto_67

    .line 59
    :cond_62
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Node;->nextSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    .line 61
    .end local v2    # "parent":Lcom/streambundlehtml/nodes/Node;
    .end local v4    # "origSize":I
    .end local v5    # "next":Lcom/streambundlehtml/nodes/Node;
    :goto_66
    goto :goto_8

    .line 62
    :cond_67
    :goto_67
    return-void
.end method

.method public static traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/select/Elements;)V
    .registers 4
    .param p0, "visitor"    # Lcom/streambundlehtml/select/NodeVisitor;
    .param p1, "elements"    # Lcom/streambundlehtml/select/Elements;

    .line 70
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 71
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 72
    invoke-virtual {p1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/streambundlehtml/nodes/Element;

    .line 73
    .local v1, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-static {p0, v1}, Lcom/streambundlehtml/select/NodeTraversor;->traverse(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;)V

    .end local v1    # "el":Lcom/streambundlehtml/nodes/Element;
    goto :goto_a

    .line 74
    :cond_1a
    return-void
.end method
