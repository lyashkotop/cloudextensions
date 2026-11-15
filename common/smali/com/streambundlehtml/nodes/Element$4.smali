.class public final synthetic Lcom/streambundlehtml/nodes/Element$4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/streambundlehtml/select/NodeVisitor;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/streambundlehtml/nodes/Element;"
    method = "lambda$forEach$4"
    proto = "(Lcom/streambundlehtml/helper/Consumer;Lcom/streambundlehtml/nodes/Node;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/streambundlehtml/helper/Consumer;


# direct methods
.method public synthetic constructor <init>(Lcom/streambundlehtml/helper/Consumer;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundlehtml/nodes/Element$4;->f$0:Lcom/streambundlehtml/helper/Consumer;

    return-void
.end method


# virtual methods
.method public final head(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element$4;->f$0:Lcom/streambundlehtml/helper/Consumer;

    invoke-static {v0, p1, p2}, Lcom/streambundlehtml/nodes/Element;->lambda$forEach$4(Lcom/streambundlehtml/helper/Consumer;Lcom/streambundlehtml/nodes/Node;I)V

    return-void
.end method

.method public synthetic tail(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 3

    .line 0
    invoke-static {p0, p1, p2}, Lcom/streambundlehtml/select/NodeVisitor$-CC;->$default$tail(Lcom/streambundlehtml/select/NodeVisitor;Lcom/streambundlehtml/nodes/Node;I)V

    return-void
.end method
