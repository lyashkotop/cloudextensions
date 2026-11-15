.class public Lcom/streambundlehtml/nodes/DocumentType;
.super Lcom/streambundlehtml/nodes/LeafNode;
.source "DocumentType.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "name"

.field private static final PUBLIC_ID:Ljava/lang/String; = "publicId"

.field public static final PUBLIC_KEY:Ljava/lang/String; = "PUBLIC"

.field private static final PUB_SYS_KEY:Ljava/lang/String; = "pubSysKey"

.field private static final SYSTEM_ID:Ljava/lang/String; = "systemId"

.field public static final SYSTEM_KEY:Ljava/lang/String; = "SYSTEM"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "publicId"    # Ljava/lang/String;
    .param p3, "systemId"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/LeafNode;-><init>()V

    .line 29
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 30
    invoke-static {p2}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 31
    invoke-static {p3}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 32
    const-string v0, "name"

    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 33
    const-string v0, "publicId"

    invoke-virtual {p0, v0, p2}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 34
    const-string v0, "systemId"

    invoke-virtual {p0, v0, p3}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 35
    invoke-direct {p0}, Lcom/streambundlehtml/nodes/DocumentType;->updatePubSyskey()V

    .line 36
    return-void
.end method

.method private has(Ljava/lang/String;)Z
    .registers 3
    .param p1, "attribute"    # Ljava/lang/String;

    .line 107
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private updatePubSyskey()V
    .registers 3

    .line 44
    const-string v0, "publicId"

    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->has(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "pubSysKey"

    if-eqz v0, :cond_10

    .line 45
    const-string v0, "PUBLIC"

    invoke-virtual {p0, v1, v0}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    goto :goto_1d

    .line 46
    :cond_10
    const-string v0, "systemId"

    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 47
    const-string v0, "SYSTEM"

    invoke-virtual {p0, v1, v0}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 48
    :cond_1d
    :goto_1d
    return-void
.end method


# virtual methods
.method public bridge synthetic absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 3

    .line 12
    invoke-super {p0, p1, p2}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic baseUri()Ljava/lang/String;
    .registers 2

    .line 12
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->baseUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic childNodeSize()I
    .registers 2

    .line 12
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->childNodeSize()I

    move-result v0

    return v0
.end method

.method public bridge synthetic empty()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 12
    invoke-super {p0}, Lcom/streambundlehtml/nodes/LeafNode;->empty()Lcom/streambundlehtml/nodes/Node;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasAttr(Ljava/lang/String;)Z
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->hasAttr(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public name()Ljava/lang/String;
    .registers 2

    .line 55
    const-string v0, "name"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .line 76
    const-string v0, "#doctype"

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 9
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget v0, p0, Lcom/streambundlehtml/nodes/DocumentType;->siblingIndex:I

    if-lez v0, :cond_f

    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 83
    const/16 v0, 0xa

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 85
    :cond_f
    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->html:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    const-string v2, "systemId"

    const-string v3, "publicId"

    if-ne v0, v1, :cond_2d

    invoke-direct {p0, v3}, Lcom/streambundlehtml/nodes/DocumentType;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-direct {p0, v2}, Lcom/streambundlehtml/nodes/DocumentType;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 87
    const-string v0, "<!doctype"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_32

    .line 89
    :cond_2d
    const-string v0, "<!DOCTYPE"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 91
    :goto_32
    const-string v0, "name"

    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->has(Ljava/lang/String;)Z

    move-result v1

    const-string v4, " "

    if-eqz v1, :cond_47

    .line 92
    invoke-interface {p1, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v1

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 93
    :cond_47
    const-string v0, "pubSysKey"

    invoke-direct {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5a

    .line 94
    invoke-interface {p1, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v1

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 95
    :cond_5a
    invoke-direct {p0, v3}, Lcom/streambundlehtml/nodes/DocumentType;->has(Ljava/lang/String;)Z

    move-result v0

    const/16 v1, 0x22

    const-string v4, " \""

    if-eqz v0, :cond_73

    .line 96
    invoke-interface {p1, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    invoke-virtual {p0, v3}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 97
    :cond_73
    invoke-direct {p0, v2}, Lcom/streambundlehtml/nodes/DocumentType;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_88

    .line 98
    invoke-interface {p1, v4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    invoke-virtual {p0, v2}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 99
    :cond_88
    const/16 v0, 0x3e

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 100
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 104
    return-void
.end method

.method public publicId()Ljava/lang/String;
    .registers 2

    .line 63
    const-string v0, "publicId"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 12
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/LeafNode;->removeAttr(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    move-result-object p1

    return-object p1
.end method

.method public setPubSysKey(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .line 39
    if-eqz p1, :cond_7

    .line 40
    const-string v0, "pubSysKey"

    invoke-virtual {p0, v0, p1}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Node;

    .line 41
    :cond_7
    return-void
.end method

.method public systemId()Ljava/lang/String;
    .registers 2

    .line 71
    const-string v0, "systemId"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/DocumentType;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
