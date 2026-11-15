.class public final enum Lcom/streambundlehtml/Connection$Method;
.super Ljava/lang/Enum;
.source "Connection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Method"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/streambundlehtml/Connection$Method;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/streambundlehtml/Connection$Method;

.field public static final enum DELETE:Lcom/streambundlehtml/Connection$Method;

.field public static final enum GET:Lcom/streambundlehtml/Connection$Method;

.field public static final enum HEAD:Lcom/streambundlehtml/Connection$Method;

.field public static final enum OPTIONS:Lcom/streambundlehtml/Connection$Method;

.field public static final enum PATCH:Lcom/streambundlehtml/Connection$Method;

.field public static final enum POST:Lcom/streambundlehtml/Connection$Method;

.field public static final enum PUT:Lcom/streambundlehtml/Connection$Method;

.field public static final enum TRACE:Lcom/streambundlehtml/Connection$Method;


# instance fields
.field private final hasBody:Z


# direct methods
.method private static synthetic $values()[Lcom/streambundlehtml/Connection$Method;
    .registers 3

    .line 45
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/streambundlehtml/Connection$Method;

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->GET:Lcom/streambundlehtml/Connection$Method;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->POST:Lcom/streambundlehtml/Connection$Method;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->PUT:Lcom/streambundlehtml/Connection$Method;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->DELETE:Lcom/streambundlehtml/Connection$Method;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->PATCH:Lcom/streambundlehtml/Connection$Method;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->HEAD:Lcom/streambundlehtml/Connection$Method;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->OPTIONS:Lcom/streambundlehtml/Connection$Method;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/Connection$Method;->TRACE:Lcom/streambundlehtml/Connection$Method;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 5

    .line 46
    new-instance v0, Lcom/streambundlehtml/Connection$Method;

    const-string v1, "GET"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/streambundlehtml/Connection$Method;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->GET:Lcom/streambundlehtml/Connection$Method;

    new-instance v0, Lcom/streambundlehtml/Connection$Method;

    const-string v1, "POST"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/streambundlehtml/Connection$Method;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->POST:Lcom/streambundlehtml/Connection$Method;

    new-instance v0, Lcom/streambundlehtml/Connection$Method;

    const-string v1, "PUT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v3}, Lcom/streambundlehtml/Connection$Method;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->PUT:Lcom/streambundlehtml/Connection$Method;

    new-instance v0, Lcom/streambundlehtml/Connection$Method;

    const-string v1, "DELETE"

    const/4 v4, 0x3

    invoke-direct {v0, v1, v4, v2}, Lcom/streambundlehtml/Connection$Method;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->DELETE:Lcom/streambundlehtml/Connection$Method;

    new-instance v0, Lcom/streambundlehtml/Connection$Method;

    const-string v1, "PATCH"

    const/4 v4, 0x4

    invoke-direct {v0, v1, v4, v3}, Lcom/streambundlehtml/Connection$Method;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->PATCH:Lcom/streambundlehtml/Connection$Method;

    new-instance v0, Lcom/streambundlehtml/Connection$Method;

    const-string v1, "HEAD"

    const/4 v3, 0x5

    invoke-direct {v0, v1, v3, v2}, Lcom/streambundlehtml/Connection$Method;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->HEAD:Lcom/streambundlehtml/Connection$Method;

    new-instance v0, Lcom/streambundlehtml/Connection$Method;

    const-string v1, "OPTIONS"

    const/4 v3, 0x6

    invoke-direct {v0, v1, v3, v2}, Lcom/streambundlehtml/Connection$Method;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->OPTIONS:Lcom/streambundlehtml/Connection$Method;

    new-instance v0, Lcom/streambundlehtml/Connection$Method;

    const-string v1, "TRACE"

    const/4 v3, 0x7

    invoke-direct {v0, v1, v3, v2}, Lcom/streambundlehtml/Connection$Method;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->TRACE:Lcom/streambundlehtml/Connection$Method;

    .line 45
    invoke-static {}, Lcom/streambundlehtml/Connection$Method;->$values()[Lcom/streambundlehtml/Connection$Method;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/Connection$Method;->$VALUES:[Lcom/streambundlehtml/Connection$Method;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .registers 4
    .param p3, "hasBody"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .line 50
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 51
    iput-boolean p3, p0, Lcom/streambundlehtml/Connection$Method;->hasBody:Z

    .line 52
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/streambundlehtml/Connection$Method;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 45
    const-class v0, Lcom/streambundlehtml/Connection$Method;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/Connection$Method;

    return-object v0
.end method

.method public static values()[Lcom/streambundlehtml/Connection$Method;
    .registers 1

    .line 45
    sget-object v0, Lcom/streambundlehtml/Connection$Method;->$VALUES:[Lcom/streambundlehtml/Connection$Method;

    invoke-virtual {v0}, [Lcom/streambundlehtml/Connection$Method;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/streambundlehtml/Connection$Method;

    return-object v0
.end method


# virtual methods
.method public final hasBody()Z
    .registers 2

    .line 59
    iget-boolean v0, p0, Lcom/streambundlehtml/Connection$Method;->hasBody:Z

    return v0
.end method
