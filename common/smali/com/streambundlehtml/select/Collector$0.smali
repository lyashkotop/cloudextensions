.class public final synthetic Lcom/streambundlehtml/select/Collector$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/streambundlehtml/select/NodeVisitor;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/streambundlehtml/select/Collector;"
    method = "lambda$collect$0"
    proto = "(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/select/Elements;Lcom/streambundlehtml/nodes/Node;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/streambundlehtml/select/Evaluator;

.field public final synthetic f$1:Lcom/streambundlehtml/nodes/Element;

.field public final synthetic f$2:Lcom/streambundlehtml/select/Elements;


# direct methods
.method public synthetic constructor <init>(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/select/Elements;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundlehtml/select/Collector$0;->f$0:Lcom/streambundlehtml/select/Evaluator;

    iput-object p2, p0, Lcom/streambundlehtml/select/Collector$0;->f$1:Lcom/streambundlehtml/nodes/Element;

    iput-object p3, p0, Lcom/streambundlehtml/select/Collector$0;->f$2:Lcom/streambundlehtml/select/Elements;

    return-void
.end method


# virtual methods
.method public final head(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Lcom/streambundlehtml/select/Collector$0;->f$0:Lcom/streambundlehtml/select/Evaluator;

    iget-object v1, p0, Lcom/streambundlehtml/select/Collector$0;->f$1:Lcom/streambundlehtml/nodes/Element;

    iget-object v2, p0, Lcom/streambundlehtml/select/Collector$0;->f$2:Lcom/streambundlehtml/select/Elements;

    invoke-static {v0, v1, v2, p1, p2}, Lcom/streambundlehtml/select/Collector;->lambda$collect$0(Lcom/streambundlehtml/select/Evaluator;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/select/Elements;Lcom/streambundlehtml/nodes/Node;I)V

    return-void
.end method

.method public synthetic tail(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 3

    .line 0
    invoke-static {p0, p1, p2}, Lcom/streambundlehtml/select/NodeVisitor$-CC;->$default$tail(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;I)V

    return-void
.end method
