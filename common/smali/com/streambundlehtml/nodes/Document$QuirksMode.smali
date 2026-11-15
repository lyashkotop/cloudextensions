.class public final enum Lcom/streambundlehtml/nodes/Document$QuirksMode;
.super Ljava/lang/Enum;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/nodes/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "QuirksMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/streambundlehtml/nodes/Document$QuirksMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/streambundlehtml/nodes/Document$QuirksMode;

.field public static final enum limitedQuirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

.field public static final enum noQuirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

.field public static final enum quirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;


# direct methods
.method private static synthetic $values()[Lcom/streambundlehtml/nodes/Document$QuirksMode;
    .registers 3

    .line 660
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/streambundlehtml/nodes/Document$QuirksMode;

    sget-object v1, Lcom/streambundlehtml/nodes/Document$QuirksMode;->noQuirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/nodes/Document$QuirksMode;->quirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/nodes/Document$QuirksMode;->limitedQuirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 661
    new-instance v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;

    const-string v1, "noQuirks"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Document$QuirksMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;->noQuirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    new-instance v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;

    const-string v1, "quirks"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Document$QuirksMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;->quirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    new-instance v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;

    const-string v1, "limitedQuirks"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/nodes/Document$QuirksMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;->limitedQuirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    .line 660
    invoke-static {}, Lcom/streambundlehtml/nodes/Document$QuirksMode;->$values()[Lcom/streambundlehtml/nodes/Document$QuirksMode;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;->$VALUES:[Lcom/streambundlehtml/nodes/Document$QuirksMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 660
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document$QuirksMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 660
    const-class v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;

    return-object v0
.end method

.method public static values()[Lcom/streambundlehtml/nodes/Document$QuirksMode;
    .registers 1

    .line 660
    sget-object v0, Lcom/streambundlehtml/nodes/Document$QuirksMode;->$VALUES:[Lcom/streambundlehtml/nodes/Document$QuirksMode;

    invoke-virtual {v0}, [Lcom/streambundlehtml/nodes/Document$QuirksMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/streambundlehtml/nodes/Document$QuirksMode;

    return-object v0
.end method
