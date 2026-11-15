.class Lcom/streambundlehtml/safety/Cleaner$ElementMeta;
.super Ljava/lang/Object;
.source "Cleaner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/safety/Cleaner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ElementMeta"
.end annotation


# instance fields
.field el:Lcom/streambundlehtml/nodes/Element;

.field numAttribsDiscarded:I


# direct methods
.method constructor <init>(Lcom/streambundlehtml/nodes/Element;I)V
    .registers 3
    .param p1, "el"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "numAttribsDiscarded"    # I

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    iput-object p1, p0, Lcom/streambundlehtml/safety/Cleaner$ElementMeta;->el:Lcom/streambundlehtml/nodes/Element;

    .line 211
    iput p2, p0, Lcom/streambundlehtml/safety/Cleaner$ElementMeta;->numAttribsDiscarded:I

    .line 212
    return-void
.end method
