.class public Lcom/streambundlehtml/select/Selector;
.super Ljava/lang/Object;
.source "Selector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/select/Selector$SelectorParseException;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static filterOut(Ljava/util/Collection;Ljava/util/Collection;)Lcom/streambundlehtml/select/Elements;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;",
            "Ljava/util/Collection<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;)",
            "Lcom/streambundlehtml/select/Elements;"
        }
    .end annotation

    .line 142
    .local p0, "elements":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/streambundlehtml/nodes/Element;>;"
    .local p1, "outs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/streambundlehtml/nodes/Element;>;"
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v0}, Lcom/streambundlehtml/select/Elements;-><init>()V

    .line 143
    .local v0, "output":Lcom/streambundlehtml/select/Elements;
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 144
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    const/4 v3, 0x0

    .line 145
    .local v3, "found":Z
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/streambundlehtml/nodes/Element;

    .line 146
    .local v5, "out":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2, v5}, Lcom/streambundlehtml/nodes/Element;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2e

    .line 147
    const/4 v3, 0x1

    .line 148
    goto :goto_2f

    .line 150
    .end local v5    # "out":Lcom/streambundlehtml/nodes/Element;
    :cond_2e
    goto :goto_1a

    .line 151
    :cond_2f
    :goto_2f
    if-nez v3, :cond_34

    .line 152
    invoke-virtual {v0, v2}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    .line 153
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    .end local v3    # "found":Z
    :cond_34
    goto :goto_9

    .line 154
    :cond_35
    return-object v0
.end method

.method public static select(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p0, "evaluator"    # Lcom/streambundlehtml/select/Evaluator;
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;

    .line 109
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 110
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 111
    invoke-static {p0, p1}, Lcom/streambundlehtml/select/Collector;->collect(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public static select(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;
    .registers 3
    .param p0, "query"    # Ljava/lang/String;
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;

    .line 97
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 98
    invoke-static {p0}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/streambundlehtml/select/Selector;->select(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public static select(Ljava/lang/String;Ljava/lang/Iterable;)Lcom/streambundlehtml/select/Elements;
    .registers 11
    .param p0, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable<",
            "Lcom/streambundlehtml/nodes/Element;",
            ">;)",
            "Lcom/streambundlehtml/select/Elements;"
        }
    .end annotation

    .line 122
    .local p1, "roots":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/streambundlehtml/nodes/Element;>;"
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 123
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 124
    invoke-static {p0}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v0

    .line 125
    .local v0, "evaluator":Lcom/streambundlehtml/select/Evaluator;
    new-instance v1, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Elements;-><init>()V

    .line 126
    .local v1, "elements":Lcom/streambundlehtml/select/Elements;
    new-instance v2, Ljava/util/IdentityHashMap;

    invoke-direct {v2}, Ljava/util/IdentityHashMap;-><init>()V

    .line 129
    .local v2, "seenElements":Ljava/util/IdentityHashMap;, "Ljava/util/IdentityHashMap<Lcom/streambundlehtml/nodes/Element;Ljava/lang/Boolean;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_18
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_45

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/streambundlehtml/nodes/Element;

    .line 130
    .local v4, "root":Lcom/streambundlehtml/nodes/Element;
    invoke-static {v0, v4}, Lcom/streambundlehtml/select/Selector;->select(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/select/Elements;

    move-result-object v5

    .line 131
    .local v5, "found":Lcom/streambundlehtml/select/Elements;
    invoke-virtual {v5}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_44

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/streambundlehtml/nodes/Element;

    .line 132
    .local v7, "el":Lcom/streambundlehtml/nodes/Element;
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v7, v8}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_43

    .line 133
    invoke-virtual {v1, v7}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    .line 135
    .end local v7    # "el":Lcom/streambundlehtml/nodes/Element;
    :cond_43
    goto :goto_2c

    .line 136
    .end local v4    # "root":Lcom/streambundlehtml/nodes/Element;
    .end local v5    # "found":Lcom/streambundlehtml/select/Elements;
    :cond_44
    goto :goto_18

    .line 137
    :cond_45
    return-object v1
.end method

.method public static selectFirst(Ljava/lang/String;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;
    .registers 3
    .param p0, "cssQuery"    # Ljava/lang/String;
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 164
    invoke-static {p0}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 165
    invoke-static {p0}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/streambundlehtml/select/Collector;->findFirst(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    return-object v0
.end method
