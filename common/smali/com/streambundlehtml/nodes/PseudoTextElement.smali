.class public Lcom/streambundlehtml/nodes/PseudoTextElement;
.super Lcom/streambundlehtml/nodes/Element;
.source "PseudoTextElement.java"


# direct methods
.method public constructor <init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V
    .registers 4
    .param p1, "tag"    # Lcom/streambundlehtml/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "attributes"    # Lcom/streambundlehtml/nodes/Attributes;

    .line 12
    invoke-direct {p0, p1, p2, p3}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 13
    return-void
.end method


# virtual methods
.method outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 17
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 21
    return-void
.end method
