.class Lcom/streambundlehtml/nodes/Element$1;
.super Ljava/lang/Object;
.source "Element.java"

# interfaces
.implements Lcom/streambundlehtml/select/NodeVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/streambundlehtml/nodes/Element;

.field final synthetic val$accum:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>(Lcom/streambundlehtml/nodes/Element;Ljava/lang/StringBuilder;)V
    .registers 3
    .param p1, "this$0"    # Lcom/streambundlehtml/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1307
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Element$1;->this$0:Lcom/streambundlehtml/nodes/Element;

    iput-object p2, p0, Lcom/streambundlehtml/nodes/Element$1;->val$accum:Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public head(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 6
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 1309
    instance-of v0, p1, Lcom/streambundlehtml/nodes/TextNode;

    if-eqz v0, :cond_d

    .line 1310
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/TextNode;

    .line 1311
    .local v0, "textNode":Lcom/streambundlehtml/nodes/TextNode;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element$1;->val$accum:Ljava/lang/StringBuilder;

    # invokes: Lcom/streambundlehtml/nodes/Element;->appendNormalisedText(Ljava/lang/StringBuilder;Lcom/streambundlehtml/nodes/TextNode;)V
    invoke-static {v1, v0}, Lcom/streambundlehtml/nodes/Element;->access$000(Ljava/lang/StringBuilder;Lcom/streambundlehtml/nodes/TextNode;)V

    .end local v0    # "textNode":Lcom/streambundlehtml/nodes/TextNode;
    goto :goto_3b

    .line 1312
    :cond_d
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_3b

    .line 1313
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 1314
    .local v0, "element":Lcom/streambundlehtml/nodes/Element;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element$1;->val$accum:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_3c

    .line 1315
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->isBlock()Z

    move-result v1

    if-nez v1, :cond_2b

    const-string v1, "br"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Element;->isNode(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2b

    goto :goto_3c

    :cond_2b
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element$1;->val$accum:Ljava/lang/StringBuilder;

    .line 1316
    invoke-static {v1}, Lcom/streambundlehtml/nodes/TextNode;->lastCharIsWhitespace(Ljava/lang/StringBuilder;)Z

    move-result v1

    if-nez v1, :cond_3c

    .line 1317
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Element$1;->val$accum:Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3c

    .line 1312
    .end local v0    # "element":Lcom/streambundlehtml/nodes/Element;
    :cond_3b
    :goto_3b
    nop

    .line 1319
    :cond_3c
    :goto_3c
    return-void
.end method

.method public tail(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 7
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 1323
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_35

    .line 1324
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 1325
    .local v0, "element":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Node;->nextSibling()Lcom/streambundlehtml/nodes/Node;

    move-result-object v1

    .line 1326
    .local v1, "next":Lcom/streambundlehtml/nodes/Node;
    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->isBlock()Z

    move-result v2

    if-eqz v2, :cond_35

    instance-of v2, v1, Lcom/streambundlehtml/nodes/TextNode;

    if-nez v2, :cond_26

    instance-of v2, v1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v2, :cond_35

    move-object v2, v1

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    # getter for: Lcom/streambundlehtml/nodes/Element;->tag:Lcom/streambundlehtml/parser/Tag;
    invoke-static {v2}, Lcom/streambundlehtml/nodes/Element;->access$100(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/parser/Tag;

    move-result-object v2

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Tag;->formatAsBlock()Z

    move-result v2

    if-nez v2, :cond_35

    :cond_26
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Element$1;->val$accum:Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/streambundlehtml/nodes/TextNode;->lastCharIsWhitespace(Ljava/lang/StringBuilder;)Z

    move-result v2

    if-nez v2, :cond_35

    .line 1327
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Element$1;->val$accum:Ljava/lang/StringBuilder;

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1330
    .end local v0    # "element":Lcom/streambundlehtml/nodes/Element;
    .end local v1    # "next":Lcom/streambundlehtml/nodes/Node;
    :cond_35
    return-void
.end method
