.class public final synthetic Lcom/streambundlehtml/nodes/Element$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/streambundlehtml/select/NodeFilter;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/streambundlehtml/nodes/Element;"
    method = "lambda$hasText$1"
    proto = "(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundlehtml/nodes/Element$5;->f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method


# virtual methods
.method public final head(Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element$5;->f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {v0, p1, p2}, Lcom/streambundlehtml/nodes/Element;->lambda$hasText$1(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    move-result-object p1

    return-object p1
.end method

.method public synthetic tail(Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 3

    .line 0
    invoke-static {p0, p1, p2}, Lcom/streambundlehtml/select/NodeFilter$-CC;->$default$tail(Lcom/streambundlehtml/select/NodeFilter;Lcom/streambundlehtml/nodes/Node;I)Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    move-result-object p1

    return-object p1
.end method
