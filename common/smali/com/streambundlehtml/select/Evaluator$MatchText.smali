.class public final Lcom/streambundlehtml/select/Evaluator$MatchText;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MatchText"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 862
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 10
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 866
    instance-of v0, p2, Lcom/streambundlehtml/nodes/PseudoTextElement;

    if-eqz v0, :cond_6

    .line 867
    const/4 v0, 0x1

    return v0

    .line 869
    :cond_6
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->textNodes()Ljava/util/List;

    move-result-object v0

    .line 870
    .local v0, "textNodes":Ljava/util/List;, "Ljava/util/List<Lcom/streambundlehtml/nodes/TextNode;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/TextNode;

    .line 871
    .local v2, "textNode":Lcom/streambundlehtml/nodes/TextNode;
    new-instance v3, Lcom/streambundlehtml/nodes/PseudoTextElement;

    .line 872
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/streambundlehtml/parser/Tag;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v4

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->attributes()Lcom/streambundlehtml/nodes/Attributes;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/streambundlehtml/nodes/PseudoTextElement;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 873
    .local v3, "pel":Lcom/streambundlehtml/nodes/PseudoTextElement;
    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/TextNode;->replaceWith(Lcom/streambundlehtml/nodes/Node;)V

    .line 874
    invoke-virtual {v3, v2}, Lcom/streambundlehtml/nodes/PseudoTextElement;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 875
    .end local v2    # "textNode":Lcom/streambundlehtml/nodes/TextNode;
    .end local v3    # "pel":Lcom/streambundlehtml/nodes/PseudoTextElement;
    goto :goto_e

    .line 876
    :cond_36
    const/4 v1, 0x0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 881
    const-string v0, ":matchText"

    return-object v0
.end method
