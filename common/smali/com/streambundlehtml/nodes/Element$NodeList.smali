.class final Lcom/streambundlehtml/nodes/Element$NodeList;
.super Lcom/streambundlehtml/helper/ChangeNotifyingArrayList;
.source "Element.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/nodes/Element;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NodeList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/streambundlehtml/helper/ChangeNotifyingArrayList<",
        "Lcom/streambundlehtml/nodes/Node;",
        ">;"
    }
.end annotation


# instance fields
.field private final owner:Lcom/streambundlehtml/nodes/Element;


# direct methods
.method constructor <init>(Lcom/streambundlehtml/nodes/Element;I)V
    .registers 3
    .param p1, "owner"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "initialCapacity"    # I

    .line 1835
    invoke-direct {p0, p2}, Lcom/streambundlehtml/helper/ChangeNotifyingArrayList;-><init>(I)V

    .line 1836
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Element$NodeList;->owner:Lcom/streambundlehtml/nodes/Element;

    .line 1837
    return-void
.end method


# virtual methods
.method public onContentsChanged()V
    .registers 2

    .line 1840
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Element$NodeList;->owner:Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->nodelistChanged()V

    .line 1841
    return-void
.end method
