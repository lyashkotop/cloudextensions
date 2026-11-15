.class Lcom/streambundlehtml/helper/DataUtil$BomCharset;
.super Ljava/lang/Object;
.source "DataUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/helper/DataUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BomCharset"
.end annotation


# instance fields
.field private final charset:Ljava/lang/String;

.field private final offset:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "offset"    # Z

    .line 326
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
    iput-object p1, p0, Lcom/streambundlehtml/helper/DataUtil$BomCharset;->charset:Ljava/lang/String;

    .line 328
    iput-boolean p2, p0, Lcom/streambundlehtml/helper/DataUtil$BomCharset;->offset:Z

    .line 329
    return-void
.end method

.method static synthetic access$000(Lcom/streambundlehtml/helper/DataUtil$BomCharset;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/helper/DataUtil$BomCharset;

    .line 322
    iget-object v0, p0, Lcom/streambundlehtml/helper/DataUtil$BomCharset;->charset:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/streambundlehtml/helper/DataUtil$BomCharset;)Z
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/helper/DataUtil$BomCharset;

    .line 322
    iget-boolean v0, p0, Lcom/streambundlehtml/helper/DataUtil$BomCharset;->offset:Z

    return v0
.end method
