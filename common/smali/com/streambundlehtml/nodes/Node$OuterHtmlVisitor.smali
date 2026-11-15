.class Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;
.super Ljava/lang/Object;
.source "Node.java"

# interfaces
.implements Lcom/streambundlehtml/select/NodeVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/nodes/Node;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OuterHtmlVisitor"
.end annotation


# instance fields
.field private final accum:Ljava/lang/Appendable;

.field private final out:Lcom/streambundlehtml/nodes/Document$OutputSettings;


# direct methods
.method constructor <init>(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 3
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 883
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 884
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;->accum:Ljava/lang/Appendable;

    .line 885
    iput-object p2, p0, Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;->out:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 886
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prepareEncoder()Ljava/nio/charset/CharsetEncoder;

    .line 887
    return-void
.end method


# virtual methods
.method public head(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 5
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 891
    :try_start_0
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;->accum:Ljava/lang/Appendable;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;->out:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-virtual {p1, v0, p2, v1}, Lcom/streambundlehtml/nodes/Node;->outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    .line 894
    nop

    .line 895
    return-void

    .line 892
    :catch_9
    move-exception v0

    .line 893
    .local v0, "exception":Ljava/io/IOException;
    new-instance v1, Lcom/streambundlehtml/SerializationException;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public tail(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 5
    .param p1, "node"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 898
    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Node;->nodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "#text"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    .line 900
    :try_start_c
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;->accum:Ljava/lang/Appendable;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Node$OuterHtmlVisitor;->out:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-virtual {p1, v0, p2, v1}, Lcom/streambundlehtml/nodes/Node;->outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_13} :catch_14

    .line 903
    goto :goto_1b

    .line 901
    :catch_14
    move-exception v0

    .line 902
    .local v0, "exception":Ljava/io/IOException;
    new-instance v1, Lcom/streambundlehtml/SerializationException;

    invoke-direct {v1, v0}, Lcom/streambundlehtml/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 905
    .end local v0    # "exception":Ljava/io/IOException;
    :cond_1b
    :goto_1b
    return-void
.end method
