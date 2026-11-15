.class public final enum Lcom/streambundlehtml/select/NodeFilter$FilterResult;
.super Ljava/lang/Enum;
.source "NodeFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/NodeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FilterResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/streambundlehtml/select/NodeFilter$FilterResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/streambundlehtml/select/NodeFilter$FilterResult;

.field public static final enum CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

.field public static final enum REMOVE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

.field public static final enum SKIP_CHILDREN:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

.field public static final enum SKIP_ENTIRELY:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

.field public static final enum STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;


# direct methods
.method private static synthetic $values()[Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 3

    .line 30
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    sget-object v1, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->SKIP_CHILDREN:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->SKIP_ENTIRELY:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->REMOVE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 32
    new-instance v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const-string v1, "CONTINUE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/select/NodeFilter$FilterResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->CONTINUE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    .line 34
    new-instance v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const-string v1, "SKIP_CHILDREN"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/select/NodeFilter$FilterResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->SKIP_CHILDREN:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    .line 36
    new-instance v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const-string v1, "SKIP_ENTIRELY"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/select/NodeFilter$FilterResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->SKIP_ENTIRELY:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    .line 38
    new-instance v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const-string v1, "REMOVE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/select/NodeFilter$FilterResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->REMOVE:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    .line 40
    new-instance v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    const-string v1, "STOP"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/select/NodeFilter$FilterResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->STOP:Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    .line 30
    invoke-static {}, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->$values()[Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->$VALUES:[Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 30
    const-class v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v0
.end method

.method public static values()[Lcom/streambundlehtml/select/NodeFilter$FilterResult;
    .registers 1

    .line 30
    sget-object v0, Lcom/streambundlehtml/select/NodeFilter$FilterResult;->$VALUES:[Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    invoke-virtual {v0}, [Lcom/streambundlehtml/select/NodeFilter$FilterResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/streambundlehtml/select/NodeFilter$FilterResult;

    return-object v0
.end method
