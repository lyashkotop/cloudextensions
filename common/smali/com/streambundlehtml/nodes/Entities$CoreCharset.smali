.class final enum Lcom/streambundlehtml/nodes/Entities$CoreCharset;
.super Ljava/lang/Enum;
.source "Entities.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/nodes/Entities;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "CoreCharset"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/streambundlehtml/nodes/Entities$CoreCharset;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/streambundlehtml/nodes/Entities$CoreCharset;

.field public static final enum ascii:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

.field public static final enum fallback:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

.field public static final enum utf:Lcom/streambundlehtml/nodes/Entities$CoreCharset;


# direct methods
.method private static synthetic $values()[Lcom/streambundlehtml/nodes/Entities$CoreCharset;
    .registers 3

    .line 308
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    sget-object v1, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->ascii:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->utf:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->fallback:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 309
    new-instance v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    const-string v1, "ascii"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Entities$CoreCharset;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->ascii:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    new-instance v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    const-string v1, "utf"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Entities$CoreCharset;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->utf:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    new-instance v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    const-string v1, "fallback"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Entities$CoreCharset;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->fallback:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    .line 308
    invoke-static {}, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->$values()[Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->$VALUES:[Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 308
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static byName(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Entities$CoreCharset;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 312
    const-string v0, "US-ASCII"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 313
    sget-object v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->ascii:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    return-object v0

    .line 314
    :cond_b
    const-string v0, "UTF-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 315
    sget-object v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->utf:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    return-object v0

    .line 316
    :cond_16
    sget-object v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->fallback:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Entities$CoreCharset;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 308
    const-class v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    return-object v0
.end method

.method public static values()[Lcom/streambundlehtml/nodes/Entities$CoreCharset;
    .registers 1

    .line 308
    sget-object v0, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->$VALUES:[Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    invoke-virtual {v0}, [Lcom/streambundlehtml/nodes/Entities$CoreCharset;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    return-object v0
.end method
