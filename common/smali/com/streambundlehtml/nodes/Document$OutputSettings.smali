.class public Lcom/streambundlehtml/nodes/Document$OutputSettings;
.super Ljava/lang/Object;
.source "Document.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/nodes/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OutputSettings"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;
    }
.end annotation


# instance fields
.field private charset:Ljava/nio/charset/Charset;

.field coreCharset:Lcom/streambundlehtml/nodes/Entities$CoreCharset;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final encoderThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/nio/charset/CharsetEncoder;",
            ">;"
        }
    .end annotation
.end field

.field private escapeMode:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

.field private indentAmount:I

.field private maxPaddingWidth:I

.field private outline:Z

.field private prettyPrint:Z

.field private syntax:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 459
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 448
    sget-object v0, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->base:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->escapeMode:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    .line 449
    sget-object v0, Lcom/streambundlehtml/helper/DataUtil;->UTF_8:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset:Ljava/nio/charset/Charset;

    .line 450
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->encoderThreadLocal:Ljava/lang/ThreadLocal;

    .line 453
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint:Z

    .line 454
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->outline:Z

    .line 455
    iput v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->indentAmount:I

    .line 456
    const/16 v0, 0x1e

    iput v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->maxPaddingWidth:I

    .line 457
    sget-object v0, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->html:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    iput-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    .line 459
    return-void
.end method


# virtual methods
.method public charset(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;

    .line 512
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset(Ljava/nio/charset/Charset;)Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 513
    return-object p0
.end method

.method public charset(Ljava/nio/charset/Charset;)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .line 502
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset:Ljava/nio/charset/Charset;

    .line 503
    return-object p0
.end method

.method public charset()Ljava/nio/charset/Charset;
    .registers 2

    .line 493
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public clone()Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 3

    .line 630
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_1d

    .line 633
    .local v0, "clone":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    nop

    .line 634
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 635
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->escapeMode:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->valueOf(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    move-result-object v1

    iput-object v1, v0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->escapeMode:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    .line 637
    return-object v0

    .line 631
    .end local v0    # "clone":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :catch_1d
    move-exception v0

    .line 632
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 442
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->clone()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v0

    return-object v0
.end method

.method encoder()Ljava/nio/charset/CharsetEncoder;
    .registers 3

    .line 525
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->encoderThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/charset/CharsetEncoder;

    .line 526
    .local v0, "encoder":Ljava/nio/charset/CharsetEncoder;
    if-eqz v0, :cond_c

    move-object v1, v0

    goto :goto_10

    :cond_c
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prepareEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v1

    :goto_10
    return-object v1
.end method

.method public escapeMode(Lcom/streambundlehtml/nodes/Entities$EscapeMode;)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 2
    .param p1, "escapeMode"    # Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    .line 480
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->escapeMode:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    .line 481
    return-object p0
.end method

.method public escapeMode()Lcom/streambundlehtml/nodes/Entities$EscapeMode;
    .registers 2

    .line 470
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->escapeMode:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    return-object v0
.end method

.method public indentAmount()I
    .registers 2

    .line 591
    iget v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->indentAmount:I

    return v0
.end method

.method public indentAmount(I)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 3
    .param p1, "indentAmount"    # I

    .line 600
    if-ltz p1, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    :goto_5
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 601
    iput p1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->indentAmount:I

    .line 602
    return-object p0
.end method

.method public maxPaddingWidth()I
    .registers 2

    .line 611
    iget v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->maxPaddingWidth:I

    return v0
.end method

.method public maxPaddingWidth(I)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 3
    .param p1, "maxPaddingWidth"    # I

    .line 621
    const/4 v0, -0x1

    if-lt p1, v0, :cond_5

    const/4 v0, 0x1

    goto :goto_6

    :cond_5
    const/4 v0, 0x0

    :goto_6
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isTrue(Z)V

    .line 622
    iput p1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->maxPaddingWidth:I

    .line 623
    return-object p0
.end method

.method public outline(Z)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 2
    .param p1, "outlineMode"    # Z

    .line 582
    iput-boolean p1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->outline:Z

    .line 583
    return-object p0
.end method

.method public outline()Z
    .registers 2

    .line 573
    iget-boolean v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->outline:Z

    return v0
.end method

.method prepareEncoder()Ljava/nio/charset/CharsetEncoder;
    .registers 3

    .line 518
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v0

    .line 519
    .local v0, "encoder":Ljava/nio/charset/CharsetEncoder;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->encoderThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 520
    invoke-virtual {v0}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->byName(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->coreCharset:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    .line 521
    return-object v0
.end method

.method public prettyPrint(Z)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 2
    .param p1, "pretty"    # Z

    .line 563
    iput-boolean p1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint:Z

    .line 564
    return-object p0
.end method

.method public prettyPrint()Z
    .registers 2

    .line 554
    iget-boolean v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->prettyPrint:Z

    return v0
.end method

.method public syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;
    .registers 2

    .line 534
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    return-object v0
.end method

.method public syntax(Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;)Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .registers 2
    .param p1, "syntax"    # Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    .line 544
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    .line 545
    return-object p0
.end method
